Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFE7C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N98bRx6q7lXxVKSULoDokbYLr/zTNPxFyy1davZZZA=; b=yvh5dtkFPRItx/7a3JUoHOJtCi
	plQ0qKJKA8+p1Cokv+tmvPtfJ4QyjpZ7FtJdCYLopGkiCdKbFYqbHxek8V9z2eRrsMomn3Uqs5xva
	ejrrKGJgqiBskhbtqg/8mxPys4+3x6lmKiKspGHRDuO02E91oAmTJBlxpRHMxHr2navLUV4FdprJC
	uDCqNV9SwL6wsxHBsELpoNNrnBfQdWblBpGP/gaOj8oQgzuqtsbnEJGssEPL/nvMDUNGwh+GWa3AQ
	/NNAZy5NyW3tgxmN33yHVAhSrJKpBv+AHCF7s2xs9c5ffOSki03Ed3hFaYJTRXeAINLbK1rZ+hhEY
	+7B4WZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RW1-00000001jkP-2rWT;
	Fri, 04 Sep 2026 10:51:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RVz-00000001jjl-4816
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:51:25 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc149372c14so540280a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519083; x=1789123883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9N98bRx6q7lXxVKSULoDokbYLr/zTNPxFyy1davZZZA=;
        b=tMiY0xItzr7n/3x6PBnfVhbW9gSwPZYmfdPj/jPdZFrnYbLqG10RuORzXFKd8DmZCq
         uz22b8Hri5XoATmeZTQ4SSO1c95NBb/QBE/5Gj0LBotffk4436uIFZZNt0bIJE8jVlIi
         zGFcIai3SOyaDKrBWVuAsvRc/brKYKa9RaX261Bu+BEzGQsqvJxFogCcp7iYdvSmlzsG
         1CBp7ekyqZN4BBS9syniz+ahdkUUImhRiLtXnoLP6uZZUcAMSxHodGlRwTVopzsq7YxB
         IJMa3b4lRREonnhSAMFQ2BdklLfstK7nJq1jOu3+jTGZHzWCOmeYsAu2TMZQtGXVQ1hU
         aHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519083; x=1789123883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9N98bRx6q7lXxVKSULoDokbYLr/zTNPxFyy1davZZZA=;
        b=P3vLUkVJ12EImKOqliBznM4gNTsafZOA7YUlXDiXRATOVBOd6YxRk+bBSjxNSZImS4
         p8dMnxkBdTx+d2WY6ArpX4b2GqCNkp260JYU6It+rOGjhhkr98FA05dzHdJL01XMzuIb
         3QNoduy3AKnwMhPXjqifrH5ECUW1ITmlnPs4jcvxBFa8J2JO80YWwgKA2n6P/z3OKAd7
         G2jpjCe3besLh7r8rFwV2jCmyhf224wbeX1JYJ/SQf0Xc5uKIU3h9XhjybCVZjdv/fJE
         KRbkOUUbCSM9eJfBmHCSfmb5B6p3Uh2F13cYzndkyDgCVtTrd+SosLod688RL5W2mUQP
         heAQ==
X-Forwarded-Encrypted: i=1; AKwUvByUOuPbkifovUofwEJce8GyZChorseB9LWyUp9Wv6Sagh1Yv4JXvvdc8IwssGRGZTYIXCYUHokm6OovvoVbXo9s@lists.infradead.org
X-Gm-Message-State: AFuF++mMAZcQ1hTMkYOaxdXJLQlxKrrVKe159f+GfRpV5KYi0DvIKCbz
	vkc4zHFJsVBcZY6qBaimfX2wCV2drEGybJiZ5a2r94P4zhUxg3LyRswr
X-Gm-Gg: AYBFou2P5N2JjVse3kQKcptSuGKrZmMghHMJ1o2O8gnO4xmOBHVZFoGMigTIYRcHuCO
	vMBFH5DPmn7YWYwABxmV5aZOse2NJrb+jdG3uVjVtX0ExWsUeoX5GfXsdTh2vxi4tzFKz4U/S2y
	oZumEfOtncSzabVe7WtZTxI+VYvRkCoBPSsEiXjsVKHgt44bFTCChyupobAwYQ1r0BGyR6gV3lc
	R2eAsV49DT5Xnu/zHCR6uUERMbpto12+Nb2+rTT9ZlcVdSjnepwWs1SNexxwNzNwM9IAXj9yY+/
	Cvt0sxTFpzE+gi7T1LeUaGMyaYm/EXbQ028taFwqp5UQT1rwpeffLnkKq+8GDO2uuzQwuOcvoXZ
	VEwpl1fbhlf0hvE2yeAGH6SOvl+vYhiEDiFm8QY6aR1wvFAeUHU28G0Lh8uxR6OuESdEYK21AnS
	6tYhzdOJMJai0J4pahG4ibjO598fB1ckZ5yrICiTEKrmO2yZd9LeCziz5ES9+pP3UrHIbCdLt3K
	vUWBlTXLd76qoo=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr8131337a91.16.1788519083168;
        Fri, 04 Sep 2026 03:51:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
Date: Fri,  4 Sep 2026 16:21:07 +0530
Message-ID: <20260904105114.29474-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035124_052217_BC348E90 
X-CRM114-Status: GOOD (  13.00  )
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

Correct "initalised" to "initialized", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..0d5f8709a5f5 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -588,7 +588,7 @@ following manner:
 
 - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
   property in their cpu node.  This property identifies a
-  naturally-aligned 64-bit zero-initalised memory location.
+  naturally-aligned 64-bit zero-initialized memory location.
 
   These CPUs should spin outside of the kernel in a reserved area of
   memory (communicated to the kernel by a /memreserve/ region in the
-- 
2.48.1


