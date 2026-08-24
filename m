Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE83C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=; b=wEOLFsyNf9umy7DOirLiJvUHyL
	dPgmYj0x3D7hKK70uV9C33Ka8v6b3SDEnyl6yukcuXNzSlxJFw2oh4/lqtzEOccflRPBW9ZO1T6uh
	6bkOsMCerEdbl4GKP6i0XvTU+R2O9ibhphWJZMgIdEHTTjXyeRJV+WZj948/bekRx7fIEuiPTLLm/
	TlPUBBn7UBc2hIxANMuKi3TQD5v0P8wpjm5dse8TXu0BhQFx0Owrma7iB+oJnOGm3boNLSrmHvHLv
	UM7KOyx2aezXqwUFxhRmYHHRSyBDGTdw7z+Ih/OPIrv8WUUuSqvGhKNVASGZ1hmAKq/xEwKlMqG2s
	DAi/U1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOyU-0000000G3oT-0KuH;
	Mon, 24 Aug 2026 07:20:06 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOyQ-0000000G3o0-3xhQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:20:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c247f6687dcso344199166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787556001; x=1788160801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=W/dV/SfB7hU3A9fJeEtkGK1BdUq8rtV785w9ARhW3cX8rZBWjjJxplFda5mODe6kb6
         ov3s3XSYLol9HETCKVfblZ1kA21VTElbvQf/IuAPsOsIZTrknqA9JTSSqPJ3Phc1FTpS
         vR6LMHyYe7BqPyNp0d9rdI/3rzJHfNjbxtevQRLiwc4aBSTBGIYYJQCqNpTjKsnnT0iL
         yRYs+W5DpjIOAErqvpFt9iolYNmWOqO2Qg8U97e2iDzUAhyWe0v2SzpeH12ZfXF3PW0j
         MFNMsyAd+OJ8Ife5csYBi5nZkns4NhiwIi9hIN7Spb06M0bwmrPVbv2VsDaOScsEx1Ne
         cIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556001; x=1788160801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=XND988piqxU7EMu5WcnciKcD0qyseGNNPYRtNdWcq7MsYXYMx2sg9eOMAmr5mBzjbh
         Hx4faTo79vjeF1X2bJQCIAzg6MQjNWy+l3UOmXRYfBkhKCmD9gtT9f7ajiuuso6BeAqv
         9REncZf6WXYtTdz5XLXlyL8g3WLQzUAcwlW53uEaRDRhezXZoceW33n2VXtP48Wupe69
         zN6w4PRJDGZ9J5AjCdls7VkWmJHXE6N34ViG9vooc0j95JpaclOUxjt5r1aIPbE1PpbV
         IJS0a0zGmqIMoBCK06mtC/jS6S+uFRmTo1dPeH88J7NO3Sdhx6eWeg4Pccbgm8/mo3on
         1jeA==
X-Forwarded-Encrypted: i=1; AHgh+RoWH+a3ypgHvb+E3nqTx9cqc82rDWEc3+KPNLIji3MwBnjplzBFM9QPkv7YkFGKVwt65gYe74E2g98iUO4IRfx3@lists.infradead.org
X-Gm-Message-State: AFuF++k5jZykIgSgYFGYjtVd3JxD8AqpTnQbTo3988RiBBRXpdsmvDiJ
	aN7HNCIV+ZMiJFZKVxPA2sCotA0a5BggpcHl6bXjlR7/iTj/kt6oM3EB
X-Gm-Gg: AR+sD10BoFElsxKNtBDLG9PKmPGsBO8u30wRRaI2ORffnbTDESGJp5Cu3/5NUALLEBh
	ZArn7TGOGezwyZ9fHK2Jdxggf2AEx5QaVAuvzurGj/o1Q+T2yJXKY/GkU6avu16kuZLw79AL57F
	2J1sZ3yAFoCTmazoQkKuPCOwYTV0Ijdo0WWZg3OqImT49sZtopDtdg1wDk9Hx2M+BQ++OZO9sMt
	t1PxgUMeTFGPikBJBzQLHHoQIH1bcuMEMJQpV0KbtNddMa98qL6yqlFvgrcqhPDawniCJTygZue
	8FaPSAQq1iMl8tFvMhGvGDoqE+L/aHjLECsNMwVL3IwecPgSwVbjls2TO8JKjTsHM8dR8G4YHYk
	s47/Ve3PS8BlC0e1JkaQSuYc3WHHt6jWuqdDvdT1KVK7hE6v75YwbH5RDnV658yds2UOVhC9BS2
	GxT9pxatqUw3VJ4U+T0eUD0mVMwSF8Mc8PbBxu5jnsR2CClXzrqAk2xWTypne/pclbVCeLcGD/2
	h3AUtUC80GCqKxSWO7fdZa3dHkz4Lr33si+14XjWPSjYZVEIc7IZuF9JhzLpPBzerwWhEr9919X
	L3mURsBrt5d+yvNiWJJuT5Ottf3a56RBSYY=
X-Received: by 2002:a17:907:7b93:b0:c20:5213:56f1 with SMTP id a640c23a62f3a-c246a60348emr2628478966b.13.1787556000424;
        Mon, 24 Aug 2026 00:20:00 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1137673466b.49.2026.08.24.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:19:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:19:58 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related
 nodes
Message-ID: <qyrzrmrvymwhoziwf3we4fxwb4nfyhb3s7hiuqauzoco52auns@7rihmyhkti2v>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
 <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
 <aohtVk57YIWkj05I@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aohtVk57YIWkj05I@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_002003_006159_3FED6E8C 
X-CRM114-Status: GOOD (  15.79  )
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

On Fri, Aug 21, 2026 at 10:23:02AM -0500, Frank Li wrote:
> On Fri, Aug 21, 2026 at 04:58:57PM +0200, Franz Schnyder wrote:
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> >
> > Add the required nodes to support the iMX8QM/QP USB HSIC host controller.
> >
> > Keep the HSIC host node in the QM/QP specific dtsi to not conflict with
> > the address used by usbotg2 on the iMX8DXL variant.
> >
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > ---
> 
> I already post similar patch at
> 
> https://lore.kernel.org/imx/20260720212401.C2BD31F000E9@smtp.kernel.org/
> 
> Frank

Hi Frank,

I somehow missed that imx/dt64-intend branch.
Do you want a V2 with only the changes for Apalis?
Or will you just drop this imx8qm-ss-conn patch from the series?

Franz

