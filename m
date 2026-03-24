Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4AED58CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 22:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9kw70daChVFhOHDmdtNwQp9MncWFEFeR8i+QDxsH2cM=; b=rJKSOGDCFfKtGZAA/9zYouMFdm
	5uog6GQCrfeV/ohUja1ZNJwn2arPynN3CjHaFvhI4wdcKlXTef3cfFHNYx2/vpNMdeIOT4hSjxYEs
	bVDnnRXpYUAfegIX2XswMYhZZZJB9fjlDbEq0aH1ht0hvjAM3i4vokHJ9ACdHXNvbuaxzp/6rolns
	M8VGB+IcggKfssgaEL7OI0p0F1JHj3+bGbUXU/XwTv9G20PDG3wg4puoPEAgQe9nP4zAVQi7UUF5C
	iXH7LVdhedUD+WrDrIx5mkkHmpB/ynL4UJfcjSBvm706dhWhE0i7bS39XcnpENz7FW5ET2oq1YzfQ
	cx8Mzwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5AKT-00000002JgI-16vU;
	Tue, 24 Mar 2026 22:34:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5AKR-00000002Jfw-1IVa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 22:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC4BA40554;
	Tue, 24 Mar 2026 22:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA1FC19424;
	Tue, 24 Mar 2026 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774391665;
	bh=MblaW0xP4HmyYQz3x3ZL7IUOWvhc1ECQYUTmSfXN4/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=bInkP22m7nMFnKEWUYwH/x4FRSROq0svEEH5MDHpZ+ompDxzxsgAzThXboUqycay7
	 UX5ejEw2x+vzSLwXIRtnVmvKruesuOcVNbW1R/t9Q5uMKyfTX7CQeo9sTgZagC2oO/
	 sPxQB099EJobK0YtwRF5+/q2WgcLcaNx8F4IfRK2UugHnXzncOq0dQgEj+m+zSWDCn
	 L4+Hm+asWy0OZxUEXM4n8YGZvsgr6+vfNyuRx3Dyy6+s8VR4GZxCGmSEQ75sT6W5By
	 lX4lMDRFFw41znhMUg71L3A2uOZnJoFfHqPgcYxgd+sjhS0itr3nEoIl8XEz0T7/Cs
	 4TRIAn3CayBpQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fsl: qe_ports_ic: switch to irq_domain_create_linear()
Date: Tue, 24 Mar 2026 23:34:16 +0100
Message-ID: <a9de2f351ea71e4b794baaea8d9d790fbfac8d26.1774391374.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=chleroy@kernel.org; h=from:subject:message-id; bh=MblaW0xP4HmyYQz3x3ZL7IUOWvhc1ECQYUTmSfXN4/Q=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQeFsye28H7gys0xN9D6tUeNq6eE3Xnj/JufC+vrH9ff +7K1IzHHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAisbsZ/lfGeV/YFVcoMPO8 oqrc4T32c8XSb11z3vTs9YeScj2B2YyMDOdDNhnGa30y0T2zd7rm+dtvnlb/31rWq3k88dadxU5 ZcxgA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_153427_366571_BBBCB70E 
X-CRM114-Status: GOOD (  11.34  )
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

irq_domain_add_linear() is about to be removed, replace by the
more generic irq_domain_create_linear(),
see commit 42b8b16fe56c ("irqdomain: Drop irq_domain_add_*()
functions") for details.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 5e3fae19f314..9b0bba64e91e 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -118,7 +118,7 @@ static int qepic_probe(struct platform_device *pdev)
 	if (data->irq < 0)
 		return data->irq;
 
-	data->host = irq_domain_add_linear(dev->of_node, 32, &qepic_host_ops, data);
+	data->host = irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_host_ops, data);
 	if (!data->host)
 		return -ENODEV;
 
-- 
2.49.0


