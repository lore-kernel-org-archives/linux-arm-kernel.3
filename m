Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6071FC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjlF0hDL+GcP1LxYuRMqQFAx3cvqnaJ2UPhI2yOXLvw=; b=btkDjfG8aH/UMQhjEz3SJLk80e
	upXfv1qh73R+TA3DxFN6oXZrcWK3NMz/pVnJHXk9DdFPbss0jWmWujaX8g+dJKo5RY8l8nX1jylzz
	/dVaUPgqSafiD/hteVvLFTQ7t7V2zoCoSwp8kJLsZPLii8f32hIj+O5hCjIz+rwLFN1KlnNc56Im5
	m09o9OnO9gDd7NTZNIrXxjocwuLm6NEkYE8/h6yx7cusmqOHnXSV9ZxCX+YvrBrcP77l4G+5LBIM6
	tjujYRptAbrbh4htEf8puaLb+ZTzKQo6IR0cueWxJU8WnSTVhpZNqjj2oofF/pwTFpjZCkd03l4W3
	rS7JliAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdJ-00000003HQi-2IHZ;
	Thu, 31 Jul 2025 09:31:29 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPXD-00000003Gea-1NbA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753953911; x=1785489911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fjlF0hDL+GcP1LxYuRMqQFAx3cvqnaJ2UPhI2yOXLvw=;
  b=qsOIAFQeHn1wlTPwP2CmkmxmBAnKn8XySTjPNgpHlSXLshUkL4U7YcOM
   UmhKYgBnWwD6ZH1pdXg2MXIQ9EbBaHjFLKIiFJ/bLCEUsAgMXjbDJ39Hw
   jisM7WnonW/fTaGrdO2JD36irYUOJCOHYIj5WjVB/D5P8kHusLskDf8Ec
   uLaybizYAheYDbuMfVxu15X6V+u14HlIHc2BXUGqi3l/ICA1W77Hh3/W+
   SqGf82bsQBbrAOobTorh7MyUkteJ/cwz8lqu9rIlB4tpdGN3dQaDD9vlN
   0cV2ctYpX3wsnaI+aGKzeEi3fyjyAX23EksFf6a8ikcCMrPWBysLXXogf
   g==;
X-CSE-ConnectionGUID: fsU95/NzSae495Z9CxCmKg==
X-CSE-MsgGUID: Ur4qndlhTGO+5Yq4s7Aopw==
X-IronPort-AV: E=Sophos;i="6.16,353,1744063200"; 
   d="scan'208";a="45516796"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jul 2025 11:25:08 +0200
X-CheckPoint: {688B3674-49-8CC3CD70-C1DBF452}
X-MAIL-CPID: 7D8464778F9C483E0B2683681F104E7C_1
X-Control-Analysis: str=0001.0A002112.688B3671.0041,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 228D41656F9;
	Thu, 31 Jul 2025 11:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753953904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjlF0hDL+GcP1LxYuRMqQFAx3cvqnaJ2UPhI2yOXLvw=;
	b=NmDuqKb9KyIlFuhOuYHwBb8uOFn+iNVVUVCo7jopYuAhiI9f95nR0rhTJI8xb3sf8wP3pn
	SRlQVJkZZEaltXrBj22aBjZbs+W0nUh38iccCX94+7T86y2MXLIlf1YmOArYN1dQZebbzM
	DNesKAeygVb+o8IAQZGq8zOS9bKBWBBo4/Rq6cS1d0aHs+Xuzn+on6kK+wR5btdZMQaqeZ
	qoBnq2cAyY15XQRJmQw8lGfRFg2cnAA0ZAjZJ5rkql1NdGLKOqrH/flgb5HRXqKpjVDX4l
	ourkr3Y89MGFC1C4OX293DGbmiwt6gr8w4JipeLsVc5+97SDeokhD9+LsTJc/A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Thu, 31 Jul 2025 11:25:03 +0200
Message-ID: <4669830.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250506130940.2621554-1-alexander.stein@ew.tq-group.com>
References: <20250506130940.2621554-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_022511_711744_05DC4910 
X-CRM114-Status: GOOD (  10.68  )
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

Hi,

Am Dienstag, 6. Mai 2025, 15:09:39 CEST schrieb Alexander Stein:
> This driver is used on imx93-tqma9352-mba91xxca.dts.

Gentle ping. Thanks
Alexander

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8691f0ee44e66..550b2505b5658 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -437,6 +437,7 @@ CONFIG_IWLMVM=3Dm
>  CONFIG_MWIFIEX=3Dm
>  CONFIG_MWIFIEX_SDIO=3Dm
>  CONFIG_MWIFIEX_PCIE=3Dm
> +CONFIG_MWIFIEX_USB=3Dm
>  CONFIG_MT7921E=3Dm
>  CONFIG_RSI_91X=3Dm
>  CONFIG_WL18XX=3Dm
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



