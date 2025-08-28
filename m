Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966D2CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/I5abWNDNo4EBfij41U+MSxFH8HWMmL5CHi8kMoycQ=; b=NPoCNcfqMKtDmlGiPPcFACTgu/
	0mogNTBpyey0Pa4JE81FgoC794ZOwbg3aCL/juVRHgJiZoR8kNoNQz9oJ3oskx1axpPYuxf5CtPQv
	LiRsHibDoS2kmi433E3KLu+Vy0K4DdR9/fr0b0ggYYPialQpANGwE0ZVoPQnZmicIekhR9oi2Ywr5
	MTew6fcTpD7sdHpR9gHZLlgEXSvzyr5OnE+5Z1hrpQb62H2VEBeVHnsEUgyOafWmg9xmuonX8x0qy
	gkTuq/TW6JUVfnjKrh6oI9WgLwmQXO7DBYq12AKgjXb59dTGcdPsxnlVUQGrESUnlKbSD2DVndmc5
	vzm50HGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWS-00000002oN9-45xm;
	Thu, 28 Aug 2025 18:38:56 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdJ5-00000001rAn-3i80
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:08:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so139556366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756390130; x=1756994930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/I5abWNDNo4EBfij41U+MSxFH8HWMmL5CHi8kMoycQ=;
        b=a4NN5jtNNcTM+WpwGh7XqhJWwaZb39X7RB+9kGYIbqNp+qGFQhZjvEr1UHBglRErnr
         JIjB8pBHHMqDGwREoZsc0MLaXgK9cqHA1WHX38SMUw3ZJ/4xBrkBNka4ASK+N5wQ9Tu8
         Obs0KYbaYvOTpuTUT2ygxZqyqHFuuYeHuz9tz3J4KMSvCPK/XZz5VZd8KqKM65lHi/YC
         jo2Iz5ASVuR5/xbv27hu44YYWy9raBHML+etxZphPgMp+Ba0EDR0FtP+0DLO90SKeAlr
         ImwQ8dVJqg44BnH4C8MzCcptBGNCphZGqaXSMEpNrnqY2QkKNu7yE9mbAn+mNH7KwQin
         xSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756390130; x=1756994930;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/I5abWNDNo4EBfij41U+MSxFH8HWMmL5CHi8kMoycQ=;
        b=J56kvEi62zfYcej8gZKqyrwEewEwdKqQ+vgaADxpIoGSZ4qMmGsSt3mo6OZuBu2Oyc
         yJ4RAl2rHjECJiDUWbYQpcBdQ/KDbv90MOjQRNF3jT67pRwvgOAj9c3D3tYz63xQsoGi
         TTc8B1BNGMU3VpbgBLOPqBzcFLJ2vKVtEUe42k3knjFTk5DbdHQ1AgcP4gyYVbC1o5Uu
         FM2xZaj9Rw+UqxUOxLu4/p/KvimYTlAF/GUd4R3NoQs+tCA1OUbQUzTqN7QtvWWa21LN
         +Hya2ULnm8sRf4yDTpwiJLgPnJIs5l4L+i31aQCd6mkL7w5VCgG0p0TUc5sihBaGVc6C
         Euzw==
X-Forwarded-Encrypted: i=1; AJvYcCX7qxLk03JHoEi5ApYS1W375mog+Fqc3tijMGpG3HjSlepO4DX6+UoLxgKAHWKTusK3CNGUYLMwRPcByJueMiLQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwdFWxQ+/rk3Tu2NWhPI9ZWC6xkKC0hDaeg5iNm4K319vq0AW4F
	HnGMU4aviJTr8jQOPKhPpv2wpov4ZTG1U6YG3HE1kfVCyISylhLdm7EbP1j+jAwLfbw=
X-Gm-Gg: ASbGnct+JSxp072sq/4XumJR0fFSSUaJSGHP62ycpOmRnVrC+kqy2X0//HEg2S9oK3x
	uI2/ZQWxjsZQ/oedUE0qfUXL0KyWjeVaY1lWQy0dC7sJC/rc106eC7kkN95X6Bliy/UpwQxvjOy
	Xx0hfoAAEMVcJmDeipLCx4QSmgk3oItv4z7iwCVd7bQubwBaftEIoKnCNDx7fmxV9xokBqfFsfE
	k7BqEqjwvhlrRS9F9EMxxkVSyEAw3DHouc81pSch0HFyuBwjOvpA+T+LATcaPNwil0Fg+A5Lt5E
	c4sFB5ICH4mwmyvxBxuGydICoq4oi7RnE5qJpHQpkP6tpcAgfqcp43cXsrbJhWZbVLFYaF3yfIG
	CHQ7WwnDhJBSi/PBvbcOuS7JWmRKELIw48MZeJZTjwyFmqNi1DPy7hL4DBQZ1PyoTJcjNXEu4E/
	5bN7k=
X-Google-Smtp-Source: AGHT+IHN82XFu68/fEKA3udTLRRIIvxajvSPhjBeGGRAN6IcAlWeL50Yku5UnjGbIWRGKBGVvUPHpQ==
X-Received: by 2002:a17:907:97c7:b0:afe:97eb:4327 with SMTP id a640c23a62f3a-afe97eb470emr1149862766b.20.1756390129962;
        Thu, 28 Aug 2025 07:08:49 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cf65b3d7asm207720a12.41.2025.08.28.07.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:08:49 -0700 (PDT)
Message-ID: <82f447d1-89ae-450f-813e-02c3d8228895@linaro.org>
Date: Thu, 28 Aug 2025 16:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/13] media: rockchip: add a driver for the rockchip
 camera interface
To: Michael Riesch <michael.riesch@collabora.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com>
 <3b4173cb-655d-48ea-b86a-a036f666cf40@linaro.org>
 <23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_070851_943996_2F965B1D 
X-CRM114-Status: GOOD (  46.06  )
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

On 28/08/2025 12:03, Michael Riesch wrote:
> Hi Bryan,
> 
> Thanks for your comments :-)
> 
> On 8/26/25 08:21, Bryan O'Donoghue wrote:
>> On 19/08/2025 00:25, Michael Riesch via B4 Relay wrote:
> 
> [...]
> 
>>> +
>>> +static void rkcif_dvp_stop_streaming(struct rkcif_stream *stream)
>>> +{
>>> +    struct rkcif_device *rkcif = stream->rkcif;
>>> +    u32 val;
>>> +
>>> +    val = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
>>
>> This dvp_read stuff looks a bit funny to me, you have a lookup which can
>> return 0 for unknown registers.
>>
>> Probably not the case with a control register like this one but, for
>> argument sake if RKCIF_DVP_CTRL was not a valid register i.e.
>> rkcif_dvp_read() would return 0 and you'd still act on that data to
>> write back to an unkown register.
> 
> ...which would then hit the same check in rkcif_dvp_write and simply
> return without writing anything. Also, the WARN_ON_ONCE in the lookup
> would complain and indicate that the driver developer made some mistake.
> I hope that the driver developer is thus nudged towards fixing the code
> they wrote.
> 
>> Would you not be better off having say callbacks to contain cases where
>> registers are potentially not present
>>
>> ops->update_maybe_not_present_reg();
>>
>> followed by writes to registers that would alawys be there ?
> 
> I'll think about that in more detail, but right now my thoughts are that
> if any of the registers below are not valid, this piece of hardware is
> pretty useless and there is something rotten in the driver. Thus, we
> complain loudly to the developer.
The developer is you though :)

Anyway seems a bit weird to me to return invalid registers, you trust 
yourself right ?

>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
>>> +            val & (~RKCIF_CTRL_ENABLE_CAPTURE));
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN, 0x0);
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, 0x3ff);
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, 0x0);
>>> +
>>> +    stream->stopping = false;
>>> +}
>>> +
>>> +static void rkcif_dvp_reset_stream(struct rkcif_device *rkcif)
>>> +{
>>> +    u32 ctl = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
>>> +
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
>>> +            ctl & (~RKCIF_CTRL_ENABLE_CAPTURE));
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL, ctl |
>>> RKCIF_CTRL_ENABLE_CAPTURE);
>>> +}
>>> +
>>> +static void rkcif_dvp_set_crop(struct rkcif_stream *stream, u16 left,
>>> u16 top)
>>> +{
>>> +    struct rkcif_device *rkcif = stream->rkcif;
>>> +    u32 val;
>>> +
>>> +    val = RKCIF_XY_COORD(left, top);
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CROP, val);
>>> +}
>>> +
>>> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
>>> +{
>>> +    struct device *dev = ctx;
>>> +    struct rkcif_device *rkcif = dev_get_drvdata(dev);
>>> +    struct rkcif_stream *stream;
>>> +    u32 intstat, lastline, lastpix, cif_frmst;
>>> +    irqreturn_t ret = IRQ_NONE;
>>> +
>>> +    if (!rkcif->match_data->dvp)
>>> +        return ret;
>>
>> Wouldn't you be better off conditionally registering your ISR if
>> match_data->dvp is true instead ?
> 
> As you have surely seen, the ISR is shared between all interfaces, i.e.,
> DVP and MIPI. Now the currently supported models all have a DVP and your
> suggestion would work. However, I think the RK3562 VICAP can be easily
> supported by this driver but does not feature a DVP (several MIPI
> interfaces, though). In this case match_data->dvp evaluates to false but
> still there is the need to register the ISR.

Why not have separate ISRs then with shared code calling into a function ?

An ISR in my mind should fire for hardware we have a clear idea about 
and only do so in exceptional (pun intended) circumstances.

So I'd suggest two ISRs calling into whatever shared code you deem 
necessary as opposed to NULL checking in your ISR.
> 
>>
>>> +
>>> +    intstat = rkcif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
>>> +    cif_frmst = rkcif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
>>> +    lastline = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif,
>>> RKCIF_DVP_LAST_LINE));
>>> +    lastpix = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
>>> +
>>> +    if (intstat & RKCIF_INTSTAT_FRAME_END) {
>>> +        rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
>>> +                RKCIF_INTSTAT_FRAME_END_CLR |
>>> +                RKCIF_INTSTAT_LINE_END_CLR);
>>> +
>>> +        stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
>>> +
>>> +        if (stream->stopping) {
>>> +            rkcif_dvp_stop_streaming(stream);
>>> +            wake_up(&stream->wq_stopped);
>>> +            ret = IRQ_HANDLED;
>>> +            goto out;
>>> +        }
>>> +
>>> +        if (lastline != stream->pix.height) {
>>> +            v4l2_err(&rkcif->v4l2_dev,
>>> +                 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
>>> +                 intstat, cif_frmst, lastpix, lastline);
>>> +
>>> +            rkcif_dvp_reset_stream(rkcif);
>>> +        }
>>> +
>>> +        rkcif_stream_pingpong(stream);
>>> +
>>> +        ret = IRQ_HANDLED;
>>> +    }
>>> +out:
>>> +    return ret;
>>> +}
>>> +
>>> +int rkcif_dvp_register(struct rkcif_device *rkcif)
>>> +{
>>> +    struct rkcif_interface *interface;
>>> +    unsigned int streams_num;
>>> +    int ret;
>>> +
>>> +    if (!rkcif->match_data->dvp)
>>> +        return 0;
>>
>> If you don't register the device when match_data->dvp is false, then I
>> think you can relax the carry-on checks elsewhere on match_data->dvp,
>> not including dvp_unregister
> 
> +1 I'll review all instances of this check.
> 
>> The rest of the file as I breifly skim it looks OK to me, its a bit big
>> though.
>>
>> Would it be possible to break this patch up a little bit ? Might make it
>> easier for other reviewers to give an SoB for smaller chunks.
> 
> I suppose what I could do is split this up into five patches, as the
> commit message already outlines:
> 
> 1) add a basic driver (no-op skeleton only)
> 2) abstraction for the ping-pong scheme to allow for future extensions
> 3) abstraction for the INTERFACE and CROP parts to allow for future
>     extensions
> 4) support for the PX30 VIP
> 5) support for the RK3568 VICAP DVP
> 
> Please note that in this case I would rework the patch for a final
> (this-time-really-final) time and drop this elaborate co-developed-by
> list, as the patch in question will then have nothing to do it all with
> anything what was before v2 of this series.

I'll leave that up to you, I'll still review your v11 but, a slightly 
smaller single patch to digest would be appreciated.

---
bod

