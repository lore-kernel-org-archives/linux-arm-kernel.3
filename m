Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6916AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC8yyDuL+pKv6I+/+AFMyw5Z70RjkPmelojZw3uCds4=; b=EcSsIIJjRrI5wsWrAFc5HEP7v0
	XbeUhGTbR/OiwF9Y6CyNCidI5VJ6K2YytsMggh2OHhuLo93oNubwYO2DRxKVj8ULIW+LO0P+734Yd
	5pjGSezdtAJjlfl9Fi7/cyvON0xhPXUA8lQKpVGtau0+yZ5yKpc/e/43lx5EcYbHpPk38LLKacPGG
	1JV28RQvCZZ2Y+CSQJIKO/u48vOz3Ey0bwdYK8rwS7QIwYIAOl60Ohi7ZskgovtjwM6tuGla+Cr5g
	2o3fPGr2dAVl3CN4oe+V9SqU3aXb2LFsGdqus9egCFA+StJrfpc5OSPKkcG+d8fyHB5Bzi46ZhAsX
	No9rcfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Lw-0000000CSpL-2juQ;
	Wed, 15 Jan 2025 16:34:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Fq-0000000CRel-3iex
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:28:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436a39e4891so48463205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736958509; x=1737563309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC8yyDuL+pKv6I+/+AFMyw5Z70RjkPmelojZw3uCds4=;
        b=KJCl16qsAUnxtfEdgHyWDv/ks4hZaCH4oinwdUOhw5BQGA4hu4LdUf/DQ9NBFudbNm
         vkKBjhb6yhrhflZSJDPYfp72xq0G39/uLJSsKwTG2aUf6j8ID+PREfhRe70j/AiqS4OC
         i56kTgJvTcjJyBO3WHwaiBANjkEFs/TcqzhKCvqvIojnY9BwV4a1x2XNXRk9xqa5qRwn
         R1QSxYC6Ric0F41YGR9y+zQypNA6hFE+mEu7If92nqNGz/IkLqaJn0C9e9x7xuc10mzE
         PHZHAvBZv++r9bhrqgrry9eEcir8LISaSPWhQRqA7byam6Q/gMwuPc/Yr214FPzpEmc1
         zelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736958509; x=1737563309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC8yyDuL+pKv6I+/+AFMyw5Z70RjkPmelojZw3uCds4=;
        b=lD59mHxrMGr/qyPdLhbtiB1D2SUlEawSlFoKM3bd3bINhlb0uHgIXD7wJhijQDd+7u
         GU/V2jsj58hYA6Px3BCAb5sCMDUDtWKfDiYLLs7OAHPtQgKexUKqrewA0ZTx66E6NpAp
         AgzlsRoXLsNZ95kh58UXBkdvYHw9AkKMl3xUktx7owAf6GjTaWXvcsfIqa8TF6LnvRok
         eXeF8QSjTunDKeOIuxmxL0e2GNS4vaDuz3RyhoYcDCHamk0dvtq3g/aLEvLGGJw0KRUb
         dSoKMggAlx0kXeCmXdulOvfgUGK26W7y1edeu2yTCiRu2XP6jRLQeqR0Z8uv4ZzTq8py
         JU/Q==
X-Gm-Message-State: AOJu0Yzdxsdk+za+4udJeC6NvTh36nnwF5AmTW13syXt51+e+2CwUfCQ
	Qw/ZdBb+V1oDlKP4d7br5leIpIq2WFlqfj6gT6gbhRDwWvGQcjbFpcLOKQv5kW86aoNNCbhlQvt
	A
X-Gm-Gg: ASbGncu+pAQ06WXuScdI3qRk9RO+so1sToDwZe2DoY9UMMffK/pMGKRN7B5sLsl+gQl
	TlQjGkY1pwYo8mT21m+6SUNvTNgXI+e525cdx1JCuN4OXy7wCFF28whvqHtVXBmzWhNEYlHYM0o
	FyUyNwgYn/MCH5CTW6k056Ya7glu2AEy3s2RtuQGnHwerB1PJq91R5masKOhGyWhccjKcNRTtAQ
	5CZLW2lwm8iUbAPwju/7kJgS5em0DZ3Tfa+Qd4Bcfh+Ptt6ldBmkTo=
X-Google-Smtp-Source: AGHT+IEeGOszGXKxZCV/VGzxwoDAMD5c7XL/BYl8fs44YnKjTM59nKZ3+sKi8wyy+Gp/hnlDgagt3w==
X-Received: by 2002:a5d:5848:0:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-38a872da434mr14029155f8f.13.1736958509113;
        Wed, 15 Jan 2025 08:28:29 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac61csm28620115e9.14.2025.01.15.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:28:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64/sysreg: Enforce sorting
Date: Wed, 15 Jan 2025 16:25:58 +0000
Message-Id: <20250115162600.2153226-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115162600.2153226-1-james.clark@linaro.org>
References: <20250115162600.2153226-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_082830_922759_A51B0E3B 
X-CRM114-Status: GOOD (  10.48  )
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

Make an unsorted sysreg file a build error so it stays sorted.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/gen-sysreg.awk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index f2a1732cb1f6..03a4886524dd 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -98,6 +98,7 @@ BEGIN {
 
 	__current_block_depth = 0
 	__current_block[__current_block_depth] = "Root"
+	__last_sysreg_sort_val = 0
 }
 
 END {
@@ -158,6 +159,12 @@ $1 == "Sysreg" && block_current() == "Root" {
 	crm = $6
 	op2 = $7
 
+	sort_val = sprintf("%02d", $3) sprintf("%02d", $4) sprintf("%02d", $5) \
+			sprintf("%02d", $6) sprintf("%02d", $7)
+	if (sort_val < __last_sysreg_sort_val)
+		fatal($2 ": Sysregs should be sorted by encoding")
+	__last_sysreg_sort_val = sort_val
+
 	res0 = "UL(0)"
 	res1 = "UL(0)"
 	unkn = "UL(0)"
-- 
2.34.1


