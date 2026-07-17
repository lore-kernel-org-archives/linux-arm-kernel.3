Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3A6C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1vjRQW9QVJHcJVvAFqOxAUXoWYTgSZXMsr0BOdEwxOE=; b=CWuWgbrW/Fn4/Dt80z5+9/tkIb
	w9R8iDyctaiyXEElLildmZORYfaOhvnhJHIQQurm14CL09a5dRwdMlwhITVCFgZezYrtvP7ACHziH
	QGDIBr3bXXnmR06xXjkIV+lONNHHvSrLA1uwqvWzJ/Yu3xQaZm+cz1FljM5GPQdj2Z7wSAyqiU1zM
	1Kqh16SO/q3SpT0yt6FszfxkLHmNNNp/pwmGmo7eGOMLNpE7npDcjqb57aXnODEiIp3G2+I6bMJnG
	3wKAnb0WXhjFTC2FeMvcL6cYmVAWNDQdM4Xa3meBao0C7HTwl+iqKR0JqypA6oCwnuYx3RkK6Qlmq
	n4QrNRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkecb-00000001nJR-0UT2;
	Fri, 17 Jul 2026 09:12:41 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkecY-00000001nI0-21X4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:12:39 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso5773687a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784279557; x=1784884357; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vjRQW9QVJHcJVvAFqOxAUXoWYTgSZXMsr0BOdEwxOE=;
        b=JMyuR5ca/vUJ0ERi31XfNWfSPzBrNFKfHT57rfhq5ZEHqGK6dBbHPzSkS1QOYqJAuZ
         xrq5ji9sBkEA813ehSad4JeRhz4sHoVhhqZp9nXUPrSfycXvG1nxY+UgfwI1GTOJvnIW
         cUmQNS+qKH7i2qo28vdIDAu0XVnOXp3uTEmMvu7Ta9mVt4bTRpTqBNJa/hDvL3PbRvOg
         jfEldhBmgoSnKdSC+e4bJo+9KEV1RP5ZPV4UHCvLZaGZztrSWdTpjPA7GtyMZETIMvAX
         dVnz4scdhycS2rMwQm7/CzJNV+u40fOA64SFAuxWnfSZD7bGUAAUSOVpnarkdNNyyAh5
         ef6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279557; x=1784884357;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vjRQW9QVJHcJVvAFqOxAUXoWYTgSZXMsr0BOdEwxOE=;
        b=aOOGf4VU+8ElLSWkrQtC3FHUWvbdy/b4Sra2RkrPFB2RJLzUXQt2E8DqvkpIWWnAUX
         GAo24N8cNXLkBYgq9bgJm/6rVfIM4+5Gb38ML+4qZtAh8iqHvGywtJ/DCTu6jE5gBA7E
         xZQhSvLWu8j6o+0Su1JL1APA0dBbvqqPSvzmAm1n+4gizvc5ZM0o8N9uQIYfvNIZFxXp
         eFA/57NAsYuNMy51d66jAOnxyGaSf+ux1wBFxQvJZV+8cGm1VKj5IzIg7ZXguRg1dJpI
         dDt/NM2H/TepLbNrPqCmkDtfBwWc5nJBSWQ0ql0wgxb5e03i6ygbInYXIdz+r1z2tQl/
         DkqQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+/YjVaYvwvchnP2/BP8f3S5HDkBHncLPuDKx33JyEQFE8370m6W0PVbifx8QHg8Vu7WUjh3xoLC/p2YcJtJtm@lists.infradead.org
X-Gm-Message-State: AOJu0YwM4HKohESZs4/nJAAkZecew4taRf45oY8E93pEQaPvO4RVe3ak
	il9HIpgk4taLjGvrgj5kpJtuTXt2jds/J+0JSRyVMqs9RJRZMM/iYXUS
X-Gm-Gg: AfdE7cmHszMAYQ5UYO75rME9CmG5IDbqo2pVCohvRDhmA4nHXZADExHwDTHtfdRJmMc
	VFFRjQ79SA30yQBbUb4CNY+Noq5GhkgQYhxTyCYzK0tm54P4BxfXreNB3k/L3nJ/mveqpLYIAxo
	NMw9jzdeYlZCIO3nIqkS5+PiqhI0uCe5Ff7bCu3W3qVeVWamW1V4IC8TEDcLBKzeFW7SUD7SIrs
	mIDEBZQp+Cl3GdUayHU4/UPZgutBA8b1AcDOmRdjGdP/jUkwLB27NpetIcmeP+zKa2GlmrKluZt
	wUewNbxDIWwD0cd7B3NGXBCoU8vnbNI6lQDjQ/bX9mJi9Ztm7C6HW3aqA+1JBw12lc7vW6eAbGZ
	5JVZ+3A5Tj512OYNmgtbUNgRuw9HGZBQGMqWHdiAXDRVav6m5XVXGSwXKZ2fPUv+H08cXnw==
X-Received: by 2002:a05:6830:6f4a:b0:7e7:7fbc:8e51 with SMTP id 46e09a7af769-7eda153c745mr905058a34.24.1784279557354;
        Fri, 17 Jul 2026 02:12:37 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad91b8a5sm899701a34.5.2026.07.17.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:12:35 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:12:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: stm32: dcmi: fix some error handling bugs in probe()
Message-ID: <alnx_dGHIBYpZuHo@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_021238_526305_A03934AF 
X-CRM114-Status: GOOD (  14.60  )
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

There are a few issues here:

1) After we assign:
        chan = dma_request_chan(&pdev->dev, "tx");
   Then the error paths need to clean up before returning.  The first
   error path does a direct return.
2) The error paths check "dcmi->mdma_chan" but that is not assigned
   until later so it results in memory leaks.  Test "mdma_chan"
   instead.
3) The error handling calls dma_release_channel(dcmi->dma_chan) before
   "dcmi->dma_chan" has been assigned which leads to a NULL pointer
   dereference.  Use the "chan" variable instead.

I also moved the call to dma_release_channel() after the call to
dma_release_channel() so it mirrors the allocation code better.

Fixes: bc901885fae0 ("media: stm32: dcmi: perform dmaengine_slave_config at probe")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Untested.

 drivers/media/platform/st/stm32/stm32-dcmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index eeb0199864dd..c9f08b2465be 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2024,8 +2024,10 @@ static int dcmi_probe(struct platform_device *pdev)
 	mdma_chan = dma_request_chan(&pdev->dev, "mdma_tx");
 	if (IS_ERR(mdma_chan)) {
 		ret = PTR_ERR(mdma_chan);
-		if (ret != -ENODEV)
-			return dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+		if (ret != -ENODEV) {
+			dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+			goto err_release_chan;
+		}
 		mdma_chan = NULL;
 	}
 
@@ -2206,12 +2208,13 @@ static int dcmi_probe(struct platform_device *pdev)
 err_media_device_cleanup:
 	media_device_cleanup(&dcmi->mdev);
 err_mdma_slave_config:
-	if (dcmi->mdma_chan)
+	if (mdma_chan)
 		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
 err_dma_slave_config:
-	dma_release_channel(dcmi->dma_chan);
-	if (dcmi->mdma_chan)
+	if (mdma_chan)
 		dma_release_channel(mdma_chan);
+err_release_chan:
+	dma_release_channel(chan);
 
 	return ret;
 }
-- 
2.53.0


