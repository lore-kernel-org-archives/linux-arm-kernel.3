Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3369CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bM67XKNBE4K7VDelA3Yrh35RZW4COAs1/kESRjnSwQw=; b=m6Kzn0Q+wQ9bSiOQHvZDBknvba
	5wlcA6Kj0iRZ8rIsSLsbUm4cmtDjHZRvQPPUNTcrRbI39z9o3x+divR3nViim3UmRRfu4Q2U7NQpA
	BeMReUKT8UdBAQO7DbbbiVJnDEJrrD++SNq5z0oucfqvgtFl6T94rywFGgdU/U9tStNVQSiuK9bT/
	mkYCp8JTJ9jaUBw2fa0Lylvk7iYfaM5+qRdGZDaOb+ID+GfN9PETWfQIcZCYFbBeJQ9N71C6zBiwS
	duwBWBU76A9s9WIjiHN9LiuQGI1ji0jNPEmglCegnG2aQ8/UWmEJdiTqFl3Y8Is500RAISR+j6L40
	4LRSrQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHy2-0000000F1hv-1ubA;
	Tue, 16 Jun 2026 00:47:50 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHxz-0000000F1hZ-0yd6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:47:49 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAB3ldwvnTBqZ3_eFA--.5283S2;
	Tue, 16 Jun 2026 08:47:43 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] firmware: ti_sci: undo list publication on populate failure
Date: Tue, 16 Jun 2026 08:47:41 +0800
Message-ID: <20260616004741.1726-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAB3ldwvnTBqZ3_eFA--.5283S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWxCr1xAr13JF1Dtry8uFg_yoWkurg_u3
	45uFyDGr4kKrWDKF17KayfArZYyrZ5uw10qrWIyrsIqFy3X3Z8XFyUZrn7Cw18CFWqyry5
	Cws0yw4IkwnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeKsjUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_174747_640664_CDBCA9C6 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

ti_sci_probe() publishes the controller on the global ti_sci_list before
creating child devices.  If of_platform_populate() fails after creating
some children, the probe error path leaves the children around and leaves
the failed controller visible through ti_sci_get_handle().

Depopulate any children created by the failed populate call and remove
the controller from the global list before returning the probe error.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/firmware/ti_sci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index e027a2bd8f26..670ed1fcd8ef 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -4050,6 +4050,10 @@ static int ti_sci_probe(struct platform_device *pdev)
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
+		of_platform_depopulate(dev);
+		mutex_lock(&ti_sci_list_mutex);
+		list_del(&info->node);
+		mutex_unlock(&ti_sci_list_mutex);
 		goto out;
 	}
 	return 0;
-- 
2.50.1 (Apple Git-155)


