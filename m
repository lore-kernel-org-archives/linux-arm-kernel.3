Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E18ACCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyEBvLIVlEFAuTwsVi5L/Na1Ipb6CUbaotMtWsdpqYU=; b=qsPgPrm+RIRKUUhJqbxrWRpGUi
	DU509KEFyKK8ZRId65Jn8QsmrbrLoCtomM00r9s30IOv85zb5d68v/tbJrtPKMjmlFm7G3+4QP9oI
	8YeEM/wh4ZYnHac4TTumHainhpw0SjoWCc7PaDprFKsS0iXhKWGe6ZSz1bEAqNm3tNSxm/FHgm+U7
	tEBalC8wdbnQSg+JGzrj+lPl/k1mgwDKHvFom8FhkE9tdf2ZNo1wLMqbqmQ86jBpDRsDvC4AgGcBZ
	/BgBKIXvXaAUhU/iJ8JKdOkut7mSLUfiZICX3IU2GyEQgdfOZlmJSODQkhXx9VdI8r96PiuET6OFR
	T9vyvcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAWg-00000002Krx-1Ct9;
	Wed, 29 Oct 2025 18:04:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAWW-00000002Knt-4Btd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:03:54 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E28794EE1;
	Wed, 29 Oct 2025 19:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761760922;
	bh=eY/oR6gIBneCiyv1U57xLJ4h9FoVnMvAOPH0It6RWj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l4XNVpdgcKPaIF7GwHLThY9iMTK5s4n9KB6+6dGhPmHrvNmzZFyA6zNy1U8lfFjyc
	 m76vHEJqWHAZCMSuid3In3EoHG9551FwW9TLAUXQidm+5L6WuZ4RvTEyi0V1FXZdOM
	 z5IGxTTO22ARunLtV4WqwGeO6uYXkhRIWMbM+uI0=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v6 4/4] media: imx-mipi-csis: Support active data lanes differing from maximum
Date: Wed, 29 Oct 2025 18:03:21 +0000
Message-ID: <20251029180321.153680-5-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
References: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_110353_193284_7FF0DD5E 
X-CRM114-Status: GOOD (  12.09  )
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

Call on v4l2_get_active_data_lanes() to check if the driver reports that
the number of lanes actively used by the MIPI CSI transmitter differs to
the maximum defined in device tree.

If the number of active data lanes reported by the driver is invalid,
catch and return the error. If the operation is not supported, fall back
to the number of allowed data lanes.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 838a1ad123b5..4224ea2d80b6 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1034,6 +1034,12 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	ret = v4l2_get_active_data_lanes(csis->source.pad, csis->bus.num_data_lanes);
+	if (ret < 0)
+		goto err_unlock;
+
+	csis->num_data_lanes = ret;
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0


