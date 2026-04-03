Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CBED730A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 06:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBZuIg72oqCoS0RiE/oNg5MAVvQA6X1f05IoHOc1GHY=; b=L1sDWyKWo+/pSRJb8Hhrz5ZP/H
	sBd2TBJ67c6aQW8SrAykJkzqCyVESU+LTMZVxVx1t5U6iPrSCRo9mA9Fkri3bJHG8GgY5NWYPRiow
	8yr6Tf1P6BFJpY1ECUIJa7jMFE/Q1QqD7D7odmo6nzeSXj3w6RcENrkAodLwC/JebDOnk3/LQKFaq
	zQyZpsQlY91/kNgwYKLvc8pmnF1cNxwNEm5THNpkCwA4LfLw+eujtOwN6wmQLFMFavXR5pbcabp7a
	e+2pkx5H0zBYdXHPUNzRPK8MMLVw0lY7KjpIdAqC11irkE05CoSj2/2IRqvItlpZ01KI1bqmdgRPo
	KGqTLRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XiK-00000001NOk-1AQ9;
	Fri, 03 Apr 2026 06:09:04 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XiH-00000001NOM-2g3l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 06:09:02 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82cd98be655so1095741b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775196540; x=1775801340; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBZuIg72oqCoS0RiE/oNg5MAVvQA6X1f05IoHOc1GHY=;
        b=bM/wlKlQjXDY8ofCR/tHuPBvV8bQ/zoiK2c6Gch/ifKXxmlNFCkJj7GPkNO66pB8Of
         oWOW8rXXDpkK3loMBpKKTr1kCHIETZ5p59D1s1+LBpJQT4EYRwCB0tsdBHGW4HwLPJkO
         EupUB2DhRR5Sl7UcsT7089hk8dszN6eULDTWxPmLdNZI9npLY2avue5meYmn4K6YKLGp
         7GIIaNW+FtHcbr8q8qq3vObQP85/Q36UcL38B0M5XRd1UL+W8ywxK1Kdqpsfl3i4tXdL
         VYWKNfL/mEh/wr6ySDDg3Q1vQBe/d01n3U0tbd3qKAwuk9ClORAq8UwlV69KkgrzESYM
         /83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775196540; x=1775801340;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBZuIg72oqCoS0RiE/oNg5MAVvQA6X1f05IoHOc1GHY=;
        b=V8Q6BeFXudNy732Fgiaq4DOn2hhbDf/4627wgR2aXkxeqx7pxXS62Bxre4fQ3C7kPQ
         4XJj7J8jifcP1xCIENXSy6461D66LQR+RDHE63eQ+qxOaJrTu/S2g7p2JFuJb/WHCXrW
         aYcF/QJ8IOcd0299CA9Iy1fiKyFOVH1eQIn/+0vKVrxWYtBVat10XzxK8KaYibxge4iD
         xI7r1gAkVCUkC15hXElaLno4WG6r7kuRw+rHCd43FETodWwB7Is1J5G6/u5GIUxQa+Lc
         rZX/RBHRVRl3M4rm+qoKN6FwY68xz0MuvGXTS6Ojc/UXvPoGjsRxYY09yGkVNOS01YC9
         aOJQ==
X-Gm-Message-State: AOJu0YyVu1TgHnTnkXqFotKu8cCK4Hm6m2sN2EJWPvxjghbUz82lgOuL
	LJWMJG0h/at3qT2sa3A2e7/i2649oQEEqB/ELArIeDlCeBcHwx1mlLQ6
X-Gm-Gg: AeBDietdf+1MTjaBzm7yu0BseAlH+oNuvUujmjETEFzvBrGYVFAEA+JINHV4Z/8z3K4
	NM/mb2ADG0/PkXVjjKaSh1X/Uzoj0UePKJsdxUXKoCqUaknzUxqoBYlEPUwZpS/RjIVTtt2TWmf
	7NrIGLuNQXXUiTqfMR7Ow7TdOvjHEsIlWD03okjgAx1ilLy9fBkVaeh0vhf30qXMBhJ0+/MUGtK
	AtFujqla6wnbXsougHdrNssNVadN/XTq7Cb6ZEzI5YsH7z3Bhx2NpH9eqSq7G46YsUSnaz/Rl31
	h6R9ERcm98N8iRqACxsiQDEIDhIDFlKcgFrvwulIxsHy/a+mKivzsVUy7WO3naCIWFDYoO5XSJP
	ArZvWznTExSY2+LpcSBO81gUwcz0cVZKWsexC/w2kwUN/FGYKEqMRLKzv/Mu8DeX01H6zlYWZcE
	b9KSuYhMRjMwoxam3G3Hk/gO2LVjG3LzoB2Vm+FUE=
X-Received: by 2002:a05:6a00:451b:b0:82c:24a6:1de3 with SMTP id d2e1a72fcca58-82d0dbdf0e6mr1970192b3a.54.1775196540067;
        Thu, 02 Apr 2026 23:09:00 -0700 (PDT)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3dc9csm4778734b3a.20.2026.04.02.23.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 23:08:59 -0700 (PDT)
Date: Fri, 3 Apr 2026 15:08:55 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	austindh.kim@gmail.com
Subject: [PATCH] arm: kernel: add NULL pointer check in early_mem()
Message-ID: <ac9Zd3K+PQTGBZAC@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_230901_700551_17459BE0 
X-CRM114-Status: GOOD (  13.93  )
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

The 'early_mem' function handles memory-related boot parameters.
If the parameter 'p' is passed as NULL, it could lead to an
uninitialized or invalid memory access during parsing.

This patch adds a NULL pointer check at the beginning of the
function to return early if no argument is provided, ensuring
system stability during the early boot process.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 arch/arm/kernel/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0bfd66c7a..b718a7df3 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -830,6 +830,8 @@ static int __init early_mem(char *p)
 	u64 start;
 	char *endp;
 
+	if (!p)
+		return 1;
 	/*
 	 * If the user specifies memory size, we
 	 * blow away any automatically generated
-- 
2.34.1


