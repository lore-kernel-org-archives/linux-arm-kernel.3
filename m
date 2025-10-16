Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A94CCD19E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cZU/PvsO/Y2NbI/2LYXn5EnCITnm++nCSaU9RCrcRDk=; b=HjmT4t/I/LGoCniIQzD0tEW2wO
	+ajtn7284/2i/1vekKcd2hDRz9KkhKmsdfcsee1m3lr9JNTG33IzMClsziTkiYh9fE3iLe8tAZvrX
	BZbs8qP/JYNKW8q0YvLLSYzMzyFvEafq3x2pQgkH2zb8tRuwKsFx702yi2ldDchI+EVDeN/82aEdO
	k5ODT/WuR3w/xoOIXeIaKjiRpW3xZElkaR+i0eJmWylvFt0Kw3EJUR0N5Qqyvo9ZRsOaSNfGk6Pxr
	JbKOzFuOq2wXqmU7dOY+AiaMLbzXaV80gvfgGL3eYMPIgYoZ+1afoMj9v7/EQsw0ZhfTb0HNZhLj2
	Uen+7L3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GYd-00000003VGE-42gR;
	Thu, 16 Oct 2025 05:29:48 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GYb-00000003VFj-2zVk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:29:46 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso211205a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760592585; x=1761197385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cZU/PvsO/Y2NbI/2LYXn5EnCITnm++nCSaU9RCrcRDk=;
        b=c0xpW5YAgFfWf/BSyMREZF7yxsVWhwlp9EosvS2nQWhD6KT+hdwadPOFWqTxAqFeR8
         NNEjsbUW4dS05uGji1vEQK7+fsghzuAYELlRAwigjoHS30dopLIRTQhFzyqnntC6a6WJ
         VKebTD4SLoxMJN9nI/bhgOJF/uLjqRh3bv8FSZCqmDaX6r//QfP0p3JBbivhHhnHZI3J
         Ta+Tn9KO5lnHoPvyu56HIALkg6EDtAEb5fbA0ZOK7eFspX6g8ttti/ySKo13T2RXXWQ0
         RPtsekJ8/RSMK3Xyb+RPXLb/4rdPPwlbQ2CZYxwZoPU/MRcJAjYWxqTjvq/MOWc/P6VI
         0lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760592585; x=1761197385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZU/PvsO/Y2NbI/2LYXn5EnCITnm++nCSaU9RCrcRDk=;
        b=dALfvjy4rBKKtgtTdZX/jbnTemUFyeeVhhUMokt3GrfN+5EutXTAQovyHz6dut/4K3
         G2dyPjnDK6F/Rlw8KAE/Za3Ng8zQUFWNANm6m24UMtB86xX+xXnU1smtVmUHDJ1uaf2z
         z5jWO24WtEO/T2mdC46wec86vvI5EeGZdiG+I0KAHJkix+xmi9Anq/MI8DKADyHix4SY
         4Gf/C8AsQL8/tP2GRZim17i7K5jaXFl8ye3F8JE5iwOoJyDBiHQW8h1pAEbCsbA53kf1
         H2QYoZwvNJ6IrkK1KQHKu7xVbYuGEcP4DAZlKjNumIFxml/fTiXshHhml8/Gyg7kX37F
         5l/A==
X-Forwarded-Encrypted: i=1; AJvYcCUth6Ln9dti8mnjk2gFGNQlAEUWr1f3sUZ1GocuYpEEv/fdS+vneeAzXvmQkawtUFiOxArSJ05qWxDaopXfvNln@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2CH5GMSYaO+hmB/Xh0FMviNzxX7cwyK1Nd12Nl+Rc6iSxWqDn
	F/x/+XT9VD0zdxQRm4YNlsr/+AEdy2KFChqikPZMR92lkSMUNSAMrl5I
X-Gm-Gg: ASbGnctzshDGzceSXHf5pUylDU7+8q2O4w4/s7TzwT8pr1jqf2vwZ4IPMvqkkf+IN5/
	I8qWJsfydE2fj/04SlPzrBG6OS1Vsyp9t/Ii/wsM+1qolLTo+MMODm1XUrgKVV5DeJhDafS1yMc
	Co1XTWWEMCIsuLnEwzBCN6cTeBXmJ1rYTGb0p3NyUkbiGOLZxNa2lY/v5lAonpY3GND4IEfC4cM
	d8GnZsJ9dBNqv2sWUqtiyLXHpwgU/bzEH7HXiz81YhoaYjlrUV4HU2FeFwRPzP6bZgIPNhK3V+1
	apGyeyaa0oQHC174RtB92g458dSr0kZoqz0Tng4Leepel4ovfoKqP0fFi+ddm1aZhjuu+QJaosh
	SxoD3BSk+manDieeoTRBKK8fMSqq+J2xn417883p2D6iGG/TaDaVGUiDYeWro7CRogukAvGTnSh
	8SxHu6DNODOObPc+94J6IEnldSwC8TuYBk5V2d5hCotkTeAp92CfrGR0LaoUKVcSnVzoEWAHMe0
	2OG/vFjU0tg0Q4=
X-Google-Smtp-Source: AGHT+IG6DkPdWX9xJzohk/tu0oSUnnb6SXO1oOB1ejn2LyoFqbU+fIA4QwSqj9cRtFoRS3F/p7/w/w==
X-Received: by 2002:a17:902:f785:b0:27d:69cc:9a6 with SMTP id d9443c01a7336-290273959b8mr383548325ad.53.1760592584688;
        Wed, 15 Oct 2025 22:29:44 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099343093sm15742015ad.28.2025.10.15.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:29:44 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH] ARM: dts: aspeed: bletchley: remove WDTRST1 assertion from wdt1
Date: Thu, 16 Oct 2025 13:27:27 +0800
Message-ID: <20251016052727.881576-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_222945_749876_1213CD65 
X-CRM114-Status: UNSURE (   8.62  )
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

Remove the external signal configuration from wdt1 to prevent the
WDTRST1 pin from being asserted during watchdog resets.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 24969c82d05e..abdb1562115a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1080,11 +1080,5 @@ pinctrl_gpiov2_unbiased_default: gpiov2 {
 
 &wdt1 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdtrst1_default>;
 	aspeed,reset-type = "soc";
-	aspeed,external-signal;
-	aspeed,ext-push-pull;
-	aspeed,ext-active-high;
-	aspeed,ext-pulse-duration = <256>;
 };
-- 
2.43.0


