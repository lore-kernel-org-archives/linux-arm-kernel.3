Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A9CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvU0hM3mSfr3iJja3rMbx60CbQjzefnn5oZiEXrQz5U=; b=PU/hS5FHysr0V8ACOHl4qMBizR
	OUtZwwpzkH30RPS54Q8HzHySsfV/hW9+jOWrMOiOSvXbVbxFhdE5I6PZRJmnI9Sg4CU/DI3c/Vq04
	SjOEcoqudcJ/Tgduaplv+aLMkX1ZcQv/jjeBBCBD6vGLkPYQP2pAYcMcC2APDVTJkqcdCFiKoXuqV
	UmRzZ8QGVUlJNcdHjmN+MOOPvm34k8UE6TN2k/25/R+Z2K+NNZs9fwrzrcaIUoQr5rQd45td6SkoS
	/9NJBFwC86Wt7Zd6GxkwZV0fT+zLx9lcOLawGhxqDi4rXCav50R/gzVS2fVcJNT4H/9dyloqkLXZv
	voPopxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GPA-0000000AF4v-1klN;
	Thu, 02 Oct 2025 10:19:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOf-0000000AEd6-339Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:18:55 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8694A1E79;
	Thu,  2 Oct 2025 12:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400238;
	bh=P5FfwaZ45itNvpSh3qSHpUV5794nSwMnfag59fowxIk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jAP+BajwrcJxanltsVfzsFjdgV59uEpX785KjEZRq7Fy1hc8qT19QnuSr4gy5k46c
	 OFOCfiz0TP9VO/quWVdV8XlIEjLilovv1x4MMEkH6gTekxqba2sj3I/q8ErIl+ckya
	 u2DHpmXXWrEZvcoM8pSfkNdgMVQKnjGLoawEhIWc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:34 +0100
Subject: [PATCH v12 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-15-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6164;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=P5FfwaZ45itNvpSh3qSHpUV5794nSwMnfag59fowxIk=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF7ffaCm+Kmumif/DHJNdBNjH7coxlnIs7rQ
 Db5Kno0p/iJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5RewAKCRDISVd6bEV1
 Mv4OD/9prvxhxV8E3Vyq2DBnpG1npZHAoskT1qjpr5b4jBH/CPVICItF278tIC2zk8sL0usdsRz
 ASjNP86ZDDC3xCVPFMiDvVR//9/ZUZ7EAWfy83DO2bM3Sg7XTD7nazdPiVE2Xwe/lplINVmRJTG
 Immz+bniq5EWajzlUznI06nKzvKi/IqIWczznx1kgweKnll81e9I8S5ScPbn1mGsazrpD1m2pSn
 EqRSsa19rd9eEW83sxou9Q77pU7QmGVTcZW/K246dN1jXvcRgXkdL/mRUVuAOgFhLRvMgsVa8E8
 EvAar4DRnvkV2xOJ2EHBcjQiMPXuy0LCCk5gSGl3vaD4lOOKY9fe2TJNbKgfqdJmqXaopH6LFiV
 WKwm3iTSltNXnzBFck1cMD62vy1pgNtUdYVa+0wCSXZSJ42r+rGVOQyD6jhD+aYAhZwsDOJlcpp
 n02gMF7rj1tDu+2cIj/oFo6tr2jhxxL2Xp+TdKuWc6+JhJh+L2bO84nU3VTy21j7B2KZJcBv3Jb
 2p/3O5TmF7pmZYxwcY8Od0m2Kxr/eIzGXoJwDS3zHb5mAUsJwpS41Oxk+y2cEDzGRyNTjTOsN+F
 Ox6DbviTJGQ6ZoneoJgsHownh4ApvzZcIhzjhmAMw9I3fnB5QE94TBclL2+GLcFj42yxpdW7US/
 RDi09vUeU3QPryg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031850_026145_4AE80ED7 
X-CRM114-Status: GOOD (  14.91  )
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

Document the mali-c55 parameter setting by expanding the relevant
pages in both admin-guide/ and userspace-api/.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v12:

	- None

Changes in v11:

	- Updated the documentation to account for the use of the
	  V4L2 extensible params

Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v7:

	- None

Changes in v6:

	- Minor rewording

Changes in v5:

	- New patch
---
 Documentation/admin-guide/media/mali-c55.rst       | 19 ++++++-
 .../media/v4l/metafmt-arm-mali-c55.rst             | 66 +++++++++++++++++++++-
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
index 03723e0e8e43f17a04ede0032b2ddbfdb859d1e3..315f982000c48e46a2be0e7210b657d5af611e14 100644
--- a/Documentation/admin-guide/media/mali-c55.rst
+++ b/Documentation/admin-guide/media/mali-c55.rst
@@ -387,9 +387,24 @@ the processing flow the statistics can be drawn from::
                        +-------------+   |    +-------------+
                                          +-->  AWB-1
 
-At present all statistics are drawn from the 0th tap point for each algorithm;
+By default all statistics are drawn from the 0th tap point for each algorithm;
 I.E. AEXP statistics from AEXP-0 (A), AWB statistics from AWB-0 and AF
-statistics from AF-0. In the future this will be configurable.
+statistics from AF-0. This is configurable for AEXP and AWB statsistics through
+programming the ISP's parameters.
+
+.. _mali-c55-3a-params:
+
+Programming ISP Parameters
+==========================
+
+The ISP can be programmed with various parameters from userspace to apply to the
+hardware before and during video stream. This allows userspace to dynamically
+change values such as black level, white balance and lens shading gains and so
+on.
+
+The buffer format and how to populate it are described by the
+:ref:`V4L2_META_FMT_MALI_C55_PARAMS <v4l2-meta-fmt-mali-c55-params>` format,
+which should be set as the data format for the `mali-c55 3a params` video node.
 
 References
 ==========
diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
index 0bda9740a6be20df541ac7cf78e45e510f79ad19..49d6b8080ecec1013a93f5283a00a3fa0d7ebb17 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
@@ -1,10 +1,11 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _v4l2-meta-fmt-mali-c55-params:
 .. _v4l2-meta-fmt-mali-c55-stats:
 
-*************************************
-V4L2_META_FMT_MALI_C55_STATS ('C55S')
-*************************************
+*****************************************************************************
+V4L2_META_FMT_MALI_C55_STATS ('C55S'), V4L2_META_FMT_MALI_C55_PARAMS ('C55P')
+*****************************************************************************
 
 3A Statistics
 =============
@@ -23,6 +24,65 @@ of the C structure :c:type:`mali_c55_stats_buffer` defined in
 
 For details of the statistics see :c:type:`mali_c55_stats_buffer`.
 
+Configuration Parameters
+========================
+
+The configuration parameters are passed to the
+:ref:`mali-c55 3a params <mali-c55-3a-params>` metadata output video node, using
+the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
+sub-structs for each configurable area of the ISP, parameters for the Mali-C55
+use the V4L2 extensible parameters system, through which groups of parameters
+are defined as distinct structs or "blocks" which may be added to the data
+member of :c:type:`v4l2_params_buffer`. Userspace is responsible for populating
+the data member with the blocks that need to be configured by the driver, but
+need not populate it with **all** the blocks, or indeed with any at all if there
+are no configuration changes to make. Populated blocks **must** be consecutive
+in the buffer. To assist both userspace and the driver in identifying the
+blocks each block-specific struct embeds :c:type:`v4l2_params_block_header` as
+its first member and userspace must populate the type member with a value from
+:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
+into the data buffer, the combined size of all populated blocks shall be set in
+the data_size member of :c:type:`v4l2_params_buffer`. For example:
+
+.. code-block:: c
+
+	struct v4l2_params_buffer *params =
+		(struct v4l2_params_buffer *)buffer;
+
+	params->version = MALI_C55_PARAM_BUFFER_V1;
+	params->data_size = 0;
+
+	void *data = (void *)params->data;
+
+	struct mali_c55_params_awb_gains *gains =
+		(struct mali_c55_params_awb_gains *)data;
+
+	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
+	gains->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
+	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
+
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+
+	data += sizeof(struct mali_c55_params_awb_gains);
+	params->data_size += sizeof(struct mali_c55_params_awb_gains);
+
+	struct mali_c55_params_sensor_off_preshading *blc =
+		(struct mali_c55_params_sensor_off_preshading *)data;
+
+	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
+	blc->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
+	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
+
+	blc->chan00 = 51200;
+	blc->chan01 = 51200;
+	blc->chan10 = 51200;
+	blc->chan11 = 51200;
+
+	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);
+
 Arm Mali-C55 uAPI data types
 ============================
 

-- 
2.43.0


