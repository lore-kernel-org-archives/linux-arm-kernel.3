Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9121D2E027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OTGtBlFhpF4KfA5UaZkwNHNmAJyTL8PF0NqzCKMi89Y=; b=1rD
	hRRXTf8tF8vCtH1jt89juJzPJ1KfC33NFROi7bf6/qwYcPsF98PKITHStmp7gMHT+MePg8WOq7aBg
	NQE784NyfBkO0epSbcuhKoemWP6hCOybXHZb5tLIIyXLjcScf/oUtFPssYp84S+AI9BIPt2Ex148K
	lc4dtfR2PfNV+/EQ04CZTV0HCV3ksZdrK97jXcD41NQ58T5Odv7d5LfCPz+c+ADii+w5k/aTaeM5H
	4jeijaT9uijG2PgpLk0Sgv+7oTdFnd6hlUXX51NSZUwEQXyQVosqoB/kny0M4LBr81vMvG/chuOW5
	QM4qO2w9qlO3pWSrBfRIwgZ6sIvSZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X4a-0000000DdaU-0GBE;
	Wed, 23 Oct 2024 08:50:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WvP-0000000Dbsa-0cyt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:41:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so3303079f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672861; x=1730277661; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTGtBlFhpF4KfA5UaZkwNHNmAJyTL8PF0NqzCKMi89Y=;
        b=hU4AhDQj+Ypup2UZDIvFX6hkyCAvqDcwD5rymu7BPGokgHGi02PdPvKlVM0rJHtuBx
         S5gjwNHWyZq3aSo77JBAzxi2icymcPUemI5Kn55S5RkeSGpVXnsa8p8im1Rurb4ZU1H3
         PKvumR7ImsgaZN05tjtLGZfbePiE8EzO9b8AdEybMxoEIWXi559r3sHBBDWhgxc5CQhU
         DaFwiosyRA/hHHrjH47SX8kzDtRnMhAzlk34apc0NDEDZls0xr8AofPqRO2UZfdSj/MQ
         URb+vsvbf3r3DSbV3rlIPNkDEvUyyWfo/pxVD9RfJ2snpYD2CcGEh+diVENJEs+4JIwk
         m1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672861; x=1730277661;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTGtBlFhpF4KfA5UaZkwNHNmAJyTL8PF0NqzCKMi89Y=;
        b=ajVPFfwInVfRq7iR0l6obLvDiO5/vABZxUwxV9Z5HIvp08HGCDh7Ah6smGbW5+9esF
         mAgI4Gdnw5HFUTpmSC3vz3NZdOM4yZLDli1HDa8/VkhWyQPj2defPOYxtAB6Sx/cuFaE
         qIx/3hBY499FMXq0xFpcRfYW9uEBVA1IARttYbi7nWdmvfvJ77m0tI/Jk9co5fAmml80
         tABqwhNLQHH1Pz5yhNnuLziCeKGmsF/ZMkF2ttiMnalQvL5PRlcrSN7xblrCrORu8yoB
         KRhp3jAe4RAJ7OWVSNgPkcx3o4rVFxB9NHmx2y4aHTHeeN2Tlrfv7rs0+uWZ3drciOu9
         d0DA==
X-Forwarded-Encrypted: i=1; AJvYcCVBBvm88oeCsn76l/Xgyu+kE8mo0eOK3LGXdPM4MJgS4Iz73NhTQcOaBOPbalq6ea8n/ihwMrZhBDrdSMYREz5x@lists.infradead.org
X-Gm-Message-State: AOJu0YzFatTdElY9I9YgP3Hekf1JZX/Ls8FwJOvmfRw7hyytUpLBQlVW
	xHceuvJIilPBN+fC8fLu+AyWN/jk8j4bvjFpo2JzIfn0lSdvzg1kHwOdpxgvpek=
X-Google-Smtp-Source: AGHT+IHBkbz8Gkiu8syBDS0U/jZ595MpfEdCm+s1X/ZgIeh+fOEidnPqxPO8f+s/cE9RJuzVEPDXEw==
X-Received: by 2002:a05:6000:128d:b0:37d:4a68:61a1 with SMTP id ffacd0b85a97d-37efcf926d3mr1140382f8f.56.1729672860806;
        Wed, 23 Oct 2024 01:41:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b93e76sm8408355f8f.82.2024.10.23.01.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:41:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:40:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH next] mtd: rawnand: fix double free in
 atmel_pmecc_create_user()
Message-ID: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_014103_226161_9BCC93EC 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The "user" pointer was converted from being allocated with kzalloc() to
being allocated by devm_kzalloc().  Calling kfree(user) will lead to a
double free.

Fixes: 6d734f1bfc33 ("mtd: rawnand: atmel: Fix possible memory leak")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/nand/raw/atmel/pmecc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index a22aab4ed4e8..3c7dee1be21d 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -380,10 +380,8 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 	user->delta = user->dmu + req->ecc.strength + 1;
 
 	gf_tables = atmel_pmecc_get_gf_tables(req);
-	if (IS_ERR(gf_tables)) {
-		kfree(user);
+	if (IS_ERR(gf_tables))
 		return ERR_CAST(gf_tables);
-	}
 
 	user->gf_tables = gf_tables;
 
-- 
2.45.2


