Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0B2C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYN742BU4QoGAEOlciNNllSX/o+WfGmjoxd1QHyYyXc=; b=gCpVpfEMILFBNRi3TDzkMv5+Dd
	rZS+jaBo5WUrTgUdC/cC6VfYr6FPRWFpOjyq/FyW+GcPsSURlXXehARZxrB6hzhiXLsOi55xUagm+
	K99EdnUR61vN4z2yOU6Mu5br1BcEqBXVk8Pb/hLa159Lqk6paBnd6h8oZJLNtRN2YzEO2ZhMGJQsa
	AekSXhRIFYXwGWyDW+qPSE1bH1T6UxbYP7YUxoVMHxOXPWneoCJ7wv14v+Wxd4UxNrin+52IZxKei
	N2GV0GREx/kmNcO773xilLtmbaooxcTkAZCdwm6oz9/YPoV0JKRsr/G1BwXlCRMWsdUWHbh99lQUJ
	2puCEzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupvY-00000008X0E-0DnZ;
	Wed, 19 Mar 2025 09:41:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupnS-00000008Uzm-3Qj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BB895C5A7C;
	Wed, 19 Mar 2025 09:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324D0C4CEF0;
	Wed, 19 Mar 2025 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376790;
	bh=lidN/QLL8lJclrXx9KsiwC+GwLwp1Sp0oSxXq93ZbfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJyKCYDsJp7yl/+479P7DpVX76p15OAjRaI0jRC0YbCy/GtuHNPKx/jxOA5lNJOd/
	 I6dtTMeyPOxy4WjUrbFNtbDvf88RVHgUtb4XwevspfvXNEqwByb6eF5xZWh25Y5dVj
	 LMtWq020UsOXFnZ3xlN3NWY2nf5EmuRwz7TwYY6KS86lJCGyB3zjLwt0EcqzhJS/cB
	 0sS+NpfcksXilvhcHWjpA4AouTdeawd5KcDM7eKzkyQ6il5tghRgZK6R0hlXWDZW24
	 KTee1eqqvzSA6OR2KHIPLALwZ6avJj8TOwOnAZ30PbvP/BIf7apK0f2tPyMLvUXINB
	 7+LK4W7r1G2XA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 48/57] irqdomain: soc: Switch to irq_find_mapping()
Date: Wed, 19 Mar 2025 10:29:41 +0100
Message-ID: <20250319092951.37667-49-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_023310_898632_8C818E57 
X-CRM114-Status: GOOD (  11.79  )
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

irq_linear_revmap() is deprecated, so remove all its uses and supersede
them by an identical call to irq_find_mapping().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/soc/fsl/qe/qe_ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index e5831c298ad6..e4b6ff2cc76b 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -344,7 +344,7 @@ static unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
 	if (irq == 0)
 		return 0;
 
-	return irq_linear_revmap(qe_ic->irqhost, irq);
+	return irq_find_mapping(qe_ic->irqhost, irq);
 }
 
 /* Return an interrupt vector or 0 if no interrupt is pending. */
@@ -360,7 +360,7 @@ static unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 	if (irq == 0)
 		return 0;
 
-	return irq_linear_revmap(qe_ic->irqhost, irq);
+	return irq_find_mapping(qe_ic->irqhost, irq);
 }
 
 static void qe_ic_cascade_low(struct irq_desc *desc)
-- 
2.49.0


