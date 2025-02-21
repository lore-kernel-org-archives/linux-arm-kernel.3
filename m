Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CAC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q017wuvqryap7aPpTrbH5l2BPQ0yyhmTjmA8/NisBfY=; b=tN0xmZwk5SoBO0m18E/Q4kqsVU
	jWdU87a4udumGnm+qwitV6Du6ikIvQFg8dQjykJrFMxT7NmNcLofXhUd1rJvfk5uLsqudMyiaKwJa
	UIonRCCqgWV44XyjyNPlJVKlDt4lgZu7YFVoz4Kzo4r8SamJputnCy8lu4RKbLoceEkoxG9aF2zbc
	+/QVp8caFz8Is7poKBigiytuNveBfCeWVHohBJYmLo0ZOnPMwUsFMIr312/BoRxDiLwTssO8viPpi
	fkkhax0IyI0UM2pzfod8AFcBeVTspOpFG4HT//GnK/fGj1MIwK9pVGSHQ7TvgbVwW10TdepmJkLOB
	FsGDQ70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUhB-00000005wG7-0tcd;
	Fri, 21 Feb 2025 15:12:05 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUfh-00000005w3v-1G4A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 15:10:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abc28af1ba4so2420666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 07:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740150631; x=1740755431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q017wuvqryap7aPpTrbH5l2BPQ0yyhmTjmA8/NisBfY=;
        b=hrVT6wXFdt5fZ458H/KqjnILYw0hyV8R/SbXU1rd66ducZsZeMsJccDN0JLMUMOfNM
         5efabb+aD4dJsQ1NK/bgQyml4XgNQ6yGBi9ThkgDX/+mlDRdG1hK1bdFJWPAEH1x9oTL
         cSVNfTIXVjsrDlxbKoFHBee6VowK4YCEDX7Kijdvgq+QnMKdVJ4/T5gjUGcnk94FeSuY
         nKXxv/AnmTMA+2zoJuBTNE4qD5khO7DniQQ0BeR1zZM3ZgmPxrpRdwmIWrHM+W6DwBNE
         g7qQk1ksI+v+Cmh4j9G83Kn46AuzsjKmHXxDD2aK9I7CumaujfsabZLkIr7arZbTjCWB
         4xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740150631; x=1740755431;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q017wuvqryap7aPpTrbH5l2BPQ0yyhmTjmA8/NisBfY=;
        b=FCpIBYRA5GmYioe9KQCQNzxEznL8Xuj0oKS3MaGVg365T4x2fwPmsqEsTSCMiFn3HA
         EtJvUyLuh8wwcM8hbU5PPBtWT6q5mlVaEwPrEveS1LtUjCvqLZQxE9yF/ESCC7NuZXus
         eqIeHvmKx1gd0V2ll5krnr4a0AZatqBnDeR4y0Q2Yc+wb9y9JuYvtdD6cV/90n93wZdZ
         J4FwfVCUOs98e19X5b1pYS44OuF8YRk/8KHgkrE2/QIoMMBdmFWK3eyrK+jANAIXOfh3
         r7GN0fzCOsr4Fb0nfBwqyOkoWUeR1Qq4GDISwJr/MJo/AnywUO/lOa5ikV8HpF/H6Bfx
         RP3w==
X-Forwarded-Encrypted: i=1; AJvYcCU+vCeTZeH5Tj3d11Xo/SUoWPWzZh4oqfZUZOZEFhb0AvhdTWtEKIu+sVoWWLa0AMvqgJJsN+OLCoAHXVNtyxSw@lists.infradead.org
X-Gm-Message-State: AOJu0YzH2IAksx2TFp2pUXpbxQwg9fbDy2PIbYWidUmPinUdnJ5M79mv
	xfNy/8Phe10OoRZQLOIjHxM4lEeLE9lPHnrzPlBc89VaqY6HBV0XNipFkAgoIyA=
X-Gm-Gg: ASbGncu9UQiVTm+odyyxJfmqNB/8hGAOsYeXyVZjVOpLu91aLdJgeCZgfDmEUOmLvoA
	pMywL6tIHS6R/feW0WyD65QEVL4E/swGILSPZRu9kOTFGtYbYoBnib6zjcn2BksW89WoN88bM0B
	RPJ6DoFAicoRNaCLzpXCtwYixsxKqlY4n0wsTXkbYoaZQLCLNiDg3/OjeiKe+eZ0NG5i/KwfdVP
	bWVBF48Ho6qXUR+3z1k7PnhjHcGJDlNxtoEJW6kBOuZtBVIdpvNQvcZo8uiHxp5f8hjT0k21Sah
	KDEW2SgldHVB++TTWCdCzarASNlxwVFVqnaUPi0JXZAVvo097IH6txLMHhsyzYWMvmZQfj/WL7Q
	GYT+J9g==
X-Google-Smtp-Source: AGHT+IElVOKQrHQSW/WG4AXM2/H7NAh/sNrOhfOcPDza3R9P1CmFhC8jRazW/6xVsXi0tYza7X5QMw==
X-Received: by 2002:a05:6402:5215:b0:5e0:88d8:440d with SMTP id 4fb4d7f45d1cf-5e0b70d2589mr1135128a12.1.1740150631534;
        Fri, 21 Feb 2025 07:10:31 -0800 (PST)
Received: from [192.168.0.104] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece271223sm14141922a12.59.2025.02.21.07.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 07:10:29 -0800 (PST)
Message-ID: <37292bb9-6886-479d-bfb8-05e2ee540c6c@linaro.org>
Date: Fri, 21 Feb 2025 16:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
 <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_071033_347841_C7D789CF 
X-CRM114-Status: UNSURE (   9.78  )
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

On 21/02/2025 15:11, Dmitry Baryshkov wrote:
> On Fri, Feb 21, 2025 at 02:50:13PM +0530, Taniya Das wrote:
>> Add DT bindings for the Camera clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Just noticed. I've never replied with this tag. I've provided a comment
> to the v3 of the series, then in v4 this somehow appeared. Could you
> please comment, what has happened?


I think that's not the only place - several other patches got your tag
even though you responded to only *one* patch:
https://lore.kernel.org/all/cwiai67gs2o3tj3bjziao26uxg3yrbd35dknkvjerbe7cbgfca@qhjtij23yn26/

Nothing in changelog about adding tags...

Best regards,
Krzysztof

