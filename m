Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76357C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//GayiTjk2VgwOuQxZT0tXCo12hznJ8fyvNG07N/o2g=; b=A+6QmZknSXpYz9iYQc20kF8SiO
	ToyxZrLuFajS4CUn+9gVG2GJzv7kUMrCRpvV90GqNfIYl8Q8UKEeEDNDd86fTSp0VmbcKCpSJ8MYS
	3KfG++56RxWZ17bXD8QcQj8gzPX8K4FIf4mXn+n1ES/KiW5yg5QIMBTfN6AwSKqd0ij29FSzehK0k
	zWjFJkal9nOsY4WMKImhNNOWlM2lWbmPTwihJP5ysHuXLaICRjmFV92j5Oikwf8G+5Y/pMZEfHgbZ
	gbZ7aSxZflKDA3kLEWMAOpBc9+G4B0td6W0BbFU8aKddd0oJhKXH0zt21N/sBV8wh76BvKQPOh97T
	ysQAxWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2p1-000000050E6-0dfi;
	Mon, 17 Feb 2025 15:14:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2el-00000004yi2-3gda
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:03:38 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-543e47e93a3so4754580e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739804613; x=1740409413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//GayiTjk2VgwOuQxZT0tXCo12hznJ8fyvNG07N/o2g=;
        b=VfaskelJlTvIfePtY/rXLcRRVNrzf8I4w2tW4p8145hsXPGWR7uTrTsfl5kleL63QH
         EpcIY67skpeFa1md7cd+l3gpXy4tNa4A/rVEmZK7Kla3fKLM+b9sQRKGIJQcF3pBFUdM
         hxpSDT6WjIi5ea6N2jGFq4Dt7LCNIyWZNLk2Pbu3DQtLWovbaqZX+tKUqIyvHKSpWwBq
         mqQ/a7D86SyhIZblEbO+QVEXrpwnDYm7XC9hpDb4GKXcidcD8HTzfZRE+c1JUOrUHRB8
         elk8Rmu6ya7DripUl8Dqe9qGZUEzlrxjBYR384XmVtiXjxnAVZsksEZzz0QWdq3Y6xLk
         EVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804613; x=1740409413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//GayiTjk2VgwOuQxZT0tXCo12hznJ8fyvNG07N/o2g=;
        b=ZPriPFTCFg2QPVNjX7lIxVWpxPTWm0K6IvuQt+CCyAAl3gMDfDh55BXXM+oqsjeqe1
         U82tYtCaCZJ2E5w5xwHYOSJ7r+KJ28UBBvglK1oef30IqDLgoE49M8bvaApCz2XQDq49
         XFmD5oooJgsLrN+wNiXE33lCO3/F8t07EVW2SEev+jy7PZdYZiUl5802SudmzBq3mDnH
         Jq6uQx/4LTf/8Dwqcbfw3DR5a0MJYISVrvdMSculai+VGFp0KS/JUoJcBGq3XysjKUTO
         It1Y5v74MJYh+LM9/JV8N6b8q0yLZmOwuWvzdWA5nrFdKfqgzFVxagReOJDmOGM0MdfD
         CSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7HWdaNAscggwPM5VVxn9+zgue378pIVSd5DbQYoxiB7ctUog61VDU17SD+Ugm8TNmPwdMIJd+tMSf4DqXPDys@lists.infradead.org
X-Gm-Message-State: AOJu0Yz46oxqIyh4l24cJUSOF5q0zNxvvVfp/HQiSXlg1pOv7S402Ngg
	5qN2w7HQ458A+deBwLVGYXOUkSX5kQ4sKHEY8T16KMK+1Y6hlHuLpw2j4G/qBCYjSQAN1U2iPKP
	PCR8=
X-Gm-Gg: ASbGncusfKm1QDzGAxzFJygvWGkTwj46Jv02wLJqhPtZctXfVsYUpbRHV8PqkvJyIEm
	8XbOybANti2EYoMk/duJPHocsuKxwWEObShIICOlq30pFKj5sjuK365yCEGHUF7ww8O7610juXf
	g9kDzRwwLBE0QzZhhvj6wLKCJRUB2J4g515ZdbacRGW53xebF5whptHVR7yW8vxqvi+1ye9KK5W
	JaSqLHaiVWixJZbsINYxo3sQbkSk4gEwwyHMCahMAhqaXhDXwuYeK7ssGCFn0vUmyMSGZoeZ6Ob
	uzmIWCqj0sDhWjEsV60f0owf16oTzr22o9sMBhQNgxqXAnKUGAyE4zTRh12phcI=
X-Google-Smtp-Source: AGHT+IF9JYqSQ6ntE3558qRENvEigRRMYqxdMfCUuklz4yeVdCf7BoSLXDiwqfmV2TzwBrbwiuonQQ==
X-Received: by 2002:a05:6000:1f87:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-38f33f43751mr9709394f8f.40.1739804602180;
        Mon, 17 Feb 2025 07:03:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:9c3e:a06c:91d9:c06b? ([2a01:e0a:5ee:79d0:9c3e:a06c:91d9:c06b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm12273223f8f.1.2025.02.17.07.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:03:21 -0800 (PST)
Message-ID: <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
Date: Mon, 17 Feb 2025 16:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_070336_114051_0BECB931 
X-CRM114-Status: GOOD (  30.38  )
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

Hi CK.

On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>> 
>> 
>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>> mtk_dsi_lane_ready function, and the DSI module is set up during
>> mtk_dsi_poweron.
>> 
>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>> nothing because lanes are considered ready. Unfortunately, when the panel
>> driver try to communicate, the DSI returns a timeout.
>> 
>> The solution found here is to put lanes_ready flag to false after the DSI
>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>> setup of the DSI module.
> 
> I'm not clear about what happen.
> I think this DSI flow has worked for a long time.
> So only some panel has problem?

I don't know if it's related to a specific panel or not.

> 
> And another question.
> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not actually ready?

The workflow should be:
... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = true (to avoid 
re-do dsi lanes setup) | ...

I observe (print function name called + dsi->lanes_ready value):

[    9.086030] mtk_dsi_probe 0
[    9.662319] mtk_dsi_host_attach 0
[    9.662941] mtk_dsi_encoder_init
[    9.984685] mtk_dsi_poweron 0
[   10.043755] mtk_dsi_host_transfer 0
[   10.043769] mtk_dsi_lane_ready 0
[   10.055837] mtk_dsi_host_transfer 1
[   10.055853] mtk_dsi_lane_ready 1
[   10.179788] mtk_dsi_host_transfer 1
[   10.179803] mtk_dsi_lane_ready 1
[   10.179880] mtk_dsi_host_transfer 1
[   10.179885] mtk_dsi_lane_ready 1
[   10.179920] mtk_dsi_host_transfer 1
[   10.179923] mtk_dsi_lane_ready 1
[   10.179986] mtk_dsi_host_transfer 1
[   10.179993] mtk_dsi_lane_ready 1
[   10.180134] mtk_dsi_host_transfer 1
[   10.180143] mtk_dsi_lane_ready 1
[   10.180175] mtk_dsi_host_transfer 1
[   10.180178] mtk_dsi_lane_ready 1
[   10.180223] mtk_dsi_host_transfer 1
[   10.180226] mtk_dsi_lane_ready 1
[   10.180245] mtk_dsi_host_transfer 1
[   10.180248] mtk_dsi_lane_ready 1
[   10.180278] mtk_dsi_host_transfer 1
[   10.180280] mtk_dsi_lane_ready 1
[   10.180312] mtk_dsi_host_transfer 1
[   10.180314] mtk_dsi_lane_ready 1
[   10.203774] mtk_dsi_bridge_atomic_pre_enable
[   10.203787] mtk_dsi_poweron 1
[   10.203793] mtk_output_dsi_enable
[   10.203795] mtk_dsi_lane_ready 1
[   10.471517] mtk_dsi_host_transfer 1
[   10.486962] mtk_dsi_lane_ready 1
[   10.487244] mtk_dsi_host_transfer 1
[   10.503733] mtk_dsi_lane_ready 1

Here the mtk_dsi_lane_ready function:

	static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
	{
		if (!dsi->lanes_ready) {
			dsi->lanes_ready = true;
			mtk_dsi_rxtx_control(dsi);
			usleep_range(30, 100);
			mtk_dsi_reset_dphy(dsi);
			mtk_dsi_clk_ulp_mode_leave(dsi);
			mtk_dsi_lane0_ulp_mode_leave(dsi);
			mtk_dsi_clk_hs_mode(dsi, 0);
			usleep_range(1000, 3000);
			/* The reaction time after pulling up the mipi signal for dsi_rx */
		}
	}


As you can see, something call "mtk_dsi_bridge_atomic_pre_enable" then mtk_dsi_poweron is called a 
second time. This issue is probably due to the probe order (race condition).
After all, IMHO, after a poweron, the registers status should be consider as unknown (or at least HW 
default value), so, lanes setup has to be done. This solution improve the driver's robustness.


> Or mtk_dsi_lane_ready() configure the hardware and lane is is actually ready,
> but something make it not ready again, what's the thing which break lane ready?
> 
> If this is a bug fix, add Fixes tag.
> 
> Regards,
> CK
> 
>> 
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index e61b9bc68e9a..dcf0d93881b5 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>         mtk_dsi_config_vdo_timing(dsi);
>>         mtk_dsi_set_interrupt_enable(dsi);
>> 
>> +       dsi->lanes_ready = false;
>> +
>>         return 0;
>>  err_disable_engine_clk:
>>         clk_disable_unprepare(dsi->engine_clk);
>> 
>> --
>> 2.25.1
>> 
> 
> 
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
> 

-- 
Regards,
Alexandre

