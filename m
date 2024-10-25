Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017B8D0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSabGdTbzEgQbgybkjpgFSAHGH2meyPUW5UiWyeG4/s=; b=kpVU39I2r+fX4dPUD6JpqS6VXF
	0BBVCWYMFfwXuna2/d579JUfpSUd2xeqZ9tHweb5BiPGDUonUI2q4+NmQ8ngFxcde88FFFVlJS+ba
	QMIybukvMT6gdI3JyHzfg+9cMlNN3Zd8mPov/Kg3FsaU+o/zc2WJDMPEHFm0DmW6ELbYekHfYmz7t
	6CEXDFV9P10xk4Vm3K/dyDT/xAuGWkcNdbTdfW4jZrRBKhV1S02QkxyQ2cj8BYHxAmaknMEIglyEO
	WjCWiZPDsbPgBZ+VPBi0ZtmDy6MEjCp2Qzc4Lf+3ZOBcxgSMG0oS1EjeJI1SU7pOqz6/YhKmYWrTT
	BGk5dKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ilj-00000003YOS-2uVP;
	Fri, 25 Oct 2024 11:46:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRQ-00000003Uyd-2z5O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2464306e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855515; x=1730460315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSabGdTbzEgQbgybkjpgFSAHGH2meyPUW5UiWyeG4/s=;
        b=W0TiE6i7vBXjuzsokxofcBuSq0kPK6SF+ERCxK0uosPQit7x9GKl251NG5sVV0KHCT
         bTNZUK9pMf50HRYR78u7NHcmmPkZi9LuB44gp7ikEZ8nIHJZts0QJwp+rV+UlijRXz3L
         L/Qm3MN+d/I5au+Pz7t596y1eyzRmZp4awGXPjGLb2pPF6IyOdmwhhOAnTfBwyOmaGUb
         9nDO8Wke3Q1RCbdFY+8IDyv1zlsLJEl5c3GfOwseq0gv8cr5VHQach2FjNVuhnt/1OxS
         IBWWVfgoPejzlt35K6oe0FPeRh+MZ1CjYWCMZjf+6UHLTpQBmfRpyzm3UbNqcZ/vgX7N
         u/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855515; x=1730460315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSabGdTbzEgQbgybkjpgFSAHGH2meyPUW5UiWyeG4/s=;
        b=XwxjKA9zMJlF9RDA6HiLGswt1FkToa4Hy1f7jMn0sBAkKCnH90UWMcAFpZJJNOChkG
         WtcERMUqm50hoQKKwLPhka2EOWqZ9ciCa09h0Cjzp7fAPr50qvBHL9P+X11kGus6n6r9
         vEZkO1rUpFGlvUAiIuJg3B1Hmb927zyj7qlTz+dzrMJGGoa2Zkn+Kt73lzRyN9ktUQ1t
         8x2+4w/t7MJceOqFFV/mHIW2btJ3Xs1gqskQ/61JaTK7Z5p070YSvGGjCo1MAGc9VWM3
         HF7cOWyAJbYt7xjNatdFvd4/pYuRW4cEsciSNolR8AdiISiDsoti4WMUIxvEoTtHZqG+
         gPpw==
X-Forwarded-Encrypted: i=1; AJvYcCU5E8Hk1lx2dmrGTivQASR6dbtmhgwLImC/WdDUilzgLsVxWqDRkSlDqiphaso8fMr2XVQwYYlOU4PCF673mXhj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3z5xz/fo+ZwuuYqa59MEqIXu7WSl+83XBElEh6Xcu2t47kPC2
	NgZedgn3r5YOp3jJbD9jMEhOP/TV/P7lnUWkOwC+Abisc8KVwFsc
X-Google-Smtp-Source: AGHT+IFHcY7K1d4XSIRST6P1VbBbCeEZWecXl3lY04vcFn99wdvMSzSEVua+IVJCLBhrwEA8tjlE6w==
X-Received: by 2002:a05:6512:3c98:b0:539:ee04:2321 with SMTP id 2adb3069b0e04-53b1a34901amr4980825e87.33.1729855514959;
        Fri, 25 Oct 2024 04:25:14 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:14 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:52 +0300
Subject: [PATCH v2 05/12] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-5-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1024;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=xkm6m1i7s0SD+Mojc2S/i0Db8Qi+817SjtThULB3wpo=;
 b=21f+huUrG9w9oknHmtiwK3XoY/Q6yrjyTsZrvrrSb7fEVgnOXWWtlAJUmguq/tyDNYfKUO/tm
 /V5LCY7q/7sDSLXDv18ab3ubQ3hTZNIN0YkuNT0LNXZLwe98t7KIA66
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042516_817368_0D67007E 
X-CRM114-Status: UNSURE (   9.69  )
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

Add compatible for Samsung Exynos9810 PMU to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


