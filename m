Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B115C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=O0o3enCtFoZv08yCvYAb3ahMkA4aWNe6wCokY+DYhpY=; b=fu2KUeb0rWuaU0
	jSRv7nV8rVIKHl8ddjvDlDZqx0rlTKfETv+3QU+WOtq9nI1OSdGwe08Gz3tObBVWcV0+caJQCPnag
	Zvu4aMNEmj2NQ6V7PJISjpdsN1M0HYhDiApTjaO+rYtcBZuoLj6NGYqsOIJNVr+CF0T3TrfCy4NFv
	uQ5PpdTCUatClXLWFEM8BD28X7ZnUjC9k1E3VhS1dtZyRnmnnJU5XCCwXM0CbHKp4b7jKM2KyQcdz
	sjRi+CD+4N1tnejGzIfB8oCPKeMVRvycUXPl6Xip7OLH1vImA/ttcWqOkWCEANGlEDDfDp8gQE9kZ
	WSoGCDT+KaYQoIM67AxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBnL-00000006wVe-3HHb;
	Tue, 24 Jun 2025 22:07:11 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9tE-00000006jC2-39yn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 20:05:10 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86cfccca327so164726139f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750795507; x=1751400307; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0o3enCtFoZv08yCvYAb3ahMkA4aWNe6wCokY+DYhpY=;
        b=MzViu6dCtaybRspqxE3ibFeGsvg1f3a7WlkVMluTtRoX+2t9uRSNW8YmfUsx07FvXU
         CNUzvOVwYl7Rs4H9Y90+AzucHQpYVqLEu1QhSi5kgnvZUsCGs+uM5cOqmO1szAUt4+tC
         8PZh7laNJf48QAHPfVNke/hh/LKX3ePkls5MvqPlaaOUppvuC4RkMWLtnMQ/Et3MSam9
         hJJmg7TTeOCi5qqUvc7d43z+aLlcG+OTB+FchJryvQQ4tT5RbEi2Gu/KS33N2KwvGLFX
         yLefmYoT8ePuxYap/wO40XwgYdBq53pJ3g2unBP8+VyWKQNJ9No4bNFAZKQFaDhl25wJ
         M5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750795507; x=1751400307;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0o3enCtFoZv08yCvYAb3ahMkA4aWNe6wCokY+DYhpY=;
        b=jdkzpKChB9PTtcb4mc1+C3OnHQH+RptEFuPNPwVm5wgx2+vpPYW9dRHcS9e0bD2/2R
         NHdYBpjK/5+baKaNjjERzKeK0L9KhKft1Azribr6/+uxuqwoKs8DOFpdRS7GPljtMH9J
         ElqW2v3wgmapOHQjQ9zWQ9s5tNbWkp9ga1QPz3gDDCoMMCyBSJUsiWfZPGXoSyj8p7qv
         7RX5yUhKT8OD7MLra76TQCL5l6boWeClRCUIWpjZXYtWDKZ7lW+C823XAVHmfWBQf29n
         faHNZO/ZiMnWZgnKDJGvUFCXTP2Hj/Gc7TX6ccAjPf/X1u/O/WDqUMEHmZ0ZBkYjj2P7
         x7AA==
X-Forwarded-Encrypted: i=1; AJvYcCXaAcI9cNyoWvCm7uvTwBHEP5G5gObQFbhW50+LEzozPC7YOKMQhdt0XKHnkmOzkcYxjeOJSZyjE1loQi5K3PIz@lists.infradead.org
X-Gm-Message-State: AOJu0YwbxziMccxUzNC6qd8YBSArIaxcitWDmfXwQHsXl0UPnXudJo8X
	dYMgEQf3tZs0WEIzl2V6Qt2FvVhfXho1TlICKTbl+0cmA59wLzpVK839R7O6x6b55OzXHZjwRLh
	9pU4z9sL2oF5lSruon2pWhjjndw==
X-Google-Smtp-Source: AGHT+IFRBaniVPLdqgtBiY+RRt9A60KwZhLUhr0WNUCFuq3s9GR9zjSj1vgrB9faZftbsD7qku7K0VwW+GoO4k+cFw==
X-Received: from ilbbr10.prod.google.com ([2002:a05:6e02:23ca:b0:3dd:7629:ec3a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2163:b0:3dd:c04e:49af with SMTP id e9e14a558f8ab-3df327eeacfmr6647305ab.3.1750795506770;
 Tue, 24 Jun 2025 13:05:06 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:05:05 +0000
In-Reply-To: <aFpThZIE2PxjVAVw@linux.dev> (message from Oliver Upton on Tue,
 24 Jun 2025 00:28:05 -0700)
Mime-Version: 1.0
Message-ID: <gsntcyasaosu.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 01/23] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_130508_805751_DF6D1CE2 
X-CRM114-Status: GOOD (  22.35  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 23, 2025 at 06:25:38PM +0000, Colton Lewis wrote:
>> Oliver Upton <oliver.upton@linux.dev> writes:

>> > On Fri, Jun 20, 2025 at 10:13:01PM +0000, Colton Lewis wrote:
>> > > Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> > > counters reserved for the guest.

>> > > This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> > > because otherwise not all the appropriate macros are generated to add
>> > > it to arm64_cpu_capabilities_arm64_features.

>> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> > > ---
>> > >   arch/arm64/kernel/cpufeature.c | 8 ++++++++
>> > >   arch/arm64/tools/cpucaps       | 1 +
>> > >   arch/arm64/tools/sysreg        | 6 +++---
>> > >   3 files changed, 12 insertions(+), 3 deletions(-)

>> > > diff --git a/arch/arm64/kernel/cpufeature.c
>> > > b/arch/arm64/kernel/cpufeature.c
>> > > index b34044e20128..278294fdc97d 100644
>> > > --- a/arch/arm64/kernel/cpufeature.c
>> > > +++ b/arch/arm64/kernel/cpufeature.c
>> > > @@ -548,6 +548,7 @@ static const struct arm64_ftr_bits  
>> ftr_id_mmfr0[] = {
>> > >   };

>> > >   static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
>> > >   	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
>> > >   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
>> > >   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
>> > > @@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities
>> > > arm64_features[] = {
>> > >   		.matches = has_cpuid_feature,
>> > >   		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>> > >   	},
>> > > +	{
>> > > +		.desc = "Allow MDCR_EL2.HPMN = 0",

>> > This feedback still stands...

>> > 		.desc = "HPMN0",

>> > [*] https://lore.kernel.org/kvm/aD4ijUaSGm9b2g5H@linux.dev/

>> Sorry for ignoring your previous feedback. I looked at the other .desc
>> fields and they had more descriptive English, so I think this one should
>> be more than "FEAT_HPMN0" for consistency.

>> If you insist I'll change it.

> I'm not exactly sold on the merits of using descriptive names for the
> capabilities, as the architecture extension names are exact terms that
> can be related back to documentation.

I'll change it.

