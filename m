Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FDBC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 03:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=8qpJCAdMbp5JmaXKzVJ75C3QSwF3Nen3LlJUVevvP3A=; b=1vTFwyuX/YHRUh
	u85z/A9dBixzPYQWb3YcDgsf/4mebOtN7pt7k3Z9rhLKNVwmrWjxMh9J/KOpbtypaGUIFCM9cmJmb
	fsV+LGI/1iJwd/DKNrv7ph55I/r8YSSW8XE1W80fkHbzMD3epN9UnKMKVu5XR6sG9PwUwj9aF5K9d
	tMvzNI1maDdN0QRXfctDZPV0B4taJG/Ynu43xJsJ2NnWJOj7Q2xKctA7WQvbOu9xUljA4ynHAbcXx
	v2Mi9OARVJcwbQvbhZuCwgI1OMs5VBYPVwuFgcYDSX/Rel5pXmiVUjOiELEUp3qrrTiq8QOfSFWA/
	SumSnQh+WgWhYb5oU9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnUl2-00000006DDD-3ZJa;
	Thu, 27 Feb 2025 03:40:20 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnUi0-00000006CsG-36Uy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 03:37:14 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250227033709epoutp0280a988bd59cb9e6764294c6697f47194~n82zVNosh3171431714epoutp02L
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 03:37:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250227033709epoutp0280a988bd59cb9e6764294c6697f47194~n82zVNosh3171431714epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740627429;
	bh=8qpJCAdMbp5JmaXKzVJ75C3QSwF3Nen3LlJUVevvP3A=;
	h=From:To:Cc:Subject:Date:References:From;
	b=hd/aLA87jezeV38kovpbA/d/x/CiWANPO/DzkB9ewgjXAJJsNp4pcD6yAaPRQ04FZ
	 z2eddlZj8SYrDA9eN4GputqwcVCMFxwuVQzE1grMfoFdSbPOJskn+fxd/5msqrmKU+
	 HzqUbI+CfoCU3/iZYcKJ0ZwMDpWba+s9TE21SpqU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250227033709epcas5p2a660339d8d1342c9e4deb76d58e34b7a~n82zB_3hT0231602316epcas5p2w;
	Thu, 27 Feb 2025 03:37:09 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Z3H8M5DPZz4x9Q2; Thu, 27 Feb
	2025 03:37:07 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6F.33.29212.3EDDFB76; Thu, 27 Feb 2025 12:37:07 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef~nu0EWhdBB2952329523epcas5p3c;
	Wed, 26 Feb 2025 10:27:49 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250226102749epsmtrp1e2e7ebc583d047cad490833fb912e42a~nu0EVt4mP1973819738epsmtrp1r;
	Wed, 26 Feb 2025 10:27:49 +0000 (GMT)
X-AuditID: b6c32a50-7ebff7000000721c-74-67bfdde3d4ba
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8B.2C.18949.5ACEEB76; Wed, 26 Feb 2025 19:27:49 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250226102747epsmtip2e91ed84807afc306cf7127cc44eeb79d~nu0CkZLAL0603906039epsmtip2s;
	Wed, 26 Feb 2025 10:27:47 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [Patch v2] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Wed, 26 Feb 2025 15:52:51 +0530
Message-Id: <20250226102251.9040-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmuu7ju/vTDd5eV7Z4umMmq8X9xZ9Z
	LA5t3spucfPATiaLizPvslj0vXjIbLHp8TVWi8u75rBZ9GzYymox4/w+Jou1R+6yWyzb9IfJ
	YtHWL+wOvB6L97xk8ti0qpPN4861PWwem5fUe/RtWcXo8XmTnMepr5/ZA9ijsm0yUhNTUosU
	UvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgK5VUihLzCkFCgUkFhcr
	6dvZFOWXlqQqZOQXl9gqpRak5BSYFOgVJ+YWl+al6+WlllgZGhgYmQIVJmRnnGwtLjjPW9H7
	LamB8R53FyMnh4SAicTFYyfZQWwhgT2MEqd+F3cxcgHZnxglDux+zQThfGOUuH/rJgtMx8vz
	d9kgEnsZJY5f/c8O4XxhlGidfhGoioODTUBX4uz2HJAGEYFUiVfr1rKC1DALLGGSWHTkGRNI
	QljAVWLhg3vMIDaLgKrE3V/3WEFsXgEbiU9n30Ntk5dYveEAM0izhMBbdokXL1rZIRIuErtW
	9LFC2MISr45vgYpLSbzsb4OykyUeL3rJDGHnSKzfMwVqqL3EgStzwA5lFtCUWL9LHyIsKzH1
	1Dqw25gF+CR6fz9hgojzSuyYB2OrScy58wNqrYzE4dVLGSFsD4mNew9DwzFWomV3G+MERtlZ
	CBsWMDKuYpRKLSjOTU9NNi0w1M1LLYfHU3J+7iZGcBrUCtjBuHrDX71DjEwcjIcYJTiYlUR4
	OTP3pAvxpiRWVqUW5ccXleakFh9iNAUG2kRmKdHkfGAiziuJNzSxNDAxMzMzsTQ2M1QS523e
	2ZIuJJCeWJKanZpakFoE08fEwSnVwFRe/v9D6Exl9tBbPvaMoq7MO9RjNTTFEgxKVu2w7dk1
	a8nm1L8CS9o9Dl7QmPKe6YSm8k81lS+ZXQ0GmznP/1rNp9ohFaw47fOHabI1GYyfXcr/XftS
	nrSrZuU+vWks/advlirpW3+93XP3qeDLg84cS7Wzav2nvv3+9hiPV5v7ssk/fLpcZ0munC9x
	TnRJ167ZIecOn+PTV7ulonzBnCVtGQfjrSfrsqXT1y0y4ig6LCqhd45d3GLHOoH12dOLk3bv
	vF83W/Nr0Qezq4X584tMvt0QqzsnUsQ4a1eMY8vLR1xexRUeSas7mZ+dLm88UdXbqGj39/ma
	W7ypDO3qQRqdkXEHbCLcXabnqoceUmIpzkg01GIuKk4EAIB/vNQMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCLMWRmVeSWpSXmKPExsWy7bCSvO7SN/vSDZr3clg83TGT1eL+4s8s
	Foc2b2W3uHlgJ5PFxZl3WSz6Xjxkttj0+BqrxeVdc9gsejZsZbWYcX4fk8XaI3fZLZZt+sNk
	sWjrF3YHXo/Fe14yeWxa1cnmcefaHjaPzUvqPfq2rGL0+LxJzuPU18/sAexRXDYpqTmZZalF
	+nYJXBknW4sLzvNW9H5LamC8x93FyMkhIWAi8fL8XbYuRi4OIYHdjBJ/t+1jg0jISPxvO8YO
	YQtLrPz3nB2i6BOjxP91G1m7GDk42AR0Jc5uzwGpERFIl5h05ysLSA2zwDomiZ0rJ7KCJIQF
	XCUWPrjHDGKzCKhK3P11DyzOK2Aj8ensexaIBfISqzccYJ7AyLOAkWEVo2RqQXFuem6xYYFR
	Xmq5XnFibnFpXrpecn7uJkZwQGpp7WDcs+qD3iFGJg7GQ4wSHMxKIrycmXvShXhTEiurUovy
	44tKc1KLDzFKc7AoifN+e92bIiSQnliSmp2aWpBaBJNl4uCUamC68Ddq5QnFdeKBn6s3+KrZ
	nct68Nup60ml8ralt8xydde7772be3eW+8kq7StPns6crWkw2031Yv9h/YbJ/X4MTpIVW5/W
	1XXOcXtkV5kxN2tms2q3/f/pBxc93JuZGPy3mWXfxjSG6vqnS4OXBv/f3szmyR8u4DDlfOCR
	CDNtBa0s3kdORsy/ZP2uxba/lWyzDJSKrFyxyfNAZ4VIGs8+94gio/xW67zqScxMP9fVy/PM
	O5Z16kzYVm/dtgOqCr7XZy/PUY+rVZBXP9W7dVqhGe+UHdFl59wD/Hk4Mze+u/3rzb79/5a8
	87i8zfdx/vLD26Y8n3nzRVf04wz7kOITzjlT1H1i9x+xZvj97JMSS3FGoqEWc1FxIgCA2WvN
	twIAAA==
X-CMS-MailID: 20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef
References: <CGME20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_193713_091340_121DF156 
X-CRM114-Status: GOOD (  15.77  )
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

There is a possibility of getting page fault if the overall
buffer size is not aligned to 256bytes. Since MFC does read
operation only and it won't corrupt the data values even if
it reads the extra bytes.
Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M
and V4L2_PIX_FMT_NV21M pixel format.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
changelog:
v1->v2
Patch link: https://patchwork.kernel.org/project/linux-media/patch/20240806115714.29828-1-aakarsh.jain@samsung.com/
Removed duplicate code and aligned luma and chroma size
to multiple of 256bytes as suggested by Hans.
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 73f7af674c01..0c636090d723 100644
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
2.17.1


