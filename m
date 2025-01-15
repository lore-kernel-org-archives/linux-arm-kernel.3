Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57356C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 01:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVssDOqm+J+pahSUoCWyMm9PmHHWDBPd01GSGUshCEI=; b=pO4FwzS+Yzv11VxZuDVon21pnn
	Mbx8xJ/lzG6UsoBX76O46hMJRJDdCGFwvJEGMsvUgBnu2i3pB/UGV+TesBMtmqMFxrEKD1ooXx2tC
	Y3NCt1ZN61FfKrBuy6T0C/Awb/CNXJqqfwbsydrJMx5PzSl/9Z8vhFBehO4gE1Xcc0PULZavYS9tY
	S3qUwfJszOnBvgmcEcju13C1XWTSOpC9FkR4WKNnaxT5KP95cS5OwfoLPqHFsYxoACmN3DLJrkYt/
	mrv4IfRGYVJWYdrgUNwnN4++Z0z58aMBU1WxXLpWh3EqMyOm+FAes+M6hHD9fpjte/cOhG9M48SKL
	+q/2KV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsIR-0000000AJMF-0Ur0;
	Wed, 15 Jan 2025 01:34:15 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsBI-0000000AHsp-1mSm;
	Wed, 15 Jan 2025 01:26:53 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4678cce3d60so59702691cf.2;
        Tue, 14 Jan 2025 17:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904411; x=1737509211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVssDOqm+J+pahSUoCWyMm9PmHHWDBPd01GSGUshCEI=;
        b=MypT0kdM+noi2RG2BlNCCKWIJDMxIxNbh3aKNUAGXNkeqVvvjp2AwZlS46D7S1Mxws
         f/ARJrV0U5/7ywGz5/MmTovF6+WetM3+p5yqfLn4VHQuzpDsgtmYKm+7zlbv1m5ROL2J
         8fiBzeRQvlclmxXhAT9P7tAePIm71frSG8LvCn4NEPKWYHiBJPGOltXuJ9nU2L2IsGv1
         UhZg4DaMJ5vOjxiONLEsrbo2yzl6w8N9yZDnsMpL4iZLbALhXBC+ToZRpwqVeqwVK2nT
         uqTJkszxwAaWK/OKjkQ1u+UPEC4nhIf5fNfJaQzutjoFyj5rJdpB4h/kFf3gbvvJ3BP9
         Vftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904411; x=1737509211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVssDOqm+J+pahSUoCWyMm9PmHHWDBPd01GSGUshCEI=;
        b=IEyJgwAH5ktWXXSWtPAWZ7f1K+PeggkWIybvQOLLPgFfzqUGDJqddw9gEAaCXqGS6Y
         rugJcyifVrGQyfVn0GAxBda/ymH6fjUUqacZGyum8WnghaDU/P7owciu7VjxBASmdjVA
         myVSIGlQYGXJxiYTl3Nj1tNAO2aw1ZJT2S+zL04K2rfxMHjEUYy2Y3Ww4LJb/UUKISQS
         QG8DSs8yEXKJKUXFFPvRH4qHnqeuwvI4IIPXGC9qnAJYhq4QEpR76wm7y6Y2VMYIK7JH
         ROE7Wk249v/IMLhQr/uTVx2+fiPdX9bQ0hWZl626lqPz/KkO6d4GTuG3e4dqiRVIr3Bi
         BGfg==
X-Forwarded-Encrypted: i=1; AJvYcCUdAoRAnlj4t9Rzr5eDEk6UjObUfqauzp2SZs2ddgrwQ5i3XVlKdgRBmvk4mbrCwdDwH8oN9JrGrGHnXkH/7UM=@lists.infradead.org, AJvYcCVajKsj6ffe7DjDrS63FPFmMkl0CGt3GZ1nnJPlEWyL5NACpaL6gTeHryCpbxsuTdMF2MoD+OcZl10V/k206vpg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6zFeXxnegiR3neL4c3yqj4KGfoljjZxDRgkWLuPZNGPeMQ5Zz
	QIAthpydPxgVDuKtgKqj0eYq3N+bTA4qmASLpl5PrcTBbwZZ8Ovk
X-Gm-Gg: ASbGnctwI2mJqJbgv0gL5v4vjUv5xV1iOcKs4+XfO2e+KiziBr1C3/u26BP8P/Wx0S+
	eTKAqtWLrRybZldzAkMd1bBaCDnSZcyNhSRy+EBn6JLQvhDDLYAa7DtuPJ5Mm1hM3DVS8TnHqHZ
	icBVxZ6ZDZKmXOK1mTn3qFm2HQ7DcY4NcGbdZ2MV8wEgSZJDStyGHHD5gIYmvDxCGBS9S9deeIs
	SYypOkLEwLAWEzK8cAABPs+ggMAFW9bPwGHyvPcGBbAFExh+sYgrc1gmuVKf9hmaBVr
X-Google-Smtp-Source: AGHT+IFrgnJpvh7aaVGnucMvaHv2rELTJ/5OFWUkqkYUWq+MAPY2UvyFQanWVih4LLhOlXh3fh8rug==
X-Received: by 2002:a05:622a:1a94:b0:467:4380:76f6 with SMTP id d75a77b69052e-46c70fd31efmr447700921cf.11.1736904411316;
        Tue, 14 Jan 2025 17:26:51 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:50 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 5/6] arm64: dts: rockchip: enable the usb3 phy on rk3328-roc boards
Date: Wed, 15 Jan 2025 01:26:26 +0000
Message-Id: <20250115012628.1035928-6-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_172652_466202_1CBF9C8D 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Enable the new usb3 phy nodes on the rk3328-roc boards.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
index b5bd5e7d5748..22d93c1901ed 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
@@ -360,6 +360,18 @@ &usbdrd3 {
 	status = "okay";
 };
 
+&usb3phy {
+	status = "okay";
+};
+
+&usb3phy_utmi {
+	status = "okay";
+};
+
+&usb3phy_pipe {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
-- 
2.39.5


