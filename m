Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D54EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+FDBRSUyUWWqwGhcMioNN7CsL8+ZBOGwwYv007xVH3I=; b=GIGQ2o4r+HDa0vl2oktOgk/xFm
	Ugf9mj/+IGmrJNzf2mbILE1kvBPcV2bplnt6ysP6A9tJ8QUqzBk57zegqRBIu3WwjaeVAOFPcdNrx
	t2X+IkyRqOmMN+a+jsUkEoD7MaZ+1eIB8l19q9C4dhe6KvtTG4aUG5taGcCkbcG2GVYxuwo9QWlZK
	IlSv5KcMXK42G0GHz7yGo9YYTZsSVstbj3nRfO3xLlmHBguNF/7Whe2gTZ6J/zvVOKpcXxkfu/o3k
	o1WHsZY0/tgBFXIAVT9PJZFf45GUEa0/U1d/wrgc7ulEaWN2UhY4kblHzJ9wzrQ91GuzA0kaPbC9O
	x0DNkOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc93n-00000008ddw-3RJx;
	Wed, 16 Jul 2025 20:49:03 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7xZ-00000008WHP-0dHU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:38:34 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-73e5d932ab5so123663a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752694712; x=1753299512; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FDBRSUyUWWqwGhcMioNN7CsL8+ZBOGwwYv007xVH3I=;
        b=xtkZmmBoMQR91SupoLzmhKQjSuY3zVtqYWo7nrB9hAsdoZD71SkrBtHpIzFX1v/0AG
         f625EWlF5aUkRMG1uN6ie9BeZxsRVa3sXOGmjo3XLvpLGJk5Pi3Ic5QWjoJtqNZ35RL8
         iTtsjugezqYJqmLawW4Xfgq9iYobVxv+HZXqm7LAD9hU44FHbJrf91xi3z0Oj81BuoJ2
         vUZKKNrios4PbO2sMQDPdSPzkPwdX/06P5i8Vj6RI8Aklrourrb0ZM8nKUjsVdo1VRyd
         t5eovnmZaMCE3rMFPpu3ZlX49N+ZL7/eY5k1G1xh5jTD+MRTxN2DCeHK2M1xK8MNLf0j
         78cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694712; x=1753299512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FDBRSUyUWWqwGhcMioNN7CsL8+ZBOGwwYv007xVH3I=;
        b=fnHXbPpf6Qz/snC/WULZwdXt21ZK4c3niYIqHLbGJvz9Ds7kzPbdGzI5XVEvl8j/Pu
         UHPP0kIeGGmtHccTFJVBAD7QTYyV8XoUz4ow96gUgLjp1ldZhdCOatyUT2Z8/vfzohUW
         Gep2NPo3w7A/Pl84nW3hLWK5cMfuBa/Cse7bRUNj3rgC+v8CPIMh5F98LmTFQRL+X86I
         wL395+QeP0Uxofq2PDz8y+QLNSq6wI6Cq5pX7cYce6LbN4EKDVAA9yh770hGUUtYvr/N
         W0cr6PU0QDfNEOfy1iz5RgLPwp8us0ruvsuxrSZYqN16vH9pKC2T2eqS9JhZx9MvmTS2
         8MnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWuYvLPpT9ltaEMhUlzbbZHgvokdT9nXmDqxHH4+aJc2aanq1iWLuNpykA6gG4CkObs9fsPnE1ZN1jhR3zEmE/@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+gVUBQdsAXoUNfgzEJ7YKwlpZdiPjfI7mqMwTXe+ULp0UfLm
	76jm7ArFo9R7uCuQQl7y/29qzfqdcYWzD/aRa+tgiFhWQOEG0ioMlIIcUV2jd6aw97013QGqwPO
	vphxo
X-Gm-Gg: ASbGncu4O98+KI89BXacWPWTqfZTKT4fyqfIGCBKDcF7wMswUTiJjozwIfmFJa/mAFK
	jdEhOW/rKjjsdob2416eEu6KR/7A3vZcYhdP3+tE4GD54UJQmSOvkLVJikJVFu6HTwzJAZWcHPp
	qTIalmKwrhKDK4CQHl0qjnNjwop3v2g0/UhfM2vTa3feCmteIREazAal7KRpqg8HDfYmamEK+vb
	k6YNg7SzCimXMYt+g/LpDveyS8LOM9DnSNHuIRI4FB2pswNeMjMLhKcMuYlsgLkhutrEZi5eL0L
	U5CQbVZHGXjte4aofJ+7l6j5EZKLVk43/K72fVHpbL0HjmKXuLjKhOoE52pp6m7B2GJNuWnRvnd
	2ZH+jWIt9yYveidtnGeTThzHiTIYITe98QFZO9Nuz
X-Google-Smtp-Source: AGHT+IFDI6CVXcKUhCo8LLXFkhb8W7llthuk++X+kRQ27Rn5k1+Mxpsptg2j4SfLdKCLpbJB6uge2w==
X-Received: by 2002:a05:6830:3495:b0:727:3439:5bdf with SMTP id 46e09a7af769-73e665e298amr3267794a34.13.1752694712246;
        Wed, 16 Jul 2025 12:38:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73cf12a4bb8sm3235273a34.45.2025.07.16.12.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:38:31 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:38:30 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] coresight: Fix a NULL vs IS_ERR() bug in probe
Message-ID: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123833_187602_371436E6 
X-CRM114-Status: GOOD (  11.90  )
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

The devm_ioremap_resource() function returns error pointers on error.
It never returns NULL.  Update the error checking to match.

Fixes: 26e20622a8ae ("coresight: add coresight Trace Network On Chip driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 0e4164707eea..d542df46ea39 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -183,8 +183,8 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	dev_set_drvdata(dev, drvdata);
 
 	drvdata->base = devm_ioremap_resource(dev, &adev->res);
-	if (!drvdata->base)
-		return -ENOMEM;
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
 
 	spin_lock_init(&drvdata->spinlock);
 
-- 
2.47.2


