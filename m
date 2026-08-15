Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD06C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V91oZrI/zJYRrYjWs8UIHznDrCj9rfvAd4MAMUD9J1o=; b=CJgsQ11BffCvje5O+aFfUNg1mE
	2GoNDM25VhihdZ4i+yVAHRwNLFVWJ7pj4WCurmFg2xxtph/43WE0DiZGtIPJ/PUJOg9dRP0wirBt6
	B1Lh0HjmSozj7xxazRLbg3HJHN2OwxrlNREOWHGkMkJMlAVZ8Qa4mjARe4qqAwq9bsSi/kE3JQZvl
	u7+Rk1UpPZaT2pw2UWX0u0cfyoYPQgOuUALtx68nzgQ3CjAgWoxag8tx+VYPiUAUvFErX6zKGfjPq
	giSMAzxXYfwO9VnL/oTVux4qA9KQjOUptuP87GMJp3H8mns7/8KNCpdJ/1dj8uq3zEy1denWcP0ex
	975C3S6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIt3-000000041jG-3WyA;
	Sat, 15 Aug 2026 18:13:41 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIt1-000000041i5-1iyW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:13:40 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-39266382df6so1715786a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786817618; x=1787422418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V91oZrI/zJYRrYjWs8UIHznDrCj9rfvAd4MAMUD9J1o=;
        b=El46Rd04EtxZcGibwuLULFoZ4qLKkURUkcGpnfAeS06ui9KErL98jDGvk5Vpcny+TF
         hHJZDOJqb/qg0CGafga5f9e21IajObXgFQeUi7WdNtknhFyVqqKryubkv5CSC55Mf7QN
         Q9rxrZlCxNdltc/HsccIvzX0K0Fyzmj7ZwUDuKby1RdB6W5s1etKb90fOroBv+y4FrWx
         KTg3Z94kq6nH8kFqi0v0yTq5jOl7TE/HVRmUV0euhgDxdm3VzK4ogY/cK/WWgvaBL0Uv
         jIq7T//eSPY6izNTh/C6CUuwNYr3jEXY9XyORgDJSYm9B+LzcoZB86wqpX1LM5LMjhiU
         NirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786817618; x=1787422418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V91oZrI/zJYRrYjWs8UIHznDrCj9rfvAd4MAMUD9J1o=;
        b=HSiZDwjEKkYXO7f5kTO57jcFHMvIkeaPMSopocw1jl/AU9XXNfYHkF7meSuKotkvWZ
         iqk0YPsB99ti3SE6RGuCBJ5UcuEkcnp5ohTdy1Q9nSlw5/a+e0YpHdO+nhNnneDxz9rW
         1VwOry/4NWLYKvs5ry03J+X7l5ztCGowK57Qdunygg7JFnFMZDMMNQ7SS3HHi6E+Tb2d
         SUPzvb6pxDS3xjuDoVYjST0MrKLaPjm0AJFk9x0x8s5FIun/8euLBwcQFjlMwH4kdioh
         fCTNaqhz9AgOmiu+qo0yM2mFSogXy2r5L1RvnVr0bX9JO0DYPCqaJEIc0HOvN86Uyqk9
         7Deg==
X-Forwarded-Encrypted: i=1; AHgh+RrQCE9dkm3amG2dipQG/7ZXlJ4DZhl0JQjR7wQyL3NJX+hT2fb4pFa+nm/++85yxQp9JbQGuJ17M/dz537LrmtY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbd4LpBryyUTTPJd6U0++DSCf7wZveanTaJUe5QFsww9wkGb8K
	kL2lQIlLJbx7aDhKJ1eLQDQ0sJez4wHOm/JJnhDwhEXGsszBE6nhQlvN
X-Gm-Gg: AR+sD10mRbFE+YWDNABGDF/tglx3Mk8erVWfyRDd8qO67MrXT6rMN0Se0ZiecZOXvM3
	SSZbtrCTyIkNxX2g2M3Kq5FItNaxgF69xNDSbiai003pePUNFlAsj1pv581OszZ74dqkI/VgZGY
	tKJZAfA8yFFVcQeQV/x8cdETpsflVC+//xid2pFOb+tpHmseLa5NKiUG5NvxTzmRPeuTKQOwJ8c
	qQNL88Xq8tQNmVfS53Pog2tvwIvpsB8eMsD7Ycbzgr+xSLKvrNy+OMgXvgFtz80ZMfmwU7JzzPu
	LWkMgogfoNS5P8+/GUSwBee6A0VcHf2U6MhMXg9/TSLnL2bxORWWI8Kg1M7dizK3TlkA53FCAwc
	++1dmEwmdgQDJYj16jvszmZdzVwSjfnOfzZV12qN4H2kX9z8eph6tu68howVlgXHCNuvxcgKJM2
	7tPhKubjWeTVVy7xCLjU9n6HuA/KGWi3tv69xN+Jany0M+7Nr7MaUbNAu9smFZHPKMLf4wG6J58
	BhnOV9g0bbfJjD865oierMykNg=
X-Received: by 2002:a17:90b:1b05:b0:380:873:49cb with SMTP id 98e67ed59e1d1-3933baa0d6amr14788639a91.21.1786817618461;
        Sat, 15 Aug 2026 11:13:38 -0700 (PDT)
Received: from localhost.localdomain ([240a:4280:4800:6ace:25e8:2607:e94d:caaf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb7539d3sm7304254a91.15.2026.08.15.11.13.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 11:13:36 -0700 (PDT)
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
Subject: [PATCH 5/5] i2c: pnx: fix device_node refcount leak in i2c_pnx_probe()/i2c_pnx_remove()
Date: Sun, 16 Aug 2026 02:12:04 +0800
Message-ID: <20260815181204.2321-6-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815181204.2321-1-dragonliu2018@gmail.com>
References: <20260815181204.2321-1-dragonliu2018@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_111339_451575_E5FB1C41 
X-CRM114-Status: GOOD (  15.47  )
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

i2c_pnx_probe() calls of_node_get() to take an extra reference on the
platform device's of_node when assigning it to the adapter device, but
none of the probe error paths nor i2c_pnx_remove() drops it.

device_release() does not call of_node_put() and i2c_adapter_dev_release()
only completes a struct, so the extra reference is never released, leaking
the device_node on every probe failure and every adapter removal.

Add the matching of_node_put() to all probe error paths (the three early
return paths before clk_prepare_enable(), and the out_clock label which
covers the wait_reset(), platform_get_irq(), devm_request_irq() and
i2c_add_numbered_adapter() failure paths; dev is devm_kzalloc'ed so
adapter.dev.of_node is NULL and of_node_put() is a no-op when CONFIG_OF
is not set) and to i2c_pnx_remove().

In i2c_pnx_remove(), i2c_del_adapter() clears adap->dev with memset()
at the end (commit bd4bc3dbded9 ("i2c: Clear i2c_adapter.dev on adapter
removal")), which zeroes adap->dev.of_node before of_node_put() runs.
Cache the pointer before calling i2c_del_adapter(), the same approach
used in i2c-mux (i2c_mux_del_adapters) and mtd (commit 56570bdad5e3
("mtd: core: Fix refcount error in del_mtd_device()")).

Compile-tested with gcc on arm64 defconfig using COMPILE_TEST; no
hardware available for runtime testing.

Fixes: b41a216dafe4 ("i2c: Add device tree support to i2c-pnx.c")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
 drivers/i2c/busses/i2c-pnx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 8daa0008bd05..0b6c144d9a21 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -644,20 +644,26 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	}
 #endif
 	alg_data->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(alg_data->clk))
+	if (IS_ERR(alg_data->clk)) {
+		of_node_put(alg_data->adapter.dev.of_node);
 		return PTR_ERR(alg_data->clk);
+	}
 
 	snprintf(alg_data->adapter.name, sizeof(alg_data->adapter.name),
 		 "%s", pdev->name);
 
 	/* Register I/O resource */
 	alg_data->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(alg_data->ioaddr))
+	if (IS_ERR(alg_data->ioaddr)) {
+		of_node_put(alg_data->adapter.dev.of_node);
 		return PTR_ERR(alg_data->ioaddr);
+	}
 
 	ret = clk_prepare_enable(alg_data->clk);
-	if (ret)
+	if (ret) {
+		of_node_put(alg_data->adapter.dev.of_node);
 		return ret;
+	}
 
 	freq = clk_get_rate(alg_data->clk);
 
@@ -707,14 +713,17 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 
 out_clock:
 	clk_disable_unprepare(alg_data->clk);
+	of_node_put(alg_data->adapter.dev.of_node);
 	return ret;
 }
 
 static void i2c_pnx_remove(struct platform_device *pdev)
 {
 	struct i2c_pnx_algo_data *alg_data = platform_get_drvdata(pdev);
+	struct device_node *node = alg_data->adapter.dev.of_node;
 
 	i2c_del_adapter(&alg_data->adapter);
+	of_node_put(node);
 	clk_disable_unprepare(alg_data->clk);
 }
 
-- 
2.55.0


