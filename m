Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C974AC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=; b=xg7NWkCdR0ta0XpmMWlm8KGhlD
	71amD8ixFHp2gbhBxmVOOVGlVeP19Nr4JFbmYc5InZtPAzkgJcnPmdCEdGy8jzqeRkXLFTO967SGf
	fEx7EenOHwVWc9hdFBG9hD2oEMGTCEvaraoIymCJ6MRXMlrWSm+fkjNuz09k9rKXwJFzJS4G2MNYK
	1QxDONaJ9b16N621dvSHq/wpVe24grbxxvv45qN2Swu0e7x4GKLSWoYct5Cf736wDYM7T2OC58z3l
	X9vjQMhFaWMSZ0sDdHZaj+Z8SuFJa5DyoWbLGr7WSdzGuX2UA7H0YClPJ8k0DHhT+MUYk8I4jmlvH
	7k7VPfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cSf-00000008I1j-0zul;
	Tue, 29 Apr 2025 04:20:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btf-00000008DFi-1j4I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:40 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b0da25f5216so3490054a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898278; x=1746503078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=LZgSG64KiRL0MplR6yatsBsekO/f+K+BPr1Bzg4qwu1iTnPcZQwOWhN2ckfSfUf5jt
         gmILA64RgACi7Iw7UPDzMKBeSfDeQ4nvcBSWoZGbYerrYedRDgX/PEfqytW3PeYwvRxd
         JzW516QVHgLZxlKRQ8G3IJ6pK4FgetbQxe1wkJB+q+EOg88alHTOnBRRSWTaHismdGSP
         2ctVRX3TW1UpUVUEATkouRM3UrpDJ6J3fN1QlfoYvmuRr2kCpS3sqrbpf1Nl1rAvGkKK
         yj0tLGxg0wQdR3bAkQc3RUzYcK1Q4AwCaOIcIBMVNO1aEeV8R1ZSqNV5CSz9dXH/l0tk
         /Yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898278; x=1746503078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=jZFT6ggMtOGYVMburUG0EyLSbas2QM3f5lnK2UgQn42F9loTQuzcO0F1QTiBL5iUbn
         6xNsFQGPguQuY+fSoHda8YWpbmN1rNPjeclj9l+d3nbqRb21C2F9zYdbGLERNEXnTg3Y
         kQlaAdkA5l596ijyGIdNvu4QQef8bijvtE00c2K/qCFsw7gkKie/94DFDvbJEgEbNDgU
         bTh7A5QB59blpPeIY0tGlGTuVWVy3Z00lX9vfsto/EZqwyXdzUEodm00pgHyPYYnfNFu
         84TmxybeD/IZsJW9jgjBE19+g/ivXC6x8wp6EEjoAw1TZ91RCyXdwBj0296a1iblmojb
         LQcw==
X-Forwarded-Encrypted: i=1; AJvYcCVElgzL/bIdw5mwZJzsRHSsLc1i7iMVDmNRkudoGm6DRQdpmVpAuUzqsv9d51AdG0EE8HKmxY6JGTeLBytiWHTL@lists.infradead.org
X-Gm-Message-State: AOJu0YzojNqhhV3cuveMBXfnGmZRe/5Qut5iYYm2u0WHnWcQbxVNf42N
	SBDEErazGF1UmWJjd7q4FN3SeX/hHwEyljee4sXX3smnN/7ERw3k
X-Gm-Gg: ASbGncvqWPh7OI2u9OZ5PnxUv68DNDbXPtuG4PyBirIiqBRw+RjPQyOy5O5tepMyCoi
	KbKKJ/3C1ScwmhMUA9tgD94AS7Xgo4/V2OBBohjdG2pH1duU6Y9eH9l6ppOCuYOkvNof2BBVG+f
	QhxqmxVyg+Lw+xcElUTm5NjmtXxP/A4bFJeJj1a6uX74MtFpXZkBKWsE6Q6QWx0kxoLrmvR7quL
	XZdHKkFOfpWCOHDYebmGgGwSwYFm0I3XFWYlWtw7g60skX10Km/gfrmQ21sksKzwvnj7D4fy+O8
	sJj9sCTBCgHqy4+0AF8RvWQuU2fqhT1OdTHekZdR/Ul0wnd03WXkPCj0aw==
X-Google-Smtp-Source: AGHT+IHxm8rT1uzIKYd3ADrbL4R5NMyjZOGRKMbNAB1/GXp9S82eG0nLY3UcJaZeQW35JAd4gGlOqA==
X-Received: by 2002:a17:90b:554d:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-30a0132ba1emr16578615a91.20.1745898278562;
        Mon, 28 Apr 2025 20:44:38 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:38 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:42 +0800
Subject: [PATCH RESEND v6 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-18-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErlqBnZpfNvEc5aUCBu7KHe5SloQqmhqGvfE
 tbd8L938H6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JN9jD/wIdllTQLa6ubvW3FYhSvEAW8tilwFBI+z1bwHry9E42ry4qJ46YOeEx/l5swDjNm/hIQD
 0U9VCXRHRMVc/7OUpM2QjGef7+PJJfW8AH/tIk1UVsXshS2w4bjhX0nCsHFuGCcABnnPmpSnyhB
 8Pt8e9wtlMBm067X899femotFvjQAXUdywixEZYnSPfwUDZXRmayFOcsXyRsAuXhoY9SAv37x/a
 M8fh39JtKEG9kJ+sUjbCMClMGpnbVpd0fs5wRuNahh50wGIxacXpfLnwchguFO1cwTOyq/3Rnnb
 avfDG1XNveZOTty65LDO3+bdErUSJhR10if94vy2kOxhMMHYApBl0Snl1IBXFZKiBKzjrLcmyc2
 6ShcYQl6V8l/JLa6flHDYJKnosKVRTg8blKDjcInVRpKc+4DO7M9t6IZUaFSLIEI1MJWvdtEQAA
 TkmzFUN5oy/wtfZgY6fGqLg3NJ1QkhY92DYahM3Pcc+EagP0kklU8jQL9SNBspIfjWiPKwhb+xM
 bLAL8h/zgJZp8F5tC2DuHY2Zsy1bPsMR61wwsfBqIQMRomNKL2uc6EXCje7pCbcG0NFHzjA/XGE
 PlRM+kh+WShS9fcLMugbZQX9WOFN2mHNWRc+O3R/XfeHDsseT8U9PneTBJTTdJaax9yJ5PuG8Yx
 mxmYwJEk3r8LfjQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204439_453081_767F0E5A 
X-CRM114-Status: GOOD (  10.04  )
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

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6..cbffc84480379cb476d5caaecce91f746e862354 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -243,6 +243,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.49.0


