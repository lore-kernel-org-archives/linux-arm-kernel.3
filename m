Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD43DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYKAYFSavL2qrh7QKasXIoDw8tHxDZ9ErXkuN1nzLXI=; b=z+e7fHDOFPCbJ7tPXUoDBsVZ+3
	Q9ut3r0zcGOW3lhR+0ePPBMNymbvnSRNPjqOyCrKZUJcCaLvHvG/Oo/hwAZa0oYbRKLLiAxUN1P6T
	NkEzHt5mtq03CVsS+jTGpM5peWMktu/VHeUmgj23LAx0ncXUUSXlBYRsQju5txUacCfhWX4tgCNiX
	prH3YUyIXvIHd3Ujz0+N/cxe6WTDUE55Ws+2vmV3N3SP9wOFHwdH0R+QWJxhA1x0Ep+Meqhmo8fCD
	CnkG0Amh/+1HMFbA5aU0b6B+Oxctt92rVixCqbE5Ynxzx843aEZS+4YJy+1Hc+s8xK5WXUHVCeOyr
	8+LIERbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoCp-00000001b1F-0J77;
	Mon, 06 Jan 2025 14:35:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2R-00000001YvB-3Wri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso87021745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173502; x=1736778302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYKAYFSavL2qrh7QKasXIoDw8tHxDZ9ErXkuN1nzLXI=;
        b=GKfedEnelikOMEyJS8CjTikRX8GD40Jlcc1OK4BOPqzADKzosddUv3lno649QtmCVx
         HDxjlXNlMhajacXs+NMTCP1ovHbBmvKrux555hPGqbgYv2Rw0qC9feY2023jhWB8ZzmC
         17YDVz7T6iGCHvAYAV+wWCe2mm4VilL0wci2lbhDNJ6VEZkix0pA+sbOnuOldIfiMRxE
         DAnkf7SmB5lYiCUWbZjYPon/JWD3GXKoFAYLncaS8TtDRlGUFI3R8R4a7fl3GSwzof7M
         /KnsDWt5w/F52j+GPzlqKoCew4LBZa7Gh+wVb9cTwDugpmYdOvOw9ZyQe3Qj2N+02CG6
         GDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173502; x=1736778302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYKAYFSavL2qrh7QKasXIoDw8tHxDZ9ErXkuN1nzLXI=;
        b=EsizFv6n4BRQH+6JyiEgjeolYQ0OLmJo4wJs/soXhW+9MCCnSLqdQsvEDEM+7AZnsE
         u9Lp9E7NhdMLrYs8c70G5bBnHYdg0Gs9nzZuYp5O0twSU+aUdNWGsQ0ulNicAERBgeb/
         PVXNVznsL8YIY8baTGioWT7VCK81MPxjTYIBts6BQXNcK342FyaAcG8b70q+g/lTGydv
         0eEY79oM+9rvBuxmQPWC10ilk7fJnRXhu2fKcCzh02nf6Xrc6xMFHcJudffr3Y/UBdYb
         Gext8mx87nVcOSZ/g5WQUmRaIpkXlekNqepVGobOITBz5K3Rq3P5UlNKHBmwW921sr9p
         bQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCXBp3DeDmZqUd14ajaNtCUO9p+QGujUJZnHa4+82Mu9P3DsRpOkUDCW4do88u/PrEybXu27d++TnsnmUkkFEd7m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwg0k+0Wn5a+cPZZ1JbYJfY/CKaXImXxyx/vLxSpZeC5IsWYqh
	bsVQqy+/kVci9Js/mpclSBphcbguQKCETL/5cuwMLiqf0oh9nBMCg7e37pxebqQ=
X-Gm-Gg: ASbGnct16hNIdabm6bHbOcKPu+b0Nh5PtqFslGiQ6CQ4jEpf6tFvd7sbkgh+NmzoMjn
	RFn501ChDFECbWrmIPUhUTXwQW7SMY4yUXNYd3bYTAzrcSQu6TSAaoTXPj0o7xY6skZS5BCFZaw
	wL5kpfW2mPrpsRUWxh4bioFTlScvTSXbIpoax3M8etGp01mRVn7JRksneB6zdjEwl2T5Zcjmaer
	dwPQFAZgP0wj2xLGTcwsDsH6ZCGyo/WX7LetxkKswpzF2U3NeTGoOwj
X-Google-Smtp-Source: AGHT+IGvfKHKPelpjJIIKzzgOO6ZbMtRPsuhPmTddU6cCPPRvQrUnpkGik7ELz6IwLeAhD1ciwaPgA==
X-Received: by 2002:a05:600c:1506:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-4365c763d36mr525116695e9.3.1736173502053;
        Mon, 06 Jan 2025 06:25:02 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365d116d8fsm577295045e9.17.2025.01.06.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:25:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@arm.com>,
	Mark Brown <broonie@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/7] arm64/sysreg: Add a comment that the sysreg file should be sorted
Date: Mon,  6 Jan 2025 14:24:36 +0000
Message-Id: <20250106142446.628923-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106142446.628923-1-james.clark@linaro.org>
References: <20250106142446.628923-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062503_883332_A1A006F0 
X-CRM114-Status: GOOD (  13.73  )
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

From: James Clark <james.clark@arm.com>

There are a few entries particularly at the end of the file that aren't
in order. To avoid confusion, add a comment that might help new entries
to be added in the right place.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b081b54d6d22..4ba167089e2a 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -48,6 +48,8 @@
 # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
 # item ACCDATA) though it may be more taseful to do something else.
 
+# Please try to keep entries in this file sorted by sysreg encoding.
+
 Sysreg	OSDTRRX_EL1	2	0	0	0	2
 Res0	63:32
 Field	31:0	DTRRX
-- 
2.34.1


