Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BF8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6STbV+NwzNcHIr/JnBgDeICaBXLJ4QoQ1ZaZwuZ1t0=; b=q1mKr3oxz0uToHzdieq4aDZvbm
	XspU7EbU3XFjnORiMPGcwORNfkU5DHJmp6NgNY3nis6arJvpRanzu/BTww+u2H+J/4QemAHgXc9jK
	LA5gJlsKL0sT4HxAgzTarV5rIThdo2w1L1DXvXAfiMtNL0D7lbr7Qd5xIZY6ClD06OVTRPGOMAhiJ
	n/stRb3ksmI96nU+ke5ITUTlXNwb8NHYh6+a3vzp2bESptHi1QafQrfWGVINdB8dv+1qG/9nbHzuD
	oSirOD7ySJ6xi27ahOJMlUWw0/9kos3gYMrRSJDoT4p4lmcsKO2+kuKnvZECis1sKdfHqKJO0xrs1
	39KdTwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u15Rg-0000000E8Ny-2WEi;
	Sat, 05 Apr 2025 15:28:32 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u15Pw-0000000E8FQ-2SIE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 15:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1743866792; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MoS8Jz1hhaALz29iYgPf+kAxJ5sjtO/8hAqhjIJs5LIy5qfjBN7FBRfRpskvI6nQVJFk946OAbBAYAf3p27nryKb5h68vztGrNC4/K1Msgx58P+peOqIKBwVaOy8ZiGeALAnXdzz4AZH/4AQTYzdoEucpXdpoorFVDnm49N2gko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743866792; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a6STbV+NwzNcHIr/JnBgDeICaBXLJ4QoQ1ZaZwuZ1t0=; 
	b=Zydx8zmaSZn3ebG76vrRs3tjCsSF/KCIo/pse2+N/RDmTxuCRErEi3NluCuNY3hdgU2J4qbBLjHNxsNLYtIKoX3WzTVobt8BdnI/OEL5wVvLfBtEDMRlek9an6fQc3rnIM8PlOSvyeDTVZb2l3rsN00BkAq0muovi1ZBlk8Pqks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743866792;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=a6STbV+NwzNcHIr/JnBgDeICaBXLJ4QoQ1ZaZwuZ1t0=;
	b=SAH+0v2wJskYvfjcWHaJjHkHjHI/92k/+QeZ26a6Ofe9aeUySgjbLJ8oqY2Pf0u6
	X0p57p9Y31T9NNzluN1tpIKJkNIpoK5P0d+Em+rGZUlxXL2yH2gu9U4IoakStgedTVV
	/rUYw4Ruc7dSgc+u/AiLIz0nfYlfR4wuaJXyp5VU=
Received: by mx.zohomail.com with SMTPS id 1743866790660738.8941385178805;
	Sat, 5 Apr 2025 08:26:30 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:26:22 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] media: imx-jpeg: Change the pattern size to 128x64
Message-ID: <20250405152622.2nvwultytxnvqcki@basti-XPS-13-9310>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-3-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328063056.762-3-ming.qian@oss.nxp.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_082644_673916_EFC50A2F 
X-CRM114-Status: GOOD (  20.66  )
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

On 28.03.2025 14:30, ming.qian@oss.nxp.com wrote:
>From: Ming Qian <ming.qian@oss.nxp.com>
>
>To support decoding motion-jpeg without DHT, driver will try to decode a
>pattern jpeg before actual jpeg frame by use of linked descriptors
>(This is called "repeat mode"), then the DHT in the pattern jpeg can be
>used for decoding the motion-jpeg.
>
>To avoid performance loss, use the smallest supported resolution 64x64
>as the pattern jpeg size.
>
>But there is a hardware issue: when the JPEG decoded frame with a
>resolution that is no larger than 64x64 and it is followed by a next
>decoded frame with a larger resolution but not 64 aligned, then this
>next decoded frame may be corrupted.
>
>To avoid corruption of the decoded image, we change the pattern jpeg
>size to 128x64, as we confirmed with the hardware designer that this is
>a safe size.
>
>Besides, we also need to allocate a dma buffer to store the decoded
>picture for the pattern image.

Why is that related to the change of the pattern size? Like why wasn't
that needed for 64x64? And if this solves a different issue, can you put
that into an extra patch?

This is a bit hard to understand, maybe this is better:

In order to decode a motion-jpeg bitstream, which doesn't provide a DHT,
the driver will first decode a pattern jpeg and use the DHT found in the
pattern to decode the first actual frame. This mode is called
"repeat-mode" and it utilizes linked descriptors.
The smallest supported resolution of 64x64 was used for that pattern to
not cause unneeded performance delay. This choice, however, can cause a
corrupted decoded picture of the first frame after the pattern, when the
resolution of that frame is larger than the pattern and is not aligned
to 64.
By altering the pattern size to 128x64, this corruption can be avoided.
That size has been confirmed to be safe by the hardware designers.
Additionally, a DMA buffer needs to be allocated to store the decoded
picture of the pattern image.

The rest looks good.

Regards,
Sebastian

>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
> .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
> .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
> 2 files changed, 39 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>index 12661c177f5a..45705c606769 100644
>--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>@@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
> };
>
> static const unsigned char jpeg_image_red[] = {
>-	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
>+	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
>+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
>+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
>+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
>+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
>+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
>+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
>+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
>+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>+	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
>+	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
> 	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
> 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
> 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
>@@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
> 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
> 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
> 	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
>-	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
>+	0x00, 0x28, 0xA0, 0x0F
> };
>
> static const unsigned char jpeg_eoi[] = {
>@@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> 	jpeg->slot_data.cfg_stream_vaddr = NULL;
> 	jpeg->slot_data.cfg_stream_handle = 0;
>
>+	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
>+			  jpeg->slot_data.cfg_dec_vaddr,
>+			  jpeg->slot_data.cfg_dec_daddr);
>+	jpeg->slot_data.cfg_dec_size = 0;
>+	jpeg->slot_data.cfg_dec_vaddr = NULL;
>+	jpeg->slot_data.cfg_dec_daddr = 0;
>+
> 	jpeg->slot_data.used = false;
> }
>
>@@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> 		goto err;
> 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
>
>+	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
>+	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
>+							   jpeg->slot_data.cfg_dec_size,
>+							   &jpeg->slot_data.cfg_dec_daddr,
>+							   GFP_ATOMIC);
>+	if (!jpeg->slot_data.cfg_dec_vaddr)
>+		goto err;
>+
> skip_alloc:
> 	jpeg->slot_data.used = true;
>
>@@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
> 	 */
> 	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
> 					      V4L2_PIX_FMT_YUYV,
>-					      MXC_JPEG_MIN_WIDTH,
>-					      MXC_JPEG_MIN_HEIGHT);
>+					      MXC_JPEG_PATTERN_WIDTH,
>+					      MXC_JPEG_PATTERN_HEIGHT);
> 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
>-	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
>+	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
> 	cfg_desc->buf_base1 = 0;
>-	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
>-	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
>-	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
>+	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
>+	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
>+	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
> 	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
> 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
> 	cfg_desc->stm_bufbase = cfg_stream_handle;
>diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>index 86e324b21aed..fdde45f7e163 100644
>--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>@@ -28,6 +28,8 @@
> #define MXC_JPEG_W_ALIGN		3
> #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
> #define MXC_JPEG_MAX_PLANES		2
>+#define MXC_JPEG_PATTERN_WIDTH		128
>+#define MXC_JPEG_PATTERN_HEIGHT		64
>
> enum mxc_jpeg_enc_state {
> 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
>@@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
> 	dma_addr_t desc_handle;
> 	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
> 	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
>+	dma_addr_t cfg_dec_size;
>+	void *cfg_dec_vaddr;
>+	dma_addr_t cfg_dec_daddr;
> };
>
> struct mxc_jpeg_dev {
>-- 
>2.43.0-rc1
>
>

