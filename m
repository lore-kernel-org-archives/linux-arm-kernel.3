Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF64CE6B254
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PYW2VODU+6ARkfOsKMX9HiT8wjTVrQXTg+TMoq0+tk=; b=4dfQosdvSxyjnoV9oGw4ETLnLB
	844rk6OKgWX/19+j5RuGs12I69CB1CtBzbKgJzKicPGywapwmCXxMFOXgcPH73wdGgnQQhjPJCYAa
	YRkvg9KwiailXK3VRo9yXUID3j5DuUuNWPRjvvqOuG/Da7rP5Or3nKdBBwUtP0+/OJUm61So/dBgo
	b3vch/JcRrTms6Joj+xpZMymRl70DMzl0qoDSzNPJgPgUxOlH6UK56RsS17c2MXN1OcYqD7wcVgBz
	WvdrmCzvWTHq4Cc+SBv70gvFbquKoJQAD+G9ZPsOmfEt/x6pHMuqG4S7qKM5LVi5DFdkxOx4q9Vhe
	QhvKCBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qtv-000000074JX-1oj8;
	Fri, 01 Nov 2024 12:37:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qmP-0000000718r-0cb5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:29:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d533b5412so1135478f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730464167; x=1731068967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PYW2VODU+6ARkfOsKMX9HiT8wjTVrQXTg+TMoq0+tk=;
        b=cdghMbKpVXRSXK94dK3K6WOQiOquT/Z2NR3ISaRGw9901kh5qzzMU+XiD/qJ11vbyD
         jKWhEj+u7orPpFxmp15D9YGW4TVUjEGM9+MUfgAPqL9tKffXf7t5JM7tjne4fP60BaBR
         da1kyWJa++ePlmUnwqvH9s46TAOEE8fYM2KKPM9w/G8svD4c7tvNcqmvbSIXJA3iwgvg
         dktkx+OMkhHsveCF6dnaVoLqVMBOr3iM+v4Kw5CPEqe+tPckERwqDDdaTae+OCdRue/y
         SVR0uuryp9QHcdNecIA3atj3b3TC9hb/DxQHSIu8PnBiKUBI+HI67Vyvw4VGgrAiATOV
         zaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730464167; x=1731068967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PYW2VODU+6ARkfOsKMX9HiT8wjTVrQXTg+TMoq0+tk=;
        b=QniI2LQ49NjHFRLZcFqWjRyNDwrkshUIhUNTMIm7QzJ43UPL1kc4Kvnhi2vROaQyGh
         6C8YQOYiUaxIDkMA639iUEQgO20q6XL2dWFd19KxsBkMDawQFVLSfYHuhoDcQHt1xeCA
         4UlXLTNtPU/meAzAcRgHUNIQJYCfN5/zpOjvSza30H354NAwJiCX7sHitlMDJ75+KHJb
         X3RYHmNb7vDAx58Igo0twkeP3h6YSbnOHc3f/cT62NkMWlJjdur8VpekPm90PgjpL8HI
         B3SBkZenMcz5BzE9ByCUn6Rlt2NARgRzWwYZByhfLclHNTIv7G0C2qEqempYsf4bCXZg
         3GBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZjWY6/q+wqe0wjECQzRxeQxCURGBjzzP7G4jLQy+ZteyB7P/Wb3URx6Z4HaybUiYHSMWaSb/VmT8FWy7Izd0i@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ziXDSzudthhN0/WQKgl9DMBjEsPWl8d2XvwKmfxS3r8VDeB0
	GktBHNSJ8XSwonb4ugkKkIokWWVlrop1GPFEQyDWwAXPvRvFnrOBd2estv+SLlU=
X-Google-Smtp-Source: AGHT+IEexgLpdNZzNx7qKEixOWvz0WoBXAOf4WpMS8azuyv76BwBUIhQnnmrQYq6kNbYJFzHI4wWCA==
X-Received: by 2002:a5d:4fc4:0:b0:37d:52e3:e3f0 with SMTP id ffacd0b85a97d-38061200becmr16575623f8f.44.1730464166764;
        Fri, 01 Nov 2024 05:29:26 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e734csm4981745f8f.60.2024.11.01.05.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 05:29:26 -0700 (PDT)
Message-ID: <7be231c6-a5b6-41ec-b43d-cbba07e7c448@linaro.org>
Date: Fri, 1 Nov 2024 12:29:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-4-d1a4870a4aed@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-4-d1a4870a4aed@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_052929_251842_5D640EB3 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

On 01/11/2024 10:38, Taniya Das wrote:
> +	.vco_val = 0x2 << 20,

vco_val = BIT(21)

> +	.vco_mask = 0x3 << 20,

Instead of bit shifting couldn't we just use GENMASK ?

Aside from anything else shifting a hex value by a decimal value isn't 
the clearest code in the world.

vco_mask = GENMASK(21, 20)

Much cleaner.

drivers/clk/qcom/gcc-sm6115.c

Same comment for all of the bit-shifts in the series, I appreciate the 
shifts are what the downstream code does but BIT/GENMASK does this job 
better.

Once fixed you can add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

to this file

---
bod

