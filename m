Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49263CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=; b=YODbbvRirf6oCdXI1AiiT7wa0k
	poyn/jZfxE/fEfAcGv0ty7/p1nN3HRI62gY+suZ1N6OiPoskFUN9+UqHx093bjj4qR3HFG/IbIsYX
	rBycYecCJRTiV17fCQu7UjnXQDMaP/JZZD16EB0MoHzfnpOvDKH/NEKGbydXr5U5GZWmBtXWF/9s3
	J15iSq/KoPBiLZ527azO29px9lgeGUVXZy7pHLcqTsrSnYpleLmce5p5+Qtuhj8859mUL6OD0XYNy
	YAEp8qAhhbsb0z3L0KS9xuctPp1leGvLilCj9j0UMVwIDbFZj5TDNBD/mMQ+uUPlFMGiHEEtHWDc0
	2jkJ2+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEKf-000000048U9-0G7D;
	Tue, 20 Jan 2026 16:11:53 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEKb-000000048SQ-3rp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:11:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-43246af170aso3236401f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 08:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768925507; x=1769530307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=;
        b=jhm6GEpsVnNwij78L40Sya5qikFcE9WN6255ENYcsmNW8ft9mS/C8SMAn13a03O5Bz
         Mmzx+famXuyQ9QP/rYu7hPfENJkrl/LOVyPdWU2p9USAjwiepf1JGDE3OrcSAJBzloZI
         I2nf7wWTALf8kzxsaYQM0adQka9LzRpQGtHSnhu4zEyIWVZJpIzDnRG0jwf8Fnh5QIJM
         9w+AMZ6XSOtq06WDEoUGSm8UyZFrVx2z/XMYRFjtG/rV4tvwgff5iW5HVYujd9EF0MQo
         h6wZ1Obe89N6UtzHMIQiV6WA8eBgSWEA1LNtODpdAqMhQNUq006wf2TRL92CXMPFIgjB
         LvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768925507; x=1769530307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=;
        b=LzzyOsSjw+usm2rsXWwFiaDrC+kKgPpOd+T+u7MlKn/M3gwoF2KdNKxCuP1IFAlc73
         GgTr4p1MSWfLMAxHznhnWVd3DpuDFFiCzDSt2ujuf2iG+6zEqBtLceY2LFSu6HrfE610
         gzPEcJZjyg7y/01J9KPQmQdfzUJuCFUG5jBy9JUCy3cHP85oVJKIK2hrg+ZVHu9gbeYn
         LCaAKHZ9BC29Ye8zr8Pd/kCsE8aAXj5DytxWyyKXvps67vgslGk4a++uUVjSBwynyAd3
         myWWYuZFQAMh30HzpuISq54jnLkMHh75zk7GHTOFIesXzstv12M8fghBU45VZujwjC3Y
         lVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKK+BLzXlky/vRFfUeIiHViz8XfueVKvEa/dW0tJSwRmWLccf5hySzFB/4pqdaejj7nzcJExnw54BeCpDk2Mpv@lists.infradead.org
X-Gm-Message-State: AOJu0YyE712Qg/unOA1stuJwi6oRyqKSD2ESa2F58l7r/kxIB4el7sm7
	smBjeBa83fghYb61LaBojADAX6eoHugscDxtmrIp7egr1EsSQFo9J1IBP7qXb+ebANg=
X-Gm-Gg: AZuq6aJe+t+9cJpPBcdEYSp14+GbG3BgiVNDKnhPFnMtfGRUg378Lad06PWb4DV7iaj
	WJ6kAUDKF2mtnAuWFuYo/ha6hLJb+KvAOjU3yBGN3bhx4OBWVDK61hSQBt/FMeIR8C94q12hwoK
	RVUdlZEYsx0WxWaePbgTAFoc8guiOf90lcqZIDD83EnA7Hxg78bxFXy5EGwY0OqDXsq45SozQ3k
	rnaCvurjGt/NNPHiNELKPq9xoxkuJcoBkMC+F1scrQ6844Lsj9FS5a8u89FbqcOr8C7JxTAPxTa
	35VGltoSDORF+DPgv4W2Ns2zxCYhfSr52xquzIBQ0ePzuXYwMfiHn/jL9nYb8AFDT+dmy0/Vpn/
	A8D13BJnoMXs2aHm2mgfVZoRA74vRdRifPd/25W283/unPHUjQBgqmP0z8Si0YitutJV3lxZwDA
	ttXyL+HZKFU/9w0K49OETERK9BCHDdY0yPwnGy6FOlIQ+N9to5lPUELJvyBFjKClVs2w==
X-Received: by 2002:a05:6000:400e:b0:432:c17c:3094 with SMTP id ffacd0b85a97d-434cc99cd37mr25319021f8f.3.1768925507512;
        Tue, 20 Jan 2026 08:11:47 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:73c1:f0e1:c420:e523? ([2a05:6e02:1041:c10:73c1:f0e1:c420:e523])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4356996cf42sm30553088f8f.20.2026.01.20.08.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 08:11:47 -0800 (PST)
Message-ID: <dedf467f-594a-4039-8baa-f43744463b1a@linaro.org>
Date: Tue, 20 Jan 2026 17:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: tglx@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
 walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
 aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
 <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
 <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_081149_981170_E0762C39 
X-CRM114-Status: GOOD (  14.19  )
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

On 1/19/26 11:38, Daniel Baluta wrote:
> On Mon, Jan 19, 2026 at 11:56 AM Zhipeng Wang <zhipeng.wang_1@nxp.com> wrote:
>>
>> From: Jindong Yue <jindong.yue@nxp.com>
>>
>> Change defconfig as tristate type and add platform driver
>> to support building it as a module.
>>
>> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
>> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> 
> So you can now select the driver Y/M/n even if no COMPILE_TEST present.
> 
> I wonder why we needed the `if COMPILE_TEST` in the first place. But anyhow,
> this change looks good.

The logic is to keep the timer option silent and let the platform's 
Kconfig to select the timer driver when enabling the platform.

Then we wanted to be able to compile-test those drivers even if the 
platform is not selected.

Now we want to choose between module or compiled-in.

I'm not sure if we really want to manually select the timer driver or 
switch to module.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

