Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0BACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvGFPcLRQG7NDdcutxPYCIPA441LFKGMfIhq/xAeHWw=; b=clrFj84Fe07wv8ZeHmBbLnYWvz
	imo0XId2kqTj7U6eua1P4BnbIlUCW493HHxyUtm0V9hbknZ99h3OIN9PCcUb5JvPvnVFXKmen2nCN
	WIc59ji3KMOSrpV2Xyo1+5/63NQ5IH7ZVrHBEWC5wGH7l+RbcLPdL7Z/7ORxlDVAQVFniQFhZzMt7
	ojia4TXspbOnP7/pwfyfyOzCjEuydJenj1ZAQv7DhcIg9ltwv7KtQvREHulJUAK1JSER/XOCuMrcu
	jMA8lb9VdFTK8CpEx6u5SFNPOv/Qj1mESkhjIlbRe9PuxTTUkSPoItspCD/OtVgkAWDqtOobe1ROo
	KIaGKbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAi0-0000000Djcy-28q2;
	Mon, 01 Sep 2025 20:00:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Sv-0000000DGSg-3aGo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:33:10 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-337e714b3b4so4596191fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744388; x=1757349188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvGFPcLRQG7NDdcutxPYCIPA441LFKGMfIhq/xAeHWw=;
        b=l6GurRdUTUlTUkYqOLKjh2s/hR3O7j4QNTGlcO+IVBr+zTn9IDMiKz/xBC031EdN0k
         bWgwuxw0IerFYrrvZrLND1YXTedTrKGjWvqjCHUeLkzGI5B8xvtyqoecpisxYVIZok3T
         H19KNphoUc774TZY2wK9gdcl4NFyRJ9YuG/g3ClbBC33YYNYgdErGbFoQaG1P+i/wmKV
         vUWAG9yLKFnFQGq1LZMuUgz6Mb2ucTTbecVxh0+4ixeQYLk2cdLuxMhi/JhFzUFP+KEw
         aYSZBCENaJ+JWdeL3dPgaI0ASmQxSle/va843jVkr1YJjcW50ViPNjpHg7BwxHCRBmUW
         u3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744388; x=1757349188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvGFPcLRQG7NDdcutxPYCIPA441LFKGMfIhq/xAeHWw=;
        b=vvx7omtidpKGPybudYJnImr3XmxnE1hmVmPWSmbH3AitHEeCkdoIKjK4ZKBjZXh5XG
         I9BHhSlrqQL/c+YMFmERYA0tXJPeko/54S3FHx3orJVXV/oTMEE6RtFGUzrOcc4+BqN3
         aRtzlz0vtgQaPBAgWOnhm4RvhwvOKhNqVt8f/VbKn3CVdk+jjuE6LjAdAIDBiFvVS+/c
         7NvAmd5r2PxtuGVRYuw68SadpP9gMyEdGUx30VegyuTqTqYrmzYizRHANqtE6ghPdK9V
         FOUdRTTwFY7NfJHRXOav8kXXBF/JuZtXZs2FpZlCSeUskvGo0YmbT91eb8XdHkHGkCHZ
         hrLg==
X-Forwarded-Encrypted: i=1; AJvYcCXJUYCTenqhhDQhlTV8vZ33iY3DPc0BJCw5se4L2xaW7hZ6dcW8UTuhIdg5JwOgym49rShK3MKTvR4FjWPaZwwv@lists.infradead.org
X-Gm-Message-State: AOJu0YyKZXs6kepsUD8dwyzbXATPnu6uYPZlZlQlVN8cX/sYbiZA7+HQ
	+jRTOSQ0hdJNG4wLeRHzGsT3UBEqqN1EKBQbWym5Fqc2vk8g1IPClMkyo2z5FwLBhEk=
X-Gm-Gg: ASbGncur78H7RoGe4woMx2xcoUMF642KfbjGTyByDrsO8cpQ8SW1isXRf5uXXSweIsV
	DjrPt7XTpAJZTr/jhA/QFr5cr5l2eIP1EhVIz7LSWtG+1dBi9x0aNNstgCqont2r2VzvRmcmxZB
	EClUYZzaR908iN8Ulqx1A8moxQ39VdisjeEMTwfu0ZhkccNntQPJDNq2IkDBfqV5DcHcm63630/
	7u/L1ajqcuf0g+YHYDAhQNCRXmjaM/y1GhXC2rltasd7YL+G6lvdSgAz95bDZQ+jsWD+jyKcXSh
	xDuaNrH1I9mg5sqLxV7FQKZg2cLc/7D5d4RcKrGTmexAz55WAqysQtafD7YMw2tGduilx3/iPY0
	7Y/2wwsM1I2iVAJ5+ZT9Hi9AXtGFFOgjbhjuX8Oh3pA==
X-Google-Smtp-Source: AGHT+IG3UXE73EbhUolTZUA009n6afCvf/c7qZpC2nZYu33/7lnWpLXjusYs+O+48Y7iJdz2RPqajQ==
X-Received: by 2002:a05:651c:4183:b0:335:2d39:efe8 with SMTP id 38308e7fff4ca-336cb148b70mr21019411fa.44.1756744388011;
        Mon, 01 Sep 2025 09:33:08 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0e78e82sm15291861fa.53.2025.09.01.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:33:07 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firmware: arm_scmi: add missing spinlock documentation
Date: Mon,  1 Sep 2025 19:33:01 +0300
Message-ID: <20250901163304.2504493-3-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901163304.2504493-1-artyom.shimko@gmail.com>
References: <y>
 <20250901163304.2504493-1-artyom.shimko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_093309_885500_5BB5694D 
X-CRM114-Status: GOOD (  11.10  )
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

Adds a missing comment for xfer_lock spinlock in struct scmi_xfers_info.
The spinlock protects access to the xfer buffers and transfer allocation
mechanism, preventing race conditions in concurrent access scenarios.

Signed-off-by: Artem Shimko <artyom.shimko@gmail.com>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..6828392152f4 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -76,6 +76,7 @@ static struct dentry *scmi_top_dentry;
  */
 struct scmi_xfers_info {
 	unsigned long *xfer_alloc_table;
+	/* Protects access to the xfer buffers */
 	spinlock_t xfer_lock;
 	int max_msg;
 	struct hlist_head free_xfers;
-- 
2.43.0


