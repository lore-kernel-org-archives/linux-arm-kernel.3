Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C02E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDnS8QQfts8PNiRxxgrPusASUBk1U9XVmydpKZ+IB84=; b=MCKN6L0E6DnBLkE/c6kwqDUwXZ
	PEYQYYGVK8XJ4WTLI18Ipmi+0LxGtKJBTzUg7mv74jeSm39f+lmbzVDbX3aiJY4uxSeIEiRf6QZe9
	gaAWaZNtU9XMCUnOFBjI/ngxdw6J85A2CbaeFpk26yPx4y3k7kysDl0vpXWp84aCn//Py6hhikjxt
	v7QzPT0N6Et7mFKLU4X/wjhKJ38LB/4y+xBjXk/u/WkW+b7Dog09noB9sBGExJtsFeINQB/P770uU
	r49Oh4pqnW0FOtE+HNMT8YwCD5wHqpFvEwjQZmlcxdc33O1HXNIm6SHm6h5zSnexsyFHYhWc6pXRa
	XU7qYcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPKjQ-00000008F4Y-0iep;
	Sun, 22 Dec 2024 12:06:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPKiE-00000008Ez8-2jPo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 12:05:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21636268e43so38180175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734869133; x=1735473933; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDnS8QQfts8PNiRxxgrPusASUBk1U9XVmydpKZ+IB84=;
        b=ROWjE+eAwuE7/skjuQ8kh+Nl3fMcoDDbTw54Kr5owqXq9JglPCRqBZtIadmFIeNwJu
         FsRFpa2Kw6VdMCitcuI5pjMfVHOkbPQIeE66cNgN9oSIzSngqKdbcgZ7/y0w4I42+Hs0
         AIKSizh6k64DdbMreYrOP2D1Ak9DrOtKnCOt+AieklQ+p5cpy2BYZonov+lIK/XmjZJC
         OfJXOCgCj6Uj89PbbaNQ1TxdViBbHc/uoUAOBC+pIJ/DN6GWdzuHVO4j5cSABFsuDzep
         YvNc/QYlgT5G7atdX6Yqdx/zmYL1i7KxnITW5uVV84+zo5gROQ/qTM1q4NFF+MtE93aj
         MrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734869133; x=1735473933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDnS8QQfts8PNiRxxgrPusASUBk1U9XVmydpKZ+IB84=;
        b=OG+41nJROD1SlKRWYEq0a6wNaXOjMVKre/zhGarp2+pcG4a27HpfpIcvRG0VI4g6XM
         8e/nJmUDSv4zyrF8wmUASuOhh/VXjApD96L7w1VICnfNx9dZzS7CipDR39Uf+JkJizpm
         FgKDvrqsJOU7O1Y+b73qLOSdIJcjztUftXjt1xIiUyk9WYNVOPk41mldMqaLrl3y/upR
         Ut6BMAsv2hcZxyPyrbe8mIwCHm0MQr2xot1yUNzF+RXHzHe0oP+J+ch/apgpxf+alDAl
         5fHz9UOXhSckAN1mYLU7c3FOkjPIYlVPkxGRh3NJra0S4A4B/BHG4AbeJ0PM2bzzKkwn
         giFw==
X-Forwarded-Encrypted: i=1; AJvYcCVNoQUV+PZ6SiZVcTiEM6FOzK14iwp/eNwiNSbKNEnBgz3JQbtBPt1KjMoPRk19dr+ZYkSdqFR+x3g5vOeLg+6h@lists.infradead.org
X-Gm-Message-State: AOJu0YwKjJlHcXoULIxq5ZLOSkGhxbxA7FvkOL6nN4XH5Zru4Fo180e+
	BA6o1whH7ujU1yK0tg3xUO/fCKXT/71Gnxtk9fLNWcm6H7zjNjZD
X-Gm-Gg: ASbGncuwesfoH3HNxT8wjao0de8WUKkaV5ysiGovyZDG4MrhT3u6i263+hR1fCbRddc
	PaiQAoEu8HhSl8dmOT7EdyDILtwMsUGvLbTfCR2eXgoF94KyFOCOeUEomN3fWqP86H7hq1CbsaY
	/3/N7Jj5Sv38GtNO63sVtEZkOZrFRUs6PcYVxkXSYLtIiJv2J/MLnXZdo4406SIheNmgqrVrSX0
	YgKLW6TcKe4yxzfCEDYJbZkiHzUDD2x+Y2sb5ZETXCrLPTBM2jP519uG0O3J16a
X-Google-Smtp-Source: AGHT+IEOZVxAStgALtxwinLC8Odtu5ORiNvC9dCI78Mv1+c6vIuwDTv9FbdrmlFh0HXJYmlMCFWMnw==
X-Received: by 2002:a17:902:d4c4:b0:211:ce91:63ea with SMTP id d9443c01a7336-219e6ea1accmr99240495ad.15.1734869133310;
        Sun, 22 Dec 2024 04:05:33 -0800 (PST)
Received: from [192.168.0.109] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9716b3sm56358175ad.90.2024.12.22.04.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 04:05:32 -0800 (PST)
Message-ID: <bf93c563-f331-43c0-a145-1abf143bd0eb@gmail.com>
Date: Sun, 22 Dec 2024 20:05:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
Content-Language: en-MW
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kees Cook <keescook@chromium.org>, Quentin Perret <qperret@google.com>,
 asahi@lists.linux.dev
References: <20241212081841.2168124-8-ardb+git@google.com>
 <20241212081841.2168124-14-ardb+git@google.com>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241212081841.2168124-14-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_040534_700448_52D8EF80 
X-CRM114-Status: GOOD (  12.14  )
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

Hi Ard,

On 12/12/2024 16:18, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the maximum supported physical address space can be
> configured as either 48 bits or 52 bits. The only remaining difference
> between these in practice is that the former omits the masking and
> shifting required to construct TTBR and PTE values, which carry bits #48
> and higher disjoint from the rest of the physical address.
> 
> The overhead of performing these additional calculations is negligible,
> and so there is little reason to retain support for two different
> configurations, and we can simply support whatever the hardware
> supports.

I am seeing a boot failure on Apple iPad 7 which uses 
CONFIG_ARM64_16K=y after this change in linux-next as commit
32d053d6f5e9, with nothing appearing on serial console with
earlycon enabled unless I set CONFIG_ARM64_VA_BITS_52=y. Reverting
this patch makes the kernel work again.

Nick Chan


