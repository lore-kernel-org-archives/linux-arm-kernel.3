Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB06E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmIgGmMzCzPMs3nWbq1Vj6DbI/moOSEXCUqKC+k5+GY=; b=MPG+4dQlHAxoTaqsG5q8fyCu+v
	fzVwp6uldGEtzknl9jT1BMKc0S2zI1iAvm3mf04xYvlJQQoTug43tOliaHL+/Ka7L6Vai9DMMo/jL
	mPPUsQHrTe6al4nsouXBBqRBT60o6lxDs1cwUoM3DnjPuc3qk4c/1ffAdjN1zlKD6K/lcYJ2irdrD
	T01uYgFM7IOMpC49XpKF0AEPbDP7LyF3S4TKUgiJapU5zGN404woOeGHKA1O9YGfk6+M/tBHI1Mow
	q92iP4uVC7bXflIzvVqEiR9Nxel1kMWDJvCn1Chys4dzz3Clqm+6ONfAoHSP1U5CKz76VPWGcECk1
	KWzk6O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2gz-0000000BJIR-0b5U;
	Thu, 19 Feb 2026 11:59:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2gw-0000000BJI4-23Le
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:59:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4834826e555so7825655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771502372; x=1772107172; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmIgGmMzCzPMs3nWbq1Vj6DbI/moOSEXCUqKC+k5+GY=;
        b=UVR3rEoenBQXtbgA/gCk9OCYLuZI+U/MOkVQFnl3rpGbah0PQ8PKmOJbYvJ69+wWmL
         ra+JDtxtQYrmFnbbIOrwvWoxt44ut7hTY23U6wnNvchnBm3RdzC0V3ST7sspFrMMpi7l
         3waUcD7P3FtRNVvbv6w8Q61CTDMdhG+PoSGF3G8IXx9YFVtgf+rw7Dsk/d2DhNUMcA0s
         Cj09UzEDFGP9rctsD0/ntslqYh1Al6FuYQChZwFWKiU5XZGbOA4cElcBYTh8sVnvGySc
         CPt+7DoLgTvRAJlFITOY90rm6091BMwrEwn2n0qpySI7KOK3V6tvH1eFcmQh1kjon4rk
         kGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771502372; x=1772107172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmIgGmMzCzPMs3nWbq1Vj6DbI/moOSEXCUqKC+k5+GY=;
        b=IKYimsLfI5C3fRMVnBKRJ5KCCbEv5y6Enoqm73WOYm6mSj+5KWiPs2pALy7DvG7VIE
         UyuzFapyJ3vV/CYgtpOxyJRwta1txxC/7BN8HsJDvMMFzlaaQRPZtQdNz05v8o5dJxoJ
         sQs8wUQtRKt9cyN4e6YxPTJYHpWZ79ZS24KBeMvPrEr6HFSzCyLK6fSyvM+DWX8gcyNF
         y6u2jDhqSzre5UeDZJRmFVKOrq3JTyDbrF/lSlYwWv45GuDa5pXagU5TZIzl5p2uLoxg
         JbGZ0jGyoIkA+tcb/XXkRF0X/XhNqIAxVR6GLOTW6xjrq3QXcfBYNy5u6kHGmft0s9cs
         +CYw==
X-Forwarded-Encrypted: i=1; AJvYcCXsnqCo/RDSr6hYs8vowaPY/8mZfVhy8zGg9L/QyICaLwBOpdrgyB3Ec/cxQyOKKUX6tVLKTYGODjbjuvslwryF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+fPPyI/e8KEBZie7vtlu3oRC5yA2lMbXETLBmbQDpBApXSQ1H
	iT5435maomnakW5N20DLMjGv7HiIwTwFJLRkTrOopdROa5CTbGPdC2q6fZX94gkUre4=
X-Gm-Gg: AZuq6aJBM9Sn7E8Q/JJ72Y2MQ0ExzOO0/BkJ8QijRhoUjLHxDqh5/XBJzFwwuu/xLSv
	pcS8VC1tqWJNgGS/+z23xetVgCHNuNC8s3X18FmLWRKETnN1ZJjB3vL/a5Xbf0eP4P7KmUSBkvn
	YRPi7/zuSYrcLMN3ToFa+Tp8jJ13VxQpbs+Lyh5FlseVO+kVaolaoao5XdbKcpJfL9fNR/J9jrF
	ZXfG5ZJBZImaQC8pOIu8ZA31je0zeQLtHkCSWu5VIcj0iFxBhC9SoNplLRU4r3agHY3xK0pvwDL
	QeadNHhj3WBjVI8RJWIw+B2beyQ+LA4e1QGPWOk2HKL5XEiIgotfL39Drc68r/VFAxE1n0YVfIr
	jGSs2XXgnIM2/qKWFE2/Use1yZgn1/bDDiYt8TG7Y+cqaqR045a+UN1JiLzMLB+k2/HmU8phDM2
	OFjrqvOcEb7BgBUzWgNitvfmL4pBPBhBjA
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr338907725e9.20.1771502371842;
        Thu, 19 Feb 2026 03:59:31 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31bac27sm267185e9.5.2026.02.19.03.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:59:31 -0800 (PST)
Message-ID: <cdfa7ca0-2c7b-42ef-ab79-4c63d4c10c35@linaro.org>
Date: Thu, 19 Feb 2026 13:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: exynos-acpm: Count number of commands in
 acpm_xfer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
 <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_035934_567020_40F9D974 
X-CRM114-Status: GOOD (  11.15  )
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



On 2/19/26 1:27 PM, Krzysztof Kozlowski wrote:
> Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
> counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
> so could mean length of the buffer or length of commands, and these are
> not the same since each command is u32.  Rename these to rxcnt and
> txcnt, and change their usage to count the number of commands in each
> buffer.
> 
> This will have a benefit of allowing to use __counted_by_ptr later.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thank you!

