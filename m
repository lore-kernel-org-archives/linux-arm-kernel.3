Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F314C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrXdUoo3RbvjWrVbpwGB5q/E3xwWtlH9v1ztr3x3IzI=; b=JgbmIVjTsdokwex9aN8vJIPGjF
	CWWJJMyA0GpE0IuijSbHCGZDbXKZ3B3qjDtGjxINuA8OkV5FklZV+09P7Ab+L3t0CwTs9tw/5tH46
	B5fFoaouqO059ocFo+J0cmXipnZ70QcbacoY8ZsH06SEgbQc4MyvV8n2nyFfElJY07fFVnjBU/YY8
	LfxllhgZ918GTHf6ilu6nFSUw0e0v/0xtrFttTYQEJ1w476bDVBcC+PyQ/bOso642ck7ae6bmg2yW
	7Krs/wwQwwbqZ3DXH8Q4VZmk0VWHmIGMLZdYi9Lf1nDuVYQycbW9w1coapvSijb0jRys4bWhuSBxH
	Hb3kMmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCoH-00000009Fuf-0R71;
	Fri, 25 Jul 2025 07:25:41 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCb9-00000009Eav-2tn0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753427527; x=1784963527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GrXdUoo3RbvjWrVbpwGB5q/E3xwWtlH9v1ztr3x3IzI=;
  b=RSm8av+W2sETsbXvYFT7lA27il+Hxk/rijfkglfkmv4VQDJV8j7tCOhF
   3PTaM8or/qbKhTzznDi7r8Jxx4E7lkaWKaftYwYlMd/kmyYslfoH9lSpP
   fktmcgczh03wiMSbfLi3SYRfhHCwY8dj6WFI06KYKpmLZ1IM+Ub1Pya7j
   oNYjHbFUTcmlP8qMyxl6VbA9QGhp6hyPA9Vh9hNW+1Aei8ZkRsA+O+IWn
   qi0ZKRK6BY9xUBW2Ssx4TkqD7Qxicc8hZTbc4Rjo1r7FEIJ1sDCk4ujbI
   73Yq076X5H5bMLsB+9Lg0hFEpKVBnEnNd+ZSQFMroQolJ3tmwDcRmkGdd
   Q==;
X-CSE-ConnectionGUID: PUeZ/PeBTLKcFpfSm1NfZg==
X-CSE-MsgGUID: n1srBmqRTDaoZdnB3XGiiQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45414804"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:05 +0200
X-CheckPoint: {68832E45-29-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: E56E1AE4A9F556D2E0DAF917D46174D4_2
X-Control-Analysis: str=0001.0A002116.68832E74.0030,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF7E01736DC;
	Fri, 25 Jul 2025 09:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753427521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrXdUoo3RbvjWrVbpwGB5q/E3xwWtlH9v1ztr3x3IzI=;
	b=AcJJ5dDK/MkVv8P4tMR3e1nS725P5GBzgXIrHgCdiTw+JAgSTtWW/c27rcx0kH6wScZxG+
	7yCuo/fU6l/3ZhX909b/fozd722BPEAj2yOSKqEfEb8f0JGx2pqW31HLoKiCMnYncWN4lM
	Gv1tT1FO6r7W1RIBsJioNpaQQurVGfeKhndbch2isc8YKCp/pv0/F/H00Id7hmvlPpw5Qa
	yXy9vg7kUchDgiBZVaSx/G5ZfE73v0T77hUL8J44FsMoWonj8Z7l90c+WdrN+eFzZA78dW
	l3GHTtRPyId0s5xWQ4MFERa+zVKHlhz3xsMjz8fsj5rQwpoODINZe6WgHGy5jw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] mfd: stmpe-spi: Add missing MODULE_LICENSE
Date: Fri, 25 Jul 2025 09:11:49 +0200
Message-ID: <20250725071153.338912-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_001208_039657_CA9757CF 
X-CRM114-Status: UNSURE (   7.95  )
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

This driver is licensed GPL-2.0-only, so add the corresponding module flag.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index 7fee64102cae7..dea31efface6e 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -145,3 +145,4 @@ module_spi_driver(stmpe_spi_driver);
 
 MODULE_DESCRIPTION("STMPE MFD SPI Interface Driver");
 MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


