Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A75E98FDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnMwt90tZdLhUcmansylZxSn16czFlGhAOWsPwKd9Uo=; b=ALgZlFpOjpy4SNUsouwlYuJevh
	SehA+O5NZn6rvJJyQVZTVzqqVZLXN7szVJJlEdzfQzA9s+Xy4LttAAUVqGd5nq2CIbBv9skLRM7lR
	nT/U5xF1o+z/j4oiBoU5gDfRu8fzveb+FQGMgvutBLReAJQf6glqiMMNZ/WmnkcmUPFV1Y/+08qYY
	UamW2yBOYJ9XYzSNTGV7Qb+05U1FYN5wjrYDCIZYe6fD8RShdX6SmhsWeKiLMqneYcsZAQNDSjo+X
	Nap/eXxnBODZ+r6R/CdszsFPMtnhDhobIyomwnCH3lmsxPbeSJClj8pwpTZzK/fDMJ57d/sJNI2bJ
	pJwvucog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsBI-0000000Av9R-2axt;
	Thu, 09 Apr 2026 16:24:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsBG-0000000Av8u-1ySF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:24:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a9296b3926so6534825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775751871; x=1776356671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnMwt90tZdLhUcmansylZxSn16czFlGhAOWsPwKd9Uo=;
        b=XlJW+lE7cOQS0hLCDRBjsodcfuEEdQh+2jxxSAkmm8x9KJy4u/qa8bb9N1rJ+ELU6Q
         wFIpMR0cAJw5/KSSfpGYYo8XaUh9jI5aYDnv6cFt2FyMX4hx2lDk98U9STuXYaoBSbud
         hbEqiSe9gLBxR+oET7kXlrYTdwvXhchXKXjPZMuGBeTpMgO2EQnTxl+bq2SEYdgTQk0Q
         CsdYvTzpUQB05BekWNzpAWITnDohD7xAank3x57ehv9JfKxn0WIghSfX3RSeM3LW6mVL
         BPFQNe1yePJ/d2MNTs9T7HmxOaizlJX2/7SULGCQ6BBosWNTypGPj2LLGKAtNk6isZ4R
         i8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775751871; x=1776356671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnMwt90tZdLhUcmansylZxSn16czFlGhAOWsPwKd9Uo=;
        b=JtEGC2c4wbhe/NYfz/6lWH306E+RwZ/qzKJ+eYUP61WF4no++w8/vkYAVw30nlPIXq
         ds/eCBQ+65xCviF4kpg326ynZ7VLDP8dWc2lORPQyykZxUbYDQ12rJdXPOE0L6AD1Jsa
         slomnT/d7t5PwIM1/cP0NnHj7EbVA9A55oJuIceri6Z+3Ipd00/ILQF8bYA5vhqANqVF
         9MT2e2nRuA9bTHWeWdpcFH936ZM9hpN85mTJYLO4l9iGNcJ5Uq0yMJFW6TmkAhoiZ2eR
         nafz3o72pgpT03x80PwQssfeETdmquBbMW1NMVGN0SfMLXsI7aXmaUeYuY8Dl/dGV8Go
         /E9w==
X-Gm-Message-State: AOJu0YzmpRi7Ko57Nc21gPmbPqBMQCwRTkfO5EQdPQJJSH5xFCzZ/5Uh
	zh5tPa4RGzmaNL9TYf409NZJUGmyE3PGYq4+c8mLOKtYtF92f9Vh3ikQ
X-Gm-Gg: AeBDieuiUIzlOXju4SsIslkWRYS58rEhU8SmdXwEhsOtm67vowmvvCufMR63f0jWPcD
	JUesng3bA6CzIyE/Wn5/QWecivf0dpDzfVLuMrv0W9cCzcvN3qeLT7qd7RoheuZYNQbqK/41eqe
	tP/GnL9qKQtE2OSQ/PhCQ2A/5qhpNpVOg1ca9LsdjHuYaLvcU1C71UziYe8t7YohtjdnqFrb22L
	XY+ojSGHkrFMCYpLj3NE5CqK+xyPytu4Fz2kL+YSZh1m48N/QU37FgG5nZRla9af6UJGxZ68Sda
	GvH4CviMzbp5w7hlmBFix84vran4k65q+i+UAd56DhUBPMa2PhJ9usPplFuLJRRMfzePrNe99WL
	ZDen/CY8iKT8zsblZEa3uF16v+t+XYBjBfphEbNhVl2/6UNc+gsHi/5jD+K8ZYM5A4rQu3hnF45
	Wb3Jf7swoPTx3HoS0+gz5jIDzhyKeR/Li9FQ0=
X-Received: by 2002:a17:903:2c07:b0:2b2:4697:4370 with SMTP id d9443c01a7336-2b2817d8a2emr267551795ad.3.1775751871173;
        Thu, 09 Apr 2026 09:24:31 -0700 (PDT)
Received: from michael-pc ([50.47.84.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e0accbsm78525ad.33.2026.04.09.09.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 09:24:30 -0700 (PDT)
From: Michael Ugrin <mugrinphoto@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Ugrin <mugrinphoto@gmail.com>
Subject: [PATCH] arm64: Kconfig: fix duplicate word in CMDLINE help text
Date: Thu,  9 Apr 2026 09:24:12 -0700
Message-ID: <20260409162413.1120-1-mugrinphoto@gmail.com>
X-Mailer: git-send-email 2.51.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_092434_527971_EBD1A4F0 
X-CRM114-Status: GOOD (  12.18  )
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

Remove duplicate 'the' in the CMDLINE config help text.

Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9ea19b74b..85d952740 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2373,7 +2373,7 @@ config CMDLINE
 	default ""
 	help
 	  Provide a set of default command-line options at build time by
-	  entering them here. As a minimum, you should specify the the
+	  entering them here. As a minimum, you should specify the
 	  root device (e.g. root=/dev/nfs).
 
 choice
-- 
2.51.2.windows.1


