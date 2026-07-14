Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNvAJagM0h/ttBqvPmQVo9CO+v+pNiBOB9YPIRh2j6k=; b=aTgDcaf/IzrphPXomboyuqlWRO
	PFskvYpNOtzn0sFPdBH9wYeMXm/P1tm7f+oceGU7T17h38MRfR2PM2sapxsMaI4n60oPUS2BgT4E7
	7t54Q9v0i/ONEfRxrdrJ5MHvaJVe7RXnYXOai9Qap9Po/9bzmuUDGTNGK71zvMvWMpGuLQMhw00S0
	KAhy44re4d1hA//nA8VuOJkW9CgqCiMqURSUvpciWH8PM5fY518ra5QWoxVNGj95Iw5LHI49Wx7KV
	Muflqz10QIlTrYws8ZYmC+Qbu9WUYjBzGUYmCfEdEReq1kpVvv6BBn0TMpcY4/zDHktlh7eMG0Jh6
	oCj8DH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcJt-0000000Bwq4-2uNT;
	Tue, 14 Jul 2026 12:33:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcJq-0000000Bwoq-2kbd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:33:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1708848a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032381; x=1784637181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNvAJagM0h/ttBqvPmQVo9CO+v+pNiBOB9YPIRh2j6k=;
        b=RG1r97SMI7BPDI4nltTDOubnKX/NavDHPK+2EHRg4NZzFd2TLi6T2CB0u/6uvgmAZd
         8pWb79vWRK0k70wEeuP9Keqx+pIDIK8dj3xGiREW45wt7hLkvvGETJa9zBJcEUWb2bjQ
         cnl0oN+6+QtmGQ0222kMktUkErt2maN5uIux0+6mmAFBbBZFoGH1XXLX0UwpMX4NL+J6
         3P7e04FjhKDuu307foQp6wiYRavOiUv9EuRAz853UgGsAWQxjR5/kdpY4xyxUHQtjkKv
         /KvA10+JOnG+yccvbQhkkKg06rCqazePeyYcnMljeYygVHryFEqcZAoQ9z7kFTZhSj3A
         ExMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032381; x=1784637181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNvAJagM0h/ttBqvPmQVo9CO+v+pNiBOB9YPIRh2j6k=;
        b=atuooSyM30y+l/czmV+tsk91gRTkMGbQARPSt/zCF4I/ivfiuNMW/HdOXs4rcx8Z/3
         S4CJjx+CGIgztWHutNshFSjNKYO38niwvnl4lnwWcFyyW7CS4R7GkIvrW4Og5JeKZGtN
         6jO3rbvCuPodnCFCJlYtqs95xUnwnhTQjRHv/K3HHfQOPq5TbwaMTdkiKapzQBCIpsQR
         yVtOYEMjUnENJfNBp4+LXHY6BfqayoNwNLEhrRJGscx9yOU6OUPtbGQIc8sNZZZ2iChj
         mpFWhaKBbtHJ8oKTQx4v5AiQIhEC+jz4nQwefUl2eSQwVUVLqE9Z98YfMQ730VoGCAKe
         IT7w==
X-Forwarded-Encrypted: i=1; AHgh+RrUAhUzQ/A/rMZu3nm3U0vZOMBXVcMtMgMcm+CgWCryc5PdJqjeqeurBWTKpEzOeQ0/fIOxWF0jWpml7LahHi4/@lists.infradead.org
X-Gm-Message-State: AOJu0YwQMAM359psoeex/u16/b0JpWicsltFwZgIpMfCT/QUI336asFx
	l1Nl0OKpHBLRnygbo//KtHErY8wDVla+PjiLr71gRPkAL5Fy+9LTWzhH1uUaEDaY13v63g==
X-Gm-Gg: AfdE7clyrTHcuijm+JqESsEWeciEClEwdZ/iFYtjQriL35NSdY//vjlndeDRIO9Pe0S
	KvA1VhzYXCcSrconfOv67aygi6a0BhgLnfe2B69woWDBbgr42pPpUO0IG8kYWkMBJOTCFbw1NJf
	32+XM+2w/eCzaB910Arp7a8d+xQsP4KBeNPWKzEevheA2EmMIpwxYQnDaez/hnlzE7xFD5SqkSf
	rMxldiQO51G3gxazISkoZ2UiDWjaE9FiRufrvuGbDH8+7/D4dnK7D+p/iOWHJemyf7g3KhCYrKs
	Gu9nRAmlFdYZNgxQYW57dOxma5lccrabEfARoGZXDPIycnE2dWHWVBCrxOCGirJjlwAjI5XcbpP
	oH9FG5MMWytXBcytVSmzIzoZkFN8cvT4IPUhnK0lJUQDvx9NTkLfy3fXHbp5apn72nR2/Vk0=
X-Received: by 2002:a17:90b:53c6:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38e17d96421mr2942124a91.2.1784032381474;
        Tue, 14 Jul 2026 05:33:01 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d08sm1443513a91.2.2026.07.14.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:33:01 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alistair Popple <alistair@popple.id.au>,
	linux-fsi@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] fsi: aspeed: Fix refcount leak on registration failure
Date: Tue, 14 Jul 2026 20:30:38 +0800
Message-ID: <20260714123038.1523162-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053302_704113_DE4C6791 
X-CRM114-Status: GOOD (  14.17  )
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

fsi_master_aspeed_probe() allocates aspeed and passes its embedded
master device to fsi_master_register().

After the master index is allocated, fsi_master_register() calls
device_register(), which initializes master.dev and takes its initial
reference. If device registration fails, the reference remains held
when fsi_master_register() returns an error.

The probe error path then calls kfree(aspeed) directly without dropping
the device reference. This leaves the initialized master.dev reference
stranded and bypasses aspeed_master_release().

Disable the clock and call put_device() when registration fails after
the master index has been allocated. Keep the direct kfree() path for
failures that occur before master.dev is initialized.

This issue was found by a static analysis tool I am developing.

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/fsi/fsi-master-aspeed.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff33..2a54b6fa3394 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -626,8 +626,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	aspeed_master_init(aspeed);
 
 	rc = fsi_master_register(&aspeed->master);
-	if (rc)
-		goto err_release;
+	if (rc) {
+		if (aspeed->master.idx < 0)
+			goto err_release;
+
+		goto err_put_master;
+	}
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -638,6 +642,10 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	 */
 	get_device(&aspeed->master.dev);
 	return 0;
+err_put_master:
+	clk_disable_unprepare(aspeed->clk);
+	put_device(&aspeed->master.dev);
+	return rc;
 
 err_release:
 	clk_disable_unprepare(aspeed->clk);
-- 
2.43.0


