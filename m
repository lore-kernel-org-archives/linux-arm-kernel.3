Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136FCC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXscObzh3DkEyIQWVmpSPGAHQPgvZ8MPlkdXCgu2dPo=; b=dmP+C/85/wM5KpAI9dH3iT6aV0
	ublzaFzVOyFZsMKqkRbBgCQdZ+ad+KanRf1a4FahW6EYWMLVy9cIrHxyt+zRdtmehA8GM1Q0UnyH5
	Y9QWxrQESpg77j3xvBvnFhgao+aL5RicNcJ+4mC5FLRO7RMgQ6m3uU9TfWm/udrJCu7sZxswAgSyx
	SaIzGpdx06t+u1YNHIqDNGIS+/hAjAG7/lpMpDlynWLC0pqTCCsu8pnu+qMrG6iuJuQidHqHvlI7x
	fp3QLPQm/8vQhba+mgtILmriBeRaMbiDzlb4e7ad7iLMTUTUU2ZwNVW7LN8kC+pt+U331yZfVEKS6
	sCGi0e+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzH0s-00000000mCC-2wIk;
	Mon, 31 Mar 2025 15:25:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGXT-00000000eMy-3rn3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 534315C5664;
	Mon, 31 Mar 2025 14:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59C7C4CEE4;
	Mon, 31 Mar 2025 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432899;
	bh=uQFa8VPa77pMARASFQnw4YhBH/IrNw7QrbHmXyIPycs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uEo3XeCZJoH02rQfCwc4vZMxEMa+/2M9AOP1vOrnVtVxUEDZbVTrYLN+xlT6n5peQ
	 c2laTtrcvtfbDg9B79pNeM/HZAOkzTwCTSTy5DYqjBWmQPWJlSq1BelP2Xw69i1VW/
	 x92454ZBZvMopaa/PB9YJw50PAD5DL/yAnvUQizTT00PdM7rjBDmDz4vMSjH26j54a
	 WM/pc7bdAiFbirpw/QI4YHbeF62H7/jrDLpIkR+flvECYHBPNwDU3zYSBAYckVp2XA
	 4WtmTbnMNc8WBJZoWxSw+gWFCHDikpVkqPWUDrP+TRNb3EnNuEH33Dhp0E4bsrWsLZ
	 sr+CJG891X8+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sasha Levin <sashal@kernel.org>,
	andrzej.hajda@intel.com,
	mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 19/24] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Mon, 31 Mar 2025 10:53:59 -0400
Message-Id: <20250331145404.1705141-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145404.1705141-1-sashal@kernel.org>
References: <20250331145404.1705141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_075500_005362_5C9AA675 
X-CRM114-Status: GOOD (  11.11  )
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

From: Aakarsh Jain <aakarsh.jain@samsung.com>

[ Upstream commit 7d0d0b2342bebc47a46499cdf21257ed1e58c4aa ]

There is a possibility of getting page fault if the overall
buffer size is not aligned to 256bytes. Since MFC does read
operation only and it won't corrupt the data values even if
it reads the extra bytes.
Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M
and V4L2_PIX_FMT_NV21M pixel format.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 73f7af674c01b..0c636090d723d 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
@@ -549,8 +549,9 @@ static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
 		case V4L2_PIX_FMT_NV21M:
 			ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
 			ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
-			ctx->luma_size = ctx->stride[0] * ALIGN(ctx->img_height, 16);
-			ctx->chroma_size =  ctx->stride[0] * ALIGN(ctx->img_height / 2, 16);
+			ctx->luma_size = ALIGN(ctx->stride[0] * ALIGN(ctx->img_height, 16), 256);
+			ctx->chroma_size = ALIGN(ctx->stride[0] * ALIGN(ctx->img_height / 2, 16),
+					256);
 			break;
 		case V4L2_PIX_FMT_YUV420M:
 		case V4L2_PIX_FMT_YVU420M:
-- 
2.39.5


