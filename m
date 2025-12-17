Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F82D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=; b=Fzz2jpx2HaqExdScCexHmH1E/i
	n1JO0RnKfZIb1wfl24UmzjKmHMzf0oChQBLXvelqLpNnIB1QY+rGJcJMWgr17Q0Kn8aAV0Nv0zge6
	5qFcjaPQs4pPp/NTMwseBnRR4V/iRVFSN9VUzdDb9H6xxGcVQbH21l2cBxhE8b6mYDI1L+fML4L8S
	q8C3OAM3NNifDyWyTBY2jLg1cgrazXfqU55tCRQghUBZsUzB+pyBbhSdqFuzCeQwZstNwQUb+gbjr
	MEIe8IMjUmzpgnC5mUX6Z6aSGkdUQIsle+rZeGnK4rBaPCUAjCzhBDLDzJmatwymVCBy1a3zY92o4
	w1MQRRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLK-000000075Xq-04pw;
	Wed, 17 Dec 2025 16:25:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLD-000000075Of-0qXw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0833b5aeeso67305145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988730; x=1766593530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=MhUuxC7/75K+2VdFoazaTD+rbX/u9Pao4+sLi+uuGNlPGgFMruwZL8wUoCZLquzkDu
         6dq79yJ6S+4bG4n/Zr8S2cst7bIZB7yzwdE812GnGoRZUkwUBlF7VLIbTY3be7zyujhz
         1Q0RBblxRZcB9Y6asuhZk7A/rprUUJvatmYKxTSQZAnW7CROKCr7Wls8Z8CfMSOSSgAh
         Srsy4lDkA+LjZUyjvrkaOr4yJSKkMsyM+v1+hn1kZKGu0Ex6xtc0vph6EK0AeXmG6tWr
         VLPL5bPJc3bnICaPxESte7tsaJFHzkU1mt4TM5kz02p+AFszsyiZB1A9P10nlMGlVswz
         t3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988730; x=1766593530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=k4CUchzdP42M8TxT6qENu89tWgBFr+83L1sGHDa8bFkIRE/72JWAJNmhZPnsxDOerv
         TnpyV1YXz6z/M6GMalEQIur5Iht4YndcH8NDUJCyE7GXzsJcsBx3MqUcdIrbIOUWYt+W
         MCO/KRtHYGSBcJByi05X6wUZOqVhqI4uYCnRIiUf6x5H2Rj9iIVAwhioqHfq2GXNiDOk
         VCkerR9Z3GFjWCWXr5SpsbhuiwFx+ExVQzFoNvhm/DLaQn4AUnn+u+fe1Hg/gAKonvEK
         b4/6pfYI8WCnXviRPKnodLqTJpxkBJMULxVZxKGcq7Qk2/rIgiB2rGH/xlcgBuAnkIfP
         x96Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiiGAlh/FgvOL/R4hev3BMwGCk/EEfpKTkSvZxyBJ++CPoVgyIwxR4dnRDPZFANat31lIuXa6GRleF1zwXaKgR@lists.infradead.org
X-Gm-Message-State: AOJu0YysVLlbeOJ7rts5LMjq95LMVtd3YTuTV9MQUlinFCje297+meM5
	SjSwVO/Prx4ZwfWIIyz+oogpC6Eq2SM1u9Gppwu7ET3xkjtR3SvdawdU
X-Gm-Gg: AY/fxX5sP6m495596QDQVrvo+dpwTatVgR4VT+icBs32IZsIfENOp6YJOl1Of1XpD3Z
	JbAlUbh8aWOp2h0gzVx9sfKhkQahkBKuCefbwDPPuTwPZZ90v2BOoLxLITll2NrDucOhZsDTtAh
	fTE26GP7i7RxM0qVCZBrMYD44RQQzWvwb18e/Eduhmb6oTECCfUGpaGalpzus9Ucl8htM7IKfki
	TMCeegqjfnbWCziMACslEGQYAAUJI3CSvssy+4ANH3z+KlXD99PXlcvCyy5/PeoHPJt+BamH3lB
	1TvHqA3YNzVl3cqNGU+5se1BMxM2K0bVTh8PPrznk09oj8O9zshjdhNEKVrn+6ZSTvYJDZPdZIH
	9+Lx9+cBy4sXPKENnPqJIjxd3+cf7Ld/L0zgKXKM5yNIwSVR7FdGno2Xs27dk1M74uyqaZqKoFQ
	W4tsEprvnryEtBkWE/KxNpl+E=
X-Google-Smtp-Source: AGHT+IF6ow4wM+ihwNVaBoZq+Y9IX9FSX51mWNjkFJ+2+D3BETqFbQhQb2Jfop/GosxjpA/TwOzvUw==
X-Received: by 2002:a17:903:1aa8:b0:29e:9387:f2b7 with SMTP id d9443c01a7336-29f23de5f93mr181949755ad.11.1765988730144;
        Wed, 17 Dec 2025 08:25:30 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:29 +0800
Subject: [PATCH v9 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-16-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3omd0YVrSktNDZ3RXrP0xc/+wVtkaIIz0927w9SxlCU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCB346IsdcVZWXTm/5JORDgBo7bwjFJDgeM
 zWBIZvfxx+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JJLMEACQhaV1MhO1B/LjaWCuuOUK8Z9B/Tp8bKAXeKgalnLI5wj6oMui4wEpfArfgB8lTIRQrO9
 UV5FEEAn2agoE2wiyqvQRKHtr36OpQ6Ar6qtePa5JXqtxs60+sEiVPztGxzkqnzdNJyH2fkuE0a
 MLOubat3v7BqjhL7W0/JzQvYuS1vnJUGf4SK0Kisv1mLU1u+GX6sGbICXBgJFGxVHKSdprVotko
 CU09T5grM/pEXc9Ev+zrinCWwSmkhrnZu1G/xGhabIYSKeh6BJZGBM7ygk8LrYyHeb/ovpMYpYd
 d2w8rS4jyc54qCaEkCcYl/CQfD6pJ6aP5rP634SV7WRy5dNYUCZ8YO8o/Ow0OfdmcRm7BWeQsas
 i4H00nfNyTUQUl+yVCHELn5SGm/gF2o04juTPH/W0ms7xjsoLhsuoh5SaX4aS719xiJMp/+Pssu
 m3e46KArILkJFwgqZXfEt1Y+bOV0YmnbnjopMfMkr1HcFma4Gh1p5fD6WHfMFbfU6+XKqi6D3y6
 ofBub9RizWdbcMsvA/wQ35r0y4dxdhof8NQXtyNeZFwloExmFjZyXGuvt/KasWFFu6Q+NSVAfup
 j82TnsuUAk1rzK9d1Sw8uXf8KTt9JcNmWTLE/z8YgZRC0s+JX1FfXn9SVlz/rGucHvLnWBcEKM6
 Tb5yLn/WFD/Xq+w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082531_300582_303AC455 
X-CRM114-Status: UNSURE (   9.33  )
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

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index bb38662b7d2e0b70e18b6870b706789b1cb242af..aa372aefc995334b1489953c16251c8ff9b94d98 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -237,6 +237,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.52.0


