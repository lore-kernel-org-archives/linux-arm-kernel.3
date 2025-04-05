Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8863C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u22/p801QpjbmO2uhuEVgNGBkidyKPFcQ/iS9BFuS5s=; b=n8iu983hAy9Y4RNrvCULoifnwa
	J1eLPOThM55RUCJLNWHZRAHnVaVvfTycFcq1M7fZYFdb7SStY2pu2aAdNLFqYgKhnGKo8idBNBJwm
	qCLumoAoPXH7QFiyqAJHUt//kkgfmItrSAYRNa0tQTIxV0Vw4wWlHuPPskjMml9mWACcbP93sb5av
	Vv2eif0/snjq2PyKHtFu7xy3kCqecM9Uhwxd4PcHJaVRRY6fCP2Wcr2y+RMeNi4OSAUSLbSKsa6pH
	VVwSFlRdQkyY4bdLszAIzvXdZL4+F9oiuMAJ+VMXSs+Ap4JvekVCu8fNCStuNn2w+poYIvZfKSkEY
	zMO79Qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11uG-0000000DuYV-2VIX;
	Sat, 05 Apr 2025 11:41:48 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11sV-0000000DuOJ-3x2N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 11:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1743853187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Aa6oaPo1O8q5AnU3Y1pDWWTPdKizSQIPiPsuolBj0+UXeYqsgn0k47Anir04kue1g6//wjVUP2WdE5A5T1jazvVJ+dRrp+PeVACtY7tDohXss+Dy6KSxROCdjHxfq138OoQ6nk540GNEiVO7kf2DWUPZnlSLqiEOS0lVvGQkv5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743853187; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u22/p801QpjbmO2uhuEVgNGBkidyKPFcQ/iS9BFuS5s=; 
	b=C6tx3IbtjTxMSj1ltGQIdc0SqC41cRFACrYH6ttVX+mZ0bAu/JRCUlY7SDnMlzS/F2uPl+b1I+67ID/JPyyVD0iYag6OvfmnT6n/X3T0X8P54b+wFS0VN8XDL0BzEheNhrUPzaEud8+Nxc7sLGGI2w0w8VTNFzFuBkAIaAVs0ck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743853187;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=u22/p801QpjbmO2uhuEVgNGBkidyKPFcQ/iS9BFuS5s=;
	b=N5V51+Jb9Oh2VGeiRlqjxid+joMaQTSEkiQ9MwACEgsC7n39G9abF4/SBpLXjn+3
	k0EBFHBIzQ+Buelbr5cpB2kxwFQ9i0zv3t7mUBJZlUFlcZf01TgEZNpBYSPdaG5HCLD
	8NQpC9CzYLcbnkQBXVUcc0bjmGU7L9QQal3l2dO0=
Received: by mx.zohomail.com with SMTPS id 1743853184816112.34259230527698;
	Sat, 5 Apr 2025 04:39:44 -0700 (PDT)
Date: Sat, 5 Apr 2025 13:39:36 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] media: imx-jpeg: Enhance error handling in buffer
 allocation
Message-ID: <20250405113936.oepkmoz2czytbuxy@basti-XPS-13-9310>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-2-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328063056.762-2-ming.qian@oss.nxp.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_044000_019479_76A17EF7 
X-CRM114-Status: GOOD (  13.49  )
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

Hey Ming,

In the title I'd suggest:
media: imx-jpeg: Cleanup after an allocation error

To be a bit more concrete, enhance error handling can mean pretty much
anything.

On 28.03.2025 14:30, ming.qian@oss.nxp.com wrote:
>From: Ming Qian <ming.qian@oss.nxp.com>
>
>In function mxc_jpeg_alloc_slot_data, driver will allocate some dma
>buffer, but only return error if certain allocation failed.
>
>Without cleanup the allocation failure, the next time it will return
>success directly, but let some buffer be uninitialized.
>It may result in accessing a null pointer.
>
>Clean up if error occurs in the allocation.

I'd suggest:

When allocation failures are not cleaned up by the driver, further allocation
errors will be false-positives, which will cause buffers to remain
uninitialized and cause NULL pointer dereferences.
Clean up the errors accordingly.

>
>Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
>v2
>- Add the Fixes tag
>
> .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 +++++++++++--------
> 1 file changed, 27 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>index 0e6ee997284b..12661c177f5a 100644
>--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>@@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
> 	return -1;
> }
>
>+static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>+{
>+	/* free descriptor for decoding/encoding phase */
>+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>+			  jpeg->slot_data.desc,
>+			  jpeg->slot_data.desc_handle);
>+	jpeg->slot_data.desc = NULL;
>+	jpeg->slot_data.desc_handle = 0;
>+
>+	/* free descriptor for encoder configuration phase / decoder DHT */
>+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>+			  jpeg->slot_data.cfg_desc,
>+			  jpeg->slot_data.cfg_desc_handle);
>+	jpeg->slot_data.cfg_desc_handle = 0;
>+	jpeg->slot_data.cfg_desc = NULL;
>+
>+	/* free configuration stream */
>+	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>+			  jpeg->slot_data.cfg_stream_vaddr,
>+			  jpeg->slot_data.cfg_stream_handle);
>+	jpeg->slot_data.cfg_stream_vaddr = NULL;
>+	jpeg->slot_data.cfg_stream_handle = 0;
>+
>+	jpeg->slot_data.used = false;
>+}
>+
> static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> {
> 	struct mxc_jpeg_desc *desc;
>@@ -794,30 +820,11 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> 	return true;
> err:
> 	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
>+	mxc_jpeg_free_slot_data(jpeg);
>
> 	return false;
> }
>
>-static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>-{
>-	/* free descriptor for decoding/encoding phase */
>-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>-			  jpeg->slot_data.desc,
>-			  jpeg->slot_data.desc_handle);
>-
>-	/* free descriptor for encoder configuration phase / decoder DHT */
>-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>-			  jpeg->slot_data.cfg_desc,
>-			  jpeg->slot_data.cfg_desc_handle);
>-
>-	/* free configuration stream */
>-	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>-			  jpeg->slot_data.cfg_stream_vaddr,
>-			  jpeg->slot_data.cfg_stream_handle);
>-
>-	jpeg->slot_data.used = false;
>-}

Can you split the moving of the code from the changes you do?
Otherwise the reviewer is forced to get the diff manually.

Regards,
Sebastian Fricke

