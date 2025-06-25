Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72D1C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORz82HmG8MePjwyhjUnw+YyKg1bZgQsmMoLl2/yzhQE=; b=tCl3QqYqtxrOla7ao6nXul7DOe
	5vJz6ZPfQ16aLxYGQ3WEcVNMNvNw8487I+eUcHFLVP57BLa+0Mo/IXYuY62hvveTEvaHPDb6p5rMS
	REg7jffTwwAS/A/Qakjr4l2N6sX4PcOTVCjFHGUuRWVjAJ8Ve96EFKcfVfbVRTUR3g4MBGyNb88I+
	2SB014pZHDPBEhIY1Y+euwSFkFZWzplygJVBZo2+TykvXxFX+XeE4SaOHIya86dd+ndMXWKMKdhEo
	xynoRGo82sL5HgGTsPz4xZpxVOD3TaHnT/gGNMJsKjZDUMTST8bmQbAwkwYP4Afqd1gE+YY6nHNKA
	08kni1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTTF-00000009P6s-2FPY;
	Wed, 25 Jun 2025 16:59:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPCL-00000008cR2-2Q9f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:25:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-453663b7bf1so76325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854351; x=1751459151; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORz82HmG8MePjwyhjUnw+YyKg1bZgQsmMoLl2/yzhQE=;
        b=TFaWYT7yQ3LIKlREfVTRUbzwzE2XgmyKBDzjAnaQBWrA2mTcpeRQAjzYJhFt6lawbO
         cWeVZNgI8TJbS1DRk0yeChqxQNpiM7MgMeBfRlkKBdo5FccBKnebDZP7fPWprG5bjE43
         vXKWhcO5hgTejsanWxgsYFO9S0SN7zFM7tG/4Nh4BVDQ+zgnQvMCzE+P9aimDeqMaI/K
         Jk2EZxDFA2Rbuql0u8cIZHYX0349UvSYp6EgsbtaNRLO7p+L1W51uipPXThCkSmXNXqe
         rvybmj673EgvlYDsyyo81CuyMDEegsPiD0+uBOKk1zu/kCaYABv8V/QlSDwiO7m91DJa
         Bmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854351; x=1751459151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORz82HmG8MePjwyhjUnw+YyKg1bZgQsmMoLl2/yzhQE=;
        b=qE26dtCYDLVwEu/jgTlfNd5KDOmP5EBK5LdLj+fwJW99THgyRY9YvJRuL7j6KeEa1T
         t2J+l88vHNmSR7WGfvl3uWCFJW0BDRJ09tXOJF3zv813nFhXMqUUrJ2fsHatW4vh7J0X
         t0gIndlEdyvFX4mns5SiIm3gYmo+cFYoMD2t/l2eakW+URtW9uukq8/EjZ4OiOLM6jXV
         OcPDaDdE1sExTYAhwiiM34/aSlXE6egcWIB96ut0QI+Y0EylZRtKTqDwd8xBPzEhcPDo
         d6OB4AlVG1KqnR2jmCGrD6LvcVhJ1Z5UHPQDeU0y4ZdmV7IU2JFy2UCNyqFUL4WRouLY
         pASg==
X-Forwarded-Encrypted: i=1; AJvYcCXXcw/3rGyAmjFxwq0ddJNj/2G+wsDEjnNYmq2IoDCl4BOiWvFn9oyIVunUoNX+1M+yDcLzuJnVY94ijdVfTsZM@lists.infradead.org
X-Gm-Message-State: AOJu0YzPO/sEvlJ+RGUa73BZ9Cs7fn4Dses3PdjdLK8a48hZ/eK58a6Q
	ZhFQFzDyCtxeNwiwf4zn6i341Q9ypDpA4pxXcr3GfeiMOugaJO44FJlHurOTPJSYhw==
X-Gm-Gg: ASbGncuCRV5MWQFtOytI6Ui73eac0Z7T1Bs5jLdan5R+Ym0p4+po/AzKXZtA6LsRG0r
	59fvWAI74mr7wFvG5/q2vY8A7qY7xznbmVypLHkHKRV4yzttC3paafaECvACQbVTaooLEzPpXp+
	+jS0v66guV7ZtoxQao4YJERd0ya58TKxLcLlSjRiqwTKlZYzUDh58GMQJd1DKZ6MIZovloEAl1I
	u2DoVtuL1yD9vXvy6rphZNvW1CAaK4RSbPzkXyX8No9M+cqYOYyx4+M2Key0uk+pkbywQt3V9E5
	NCRAoXS1HsSN0wX2W9uoGBe4Y07imP+ZfChaZOCl2LKeomNOF4HNlvX8g79+wg0y/54GsHyc53I
	3+Jigi83tifbK8CPAfsrnRpS0X5rXnShazew=
X-Google-Smtp-Source: AGHT+IHPyu4K7DFqX3gLjlWDl8SuaCVRLnWxYtuvRdiGcRhqnltdTavombWZNicSNu6nwKbmjbZ0JQ==
X-Received: by 2002:a05:600c:c04f:b0:453:65f4:f4c8 with SMTP id 5b1f17b1804b1-45383195f5emr555595e9.3.1750854350879;
        Wed, 25 Jun 2025 05:25:50 -0700 (PDT)
Received: from google.com (206.39.187.35.bc.googleusercontent.com. [35.187.39.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069467sm4409880f8f.42.2025.06.25.05.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:25:50 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:25:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Quentin Perret <qperret@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix error path in init_hyp_mode()
Message-ID: <aFvqyl-Xquuoyvh1@google.com>
References: <20250625113301.580253-1-smostafa@google.com>
 <aFvqFdwNYI0-3zWY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvqFdwNYI0-3zWY@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_052553_615306_A740A118 
X-CRM114-Status: GOOD (  24.24  )
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

On Wed, Jun 25, 2025 at 12:22:45PM +0000, Quentin Perret wrote:
> On Wednesday 25 Jun 2025 at 11:33:01 (+0000), Mostafa Saleh wrote:
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 38a91bb5d4c7..5bb36c3b06b5 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2344,15 +2344,22 @@ static void __init teardown_hyp_mode(void)
> >  	int cpu;
> >  
> >  	free_hyp_pgds();
> > +	/* Order matches the order of initialization init_hyp_mode() */
> >  	for_each_possible_cpu(cpu) {
> > +		if (!per_cpu(kvm_arm_hyp_stack_base, cpu))
> > +			continue;
> >  		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
> > +
> > +		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
> > +			continue;
> >  		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
> >  
> >  		if (free_sve) {
> >  			struct cpu_sve_state *sve_state;
> >  
> >  			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
> > -			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
> > +			if (sve_state)
> > +				free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
> 
> I'm a bit confused by these extra checks -- free_pages() should be safe
> to call on NULL?

Yes, I surprised in my testing I didn't see an issue with freeing NULL, I
though it might be config related, but I should have looked more.

> 
> IIUC correctly, the actual issue is that per_cpu_ptr_nvhe_sym() will
> dereference the per-cpu pages to find the sve state, which is entirely
> bogus if the per-cpu pages have not been allocated. Now, looking at
> this, it looks like the bigger problem is that we literally free the
> per-cpu pages right before the sve state...
> 
> Should we at least change the freeing order here?

Make sense, I will fix that in v2.

Thanks,
Mostafa

> 
> Thanks,
> Quentin

