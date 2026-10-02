Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199BECA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JkrhIIqzoIeNFcc6svZ9n/qV+QRqnOXCMiYMizPOEOU=; b=Ibpj56aH5P+9jX7iTTPcy5wCio
	kQsLifQ5qRxtLjkt0mWpd5pylhTqb+fbQCHYbfUyxKTpuH9YckDM/jC1JUsZ0tu64iPivoUwOsrMI
	i9v/E+I42AeeiOfEGYkFLsMq0+TvYiJ7QzciA6wH1BPrl1b5JRPmxUeE37Wl6r+BhZzKvBduDKmXs
	fZ5Sv6gqjMkKeFhd7ETsCscXD64/iSWwKke6sldjbJnWarb45lBi69bkS7URPy3EFFR61rEsRrs+j
	iCJ9I6Tzul8Z4PPGo4tDgJX1KTY8sE9BwpoOjT4n1uOfsNmOymrvHyVuOjTM4uEf/C5AbUAB4DjR6
	XoAsl0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYq0-0000000B1PI-0g2N;
	Fri, 02 Oct 2026 08:41:52 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYpw-0000000B1Om-41hy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:41:50 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 02 Oct 2026 17:41:46 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id C2BCB2091574;
	Fri,  2 Oct 2026 17:41:46 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Fri, 2 Oct 2026 17:41:46 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 13CE7175A;
	Fri,  2 Oct 2026 17:41:46 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] reset: scmi: Set the device for the reset controller
Date: Fri,  2 Oct 2026 17:41:42 +0900
Message-Id: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_014149_336575_B5AF069C 
X-CRM114-Status: GOOD (  11.57  )
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

SCMI reset driver does not set rcdev.dev when registering its reset
controller.

If rcdev.of_node is not available, the reset core tries to obtain
the firmware node from rcdev.dev. However, rcdev.dev is also NULL,
causing a NULL pointer dereference.

Set rcdev.dev to the SCMI device.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/reset/reset-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 8be5743cc8fd..1523245f83ef 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -107,6 +107,7 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 
 	data->rcdev.ops = &scmi_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.dev = dev;
 	data->rcdev.of_node = np;
 	data->rcdev.nr_resets = reset_ops->num_domains_get(ph);
 	data->ph = ph;
-- 
2.34.1


