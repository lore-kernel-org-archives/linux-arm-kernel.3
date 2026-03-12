Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4397A1067020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oHjwSYdMo6wbQaoARBQB1p5khSJ3cYUmF/TszysH+k=; b=C5pd5v0mNsA4q/15HIDfjjqmwA
	kumxLbdPl2cMEdcExsBvSmHa/yXT4J5RHfFs62BeVz577UFw4BY5ejntdhLatvx1jrOz85WoZ9tnZ
	YiijESXM3WkRmevFKOWd136Ag+b84bgs7uFXZVc+Tx69j8D5IM8Sr6+2w2sq4ZBPSQmjTbaJ+lBFx
	lDpS/GGw3XmhsBUCv6KIVTG2ux26JUJ8qikEbCHxFgJ2yGEH/jAX6TDRn++ptZeetrqiuIGkMKNzJ
	yAFbVjZpgOSXgjVfr2AVchjuPxuU9suroT/kOZr/n+QWHIgCwjjYz8wywLHozkcH1Ob4YSdBIsnhb
	Qbj1GquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gT5-0000000EAEQ-2XGW;
	Thu, 12 Mar 2026 13:52:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gT0-0000000EADn-2jvE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:52:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso8857445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773323564; x=1773928364; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4oHjwSYdMo6wbQaoARBQB1p5khSJ3cYUmF/TszysH+k=;
        b=t+rezL8V4+RdVNO/VhdGkyXWjvt1ZeuwQi3/8XxA/7Bc5ibWgevePBSavWvlVCK6wr
         oQ6AK9UpBWNzYQYW8c/0evyd3NhiPzAHUmsi2t/p7+kk52lmrW9/RvjJcsDooCV0ycLo
         sP6qo08ULLzeBUFGnMxsycwQzOhnZP+nAijwEFy6ItD8yvSH27BI3q0ycdoK6f314tPU
         4tA5ZO3f24q/ZQBJOYPd/CUC8liCuHhcrob25LqshrggjWsKfQwPtC+cQeYYm9Bk0DtP
         lb/4hPf8MgiNovN4TWfOyl9+NIqTLRIp6Gc8wxldyEOCVu9sP5vvEfwJrW+/usYa8zSu
         Ci3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323564; x=1773928364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oHjwSYdMo6wbQaoARBQB1p5khSJ3cYUmF/TszysH+k=;
        b=hvCnChaKkzfJcF6oJ2BrYWwFP/rbgkJXsBZ4fFXT6zzeNqpKSCK1lKZUIwvEkpGHwF
         kOjKSd1xF1DTWldrrjlODzlexKPuHf9adbpMf6plPXhExHPwYRKQNzRccbcBP7v3ck1n
         eypndq3HYkq1klt/+t7ZxIS3x2StuQOezBZUjo49Fm0HTmr5Phkh/WrS0rjO4I6oAfwW
         AAdkPAl/Nbz2nAfefwW+/vHR2uqN0AqnErawzkkm2XW1z33YS4lKeIqTRlRyNjWYPPN4
         18Ww+NqTH9UjbdiIE6vt9ctY+dqnBjW6T4yccIIZWWY4SehgQlOadZ5auFB6S/saIxRK
         6Eng==
X-Forwarded-Encrypted: i=1; AJvYcCXRZWJSY8ninwV82mjMnFooKe3t6LLgU9NRBBD4SG+y4cxpj54ndP8CpO0SkSmoh/LuaW5kQfcQpZPxwlQKt3y3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9s+AnzjHVvtcafBZkl+LW2WwMbdDqHXr2BsAYRgp9A+jzIFyE
	d1G8+kJ4mmMqNhI6N2zTScLy1XanYIXKQ2zZG/K452QR+H6YnVfiB5/BXe9S/G7scw==
X-Gm-Gg: ATEYQzzaZxF/gSd/7hSscGHVTwLAouYmHb5Pmyo921K6bCz/5NEjl35Fys0GlIrd47E
	1jEbejhO6kjEW0/e+q8qrJ9378LYhX8SZ6uI9ub5HNDwlV5FSzg9rsSPV2GDHPksg+fx3MjscXD
	lTxcf96hz90l+bdnW/nMNfZrVCBWtHAApp/c+DRGulem4tgihEWFBIp+vRtW6YYR4i7UHQPxR74
	kGs5iZrlvnJnlJWuk0lQhGOz9gQkWBOPjO+0FgO0YBy1mJTtZ+1K0NUcUu6fJS7i9uw3mz+5Bs1
	l7J0d3Y6qQPQor5VjVj64c2Fdef36yhQoDMW9tma+0W24wxabjdmLwqjsSLrQiVk4WHShmHrma4
	EV/7QhI8GFjPn/FF6/LD8G36B7MPwWHgr0BQpHu4nStkw1YDSeTUi8hb6zPwSU2jo3Wef8O4+8F
	99eMj/hJ5vxgbS7DwrOIX6ZOF+uxhVwvsa11jdNueOfZgvwndcOlmTSEgI0hUEunGLb0U=
X-Received: by 2002:a05:600c:c4b7:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-4854b0a6c24mr109977735e9.6.1773323564047;
        Thu, 12 Mar 2026 06:52:44 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fe27sm140260795e9.9.2026.03.12.06.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:52:43 -0700 (PDT)
Date: Thu, 12 Mar 2026 13:52:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] KVM: arm64: tracing: add ftrace dependency
Message-ID: <abLFKEhE7XMXbTWE@google.com>
References: <20260312123601.625063-1-arnd@kernel.org>
 <20260312123601.625063-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312123601.625063-3-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_065247_661590_9C778D4F 
X-CRM114-Status: GOOD (  19.74  )
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

On Thu, Mar 12, 2026 at 01:35:44PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting CONFIG_TRACE_REMOTE causes a build time warning when FTRACE
> is disabled:
> 
> WARNING: unmet direct dependencies detected for TRACE_REMOTE
>   Depends on [n]: FTRACE [=n]
>   Selected by [y]:
>   - NVHE_EL2_TRACING [=y] && VIRTUALIZATION [=y] && KVM [=y] && NVHE_EL2_DEBUG [=y] && TRACING [=y]
> 
> Add this as another dependency to ensure a clean build.
> 
> Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 32c7a4f85e75..bcc87f9dad33 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -78,7 +78,7 @@ if NVHE_EL2_DEBUG
>  
>  config NVHE_EL2_TRACING
>  	bool
> -	depends on TRACING
> +	depends on TRACING && FTRACE
>  	select TRACE_REMOTE
>  	default y

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

>  
> -- 
> 2.39.5
> 

