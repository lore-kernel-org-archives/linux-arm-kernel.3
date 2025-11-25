Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6E0D0E6EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Wq6qWRdMJT8JkFWrdlIBvOjsRwtEbw2p0Rqikaex0U=; b=bu+ucQHwOQMctuM2ibkt+CEPw4
	KQ1Bpqc0XuQEGmQAt1VfCc7AkgPG/TNniGQemvq6QB6D+Ayoyken+7rPOLEyF4UVYMJQjOxFSKX09
	oYGnAVZjYoSQKS9MuuBIRoydM9jb9RKHwf/8NZAS3bGssyA4AlIk5BhPgpXFPqaPw/qy6lSOxkEK7
	dodFf6a/5gl5aqJD3v89eZdR9J9uEYWOBOngNWvZ1mUPmmqIOyD3WFJaPL9/F8kppdIL3/oNVMmnC
	W1QCiCq9gpU/mcUkr2466NhaO8zclOiUJ/bEUY1Hq1dKDi7+jo5g5JTRMEhwno6A+6OclI9YiziiR
	M+eObmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtaB-0000000DOO5-47vP;
	Tue, 25 Nov 2025 13:59:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNta4-0000000DOL1-4C4L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:59:46 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso4838368b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764079184; x=1764683984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Wq6qWRdMJT8JkFWrdlIBvOjsRwtEbw2p0Rqikaex0U=;
        b=Mvm0VRinI6MP1RugNt/Qg7s47IAXj1QMeCu43B0NNzJ3e++fJ5JTXiNR5BG8iNsX7+
         KfTkeXk1xtLgyUd2XdjNPadfOXFbi7oGqGGf+68LEdIAEPy3TDob9+ta4Tx997HH+ewp
         2uLgcxt4jMAG4iEA5EDatfKksqIm5rZAH19lNsbulUKRIv9T9eDkzGy1hXek0pnh695G
         BH8KISrVNtDt6n8nvwoMAlblT33pcYjOZ4M+OzCzLKYKK3hCzDroFWcAzwylD5DBfaHM
         vAeKDUL68BSoHp20gb7aHad80iY7YOHQW1dqiXnIChVvIGWASh8YupTghlpSdznMOXTX
         zhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079184; x=1764683984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Wq6qWRdMJT8JkFWrdlIBvOjsRwtEbw2p0Rqikaex0U=;
        b=iORY6bcznzhPVuChbH+nS8/tCxc1CdHoCSL7/tiCeMizCzIKdnCxVgIHOQAj8npnhb
         ELgTgOPLBtGepNyuMXGJyy0WJX5f7dyJNlClktWsX6XoFjFa+/3j48cI7b2rIGo9cD1S
         FSVXdi4hFKN4VcT7oXul6ezrE3mUsmuz8gBtiD7O3ATz4bzv70zUua8XYOREbpfJbOow
         BteayocIX5F9z2+wht89t17nSBTyBixSxVgz61m0/590Cs0zVcS6u32mGS1Vbj0vftk3
         szJOtV3BAoiGKTrC2iLMHZIRCWjv+iKHgdFvSQbKSA9b28mBQL1NfZXJssjWRF+51+RK
         h/oA==
X-Forwarded-Encrypted: i=1; AJvYcCVYLiDDSDWRJV618kRb7PJ1jAUqzB7YJBTkkr2iDyyiY+WT4j+cpLLh2FTKu/DxsoOY0q6s1zW3PcOI4vFKTafV@lists.infradead.org
X-Gm-Message-State: AOJu0YwO5uw05u5rMFUk1PaSm4UoeoYZIe3aaeKLkeZI7T18DOW9ddif
	qJx5SCYmfBuq1gtYo+ME246totDJSKKbbmxA7xaB0woljPhAx6XgjGRV
X-Gm-Gg: ASbGnctk36XPwSo5h+9/Wm2kZW6yeUnn2Ux0jSJr1pr7ZCF49K/bs46/PmAd2J/nEPc
	x27xDKLiSebIHyBi3PZTvs7OWKKZzqszmfWNIto6NsoG8mZJFG1ofbkFsem4yE6S6BxKR/i6MNY
	Nycsa+yIRlItWm8byb+aHcMTGyCVRyTcUBU8mMZYM+I7Zr+6HMlBpeuaVt9CO+2Q4yOL3/hHh4T
	bQeP5YL4le66EYGI22mrsMozh78n6XS4n/rt6J/tb+L+BuwBk/2z8W7DTlK8et2k7PoHlN2xJJD
	SHAQb773Z98oPjF4Qp+KppCZM34QqR5CxPQIPq6FUQlgUyq81Er0ok08NjjOig3x5URwQYoEACB
	GfXSBG0/9ywLOW1DuDoOuBWRTv9X58pE1aae3jKmg89+o2Knq+/trA0kGBNSuKJe4VByL14dTBU
	XXtvYZZ36l3GDJycs+dFSrxMweluvjwiKMcouaSjdJMjC+C9nC/RNkBz6k2ojxRxVVnDV9vTWeB
	0o=
X-Google-Smtp-Source: AGHT+IGLG5ulH7QtmwgR215gpFL6u62RMBu83STuoUngtVM+z2Xb/xW3EJ/jrvfLs+uU70SnKpeLsQ==
X-Received: by 2002:a05:6a00:3d12:b0:7b9:df65:93a9 with SMTP id d2e1a72fcca58-7c58eaf27a7mr17838247b3a.32.1764079184121;
        Tue, 25 Nov 2025 05:59:44 -0800 (PST)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm18216028b3a.50.2025.11.25.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:59:43 -0800 (PST)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: dts: aspeed: santabarbara: Enable ipmb device for OCP debug card
Date: Tue, 25 Nov 2025 21:59:31 +0800
Message-ID: <20251125135934.3138781-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125135934.3138781-1-fredchen.openbmc@gmail.com>
References: <20251125135934.3138781-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_055945_043012_469586ED 
X-CRM114-Status: GOOD (  10.16  )
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

Add an IPMB node for OCP debug card to support IPMI communication.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 4312ead311df..0a3e2e241063 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -845,7 +845,14 @@ temperature-sensor@49 {
 };
 
 &i2c7 {
+	multi-master;
 	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c8 {
-- 
2.49.0


