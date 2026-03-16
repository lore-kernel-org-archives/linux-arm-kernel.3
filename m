Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AE1FB5E8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 23:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrJSvnP5t2ZAkb3zCRgf6mgahxyGJGt35l4bNQI7QjY=; b=1V7439pnI5sbZwQEu46REJPAjj
	T0w0fqfO+EoRm9hXXQDtH0A4seMx3nmFx+ljZ5Pg6hGrgjvm8/7eVo/KnVlStGqdirkobChHzCTXn
	4RmAeZ1mTD3rg4yGkCix5wy7DlHw8Oc9A2gBV42cYnvjktRMcL4cBoVweU5aiSHDoM0bcWl1yH63K
	yyVIJWvG8LMsbBaBuZ+IFIHzxGWogDFdN0H9nl+18yZTrOmcf05McuTNhfU6WeN73VWDB88NLfOoK
	zCkhkv3OQt+K6Q7ZX+R/XkNfGNMj7HYhJXWnUtxuv/Hp/WC0pRxjJvhsnJyQ4ty5y7RoHeLRuOajk
	2PzQEMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2HUu-0000000553y-1eaK;
	Mon, 16 Mar 2026 23:37:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2HUs-0000000553c-0ku2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 23:37:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-485345e1013so1322325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 16:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773704235; x=1774309035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrJSvnP5t2ZAkb3zCRgf6mgahxyGJGt35l4bNQI7QjY=;
        b=i5ilsMY4VtJ5RqCTlblNpn/9q6TTL/fQld+xEdofzqsP9RJfnX0yATajo0TQrl9Tcz
         WmLLhd4M0/5gixF0ghUCX1PrWHAzSYfypMhFHJft+YvSYII8UwbvW+9/2bW2vaJCH1WO
         tDsxZVQhamwPELFXQ7cPvh3rhSmYAz2Gs2vu7fGS1lOTj1PA06pCG2k7Kcn2g2mDj359
         /ginnpVIRObAAjt9KWQGir9Gj7dLbO3s35haswC+0aLx1dEsoLb0W8/sKnZwthxYTMUs
         JWY6I+RO7DCNN25C6unpbzSj1B01Wk224xmaHrZ/+VPyuc+Ib8Pq1D3kmQ2Hz1ZPKYhL
         CjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773704235; x=1774309035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrJSvnP5t2ZAkb3zCRgf6mgahxyGJGt35l4bNQI7QjY=;
        b=hip0bZAKnfmbG1D4ny7uTsHB6g+8oqMVimwRIiXVNj7ie5ideZZNh2FVmHSTaiZ4u/
         YXSLPuc2rPUQpWHYpowQFZmev7kOQtSekI1pYpGIxT62NWLs72m86HAWNk9rWHwlbFRq
         NSkxQ/uktrZ9DNRjoJpRgtDDroioKIdgVPtADDRVnZEL1yeop0hAcDQ56ayScUILJo8J
         uGrm6ZUg00zffl7BrtBXmcmb6zWYmIkmBfmGyE65BApx+1YJepwE1KEB7pPkVOHkeKlP
         q4e31ftiN93iCeM2Lqd+iywcABHvYbecO185TWevAdohIV72XT5lHNR2rMnNPebLJluu
         rd6g==
X-Forwarded-Encrypted: i=1; AJvYcCWY1W1pdQzowsOxQJT6AhWg+3QLNVi8Lt4G4u2bn8tdlLQuFFqM9vxrgn2GlJjvbEwZSXlIIVdvYfg5kweD0AoT@lists.infradead.org
X-Gm-Message-State: AOJu0YzSeSAIcNxYxQP9TntoLFZFVMiOsxmr3xWCq+uCnwdxx2UqKn9J
	tTBlBPBVIN+I5EMOx74OC3Hrc+NRsL4Ucn66RdK4xfsijrq1ntkzxdtd
X-Gm-Gg: ATEYQzxOBWnV5ugu/HP/mhVTLyzNdDeBKcK2sDtJOYRBRTLIu5Q8YoJOiw5Rfcadayr
	uJpjLoU7qshPhReN69Jw8DMWSQbgk19GOAEMaKgKkUfjs5xtPrNUaPAkiwO7eJ8ZrGf80qU7sNA
	d6EgdthMPswCLS61b9MQUj8ESxTt3ty3pT4GLOBzQcXx6ZgFa3S9RiXQjCZ5JvHM2emlZhVdmKV
	Q245D2zLdjuXuS1EIw1StzJpMByKOdHyGcycm0FhW3H//nCKzB8AtbLlCzi1uWAzEFC7nGbiD4Z
	Xy5a3DcolhiLBFdheFqALYC0f5gp7s7W3ilemtRnD51CghZ0xObboFMXljopEo5+IQP0YJdcU27
	4Ilq1lrpJ8elE0etX+MhebFeKcs88ZaC013Ip5ZAbypdlMkOHr0JeKUeyVwaGj+uRe1+BZsyRiM
	5Ggz/f/teqCQ9sPo0J+upkkd8GS7l8/merP3huLVHleILCAZl6IoqfRo+Z8jcYGnTmn3jRjQS+N
	ew=
X-Received: by 2002:a05:600c:17ca:b0:485:343b:38d with SMTP id 5b1f17b1804b1-4856eaac647mr13270265e9.5.1773704234827;
        Mon, 16 Mar 2026 16:37:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b42e680ddsm14706435f8f.13.2026.03.16.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 16:37:14 -0700 (PDT)
Date: Mon, 16 Mar 2026 23:37:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
 catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org,
 mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
 zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <20260316233712.7cbfac27@pumpkin>
In-Reply-To: <874imftol4.fsf@oracle.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
	<20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
	<874imftol4.fsf@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_163718_263289_4C1B059F 
X-CRM114-Status: GOOD (  14.30  )
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

On Mon, 16 Mar 2026 15:08:07 -0700
Ankur Arora <ankur.a.arora@oracle.com> wrote:

...
> However, as David Laight pointed out in this thread
> (https://lore.kernel.org/lkml/20260214113122.70627a8b@pumpkin/)
> that this would be fine so long as the polling is on memory, but would
> need some work to handle MMIO.

I'm not sure the current code works with MMIO on arm64.
I was looking at the osq_lock() code, it uses smp_cond_load() with 'expr'
being 'VAL || need_resched()' expecting to get woken by the IPI associated
with the preemption being requested.
But the arm64 code relies on 'wfe' being woken when the memory write
'breaks' the 'ldx' for the monitored location.
That will only work for cached addresses.

For osq_lock(), while an IPI will wake it up, there is also a small timing
window where the IPI can happen before the ldx and so not actually wake up it.
This is true whenever 'expr' is non-trivial.
On arm64 I think you could use explicit sev and wfe - but that will wake all
'sleeping' cpu; and you may not want the 'thundering herd'.

	David

