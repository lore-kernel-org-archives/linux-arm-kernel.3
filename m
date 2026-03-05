Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D0CEEF30E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C38jdy81p0mIzFF0LJ3prC3UOsZD6FgVzym1nTZbMhQ=; b=Jq2/tcCbp9OS0/utNtBQka0rJI
	ggvz5cIALbEkDScBEoNfezqBkpTQ2SswEEfX+Jbz9NXpchCGCJqhyJCAtx3oPcMdYC2lBmPqblfae
	IHWXbiXhyTcwVrgRQ456FsqWd4u5H14MFkKV5UpVzeC9yu8+Y5dfQ+wg/6Y5aBdwTnLXmygJmsvOV
	PacvUzjrVBvogmdTUro8k3D8w9MLP2xcgIqlsOa5CUapssHWzO2nzkMtmdAYAzYaI1ep3uxf8NoES
	jgn0Gb/lp+XvfSVHj8jNXNrMYgx0Jmg2jnxzHGBRIDwWSR1TMOl3oLICZtnRuFggCLY4pbG0N6IFJ
	ooapYPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2yA-0000000152J-3KJ5;
	Thu, 05 Mar 2026 07:18:02 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2y7-0000000151K-1HcA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:18:01 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADXgGwfLqlpGypHCQ--.538S2;
	Thu, 05 Mar 2026 15:17:51 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: sudeep.holla@kernel.org,
	cristian.marussi@arm.com
Cc: sumit.garg@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] firmware: arm_scmi: optee: Check return value of tee_shm_get_va()
Date: Thu,  5 Mar 2026 15:15:33 +0800
Message-Id: <20260305071533.930896-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADXgGwfLqlpGypHCQ--.538S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4xGFyrAFy5Xry7Ww1kGrg_yoW8JFy8pF
	4YgayUtr47tF4ft34Iqrs7uFy5J3W8Gr9rKa4vya4kAwn8ArykGryUta4jgF98Ar4xt3y5
	K3WFqrZ0gFyUJrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU5FApDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_231759_719019_82E99A1A 
X-CRM114-Status: GOOD (  10.89  )
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

The function tee_shm_get_va() can return an error pointer if the shared
memory is not properly mapped or if the offset is invalid. Without this
check, passing the error pointer to subsequent memory operations could
lead to a kernel panic.

Add a check for IS_ERR() on the return value of tee_shm_get_va().

Fixes: db9cc5e67778 ("firmware: arm_scmi: Make OPTEE transport a standalone driver")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/firmware/arm_scmi/transports/optee.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07ae18d5279d..a6774152c205 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -340,6 +340,13 @@ static int setup_dynamic_shmem(struct device *dev, struct scmi_optee_channel *ch
 	}
 
 	shbuf = tee_shm_get_va(channel->tee_shm, 0);
+	if (IS_ERR(shbuf)) {
+		dev_err(channel->cinfo->dev, "failed to get shared memory VA\n");
+		tee_shm_free(channel->tee_shm);
+		channel->tee_shm = NULL;
+		return PTR_ERR(shbuf);
+	}
+
 	memset(shbuf, 0, msg_size);
 	channel->req.msg = shbuf;
 	channel->rx_len = msg_size;
-- 
2.25.1


