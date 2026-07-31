Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CA4C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 13:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uduIPrl1I11Bqm2iizUnhzteBLIc++VlIS5E5JRZkT0=; b=AzFkcHdSXCXKXg3CN61RsXjG97
	g6bkn5ySh2hStFb5egpWBpiaWxPiZ3hnSFaoq6kQZb4C3AhR1My3r/UV7+TKbUFkXWohwgkFCFzN1
	Qb6DbU6u5GYd18j4U0L7tc9WAnlre0jM8qfL2BSSKcIX30Lpn52G1qRdIno2Xc/1ugTa1tfI5P9gU
	NVM7jBuqSJrcZDEKG3xm+cTNNAJLIWuJ8vNrXNKq45uGn2qLnNXJU7DiwoIBOxlUG3p3iRh6nnBke
	wymbTYECWdtk5lZ6Tg9dnDC210ruXOqVI4vL/exRlKmpa5DgyD/2eLASn5C7Y08NXqRBgq4Zb4TZg
	l9gJFk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnPE-0000000Cd7J-2NbZ;
	Fri, 31 Jul 2026 13:36:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnPB-0000000Cd6a-15Iq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 13:36:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cea3004256so10818125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785504964; x=1786109764; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uduIPrl1I11Bqm2iizUnhzteBLIc++VlIS5E5JRZkT0=;
        b=BRV6jCdAqj8eyKF6gvMVHkF1fd0VgsZ0rnq4AseQiuhb3AhwizwryGHcPJzhMf8dL4
         iN6REc/ugfTbXFp5jDJi5WkGMD6AD27Y1u8f/VdIh8hjNRlBPLVODnpYSYaTCNbusdzZ
         aVXYeUAWTCILwYVhr4mByMQqI+6wvESzUK6w2eq6zQFqgSiBbt3nk61SSKLDoew5wRlA
         8ulX1l6xPFC6eC6xdrLjTVnRArpsXVE39tIUChxZCLNLJBt3Vr/YtpK18sDiTyXIuSpO
         3Qn1TRf23+jFL2TyYasaeYgkVDJe0ZIzKwDkjI2Xjxt7Fj/WuPHNd4o8DoUUv49btFXY
         CXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504964; x=1786109764;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uduIPrl1I11Bqm2iizUnhzteBLIc++VlIS5E5JRZkT0=;
        b=ffgshoBMch8cHrfyqqO2tSNhfd92lAOO2S7opXahy+dJZISlYE1Cfz2FJdm6y1L1It
         T/jjWBa2H/jnhogNgA6jbs+Xe+EtRNm3hsGTzauXi5A4uc8hBVCItwrlrYDqNeThDVes
         Sn+oPNLhOZpbBWY2ZejSfVCfmNbQLs93aLTypzzacASSTBAKDxGklV286M+cUyVdspRH
         mzSYoVDqawh8A8SSqM/MfE8qhmHQ+jD3362kOLO287omUsAvCCxcGT+glc7h4p1WNoEw
         mPTnVnUH193ecSHqh0jK3h23Gg7fND4LIC6VaeXaoEReDqVzdmAlMX9nY8CSH6AQJanV
         QAcg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1wqStb5tBnSYYLFhb6TRKK8EOdJA8GtmNpycITHQDlV1CbdmBTFmD2fqQf7oP8Sl9NyVu5Dxe5c1cbJIvd64k@lists.infradead.org
X-Gm-Message-State: AOJu0YwOH4KiOu/hwB+t1fakZXT1VjVmYB/A0OOPTbtJPa32x8f8Htwj
	5rzZ/x1NT/i/kQq9/qydAu+5FigQE8OZWzkRImhFYx8a0j3OfUrEbDQk
X-Gm-Gg: AR+sD11VxS/P22snxETLUkA4jJHcyvIQQUyEcI+4iTunjD+nYVZWzLZLB8t1/AuCp0H
	UAt7MT/i+jGpyzEggUKA7KuPv/RDyCb6L4EvlxanlLJr6O1qC0LBZY7gOzQKItfld4Z1bECZMky
	pA+94Ps9DIWXOwdTTKOuB9H2+mjcyerTLTx4dA9sxW9twuw0x97ED4ssp/MTnbCJ4/Z+eHnrKgQ
	yi6PWhd63WlDMGCvFdIGo/3HfZZLu9tO114PNYR07nRN8ZJ2BlbMXhblB02QKGFuqJs8KJQqbL+
	21hp85GLBNNLKznih9MEyiKElPREQvJqf982cjD4OnuOReEgrFfMI6XHxCocAqLzxugZP0DY08v
	gBRj4JoZ0KWcucTP7I7lH41B+TrNzG6XD4Vb42tLo6L4OOoF4CkJtd4CNmptD3E5uT3okO7PCpY
	NUZloU5JprTv83HDMcyAILsvJcJ4Yx710NgKuNu50deTR9dPvMCuovcrLIbOIL9vZFKOt18t7Q9
	heA8EiDtTfQ+skPIh1o4BQ/QdGuFBQ=
X-Received: by 2002:a17:903:182:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d0521e9560mr634015ad.1.1785504963767;
        Fri, 31 Jul 2026 06:36:03 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae196a2sm5621035ad.16.2026.07.31.06.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:36:03 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 31 Jul 2026 21:33:44 +0800
Subject: [PATCH v2] ARM: dts: aspeed: sanmiguel: Disable HSC nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-upstream-sanmiguel-remove-hsc-nodes-v2-1-6a954ea49ba8@gmail.com>
X-B4-Tracking: v=1; b=H4sIADekbGoC/5WOQQ6CMBBFr0K6dswAiVJX3sOwaMsIY2hLOkA0h
 LsLeAKXL3n57y9KKDGJumWLSjSzcAwbFKdMuc6EloCbjVWBxQWvJcI0yJjIeBATPLcT9ZDIx5m
 gEwchNiRgtXa6JIeNtmpbGhI9+X1UHvWPZbIvcuM+vRsdyxjT57gx57v3X3HOIYcnlliRrQyiu
 7fecH920at6XdcvVLZZGOgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785504960; l=2663;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=eyeZF/GOeEoskqfrS05+TdeD1fnc46qKy1AQ7cbiGkU=;
 b=P/nATfAEnRGOJBomjmjs2N4AEqd1gXN+yIgUBZQpk6saBfGRcRI7xQs+RHFrBFJOxYETrt48D
 /NCKAHNgCIdCmz7h+vuw/K4ebvONGPuFhX36F8agP9n4sC1Oc+6gNEH
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_063605_305070_126BFDA2 
X-CRM114-Status: GOOD (  11.80  )
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

Disable Hot-Swap Controller (HSC) power monitor nodes in the DTS.

Due to design requirements, the HSC driver probing is moved to userspace.
Disabling these nodes in the device tree prevents kernel-level automatic
driver probing and allows userspace to handle HSC device instantiation.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v2:
- Set the HSC nodes status disabled instead of removing.
- Link to v1: https://patch.msgid.link/20260730-upstream-sanmiguel-remove-hsc-nodes-v1-1-f0308eb8a00c@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 3cc6e772cc8c..b4463533d2d2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -445,45 +445,53 @@ &i2c9 {
 	pdb_mps_hsc1: power-monitor@10 {
 		compatible = "mps,mp5926";
 		reg = <0x10>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc1: power-monitor@11 {
 		compatible = "ti,lm5066i";
 		reg = <0x11>;
 		shunt-resistor-micro-ohms = <1000>;
+		status = "disabled";
 	};
 
 	pdb_mps_hsc2: power-monitor@12 {
 		compatible = "mps,mp5926";
 		reg = <0x12>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc2: power-monitor@13 {
 		compatible = "ti,lm5066i";
 		reg = <0x13>;
 		shunt-resistor-micro-ohms = <321>;
+		status = "disabled";
 	};
 
 	pdb_mps_hsc3: power-monitor@14 {
 		compatible = "mps,mp5926";
 		reg = <0x14>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc3: power-monitor@15 {
 		compatible = "ti,lm5066i";
 		reg = <0x15>;
 		shunt-resistor-micro-ohms = <321>;
+		status = "disabled";
 	};
 
 	pdb_mps_hsc4: power-monitor@16 {
 		compatible = "mps,mp5926";
 		reg = <0x16>;
+		status = "disabled";
 	};
 
 	pdb_ti_hsc4: power-monitor@17 {
 		compatible = "ti,lm5066i";
 		reg = <0x17>;
 		shunt-resistor-micro-ohms = <500>;
+		status = "disabled";
 	};
 
 	pdb_ioexp_20: gpio@20 {

---
base-commit: c2b9fc3f7091157518a3ac2282a0a8bc797c227a
change-id: 20260730-upstream-sanmiguel-remove-hsc-nodes-b99c93ec0d9b

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>


