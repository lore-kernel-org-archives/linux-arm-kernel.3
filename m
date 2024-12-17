Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719A1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0MSBSw6+OhbTrh1m9W9JgXC4AYYLnaI//MfIF3U6z0=; b=NN41EMCNwC6EYP4NYetWITp29c
	hMuBIPMV+capQUrQWHeicN2WsJ0SuYpJ2oSkpeK2gJS13MuTcBU2NN/x/oarJzCUB7MdI/yZMRkC6
	rrFLQgE/ZP5wiIj986Cb7OPON/SZD8hPMss8yRobopQjaPkqsmXROI1wD9Row75lu5rKGAAD/aQOW
	CP7eZeLZ0ol9DJxUmpkO2nFg6M3A3H4ESksctZdMuiaqIlO4WDVsev7Mm7sGRuH/UH7N37rw9LnfX
	ZTi07rHWc09PPFBmshh50pnFImOHEyuNBR30QGnfsqlsrCEeoiFua2/B49l9TmuECTgTIdQKGgSyQ
	kRcrIWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaYg-0000000ED8v-27DZ;
	Tue, 17 Dec 2024 16:36:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaBa-0000000E7Af-2SlL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 16:12:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385e2880606so5061908f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 08:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734451956; x=1735056756; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0MSBSw6+OhbTrh1m9W9JgXC4AYYLnaI//MfIF3U6z0=;
        b=ZcFxcxdF98M8jvvWxwEG2E44BTjUr0JuLpTPIZ1dD3dI4jSF7gqEVZUI4eIwe9ClIk
         dhE7dBUf20kmF3LBgYJN+9edpj3ymPTVUoz6pVN0/MsXOV13vCQEBgbmziFvzospO6hK
         CuHSZh6PADlJAYnVXB2HBudZQmoDnWmOLie9kNoKx2cD8DhVUX2WxbybqoZrxURf9ho2
         BDpdB9kKyvX8D+U5ZpRmEJ5qA4Lr4dd1TG91bZmAivNAhn8lR3G+tLsJxiF5v2o6jINm
         pQmT1Q6vh2TckptboEOJNE/B0KGp75gu3YkzbS913luSWZVe3Bx+xwonGP6pUyI8eYFM
         kerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451956; x=1735056756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0MSBSw6+OhbTrh1m9W9JgXC4AYYLnaI//MfIF3U6z0=;
        b=IBwuJCyeCTEgGTlzb9AmS4fuXyZoZv+VYC0uXoqtigbhpTb7RoJmeQhMSlCH6PnWj2
         BUFzkMQgOe9C0Ngn/8khm98MY6HqUjc+hrPcW9wYMdj0fUiIZUNTN4YHE/D/W6GgU9mc
         CE/q/y7xItaidtDJRI8vG1SqyH6kmHitCSK6p9oDS+aPpuvvodheHiR0V9FFRjzixnIu
         LOXN3L9nAX9W5dI8ugHrYx4VWSqYPoIF05QjCnDuxv7Jlnet7ET3UnqUudNPNfCq7ylR
         F2V7+WczbTjlpoE9V21TGxhGsGOCIeNeJSR1mNE4Ge34DK/NpjUkajo0pWOclcfxmLSp
         xcDw==
X-Gm-Message-State: AOJu0Yw24bOdTpapvQNO9rysY9H8lAZHrSbQOR+J8uqFlgPjYupU8C1L
	8gzNvJviVq3n/rylZfyjakACzKhqbSJoF8WoLfmZLsgmRTBJ18BvXD+AqbiWv0E=
X-Gm-Gg: ASbGnct+O8bFPrXeH/tyNgKCV6h/VJiLOgqsGroVWFEiM+62JS5CAWe4vTU6BNoYNvJ
	wlgwJLpR8NFenJaloFFITqkhk9Qdp8WKhTJPSAmq/Ddu/RmpRo9RE6YptqEgtpI5QAvITAipRHY
	MY44++qr3iYvXzyw72NphHBi+ab/ruuhiQ+vkfVJnBNMpIMVyjdIeej6hacXdv3vtgisRP1AFP7
	VK9knoLDbh0QtD0y7uV6CeWJcOaNWMceeFjcwXp0+Ap+MIxUoMLPdBzToOnnh0vMX7TdQ==
X-Google-Smtp-Source: AGHT+IGNQ7hhBEySJuTG7bF8w2ZzmrZV4ZxMbtUaczoA4N/EwDXYjOiMdMzulLRJCZ/qQh7rX7Zo2Q==
X-Received: by 2002:a05:6000:18c6:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-3888e0bfcc4mr12807413f8f.52.1734451956514;
        Tue, 17 Dec 2024 08:12:36 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c05sm11739012f8f.73.2024.12.17.08.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 08:12:36 -0800 (PST)
Message-ID: <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
Date: Tue, 17 Dec 2024 16:12:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_081238_637288_30444C41 
X-CRM114-Status: GOOD (  12.36  )
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

On 17/12/2024 14:10, Krzysztof Kozlowski wrote:
> On 17/12/2024 15:06, Vikram Sharma wrote:
>> This patch change clock names to make it consistent with
>> existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
>> This also adds gcc_axi_sf and remove gcc_camera_ahb.
> 
> Don't combine ABI changes with some less important things.
> 
> You miss here explanation why doing the ABI change in the first place.
> Without that explanation I find it rather churn. But anyway, reason for
> ABI break and impact should be documented in commit msg.
> 
>>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
> 
> Best regards,
> Krzysztof

This change should be fine since we haven't committed and upstream dtsi, 
so there's no ABI to break yet.

Agree the cover letter should have been explicit in explaining.

---
bod

