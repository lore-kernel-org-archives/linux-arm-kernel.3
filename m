Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650F4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alBmJLHqLeak0MrBEaiF+GvOpgs6GCrussWTD7ASuFg=; b=E3lXhz+L3AcZu+8zp/ucpCJaYb
	x+GFyNKvDMlSq2/ZdR+YeCLcyoB6nLPEgagBZ/TNqu/uxGSk+JXvKwqzI/J2S3/o9yHyi8C7yGVWt
	n/Gk38dgtoJFvLD4bs+QvkxaBIKugLHEP7b1kPazRdZtgVcbAhQF9dSA5EQBsMbEcCvZ7kuGuKfjJ
	QtI+eRYUpxgIyD1LTAQ7hgnHBYoOoFH7vGztMkpr+dtqITucetz6J5vInmotniMJrXUWZDz87ksgk
	fPQOs3tWWUPWb/KrHFsDpiBK7LZo/nU99xtWiOEHvwBgqXkTxd8tOfGwaC5pDdtoAdZOK4a/1g00/
	MOZ86ESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPy-00000003qqA-1fYt;
	Wed, 26 Feb 2025 13:25:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFhb-00000003UkM-1UKS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:35:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4399d14334aso58501975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740569745; x=1741174545; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alBmJLHqLeak0MrBEaiF+GvOpgs6GCrussWTD7ASuFg=;
        b=HjQRW7r+y/lk9rrJlR5Ik3BNNUV1cyKQGcX7pmIkO3cTUrn7NDAgGNf7auTKKbBxBi
         qmAEZLTxRZNFejxWM5EygYIlkqC/zKpe0boT9YNWuyNgRGn2ydy7kYR0dwo4bdswacUQ
         aIiLtP7vOsjbJvoUR2Ap1m5qdBteEGLhqZV7DyhkGwqujjQfcDfH5+BmAqgwzM82U97C
         /7JW+tYiP99wvJZPxQYNr7Qf+sJBkOyVk0sSJyUu901xom/C0R4eFKdt4Up0+AKttWFA
         WS2afMlf/MoQUh6cLm8fWkflqQW4RyhHNdtkkhaTyWcEE/pO1WUXgFozxEsY8EofkV+/
         1ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740569745; x=1741174545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alBmJLHqLeak0MrBEaiF+GvOpgs6GCrussWTD7ASuFg=;
        b=pBLSNpasjqbi03GbXXAijpJXu8AP2SwLPGh8f5Os6a/PfPOShRuZmWI1L5pAHPbU/c
         7oPs1S+Sa2AVI5qMJBHs8K9/Mu4QMvH2zom6jzmQ/F13SOPh9h0BLGWdd9E3KNTXhD8U
         X5LSEra6Gy5pNfwyAIkzxhFjOhOC8PZs4VTbU91wjIEVrX+Bp16r2OFsqBjOI0zLLH/H
         J8Z2bMxUQ3THIOTm77WPFYLNMJMWrEaSH0JhTVgZOU/jzO4C897BNJ8Rk2MipeywWOES
         4UGcngMdZC0nfSTT1ZyhDSWfkmSttkKfdxBXYyH93nwN9tygbAVzyfKJ4XgmPNidpnLU
         SSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbmaEq1QKVFg5UpRCKUOVCD9ZawTjd2urJKdl43ocp2e1yeBWvEB3se5lLYsC7Fbcl5KExdzunHAOjvGs6dv0q@lists.infradead.org
X-Gm-Message-State: AOJu0YzqZujUqohdeciPzTWz/X904/5q2QzswJls03kUvdeh1fFhhi3b
	r8hwk3R3L+ywlszEu1Xc9qdJ49pyWbmoFr4xn1wiWWrqXoss4zxISnY9DhayTcA=
X-Gm-Gg: ASbGncv1oT/yp6nQpAuVA3j15hVDGoJvpCWhIN5rc18ri2hT31rHGujcJFz3y0r4+eb
	29TBJQNq5stnnoAaeZ9kqVjSTzTkMeHUEpU0safJVfwxe7Q3ytdEarzNZ3GvLPk1O2YDviJbD+a
	+8lImfjBsS9y+0RYfjkXMajwV7WEOx2LnkMl64BbVWiqkKsJnJiPVV/5F1x8R7prwUYFTIBITIN
	NCQB7tvDoDwhi5Pgqy8MIn79jGAnapiGqCLxTou0bgrCCt5LKX0jbzwLTvyHjE2TcAkkkk0b4/a
	2Xd2YIRBXcWLW+zKvLA1sGClkD9K3kDTOFW687T9cwhXn6I3H3NsV8gHCTLWm58jRw==
X-Google-Smtp-Source: AGHT+IFDxhZDh0OTrZqQRYhLB3t0W3PSVkeDzir54VORaU0Ul7AQg6j84zQMQRzUVA7uut0cfrh6Pw==
X-Received: by 2002:a05:600c:4f86:b0:439:967b:46fc with SMTP id 5b1f17b1804b1-43ab8fd73f2mr24567335e9.8.1740569745142;
        Wed, 26 Feb 2025 03:35:45 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5442c0sm18103605e9.32.2025.02.26.03.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 03:35:44 -0800 (PST)
Message-ID: <0863ee2e-25ed-43b7-a896-e380de828d58@baylibre.com>
Date: Wed, 26 Feb 2025 12:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
 <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
 <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
 <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_033547_471854_5A928F20 
X-CRM114-Status: GOOD (  22.85  )
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



On 18/02/2025 09:52, AngeloGioacchino Del Regno wrote:
> Il 17/02/25 16:03, Alexandre Mergnat ha scritto:
>> Hi CK.
>>
>> On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
>>> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>>>> External email : Please do not click links or open attachments until you have verified the 
>>>> sender or the content.
>>>>
>>>>
>>>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>>>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>>>> mtk_dsi_lane_ready function, and the DSI module is set up during
>>>> mtk_dsi_poweron.
>>>>
>>>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>>>> nothing because lanes are considered ready. Unfortunately, when the panel
>>>> driver try to communicate, the DSI returns a timeout.
>>>>
>>>> The solution found here is to put lanes_ready flag to false after the DSI
>>>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>>>> setup of the DSI module.
>>>
>>> I'm not clear about what happen.
>>> I think this DSI flow has worked for a long time.
>>> So only some panel has problem?
>>
>> I don't know if it's related to a specific panel or not.
>>
>>>
>>> And another question.
>>> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not actually ready?
>>
>> The workflow should be:
>> ... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = true (to avoid 
>> re-do dsi lanes setup) | ...
>>
>> I observe (print function name called + dsi->lanes_ready value):
> 
> Alex, the first poweron is called by mtk_dsi_ddp_start() - and the start callback
> is internal to the mediatek-drm driver.
> 
> That callback is called by mtk_crtc during setup and during bridge enable(), and
> there we go with suboptimal code design backfiring - instead of using what the
> DRM APIs provide, this driver uses something custom *and* the DRM APIs, giving
> this issue.
> 
> Part of what mtk_crtc does is duplicated with what the DRM APIs want to do, so
> there you go, that's your problem here :-)
> 
> Should I go on with describing the next step(s), or is that obvious for everyone?
> 
> :-)
> 
> Cheers,

Ok thanks Angelo.
Can you let me know if you agree with this change please ? This should be better:

@@ -843,25 +843,6 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
  	mtk_output_dsi_enable(dsi);
  }

-static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_bridge_state)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-	int ret;
-
-	ret = mtk_dsi_poweron(dsi);
-	if (ret < 0)
-		DRM_ERROR("failed to power on dsi\n");
-}
-
-static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					       struct drm_bridge_state *old_bridge_state)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-
-	mtk_dsi_poweroff(dsi);
-}
-
  static enum drm_mode_status
  mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
  			  const struct drm_display_info *info,
@@ -886,8 +867,6 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
-	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
-	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
  	.atomic_reset = drm_atomic_helper_bridge_reset,
  	.mode_valid = mtk_dsi_bridge_mode_valid,
  	.mode_set = mtk_dsi_bridge_mode_set,


-- 
Regards,
Alexandre

