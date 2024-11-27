Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76113D609C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA9dViqKYqwFBgszUeA0NVjaCyBCvEgaySoNXwjG8Lo=; b=rvU82aXEXfuPBnGefeILnNLrD0
	kkFLwJGzGPFJJlQgaEapNd3u++ILjrHCxtbf62qRbARu4bvRuCC2AO5qFe2zygBdwWvvt48WExtb+
	pI17V7JBlEx35NjBM2cVb3c3aLY8GhmC8PD9AfqKkKSyctemE/3Osz1s2jNjnwb8x/GI4BQz4SdgF
	lxqdVjehFHIapnmM8bcdzY8SsD7LY9p/s1UZumYHrWfnxso7wVdp6kQj0SlNDrYDFYGEzIR5qPxiX
	ouTkt9VLuCAtZvshVol5EhkCXHHwxxsoyH0ibGwQu7bMjK8lMypT4N1O5TQ/BDKWI+BJn1KMOXy07
	Y3BSHBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEvU-0000000CmXG-30Qg;
	Wed, 27 Nov 2024 10:05:40 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEs1-0000000Clg7-0UQn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:02:06 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53de579f775so4194883e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732701723; x=1733306523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA9dViqKYqwFBgszUeA0NVjaCyBCvEgaySoNXwjG8Lo=;
        b=iJmqGy9mEGsFxnj6xYrQ6IR7U8cLzX4v0odqfnTVZq8Bmqy0JaNVPENogKA+bHDZPg
         oj0xhuW9XKKN5B/JiEECF12OX5KFE3xGnZBAFkcAQnazzZ0V7GQB/fx5bRS5j1JM0Ja8
         9nS+3VV5PuDY5ArzH+o/l3PZYS6FFHS8h5TzqhjFeY1IKZH9uasnbfbCR8pKVE4jzo/Q
         C3Bp94EqIfBoyvWJJZAS0PuUMHwJovN6IdrcIEU8f6Dj12MUa12t7ZyrKWtnHfYApw4Q
         6H1t9wrn8B3TT1BG3KKnerv6l5VBHWTw4R7zSV6Q6Ui9ezYpqBceMXSBRSjwq4k3sg+t
         roMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701723; x=1733306523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA9dViqKYqwFBgszUeA0NVjaCyBCvEgaySoNXwjG8Lo=;
        b=Am0XWV7VJhhkBwHDBOXqgn+NaR+66SSamFMsOCe7DDi2CeujaqQvyUf5IRky+aVivL
         i9iJxJQdOurlg0xBpqbW4ltt2xm2ewjmZnNcQp7Q2WQWL+ayhWJOQob5AUHM5L6PovaO
         pT0zae1SIoKpVT7MiWAu64R4qy/jWZhTLOmvfWdNdN6FXHnXWbBZZgVWAQgOw2MTlTUO
         sLE69k9rAkUibdbS0JFD6TQUcMIflORUVGZ4NmuzBBVwbJFOaxeFsSe0zfdqPcPfpWre
         dEE/d0GaAUhh1Bb6sdGevnBHZiTdyH3BUt4SetnwJ0eYgx0733U4+wata0Cm3TxoAEBw
         X88Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGa5slPcTY1TpVRTB4jMWc5WgcbIppQEHdqj14Yk5TRX7M9LG/bz9mRCzZJuLo0EOYHgI+oNWHXGdAffgSWB46@lists.infradead.org
X-Gm-Message-State: AOJu0YzVtsYNHmWNhdPfcrMXuKcFF4nJSOuzDPsFBov11d1LI2VdSENa
	8XdMYx6EFvTjZkmitr2vY0eQlfXU3PMl/pEnRDq5Gu+g5K0sx+4B8hi2HwPkn3Y=
X-Gm-Gg: ASbGnct0EoVzdrIMwZulix+QUSr4t4qTSNz7oy8aBVa26jMkQOKNl50/2UyMDV5dPeW
	8ljyw/+rkO/iBkbS8dTXIC9MXovH+2V3CtfS6ZM6FaGuRhPTMLRYQMVJGVVwpOEyMVZkrpoXSMj
	uf233Uvt3c8gzzPvY6cwj8h5i39W6JvCi1eaIX5lB1jO60b8ZTIe+jw95VG9kXlSQsHxWqHEOKJ
	aEuNC5BF6l7X/WxjVpnXORoDsGEUPXl7+Wx52YrvPoOtMejbA==
X-Google-Smtp-Source: AGHT+IHr6cIPtse8uoTubAv1bGLQ5YJFJMlo8fFp5uzleSsgFVzX7cUspnX76HmoEaHTdGlhoc+IPQ==
X-Received: by 2002:a05:6512:b9d:b0:53d:d3cb:d90b with SMTP id 2adb3069b0e04-53df0117178mr1668132e87.47.1732701722968;
        Wed, 27 Nov 2024 02:02:02 -0800 (PST)
Received: from pop-os.. ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa547ffb152sm421887466b.62.2024.11.27.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:02:02 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/8] arm64/sysreg: Add a comment that the sysreg file should be sorted
Date: Wed, 27 Nov 2024 10:01:20 +0000
Message-Id: <20241127100130.1162639-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127100130.1162639-1-james.clark@linaro.org>
References: <20241127100130.1162639-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020205_156188_A54D37C9 
X-CRM114-Status: GOOD (  13.23  )
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
index ed3bf6a0f5c1..a26c0da0c42d 100644
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


