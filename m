Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E399CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14nUfVk7WpJs/hCvB3XZsd3QLEa/91x42irJlD7Ode8=; b=ww2r4unZL0X29txp3TWuNVUr9a
	/jSvApl3z2rv51jYiMStwrZzj0Ob9hj7ALJJ6PgrOQm3l9WTK1tpC2ZjlwCn8Ph0/s8oGuRu07c+9
	pF8qJ657L52ZWE9cgY+JsCQLI0LHVDuMsstOM1Ps5U3Z4TqZf4VXVDfsETJ09L7DxpoF98dpUvFfJ
	adi3oLpEQjNfxgV+p7gNS/cC73U5jNU0xlzo4bB5fnCF/FV9psPkrhmRhXzaBkhPmIMD9IFN5L2B1
	iS8Saqz9FR9277UrPJAsDFf7hhLkrdJ1a+qwJJHbP472bTC7qC8HMR++F8DgwZnhvnVxRA9Kn/1kx
	+NZhnpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcim-0000000C2cS-3Npv;
	Tue, 14 Jul 2026 12:58:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcih-0000000C2Yu-40yl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DDAF601ED;
	Tue, 14 Jul 2026 12:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3116D1F00A3F;
	Tue, 14 Jul 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033922;
	bh=14nUfVk7WpJs/hCvB3XZsd3QLEa/91x42irJlD7Ode8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KuNZuvQslRF0GNpVdkbzXFSKbAgsntsUx50AO1b/vjR2WOMm3nKxh5h3NvSNcGKCh
	 Lg83fEWfmyQaOUEKZytSQmGbcVWb6sCPC/ca/acPuxChOjT2mfmeeY53HJzBoduYBg
	 Wj3EF1uBjv6xnnxTl6yyk3s2pnDC/m0suf0c8Xtqi/mvh1opDu/FHb2QFzRgbYZDqk
	 W8BGTAH/f7yBhv7xgc/Zc3EfzFcs+B09hzUvhnZZ8oo1e4zdOzpwmwPNNGESQa8Bki
	 d1ZFtgj67ryGRkdLnVPcgolp7rwaEiviRxONby+d2vvQ6uEGQB/8yhy9SB++gxcj/Q
	 OZI1BdjiAZyBg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:24 +0100
Subject: [PATCH v6 05/16] firmware: arm_scmi: Free transport channel on IDR
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-5-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

If transport channel setup succeeds but the following IDR insertion fails,
the error path destroys the transport device and frees the channel info
without invoking the transport cleanup callback.

Call chan_free() before destroying the device so transport specific
resources such as IRQs, mailbox channels and mapped shared memory are
released consistently with the normal teardown path.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d2af47d03b4b..6ee2152f6b01 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);

-- 
2.43.0


