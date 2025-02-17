Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82FBC021AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvO6VVVrxL25G9tkhpz936tDjybjrpvtb36RnaeyFF0=; b=bYwI7snHwlSh1jOiAFQk3Gll0J
	mJdy27LfDLYJfdAGinyQ/7HfhtmWyoc+YTtwE2A6VReeichcuJKA0O301JNkLVU2YWj9WGxkJucVb
	IfHUIVFICHQsX2b2AMGz4VlBdpQwRI2gM1s1Uw2tB4uNcnfp1NAcsNB0hLPaiRGBeW0YxSQfoZum/
	KQ9k6VX38s4J7zjmseWuJucbdgiA3aolLO/vg7RfQmj7tEG2/iFpGFXWK0lGsiz4LnuCDMyxtlu/L
	1CFl2Q1fG5P+XanKFLZQUmEdjjS/nhIjA9JMQZYntlJ65FMCYTZB0Avoh2z2boAkWcQRaq/D/nZa6
	4y5rC1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0G4-00000004SOJ-1vOR;
	Mon, 17 Feb 2025 12:29:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzXF-00000004M2w-1tWF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:43:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4397dff185fso10187615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 03:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1739792616; x=1740397416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvO6VVVrxL25G9tkhpz936tDjybjrpvtb36RnaeyFF0=;
        b=YNSCMXaFXsI9gjAu+stHBW5Gg1yf4SDemxX/Az5ZCXduqVPv7SDCe3belyT5gOsKSq
         Zm9xsO/qxqfVZHw47IWiIcNPDV6M2YJxvanmg08qjxQR+yA42+4bmnjF1I2shr3T55bv
         3MbXcm/v+zK3cEBkb1Yc1ZCAZguaLfhpmBvK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739792616; x=1740397416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvO6VVVrxL25G9tkhpz936tDjybjrpvtb36RnaeyFF0=;
        b=Q/jh5Gg+ATw8CRqkO4U0Xy0/uWZkqiplGgM2KBb1r1TM5dORZH9B7vdaTpkvVcArSM
         KDvebVCHM+a7vP8OjoCSlehPT3hGiemrmwhKlroFlFR0nomm8Yrx8GDfbJIFQBknJU7x
         yEn6H/cygOENzgPDfO/FuNWQ2lbwtxH4TSKo+Qs0iU+2yWhIIscxfkGIUi2Y5CKa+4xb
         ZbXmxWjvKDizXAG+kZI+so5/J3+4JL5RadKG9gbVohroBkYJSQJjsH3+aFCevE7Fn+Ab
         21fr5DahEIBn5155Uu1qTWMu9IfzD0qFEEoG49y09HgiYdb1ZzBCOQaF9qE8BJ5AtvrY
         pd7A==
X-Forwarded-Encrypted: i=1; AJvYcCXsjEJBKVKrqr8prUMxwCAsJk34RQWq20ooB6Iub2LJKwIyzwK69+Srg1nJ1gaG8OLa9J/YbxRy9IazqojPjWF4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywce2ggQZPPYewUMnexjy05NlMQPXAmV9tBMY+ET2aruG7CtSNs
	VE+ITtUImiDecKFhKpFkpoJldaBC+ox2W3Rry71lqO2nTImDAy/8SCgBGAlx9GI=
X-Gm-Gg: ASbGncvKmI33FmnK3k1pWAJv7SzvwkzyVGRhJSQUr8vzoWLhvd+d35zYmaBr/SSrLQ/
	O7O7mmMqLMnhsm8lGA5Y1Uai7EThzqnlxDiGBF+hvGAtETIdHODgey7t9g2wS+B7ohG3qtMGuoj
	eBcf4NlkM4p+/Ff52BSgApnrInXL7QEVvSyeL3dhKPavM27sZHnzHdDMP5wCRsZer522zSaUBUW
	+ltabKaBMCZ7mt0kxEiTcvPbVfJcouXBIV+3dvZXxDw1MUfPC2hrJkTngsVKnmP1UJDw9UvG6U5
	42ZE9uPBiiuasLCEMUQ9I1Mkaycx8vi0jVs9YzJFjrTwwfyIQP+PEqXGRQf65YwF7JaJQ3sMY+1
	VjuoWCSn63/w=
X-Google-Smtp-Source: AGHT+IG1kMvLCwkIlZ/7WxOf9BHdIUQElSPpYHSnhNergf/DVzd0TcB4oDWYyjgd4zWn0XxpcWvmxw==
X-Received: by 2002:a05:600c:468a:b0:439:6ab6:5d45 with SMTP id 5b1f17b1804b1-4396e73742fmr77147445e9.28.1739792616186;
        Mon, 17 Feb 2025 03:43:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43987088ecbsm18918465e9.31.2025.02.17.03.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:43:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/2] ARM: dts: stm32: add push button to stm32f746 Discovery board
Date: Mon, 17 Feb 2025 12:43:23 +0100
Message-ID: <20250217114332.1098482-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217114332.1098482-1-dario.binacchi@amarulasolutions.com>
References: <20250217114332.1098482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_034337_508213_DC551B3A 
X-CRM114-Status: GOOD (  10.35  )
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

Add node for user push button.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746-disco.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 8bdd10644bf1..b57dbdce2f40 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -86,6 +86,16 @@ led-usr {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		button-0 {
+			label = "User";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
-- 
2.43.0


