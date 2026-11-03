Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nDiaUpxH;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nY8SYePo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YhUmBPOp0GBHjBhGSwhDdx5NqcNjkjGI8oHDjK3Q308=; b=nDiaUpxHAiMTgdHWSqK6UlPIQY
	wXVYHfE7FyZu5yjZArBJoWVuoMFhOo/715EMMYQ48pgiuCWwFv8712SzOKGIVNZYQ7EQso2cGBPry
	neLINGuOsV6oQCqzJ4CBinE+SkZ5z8dN+3vAYMHJYF5E/2g0OttPDfDOHO1tQLaFX3JNcWDxLutmE
	Lyr5c/qEqqO3pZJxTNe6KNPvK4G1lKxp3aKyK3iFnFO3KPwR+NcRCvEL6EIn1+7RKpcy/+NbfC/fg
	basZ/fxzV3mHR6qBEOATO2nS2q4RQLTzG8DEwxsgAoiDYTwfse2PSiOiIefhPYrcuGWaqmoy9Vcy4
	1FwYfyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONAY-00000003sHW-1yVz;
	Tue, 03 Nov 2026 22:39:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONAV-00000003sGW-3c3i;
	Tue, 03 Nov 2026 22:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YhUmBPOp0GBHjBhGSwhDdx5NqcNjkjGI8oHDjK3Q308=; b=nY8SYePoicizj/jHg7XYL8Mn5y
	89+t36FA99T+XZOPMhkxJpXuTEB13wWAosEXYtbnUL1/npVFl0rpVGGlFwjGviA5DiNQzJuiWzkw9
	RI9l46qtoETA0kRiAxUwXB4+cIXI3IIilrXPxZHZPCzQAORctl2bALKKGmliaPiTno21jfbnsc7S4
	S5s6jJZJkpPGexawT1UhIA3nSgmA+Zb5L1fFSLVKvtwqL/NOTWUfbp8Gm+iOwaB7ucAA/ZFNeYdau
	uDoiKVN7h/ZC55pcItQi6KMhsScyBKDZWect39tOd+U7xhKIwvuGz143SD+HbHsiGw4RhnXGcA35m
	z/qVMn6A==;
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
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
Date: Tue, 03 Nov 2026 23:39:28 +0100
Message-ID: <6777074.j6PcuT4dK6@diego>
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_143951_903670_26088B69 
X-CRM114-Status: UNSURE (   6.45  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ulf,

Am Sonntag, 1. November 2026, 09:22:52 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Jiaxing Hu:
> Ulf offered to take 7, 9 and 10.

I've now looked at the patches in question and they do look good to go.
So it would be nice, if you could pick those up, when you have a minute :-)

Thanks a lot
Heiko



