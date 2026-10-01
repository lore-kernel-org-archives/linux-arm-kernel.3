Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1A1CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=; b=bA0EdGAjyeXY1jToxxJjhf6OCn
	Fewx+S4Q+5kDxjDTYGBYkNxCuK5WYAULL8LaiBA5xr8BDvKmaEjPumPq8LKn78hxJ7jkXkuITAaH+
	5c8FPNlzEA+uEQZBSDHoUUEbwkoJLcwpxKzpXNoj6ZUfPYIrwGqmAxHeK9Z97KrT8v/XAMMHobob4
	dQMMpn7sUlnIKc3da1U+fhXDGuOlrdD0r8XoYdeIAkTZRWteRZllmmzQMNhNhx9BmRLowWy7YxWY7
	fJw+n+VqRhsr9lqq25xzaISLu+hkorZJK6w23V6oN97Q+KKOCmYeUCxfE0IVIeqKdJu7IkNSexpA1
	b2mUvFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ78-00000009bKN-37NS;
	Thu, 01 Oct 2026 15:54:30 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ76-00000009bH3-3pTq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:29 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48afe3b2383so1642563f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870067; x=1791474867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=obL5di9TiJuXJ5SriRBDg4h/ywG724Uxt2uk5y+p59T9c9E2BsqDDFwlr8HMJD2Chx
         XCSD4qsDuS4rtkIY52tKnYIlZ6kOPmwYA2m59nvAn0+gQOH0ic44S1I95e2+BlTKr06r
         v2qNv73x03+cgXuan/SftcGxA8LuGlBgA60ke0xCjKGgtgkcHzD13O1da+obB7etfTd9
         Qto+3Pc/oqmYZ/Y3M0Zg8NQWPGb4piqqyZXrC0lzIJrOdwxpDXObkVtF6vunlUfHwEK3
         XOCf/qH2+68M6hTu9SgApUsrZ6rHTLWzyQOJUVNLFJHKq2bo54ppedlg6i4qsLcy5sJf
         eDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870067; x=1791474867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=k5tJfsrNmN+7zQcRdoLlO2Ckpd66n1XM0obZruGnLVWuGXvjmjHxcbFBzsBpvJ3JeB
         K+6n9Ge5VfkYRX/h8MSksDMvZH16lZKO3hjCEhkAhKkkqLLBvdD3MHuGGx2oJlyvgNQV
         Dg5AyKMQBHnZZ/0pGNaG3FyrB3dLCFpb5Gxb8VeMO98GtR440rqSDd+O+l44CTGONvhI
         /Z88C2XJgnxR/9EpWJae+kgs3jTW5JF6Enm95a6uGryAK2vT6qJMkGJ/sk30BvfBJcFb
         N4S5TNPOpHAuaHcVFPGVB7FVbkV7Ux/t/RHM2gyxiy1QLnlh3aXNWx4Vlwwe6FvjBdB9
         WHgA==
X-Forwarded-Encrypted: i=1; AKwUvBwSveUHqEoThaNboQCSE4M+CfTfpwLnyYoBY+fxDXm8n1RZWNY9UyudC3R9KuYL70fPwRLK6cMT42XN6oqKuoyl@lists.infradead.org
X-Gm-Message-State: AFq9FYJJAPlR26l64vgbu5o+LeJ8+pA+KKQH7jzvDxxEZpGGappEJHAB
	UGn9bqKMyGVztEJxmDn3EWHi4sgWTSxSejP+g0jLrcEE27/+CW1vunOl
X-Gm-Gg: AYBFou0IX1Fz3DasTofdnS4rQzWOxiblvWsHxkY9wgyxNKyzPyQdBo6uVPO5orjcbcn
	u4nZFZJUZRQgKUScBy8t6c14nxcNsQzwt5WWy9UxzcJmIGWe5ZmYwQy6JzfEhMXb+NWs1Qw949y
	m4pG96f8m6se2RPE7lLcNXwmIm9W4f/wg4G3FMjeOyjhMSk8d1BrD8UX9IbPfr5CwF7GptiJDio
	UU06yhJluA6InaxNH1fFXOcMdkomSTIppel+WmiA3GfntoFoR1Y9A3Gcr9G/dUi+7PgoLM17RgX
	YQK5/XqUlFvcwtl0ZlUB2BkFY0WHKVFKZW2N18O0STYif1bGlSQTOz/yaNgqCNh7IzREbt31/lX
	HpidjXbbw9TVr2vZJz73PMIuJv2zwoBEP1L0brrYA1holgZcYIEfx+ZBDTmd6rMUwYu7mgD081c
	opTtO554dYzuzFAdpJrexUulRkllBOQbsfSBQnZwEfr+PDISl28o8K1HaWr68fTthUP194btM8x
	OJfQ0IpFqwYaj9GTYgAFnZIPdbH36tU45kdw12y0c9Buy1eUzIoKfJBr1ijYGyeKhw=
X-Received: by 2002:adf:edc2:0:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48b127431dcmr12700f8f.24.1790870067132;
        Thu, 01 Oct 2026 08:54:27 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:26 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
Date: Thu,  1 Oct 2026 12:52:52 -0300
Message-ID: <20261001155412.3177428-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085428_978238_0691D09D 
X-CRM114-Status: GOOD (  11.21  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a45016205..f6eb2eeee417e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be4352779..f015faf19199f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {

