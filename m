Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7394C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vKA4/E3v7W7bFn4qyJsED7Lacs/12A597rqBVPmfww=; b=EerVXsphOXNK4TI08sKmr5mGo9
	ALMRaDtLVv05bkIFov9jldvgSyHwBFOfU5mi+oXPseEyG+0SVy3o/aDaBpWrxZy27lgzL9/sLSfaz
	M/i5ac9C3b0ux3P5cK9jeiRQ8+4gAAKgBOzWhNq/vh6jyKd37QyvefsEMQEQxrzeM7D7Kv5zKnsD0
	641TrWwsvh5bOtfjXzQx2z7PSE9dHQ/HXbW2kiv74AfHN9b8IvVXVcDKDuktcsifFB6Ao/8Nc1uhY
	iB1hkWw98pFo0Cdv9kthKglWKPolBdoqUgCdWFvaR+i9MAVABjKo5Ze9t94Hq7i8Ce1QBIajIhNkT
	uDLhM/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62f-00000004Nhy-0VCa;
	Fri, 10 Jul 2026 07:53:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62Y-00000004Nbh-2Dlg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-381507c9380so493605a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 00:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669973; x=1784274773; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1vKA4/E3v7W7bFn4qyJsED7Lacs/12A597rqBVPmfww=;
        b=DycoAXWYHiHP8CQ42AEtoQ++rQNdcZuSv0JsdOSm+3pdb3F212g8GqbwzaJazDNtEn
         1qLJGzXbUC2vWGiLGwiRFdnh2w0tUo8geOrnrfPw4LTkSKAOhbF8A0dESGHmj/5w3DNS
         Q0pzlTzBmK20RXXQN9XzchrBonL+aSx415f6RAQh9atrJEhPBlPSlS/HKdP6M56cVNIb
         6MJl6jkxj5LOBcpBRg0PeVCLtzVTJD3dCKQrm7I7fefRryOgN/jFRx8T6eIv0AiUlYqO
         cHzZqn+Z7zfF+GMUlULHvUkRH8wbLQvh4BGx89UEbHaJR+KgU5H6k8rtjdmHVkFou5dy
         KH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669973; x=1784274773;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vKA4/E3v7W7bFn4qyJsED7Lacs/12A597rqBVPmfww=;
        b=VviAKBkyG24rCP4CmAU9h3eEs1LJGu1pg9zOCGdBH7GG8wlpBoBdPEe61zTAvWH0qC
         TZe4R6Vh8Uxy+QZFlLHpR4N7sLR1PUv7JriqszAoL0qSbKVWCguTKUSgjgwzLMj1UYR+
         ZLvwsPyaxqS3wpxiIYCaW5vWNkOZiKJlfomkVEJcpyhbLJ/4O2dsIce83S927jDrTsih
         kRvXKMNX1ayZajapOxkw536YmBkcoqzI7yceWJI7BWKwQUA2tsflKKxjMpmBDhNY0I0S
         5DL8XxvwnzglsOE5KGUUm17WZ0HIs4cGNVGHd6uqp9caYGoe11gP/erXMqenBIL3kpQT
         gNSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaVnBTMFU7mcPYZuMdtQJNH9MgnN1YeQl+0PuiAIfGxkffYa90o62j0g+A6xnFZa3hEzB5n5fTw9ubVRl1sdU+@lists.infradead.org
X-Gm-Message-State: AOJu0YynTvumDYadtT2vvyEXrWBK1DZiCbui658dHsMnaSnfngTa62Jx
	pdtZyFQ7wOsleqch/3V1yTd/LLYLAWQ/ofo4wOInTedWjziE3NsHm9xD
X-Gm-Gg: AfdE7ckjROIMvXijmQicpePm6EvrDhk7TMCAz/AESWd+lU/8GB0YbJNpJWVFRIs4DP6
	dXsLuPJZSz9NIFe78nXSaMFqdVOAGzPX1zOKWHH5rHtbKkxaYfGFnJ/pDTwrZVHtmf0fB9Ai7jX
	imJ092qwNr1jQkbt7biE7VVKYcJzq/zdN/LRuP2L2hgjj3uHopPtv6ecXSf0j8w/fJ7orvwIXXp
	R3kFumNROjNWTEiv989BUov/bPWXpWbWsvPN0NW75Uar6h9qjxlbEPAS4rCREDp9rGw95Tq4sU7
	JSuTE4qVnbvDmqWyh6Iu8x4WfaouFRPJuNCiVzw31JBw1nWCZaV3tq/tDvrZAo0tXXYblQY3gF0
	0HjMYsiCzM0OjVTlmiL0d3V9K50q6KvEAGKo/PX7edUadeix75u+eaTmlOXuUwj+hfGn0GTF1ne
	R0cQA1RjgQoDXRVhH+qBuKfrOFKFZrPY/4B8Nk3/nR
X-Received: by 2002:a17:90b:4a0a:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-3893d530961mr9707655a91.0.1783669973502;
        Fri, 10 Jul 2026 00:52:53 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:52 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 8/8] futex: Use runtime constants for __futex_hash()
 hot path
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Thomas Huth <thuth@redhat.com>, Sean Christopherson <seanjc@google.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>
In-Reply-To: <20260630045531.3939-9-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995932.1208691.13530053283560063106.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=632;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=Ag5hF8rTf0X6/MPKP15IB3NYCgooifLcPCObkTtH1N0=;
 b=XRTUMqEADW+KZk3nC8Ii+QzcGXzNTGq2bntuuyEk/nB+Q7Rjvlcqlgu4/3V3dHA5sGTlOTVXe
 qfXYMGUnVW7DGepiw3HKFoSXdft6CODFk3hsmUjcgJE6PD6p4836N0A
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005254_662723_DD49D476 
X-CRM114-Status: UNSURE (   9.69  )
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

On Tue, 30 Jun 2026 04:55:31 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Runtime constify the read-only after init data  __futex_shift(shift_32),
> __futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
> hot path to avoid referencing global variable.
> 
> This also allows __futex_queues to be allocated dynamically to
> "nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
> (1 << CONFIG_NODES_SHIFT) worth of slots upfront.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


