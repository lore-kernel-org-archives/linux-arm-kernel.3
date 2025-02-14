Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D3FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=; b=Ho55LFJ7Dr5/3AARH4MDBZcyBY
	1NCWHQV1UhUncyQlGl02F4nwNXZ1jUcz9DqwCxXMmosliy7f+5FAL8FDHQVS8IUGukkyqJeApoejh
	vspam8A7vgi7cSlFAVASPTTT4dFjwKz+Rb4uZDWquhkYEtedTENLW9a9jYKv4hoh1U9PpbZ7uMeG7
	MWcGgr2LHWQ2l2VVFs9mXOT1OUlCf/rhbBvzwumhFzGHnuTlmu2sv1DA6FGOBAaUBUaqR2qGtPmkv
	VMWNwrxG12egqqh+FI4pS3YJcm+nbgugwl0knWvPzeh4x/ua4KtgMpVz4b2wLaDkbE4SjnjEuZEsq
	DNmJVRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwkx-0000000FAQb-1zxU;
	Fri, 14 Feb 2025 14:33:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwi8-0000000F9lq-3Vmu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:30:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220ecbdb4c2so24581925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543432; x=1740148232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=BKn74U38FxIDhOZAYUPTIzClsYToi1th0ANDcf+G+NyryRMUaZoPe165WN/yEDmufo
         J7E9tdFnqJn72pWuZxyCLtrWCxHJsdEBb4b3JTVYXCYefTAJWjIs8a76zikSAlaeNjap
         lBLqSGs+ou1Fzlb0ah6jP39Ts3PnWcuA6NbYnmJdEEjeFnm+VwYpUt/1nVi+Jmzin+Ou
         Cxh1r5bfkstAtAOughwyt1jlBIYUaptgQAIHzJ+41B8Viol4nwiLcvaQ9cf7ay5+MbNf
         2dYLjGJQim0pCqxiSODYqnompLenOXIsgzkhPaZkq7C5ZDTc5pg+n2hnmQXkpz08kPPc
         j0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543432; x=1740148232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=Ixd+TCLdJhZ7EWp++IL9QmZCxhcCY8vat5m6k53ifDr28b6LA7x6hTuAHUPSidCuN7
         FAtMUXA040D4UPNGgSrVPAPRheySFuVDSRD8w/RObAbQKZVEcnqPlctz4OhTzMk8WIim
         zPynzIUG/fFGoFrAbb3gpbODmgLP06hHcHAVA9otsND74jQhs6XSZzzf0JdfpGsGsct/
         VBSFSBqAMDFhVgLSXkdN804DU2xjQYZQSUAxy/tJhNLweYNoTdPdcay0IMdOCVmQKL08
         hSbhvjLuK+y7Iz01EfF8nJeD+xo084TFOcK/XrF0Gsi4OmZ8LphV4vpEl3Kw8W8E9kTj
         e8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWzawPp7PQ2RMR50uET9Q04aq85vyvN1NlVQLrMXWqn7y6C6jbytj7sKJoppOquFSLpq949d/fEBLyi1J10jjPD@lists.infradead.org
X-Gm-Message-State: AOJu0YzumEPs0mx+MnUJgSaEh6be2nbzy0TknE7SFs3Ym3SkXUgbl1lX
	/QBb3GgAc6b38jnYWax3hT3kVGoFkVk4rv0V1U2RLofD1BsDaknt
X-Gm-Gg: ASbGncvVFKidPct9QrwuuQX6+yYLpSm1BgKqgDu1R+yg8Xh0Y0mlfYZGM1B0O4SK8ET
	7xUakfl0ki8XdTM6jQcDdKr+ZkOO4+xOHh+95VdcNyFv8gfVbKMetFKIX2/gTCjS7Gx0bcpDPA0
	/pgJLrKPq36nrcyxr6XQJnIjVTQqjMVYmD5T8oQxshDq8GrJXE0KOS9ttu8CgEoiDy5JaML8Boj
	i8uNT9T3Eie7+BW/3VivYvMje/yJWk60GdRP2lfgyGZLWga1KVQYnwix61n7UfVgztNk4XnxyHF
	YsOKvlvVTKxP+rY4XA==
X-Google-Smtp-Source: AGHT+IEu2Hb5pPBgql0J5zrtyu/OArrfmnQCdrNZAsm5tiDRfDCnaHp3/5nPXiG8C9X00s8G8YzcCg==
X-Received: by 2002:a17:902:f68b:b0:21f:1096:7d5 with SMTP id d9443c01a7336-220bbb209camr182567835ad.17.1739543431767;
        Fri, 14 Feb 2025 06:30:31 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:31 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:27 +0800
Subject: [PATCH v4 01/11] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-1-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IvblILNfK65nRmNXFfVq27lzQtZVkqPdlXpIO65Xo5E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1N/3AiQ60M/18EKguryDnvFSc8EpDOxgVFQn
 WnGb5RK8MaJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TfwAKCRABygi3psUI
 JN7YD/4zOhnKwP/8gjH/iYxy8EzNHBKW4M0lhDY1BbC3KPoAx+9ZuPGLOH70VB7T6F7r8IawTxc
 HCns5b69zzvzgRD80Kzn+qDqbm9EmaD1acIdmdF4s+jdKSWu/ldoW0yBhtfajoqg9tsk+vVUfXU
 2Pg8j9go5VIaACP+7mt9S4PQzambMtsJ9/hA6heFk93g68xUXBlxEbMb5c9SaVz/+7zahh8usyB
 7bwp/2wJvgYLN4uiHdBpxZRYjG0T3G6nV9l1B6gdlSCmnhqQ5uqinPmdPNWsx4jD1UIY6U6eNsL
 xmHkfQa9Ad/DQ3G6qk299EQTPTMMIlGp6LYS8MJ667rwBN5/1gTU/lPniRqO/XHPIbtRoWguK21
 /CLbTPqbUCyiTkFU5o8m5imLiaGTzDJJ23pnvvI+nnrcdKBKb372bOf0miqwtIOeNptuq5RcJF7
 smY9NiKRS7lVHDY0bnYq5kL+0fAzhXnT8h4QkWYqzmAEOY7JamxjYLxnuPzBG9HryytxUJkvYbi
 Vl4mpqp0PUpjD/kIWJsJdtlnqN0ez1YmHYYdqgDdw0jV7bvFG/Yl0y8/6tjRdgFM8HApJzQHPj2
 fiRZ+EBgLkMjCMfv6UqJURbbW0M+PW4eEIaD7cD735Zqk8UZ8DUoEzYZcjWqOMQ0biFiqNu7CIM
 apcGbdemuPN4+JQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063032_869358_16DD4E0A 
X-CRM114-Status: UNSURE (   9.19  )
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd..d2e7f19cf6a2d7d2348d163d37c2787c7a36bbd4 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.48.1


