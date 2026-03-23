Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76549D58CDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rU17IwayUzJkzlT94gCu0RoNcKIuHGypSP1rFl6VhyE=; b=Kb915MU6elOmR4zuPqOSFpLq7i
	6c27xyMxMTqugcT2QPC8fcNI5eqFzEgRAAVVS3Zm8G53n0ZDmq1XYIqZWMT3JK0Ald4GeAcwKpnXR
	vvI4ZnXxLvt3qpJR/xy64VzfgGG7+VpJYjOkVV0hN8rwU+4ns+VHF9K7URKZOFBnEHiOm60fmB4it
	7SqUHEwaWj8c2UZ5A0tmgd2UQAKUt7ZZWebHJsNfeZumg58k/E0HICIG1mlvJi03uptQWdEn178Ut
	N7wY9FqmASOwdPti7MFENnnmNQrfkcZDS2O3lfSUNsiwx/0fECqSyJA7Cc/V9MhWDRJmhS1/L5h1K
	J1u1/Y8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZL9-0000000GAAb-1nZP;
	Mon, 23 Mar 2026 07:04:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZL5-0000000GA9x-24Bo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:04:42 +0000
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAC31dyy5cBphAWGCw--.41446S2;
	Mon, 23 Mar 2026 15:03:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mripard@kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 15:03:14 +0800
Message-ID: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC31dyy5cBphAWGCw--.41446S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4fAFW5ArWrGF43AF18Zrb_yoW8Cryfpr
	4Y9r15Za1kJr43KFW3Zw4UZ3W5uas3AFZxGrW7W3WxuanxtFyxXr1Yka45ZFn5Ar4rCrWx
	Arn3tw1jkFyUZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_000439_905478_5B406515 
X-CRM114-Status: GOOD (  10.88  )
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

Cedrus consumes HEVC slice parameters directly from stateless V4L2
controls, but it does not validate the active reference counts or the
ref_idx_l0/ref_idx_l1 values before using them in fixed-size 16-entry
reference arrays. Oversized counts or indices can therefore walk past
the end of those arrays in the HEVC decode path.

Reject HEVC slice controls whose active reference counts or reference
indices exceed V4L2_HEVC_DPB_ENTRIES_NUM_MAX.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e..d68da1eaa7aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,28 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			ctx->bit_depth = bit_depth;
 			cedrus_reset_cap_format(ctx);
 		}
+	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SLICE_PARAMS) {
+		const struct v4l2_ctrl_hevc_slice_params *slice = ctrl->p_new.p_hevc_slice_params;
+		unsigned int i;
+
+		if (slice->num_ref_idx_l0_active_minus1 >=
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
+
+		for (i = 0; i <= slice->num_ref_idx_l0_active_minus1; i++)
+			if (slice->ref_idx_l0[i] >= V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
+
+		if (slice->slice_type == V4L2_HEVC_SLICE_TYPE_B) {
+			if (slice->num_ref_idx_l1_active_minus1 >=
+			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
+
+			for (i = 0; i <= slice->num_ref_idx_l1_active_minus1; i++)
+				if (slice->ref_idx_l1[i] >=
+				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+					return -EINVAL;
+		}
 	}
 
 	return 0;
-- 
2.50.1 (Apple Git-155)


