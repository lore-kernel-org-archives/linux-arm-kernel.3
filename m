Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1122CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/92kSJvY1+rN7R1Wa41yTcFlIjE+7u8+6SYiP5XVx4=; b=wrQVhSay0pUmKMn8maHHQD0aK9
	3zCkm0tBoXcqzdq0fp6NtTeR6UX6cjGqrguwY3oXe0LmJCFCsjMzUfhAgMmmAxFNLSwCW5Q/9LQV3
	26olKzYU0Idw27j8b/Y/zFwKnp6gKyfnr8BELFlT5CycKbft3QNy7zzSBIlyA2jSBKvRMsMHQKJ1S
	QKWr4JFrfk3v6HpE/xPIwiN+Q16hcbrsTSDVz+/q/0i2nbi3g4eL59MNe8mBZ0Yhd11bM+WXMVG8R
	F38kTQGm9D9Mud1jvtCZCjcXleqCMBzX2B/pN71Ues+pEQMl6l9XwZBH4t2HyBA/xsdpc2O0q3JUU
	Z4GgMysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnE3Y-000000039ic-0XUI;
	Wed, 26 Feb 2025 09:50:20 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDzW-00000003933-1OZ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1740563155; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m31gMZ7PHeDL/F4qCXEU4O3yLVCHcOVX/5y1QMYRaSweufzdT1jXwNp1dMeRmvKshBycs8FeSuzrYIv2uUQ9MVw2ubaAWczoK7ZhMBFrsgtUgkXYAKFAVsYeRXFXt69HgzrdADDKyBG/sd+18VK+VvWaVAuFap3SVHjb3koAp+c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740563155; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r/92kSJvY1+rN7R1Wa41yTcFlIjE+7u8+6SYiP5XVx4=; 
	b=POFs53U5pyE0qysaazZesJqL2f+JCSyzetbBgz3V4E/Q27aLKJvW+vZqCco8CNCW1ImJt2ns0PEO5IFdLrftN0IdQR3mIAsTdtB9Mpf3NMcAzj7iy6Dl4RK14ZRrtatTtATXl6WvI3lzqKsM6rM1F1JbNiDCTvaSJqUkJgivTRU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740563155;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=r/92kSJvY1+rN7R1Wa41yTcFlIjE+7u8+6SYiP5XVx4=;
	b=I8IyydGQEZwn7/WYgA/DfF4oMMeiC2EYo5lrBwXlRSS0/MlQq8IhONdNXcGKl+fQ
	pl53yxiw7eWzMe4n25/m5E+ic5ghVSAylF3uFIKq4Rj9ATlGXx62JZI6jKeu0B/B8B8
	pYCvZ1e+WdVC5PvHkjdsIImyy5EsPHAc2wIN2ang=
Received: by mx.zohomail.com with SMTPS id 1740563153661642.0756053378082;
	Wed, 26 Feb 2025 01:45:53 -0800 (PST)
Date: Wed, 26 Feb 2025 10:45:45 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
Message-ID: <20250226094545.byr2b3p26w5vit63@basti-XPS-13-9310>
References: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_014610_573619_FDEA2DD6 
X-CRM114-Status: GOOD (  17.56  )
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

thank you for the patch!

On 17.01.2025 16:57, Ming Qian wrote:
>The amphion decoder firmware supports low latency flush mode for
>HEVC format since v1.9.0, it can help reduce the decoding latency by
>appending some padding data after every frame, then driver can enable
>this feature when the display delay 0 is enabled.

I see that you already changed the commit message for this version, but
I still have a few recommendations for the description:

     The amphion decoder firmware supports a low latency flush mode for
     the HEVC format since v1.9.0. This feature, which is enabled when
     the display delay is set to 0, can help to reduce the decoding
     latency by appending some padding data to every frame.

The rest looks good to me.

Regards,
Sebastian

>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>---
>v2
>- Improve commit message
>- Add firmware version check
>
> drivers/media/platform/amphion/vpu_malone.c | 22 ++++++++++++++++++---
> 1 file changed, 19 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>index 5c6b2a841b6f..1d9e10d9bec1 100644
>--- a/drivers/media/platform/amphion/vpu_malone.c
>+++ b/drivers/media/platform/amphion/vpu_malone.c
>@@ -68,6 +68,9 @@
>
> #define MALONE_DEC_FMT_RV_MASK			BIT(21)
>
>+#define MALONE_VERSION_MASK			0xFFFFF
>+#define MALONE_MIN_VERSION_HEVC_BUFFLUSH	(((1 << 16) | (9 << 8) | 0) & MALONE_VERSION_MASK)
>+
> enum vpu_malone_stream_input_mode {
> 	INVALID_MODE = 0,
> 	FRAME_LVL,
>@@ -332,6 +335,8 @@ struct vpu_dec_ctrl {
> 	u32 buf_addr[VID_API_NUM_STREAMS];
> };
>
>+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
>+
> u32 vpu_malone_get_data_size(void)
> {
> 	return sizeof(struct vpu_dec_ctrl);
>@@ -654,9 +659,16 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
> 		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
> 	}
>
>-	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
>-	if (malone_format != MALONE_FMT_AVC)
>+	if (params->display_delay_enable &&
>+	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
>+		hc->codec_param[instance].disp_imm = 1;
>+	else
> 		hc->codec_param[instance].disp_imm = 0;
>+
>+	if (params->codec_format == V4L2_PIX_FMT_HEVC &&
>+	    (iface->fw_version & MALONE_VERSION_MASK) < MALONE_MIN_VERSION_HEVC_BUFFLUSH)
>+		hc->codec_param[instance].disp_imm = 0;
>+
> 	hc->codec_param[instance].dbglog_enable = 0;
> 	iface->dbglog_desc.level = 0;
>
>@@ -1024,6 +1036,7 @@ static const struct malone_padding_scode padding_scodes[] = {
> 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
>+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
> };
>
> static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>@@ -1058,8 +1071,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
> 	int ret;
>
> 	ps = get_padding_scode(scode_type, pixelformat);
>-	if (!ps)
>+	if (!ps) {
>+		if (scode_type == SCODE_PADDING_BUFFLUSH)
>+			return 0;
> 		return -EINVAL;
>+	}
>
> 	wptr = readl(&str_buf->wptr);
> 	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
>-- 
>2.43.0-rc1
>
>

