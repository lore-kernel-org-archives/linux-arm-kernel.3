Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49544C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ATS9kH3JOXqCDIar73OnrkF9ilRSB+64NK3pHta400=; b=y2/ju5Epdi+It4gie5tqHDBAFP
	TGOcAsohoiIOtMY8PgUdpIa28Nf9leKS6swCxk2R8VEdT89/e5VHDM8a7tXk4b1CEowHzBlM5AHXn
	/aSx93GMg51hAivdgSTXaKRnT5c3upa+voSBZFge5mpbwpOwnT/3Be13mWJCNJQXuvvtd+Z46Yfxu
	+gE5KtcZ80vumwBHejkeK7JCpP/XOoQ/lfIuxSG/5n2ZlKx2Ec9pjDodHz/k3esVZFguKfvbfpGSn
	2mPUBTClVal05B7j+UxEOf9BQKd8SWZJVn7Ugj7nAWX9CNW6llWXxyaVHI8lg3RWR3ifMsO8lGAx0
	THBzehsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thm9S-000000036Xw-47BG;
	Tue, 11 Feb 2025 09:01:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thm3K-0000000358B-30BC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:55:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so1846264f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739264133; x=1739868933; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ATS9kH3JOXqCDIar73OnrkF9ilRSB+64NK3pHta400=;
        b=Qyysy1OxBxExacuyFGtjDxEdYNYL0Wraqodb2ogNyWspY+h7TsdxUbtRoudb4Ap/wX
         2m0Uz3HiOllVu93Tiohc8Tm2eDzV2hPjzmibM8Xrg00IIC2+x4Gvl9+S//3L732al/Xc
         tOCsPWzwmcKu9ztwL4bLI+ipcvxG6PkRxg8u7OtMnVXS1vhIaLKpX/HOzQJ7wF/k0N/G
         wWFPZD3/4RMh29hp5q5WhBHCY22n8DriDm8vYgo/+NyqgdH0xPCEdufewyl00wjLeSfy
         HsdJPimRZAFZB0GwhzEY2C5QWxD8WGe2HgrmNIiwCwdXeDGNsCG5IFdDkxsX8vmYJ9dy
         6Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264133; x=1739868933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ATS9kH3JOXqCDIar73OnrkF9ilRSB+64NK3pHta400=;
        b=QIMralzStHLCObVUInx7k31H9+bI3l06chiOwUOjyxuZBPfaL7bDvUlm9WG242T/uc
         zFb4Fzyd+x5/Gen72xPZrHECPYQP0LHlWE0S1uXJJs9miMyb7ML9BYw7U4vdc+vOGktF
         oENJlfhKi8aj5mQvFvokUrDjK99QXIMeIxWb0vTojr9rFDV6iDt6SpHAiKe05nAr2/Wz
         /AGTa9viH1j7EMdqUEBpyYm9xbtyJbhaMBIuCD9ivOrTtVeIL7ys9PHA+bxXRqAGnvii
         kzBmeTuxeVr12zmDW9Dz+Yf/EU6lufwhTPH/GEczJL6kaQP/Hr4iedpiKTFVm4i60t/y
         KiYg==
X-Forwarded-Encrypted: i=1; AJvYcCUdtm8+zP0ozATUkEab7MhPHR+JgJG6eNVTenPSc/vUQbsaOP2dIWfhklC8N4qbVv8p+9jaC2HTSNFDARuXlyRx@lists.infradead.org
X-Gm-Message-State: AOJu0YxOUK+YqJ7arYk3gEkTf04mIbNuz2FJX//DMXTFi5RWn69FLDdF
	CCpizzQxzfprbSsP8KLH+1Ni3u9m54cbExdQ7mbpP3OOhbnlF5O17y5PG/aGGhM=
X-Gm-Gg: ASbGnctXlYl0RtPtRgrtCDgGsDdFZ/BJZFlDshr/zbl4DvCI7fd9KD/w7RWJIFoyrvz
	i/YQy8eG3LfKCfmVfSArAzV/W3IC/FVjk2RqirfRkK3ncn0Xmdn23LSsmQg/WOIjdzWDIdOTFyd
	DGQgURwLDaL5huUSHhPwcCFup25KFZokWacVynXROJQyqqDHNephQvEdB3YKoOfLGddNNnRbEYr
	RA3uUuZqrGN57JtSi5603eYNFUm+Q1pLRpI5jJ09uhPu0NMHkRnRm9SZEFZqOaAw92C6Ncu0uJi
	4DTWwdx5ojGnSXrjJRCQe0+xCsI3udI1daeyy3rxOi/HDrzxpbcw9Sk=
X-Google-Smtp-Source: AGHT+IGlpUgTYtIiheMDAuizrYUdnfwTiXvy3+Z24hKU84ausw4miBggLrIYHvGUHbl0rw2KWztuoA==
X-Received: by 2002:a05:6000:1865:b0:385:e105:d884 with SMTP id ffacd0b85a97d-38dc9371e85mr13413888f8f.46.1739264132995;
        Tue, 11 Feb 2025 00:55:32 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dd187360asm9452225f8f.43.2025.02.11.00.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:55:32 -0800 (PST)
Message-ID: <bdd94f9c-e751-4a16-848c-bb83cf1be569@linaro.org>
Date: Tue, 11 Feb 2025 09:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005534_758248_72B421A4 
X-CRM114-Status: UNSURE (   9.76  )
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

On 07/01/2025 14:10, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

