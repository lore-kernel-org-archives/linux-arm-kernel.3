Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53A4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V52SU6z4mUrPNmuBCYnRZyOhqwTT/IVAD2aAkFpoqNM=; b=aLFTQIH3GtSSGLCnG8emNdL4J0
	JIVF/Q/8t+TR+63YE3nha9lLP+YcNQIe96ywYYtgv1Vu+hylWfrgMN1IrX2emytUCCqL86U8CedhN
	12yVzqNfoXepvI3qUdLzluePCb3cFDJgOWCAangf8Qqd/97hw66drQUW9KxtJ/U44DuVaDk5Z0pyV
	nuuOkN4LOBo56Mp2eIC9gBfzCQ2OtQd1JKIduRYOEhDIpPAtzWcOKfPAg9j4YC5e2SAiKTDpyEohe
	TqJBnyiRTY7pxuLCIDtewq9DazIqJmFa+pGDb2H1wBUIJTsJx6FB7K6p2+Zepjs6MbKUnpBkPvbQm
	tYp3BKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbwB-00000002Irc-2Jrw;
	Fri, 06 Dec 2024 17:16:19 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbtW-00000002IX8-1MJE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:13:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa5325af6a0so364738566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733505212; x=1734110012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V52SU6z4mUrPNmuBCYnRZyOhqwTT/IVAD2aAkFpoqNM=;
        b=mYaNmYUkyqN5WNlOj7qrCVYgDkZrmXX4Pe1zA+frN5D/jmt45ZnypmG5NNSpilLRYd
         KYm9+RfL3zYkrGJ/wFBGIquCdEJrvkJnQ0APWggUQMklJhr39GyXKnuTg1s6paFD8SZO
         +4JlZv+AUhDJfHbnRLvAE8r9Kmc3ebA6uevDe7AONLD+5qKfD4+IMacIA1GVPEnOnDh+
         8twb95wzZuFloY5A/2s+yiKcFDIsoNOdqJVWf69B6fXuODNnWPd+shC0fc1TuUCrmVws
         RoD1tilEndWWeXrcD5ExVuDdR+QTP59Dozj3jyzBE7xCnd71OXG0GcH1Th75pAEhDG2r
         TNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733505212; x=1734110012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V52SU6z4mUrPNmuBCYnRZyOhqwTT/IVAD2aAkFpoqNM=;
        b=te0QOo0h8zV5YbQh1K422+fn3eLdA6xDaL1mRrczoFgwJdZPDqu5VUw2tRKXrvYvns
         10pr+kBakaOfxGj9gEZaPEJzXe5hY5ODM39Z6ZlfEJB7eghYN5W3HvVYfLEXxpiSS4HT
         qF/xbE9ICk4dmhjAaA1MkfykosywnnPxOCc+IRThID5YUSr5TLOZhCiO5OBpWrbNOE3z
         JqHGm/p2/Cj8tU6nQDuWb2OVBtbV6r8r6ry/U7PYFz+b5qPR1NWlH+go32/WtxCM2DVo
         6lRcQFtBaiW/14Lz36JnMODecQMYqu3QVZpZzekzx6dBTvcaZY7fzovLUgo/dunId4+A
         /oVg==
X-Forwarded-Encrypted: i=1; AJvYcCUtwQLUbfDmkI3V8yORsdRjvcxMkXmbyFTMBONcvtMCFnuNbC/bfJFl1b8bFCqFduc5k5wyos5mikpCVoAOJAHc@lists.infradead.org
X-Gm-Message-State: AOJu0YyIZrqZibyRyfZ9WeFs6iFQ1KR1iVbmt5cT6WqybDyC/kq09ApT
	pjlnMJqOUhJcNxqMPS1SogWMQoOI8lrAXnuXVRdshf0ZmkZ36h0FNAYAtT9qwA==
X-Gm-Gg: ASbGncufNKvb8qo3vjbPsBptwa5hb1zgAMbtXGtBVUEJxSl83PBEqoDIgPyKNI4rdBO
	ud9CKHlMmTv4lTcNtM75QbMs7KGPGu6R8bompX1hISuchw39e2G7IEoLE2j/XLH3mCrK1Wd0FZI
	nngAmn15PHHxWq1FzVlb+PN522WhdGOBlcmSmp3ax3KJGOIIla/92N9t+dRSyC2JMZW1ED0Ijis
	DhsxSLD8IO2MSeVEJy285nJ5YoLhEmN3ENJ/TMRurmBbM72DTE8SCc4qn244FySMiyJHpW5Oynf
	D9vPulCU
X-Google-Smtp-Source: AGHT+IGVVuQrI2gV96PYQZo2nUQh6IhmbK76llKwDGJgy/lGFOBBWjh4tjYfJ2SWh7aGoxZm5SPXtA==
X-Received: by 2002:a17:906:23ea:b0:aa6:2755:c185 with SMTP id a640c23a62f3a-aa63a0a676amr353073866b.31.1733505212192;
        Fri, 06 Dec 2024 09:13:32 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b62esm269659966b.104.2024.12.06.09.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:13:32 -0800 (PST)
Date: Fri, 6 Dec 2024 17:13:29 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 05/14] KVM: arm64: Initialize feature id registers for
 protected VMs
Message-ID: <Z1MwuSh6jc94cem0@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-6-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-6-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_091334_384997_0C86F54E 
X-CRM114-Status: GOOD (  11.56  )
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

On Monday 02 Dec 2024 at 15:47:32 (+0000), Fuad Tabba wrote:
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 59fb2f056177..1261da6a2861 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -204,8 +204,7 @@ static u64 get_pvm_id_aa64mmfr2(const struct kvm_vcpu *vcpu)
>  	return id_aa64mmfr2_el1_sys_val & PVM_ID_AA64MMFR2_ALLOW;
>  }
>  
> -/* Read a sanitized cpufeature ID register by its encoding */
> -u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> +static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
>  {
>  	switch (id) {
>  	case SYS_ID_AA64PFR0_EL1:
> @@ -240,10 +239,25 @@ u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
>  	}
>  }
>  
> +/* Read a sanitized cpufeature ID register by its encoding */
> +u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> +{
> +	return pvm_calc_id_reg(vcpu, id);
> +}

That wrapper doesn't look particularly useful, perhaps we could drop it?

