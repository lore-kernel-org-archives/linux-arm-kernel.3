Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF12C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fIimPfmpV9l9JFDbTgwNS3L9wHvGdkzsHcN3zdJj86g=; b=Sv5LTZmqRY95MazwbILyiIimGl
	Nsu0w+/MlV+GEWfdir3CWYucx1wsj18zgum7odCWZNpYg+RVZfR58/CWAxtGK1J/ayYKoT8tlItxY
	ALcjPsbTdBg3mpukPad7fpxzwsDRi2wmt3J/fBJN6m/NwmtnDApFzjVJbBPGd+Mgr4kPWgxKeXKI7
	yLPZSn9S59EI854rmk0gJ/fmQkSmerOQGjAhAiAM84nttS0l6lf9Z2nV6HLeAi05Yl8z9TUWwalBo
	Ra2kI63apZgajTm3tEwHEQVR//GW14yGb6uc4FQRid+tuahrQqw74uL5BCcmnbFX/lvGxDJlNC0V/
	tCVgCw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQaj-0000000AYNp-03Ky;
	Thu, 30 Jul 2026 13:14:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQaf-0000000AYN8-32fl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:14:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2303855a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785417264; x=1786022064; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fIimPfmpV9l9JFDbTgwNS3L9wHvGdkzsHcN3zdJj86g=;
        b=IUhEKUCIj7W0Mqkz6K0PVgK4FUzPuOL4UUNmvYbTtqnhcj8HaswymYowff+timDu5+
         epNVMMqbegNoZuX/1GnHLHAGew3ZLpti6vxHgUhbI++LXXh+S0cIA6zPuyERWf520XQB
         FTfwwxJXTDBvlbGk8wKhM7baoizbv+CxQGOdkTDecKJB4KB6c60IOJzss4Ft0Z6qjXc8
         sYg2faiqlH71jR0rX2z95+dg1N0jmBcGy6piCe0wAid2XEmtlX134geYmILQxG7Ph+O3
         WB5UPSSXzrbtUe4hSMOXHGnU9N7voJ8aGgxJyFXrDUedCL0vCJcztrmYp4pALe+UIgMi
         zT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417264; x=1786022064;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fIimPfmpV9l9JFDbTgwNS3L9wHvGdkzsHcN3zdJj86g=;
        b=a707RWd5rSX9XcnPJh4aCQk7n8pzuRMi7LolfqnV/MHrAlzpbeKfDqp6SBJ2/HsLL0
         Pf7+hvh9Wy4S2lD1vZXMMl+2lRtjS5MV7Qo6cdvJHpbWR5RspBzRgBRok6caFpPj5M0s
         c/qR01kq/0EgvMV3DGki9heUKKBJR5xsDanDBRu6JoH7cMhjqkTYF9iiUGXYE9LBg0kp
         2km+xrONACURGwPZPdHIEmPSCYTd45/9yxQGo80VtzIuDNj/3ibMWQl/JzC85AoYbjQg
         keNu6KWeuFWX0EwDcwQ/FvXOz1plmhOVJOL3qL37JDiJlGkE5T7m13uj2wDvFGHL6wRZ
         IQNw==
X-Forwarded-Encrypted: i=1; AHgh+Rrrj5qXV4RBOyR+rP/rbv6nc3v7Eqkvr7VLdjeTOlav5ZOFgpEcu+GB+xkVOk6sHGD/HpLP69M75tP0SDRaM1+E@lists.infradead.org
X-Gm-Message-State: AOJu0YzyeNxQcWA6YYJd18lQmyko/DADDZzDXDQ5xpV14y/ljBRhOnD2
	hI/GfDZIZVseSlCqknbpl+opZ0kSTOyOIoiYJUQDEimaSnk6ViyXZHgo
X-Gm-Gg: AR+sD10+HtwlokYItDbtpPP8C4vnPiXw0dZRcX0ZiiyGDtorytAIv1lcbTErU47bREn
	XPagH/Amv9uVkmcjXWmkhJMuVORjZftBsWYaeunSUNcwTOA9h1FDMZeS/IGTUHD768JtP45lDbN
	7LwM6hcZG444a8BgJifTYui4hOn9nsTTZL7ngtb9CoVXX2TFH2oeX27VChrwfb/OBYTNl+LY7qP
	bpXrpOCUVS01VrNozFiDLt4GPxs2tHELFeSFAXWwDtX+tXpJ5vRWJEsZr32ZSvNTm330lNt2Mzt
	MoKkM2gyabYub4JpHACmXJs+s+rpzvwcDvamqDQtFnzhgvOW8UMXzcjYQo8bEBzZ+cyMN8EM+nP
	5rOd84C1H/HiqOd0D7gZKHKKMo/Jg//6KeMskxoVDMfeeeIpO3whqpHQwkI5KxheVeqTO+HhXsP
	v47T3rWSwT/rlEUV9DwzlAp27srst2hjIH+zIK4JHS9REO/QEMPVeBXMovme/4IYEHxBjUshb7v
	WaFUA8ZQYsN2qrx40bbu7l6RI7SscQ=
X-Received: by 2002:a17:90b:4fc3:b0:38e:6bd7:fbbf with SMTP id 98e67ed59e1d1-38f9bed468amr2139138a91.20.1785417264204;
        Thu, 30 Jul 2026 06:14:24 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9babf9f8sm1068756a91.15.2026.07.30.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:14:23 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 30 Jul 2026 21:11:59 +0800
Subject: [PATCH] ARM: dts: aspeed: sanmiguel: Remove HSC nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-upstream-sanmiguel-remove-hsc-nodes-v1-1-f0308eb8a00c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ5Na2oC/yXNSwrCMBRG4a2UO/ZCbEGJWxEHefy2EZOU3KYUS
 vdu1OE3OWcnQQkQunU7FaxBQk4N51NHbjJpBAffTL3qL+o6KK6zLAUmspgUw1jx5oKYV/AkjlP
 2ELZaOz3AKa8ttdJc8Azb73J//C3VvuCWb5qO4wO3zpDPhwAAAA==
X-Change-ID: 20260730-upstream-sanmiguel-remove-hsc-nodes-b99c93ec0d9b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785417260; l=2011;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ryzjF1cLKw/XipIXoQ7vZ1VOYZcEuP7I+1ETkK1xx0Y=;
 b=APDPwAeB2o0hAhzdf/pC6qqRxJFxUcbKKwxw7AgS883bDvOowl+qCAStY4zQ1rQ0mrvrD3bUT
 dEkQ4HcTDAmBgrywTkWcPnGQgmJ/ihcig0RjsvDsaFPCr86EPL1ApXt
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_061425_771202_4275A6F7 
X-CRM114-Status: UNSURE (   9.76  )
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

Remove Hot-Swap Controller (HSC) power monitor nodes from the DTS.

Due to design requirements, the HSC driver probing is moved to userspace.
Removing these nodes from the device tree prevents kernel-level automatic
driver probing and allows userspace to handle HSC device instantiation.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 44 ----------------------
 1 file changed, 44 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 3cc6e772cc8c..98f224d2c091 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -442,50 +442,6 @@ &i2c8 {
 &i2c9 {
 	status = "okay";
 
-	pdb_mps_hsc1: power-monitor@10 {
-		compatible = "mps,mp5926";
-		reg = <0x10>;
-	};
-
-	pdb_ti_hsc1: power-monitor@11 {
-		compatible = "ti,lm5066i";
-		reg = <0x11>;
-		shunt-resistor-micro-ohms = <1000>;
-	};
-
-	pdb_mps_hsc2: power-monitor@12 {
-		compatible = "mps,mp5926";
-		reg = <0x12>;
-	};
-
-	pdb_ti_hsc2: power-monitor@13 {
-		compatible = "ti,lm5066i";
-		reg = <0x13>;
-		shunt-resistor-micro-ohms = <321>;
-	};
-
-	pdb_mps_hsc3: power-monitor@14 {
-		compatible = "mps,mp5926";
-		reg = <0x14>;
-	};
-
-	pdb_ti_hsc3: power-monitor@15 {
-		compatible = "ti,lm5066i";
-		reg = <0x15>;
-		shunt-resistor-micro-ohms = <321>;
-	};
-
-	pdb_mps_hsc4: power-monitor@16 {
-		compatible = "mps,mp5926";
-		reg = <0x16>;
-	};
-
-	pdb_ti_hsc4: power-monitor@17 {
-		compatible = "ti,lm5066i";
-		reg = <0x17>;
-		shunt-resistor-micro-ohms = <500>;
-	};
-
 	pdb_ioexp_20: gpio@20 {
 		compatible = "nxp,pca9555";
 		reg = <0x20>;

---
base-commit: c2b9fc3f7091157518a3ac2282a0a8bc797c227a
change-id: 20260730-upstream-sanmiguel-remove-hsc-nodes-b99c93ec0d9b

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>


