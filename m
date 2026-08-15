Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45094C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOjD+7itBEHsMfKmr+ynGew/Kjw1CTU/4y0bM+1NDxI=; b=bj9lJdqcXad7WcE5YkHbsI8QGp
	6hQr+WBC5zC59BIU9MN0AtCHOfyykWIhDVVWMzltzAjent9HdWX9xFkl3rI3NWKyod/GrO4Z9H+ZM
	9rTdk3wxNMyV28z7PiweoMgR8cVjsG8N2/X+A0SmxEce38loqHVkjuO/TSVkG1gbAlvfF6/JhDzC2
	OX087taA5TuktuCOac9qb3LCEK3caDkMplUl7Pa0nw3S9lFpFcHyo9MGOa3BWEG9Vvw5tt06eejLw
	oSRNF9TmDSYzNIHi7dRN00HDQupwv8rmHEhmerKwsr8G0AOz3kjjMOLMcOPMwSQhB9OSuh0oogphU
	d9jPa2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIss-000000041eI-2b4e;
	Sat, 15 Aug 2026 18:13:30 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIsq-000000041dO-1nXU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:13:29 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso2207334a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786817607; x=1787422407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOjD+7itBEHsMfKmr+ynGew/Kjw1CTU/4y0bM+1NDxI=;
        b=amKhpX7j/daQ4IVcOiKBEnWJGv/qWpALld+gMHWcojb3iKaORemgs1R/8xucPXg+3f
         CRqDKLql2JulV2ncZ2MTHRLd+LXbBmXm8ZorsVVfMrc+zX1c/PgBGE2M65TwleetIK3j
         UhhptpNpgvw7ZajZERzjl1XkkZHL0xhkD/qDTq9/CutM2VIACHRlBWmtL3wz9Czfyqau
         SXkn2tfRsJQ8ZzVee5bbJYVr0ws1DP8JaT1lX2C/3XPw/a3kviu0e3oqgBsEKbM1Ld53
         lt1Fa+d4WhLYS0xb72wYfLLVvBQNWAeOWc1Z9de7JoyT1F490XD2Oz1nz7HTud8Y0sWB
         AieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786817607; x=1787422407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOjD+7itBEHsMfKmr+ynGew/Kjw1CTU/4y0bM+1NDxI=;
        b=HDRKmafAAT6ubVeqTsl+7YW1fNSQUkI4twrOFtm4I4RStvyt/wCkS8Wv2JzmwehAKi
         j7LlhEM55QlgWfrSZI4IrTOuEy79rdh79nnxU95Fue3NZcmsbS7DSXxOxLIX6h06Mwmt
         u+Pvu+bOhlxkH3RFP8bkabyoJtRupS9Yi/NL+UXS55F2yfGFByPodw887t5vN8HauL6f
         h7h9K++GH9b5YV2Lpz9loXOzCUFMgx1PsosnlptyHab0DmU1vepShduky9hVPswSzTGv
         oCicUU2cnJGVTgY/uqgdwM7riOBoKdSGSw0ovDtbNuyKU0qfIwxw71dg/IE+VRgPXXkq
         jWfw==
X-Forwarded-Encrypted: i=1; AHgh+RpmFGaByzuACC4RX1CNclIi2H0XU/w/633b91jI5Ruo+wm4J7jQNa57vRZhZjFdIOrHMg0gL7bqG9vKvyG/etdj@lists.infradead.org
X-Gm-Message-State: AOJu0YzQFerQckl+YENXy4zQ9EHbJ3O7r/5T0t9LkHYbIByjyzdDN5VD
	Ntifey+Vwi2P53TqDN2nKxuTLoNS96iZVHsBIM50dFp2eL74vlT66T6B
X-Gm-Gg: AR+sD11dTPIF6ywY8klawWywyBjd3LC51t1d0FWGcunpFqk0E0tJ/tEZJsREdgenNIo
	GvrFBJc2PE5hUHb5VEG6b63zAkzu8+fTdndZ0tFFwZgmi/VijK9g/G6HT2Dz/1xZ8q4xXdZrlKC
	aZkNY31B7io1e2VJHIZ/YUxi2tGQISvXRjYLas8OG58FMRx54woZaZTNF1B9Kqtc7f03NxDkR3m
	8obscnE2gn0ekD85bzU3lddGVBA02RsXs8RwlBnoqDiNvDSv+AyUK8utFyVvSpJk9CBU5KP/Y+/
	ZYNvbW+T8Mda5T4fa5qb0tVh3qHtWo4pjBuEoEdnV0HRyZz29+DS6F53F4Gd3hUv/kClTY3p+7r
	JsALnpUTX+druU4i8eOTezhWniao07yTqyp/12+j0At25hZ8awiGkGaj9ECZaobPFaI9cMi9YyS
	CWnTNGUHcO1bsy59WSPan7pmIBVA/V30FD9zaIgiX/0w70MRp7GwHZXBU3jF9rK2ER6Fz1c2lP3
	+YLwb3VTuH+YvfHIMIXvQGS+0Q=
X-Received: by 2002:a17:90b:4ac6:b0:38f:1a29:7a82 with SMTP id 98e67ed59e1d1-3933afb387cmr9673131a91.6.1786817607293;
        Sat, 15 Aug 2026 11:13:27 -0700 (PDT)
Received: from localhost.localdomain ([240a:4280:4800:6ace:25e8:2607:e94d:caaf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb7539d3sm7304254a91.15.2026.08.15.11.13.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 11:13:26 -0700 (PDT)
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
Subject: [PATCH 4/5] i2c: opal: fix device_node refcount leak in i2c_opal_probe/remove()
Date: Sun, 16 Aug 2026 02:12:03 +0800
Message-ID: <20260815181204.2321-5-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815181204.2321-1-dragonliu2018@gmail.com>
References: <20260815181204.2321-1-dragonliu2018@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_111328_473631_167301CD 
X-CRM114-Status: GOOD (  15.28  )
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

i2c_opal_probe() calls of_node_get() to take an extra reference on the
platform device's of_node when assigning it to the adapter device, but
neither the probe error path nor i2c_opal_remove() drops it.

device_release() does not call of_node_put() and i2c_adapter_dev_release()
only completes a struct, so the extra reference is never released, leaking
the device_node on every probe failure and every adapter removal.

Add the matching of_node_put() to both paths.

In the probe error path, i2c_add_adapter() failure does not run
i2c_del_adapter(), so of_node_put(adapter->dev.of_node) is safe.

In i2c_opal_remove(), i2c_del_adapter() clears adap->dev with memset()
at the end (commit bd4bc3dbded9 ("i2c: Clear i2c_adapter.dev on adapter
removal")), which zeroes adap->dev.of_node before of_node_put() runs.
Cache the pointer before calling i2c_del_adapter(), the same approach
used in i2c-mux (i2c_mux_del_adapters) and mtd (commit 56570bdad5e3
("mtd: core: Fix refcount error in del_mtd_device()")).

Compile-tested with gcc-powerpc-linux-gnu on powernv defconfig; no
hardware available for runtime testing.

Fixes: 470834508f87 ("i2c: Driver to expose PowerNV platform i2c busses")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
 drivers/i2c/busses/i2c-opal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index c9b62892397a..43b3d17e933b 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -226,8 +226,10 @@ static int i2c_opal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, adapter);
 	rc = i2c_add_adapter(adapter);
-	if (rc)
+	if (rc) {
 		dev_err(&pdev->dev, "Failed to register the i2c adapter\n");
+		of_node_put(adapter->dev.of_node);
+	}
 
 	return rc;
 }
@@ -235,8 +237,10 @@ static int i2c_opal_probe(struct platform_device *pdev)
 static void i2c_opal_remove(struct platform_device *pdev)
 {
 	struct i2c_adapter *adapter = platform_get_drvdata(pdev);
+	struct device_node *node = adapter->dev.of_node;
 
 	i2c_del_adapter(adapter);
+	of_node_put(node);
 }
 
 static const struct of_device_id i2c_opal_of_match[] = {
-- 
2.55.0


