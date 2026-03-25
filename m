Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DE9106B50C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HiReDp40rAShKhFmk6aQGrdV2dk4gym9DDo3pfkhCw=; b=aEnVZOgIDXHgD1N83Aul4LVrCF
	3Lnq6IsbXW15FuneS1GDr0ixKXWlfDTv6zgc/DW36OrFjWz9odLDYa3GN0GXJ4T0teMEfRwAiJSJM
	2Gynk9IENOzD3qrvMkpaXio7+idwyXqq/L9gCj6/dwytdHrJm7X1oZFd7V27gKeTs4JGhkj0MQCfT
	d7ur/5JgqqkkqgeROfU5tco1QujxeYybk43dcbx4D3NjoeTvfWHeuLIMoK3JAlCXpUzb2ya8jUYbM
	CeSAIDOmGNVqDCm6jzGX5eu7rzqZpAnIApwYuH2g0GdC1k8Kx2U7N2+fntmimf0NkBJld8U6SsmMf
	P0SuVw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NAQ-00000003MLK-2cmf;
	Wed, 25 Mar 2026 12:16:58 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NAO-00000003MKp-39xY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:16:58 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-509062d829dso476081cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774441015; cv=none;
        d=google.com; s=arc-20240605;
        b=LhBtzKs1TFjfqzHgE0UNfTpm9gfQ5n4d8NVFLWTpWXilZGWVJr6dMZ/I5NXLqreLxN
         rPW1naU182PmuX6WvROs1qfxq+yop3orVh5znm/+RMFEhSeUMGWc6OkYcHAg/uu2lIvC
         jt8bvSqTjIpdVty8Hqy1P3+TT0uw2F0wwWDw9loWTmDOHVO2FsB3KngU/pgPQ+AuLpk7
         pXdSUDz4v8Rm1ySwO0bSdlTjnpez6KLgZo2/KBqJZ794SFmDQWcE/xgiLi+Nds3OjG27
         MhfMaS8AhpS09VJAE0wmOEn2Am5rQ+X9RF6IQoBhfqGUah+efYwM7sNUI4w6u6SqpRH1
         AhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6HiReDp40rAShKhFmk6aQGrdV2dk4gym9DDo3pfkhCw=;
        fh=ZFBExRKJ2TX0DUi28h1q0kYmxb0eDJCgqxUgz5YdZGI=;
        b=U3a64vL7Xgww3peXt++qZk9FxjZ5XnOc8fhdTvKpaAQDlGMBU7BRIPZtvMgrMTLVpm
         0hj8CZ+MTLeC682bnsmtIpCXF96/ySFLa72uHEJv0q03xewt7HxkurSUo5CW+4KjN9Ud
         8sbtbTeUgzaA1wmlshUTOuIFdDP1tFRuMuy6lc5uuLIvjltAo6jZVPA9cOYC/tjgF4k/
         2bTOcTTlkuUNhSP0QRzpnqhO2p+e43j5lvIQVanhQtMWrmaJgdZx6v60ykiiqxioxSzY
         Bq3tTxCAoN0kNyhbKbB8roXN2vwf9HLTl8qSFMhMnNTJYH9KhkZWfu6l8XaaZT9I0kz+
         1BwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774441015; x=1775045815; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6HiReDp40rAShKhFmk6aQGrdV2dk4gym9DDo3pfkhCw=;
        b=qwDL3zTVKM+twlG0AfrQbcWTLS7jaxYzIGNpuIYC9kta5PsfxFO1S3nfP0APDfQUok
         tvB1en2+JuaP9t71fPD7Og2JMgWI21njMAMlojBZlmEdvIl83Yev3gR3XZDodqvjBmU+
         fQtINYOAh6tUp9sRiAgHxwP41F/CD8prwi82l3ozQbLUw88iZDl+2Yb4edjEPTn9hViH
         9NaxI2aMem54jGN1q+/AbFT5Tf7GmP/ymjwNJ1RPBEi5Fkvx7Qrgxt1kFAbG/aYiu74P
         eyXoKSdsKfF4Y6hmA3iOq2Y8p35Zgco+l3JF1vOtrhVq0AqkuPeeYP4lx2a+xlbmiE8+
         HwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441015; x=1775045815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HiReDp40rAShKhFmk6aQGrdV2dk4gym9DDo3pfkhCw=;
        b=gbGrkWiG+Qyt25VGJWWfvT0EUjJzcXXiQQs/FEwkQqG00bOkmG5tsuCejps7llcopG
         F2LavNCP9G/fNa+o572OcJ5ha3Gfxq5rdKCP3hGKqa6cHwnCMUhfwBqdM8H9LfnW8au8
         5cjPcEvRxmhVWsGzs/vDkpfdGgOudniFZO1yj5/tgpG+R43ZzTGvR7ACVuvB8NGmEAL5
         zKycLFeLF6nb4qyWlXQIZbAYYnShIedBnFvu5KILFb7PslMPYUw2DGXPw8Bl9TerUOxS
         QapdW9drYUYfMPvjcHHcZSLY6f1x0KPhzPVEq6ppy7YWA/3lx1oOWM2r8fWNmzY9oNQt
         P+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVcm5ZgscnyhTCvCnyx5+vkhh3Dz/zogfh5k4cg7rMhPy9cO9lRhNrh1k2DTp6MsxuzLolINpImv2HNz4ANhMHv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4OT4xUnqIWL5FdRF12C9sfBhB8g+PWwsBG4tabLWQT+i6trfZ
	Bfpaex06en6y9PsWFW9z/s4mO416IGTyWozpLLZWFpZB6ViGQ9AZO/RWcprB37yTMmSdODez6PN
	n/2carmfmcp/dzlKzOc0gyg8LewrTD5ZsY0GUCwKi
X-Gm-Gg: ATEYQzwVl3ujqy5jjtvyx99J+XoEjMxbIvY0CCV7hIPnJtLmuSKBARuTsHOJGfdNtgg
	bOM4yFKaiBEMnzbhkz4HKDEdO5c2v4TIUuMIKJx/L8JOS5rJqaTippgcafUiKbHtpa8me+yXOFm
	kIU+Z9+u2aj74drDu8y1DeH+LETX76tCdznGZ4+YlkWpfkQ/eKhz2azKIo4cYkqiUextNdT1vNh
	3e4Hg4Bayo/rep78y6alVunelQh/Fiu6YJQ8rSOBqYpKk7jlGo3XPfizOwnDl7MDZXOUxnmX+OL
	vmF7qo40j7z2rZSUO4kd/fykzwP3yM959T3vLw==
X-Received: by 2002:a05:622a:5a8d:b0:509:1c2c:866 with SMTP id
 d75a77b69052e-50b83d1af72mr10972521cf.11.1774441014886; Wed, 25 Mar 2026
 05:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260325113138.4171430-1-sebastianene@google.com>
 <acPIdoA8oc7T8wKX@google.com> <acPJ3Z9hDKc0Sm2t@google.com>
In-Reply-To: <acPJ3Z9hDKc0Sm2t@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Mar 2026 12:16:17 +0000
X-Gm-Features: AQROBzAMJ0mLdR0624TEieVBSiHs3RBFsNy7Xl2T_dOXjsqgRi5JInx2E5cEcKU
Message-ID: <CA+EHjTzeRiUvhDwAExpscWJfPNoRujeRAJ5dEDV4SMpOJK1K6A@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
To: Sebastian Ene <sebastianene@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, catalin.marinas@arm.com, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_051656_819172_2B99F2F0 
X-CRM114-Status: GOOD (  29.78  )
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

On Wed, 25 Mar 2026 at 11:41, Sebastian Ene <sebastianene@google.com> wrote:
>
> On Wed, Mar 25, 2026 at 11:35:18AM +0000, Vincent Donnefort wrote:
> > On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> > > The ARM Service Calling Convention (SMCCC) specifies that the function
> > > identifier and parameters should be passed in registers, leaving the
> > > 16-bit immediate field of the SMC instruction un-handled.
> > > Currently, our pKVM handler ignores the immediate value, which could lead
> > > to non-compliant software relying on implementation-defined behavior.
> > > Enforce the host kernel running under pKVM to use an immediate value
> > > of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> > > error code back to the caller.
> > >
> > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > ---
> > > v1 -> v2:
> > >
> > >  - Dropped injecting an UNDEF and return an error instead
> > >    (SMCCC_RET_NOT_SUPPORTED)
> > >  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
> > >  - Updated the title of the commit message from:
> > >    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
> > >     smc with imm16 != 0
> >
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index e7790097db93..4ffe30fd8707 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -762,6 +762,12 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
> > >             handle_host_hcall(host_ctxt);
> > >             break;
> > >     case ESR_ELx_EC_SMC64:
> > > +           if (ESR_ELx_xVC_IMM_MASK & esr) {
> > > +                   cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> > > +                   kvm_skip_host_instr();
> > > +                   break;
> > > +           }
> > > +
> >
> > I wonder if it isn't better to move that into handle_host_smc() as this is part
> > of how we handle the SMC after all? (and it calls that kvm_skip_host_instr()
> > already)
> >
>
> I was thinking of doing that as well but I prefer this since we don't
> have to look again at the esr in the callee.

This is a non-trivial amount of code to have in a switch. Can you
please put it in a helper?

Thanks,
/fuad

>
> > >             handle_host_smc(host_ctxt);
> > >             break;
> > >     case ESR_ELx_EC_IABT_LOW:
> > > --
> > > 2.53.0.1018.g2bb0e51243-goog
> > >

