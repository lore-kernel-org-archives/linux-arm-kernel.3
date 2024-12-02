Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD8CD10DCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=; b=dRlbtIM22p5zAOYJXpe6k9Suef
	2pFIpVxsFIWd6oH/d2KRN3LNsNh1dLciErIhjwzrnxnT0xkGzCFkxJvjES4DSMtMSOCM5EfzgaNgm
	cYFgddjak9U/JtLFKammdaA+BvQLV5Db8eohZBIbkoEAoANvV7dfPlYU2qrUHLQMqdsofTAUxy7zZ
	ZQrLMgOcLJCwY5snvP3F1DS6FSuQ/0e+aSno9fbn4D9lYO1adiIZpB5El/xo/f5F3AhllPiofmOY9
	1Ew/9f9vm/39fjHpKSpx9syYU+E2nnZwT0fQDyMZRHzcLwWbc9InpCJ6uctLo8Oh22iCi2LKrIkmn
	5NjJnJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2tc-00000005b94-1SQM;
	Mon, 02 Dec 2024 09:39:12 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2sb-00000005au5-34E6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:38:11 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3ea405aa7b3so2011287b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733132288; x=1733737088; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=;
        b=zwFcXMH3lYwgwu7U196tcIxt2GBsKjeAFh3GtHAsBE/KMyJWjsEGMyVn8GR1DH40rA
         tIMG7lLp5Ml57iqbJGkTn3XmZItWtcVuS8KkSq+O0CeRGQl0ll9wCFUJ5o3LnEbwpRaM
         noP/6s9YjLVEyJbSX7NO7kVVgux4fkswc06epou/glotxpx34sUih6jEnbDneCD81rEz
         hJkY7cN/Ke/E3CiH3vX6g0sPnzPbj+PQIy0+M7hDpYqmP8UStcul3xMu8jWSlkENUR98
         UbBan02XVXep8amhsASLnL62rmWKowQMi0tGbSPhM2sGrC1DwnFDIvqZ75mPIGj5QaA2
         bkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132288; x=1733737088;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=;
        b=RqRVW4kZs2XdFd4KCv05DqtgREuz9B2sttfpsQzfCeegyr5CPEoj4oSOynngt0Ml/K
         IlEwc4u3iXZ+1aKY1O778Vn7oHY1a8rl/840/Q5GpYME9DanUFS9qHzyo1NmGTpqSVU+
         mP6NwxOpKTjarINwjLkn+XuztD7ikkN0BcI7wmQf8oWiq5iLX+QXnfATAHXrinP2M7fX
         HnfWJo0jKb76p2+OeXMoU987yu7lBu1Z5fiHlZ9yt81xxjVtB39oXn5rYTaTqhl2lfRo
         vLgFSmqh19dPW2Y6TbZ7I4MxQJcGtRGcQD0HYznK6oPClN6lX6OnfWZo6+8lmrSUAs8t
         Qd4g==
X-Forwarded-Encrypted: i=1; AJvYcCXkSy3/UC0N7jkHn2jSHnRAHRGFpujOnqd+kbZ4Noi2hQSkQ2FchlgUQFKCVUvKGCyQH1BHMermLAv9v4w7cHPs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5VwmCkG4zSdq6ZZ0bO/d/fOSHc5BJahUSOsQtUqpDGUL+FBw2
	QpMZktsIOa8ZucUspFKkzhRKoRJdHGtaESjBQMxefXKf3NZZkSdG2Wac0jHRxOHY3gw1Nza6pie
	0gatX5IVfSICcjbYDF5UWyVmXy73q0r7JeTL6tw==
X-Gm-Gg: ASbGnctbJz/hh742f2Ito9BSwYzISU+VSdZUZi0Ho1WMP71P2w99Zom6fr4AxyckAIa
	b8Bgr3gqyYFjDssZ3AvMcPS6OvENz1g==
X-Google-Smtp-Source: AGHT+IGFYBkRu+t9Rgm8uEYvRACv3R8GZFuyUPEoCQ2kFsszRxvWlytkFAb4tTArftXgRYmzaFXCGr9/hwxPw8QMZIA=
X-Received: by 2002:a05:6830:6d84:b0:71d:559d:de29 with SMTP id
 46e09a7af769-71d65cce8femr13291782a34.17.1733132288329; Mon, 02 Dec 2024
 01:38:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Dec 2024 03:38:07 -0600
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.8.9
References: <20241128030940.25657-1-liankun.yang@mediatek.com>
In-Reply-To: <20241128030940.25657-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Date: Mon, 2 Dec 2024 03:38:07 -0600
Message-ID: <CABnWg9tDMkKkFbQpL8YphOBu3_2zr_q4YASnO-UYMrdM22wCuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Add return value check when reading DPCD
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ck.hu@mediatek.com, dmitry.osipenko@collabora.com, rex-bc.chen@mediatek.com, 
	jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_013809_757453_083EF3E0 
X-CRM114-Status: GOOD (  11.20  )
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

On Thu, 28 Nov 2024 04:08, Liankun Yang <liankun.yang@mediatek.com> wrote:
>Returns the number of bytes transferred (1) on success.
>Check the return value to confirm that AUX communication is successful.
>
>Fixes: d9e6ea02fc3f ("drm/mediatek: dp: Add MT8195 External DisplayPort support")
>
>Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
>---
>Changes in V2:
>- Modify Fixes in Commit Message.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index 1cc916b16471..9dc68ec2ff43 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2101,6 +2101,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	enum drm_connector_status ret = connector_status_disconnected;
> 	bool enabled = mtk_dp->enabled;
> 	u8 sink_count = 0;
>+	size_t value;
>
> 	if (!mtk_dp->train_info.cable_plugged_in)
> 		return ret;
>@@ -2115,7 +2116,12 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	 * function, we just need to check the HPD connection to check
> 	 * whether we connect to a sink device.
> 	 */
>-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>+	value = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>+	if (value < 0) {
>+		drm_err(mtk_dp->drm_dev, "Failed to read DP Sink Count: %zd\n", value);
>+		return ret;
>+	}
>+
> 	if (DP_GET_SINK_COUNT(sink_count))
> 		ret = connector_status_connected;

Hi Liankun,

thx for your fix.
I think your patch could be improved by using the drm_dp_helper
function drm_dp_read_sink_count() ?

Thx,
Guillaume.

>
>--
>2.45.2

