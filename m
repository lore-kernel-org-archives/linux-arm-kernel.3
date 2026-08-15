Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B596AC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uq/zXomRaUtmPVU0X/7Fe7/2pJ+viXdEE1hutqkzih4=; b=A9rM2z2HEhBL349Ed7CatvsWjm
	i17JXLRh/duDWI99FkwKZ9Q5t1N+PvTiIUNOppRcqaBE51s1oGFKvlzgQPO07E2d5mD80VoQQZzjr
	F6cS/86EUsUfH4Mn82A+vCCnST2eKuEVMmTe20jYb43EF6KcJk56ptuRTArTUvSZPI50+AC46uab6
	FMilqLEdp9XNJ2y8sV1mJyl6m54lUCiu79bD9Z9wX8rFcGVlCCWPuD4RSnzWV2lxf+SZWWwvHjuHc
	JjCkOjco1Yut4hhi+r365GPJhhQ+sP1Frt16xhX59jwWn6mtovTjXwroSSxizuzGeOkbL5yLGKDAW
	FaeSvKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIsJ-000000041Sj-30Wb;
	Sat, 15 Aug 2026 18:12:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIsD-000000041Px-1U33
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:12:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cf452def93so24898435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786817568; x=1787422368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq/zXomRaUtmPVU0X/7Fe7/2pJ+viXdEE1hutqkzih4=;
        b=aNzNuA1eS0OA1OQBjD6AWuJKvwPJ0D4t44WsBZu9J7foujUPtrFizwMqn7XsLE+Wfq
         I/Lpo3BXX8NrXWFqPJQ+oSvV6sKOkEiUjrhDkObevDX6XcCh1+coD5beIKOXRUdG80fE
         oVdJ67uLdDzrj6plRv24C8m7ST/RIMyPfK8bxtGUTjfrn4/EDTEjjhh37n78Pv22txGq
         JwSUEBY4gMoBn68xIvEvKfLo9fRZ67KNQ/oWxdtHgp00774v2B08VnVg4RqqWSx6hwfv
         ae5uPIrmDqqHnTGvDedhkGYt1GRLp1y+CQZJg3x+7IXEX6Z5bId23kzKbHQcSLw2KF8N
         3MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786817568; x=1787422368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq/zXomRaUtmPVU0X/7Fe7/2pJ+viXdEE1hutqkzih4=;
        b=K3eCsBZmWtONPZ3ssDGedNrgBKLvwU41xASa1UR1vixlGE8noJFOssP2wiWQEyD9qV
         e6k6ZsS8JARaKxrM+mYB5VB7PbxuQAkZ4mVH6euPPxM9ZXiCZ/XbwnInE+G/8ZRa2lsF
         nW8JkGbDHqN+rDC3mE+JM7WBybTVjRBd94INdPV6ExDRoF8xdWFp61luX1v6uk9y7Z8B
         hlCpacZucceq07gXQT2sAx/TSPjGRyEeXQ3ChLxADGmxpuyQrv9cJxVE5bnTx2oXZwbL
         OiRRfbIprIEbq+Yx0oxcWWYGNjRXk0Pv5PmvwQ2I5UIIZ4jTcu9l/c0QLzhT1cJml+kU
         xQNA==
X-Forwarded-Encrypted: i=1; AHgh+Ro01HBuHAzXwA+WLxJRh2cubz//tXKemvxR8UfrZuG57yog8oK1Ro7gRj0+7PQpuLm8XUgYrQqT8iR8U5GcCDd3@lists.infradead.org
X-Gm-Message-State: AOJu0YxnCsuxD54ro+FmgT0oax5vLKDQX5GxFgfsve9IKGzdEhoQUF7y
	6hpptonBN6Dr1C0H25RC8tHoY0EIFBxngyQSblmpbDjSvVOOugR531Ac
X-Gm-Gg: AR+sD10dkz9NCLtFrMYQUaAd8ulPKQdN7HMP+1G1BwfBCLTNuocqXG+sHJqiIgiVhbo
	y8AmshHl6jIbJ6l4YVH9wCLfHEctDRhVs8ZgC7yOvDoEVAobPOkylBWfVFn3HKcGJXkshihcIq1
	I6LOC1myt+WkNoL34qEZ7Pvl9Bb1TSpnE5CLbkk8ezoeWsapyG7bS7pXOFCRBPQdnJXBDKVSEuE
	c9TG49ze+afRieqhA0KeDbfxHrIideuuqI5+jGkcixDd8wwtDGQAI3mp/sULghNqsvDbZYIZRnK
	i9aLxNaVHuHk6pRCLqdIpkrCqHYcV5aZWOvwLVHzDtAygXpYtdDzqkotmHuvEjs/94UhM1QyjZB
	p06MPyKeoIdOG8G3CY3WdYEg8EXhhQPSbvU6oOKj5MI97k6fj8cf6wOZT65Qrr11aEwM50gldCp
	8/VpyCaQNLrOk/k5GsSNnOt/57q1wDwxeEl9zJe3m2WCPw1JNFDzlJ8fhtH1td1bzdut8a4H7wx
	LjUTWBPRgwISfjACKB4+TRArB4=
X-Received: by 2002:a17:90b:1b43:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3933af8b5d7mr10385225a91.5.1786817568272;
        Sat, 15 Aug 2026 11:12:48 -0700 (PDT)
Received: from localhost.localdomain ([240a:4280:4800:6ace:25e8:2607:e94d:caaf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb7539d3sm7304254a91.15.2026.08.15.11.12.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 11:12:46 -0700 (PDT)
From: Liu Zhenlong <dragonliu2018@gmail.com>
To: andi.shyti@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	jochen@scram.de,
	maddy@linux.ibm.com,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: mpe@ellerman.id.uk,
	npiggin@gmail.com,
	chleroy@kernel.org,
	grant.likely@secretlab.ca,
	neelegup@linux.vnet.ibm.com,
	benh@kernel.crashing.org,
	wsa@kernel.org,
	stigge@antcom.de,
	linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Zhenlong <dragonliu2018@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] i2c: mpc: fix device_node refcount leak in fsl_i2c_probe()/fsl_i2c_remove()
Date: Sun, 16 Aug 2026 02:12:00 +0800
Message-ID: <20260815181204.2321-2-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815181204.2321-1-dragonliu2018@gmail.com>
References: <20260815181204.2321-1-dragonliu2018@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_111249_393343_C6B0946D 
X-CRM114-Status: GOOD (  14.19  )
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

fsl_i2c_probe() calls of_node_get() to take an extra reference on the
platform device's of_node when assigning it to the adapter device, but
neither the probe error path nor fsl_i2c_remove() drops it.

device_release() does not call of_node_put() and i2c_adapter_dev_release()
only completes a struct, so the extra reference is never released, leaking
the device_node on every probe failure and every adapter removal.

Add the matching of_node_put() to both paths.

In the probe error path, i2c_add_numbered_adapter() failure does not run
i2c_del_adapter(), so of_node_put(i2c->adap.dev.of_node) is safe.

In fsl_i2c_remove(), i2c_del_adapter() clears adap->dev with memset() at
the end (commit bd4bc3dbded9 ("i2c: Clear i2c_adapter.dev on adapter
removal")), which zeroes adap->dev.of_node before of_node_put() runs,
turning it into a no-op.  Cache the pointer before calling
i2c_del_adapter(), the same approach used in i2c-mux
(i2c_mux_del_adapters) and mtd (commit 56570bdad5e3 ("mtd: core: Fix
refcount error in del_mtd_device()")).

Compile-tested with gcc-powerpc-linux-gnu on pmac32 defconfig; no
hardware available for runtime testing.

Fixes: 9fd049927ccb ("of/i2c: Generalize OF support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
 drivers/i2c/busses/i2c-mpc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index a21fa45bd64c..8182f7dc3d0f 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -867,8 +867,10 @@ static int fsl_i2c_probe(struct platform_device *op)
 	i2c_set_adapdata(&i2c->adap, i2c);
 
 	result = i2c_add_numbered_adapter(&i2c->adap);
-	if (result)
+	if (result) {
+		of_node_put(i2c->adap.dev.of_node);
 		return result;
+	}
 
 	return 0;
 };
@@ -876,8 +878,10 @@ static int fsl_i2c_probe(struct platform_device *op)
 static void fsl_i2c_remove(struct platform_device *op)
 {
 	struct mpc_i2c *i2c = platform_get_drvdata(op);
+	struct device_node *node = i2c->adap.dev.of_node;
 
 	i2c_del_adapter(&i2c->adap);
+	of_node_put(node);
 };
 
 static int __maybe_unused mpc_i2c_suspend(struct device *dev)
-- 
2.55.0


