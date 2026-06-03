Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C88CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/Ry7Y+SgX8+uyjFiPrjz62v23JIOFXHYpzUoqPxgZQ=; b=qUVoRaH/vuyyws5hZ4xUJAxcI0
	VW0KFHdY9j0Iap95hvsFSJN6pEtp7a0glFvXKuEUd80HUCTNFLaWowJI7EFmuMWgOFc3Lvcrza94n
	HYsMzZwu+5OU3reYZDAd7DNdKlilH3/Zivw6I66L0dTTkB4reaE/JqgUibi8wpODFc+X+BQJstJEI
	mUknGzXKivRbUjZSW9j6VXnnS395u4nIyXXKS9E65ugVfN84itHmPOs/Y74QkxzAtbQrj55r0WQh1
	GH8my72UvJJkww39U1fOkT84wo5LOi5efh+ll8XNQhZcu2SPEThLLjEi4geRWYw2Zx3W9WqfCNKVG
	cxn00ZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP4-0000000F8ee-35j8;
	Wed, 03 Jun 2026 13:13:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP1-0000000F8aM-3BAh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2822913f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492378; x=1781097178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Ry7Y+SgX8+uyjFiPrjz62v23JIOFXHYpzUoqPxgZQ=;
        b=a0o7Gi65lt1EjJf4phSGR39AEL0HbsjQik7u/1sXmFtLbSw0D0oT8cTdIKqRD2KQeC
         z1z9IH/ESFi99vb7kup3ozHXn97LXzqwwItEozUWb7ueb+dirBhc1XpHddHKq5iitD/E
         h7+kuZ7fl+tQOvCZ+yfAxP4WZppi+HErQh+T9qlLqALbv94tUeD7+Ls8MXdu2yA0uZbr
         W7ACE3lX+XeZLGtXrfnBs5ewZYI4VWHWf+0EGJ6frEvk8DeWwk04fo3fNWrEjnzi7BuJ
         t2Fk6mOkot42n3AuYPdwrLQa9VeTB7lIiRTnUUn4eWnIjxqGB2/PZbAUMzQrABvuQdDO
         tUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492378; x=1781097178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/Ry7Y+SgX8+uyjFiPrjz62v23JIOFXHYpzUoqPxgZQ=;
        b=IvRvflDh1+jLm+7VeiGMn+yfvWUxUsarDRwrxOI2oKuyKBa/8cpZaRcj+kvEbqDTn4
         leXPTiiUBQzn5yY6YzWmGKPx+voxJOvS1k35rdKHNeHVg2zjivqXjPYMtVJlQKBzMFuJ
         A6cQ3DI4IwVEh1AH06JAu+CwG0OWNkNZu5HwGGJGwuTMknNB4AUZUgmsie/0eUTdmKsm
         krId9sBASw0o6g09xaONrEH2CpBT/wuotcj4Iyi7bJ33jy2v4K1hmIDmXr8BdLkU0oeo
         iGHtgm5VCidvwblpXO2SFbUfFxtWznrEQBwUojw4PAWZlPW0KBuGBSIwiybDNiRWv07W
         D8Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+n1I6OIXJbHsUUy+FzPQyUgkTik2q7oADJXb+zRfe3fDSQt3NlWEUSlW0Q+x+fVx2HsVE75e5DPqx09G18tyP+@lists.infradead.org
X-Gm-Message-State: AOJu0YwN1iTciVq4OFSXM0uwr1qIS+PzKxwFMyd8ofjZWHxHRIT5qUD+
	Z38Hm+uZ8SE6NmUWQXiHpyIuLpSDYaQDhzk6Jm4MOVvywaqzUydbQl0g
X-Gm-Gg: Acq92OFvOjAoGEEVwSjR2S0M234j9+lGelwsiaXzn1xB1lxC33RkT4daaQJ+QyyFwWT
	Z1CRoalYwnKRLzpTupEa65nfcvQOW4uY+TCB/kEzmjdS91KUc467fCR+ubPbTg8ilJuW1VLMF3m
	rX3ePM9PkU9C6tnmefXoNoKjC3IF8MJrCkAWEV0nVYh2c5+9KhfRZz1e0pUG0gkQzyXln4Xlq66
	H782011cQ33DhKpeqM7UyP0x+y6a8KYzMYKEES61fVCYmHrSb2GCrInnVTYb4Wskhs2gg6FogeO
	kDhBYvBssq2pp9f3N6dFJ25L5YxGQrXDLVGJFpsmBU4xh6cYjl0pPnnQ0xMoIW2b6h2tZzkMTZ/
	uCXEZ+l/EYL4Vcclafa4U4moWc6nB9V9s4ChkKIsQrFdS5kOcuP6gYlmPnk0Np+hXkLI3Vp9GRL
	WzImjAKk82Qt1i1WcHdm92gyGskSsm3v5c8Z+aV665CXgvAd3mHOQLUvT/ToHstCvjIhsHVFFqv
	LTXs+TMdyaP3Ipzi/W2DCrBk4Cd1Fj6H0/jotg6pII/kaRM
X-Received: by 2002:adf:f8c6:0:b0:45e:ed7e:f8fd with SMTP id ffacd0b85a97d-46021783b1dmr3363286f8f.2.1780492377877;
        Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 04/12] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 15:12:42 +0200
Message-ID: <7758fd3b241c8e09e8b0f4b3224220325f8a069a.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061259_844111_08A2AC48 
X-CRM114-Status: GOOD (  10.37  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6c19a63ce405..b15ca44b9a92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


