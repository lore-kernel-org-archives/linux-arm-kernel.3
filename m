Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e8mlnSAa;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=VjdJDFys
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mUVAYeIeS0pGb++9O7IAV5dyWYaWTCaE2wpCDRchVW4=; b=e8mlnSAaYVRkBA4dPafm5hBXq0
	ygIVKL0JQHfdwPDwi5L2+BsMzTjQ0NljZ7BQ4DKO72KeZpPWXk3mDTON39dhHmplr2bYwCrkCx57E
	9GqX/LTuCvnHJ03BzxM4cYA9PFnIPC9p+OSuRH4MC+6O5zvTKMqfHghRc7kM7QQNPoLzDwe9DZgES
	IM2bI/LPUJbvd5QwMzryUoS6CSnxV2Mc2cJC4NlKIt3JqJ5xLYl6W6KErhfvR9WwjzTRggzKDWQR1
	m9wKKs+3awDbGckQRjVg8zERllku+k2V+TW10C/4knHimdPA+rgyL+UjjIlmD77tWYUxKIB2Swqq1
	25lBLKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xON5V-00000003rJr-1ntF;
	Tue, 03 Nov 2026 22:34:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xON5S-00000003rJ6-2h77;
	Tue, 03 Nov 2026 22:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mUVAYeIeS0pGb++9O7IAV5dyWYaWTCaE2wpCDRchVW4=; b=VjdJDFyskLCLPZlvGcegvYUdtF
	+OTeh3I0nCog7bs/WfDEV64J1B5qA7R1NWQ8hZWr256a6gHP3zQxK4CvdVfM2HopgnLlIF0hutX6P
	1IE5pccn3hwjD2EhdDExhb/EtmNTXPuOYI2LERzqMeo+zXX+V6mbgRO7J1ehgqzQr60hncPg0oY6H
	eyZ8S/WMRM80RLeUWRR+RN58B3frtNwnUjiSKKyFffCP1Vt0UjEYUx5LTGQUYYg2sUEU+QRaEV6Cw
	5+bqAhJzyAC6wOn0AfHdBdjjQvxQsg9QGWRYWEnC7k6zo7mJ2JrH14y5Ua/RbrxzTiFqjAagRdV1l
	/2XSHJzQ==;
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
Subject: Re: [PATCH v15 09/15] pmdomain: rockchip: add optional per-domain power-on
 settle delay
Date: Tue, 03 Nov 2026 23:34:12 +0100
Message-ID: <1846076.jNaZZp9DzI@diego>
In-Reply-To: <20261101082307.151957-10-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-10-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_143438_681159_9B45A505 
X-CRM114-Status: GOOD (  10.99  )
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

Am Sonntag, 1. November 2026, 09:23:01 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Jiaxing Hu:
> The RK3576 NPU domains need a short settle time after the idle request is
> released before the registers behind the domain answer. Without it the QoS
> writes that rockchip_pmu_restore_qos() issues land while the domain is
> still coming up, and the NPU throws an async SError on the first cold
> power-on.
>=20
> Give rockchip_domain_info an optional delay_us and wait for it between
> releasing idle and restoring QoS. Rename DOMAIN_M_O_R_G to
> DOMAIN_M_O_R_G_W for the settle delay it now carries; RK3576 is its only
> user, so the old spelling is not kept around.
>=20
> The macro also takes the regulator argument DOMAIN_M_O_R and DOMAIN_M_R
> already have, and RK3576_PD_NPU passes true, so
> rockchip_pm_add_one_domain() powers that domain off at probe and the delay
> runs on the first power-on even when a bootloader left the NPU up.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>



