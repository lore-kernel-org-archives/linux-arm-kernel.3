Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D176CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3xUY9h0KJ8iAZKk6ldG2UouJ9y8peB0TN173ET5ZQ0=; b=w3SvU4ZkZUdfZvPbSf5UQatC/e
	Uuhv0nJWSQRXjhZZTZOcjyHYQ9xk3d7BQFfv2ASvlB3IxJkxqr15qD6qtggE6DGLc+eiyYPMIK9cn
	JdJqNAiExRZXZxwHy+hlz/Pd4Foo5KlKgYufmIFS4umCMX31XJdfcqM47Pf3ylxSXXCmFqAUQiIyz
	znIsrvU28Cn4+AjlsTFF4JgD3tzEJoFFhnTdcMTwhbO0Ega0kX0swD0fR//Z336SLkajdZqPPYg+c
	jpgSwtlqpLu51SSOF2zcC3kwU0Zrb1ElWNHZL3NmYohcEA4/GWRoR4VjYHaE+Y/On5yo9PcqGAkxn
	GUR2scbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEa5l-00000004sog-49R2;
	Thu, 30 Oct 2025 21:21:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEa5j-00000004soI-2pvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 21:21:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47710acf715so8362285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761859313; x=1762464113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3xUY9h0KJ8iAZKk6ldG2UouJ9y8peB0TN173ET5ZQ0=;
        b=if0RGcUXA1sXgABkBdb4vVpI7aZVSKcELWS2eE3BJObZ2cs5GPj28NG6adSqwN7EVH
         F9PIMBRWXiqz6brEdzAz92eo0dfaCtXwqizAlRmLOjmRqSx7QuZk/YhO9ijjnkjxrOto
         R/Cu5GVEQf0xEfM303HVy92eYpUhZqAO+jQQIn/jjvxL/kLt7SvSUmsk9kR6AJwLl2Dm
         HHQ9Gv+ST5w43O8vPOAXB6K1zKRSkVRnh1Jsi7bhueK+jlgLOhuCDgBiio1yik9ySrs/
         XJdfHV3awlBfKoOd4uBbfTgZrNdo0wElygm39USv2IcWvKl+3fVr6+TTF+4mznZTQmCQ
         gVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761859313; x=1762464113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3xUY9h0KJ8iAZKk6ldG2UouJ9y8peB0TN173ET5ZQ0=;
        b=fWrlvHhYqX0oeGdT2a6G+cxd+eNpuudZazYOrnc9D5s1S2qYPpHgvzpwEXxfmIKXcS
         3s1GCrbxN7ofOe4aVgdYoBLbgC180hlBgbbWLBZGC4DiYwvK+FI3ydQOiB0Z3VM+61XN
         HzVKZyd+5FD19PNEqK+V5WIOpVWTpv+qxPzKrpWSIEcWIISzG4x1ZXEG78rJH9CI8+x0
         cZLN0auahgYWd0rH7Bq485RWdAkCc5/j/wEG8+GMWkJOvl8TmSTSYLYJrpoMdvP1ysYS
         SOtHC/KA8SQ+jfaVvhGMvZhRizEOSmpwL/hr5+Mk33BDIghGDsSVzNMJP1qBnby6MxRk
         xuiA==
X-Forwarded-Encrypted: i=1; AJvYcCWo2ebszEN4K8dzrybNG2L0UNyr1nvMvV6uCmZdEIwSfUiXGND+T4BXL7Lr4f11RYkA/wrXjqVb5QGQNPv69sa/@lists.infradead.org
X-Gm-Message-State: AOJu0YyKky8lP4s2bi48362053S0QFckbBGtf5aiZYc0sTO6xemOPaTu
	te2WalWBIrQR9uTRidVBThwiHuVNPaKB5iqTUBeZ3qv518OZACu+S+gr
X-Gm-Gg: ASbGncva/UjwvulYXGAkU1aKweT8HmMnQml1PtgEZijClye5asPFP02RCA9gOceBC3e
	DdiugatbWYPDuhBA3iIQ4LhP3vhvNq/iLpEEqSqVISbMcGONtNSh3jkRPfPcf0UKi4zXWsHJZB5
	AQBEQ7mfCC7MDSCpdg7eJ1fL9sGFlNLQ8S0KhW8gX0rrxdI9H4E2WOsvx7bss+mmxjf1ISNieTS
	33nUNIZDn1tT50/k56yhmyKn7mgNFWl+9Ks44hbbAN8azpxVbaoqTVg8zkSI26qy7sE/jH11UAM
	ViLXPUeQhKxlI7pnOMhEHvvBnPgGBUTZpBsUKFhFGnKcYWExxFlS7YS1kG9y4W3kr5gDTQN9Voi
	JCtUn5PdTrAdeuMcr6PQpEUotQ8jnhYy0rI+UY9jNlpeoDk4RbjWyDb56S3fRhO89A3XMIphd44
	w7PN/Oy/TEWahyqVPwgm54ZOcPiQe9tt1bO9eWf+1vsA==
X-Google-Smtp-Source: AGHT+IHRzVaOlp+5YsC2cfS+t1uX4CV5lhiv1MUcpedd26aU/rB1wa07+4lpdiM8MS3Ql59DtlOQRw==
X-Received: by 2002:a05:600c:3d9b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-477307e2946mr11654555e9.15.1761859313090;
        Thu, 30 Oct 2025 14:21:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fcf439bsm7028125e9.10.2025.10.30.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:21:52 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:21:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, David Brazdil <dbrazdil@google.com>, Joey Gouly
 <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, Suzuki Poulouse <suzuki.poulose@arm.com>, Will
 Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Miaoqian
 Lin <linmq006@gmail.com>
Subject: Re: [PATCH] KVM: arm64: Use pointer from memcpy() call for
 assignment in init_hyp_mode()
Message-ID: <20251030212151.352e9a8a@pumpkin>
In-Reply-To: <aQOlPy7W6xljdkJW@J2N7QTR9R3>
References: <6e962260-5069-490a-89fb-908a4342ccd9@web.de>
	<aQOlPy7W6xljdkJW@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_142155_859477_FED2A7C2 
X-CRM114-Status: GOOD (  26.98  )
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

On Thu, 30 Oct 2025 17:49:51 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Thu, Oct 30, 2025 at 06:11:03PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 30 Oct 2025 18:01:41 +0100
> > 
> > A pointer was assigned to a variable. The same pointer was used for
> > the destination parameter of a memcpy() call.
> > This function is documented in the way that the same value is returned.
> > Thus convert two separate statements into a direct variable assignment for
> > the return value from a memory copy action.
> > 
> > The source code was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  arch/arm64/kvm/arm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 870953b4a8a7..feab88c31703 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2600,8 +2600,8 @@ static int __init init_hyp_mode(void)
> >  			goto out_err;
> >  		}
> >  
> > -		page_addr = page_address(page);
> > -		memcpy(page_addr, CHOOSE_NVHE_SYM(__per_cpu_start), nvhe_percpu_size());
> > +		page_addr = memcpy(page_address(page), CHOOSE_NVHE_SYM(__per_cpu_start),
> > +				   nvhe_percpu_size());  
> 
> This change makes the code harder to read, and harder to modify. It
> saves no space.

It might save a register spill - but really isn't worth the effort.
memcpy() is really best treated as being 'void'.
Indeed most implementations would be better if it were 'void'.
Although you could define:
#define memcpy(d, s, l) ({ auto _d = d; void_memcpy(_d, s, l); _d})
so that the compiler would optimise away the save that memcpy() typically
has to do.

I even suspect that memcpy() is an old enough function that the return
value is 'what the implementation happened to leave in r0'.

	David


> 
> As Dan said [1]:
> 
> | No one will thank you for making these changes...  :(  Please don't do
> | it.
> 
> [1] https://lore.kernel.org/lkml/aQNsecHJSO2U68Fc@stanley.mountain/
> 
> Mark.
> 


