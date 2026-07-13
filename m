Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8539EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClffvjIACe8ETchiqiqAYna+AICp1RDo+AuLSafnSLc=; b=RXbm7jykG47DSBV436EXe4OZEM
	Acl+Pik5QLTGL7ztBINngya91VXpSJAvhdpsqKyXTZfg4l7FMYbQ83dRSKjOMZNz3HYz39uZ4U39w
	53aXHPqB7KF/iYTfkZ072qZCpLNaX9bYaq+8A2s2TYXGm6ak8B+Rbxgfa4QanLa8aCbM9lkcj6JkX
	jU58q8ASoS242BquSCqz1YoQCLmLmfL7NI/2Ww7nd13EV1xRab3vDLvFfIzxjkKkoFrtXh/tjH6Q/
	qGBkdtT/WrYDrgt0NFIr45qASfAYvhAg6w69GnGszlckaXJh44sy+u0fYhMZW54Nu2q2rf5jcAb7X
	2tQhqZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBfw-00000008Wbi-1CR9;
	Mon, 13 Jul 2026 08:06:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBft-00000008WbG-2M5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:06:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493f75f7172so16584265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783929960; x=1784534760; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ClffvjIACe8ETchiqiqAYna+AICp1RDo+AuLSafnSLc=;
        b=feRYzAsOl0qw/JK+WUnc5RODOH9sITTij0l4SXI63BZj+9AlfTXQvHcgrZhL9t3Luw
         kpynuZ0J5LtPcmcZcrfymV5LG0SiEIw3YP+FPaA1J8Z9FzIdQe1bRd+sJRm6brimJS7j
         WXnnyGKT8aWk+8FTDRBc3MbAl5ig8Elm1cAgd19jnxYwU8DgXZb9/b+zXncgsXWGJnFI
         n2Sq05cIwiQiAxpJTDFXqQVxo72H2Hm8WdctYy6UVkF1H54AVQg/hohUQQZ6TgvW3t2Z
         efi3kz7JSxTrQMdvKVNKolkFRs9AsQWx2lBA4cCsD1NZZcLhiSU2LCBzBIBdlakJwbfP
         PJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929960; x=1784534760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ClffvjIACe8ETchiqiqAYna+AICp1RDo+AuLSafnSLc=;
        b=KQgrJeyFx8XmFu7sMeCA4i9SHbzu07YQYqb9APu5NUV644Wl1xdp5GAiGA6mRL9WMz
         9lI2c4NMttTOxuN9ksIgpIq9B//hUfyPXh3UapwqoPGfCXe0KnLTM/xvEFzckktDw+UB
         oHSbas1hamMu8itPVo97+ZAOWD8ftjE05MxCWt9kUdlLjTY7GhdFMo6WOVslzAxt+P+P
         jJ1yxem+IaAiQefrOSoGrWc5uIQVihmL/p/EiTCObIO8etziN7pKFafzFyCeBxTMWRov
         Yb2uJle4pz3RzmpjConp9+Vrmb/HWJ2xyFtSlBu5fPqnnsblTrh38SRj+sLGE5/URupJ
         78SQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj1SXB5ocjDEvZBnIMC5LuHAkTIt2oOUoGjq6trDz/R+lBTwACSitoElg1/NDF/OMtadS//F86a1pZnatULU09@lists.infradead.org
X-Gm-Message-State: AOJu0YwsgJry9Ck/Wr5FJ+bavCiN8xiAWrCwkrK71EAhLoUgY5yRV0s6
	p/aNv0/qojCd6xqV4f2c01UUchb3JEW3d6QwtQGm49wirEVMvOmRhBc4sI5BkUxc1A==
X-Gm-Gg: AfdE7ckC1CYiHwrWH7evzw9SqU3MUc7AZyFmgdLzT5ZD1A3A9DeaER+VMU+K0GMdeLY
	+BykqzcsJm2p0NUDsNB7W9Q/9PmLOVzCaH8FJmAHEvPYbjdVzklklJEvvCK14i09/5nTWr6mCrK
	mytnI++3z2eseQDD9AAVDrQBjF3ak7SrgN4kXTrft9U4iTw2xVxa9IpBGS7c1DuhmsM/LeaEK4b
	SoIn9HbM6s0EQgevxjZV41PK2t3OefbroYp9lWmbAPoyNGxTIX8TInf4ZyIDfZflT3jBY70KGez
	uXLOAXaDgzi5qyn68MLsoBEY/TvtcX01shBK0V94r+X9Mqeuaq57F8v0Tcj2O9nM7oprPgQ6Z2I
	mf7GSeU3U/A2ZGwtElq2+FYnJ1P7NzNVy45IvGtI0u3liZYnSSKeRdexGai+/LP1kD3sd5oOB6z
	YdvlVI7QWsGCukRnyUMukeNPjEdDyogQ/igYEmEfKMdOUOCcou7h4=
X-Received: by 2002:a05:600c:2247:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-493f8834ea6mr57976005e9.34.1783929959307;
        Mon, 13 Jul 2026 01:05:59 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm87654632f8f.37.2026.07.13.01.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:05:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:05:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alScY4MJFILO9-xO@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <alSbqDyV3Koez--u@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alSbqDyV3Koez--u@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_010601_645120_875BA466 
X-CRM114-Status: GOOD (  24.70  )
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

On Mon, Jul 13, 2026 at 09:02:48AM +0100, Vincent Donnefort wrote:
> On Sun, Jul 12, 2026 at 03:38:35PM +0000, Mostafa Saleh wrote:
> > When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> > defines a static inline stub for trace_clock().
> > 
> > However, trace_clock() is already declared as an extern function in
> > linux/trace_clock.h which is pulled in EL2 compilation.
> 
> I am completely unable to reproduce that. CONFIG_NVHE_EL2_TRACING, isn't a
> selectable option, it depends on NVHE_EL2_DEBUG.
> 
> How does your .config look like?
> 
> > 
> > If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> > is disabled (by including it manually in setup.c) it will cause:
> > In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:
> 
> nvhe/clock.h seems already included in setup.c

Ha no appologies, I was looking at the wrong branch.

However I am still enable to reproduce this issue. So I am still interested in
knowing your .defconfig

> 
> > 
> > ./arch/arm64/kvm/hyp/include/nvhe/clock.h:14:19: error: static declaration of ‘trace_clock’ follows non-static declaration
> > 
> >    14 | static inline u64 trace_clock(void) { return 0; }
> > 
> >       |                   ^~~~~~~~~~~
> > 
> > on GCC and a linker error on LLVM (it seems to change the linkage to
> > global)
> > 
> > Although that is not a problem at the moment, as no other files
> > include <nvhe/clock.h>. That does not seem to be the intent of
> > this code and that will cause issues with more users as the SMMUv3
> > driver.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > 
> > --

[...]

