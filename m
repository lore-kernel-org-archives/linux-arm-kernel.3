Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE99BC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHxb3G7EW8RzN+dJgsKeTL9lqcEi84ddNrYeIybSCPk=; b=km+DIDdUYDXhw5Ksv0bxPOWh7t
	XQVpNl+BJCKwwL4ElRtPV6YAnH9luOjQua+h4uMqTlnzbKr03mTFfcg/7ifwThRG67eruAc2Zjb4z
	N1POgsZsbg+NWvGQMvM6Y2uKb0c0fiifSdkWQHYiIq2HbIkQJ9nOWkFuzxDFiGjmHTr7gqebSwt8j
	1s+gmXO9I0PeBZP2dzbKmKBDP4tKB6RIZEaAuCOOZkEvq4Bmj5pwC7Gcs7IRgHwY7QeLXbvNfqFLf
	0hk9yONCh5AI07sd+kqWhS+ehYTV8xA9dGrDcJtz5cmwvBKRq3xpU/nKyfIcL1I8bMBzOvws0ZzyU
	ifcPw8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDUt-0000000Ct0I-1rSS;
	Thu, 19 Jun 2025 11:31:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB9j-0000000CXbO-0X3x;
	Thu, 19 Jun 2025 09:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YHxb3G7EW8RzN+dJgsKeTL9lqcEi84ddNrYeIybSCPk=; b=Lz+dxvYl7ugAV5gMsPRzO/Zn6T
	Mxdaho/YZVeiUWxOl3h4OrtvnZ6048BbBDlX5dPKQ1XqhZujSpQjlCFGyTGDJm7if6VNINPaxvQ7o
	/8kFNcpB0Rj4uYwQn53p69/iF6U2l0VZMcGB4ZK08SUUkSee1C2Bd+uoY3lEBnaDa99ka8xdolaYd
	SkyMcwGzxVNOJqlu0QcVtDNjVOvnvaWwLcfmxjA1+76juFgGKqfFU9c6d/YlIZdO9oBjq1meeEYDr
	PAGkuq1Dd0gbw/v6G9F9GSdHqYL3yb71Yy3TIRlUw3GNSjlg/GLMdhqeQKNJ7KWRkbwdsBY/RvAPs
	pKCLP7BA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSB9C-0007Ey-OE; Thu, 19 Jun 2025 11:01:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Thu, 19 Jun 2025 11:01:25 +0200
Message-ID: <2217684.TLkxdtWsSY@phil>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_020159_162474_1F8E54DD 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am Freitag, 6. Juni 2025, 08:28:20 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Tomeu Vizoso:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
>=20
> In its current form, it supports the specific NPU in the RK3588 SoC.
>=20
> The userspace driver is part of Mesa and an initial draft can be found at:
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
> Changes in v7:
> - Actually enable process isolation by allocating its own IOMMU domain
>   to each DRM client.
> - Link to v6: https://lore.kernel.org/r/20250604-6-10-rocket-v6-0-237ac75=
ddb5e@tomeuvizoso.net

I was able to successfully run the SSDLite MobileDet model, detecting
elements correctly on that "Sounds of New York" youtube video all the
demos seem to be using ;-) - on a rk3588-tiger board.

NPU needed like 30ms per frame or so and also detected the expected
things, so

Tested-by: Heiko Stuebner <heiko@sntech.de>



