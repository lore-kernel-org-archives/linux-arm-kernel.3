Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37090C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYeRwN+G3teKav5DbRF0AzCOQ1OUDJvL0VrYOUOutI4=; b=zL6dwWFs+uOyMCaBTgznoXOMFa
	fHNUybQrv4wgpFUZ72LCs1oJvZVBK/Xe/UH/NT3amaVgyr0ydBO5klxORhCDP1docX8oKGvaNI60t
	6a1DQoz9s5bJ2yXjmEPxQXPnmB/I4sY5Ty+r3m9+vut8LA7UTVcw5usDNwrzfA/gQJQDmhJPK7sbb
	xXiSPxe+Yi7UH70J8XBmhvTc7k+HL1N5ctdlTOU8UNJDd6m8CyiuqRXDdnfZSN+bcn49ZAILgon9x
	ljtalvAvAyH7uhpqS64Vq5Ncm38Gd5h78ztf2ShApkoDWmLVl2RxvPwvaoNokDoYFekwVqO/13Oe0
	JDlQ04UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3q-000000043aW-3GdQ;
	Tue, 22 Sep 2026 03:20:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r3o-000000043a2-0INZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:20:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2db710396ffso4495235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047247; x=1790652047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYeRwN+G3teKav5DbRF0AzCOQ1OUDJvL0VrYOUOutI4=;
        b=AoY+2jslg59WYnKMklgE20i7+pSD342xlX01zM8QoRl9v6atKVe/ywQlTmItMaNnl3
         Wv7Gt31+2TmkoG65xj+i0pddHgU2BUj5ELlaXwwAzVya65Yhq9HwoEGO3xq2XTtgQ1lR
         7h5YVfIAQEJBG1XtYY2x6GUxbPQBlB17aMPKjDLAPRT2tCDTsOn0+2Fvy/mtpbcEc6HJ
         JL3UzAL53J8883/0Wamgp3l9bLzLgdIW8rSyVEpaX8K8W/hW/OiOIYLR5Y7XfoMwpe4l
         ulAFL6iuCzG0Uz27WQLHmoglQG5VJdB6ygFJS8T/TPt0nxlRjIxVgEc2qOUxZoShsQOG
         yfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047247; x=1790652047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYeRwN+G3teKav5DbRF0AzCOQ1OUDJvL0VrYOUOutI4=;
        b=ofmoxf/bSxOkT1Qzjgq4WXc0o3QUW3/ur/pHJowRNH0wxKNNe84DhEh+Pfa0jHGYtD
         DQyQGww8/GHHHZX6lSTiqSe4HnRfahKGlzOsOMUYxtov9zNkXAJA80BoV31ThjU6mARG
         NQVT3apJ5URJmHwTLYCPkwDbXO7S46mFD2I/K0gMfeIp11afVvYt3h40bE0gan7JdsEy
         UkICGdg9mB2ESTBXhKX7xdrzo94QDw0x+z/TSqmVEtgzvsbbDGuPich9RUX7ohboU+kK
         PU8asNxA4k8Pd94ptuWyXBK+0cQBJq+PnK5pEveR1WKJlBbxL4Cw7OWy8GQcfBeX7KIn
         97ZA==
X-Forwarded-Encrypted: i=1; AKwUvByQ1rbg3VUAFjUgVOXH8MnOKzD1pcCWM/jEN4nkq262GQ3UWJAVNJY/0G0EMEo+qe3s5rOkoFU2X+1Ldc/1XXz1@lists.infradead.org
X-Gm-Message-State: AFuF++kAEj2cOYHP+RP6MeD8nWcss1jqTOP7bZ8avyOSnmYrmo54SNZx
	mXuvsaSD8Ukp7omNxSxIy5/PMw+esqGUseJchBkcZXpv9VQDlzAEyD//
X-Gm-Gg: AYBFou088kAURYgA4aG52AqUN5WEkwP1USljKcSwvcQ8h4Chu/U8INabcYSZ3Q5TA1b
	rZZwDLobtoSd5we7YU8sga3wHZ7IseatS4k7UsSEzG6NNaxa7BaQw7bydzgx8CXx5dhaHvIrkWV
	CdD94dVKKWVeI6AgueBqwQgKyE8h/1HfEr2633ybaoTJXtnBDuMWnFOKUnCKLzQKz5fBIBmr/0b
	MwjLtpZJnSzpgwDhys53xQk5dXYI18BsG7n644nAZ0Q1ky/X1EicuHSF4p3+wxnyz6bZRs2o+DM
	6QGt+yMXjaTnl+I28TT/1MwSZvvpPB5T6unFuj8j1uc+w00J7Oa2J8NI8v5ubquJ+U/9ezfSf5l
	VSy55/tnM8D2WCOGKV1Zdf8a8WpqjW1Ee95kF6lN12ZAf02OoLII9XfMjae2B7e1ScQGGO5fcoJ
	k4nguNig2AYje7YRvHhgAyyPxzIzWr9+aFy8ln0DQs1y+wfrGIeWai1J4kz9giKgORiXvrJQPSW
	b/rgHpRglApQU6nN10Dr2cHvEpVR3MGoS9Twt1z5+ts4DPDXX6dO0HZFzOYhlmhclNQjcI5SBlD
	LCHo3ZPmgVzx4g==
X-Received: by 2002:a17:902:e741:b0:2dd:ad7d:72e8 with SMTP id d9443c01a7336-2df59a9ce29mr14324825ad.31.1790047247091;
        Mon, 21 Sep 2026 20:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf83512sm1940355ad.5.2026.09.21.20.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:20:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] crypto: ccree - Use pm_runtime_resume_and_get()
Date: Tue, 22 Sep 2026 10:19:53 +0700
Message-ID: <20260922031954.320895-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_202048_116324_3BB5C385 
X-CRM114-Status: GOOD (  11.30  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/crypto/ccree/cc_pm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index bbd118f8de0e..666866119588 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -66,13 +66,7 @@ const struct dev_pm_ops ccree_pm = {
 
 int cc_pm_get(struct device *dev)
 {
-	int rc = pm_runtime_get_sync(dev);
-	if (rc < 0) {
-		pm_runtime_put_noidle(dev);
-		return rc;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(dev);
 }
 
 void cc_pm_put_suspend(struct device *dev)
-- 
2.43.0


