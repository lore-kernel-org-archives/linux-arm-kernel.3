Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF4AE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs9RMDRe4jTFPEvDmtH/eSMnjvvfZudpLPQ72QFuTUQ=; b=Agc0xd6vIq8QgnHprXlHGinR51
	PZq/1cPpeQns8t+w3vuUbdPFy4ZLsi99LnV0FIbrlaPjOItbWepxb0QGgXlU+J01w8aYrFOJ5lZwr
	5d5j96dV97WBanzCQAVg33qiabFrCfA1fOZjrI0XsV0ZzN0VPvhO2/4oRQJRVVWaLer0+4h5FK98z
	rZ2OV2H/Cu3zGQlDLnTpjpry+KLG2/0vfbarPJ4rWQgPWOzEx2qqZx150VSUMTTYBwBXgemqFiVDT
	jyGm3LROpEBPMby8Lkdue4X5k73WzBUDThtRmbtC2D0CPZXoRKXdLIFh7P7/A6hqI3P/cK5kSb9tS
	XgSM135A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAgG-0000000FtHT-35su;
	Thu, 05 Dec 2024 12:10:04 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJATF-0000000FozZ-0HPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:56:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa549f2fa32so160413066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733399795; x=1734004595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9RMDRe4jTFPEvDmtH/eSMnjvvfZudpLPQ72QFuTUQ=;
        b=izcQ5cTXpxGoFVnKNlbsc3Pu8VhQyDOU97vZjv2Wk6W1a57ZPcDV/ItcYM93qmbms9
         aCtmQcWZHA10BPcUUMcQKu5h44ITQjL7SurrFCo9gSrJRNKcKH42pGUkR+zq2LAzY5SI
         mtSWY9ZJc65WMQ419UpziowH+vseW22jvoAUWBsM+OB2j9rqls4jO/v2vM21o4tv255I
         pjsm6QxcXv5EudoDplLGVdIoWZgoI5rhhnhLLMoVliL1Q6WY7o8ncqL+ibsf/SqEUQ+K
         wRDRhw0Vc3BPwVLfFmtp2RM2ZxyBfC/6xMWMSA2UypK1H0lBUkz00P6hcsy3RPv0MobY
         JCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733399795; x=1734004595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9RMDRe4jTFPEvDmtH/eSMnjvvfZudpLPQ72QFuTUQ=;
        b=sv643/ZnYJarrwj6zeJWkwznDDhPn6v6+RH9Mol1PM24yom7oFVTrIpiFt6lXRSZVl
         K3jggP+P46biht7sK7ovbEPsjVFpzxrbesYF1uYN+7W9DoWJexhqtYxAechNV2cs775i
         DQk3lDlN5Cll16DhaSl/r77MCg7yYZfOND4gMtBL9tj+Y2VkSAO5Ui91mCha+nPiJPka
         E2NVWKqjt++HqM2/9LObPEVTuLp+O2tBNDfndnUcvWBzwW11gOy8i3n5q1hSts5XvBJp
         dHGWThWdWwDmK4NWwo4KJvvwd6O/Woeza8QxlxVM35RZmOwkYlIjZSaYCR5tNLjUESwl
         Gzkw==
X-Forwarded-Encrypted: i=1; AJvYcCVi2HfYy2smUcvaXwo0sJr/chGjz+razlGrYb86yDze+bH06h4v29iuuu1ktHskDBbUrnsWhz4I70qOxBVdUbH/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu+WoHrwS8XnmDdXOoWl/RVIDl3Xi5hdgnRM8IjyrQWq+DbUrk
	g3Ac9HRL7p7RuKiGNrhJ39UpkqPhRW9xIy0wgaqQTXuj2f8M/6XIobVyig7N51Gu+a1cC5YQ9gI
	8dG4=
X-Gm-Gg: ASbGncvQ2XVcjzQDORlx3k6icf6dl2awozjwVtIalGbzTrVv/XAGxLlP3UtR1BMM+AY
	3GP7/O9/pvkP2kHojs1BWKcdwbQnP9GZX8/GvaGfLGsRknXQ95KoU9m/J6X4EBPShgg9u0Z2bfr
	/wO8dEOVGFG5sL1EnUgURDrkUCMp8aZlOQjApnuGVk4XkdD/6knWy54Jw5JWhdyPWEZY6ztg6oc
	aB21hzrP9NMui6uQLs1s4pLTvQzgHK5o0F8/yzLwJlV8b5wujh+0Wj5CDGiY+U=
X-Google-Smtp-Source: AGHT+IEWGiuqCz5p22sJv4oUuBbuzMg9J4wgAEUTDCD4f1ma8OOcOH3epiuHrkUATGhdMfNL7flyUQ==
X-Received: by 2002:a17:906:23e1:b0:aa6:312c:5abe with SMTP id a640c23a62f3a-aa6312c5c99mr28100666b.58.1733399795552;
        Thu, 05 Dec 2024 03:56:35 -0800 (PST)
Received: from [192.168.0.62] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa626088e8fsm81659766b.139.2024.12.05.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 03:56:35 -0800 (PST)
Message-ID: <2cb5940b-3779-4450-a213-fa766df7f406@linaro.org>
Date: Thu, 5 Dec 2024 11:56:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
 <oko5qqysmxhicqzkwhkz54wvsmt64ba3cd37zkcy55ee77owbk@5z3zetfr2ejx>
 <eaffa633-c3a4-4924-8ba7-694b18bf92ee@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <eaffa633-c3a4-4924-8ba7-694b18bf92ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_035637_126266_28FCD04F 
X-CRM114-Status: GOOD (  12.41  )
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

On 05/12/2024 10:59, Vikram Sharma wrote:
> Hi Krzysztof,
> 
> Thanks for your "Reviewed-by"
> 
> +        camss@acb3000 {
> 
> If there is going to be resend, then node name: isp
> 
> Sure, we will change node-name from camss to isp or camera (As its a 
> part of generic names recommendation as per the shared link.)
> If there is a resend. or we will address this as a followup.
> 
> So
> 
> - camss@acb3000 {
> + camera@acb3000 {
> 
> Best Regards,
> Vikram

Please no top-posting.
https://subspace.kernel.org/etiquette.html

Shouldn't that be isp@0xaddress ?

If you are making this change, please remember to do it in both the 
example and the dts.

---
bod

