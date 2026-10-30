Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4AA60A2603
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2c5ahpKO;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ddmpdcPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zup0ssAFr6iZK+F8bd6TsKJG5vW3IBQaP27+OPMuXxY=; b=2c5ahpKOK6KQ9X
	Dr8GntZU4BxfBqN3AxOS4NNVtZ1LOGRnaWIhdEU6JCHwZMDsnDTJmPOWMmkmemG5pWM9rK2/dxDS/
	3xJz2rfsY0RE0P3k8GHv1YyOQ5Etvjz54A5JVkTIkkpg+jTKmikwDwfaTplQwphPs+KxPLEzRgdi6
	O1OCVMgIAGl+1Y1cIt0sfnLUug51nzzz3Y4LRhVMnqF/LgpxcfVVU5K/ucM1II8K6M1w/sFzUOoum
	A+EeGprq7812H7K+vEC9dODiJyIgKBjTf3AlIKbL23jRR9yiOT5ugWgZdNQt8hyRW60hyZWWN7rL/
	kUgy0wrGv9Jg66STV4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpsO-0000000CATc-2cCn;
	Fri, 30 Oct 2026 16:54:48 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpsK-0000000CARm-3Hsh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:54:47 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f11f;
	Sat, 31 Oct 2026 00:54:38 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] mfd: stmfx: Fix potential IRQ action leaks on removal
Date: Sat, 31 Oct 2026 00:54:28 +0800
Message-ID: <fb75e2706d7608956b5198c674fedd2f9cae7d55.1793377422.git.liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18dbc1f2f03a1kunm46158e5a52a2e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0JIVksfHkIeGENLSRlLTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=ddmpdcPBR8UZeA8kfxBKyFYBSAYtV/iJ26Hm5kvVoLbNCpUxTJs/wD4rT5fgmSc2qEcUxom4pcZGMxOx5wz7C2mHlSGtSFX8olaJmRSVEbwtK3l/6vJV5hzDvqub4mLHYhvLGIT+6X3IMV+fyMP1fJo1oLdNI8p+W/P0We9IEXY=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=Zup0ssAFr6iZK+F8bd6TsKJG5vW3IBQaP27+OPMuXxY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_095445_021209_EE66CDAE 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The remove callback disposes IRQ mappings before device-managed MFD
children are removed. Their later free_irq() calls cannot find the IRQ
descriptors, potentially leaking interrupt actions. Remove the children
explicitly before tearing down the IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/stmfx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index f683fdb6ece6..82e81e084795 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -448,9 +448,9 @@ static int stmfx_probe(struct i2c_client *client)
 	if (ret)
 		goto err_chip_exit;
 
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-				   stmfx_cells, ARRAY_SIZE(stmfx_cells), NULL,
-				   0, stmfx->irq_domain);
+	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+			      stmfx_cells, ARRAY_SIZE(stmfx_cells), NULL,
+			      0, stmfx->irq_domain);
 	if (ret)
 		goto err_irq_exit;
 
@@ -466,6 +466,8 @@ static int stmfx_probe(struct i2c_client *client)
 
 static void stmfx_remove(struct i2c_client *client)
 {
+	mfd_remove_devices(&client->dev);
+
 	stmfx_irq_exit(client);
 
 	stmfx_chip_exit(client);

