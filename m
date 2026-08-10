Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBC2C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L84OjIpSeCWFBArdFIo9a7688YTN2+iL7sp2DP0ZJfM=; b=061v3T4VxZASlGjWO0whP9ldWo
	O5ZNrrZFxZq9R+R7znae0XpVwxLR2B6+jr9btHyU+cpDDHM/4bcCLMWfVFVxdfh1wGmOgkcNk2OtZ
	CpPSx7GschAWXztaZIHfj5Qu85A743WBfburqpVCIHSDgKsSE7PBsMkrJG/BY8etgywSJ+R5+wUfp
	n8AQWahbQC7lrFU3qIkGH8whbSasSOUOwNGPqHQK/A8w2RADYWLVTLGx6FDNBXDrAKaPlNb677Rf5
	kkrWias59yl/PGcy79UaO6HSkZFRmrQHHz5t57khJo8OX8cSrEq2CAfxw1b8YBoiGkm+ROjaiAGqr
	8QfUxSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxo-0000000CPEc-0KEg;
	Mon, 10 Aug 2026 16:35:00 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxk-0000000CPBA-1euA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:34:57 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6983e9c028dso1568305a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379694; x=1786984494; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L84OjIpSeCWFBArdFIo9a7688YTN2+iL7sp2DP0ZJfM=;
        b=tskfGIo91sOf5IA5l67BtmuPBJK8zu73SdNN1SjMiOo8EjpQ/0td1557FePji4kCHX
         cKdSI6djEZUyK/Dh2P6lCDJegkA3YEtKyfReMoGKjqaEkgjdOvcSy29p53iW2YD7xoXV
         5E3UdCt9wAWOxTd9JeZbC0rqLDjWDVjXWY1eNHJQjCWEw3DGuEZdEMzMqhQY+cxUWyI9
         RMlPNBizWQbkgGmRWt3jIf7epDW7Iu0R/8ApvamV6yOaAkhbzRHUwHD16jvLz2YyH7pT
         pK7MYUneO7Lwq6jmlrKCjBtMaoOOuLXb7l3hAy5nsnOgKf1PpWkqrH7FJzfGD49BHXCT
         IbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379694; x=1786984494;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L84OjIpSeCWFBArdFIo9a7688YTN2+iL7sp2DP0ZJfM=;
        b=ehew2puf10yOweLrwXA0hd9gpbgspL6CIRY8/0JuHZhj0iPRLVAH14OiiS06VNvKRJ
         M6/T0rGodsonAcU+cfUHcgdoFS34+022mjHaGf52qcAm4g4qIOZuTkQM5OgTwGqxQZgi
         LRpstRme6AUFnI0f61PWgrLzNUVCdgeCnUGdXGjPe4RyNIcCg6LYPs8sE4J+/byqeBzv
         8hsm5P9HCc5zfoZMDcolOhtA4qFY8zl5mjGbzs19FAuur4dZ8+uwsj/oVrYZUuCOXQQc
         NPs0fTf+AUGo71ovME+odgt8xwlKz6guR6zGPn/WvJcycMul9+FX02Qox7e41cCKzcLN
         bIYw==
X-Forwarded-Encrypted: i=1; AHgh+RqEkkVMpzhEk7PIwDMNJ5B2LFVf/mzb/PZ4HGV07mF0Txadbjl8FcRRWqcqsppoXvNOIFprs/4QQrZujS8dxhwA@lists.infradead.org
X-Gm-Message-State: AOJu0YyuBG4VUDvnfztCtQBlZxK/buvEpWECwhQTN7sg7pmUWvsNTWe/
	kBrCIFxObXaqcC7yvycDbKS/Mx9Z9lvsewoJF73ds3IblhOp0bt3mRpIR082yFoId4xeFmeyZfo
	Rh13MwZIDNkaGu3baYw==
X-Received: from edgj25-n1.prod.google.com ([2002:a05:6402:a5d9:10b0:6a1:fe68:3f56])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:278f:b0:698:af31:5a9b with SMTP id 4fb4d7f45d1cf-6a14f0b8fa8mr21454308a12.9.1786379693823;
 Mon, 10 Aug 2026 09:34:53 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:13 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-4-tarunsahu@google.com>
Subject: [PATCH 3/4] EDAC/versalnet: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand <geoff@infradead.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, Borislav Petkov <bp@alien8.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_093456_438426_6DA28847 
X-CRM114-Status: GOOD (  13.10  )
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

When device_register() fails, calling kfree(dev) directly bypasses the
device_release() callback (versal_edac_release) and leaks the allocated
driver core structures.

Fix this by calling put_device(dev) when device_register() returns an
error, ensuring proper refcount decrement and release cleanup.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 drivers/edac/versalnet_edac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 97ec05d68bbb..2912b3658915 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	dev->release = versal_edac_release;
 
 	rc = device_register(dev);
-	if (rc)
+	if (rc) {
+		put_device(dev);
 		goto err_mc_free;
+	}
 
 	mci->pdev = dev;
 	mc_init(mci, dev);
@@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	device_unregister(mci->pdev);
 err_mc_free:
 	edac_mc_free(mci);
+	return rc;
 err_dev_free:
 	kfree(dev);
-
 	return rc;
 }
 
-- 
2.55.0.679.g6767b8d81c-goog


