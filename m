Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C716C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eemCSxLVEosFJ70MWmOxEAPXsjZ44shUjMRdUXsw+jc=; b=PB9P8qz8a3VDy32PdcA3uGExBX
	BIz/MbkkI4qGRpnRMhQ9enMEfJhRPFL8G1VwVRrGZFJRuJfgiAN6sbDcg/nY0OWjEsFGB6XQ/i1VT
	l/owTrZ5KcONmFOfjKvLlaSfHD8gKc8rYpoQUrnSc+XLGaS0oWP/UiVmCpaywKGQ1218dYBgvRZs1
	tVnnw5skb55TkFYH+X4IxLT3FOWKBYBVxXwi7cI9du2d319LfPoz1ChdT8+86saqr1MZDgyRxID3V
	XIMrHGsQYr3TxI4PsSERdF1QLkTYYnOjmq6FiVmnf58xF6d+jo+kUXL4SvjBIrFN++kW16T2reUzt
	KD3HpsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSo1-0000000As41-0UqF;
	Thu, 30 Jul 2026 15:36:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSny-0000000As3H-2Vni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 15:36:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caced6038eso11112815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785425777; x=1786030577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eemCSxLVEosFJ70MWmOxEAPXsjZ44shUjMRdUXsw+jc=;
        b=o4ZXHPVsEO9B7+nZt6MFql5AzTw5Ap+Aj9Lv4CdRlbT2ncFbbOZ4GXXwBW2T64eJDU
         DhJYAqn6yFXZKBvJZkooTqTsotVOEZvx7jERAETkjbvrbfiAzR9+x6bt0oNtBL68cPKA
         CWB061GT/WBOkEQ1tVaBXDsa4U08YXsanq1Xa0FHb9C34vkgU4DwOWqTDKui4EIcfTs7
         gc/XdbAI/JluK/adGAYZTKgEbFyM2aqnCT9i6up1Y2/GZF9ydA/ECY4b8N9mTS4Xp2gI
         Xuz3stetkjTUtI+Yxp5rYGhwjCYMTOqj/6NOtkXmA4mEVqVkMxGSwVofqlQezGY856zW
         00Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425777; x=1786030577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eemCSxLVEosFJ70MWmOxEAPXsjZ44shUjMRdUXsw+jc=;
        b=fSkCGVgLtolKwRry2aKv8E8TBk47LlriodKYLMQr4hfkULC4y0N9sh5i8OSplppkXf
         utKmNOQml2Y1lgnJ4yCWmT2SsWUVf96wAzOkOM1eXvwHad89DgYkh5zZg1p6bbb3r4QU
         u4HKfj7HjlPPHKq8Y+ETYLVPtl68wuumXeoJF8QQtVySE95fdYcwl33xWpAyZF00qZTz
         fszbACGSa1u63VuQ51kqJIIdAkHvVbBr3pZaYgP755YI+kt2IE4qfK9lVpuA9mIA4OmW
         UY4NWiuXshapneOFSKoZSHuWrfO+8gIp/grDSMpJ6qsnYlIMwKM6ZNq+3fJeRnx8T95a
         E8vw==
X-Forwarded-Encrypted: i=1; AHgh+RqJrsHITNOu6dB5Vfu2o2C0t38qMlnhpNUD1sGjVPpgI3xWtVFdIrmNIFio93msZrGxxhBB/I5tkwAs8iNwFF8s@lists.infradead.org
X-Gm-Message-State: AOJu0Yygf/a43KWflPCpgNgZRrkSAWRtcxj5eMgE3wt5RQNubROSJ2Sh
	swqUaNSC3nM8HWSgsX4UtPJb5B/3x9Wh8eRR+uCz9cavNiBa0430Yr1G
X-Gm-Gg: AR+sD12s5QysAP1WHZ+MIiyo7uomb7ThVyGZ4SsESBiMjXq7dJA/WZnob7jmZ+wml0O
	t6XSP08mYWTpX7yMo3e1Nw0ByXbppihwD1eEg/Gr625hUCVJ0I1OhvAAS+OYk+ePPejU2pcIqRt
	FsdM4xAHtkTOXMylmAL7cVe5nXj9BUY/jHgWwL/KKOl3QbEzcbKSJZzYRG05l5x4Yo1ioNFEpmM
	H4BJOkvlF2LMY/lqX3lf69xUyGLbp09V1MSscCpHj9jBj4/9XOSfd7cJxfl7DaROOCTDy3sQtrR
	DEWoY2+oClyXtDIqRilG2ut1CMSDM8wzz+ZbbKO22lR4RhlEIrybu5974bm1JSj3agp/3cj+o55
	rEvZN6M0K7APREtsGzXNPqHcH+jsVZBPZ2cvlRx7sIBIb7fsoKEDjeiakqO4XrZbBrb4u+zRGTe
	xU8UIOrl8aoAPzTw1N9Pw5S7qlGiILJFBXqKs6Dmq5RlLtZZ/YMkcHU6mbExmIb/r6iro0J1o1+
	py1uPmO/eTTm+tm43kF0tcj4ZCHLBonpxujXlsCiRVpKw==
X-Received: by 2002:a17:903:1104:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2d03e9b6bd5mr5417115ad.16.1785425777367;
        Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.25.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a46969sm28820085ad.25.2026.07.30.08.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: rkvdec: fix v4l2-compliance failure
Date: Thu, 30 Jul 2026 15:36:03 +0000
Message-ID: <20260730153603.5721-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_083618_640731_C5DF1AC6 
X-CRM114-Status: GOOD (  12.58  )
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

rkvdec fails v4l2-compliance in two tests related to
V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
sps->chroma_format_idc == 0, which is the value returned when the
control has no default.

    v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
    v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
    Control ioctls:
        fail: v4l2-test-controls.cpp(942):
	try_ext_ctrls returned an error (22)
      test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
    Buffer ioctls:
        fail: v4l2-test-buffers.cpp(3102): node->streamon(q.g_type())
        fail: v4l2-test-buffers.cpp(3157): testBlockingDQBuf(node, m2m_q)
      test blocking wait: FAIL

Provide a control default via p_def with chroma_format_idc = 1 (4:2:0),
which is the only value the VDPU38x SPS validation accepts.
This fixes both the Control ioctls and the Buffer ioctls failures.

Tested on Radxa Rock 5B (RK3588).

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..37603f049788 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
 };
 
+static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default = {
+	.chroma_format_idc = 1,
+};
+
 static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
@@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.p_def.p_hevc_sps = &vdpu38x_hevc_sps_default,
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
-- 
2.47.3


