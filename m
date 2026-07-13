Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0DCC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMhxQOXCpwevLLjNsS6PfLbFdbbTa/KxMnyYoWQBg4g=; b=kogxKrosBsE5GtWX1pG1GrCN1I
	+9sVmsb437p0uH1C9XsAHTJq2TC2HCqltCZF2Vx4lDsDXYY7FRB8Jv0FBOj5ruUvkw+Z4+FWGc8yX
	999dL8D0u4ljbqHpHhTegWbrnIR5VwbLJsnz054CuxR281lbYrgMdHGFvvY/D6RnHlifS+/pHqnBa
	ZthpFxVApkr0kRyBJHq6b6Jjy3q4L00dsqJQCXkMqXSkBYqIvwoyy8KIXEYNA7wrHZbXmVLVFhbbw
	iq9GMEsIfYZ3lbCOya5KjQEfggiZKLd8JYLBM/3wVZHbbAvIbFtFgAgCrSTu3ExgKWrc6rREY6M++
	YPG4lHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBsc-00000008Ytv-2LdB;
	Mon, 13 Jul 2026 08:19:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBsZ-00000008Ysi-2qWL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:19:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so81585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783930746; x=1784535546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMhxQOXCpwevLLjNsS6PfLbFdbbTa/KxMnyYoWQBg4g=;
        b=eIxAfOxApC6l1OYGSXW/yNoYg8j8YHbE9IXwXoHQqkWrhKrK4cZbRNbKVY/LugIqLn
         y2aYg8wAiIej+/SlxTdCiOQLUsiw7KKbD4l5Q5BzOhpyxi4LVyPA8jWhYN9EQJsaNaF0
         ZSeQHMdVgyOwTwkusJjrpOST3Llh3Y322bkZjEbCuxE5vMS8nX1QMO/mNl0KZBZIJfUG
         N/KDLlzhsOnoYXfcjsa0wKuN/8m7elyByzsrSgwumm+CADdyEAn/xasrsZ5Nfr3gyZi8
         LSdiTrBQn0GiOjOnTM62nt1I8nV/3fnBbiVGjOVrAvLlpS2w3z5kTH/PE34YtUrMQKnR
         MWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930746; x=1784535546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMhxQOXCpwevLLjNsS6PfLbFdbbTa/KxMnyYoWQBg4g=;
        b=XB3avd3jx9i47ENGYLYoO4+9dfeaBy3Dx6SRqpCtebXEuSm9aUcY4M0cAgrNMvZ8ks
         y8YGjbSeafgzfkln1VxkRgYLNPBjtP0BPaLt8a0GDRnTmcG5RVNQ9/p1wqRbHT7mTk5a
         IcxaQpYcsuPg7SANgZ8l7VOdd/h3aj9JxReCy7UxiJ7ao8x4UVG/b/WryDF2IQ2JYqgg
         ukmACH+nA6cfbv/RVDa+zb4GSrRfTfNkVdbNE6yn1Vt4hnx5KrmUCWRUMVTVnepqCmZc
         KXk5FJjeAtUphhh1F48CMe4odWSXF1m15EOrIvrhJtv8ab1OjJZeRTnRYM7AATrUS61j
         zA8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp4uZ4F6yCw2Xtc3w/QFiKRusNz2d/0hmzS0v0qVPKMu5U2vNtm0Yj3E4BRkpyiD74/2YGfqN2k9PHpxZoAs6iS@lists.infradead.org
X-Gm-Message-State: AOJu0YxxsqpTgzX78rcSoKLEx9uqnxVFEaoU4RUV55bZZnYnCFGbovkl
	34eK9AF//oUzK1oGpMq6fHGw7/v8m8b7czc0y0HqJZgYvvg9fn5YGNOnFZqdE9/CRfnwgRrWPNz
	gPyIHTg==
X-Gm-Gg: AfdE7clMYWfP+HGpE2T0XSIfURBse3Nafb5toGD1NxDRRHuXvUUC1cpQgrW7vYrquPM
	BMPOwovXEaV2fVW/GJ0S0bGoexw2797viLXEcrb5/zJeXydNY1L+wksFyttCqEqR3yCVcA2jQBs
	HUTpYeseb4Obp0VhsYg0Zv2ybZD5h8H964M8Pf2P/A6mWXED9Kv+mXNVe8E45JRWmMw7cv8Ptwk
	1Ss3gs/dKzeZv4ql3ccko05F2hokqVN4MsyxQlVufuNjPb2bZSzBez4rKcK3nwOSuzai/bNP7Xe
	Kf+QjOQ0U91Xgp0CJl5+yI8ANIMng4rybBGzb6o30bxtMOP+1tHaSoMoAMDp3/QxIDesseAhrNv
	izql+3oN1H2E5fcdI0nluKbd3mQGyIlzhWc50oh9G1A/+BV2gtLhGh6VkLfvHkjR4OibVwsYZPC
	RwTjL1gj7RTY9LBJuOG7dUqJsdfSQIcmj9lf3Ps/2TzhiP9myj
X-Received: by 2002:a05:600c:8b6f:b0:492:668f:410c with SMTP id 5b1f17b1804b1-494688928b1mr23245e9.10.1783930745452;
        Mon, 13 Jul 2026 01:19:05 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm85288536f8f.27.2026.07.13.01.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:19:04 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:19:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alSfdL3acSXm8cP-@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <alSbqDyV3Koez--u@google.com>
 <alScY4MJFILO9-xO@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alScY4MJFILO9-xO@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_011907_736867_7A98E739 
X-CRM114-Status: GOOD (  22.31  )
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

On Mon, Jul 13, 2026 at 09:05:55AM +0100, Vincent Donnefort wrote:
> On Mon, Jul 13, 2026 at 09:02:48AM +0100, Vincent Donnefort wrote:
> > On Sun, Jul 12, 2026 at 03:38:35PM +0000, Mostafa Saleh wrote:
> > > When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> > > defines a static inline stub for trace_clock().
> > > 
> > > However, trace_clock() is already declared as an extern function in
> > > linux/trace_clock.h which is pulled in EL2 compilation.
> > 
> > I am completely unable to reproduce that. CONFIG_NVHE_EL2_TRACING, isn't a
> > selectable option, it depends on NVHE_EL2_DEBUG.
> > 
> > How does your .config look like?
> > 
> > > 
> > > If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> > > is disabled (by including it manually in setup.c) it will cause:
> > > In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:
> > 
> > nvhe/clock.h seems already included in setup.c
> 
> Ha no appologies, I was looking at the wrong branch.
> 
> However I am still enable to reproduce this issue. So I am still interested in
> knowing your .defconfig

It is just defconfig (CONFIG_NVHE_EL2_TRACING is already disabled).

If you attempt to include <nvhe/clock.h> in another file:
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3c69de698f4..ca91e453fb10 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -15,6 +15,7 @@
 #include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>

+#include <nvhe/clock.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>

With GCC: make ARCH=arm64 CROSS_COMPILE="aarch64-linux-gnu-" -j`nproc`
It will show the above error.

With LLVM, you have to include it in more than one file, which results
in:
>>> defined at clock.h:14 (./arch/arm64/kvm/hyp/include/nvhe/clock.h:14)
>>>            arch/arm64/kvm/hyp/nvhe/hyp-main.nvhe.o:(trace_clock)
>>> defined at clock.h:14 (./arch/arm64/kvm/hyp/include/nvhe/clock.h:14)
>>>            arch/arm64/kvm/hyp/nvhe/mem_protect.nvhe.o:(.text+0x0)
>>>

As the compiler would convert the function global.

Thanks,
Mostafa


