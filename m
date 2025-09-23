Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F032CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNLcs7fdWejswZNdc+JfM6KW7JmH/hH5F4bOloYrJiA=; b=ncyW54l+do029mtktdqRhWh2qu
	qxngXRrDWh/xNhz/gUVnsWTNL1mvR3lAnEkh/qAoNZxTjLfMp+lCH036RJheioM6uZtLoT3rBnrDl
	6E6EukW1nwneWw4VeiqGs+vjK+8WqzEABpui762b2x+ZVksSevfJJnO0LHCJSK6YpxuBacMEjJIOy
	F462uHABE5oSybdc+DLqjERFNjLZbVpsR9hSN2nt53PDqA4QO6XwwOGoFZgIs9XsxtffW8BsUA9a2
	XBBK7Kun+3S9uCyn38GpFWOctzFW5JP0cR/I7J+EfEc87FMXhQEhKDjDGtruFaVpZmiSGoyTSnaXT
	L2PPv+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14zB-0000000E3wl-1Hck;
	Tue, 23 Sep 2025 15:31:21 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14z8-0000000E3vd-25Im
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 15:31:19 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b47174b335bso906535a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758641477; x=1759246277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNLcs7fdWejswZNdc+JfM6KW7JmH/hH5F4bOloYrJiA=;
        b=FrVyA8kPuyfqg0GVQt7N+6YjXuKOT3hT0cPdq1lSUuTcDkeKt+eWwueISrrSco3clK
         QRaZfA5kvayJQQumTXZCQ9FAK3wY8pOOVxyr5p6gBgXRKJQ6aQKfFlQVrf3Xczjvn7Pu
         Gfs6H2wYtG0dDSuMIrvPz0HA3HSXkMn+CQfyfETL3qojqroiFj3za/xcE++pjA3eD+r3
         o4A5VUMlvXi7qFaqTJ//jerbhYaisMb2vCLfxr+Keb+P+VM1UP93eKhIg5AWgEztzXY/
         YfJuM9lKaWX87SkEK/oj2Uj7RkMlux8wplv+wYlY9cPWBdIYLyaA6SSE5kV5S4bdGuRa
         /Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758641477; x=1759246277;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNLcs7fdWejswZNdc+JfM6KW7JmH/hH5F4bOloYrJiA=;
        b=vJSf4H/GgyWIW4dZW8v4m0ycemx4WNDoMwWdEONWf+yAt1KaCcH2JJiptP+bHNW/Og
         MB7yhY4V1hTcbfNUJNmVyDLLx7WKu5n/96kBOA8w1czDHhn5p2XIrRYMvFvnsZCrm40z
         h7WnomvJ2Bph12U+j+wJ656U//47sdOIcXKl12Z3HfNXrkYw87muW9FH4NaZMWQ+7sPZ
         rFqIRs3DwnjU77mBDrBhJn4I8lIYWY1uvsDVwb/YrGLmzkTCcJWXcDeyXo6lhZqVdwze
         6y6u6uikXdmRDZzAPjv7WNMVIwF5mSK9VTM4BcRUVcjF/wFok5DfMk2jEwEcblrxGav9
         0Uvg==
X-Forwarded-Encrypted: i=1; AJvYcCWVWVusGJKZ2vSVxU/pEJ0RokEf9bXv3t77F9/AeA3PBzE/8ZK038iGMbpGwd4aewnpiW+RP0J+mu0fx4llcT4A@lists.infradead.org
X-Gm-Message-State: AOJu0YwSCnV2vNLyECPUIkRMH/BuGfseykcwfD7EQjOz+Eim4UhpjvbU
	tVUI6byjJc3wwB2jVbMB0NI17sRK8k6+bfb30CLfyF5VB3ixNMpcxr0m
X-Gm-Gg: ASbGncuZjSFtDkSQL8WirYfKIJyFT3vLMKVUhhWT20bJfUJKkzvd+BF4yoJOosEzKAG
	GHIDEpFYxvcaE1PNN5/9a7190X7u0PTWMy74bo9SvTDz3wc201oA9+Q/DsriYUpKT5wb8mQ8eUv
	OvMR0bvfpyDY/SmuqAN7KWdnIYLxXBOqsavEIZJxJmWda3zQGROp+Cr62X1XuouM7TSZK4NKBff
	H23KeABJGwHyfzt4JXsSmMpxatERU/LLI3/Hhy7EVCQzWasvx8orbAGnz1+4SCikZVG1hOGk0jH
	xFjVWunYUd8I7LzWSxTxWIHFIGKpxLxxTFFWI4MI7guqBXl8OB5eAQonBZtbI+xOx7NkNVRytAO
	oXWu2JjxuGFN6Kt0X17vWuC6Zc6mpMNgmYm0V32o6oBQ=
X-Google-Smtp-Source: AGHT+IFVwvkqLqFecgrYavx9doA33g4ZZ170zFjha/TN20N6du4T6T1t6fuah/m0F6ri5mfdp1LgzQ==
X-Received: by 2002:a05:6a00:3904:b0:775:fab1:18e3 with SMTP id d2e1a72fcca58-77f537a53cbmr2275577b3a.1.1758641477231;
        Tue, 23 Sep 2025 08:31:17 -0700 (PDT)
Received: from [192.168.0.100] ([27.38.181.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f34d09cdcsm6678378b3a.88.2025.09.23.08.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 08:31:16 -0700 (PDT)
Message-ID: <c8972579-c589-4016-98cf-52a0837d0739@gmail.com>
Date: Tue, 23 Sep 2025 23:31:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, mark.rutland@arm.com, catalin.marinas@arm.com,
 maz@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com, baohua@kernel.org, jonathan.cameron@huawei.com,
 shameerali.kolothum.thodi@huawei.com, prime.zeng@hisilicon.com,
 xuwei5@huawei.com, yangyicong@hisilicon.com, linuxarm@huawei.com,
 Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH RFC 2/2] arm64: atomics: add optimization support for
 implementations using near atomics
To: Will Deacon <will@kernel.org>
References: <20250919091747.3702-1-yangyicong@huawei.com>
 <20250919091747.3702-3-yangyicong@huawei.com>
 <aNJwoSZiZLNeTKOJ@willie-the-truck>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <aNJwoSZiZLNeTKOJ@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_083118_557254_131E5A04 
X-CRM114-Status: GOOD (  13.45  )
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

On 2025/9/23 18:04, Will Deacon wrote:
> On Fri, Sep 19, 2025 at 05:17:47PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Atomic operations can be implemented in the CPU (near atomics) or
>> in the interconnect or at the Subordinate holding the data (far
>> atomics) [1]. The former one can be further optimized by prefetching
>> the destination prior to the atomic operations, similar to the
>> optimization for LL/SC operations mentioned in
>> commit 0ea366f5e1b6 ("arm64: atomics: prefetch the destination word for write prior to stxr")
> Sorry, but I'm strongly against this. The CPU needs to do better if
> the system is configured for near atomics.

got it, then let's leave it to the CPU/hardware guys :) thanks for sharing the opinion.

thanks.


