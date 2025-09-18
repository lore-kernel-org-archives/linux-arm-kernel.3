Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9216CCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZUVA/eN8y4jUWH55g8+vAZUWm6iD5IWuaZ9B1DTE0Y=; b=HUlIM8V2hj0MS8FwQmz802wx1P
	hnOHd+DYOcKqiY9qEQ5/hC1CrHy93XXOw4N0uxnW9idYnjV4GE4+UDD4P0yUnLHaDwNg/4BKTi9Sn
	gfg/11O6GXqEMzRR6Uhs3eLxIY7RZ7c7FgbcK29+Il8E4T+NA2POlFL0F6i90qRQz+9HpDjMcq2h4
	qw31REjQSJOiflJ023fqNaAqBcBtWifde0awb3WH0ZJZn3KtzUQ6oq6+Y5B8cJTfDq0N/0BLuJobt
	5Rkd48RuGodgs1BEzvN2XpUbVl8TxyzHSrmh17bQ9XL5goWyEN7+2mhZ8rs/xiG4hWQpCxed13/zR
	+8CwK67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFvD-00000000CGB-1RqS;
	Thu, 18 Sep 2025 14:47:43 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFvA-00000000CFC-2VIr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:47:42 +0000
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-352c93684aeso365321fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758206858; x=1758811658; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZUVA/eN8y4jUWH55g8+vAZUWm6iD5IWuaZ9B1DTE0Y=;
        b=FHNLr1ogfWFiw7tUA4cyIehm4XHhuNnsS+7v1IMgM7ftI1kYuRndYxX5ScXs64g6CN
         3eTt/A7CuYb6aQPqOQjasxIZQ7Q+VSXFVfM0uorfhJA5YwIky9PhE0a44mc+jWU0xkQA
         V6jYXDeG4Fcz1OYf2VZpPRfgIAwCNepPMpKvFzWHfADXCzz675hSUSnV+ZYi4vCRhUP0
         rt2JuTj25BQKdHRYARLrjpIAnpKKawQmgyWCpG8oKnryMrdTRoxT7cNlDbMnnt3dyA8n
         5e6GL7A38P9+uvliUKVOSm6cg9YJ93eQNUeDC7qnxL6mtixFPMyviQo5vLZQUeNPZvm4
         W/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206858; x=1758811658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZUVA/eN8y4jUWH55g8+vAZUWm6iD5IWuaZ9B1DTE0Y=;
        b=Zz0sBRoOdfwQIQdam8/koKUUd76Py2XyOmlOT/cBz4bletkVaSA8GSEldKcz8yF0Ev
         KqPHx0hvalZ2NrL0VmIKgGTLbhnrUfSUH0231F9Ps+e3frOGDvQnJFN8+tHVvZEsyedp
         aQ02dZGbyTjuiu53y6srVhcJ6XLIG0kFpouPKhZ8GIpI1OYyxb2SpjxUdFHAOJjm6Pb3
         pPjisQIe9DnmJm+RjT0LXgf09YdeRdKuhRrxjXnFrG6l1ecU1wI34iNE5BBgmNpmTvpI
         IVODlwO4OO1dPMJ5kxihw+pogjUMHpZ0eoJQ84LbEnwAIy4E+ddjEdEmeToDYNdlqXrB
         S6MA==
X-Forwarded-Encrypted: i=1; AJvYcCV6qjRrX1JUl6oxdm7/y0kKJlM2hYNlERuL7PgzSMef+pENJiAxzzA1wsA2m1XQZmdLo5X6WQKtxg9amSXdzkvI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9dCxj2GpKBuhLxN/hgME/1JQqhiJkHy8NbIGpk4J8jCplHMZD
	SDc0k87vamVvYs5O1XossZe8487wUBIISG9qlVsapqbUafUdkoitzbXR
X-Gm-Gg: ASbGnctUdv/OofUTqCL0exYjQMnHFozM7c0XM0lGfO2/L5L5n1fY+hasqMpbI6sVU+r
	xEg0NqKSrL60GOAxsRJFlT5OsFkLXm0LpmLTX4oE1hCrDN4IPhrLP9uZ0R53/bFfSRdIOvFnspO
	SF/Op4YlmrUgH9W4U2imHUWqCdZqe6x8A6c8WQfb8FnI8TKwsdImjuz+2td9QjkM88Shzn0oeB0
	5BMspjrgC31+FosdWk/9YJ3a/YP0gMGsRdghNy5y8EsCgS++/T4ZD2dasuB/hvrmS9DQqVge6Gd
	u7Tf98tehVdRJOJkNC7CGjOeW2Yy6+CrkvLBS52Wu5ErDoRvqe7RIlOBrz0pzbTNaPHXDbHtXqA
	GFQ4c9XiC+dP88WVPZFwHgguiGrjBWa9eP218t+myy2GbMMk=
X-Google-Smtp-Source: AGHT+IHtJnmg7xLHWlbfBgfrch0goPM4i92u7CS5SbTFZ6QT2H9sZ6KAdWepbZ79ubW13IVKUYf9fw==
X-Received: by 2002:a2e:b8c5:0:b0:336:7747:72e with SMTP id 38308e7fff4ca-35f66df191emr9476411fa.3.1758206857314;
        Thu, 18 Sep 2025 07:47:37 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a2f7ebcesm6234871fa.29.2025.09.18.07.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:47:36 -0700 (PDT)
Message-ID: <dcd0c9be-5a52-480e-8447-ebb0a028edec@gmail.com>
Date: Thu, 18 Sep 2025 16:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] kasan/hw-tags: introduce kasan.write_only option
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, scott@os.amperecomputing.com,
 jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org,
 kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org,
 oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
 yang@os.amperecomputing.com
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
References: <20250916222755.466009-1-yeoreum.yun@arm.com>
 <20250916222755.466009-2-yeoreum.yun@arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250916222755.466009-2-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_074740_645389_F9311D31 
X-CRM114-Status: GOOD (  12.93  )
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



On 9/17/25 12:27 AM, Yeoreum Yun wrote:
> Since Armv8.9, FEATURE_MTE_STORE_ONLY feature is introduced to restrict
> raise of tag check fault on store operation only.
> Introduce KASAN write only mode based on this feature.
> 
> KASAN write only mode restricts KASAN checks operation for write only and
> omits the checks for fetch/read operations when accessing memory.
> So it might be used not only debugging enviroment but also normal
> enviroment to check memory safty.
> 
> This features can be controlled with "kasan.write_only" arguments.
> When "kasan.write_only=on", KASAN checks write operation only otherwise
> KASAN checks all operations.
> 
> This changes the MTE_STORE_ONLY feature as BOOT_CPU_FEATURE like
> ARM64_MTE_ASYMM so that makes it initialise in kasan_init_hw_tags()
> with other function together.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

