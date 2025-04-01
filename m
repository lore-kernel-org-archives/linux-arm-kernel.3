Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD7DC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBU0C7170I26NS2nL3j2yZ7Xa8vu3rMrCcjlkS+8Ii4=; b=GVHBb3+Lz5AtfkVRvhXIaGtOXV
	087+Huph28SGqhNjqn6yA/HKH8Am6LrO6hX5Eu3wiQf6yXfplgelE3ob0Bz1nVlvO00CqCgqywNaL
	TA07AqXFhV3yS+Cp7GA9NpYeyno9tQeX5uBt0AXy/OmwIHxibolzg/m00/5ahDa1Z2lBJ6KEz4FM2
	wZ1otLkXK5KXJ8uvoNx6GOx08u2qXHg2k4W3oxXkCzGGTlCjuE/rrR7sNO6PzcgQC3pwsj7pouCoJ
	j6Fe1RNoYqLFvWXMeldFLh9Bx5nFl/7OXrsrqLpi2fTaQLpy5lppGVpjVb2cLqixo+HqBedMFQI8Z
	BD4ZPU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXPc-00000002Nrj-0tuF;
	Tue, 01 Apr 2025 08:56:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXNa-00000002NYX-3500
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:53:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1743497620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PwcJR2MjWwXZ3r/9DeFiS6+7HX4LBTkPVG94v4pkYGNOZBUS9NUrLujLNVD9mqpzOo4cyc9mJo+G9bUFzsnlOhmNYJDgPhq0AK/1Fi41oP0GhELU/aZFv7qvREIZk7YKcSqIHykHd5+6agZj7mWOFh0UW6c8EihDUoLQYSaLvMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743497620; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cBU0C7170I26NS2nL3j2yZ7Xa8vu3rMrCcjlkS+8Ii4=; 
	b=Xk1tqxqBkjLezlW5M9t9fVhI7IO7rByPCGQgdkn/nc5otDTywte40BKrWpeAWWsDFBoqENNJpmXLkzlLM8tKZYtFJT45/kWIZTQz9wEfuXX+wIP2yZg1egStBdEh4DvqTC9mn0B1jzgYeUK34FZ1qHJGeXDpW337EKQH2wxRWIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743497620;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=cBU0C7170I26NS2nL3j2yZ7Xa8vu3rMrCcjlkS+8Ii4=;
	b=PpVFWJD0dLal7/1EEs6FCsTrrBM8vEYAf0kbhBwpuBhgT52qxVjFXSFB2u2I2rco
	Frr3V9YS7Kg+A08eCo1g1CghgXjD3qG9CkFIt9D4ukX5hhMsLyj9EJXr1sUDhjIcGSb
	o6bhxAkqJP0wCfEJ11Q5xNPB8D8NKCZ6xpKAvvXE=
Received: by mx.zohomail.com with SMTPS id 1743497618474415.27018579292655;
	Tue, 1 Apr 2025 01:53:38 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:53:30 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
	eagle.zhou@nxp.com, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
Message-ID: <20250401085330.2n6mcyfrxbfgebzf@basti-XPS-13-9310>
References: <20250401073527.1626-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250401073527.1626-1-ming.qian@oss.nxp.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_015354_853658_F200AEAE 
X-CRM114-Status: GOOD (  15.57  )
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

thanks for the patches, unfortunatly our testing pipeline isn't happy
with them yet.

See below ...

On 01.04.2025 15:35, ming.qian@oss.nxp.com wrote:
>From: Ming Qian <ming.qian@oss.nxp.com>
>
>The amphion decoder firmware supports a low latency flush mode for the
>HEVC format since v1.9.0. This feature, which is enabled when the
>display delay is set to 0, can help to reduce the decoding latency by
>appending some padding data to every frame.
>
>Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>---
>v5
>- Apply FIELD_PREP() and FIELD_GET() in CHECK_VERSION
>v4
>- Add CHECK_VERSION macro
>v3
>- Improve commit message as recommended
>v2
>- Improve commit message
>- Add firmware version check
>
> drivers/media/platform/amphion/vpu_malone.c | 24 ++++++++++++++++++---
> 1 file changed, 21 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>index 5c6b2a841b6f..b6e4996c2d91 100644
>--- a/drivers/media/platform/amphion/vpu_malone.c
>+++ b/drivers/media/platform/amphion/vpu_malone.c
>@@ -68,6 +68,12 @@
>
> #define MALONE_DEC_FMT_RV_MASK			BIT(21)
>
>+#define MALONE_VERSION_MASK			0xFFFFF
>+#define MALONE_VERSION(maj, min, inc)		\
>+		(FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, min) | FIELD_PREP(0xFF, inc))

drivers/media/platform/amphion/vpu_malone.c:675:52: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   675 |         if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
       |                                                           ^
drivers/media/platform/amphion/vpu_malone.c:79:4: note: expanded from macro 'CHECK_VERSION'
    79 |                 (FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
       |                  ^
drivers/media/platform/amphion/vpu_malone.c:675:52: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/media/platform/amphion/vpu_malone.c:79:59: note: expanded from macro 'CHECK_VERSION'
    79 |                 (FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
       |                                                                         ^
drivers/media/platform/amphion/vpu_malone.c:77:4: note: expanded from macro 'MALONE_VERSION'
    77 |                 (FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, min) | FIELD_PREP(0xFF, inc))
       |                  ^
2 errors generated.

https://linux-media.pages.freedesktop.org/-/users/sebastianfricke/-/jobs/73725346/artifacts/report.htm

Regards,
Sebastian

>+#define CHECK_VERSION(iface, maj, min)		\
>+		(FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
>+
> enum vpu_malone_stream_input_mode {
> 	INVALID_MODE = 0,
> 	FRAME_LVL,
>@@ -332,6 +338,8 @@ struct vpu_dec_ctrl {
> 	u32 buf_addr[VID_API_NUM_STREAMS];
> };
>
>+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
>+
> u32 vpu_malone_get_data_size(void)
> {
> 	return sizeof(struct vpu_dec_ctrl);
>@@ -654,9 +662,15 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
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
>+	if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
>+		hc->codec_param[instance].disp_imm = 0;
>+
> 	hc->codec_param[instance].dbglog_enable = 0;
> 	iface->dbglog_desc.level = 0;
>
>@@ -1024,6 +1038,7 @@ static const struct malone_padding_scode padding_scodes[] = {
> 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
> 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
>+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
> };
>
> static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>@@ -1058,8 +1073,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
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
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

