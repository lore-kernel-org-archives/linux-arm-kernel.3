Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E445FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 21:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQCwDq3sQ26sd63X6ePOXo1fZCw68NQUIbjTHLE+tbU=; b=b5CGYzc0H+73vO8p97DfEeO572
	Uz44vpVuIvWsn6KEMzLKaPftsnK1zLh+vZeacc8ijCPkDlhlvei4M382lze0AiiI5JB1AmftEycJv
	4LjlARfa5wO+iB21Ylt/qCmhlvPA8m75JVZoHDFw6Jtm+tLIX8Fv3hYG/gdXzpysY5PBn0iFNzAmw
	3U2Ri2iX1D9RVac/dEHNyPuMXBhRd3kOgBt+qWSFxQJnR9KnU3eSUTeFBUq7jMeECB4PR1PgNmWec
	faNJA+yk9if05Hdj3Glv9piTEhSvHxj636rfGlrfoX8XJwTV2AobCBqPdmFdjVhAJrzR13Dqy3gBm
	5YsMffag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZBr-000000060XQ-2gsR;
	Thu, 30 Apr 2026 21:44:59 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZBn-000000060Wd-1How
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 21:44:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f69a286dbso997925b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gapp-nthu-edu-tw.20251104.gappssmtp.com; s=20251104; t=1777585493; x=1778190293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQCwDq3sQ26sd63X6ePOXo1fZCw68NQUIbjTHLE+tbU=;
        b=yjGJ9WWYP62kR0a72OMmo5+b3nnrk8DCzvTfOM8dYhYz0LhWkw+t2RL51prl7Fbtvv
         jY2BMTnYN/6JGMDYPe9zU/7k14J37Ye+C+jp7rs/vavDNw6oQzBa5czmqEY6Grk5IuHp
         mq6pUwaaTiYu1hJwh97Ixe9Z5ELRH+7BGAXifIU23sjA/kRVMLNWyDyztDzl5pPF7beM
         ERQE5OE0F73ctGnTsSM58RDkg9K7bC8c2+utUKpaUXMn90AVKFxNiCFODKHuUuXXcAAc
         ODFt9Mn3WQdWpQxdfmSD9qvP7c2Z2L/krwv31ZF1iixXh2ueIm/YYkP6hTb6N3MO+X9A
         9r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777585493; x=1778190293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQCwDq3sQ26sd63X6ePOXo1fZCw68NQUIbjTHLE+tbU=;
        b=BzCIY8Obydq0rhoesSO00IB4ggOpyPIFGEf1mSosk57gHnjpOIsdL5dz+RLqEYafdK
         2tjuAVTgRfzmjxe7IVnRl9siXxur8vJn8Bx2dnkrvvghjzTBsII0SA1IYFNg9IP/CV9T
         BQ5o4LDNI+kcw3s3oG8pnqaGDZfhtTSUB/9z99Tp3sq8eR+d6mVpdgo2KlW2IJEcxoQ9
         I6dZZ2Xj/gQFxI/g7P/J5T8NCAA50FuinEMfGKKKCwRF9+DCohCgFRchx04ni9Jep4/b
         1mjg4qbGb4XUuzepCttGW+sGBW63bRau1zM/OJIBeJQSRimNKmDvnEh7s3cJuBEBcd3t
         RFew==
X-Forwarded-Encrypted: i=1; AFNElJ91o5UrryzfNhwjujE/8ZWrGTH6NRY71RYYFfnYwfA3+5KIKX1hfhPc/dfiyEtmkKGopBd0Nt9o466VVeo7KIOf@lists.infradead.org
X-Gm-Message-State: AOJu0YyJoa932PsAkrDjR5u73V81kSMbP0I7H8dSu7tBgRu4yZBHy0Je
	V67/V4irNvr9rCyc4EamJQelt84q4Pd/Zo6NAmOSJ+PVTNBNsCJYOkr/ay8IQDbXEOE=
X-Gm-Gg: AeBDieuDtQNWr4/nR5sug9i5gGqv86+PeezLVkTD76t/HIVe0PBHx6WOtymJ4/fEdiX
	tYaYhTNfiStvwW7J34N/pX+FylFOH3lhxZb1m+BpQXXnA/cBpZCSClMml/0tdegr/NWONtR4bBs
	aQzhwcNuljGKgFNjPu8ad4h80QwP8m04MHq05nhfTrr9gVLxgeYXb/AL69ir8uRf4SM9Db9OI8A
	7a1mDIltKCiDNsDbXQ+gX0cmoVOee2uA5ob6anuyufkE7HFKxa2EhDUyC9m2pf5p0xvuKOIvKv0
	c/9K10Ge0u8wjzLxnu36LFtjWLYzXmgDuwVw2Chqgb07oAI70Vqhnz9+6fXUZ+GnCMfno2rEQbT
	4djXfBzIVsTKzMcKCkh9ErGrmaYqBBcjkF5fGTQ+o7pT4XwM5c9MKh+KOnqbj5Rf56TcEb8Z5mr
	JFQO6RfPND1xC5EvnRWqUnA+XhHuUltzJnM4XSIwwSVFPY/XMoH2NJVYa3EL7NcpaR/kBvKpAe0
	iINL7q6E4fv+wOyyefhZPlBg1ahLmjs1Hrm7+8aQbeaQ8rXcl0GKyUwd2k1+ybN8JxcUlXF73s=
X-Received: by 2002:a05:6a00:3e02:b0:82f:8a29:e3e0 with SMTP id d2e1a72fcca58-834fdc670d2mr5521973b3a.42.1777585492724;
        Thu, 30 Apr 2026 14:44:52 -0700 (PDT)
Received: from tomato-cultivator-HP-ZBook-15-G6.. (2001-b400-e3d4-7301-ab51-ca4d-694a-59f2.emome-ip6.hinet.net. [2001:b400:e3d4:7301:ab51:ca4d:694a:59f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b864c7sm640774b3a.59.2026.04.30.14.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:44:52 -0700 (PDT)
From: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
To: eajames@linux.ibm.com,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: ninad@linux.ibm.com,
	linux-fsi@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Subject: [PATCH] fsi: aspeed: convert cfam_reset to DEVICE_ATTR_WO()
Date: Fri,  1 May 2026 05:43:27 +0800
Message-ID: <20260430214327.17099-1-ku.loong@gapp.nthu.edu.tw>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_144455_595844_58F10FEB 
X-CRM114-Status: UNSURE (   9.87  )
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

Replace manual DEVICE_ATTR() definition with DEVICE_ATTR_WO()
for the write-only cfam_reset attribute.

No functional change.

Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff33..3b4a0e821c08 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -462,7 +462,7 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 	return count;
 }
 
-static DEVICE_ATTR(cfam_reset, 0200, NULL, cfam_reset_store);
+static DEVICE_ATTR_WO(cfam_reset);
 
 static int setup_cfam_reset(struct fsi_master_aspeed *aspeed)
 {
-- 
2.43.0


