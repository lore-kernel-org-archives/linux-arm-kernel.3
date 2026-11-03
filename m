Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D020F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E8kPsRaS;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=1cUgVVtf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xsK4w3jLbP3XPnppugEgOy/hVuJlXHxWXgSfS8UpOYQ=; b=E8kPsRaS9VWwOFV/4Qpgbqa0mF
	LZu2hgJvh549LPIXJbb6n93gheJgjHBt+Yk5F333TKQf40vKxwW8H//dklKSGsCxb6yDs4Lo72VrB
	Il4q3fmZ4At/VD7E8MEI0Mk66XChTGog1gPmmiP4m5gV/anLtdULa+PNpXM3DyG93bYI3ctPh/UPM
	b6HAu92Z0/hJ4Q/WYvWN+PlSodnUoBy4mtPLaoWpZf79VXplF5628jyNncnTU9MN8GiuI3ptZmPpj
	lo/2OzolNKvZM05VxRwHxwvgfh1hFkx/zg8jXQOOKOKeeoUjSLe/KnDd6u2fau6qRONuu6b+d0yEB
	1fnqR8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xON83-00000003rkn-3LGJ;
	Tue, 03 Nov 2026 22:37:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xON81-00000003rkJ-0uhj;
	Tue, 03 Nov 2026 22:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xsK4w3jLbP3XPnppugEgOy/hVuJlXHxWXgSfS8UpOYQ=; b=1cUgVVtfjLR8OTj9loqDdJcnxM
	4NUPW4VgzqHCdc5C+ue3DYNVoZBzBLZWHJuAHQHcQtvNh5vcTI9Z2pCCMdpjIx66hpAiQWW+iRDzL
	F1eD+vZJZSsRqCURVFCc5rPOgrRzhNlrvyxjJB0tsMUeUGiehjeiHHk+DJ8oXrVp/ol+VF44yvkEB
	x1xDE2rQn/Sb6eOQdMpgVKWuDhTqz1I6qrSz9RqpJDgXl3XDc6eIfqndVxF88WgTQRolhu6e7HvVH
	2OKj3NgFNzHpVG1L+1DUVVpELXsirdhAdiZdsjStcx1DHsbBO2FVWcU+FvQagEV3Fl4JAR76iDGWn
	uFEGY8mA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 jeff.hugo@oss.qualcomm.com, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v15 10/15] pmdomain: rockchip: cycle an optional power-domain
 reset on power-on
Date: Tue, 03 Nov 2026 23:36:51 +0100
Message-ID: <2685454.vzjCzTo3RI@diego>
In-Reply-To: <20261101082307.151957-11-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-11-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_143717_273356_9F374DB3 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sonntag, 1. November 2026, 09:23:02 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Jiaxing Hu:
> Some Rockchip domains come out of power-on with their bus interface in an
> undefined state. On the RK3576 NPU this shows up as a hang on the first
> register access after the domain is switched on, and pulsing the domain's
> reset at this point clears it.
>=20
> Take the domain node's reset if it has one, and pulse it between
> releasing idle and restoring QoS. The reset is optional, so domains that
> do not list one are unaffected.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



