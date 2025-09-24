Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3BBCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+usTMPvcBS+3F2kmC2jWwWdmQ/MvLFJZfEjIRR/pByY=; b=TVGi3hThnTQwKfoH5yNbSuHzDp
	GNuqdb8wATCCUffjClk5MaR+XL/8jXgxR8toz5NSiXf6qBxEt5dQUE/G/fXssfA3PRe8zgJW+WHEs
	Es8aPjaiawSBELrPZz2VJv8+woG8pM1P0p4XnnN7IwSUVvqH9eVf3FXtB3f6hBvh6J0aDBGC2L0eZ
	focWXbMe+thLFfWVCJ4G+3q7noSvZJjETOpdoHHp5ccUMP+zm8pyCkYGgzmIZphBjtugVmHAn3jgl
	Hfn4x4uPl8zFJ+c+CxMw/JAu/0pEU0L0IFkyVTUcF9mWIKy6JL8qYuSE/F5XmNnza90F+174nXIcx
	ZQwNq/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S3W-00000001ZxM-0Ct4;
	Wed, 24 Sep 2025 16:09:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S3T-00000001ZwA-1JWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:09:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-24457f581aeso69293625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758730158; x=1759334958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+usTMPvcBS+3F2kmC2jWwWdmQ/MvLFJZfEjIRR/pByY=;
        b=lUzG67kn2KcZpBHOCsFZrMgwLg97SNE69avvkwjieIuxO+48dsE5MQJTHJmAtQjQaV
         IbX7XqZzUQ/K1PGAUqacbZ5x6mvyuF8VaVzyNKPj6ubvvIOpCS/Iy9IaMhqCtM3dHeXg
         ZKjzacXfVYnQya8Q76eNaPohQwGQSOfqaXNvIR1YKDvSCJjckDVBTQxBRMCjKm2x4+4J
         LORBGszagYQ6yiq00fJqFn8UcRYM4+/BwClhMn7/wZMfSWtuHxVdMp9VDWAKEZ0xBUaZ
         F5LwMqkPGROY2/eyo9Zljf1qm968j7kSpNW/v78nOJxe/6lXDFG093VN1Gw9UrxWLpoc
         igTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758730158; x=1759334958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+usTMPvcBS+3F2kmC2jWwWdmQ/MvLFJZfEjIRR/pByY=;
        b=iseFksQSZwGjfd85z5F1MQxbQd/QHSqcqC8lqv8V+3Er4Ggij0vmlABe5XYikZqLnq
         G4+vR/UioEZqR0fCzQoAL3+VIbb9FaTSuBlK7HpcgPulSP3cnAFPJ6auo9ahvC2epmmO
         b8uGeg2eR1vNwo4H+o3y2NeYbxE8XbNrnhz2b4pdQlWirgvBmpt/np5/yxuEXu/0atAz
         1jIXGw8xGaoc7bt/QiDtTNAPKHWkE1aTccK+jK2D6OGsegWUgin94JtCn+NPzb7uSnfa
         cs25UkjU5E1VNx+xccpP+oZAfDgIdshqpbjmjR4oz/cqXj4T7eUWXWD/L4zEVzvPzE6i
         dj7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjbFfxw9Ct0Rkwx4VTuwCVIWCI9x6pJcYJ8zzaDGraE/z6D3v3n4AVESNdZuujFwGuJOyN12WQAg8yaqAW0YIk@lists.infradead.org
X-Gm-Message-State: AOJu0YxBvuARFFqIJyB++T5jmxXkGF2ZzY/R/X3rQlfuX0rVGZTZN4kT
	VQQks8CdBIXP/K7qNgSf0soFFA7FR8NqZ/MVESz4bW2W0sR3nW7zogIl
X-Gm-Gg: ASbGncscRt5Wy28xnjWwUNRDtowJwB9wDfveSXvEQXDUtZukQUfpRJoW7WyDYkN0ePN
	HJMAM0sfMvMMS3KfH0L2c2tCpLLworTo5FoN1OkfLnKBEa2KA/TdtkO+6G/bvPw9JlQY/j1tvv2
	RsJq5gWZ+AA6k6W0gEVVIPhMC4yBVUlVHrV5GbYw/8kyoCTlpOiJGDokRNaZEN8Sc3mM9fG++55
	GyBSrZ4PcpuhKjMwZJmyE2sYpoxKwp/zn3sr6DG1o1b/LICwEoRQdHN9ksPkFaHyRW1YUGon3fm
	9rYL3w+LOvoZpFfJq1OEKZNPmCI2x2yIdb1wjAMQNLbYRQlVe60ykIVmga+SxoDDF8rWmCGZBGX
	sQQGGmsrKX0s8j3hwDIQaP0hboefHXGtw1isqKxk4gNzDWeh/IRhYibtebX5gVJDR3Ogx96g=
X-Google-Smtp-Source: AGHT+IEu1lK8GaOEiyMPSa9aO0Q3vWTMYyoVO4wHtfzmqAy4AMG5EAMA7E/lewYrYvHnzkt4cSCJQA==
X-Received: by 2002:a17:902:e749:b0:266:9c1a:6def with SMTP id d9443c01a7336-27ed4956a74mr3204115ad.0.1758730158351;
        Wed, 24 Sep 2025 09:09:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de57csm196369555ad.66.2025.09.24.09.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 09:09:17 -0700 (PDT)
Message-ID: <778ccdfe-791c-4d67-a7f5-354ea84159dc@roeck-us.net>
Date: Wed, 24 Sep 2025 09:09:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250919184025.15416-1-will@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250919184025.15416-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_090919_366681_01FD6501 
X-CRM114-Status: GOOD (  24.24  )
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

On 9/19/25 11:40, Will Deacon wrote:
> Big-endian arm64 configurations are vanishingly rare, yet we still claim
> to support them in Linux despite very limited testing or visible
> interest. Supporting big-endian adds unnecessary burden to reviewers and
> contributors which, without any known active users, is hard to justify.
> For example, recent work to improve our futex routines and to implement
> nested virtualisation support is non-trivially complicated by having to
> support both big- and little-endianness.
> 
> Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
> machines in their telecommunication products but I don't know whether
> that's still the case and certainly haven't seen any patch contributions
> to help support or maintain it.
> 
> Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> towards its removal.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171cd4@huawei.com/ [1]
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> Cc'ing Guenter as a heads-up in case he needs to turn down his testing
> to avoid this causing a false regression report.

Cool, one more architecture to drop. I wonder if I should drop arm64 big endian testing
for all kernel releases. That would simplify my test infrastructure substantially,
and it would avoid useless regressions due to bitrot for older kernel releases
if no one is using it anyway. Thoughts ?

Thanks,
Guenter

> 
> Cc'ing Hanjun and Jonathan for clarity on the telecommunication
> situation.
> 
>   arch/arm64/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..5ac670d41604 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1493,7 +1493,7 @@ choice
>   config CPU_BIG_ENDIAN
>   	bool "Build big-endian kernel"
>   	# https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5308da1161c
> -	depends on AS_IS_GNU || AS_VERSION >= 150000
> +	depends on (AS_IS_GNU || AS_VERSION >= 150000) && BROKEN
>   	help
>   	  Say Y if you plan on running a kernel with a big-endian userspace.
>   


