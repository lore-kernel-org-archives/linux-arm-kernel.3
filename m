Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C55BD4A5EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SOpAkrurgZZ+XgghofR9vRH2MXo+1yAlhLPtvMwp1yo=; b=AvxkkSsYW6g5A6bSIwN3MRssoZ
	XmJofPC5GA63f6TeeKCTzuRM2ibpfjA32jYF5Exrr5G5AgV/31bJfQ66DWmuWBM+geZbFWtpxGbkO
	gHkjdt6SO2L2wZxrUUxVKIzga588JTHZ52Scvtv+wThzKU0WPR3f1mFS6U3yXa1jaeOcAbcjB8B2D
	7pBlJLAlSxBGFEnS1VAsYlQp71dDIGSIMv2MpLGJxfqDRUZtAMc4WbPysVUrB6yXT3p/c1eDkub3k
	PYK11inz6wz96wBbdqZQAlAPZvLGdrCZCWkFu4YfYnKMdcLUiDH0ItT7h4XvFBrrYs5QrOMfFLP6B
	kkWqgqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiGk-00000001NvH-20AR;
	Mon, 19 Jan 2026 05:57:42 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiGh-00000001NuX-2GLY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 05:57:41 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADX9NvOx21pkW+9BQ--.64349S2;
	Mon, 19 Jan 2026 13:57:34 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: qiang.zhao@nxp.com,
	chleroy@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler install/remove
Date: Mon, 19 Jan 2026 13:57:15 +0800
Message-Id: <20260119055715.889001-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX9NvOx21pkW+9BQ--.64349S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1fKr4kGryrKryxXw1DKFg_yoWDtrXE9w
	4jvr97Wr10vr9IvF12kwsxAFyrZr4UWwn29wsYqayay348trW5XFy2qFnxCrn7WF48Arnr
	Grn8Z393C348ujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVWYoVW2owAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
	ZEXa7sR_AR65UUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_215739_966918_E6468893 
X-CRM114-Status: GOOD (  11.14  )
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

The driver currently sets the handler data and the chained handler in
two separate steps. This creates a theoretical race window where an
interrupt could fire after the handler is set but before the data is
assigned, leading to a NULL pointer dereference.

Replace the two calls with irq_set_chained_handler_and_data() to set
both the handler and its data atomically under the irq_desc->lock.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 61dd09fec6f6..8e2107e2cde5 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -114,8 +114,7 @@ static int qepic_probe(struct platform_device *pdev)
 	if (!data->host)
 		return -ENODEV;
 
-	irq_set_handler_data(irq, data);
-	irq_set_chained_handler(irq, qepic_cascade);
+	irq_set_chained_handler_and_data(irq, qepic_cascade, data);
 
 	return 0;
 }
-- 
2.25.1


