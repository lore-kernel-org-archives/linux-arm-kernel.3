Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30690F9935C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKpJvW7DhMmQGBTcK6buF1FQEMkYscuj/n2ufvkVhMQ=; b=hdb7JUXceVzLp6geV+Nczrf3ES
	OBGKdvkU9ZyIOQamt+52YWdTtkPzMFCfPhQXZkV3sXvo3Dcf2SwdqDN0E/Z2hq4sViJJyu1Ytq6YF
	ieDT28OV+tgJTv5iklsF3lgavgWoIbR4D77WPYHDSiP8O/NdZFmdUslLblnSveawE//RlUA8YY2TI
	oC+mhdb8F05f7WEV1X18T/5LfvuiMc/uepgj6FBlv2IL9BGsb83g1G0o70QH6DYXE/jXVyvcTTvSO
	Dt9NQ2S6+5ChmOQUGwDVM3Q/tVp7tz77FyrFTzr98L91wHh9+pf0N/ww+RS1bBckvlznFDfKKspJH
	YWJfIC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqN1-0000000BOmK-1p3I;
	Thu, 23 Apr 2026 09:29:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqMy-0000000BOll-3PBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:29:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so54323a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776936551; x=1777541351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BKpJvW7DhMmQGBTcK6buF1FQEMkYscuj/n2ufvkVhMQ=;
        b=rBijbgVeIB40/Pqe+XOo0D0FqD3VdHJGpmpLDNjOud9cYZRhshUFCCHYyaOvVcXBex
         VN45b9DQNvNXemVOB52E88ajKYex2b/sFGemxeZM8ZZPS8LMmYhTFY1sazKtrwFtJE0O
         wpMrnQlL1pD4AzDQ5QAKzlgm50ENeVqhBpbBLJ9YSgWIpJlEnM+SeoC+Qlk+zfyCIS5i
         iX64Wr6LSp79pQXaAwffu6WJxbBxKl8v8AFILFJDxAzIYVvQOg3qqVmSq8KEc5JF3wCi
         Hc/TipLMJp14GYVPbk5Iqt3zhlSTUsBlHdlTxLBqbwrjip2h7e20v7AOn0CSZzn+v7Qr
         TUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936551; x=1777541351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKpJvW7DhMmQGBTcK6buF1FQEMkYscuj/n2ufvkVhMQ=;
        b=e73pNgR0WlazIryeDX3VbIXV4JVhBJbdy0O+5SD7zfalCWDhlTWbUOK0P/NdYidIjY
         Xn+WckL2eH1mkAIgSMGAAOyuP/mOQpJAXtFi1gEz4p39wQLsNU9PGLG3qe7qGt5rLL6Y
         1ZAWbleQc+oXTRt/XCWFqs3Z6ajhHGXEXPLB2pPtYdFRElNotRDvytbegTkDSRv9UAJR
         mf1D+QAb2WTnIyB5E7thvqLOB9cWDCnQuCt6mtCe3YtvtF03gszp8EoVfVkYqzsOjHjB
         kvCOUCUPwvWnDXNKEFmpRmpwgvJvDYAdUxEzuDi8NuQ+YBo8BRrBeTAWuz0j9VBWvg/H
         0DCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8u8677nS77HEjM8wBVS+l+RxFbf+ueNT14WJkc5Pz93U6nanKHhfthZdyCoiD3cNAip7yHkhfAgm4QMtU+iOpX@lists.infradead.org
X-Gm-Message-State: AOJu0YzDUgZHLHN5MX48z9RkfhEYNBB7vc3P3MJ0O3WFxTonxJ1cK3kb
	eFAH0ZtSpMvUTwm/n/rh/ZLoqHik/+eEpi4SpaN2RCAueqOHrSotjbTckX9JGFqFjg==
X-Gm-Gg: AeBDieulRAfEvbf9/TOBWBRNUwojqfdcmcpOBti6sjUgEtP/ziO3aVHAuQQvI0dSyCt
	5dE7RvTnTBd6T/RPHxDv7huKaC9tkl7MYv/uyOh9wBjTNKCJmfCnk+lgrwDCyRJ9oFPs1IfwN3S
	54iGWldxMli7ZNF0tuh3kXYgJMyAblg8Nr1pmnesGeiMqnoNn9VS89C7qVzS8YUX+DyzNQQo20e
	xztBOokUGWnHX2/PKC/kywP5kOKtKHifUx7WvpeVwTG4YHx0czYivISw1MCmwKOaF2gao7RN63A
	fANgbMsdbXdh/jjxr0fyO+t8VWEYqaxwiXr+8w045ux2GQSiclH+lxpL5ami2QMMWNETUOj2bWR
	3iKfChHPC2LeyykxCWh2vuecd3k3yyvXT7h/awTule1rz1FTnvYLc8agrhEAoQ+8+poMyZrtIdf
	MzAIklgTK2rCneQP/ZSu4C7VFpDzV4A1OUJ/K/Wj8woOXPGdCdD2RtHdvIgd8xVNYQS1EZeRYnX
	KQuk0WL2mXXfF44pDo=
X-Received: by 2002:a05:6402:902:b0:670:7177:94df with SMTP id 4fb4d7f45d1cf-67440714a81mr250309a12.6.1776936550235;
        Thu, 23 Apr 2026 02:29:10 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5babcsm3890524a12.23.2026.04.23.02.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 02:29:08 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:29:04 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, will@kernel.org, ayrton@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Validate the FF-A memory access descriptor
 placement
Message-ID: <aenmYK3Y4XcqkmI4@google.com>
References: <20260422102540.1433704-1-sebastianene@google.com>
 <86bjfb18v1.wl-maz@kernel.org>
 <aejOu98q1lEZoFfW@google.com>
 <867bpy14kx.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bpy14kx.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_022912_907516_41A35EC6 
X-CRM114-Status: GOOD (  37.69  )
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

On Thu, Apr 23, 2026 at 09:08:46AM +0100, Marc Zyngier wrote:
> On Wed, 22 Apr 2026 14:35:55 +0100,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > On Wed, Apr 22, 2026 at 01:24:02PM +0100, Marc Zyngier wrote:
> > > On Wed, 22 Apr 2026 11:25:40 +0100,
> > > Sebastian Ene <sebastianene@google.com> wrote:
> > > > 
> > > > Prevent the pKVM hypervisor from making assumptions that the
> > > > endpoint memory access descriptor (EMAD) comes right after the
> > > > FF-A memory region header and enforce a strict placement for it
> > > > when validating an FF-A memory lend/share transaction.
> > 
> > Hello Marc,
> > 
> > > 
> > > As I read this, you want to remove a bad assumption...
> > > 
> > > > 
> > > > Prior to FF-A version 1.1 the header of the memory region
> > > > didn't contain an offset to the endpoint memory access descriptor.
> > > > The layout of a memory transaction looks like this:
> > > > 
> > > >   Field name				| Offset
> > > > 					 -- 0
> > > > [ Header (ffa_mem_region)               |__ ep_mem_offset
> > > >   EMAD 1 (ffa_mem_region_attributes)	|
> > > > ]
> > > > 
> > > > Reject the host from specifying a memory access descriptor offset
> > > > that is different than the size of the memory region header.
> > > 
> > > And yet you decide that you want to enforce this assumption. I don't
> > > understand how you arrive to this conclusion.
> > > 
> > > Looking at the spec, it appears that the offset is *designed* to allow
> > > a gap between the header and the EMAD. Refusing to handle a it seems to be a
> > > violation of the spec.
> > > 
> > > What am I missing?
> > 
> > While the spec allows the gap to be variable (since version 1.1), the
> > arm ff-a driver places it at a fixed position in:
> > ffa_mem_region_additional_setup() 
> > https://elixir.bootlin.com/linux/v7.0/source/drivers/firmware/arm_ffa/driver.c#L671
> 
> That's an implementation detail, and you shouldn't rely on this.
> 
> > and makes use of the same assumption in: ffa_mem_desc_offset().
> > https://elixir.bootlin.com/linux/v7.0/source/include/linux/arm_ffa.h#L448
> > The later one seems wrong IMO. because we should compute the offset
> > based on the value stored in ep_mem_offset and not adding it up with
> > sizeof(struct ffa_mem_region).
> > 
> > Maybe this should be the fix instead and not the one in pKVM ? What do
> > you think ?
> 
> I think you should parse the buffers as the spec intends them, without
> assumptions or limitations.

Ack.

> 
> > 
> > The current implementation in pKVM makes use of the
> > ffa_mem_desc_offset() to validate the first EMAD. If a compromised host
> > places an EMAD at a different offset than sizeof(struct ffa_mem_region),
> > then pKVM will not validate that EMAD.
> 
> Why compromised? Isn't that a perfectly valid thing to do? What I
> understand is that the FFA 1.1 implementation in pKVM doesn't match
> the expectations of the spec. If that's indeed the case, pKVM should
> be fixed to accept these messages correctly, or stop using FFA 1.1.
> 
> 	M.

Sorry, what I meant is that a potentially malicious host could abuse
this limitation of the FF-A proxy validation which is looking at a fixed
offset to do the EMAD validation. Another EMAD can be placed at a
different offset and it will bypass the validation of the proxy
alltogether.

We have two choices: the simple one is what this patch does (enforce a
fixed offset) or the second one : patch `ffa_mem_desc_offset` to use
ep_mem_offset instead of `sizeof(struct ffa_mem_region)` and validate 
the ep_mem_offset. 

> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks,
Sebastian

