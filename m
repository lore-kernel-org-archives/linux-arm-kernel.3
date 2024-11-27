Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F67D609CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+cmfbelmRSaQQFPiUTQDZitDA2TYw9iUjlwm476pkA=; b=DPY+oxCpwlkkaGk8thwDE6Ubja
	SdKSKk4Ozhyh8lacIId66hhjPxfAwc3womFfWk1W3cqdCNpyVU12JhAQRttJyhPy9AhLblgWLOs4M
	92TbGBZLLqXoOsVFPfbyloZwwoRJ09SJc6WfB3Wot2X3eTuTKCh/LHTPB4QiUkxAG99U8Pgj57KQK
	g8P0z9uO8b07cZxp+UoH7+GKoyDZqK8w+EZSetOaif/N2FACDVLmCh/MG9pxm98J9HF7wqXZRfycc
	XyLrFdW7CMIhIIwRL8d9J9KiYyLUHnytbji5LjRpyHsF6NroXA372GGTy9oakN3LRYkkdqNffYetN
	XL9CfiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFHx-0000000CqVX-1pp5;
	Wed, 27 Nov 2024 10:28:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFG4-0000000CqB2-0NvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:26:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so3591465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732703214; x=1733308014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+cmfbelmRSaQQFPiUTQDZitDA2TYw9iUjlwm476pkA=;
        b=YK2ZjD9LC5ovTtVQIlWGqwXzp7Jjj9vUzB6F8VH44NuVJug0jnQQTpk6RESk0zVS8m
         KgKr6yF2IHgg9ta9Rn0L0IqP50wEXrAUIYH/BA4vwy/LAFprRfdQrQevBo2jTRgIwqqe
         Y/GsaJQhz1Su6aXVP3cpLWp78QVqhOv35m/rlV7PLSB5U7NFeuC6/uxeXVQuaUAbhViT
         5u8faF+3LlZgI1aNPXCcfEP+a4fqTRGkfGi/zPjyzXR8ifX9w23SjqV3w0FiqPlauCHy
         HsReyIigxkwZvzeVJdYEph+z25bRSjg+3SEOQoCB071cpf/PljOgzRb31lbeTAzK9TVz
         8/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703214; x=1733308014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+cmfbelmRSaQQFPiUTQDZitDA2TYw9iUjlwm476pkA=;
        b=lIkyWw4kKcMpRkkWgyTNqEY9JGIfxLkE83J7S22HcDZ6+YcgpNK2OfQOQRZzhooJSA
         lwtolH1Z8+TPru1RbGjW3FhbEa/1hdReNCZ2b4b1rwFlajMENjxZGzzUSY2fnaDzGkgu
         3b0/sPtZCR8oiOMIZr5C/e/sXuWSOkDEkhiWVRalD8AUn5bmh/vtmTlQ4sSuEsd0bQYy
         xXjH5BDbDEaDPFfTwT4O8dUeGicrDQV4OD2QM2zvobxSR9I7U+R8YlW0OtqSjlrDQ611
         KhgzBZ6BGuoqI28cs/swM3HJDtPX6GPrs/0f/ewbzJ18qNdZwyqFZB/++9cLHetDhHRd
         +QYw==
X-Gm-Message-State: AOJu0YzbLJFpC7cze7tc58M2sJp4zN1hHxM5nEbDQo46vOOuWFi2GMH9
	bfgfcTwb3rgov5CLYfo11pKnUiYqjVHwzmtINUnH6dbf2KYZJWirq+2R+qqNAbc=
X-Gm-Gg: ASbGncsNR7L0TymMhAeDNDzHR+AwrzCjiGtMlPisJdr4iw0vibNCLvOh8JXiwjdo5Ny
	e5wwxeoLhKVm9xgwSTGdjgzkf2O3ycdGeErRAv+uVcnnTwApC66LAKKhgNArOgV54L1d3yZd67I
	YSyELQ7AOEb3Sg/doNyNekoAR+/wUQfQDkJQ024JFpQirEWP2s6GYXT/UiqipT0T5d01otmTxOZ
	WTGSgF0OI/01nLPHSaG5V3/n/1cWIpqsxkFWuQwrhHbFzb6R9Y/8R0ZZbg2dgk=
X-Google-Smtp-Source: AGHT+IHg6WbnrX0TF7Gf5SRVmRbOlRCRzVlxg9KnxKtMXHlYhNgEnOW4AlPtq4E09rvfEVr0xHICWA==
X-Received: by 2002:a05:600c:1e88:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-434a9d816aemr19447135e9.0.1732703214187;
        Wed, 27 Nov 2024 02:26:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76a981sm16464015e9.16.2024.11.27.02.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:26:53 -0800 (PST)
Message-ID: <fab23e56-9ef0-409a-b9da-a866e92590f4@linaro.org>
Date: Wed, 27 Nov 2024 10:26:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
 <20241127100421.3447601-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241127100421.3447601-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_022656_148738_1510DCD6 
X-CRM114-Status: UNSURE (   6.88  )
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

On 27/11/2024 10:04, Vikram Sharma wrote:
> +		dovdd-supply  = <&vreg_l18b_1p8>;

You seem to be missing some supplies here.

I'm not sure if we've covered this before but, it looks to me as though 
avdd and dvdd are missing.

On rb5/sm8250 it looks like this.

     dovdd-supply = <&vreg_l7f_1p8>;
     avdd-supply = <&vdc_5v>;
     dvdd-supply = <&vdc_5v>;

Can you point to the right supplies here in your dtbo ?

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

