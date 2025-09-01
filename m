Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3493BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwVv68lybtG/3lTbSeRMLSCB2s0eqf0axoIfKgt8qqM=; b=Glg7313l3S2xZp8Vy5BnWZTf2V
	XX00l6b9Gj+v+eGNnIJVyCNRwP/KzsKvVBj6fgKOqACtxoVYlD6KErBP1ABSnS/R7uFJGKjW0mA/9
	YEgFGDPygD1ps0K3hKfLv4egNdLlou5Q3Gneo5M/P6w6+6vZioJbyRBboS0b/rKa6pEzyqF3tJ7/o
	/U0L7GgUycC7ZqCoDphYpCAWCPBB8nT5Xj0fo5m5nUw5+7f5Plc2Z2SZ6XhHylolxzm2IvLs74UfV
	P3+KhEVYrmfKduuBDTv9H2eiebnneQ2qcrQDBhJ4VZmpmNwArh6SompL8/LXIWvj3cjbuDcnB/1jL
	odROB0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1OF-0000000BqeV-2ISo;
	Mon, 01 Sep 2025 10:03:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Sv-0000000BgvC-0TDc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:04:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3cef6debedcso1724581f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717479; x=1757322279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwVv68lybtG/3lTbSeRMLSCB2s0eqf0axoIfKgt8qqM=;
        b=OmxWnhOvvBO3Yuce1Dz2X4uTq96D3K+KMvNg1Cd7ELACy7ZqetiL+yJhOAINeSSZCX
         NyCDdHE3kLPA9erQUOv5CubIfO/jFORcnePclzEwtaI70yBup3qZuS2JmfwShitjX+gJ
         40x/Ym30ZpAVv0/5450//jXKbgos6x8SKvsgcpEPtkQNEVEk4hdkjJl2wXs7TchqffBk
         NY5g3lfvGLEugE/m3uba5WkIW6vJFJp8FsO2LbjbZLLSpmWe8cGPif6NQ8c1Y8FkUUPo
         C1PbxZxOaCtjRDyBXsFYTAkqN1BSx72Z5evIcKDLhSwbfCKvjrPUc/xT9XhowkaXNxH1
         ld2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717479; x=1757322279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwVv68lybtG/3lTbSeRMLSCB2s0eqf0axoIfKgt8qqM=;
        b=pMQCXRY1jCn80Uxi8eO8TkRTG1mf5ZiAm5E3TEWUHh0VtUuEAxdiytS2+avuBlULpH
         8a0TBJngp/RepKYjhUtmmkzwZV0DPUO3sHLBnKcDZzO9gpxCSTcEXsyITSFiGKNX6mUc
         vH4LV7Hy3dL5ktccdNEp0UlaSksLD+LG+16Yifm3kUTSkx+o7O2XzF2voHLbq674GLiI
         LgmQaRauRAWshzv2jvQDdDat/1pEU+X0oOKz/GdnuKkW3EmDPu6+utucui1EXRQU4/GZ
         e+gnC8PBhuXLg81BYNzM2YuU6bgV+Wog1iG3LjTQNlUEGLrSm2rhVL2brqJVQJRTkqHj
         2ysg==
X-Gm-Message-State: AOJu0YzRm7B2nRlvEI3OcR6dIcrhqr6Dn6quGMQVVsFnSZEwJgaMmV9y
	IJWis6/Dc9tMIDF2lmm/N344dPgbXeAv8R+k9E52JqsoerH2poDrEQuJfeEtslDQBWM=
X-Gm-Gg: ASbGnctxLLB9tKD90cuQ7kSIfAhChFdp2CtjeaJgn8xa1dU52B/b7/LR02ziWSOfHYr
	9gaIYZNoOEzsHg4PTpZHKDhiCHIx+6Oc20NfLfznLNE53VJ0h7YpJMmksce7/Rm1Kn1IFk7k5Pu
	Wt1rm9u58xcBklzCnXA1DpK1q0dnWvYGZwSGnxOS3IoPYvv+nbwgHnRO1VV0uMYQZj176551N6G
	Mbi8rPoyT2BadLVwvxhkcRgZpCkGft27h2mWFzQwBW2ZF8VVGV7ZhbWWjS8g4h82CwDA1Qlf2yX
	lBpUAMH7bOEVBMkN2KM3j05hHKAWookwOZq9UErDjZ1tTwVwBxIdtRQWQxPANQiPp0dMnSUnzNK
	MOeRvxv+SE+xp6vm2s7qqMvYh+TdrsVcMqN2qRmi8oVgCv29Ax/Ezsr1HvAClPm1l9tRP7ZqmXi
	JZWcB2mryyfKlKGf4ZtGj6s4TCSr2XAw==
X-Google-Smtp-Source: AGHT+IF5ozFXuC12DhRU7wnhvEb/Eaxn298/3hrvqF72A12C7sUxgS1LCCpfGamLqO+HTku4EuOKTg==
X-Received: by 2002:a05:6000:1ac8:b0:3d1:9202:9e with SMTP id ffacd0b85a97d-3d1de4bb305mr6081112f8f.36.1756717479121;
        Mon, 01 Sep 2025 02:04:39 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e9c41cfsm147188325e9.21.2025.09.01.02.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:04:38 -0700 (PDT)
Message-ID: <498db18b-f6bc-4678-9d70-7741e3025185@linaro.org>
Date: Mon, 1 Sep 2025 10:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] media: qcom: camss: Add support for VFE 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_020441_152541_E8556225 
X-CRM114-Status: GOOD (  10.49  )
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

On 03/07/2025 18:19, Vikram Sharma wrote:
> +		!strcmp(clock->name, "camnoc_axi"));

This is causing a regression on other platforms because they define 
camnnoc_axi but not @ the rate of the pixel clock.

In fact its not very obvious why the CAMNOC AXI would want to have a 
pixel clock applied to the interconnect fabric.

The following resolves the regression for me. I can either merge with 
this change or I'll have to drop the VFE690 changes until you come back 
with something else.

➜ deckard@sagittarius-a  ~/Development/qualcomm/qlt-kernel 
git:(aaa8b5ab704f3) ✗ git diff
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
b/drivers/media/platform/qcom/camss/camss-vfe.c
index e969de74818f1..1aa0ba5ad8d60 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -913,8 +913,7 @@ static int vfe_match_clock_names(struct vfe_device *vfe,

         return (!strcmp(clock->name, vfe_name) ||
                 !strcmp(clock->name, vfe_lite_name) ||
-               !strcmp(clock->name, "vfe_lite") ||
-               !strcmp(clock->name, "camnoc_axi"));
+               !strcmp(clock->name, "vfe_lite"));

---
bod

