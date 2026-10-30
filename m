Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D93F60A261C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f76LkwCp;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=IH6pW7U2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wVuG7q5uMpwLdeNdNqczhbqcCJJG1XE+6CcI8ium2FY=; b=f76LkwCpUzgROp
	WVKChiqjnmeDaF2DBrsDBfZ5PanebJyVZthFq1+52a8DKGyvpBbbHju31sd54R/R2y58rV1Az0+sX
	r424K/qmT+W00841WvOR8fqovoPXrwG4am0K2RpKNT+r0PWkbNWYDerez5Cxht1NB750wQqnredJd
	7FQ7W2BoxF8LFL4sgDTslCqzsahxuQ9ZHyFdo0G53utnj7Uk+v0hLV+HiONK3tI8pFDebPTM7sKV1
	DEubb8wIJ+Hb2sjWXzAb7Qsalhmb1M+obWXs/Chw6TwR1LJL32vo6BNNqCngb4ye3IHTzI1aBYefT
	9vNSjemhmtoKtsuc9bUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpsO-0000000CATP-2DMS;
	Fri, 30 Oct 2026 16:54:48 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpsK-0000000CARV-0Jm5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:54:47 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f11e;
	Sat, 31 Oct 2026 00:54:37 +0800 (GMT+08:00)
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
Subject: [PATCH 4/6] mfd: stmpe: Fix potential use-after-free during removal
Date: Sat, 31 Oct 2026 00:54:27 +0800
Message-ID: <f25172a8ca446456fa3e856b1b8b76e11dace293.1793377422.git.liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18dbc199a03a1kunm46158e5a52a29
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTEtPVk1NT0NIS0xLHU9KH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=IH6pW7U2J4IPfcChpf6c2jBoUJlT7AjgPqMcSPjDAvH7wI1GVrtbeu2zLTGUFhAixV+e5e1v5B6MKMolBfR7nEZL3IFiQ0OFJ4gxzce9OGTI1CvqGH1xoaZncIpouPMTJuS17B0x3OWbAVH3yIVY6RYTE3xeJodqeodh+R2ALGE=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=wVuG7q5uMpwLdeNdNqczhbqcCJJG1XE+6CcI8ium2FY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_095444_880530_3B01ED20 
X-CRM114-Status: UNSURE (   8.90  )
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

stmpe_remove() frees the IRQ domain before removing its children.
Deactivating a child's interrupt can then access the freed domain.
Remove the children before tearing down the domain and supplies.

This issue was found by our static analysis tool under development.

Fixes: 57bf2a312ab2 ("mfd: stmpe: Remove IRQ domain upon removal")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/stmpe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 3c5c2f157f52..89c1c8deadc6 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1486,6 +1486,8 @@ EXPORT_SYMBOL_GPL(stmpe_probe);
 
 void stmpe_remove(struct stmpe *stmpe)
 {
+	mfd_remove_devices(stmpe->dev);
+
 	if (stmpe->domain)
 		irq_domain_remove(stmpe->domain);
 
@@ -1495,8 +1497,6 @@ void stmpe_remove(struct stmpe *stmpe)
 		regulator_disable(stmpe->vcc);
 
 	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
-
-	mfd_remove_devices(stmpe->dev);
 }
 EXPORT_SYMBOL_GPL(stmpe_remove);
 

