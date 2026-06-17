Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E4CD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dIbRfd7aYU0GeYpTY8y8KadKkzK/q9yUDr+phGEG5vU=; b=TBxT3cJ/D1+pHOjkLUhPJzpelS
	9AvFlsQIKGWszjPXJYz/dd0zPeHLhJtpA/9OplmlvktOREyAeP+sU8MZC+oXuYtTBiaskn7aKgwnh
	YHDc7QIF8Og+7KlO7I7ARglqBiZ3MpUtIZ8BlO7A597WvcP/6te2tzTk51fXKrBY5Oc1n++8QOAOi
	+YLxBrb2A008qy00JkdMwLaYjyW8X5euG6BYEkZeCoCbpYfu3cMzik8YFpKNDANYCdZSM2Cd3osX0
	wGKyQ5SsqFFJok9VqnOzHQD94BAabbpv+x0LNdd0A0GDh5nzlPjVK3VQh7eHExv25CbIW3QTD/hwC
	3p4lg32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv9R-00000000Aks-1v5O;
	Wed, 17 Jun 2026 18:38:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv9O-00000000Aip-0FDB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 18:38:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf1f074a12so1550295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781721489; x=1782326289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIbRfd7aYU0GeYpTY8y8KadKkzK/q9yUDr+phGEG5vU=;
        b=syhgNCSUeKlbqMYtAGWaG6tMVC394/96/5AssqJGei6ALcWjxx7Nhz/9QefP1CvVLw
         m1VoQUxL3SBfUrQzToNgDB2Z2Afw2ocnkAaGHQ9pvgrccTxi0BWzIfld2vpMaEgopMAr
         p0wtLQgEZVFOoYpaWuuDxu0VdTHztnKRCQAY77RPildt2svlZVsPWUTJzbR7QGHwEY5p
         PLOeu7eFaaaLtlkXirhBto/pROPvUOMm7EhA9X5L7Em1pcZeyvNSqPVfTxJV6IS9mG6c
         5Q2NeDifPpbDZJN6Ui5qNxaWPsKS8TGJVxFkD9O1uFRRd0cyAw3vENAaxCyNnUQnDLec
         4JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781721489; x=1782326289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIbRfd7aYU0GeYpTY8y8KadKkzK/q9yUDr+phGEG5vU=;
        b=kuZbF87M95VWtLRvuKtvfEvyB4CSmHmYmhBisymWlnqOlfBebLhQaJSYtwnxz4iPzN
         5sJUMf5XVhsw0c20a9WCSdMm9WPtpybkV6P1e/5Zt37WBoZJuFo7YBRIi4Y1TKh3OQF/
         2bWHgvUNwTdHZjWmB2sbW2mwKhOmT3CRqq3GgvFs7LiN/gxdyvW5qJJtiNccpc7E0bzf
         rgTx1T09mbfGhYtMkxId3XiauQDf72v4ojDPj4jj39CvPhOg7DxUKho/dHMMykTm2fQ9
         TB/nqGIra0W2LP1XcT8uziP4iHYhHhxi4aQJbWzb60socWKA9kQBPcwlqjWm2okO8xm1
         S4sg==
X-Forwarded-Encrypted: i=1; AFNElJ8Wctna1GCbkJCFHh/Qwav7BMU9I17QvV9MbpazoG0+yhH0Oi1NtWWGi4X8jeaK7SVDJhHl9Vporc5Ym/iH85B/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu04MVzhmcRIouHhk9cNZO2Hm4wakOx9j84+nMx3bzmMLL4Zns
	ddYH2dO0eUGwnRagNPEjYIzH5XUYX3JM/Z1T9UUmnCN+ZYWR4c8X2eGMMRbnN7JGmTU=
X-Gm-Gg: AfdE7cmxQrJusfTn+8py96HriQzqPMI/DNqabLNixaj+Hs9zmv6tabSm3ScrXeKsxI3
	saZ+1QwUHwBaXlOVGoXbpQG6r/V4EcQc0vJ7d8gv25pZxwMcqIjIXAwljjdHMAN87XLHU4Tqz1M
	ww//ybD79Ztfhtq/5Ay5ldbwF7IVOkL/VMVxQf0l4Tax+bNbGTchbXIp6d0l08DzOX3/3uHlw1A
	0PE79QW/h1i/uZrdEmMDsBGmXhiMhZNgSY5BA6+8xwtOiixvV/u47ZqrhYgExNpaps2GB1zHKkG
	iBVi5BLuQLXl5X5SCPqColZL1p/hpx20beLMgavpHhYCQ0tTEyUolwOP1LbswVe6UCw3T7qoqrU
	Xj4P/J+5TD3i3HGJvs0m3nVGPSjbOOqJy1EJccqEQmYiBeQnwaKWx23ZlZLViCTvdF55W0Q6/Dv
	QTqA2ez2BfDUTr/r4ID+3PmwUaI8mLXvyY
X-Received: by 2002:a17:903:b85:b0:2c6:cf7b:d34d with SMTP id d9443c01a7336-2c6cf7bd4fdmr26141485ad.13.1781721489139;
        Wed, 17 Jun 2026 11:38:09 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1886:6b7a:3e78:272c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6e54e8390sm392335ad.71.2026.06.17.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:38:08 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: rockchip-otp: initialize ret in rk3588_otp_read
Date: Thu, 18 Jun 2026 02:38:03 +0800
Message-ID: <20260617183803.1106486-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_113810_096991_D2FD3989 
X-CRM114-Status: GOOD (  11.41  )
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

rk3588_otp_read() returns ret after a count-controlled loop. If count is
zero, the loop is skipped and ret is not assigned. Initialize ret to 0
for the empty read path.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/nvmem/rockchip-otp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 0ec78b5e19e7d..50a19b6dc4027 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -242,7 +242,7 @@ static int rk3588_otp_read(void *context, unsigned int offset,
 {
 	struct rockchip_otp *otp = context;
 	u32 *buf = val;
-	int ret;
+	int ret = 0;
 
 	while (count--) {
 		writel((offset++ << RK3588_ADDR_SHIFT) |
-- 
2.51.0


