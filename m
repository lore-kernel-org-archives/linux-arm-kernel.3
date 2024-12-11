Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E4CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6mgR9JSMbzuDpvHOfYMWLmhuCb2AgVcK+vn11JpoMQ=; b=Ab1YyMa+026FYLf1k7+mhrMHs8
	JQn+/XcI8Sv0GAS/PzZdILO270/zr/qg7bVyn+cahq8c1KOLdsW5jpbMLgm5DLdQlXr9W7cmrDsgU
	GCuTkTXS91m1vCbdCiZKPO5JQtcxezd67xGIb5JTmLum5z6M661OoPQIjQN0bnAXIOctw4Nya2FwJ
	kzAr9MTGg8VDBRPj9DRZ1AeTRRf662ITYmyszvCafE6nXvGWk8mPMv3QzpvTajpj2jYYIXNjKLX+L
	hY5bOSZlf2reYlHMSxfwjIb2uKhlr4vi5W2AOfVFCUVmUCv6pcsoStQ9Kjx2q2TJ90SY0trQjdPu4
	X0rZdMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQFx-0000000FZ3B-25Nd;
	Wed, 11 Dec 2024 17:12:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQEt-0000000FYvp-2cbP;
	Wed, 11 Dec 2024 17:11:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1733937061; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MqDxC5RCWqj6frARveTY+iBLr/DNp2amjN9WKm9gl1GerCyqulp+ounDB/0XEDlcIEfGyZU3VJ38VzK8JIvfbXW9FVAqoWaUFULxbsmsiTa2aEGHoWnKXo9DFn7g3/XGpp8pa2XwrFz9OTs40mluKyN2j+F+GbzUn+VRDaQNNH0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733937061; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o6mgR9JSMbzuDpvHOfYMWLmhuCb2AgVcK+vn11JpoMQ=; 
	b=MXJme1FJztZTmm3P1gKLG7Nu5KV+p40obUz5OdwQdPKtWdDUiRoM6i+Ye4NLVHWGO8AGcXm4vLr7BA4xXHI+VnI4hpCJFbMgsKCduKgjvJ5xjwWe1bk2XTJD+FYIIYKGNkVVV4Qnnxelmy5KvQb/CPY+uqjPi6U85hMgPwTJJMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733937061;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=o6mgR9JSMbzuDpvHOfYMWLmhuCb2AgVcK+vn11JpoMQ=;
	b=fzK6gjUjXS3j31LavblxZCCPDzUAOWyEA8fJnHdsskJL+zIaeEX31O6u2GL5K7t6
	8l0WPBUG7YhDqqt6M1UZiPeFWzbFnQWbqgaSGPzzs4UwacadgN5ff7xHrDLmXZ3nFrx
	nYTMC8ZZgWRsMpNoiQNkcZ6MlJ6J9lE5POxTSLVI=
Received: by mx.zohomail.com with SMTPS id 1733937059334981.4575681462861;
	Wed, 11 Dec 2024 09:10:59 -0800 (PST)
Date: Wed, 11 Dec 2024 18:10:52 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 3/3] media: mediatek: vcodec: add description for vsi
 struct
Message-ID: <20241211171052.wl4wqoka7yyeso2l@basti-XPS-13-9310>
References: <20241116031616.15656-1-yunfei.dong@mediatek.com>
 <20241116031616.15656-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241116031616.15656-4-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_091107_718562_9EC2AB08 
X-CRM114-Status: GOOD (  17.71  )
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

Hey Yunfei,

On 16.11.2024 11:16, Yunfei Dong wrote:
>If the video shared information (vsi) is changed accidentally,

How can that struct be changed accidentally?

>will leading to play h264 bitstream fail if the firmware won't
>be changed at the same time.

Okay I guess you mean that the struct has to be memcpy'd to the firmware
to synchronize it right?
Also is this really just a H264 thing? I would imagine that incorrect
data in the firmware will cause issues no matter which codec.

>Marking the shared struct with "shared interface with firmware".

Can we do anything more to ensure that the firmware doesn't fall out of
sync besides adding a comment to the description?

To fix grammatical issues the description above should be changed to:

The vsi (video shared information) struct needs to be synchronized
between the firmware and the host, as a change that is only done in the
host version of the struct but isn't synchronized to the firmware can
lead to decoding issues with H264 bitstreams. Highlight this requirement
within the struct descriptions.

But as highlighted above it is not clear to me whether the content of
this message is right yet.

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>index a7de95b9a7c0..5a202691e209 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>@@ -30,6 +30,7 @@ enum vdec_h264_core_dec_err_type {
>
> /**
>  * struct vdec_h264_slice_lat_dec_param  - parameters for decode current frame
>+ *        (shared interface with firmware)
>  *
>  * @sps:		h264 sps syntax parameters
>  * @pps:		h264 pps syntax parameters
>@@ -48,7 +49,7 @@ struct vdec_h264_slice_lat_dec_param {
> };
>
> /**
>- * struct vdec_h264_slice_info - decode information
>+ * struct vdec_h264_slice_info - decode information (shared interface with firmware)
>  *
>  * @nal_info:		nal info of current picture
>  * @timeout:		Decode timeout: 1 timeout, 0 no timeout
>@@ -72,7 +73,7 @@ struct vdec_h264_slice_info {
>
> /**
>  * struct vdec_h264_slice_vsi - shared memory for decode information exchange
>- *        between SCP and Host.
>+ *        between SCP and Host (shared interface with firmware).

In this case, I feel like the previous description made the fact, that
this is shared data between the host and the firmware, rather clear
already.

>  *
>  * @wdma_err_addr:		wdma error dma address
>  * @wdma_start_addr:		wdma start dma address
>-- 
>2.46.0
>
>
Regards,
Sebastian Fricke

