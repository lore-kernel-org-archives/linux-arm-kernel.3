Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198FDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhNqSOC5wF7s/DqPJd5V4+i1iqYVvZl6mD6sr2HXhSY=; b=bHFxeQgIrQrGLv+VmG79wEu/4m
	s7NnVo8MXoxJ1OIpDFE51duN0BVHSJZmf6yzr6dJadttoUGw0vlyQnWRLDQJKpXnQO/bkwNyNWFvd
	ryBkOv7BLziovBXun+74W4/cBXa1DKwTRQ2gLZ4OkGzsnomqOLdzwT6f4eorPyeag6AfrviuPPflU
	waHFdwmjyitd1iMfFoE92o91W7RI/ArGMPotNWhZi9ZYGyqNX6fMwE5B7OczvKCMC5iA4kh61RfTf
	T6iSmIT7kKLWzZbtPm2YZGZ4U5IvoFvQ+8gFr7cnfdWGG+Dnclke57ittasjnV+ZA+Hu/BsGIgkvQ
	SwchFPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG3S-0000000BeX5-20pi;
	Tue, 06 May 2025 11:01:42 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEcT-0000000BNdR-1GH9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:29:46 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7082e46880eso46460857b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746523784; x=1747128584; darn=lists.infradead.org;
        h=content-transfer-encoding:lines:status:content-disposition
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNqSOC5wF7s/DqPJd5V4+i1iqYVvZl6mD6sr2HXhSY=;
        b=h3adcOIkrqQnJZABS4a0msPWR1+jW0e+JaiyQMJJa5A03psTxrKW/uBGT/tSXB/yba
         Esl1DYnBJW2WsiXhpX42XYDPQxFlJX8gm8NUEgS+dgUtsZ2DwQSBk3A9hEePA9Kf2HeC
         VKvy6DTOSLCGlwYRO7uo6mKc7st5a4vmv74YLjn15HqkUMkZHku4wfS1TjF3HYdng+41
         o5QSl4VbqEvSivFVx+Rf6hgU2rhLa7+/dJBYThIiR5HtTVrCoCOXPz/5q65F5bCNgHFW
         a/b0Q9iwp+758L8ZuIhN0IUNynzUcuMVB92Ovx+jgdj+KWJ1/Z0wkWXN/q0cNoMGGcgp
         +DnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523784; x=1747128584;
        h=content-transfer-encoding:lines:status:content-disposition
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNqSOC5wF7s/DqPJd5V4+i1iqYVvZl6mD6sr2HXhSY=;
        b=VIuJCh3t/eqkP8wmt2V1W4ttpq3tdnCtwNRQ+Q8hd+NjtFDSFPVIX5+SPHzS/RVvq5
         CtQrhAeFOolLJiHBAncXz8+luHUDcjM6f36UfDBe47FxYeZoc52l8MYyFGFT9LflYGmZ
         kJUFW7DcFHFSsdBaqV7Hvp1o/jPF9NnSwN2fv/CdlWB2rQ4m+kUZLPCLfDVC919zGisg
         hOccBNTNZHJQN6ju5ZDKWuovRob4st7nESbx0NVbMH9lWHKIIijEAGvv8+AQHHiS08I+
         pBkoDsL5p/eJbSKxC3BsMe025kUYw3rQOQtSoPrH7OW9i/BFAY3ykHU2mtkX/wo+r11V
         EOMA==
X-Forwarded-Encrypted: i=1; AJvYcCUvQyf9j8tfLYRHMwBO/HXMwOyQ4kEWQBTB160AGydUUXNyk4IN0PsLNM/A9k0ra+fFnArYNx2+qzw0qqluCwY8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1sh6acXF1mNZ6kMgdOX5dhMSyyG1kquXm/OnHkUbFTxkj5Wr4
	/Cd1DBCEtVH872zJLaN5UDhAlGDeYAauhMGe6VAiWBF+lBPTReUfJFPGqzKxd30=
X-Gm-Gg: ASbGnct7O9q1v92iA7M9X6Wz8ukSSsMVJLFljpOVGaLFmM+7BXIQPLm8NOtB7CGi9HY
	+og/Vx1TNHT9ea0LFgG75n2JmnDF+wddNRljMJSj3nBSyLwuDtY3ua0rcHQemDUBjHnA0kgNkzF
	JRudvJ+HZmACwhgUTrtbU0UiF2nkvFSadpfXfYLIIJT6/CjGyEhWfRLKpv4woMhJSaHpVxCg+kv
	+HMkqw8Ifwhm9hm06t5sk9aDnu+w08N1zeZK3y7MO81vT8RYOE+HWFRNIpaxiXw566HMHQeR/jl
	WI0LoCfkk25wYXrzshMcnjhobVubkl/0aAj1/NWUgw==
X-Google-Smtp-Source: AGHT+IEiCZCpczG2uSgoLqesdF0FcNte2ltiX3d2EMvQ1sinI9JkU0e+3u0ocUrtlOW8Mx/0KHeawQ==
X-Received: by 2002:a05:690c:6407:b0:700:a93e:3302 with SMTP id 00721157ae682-70919d40189mr34612227b3.37.1746523783798;
        Tue, 06 May 2025 02:29:43 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c3f3d939sm26255167b3.45.2025.05.06.02.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:29:43 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: maz@kernel.org
Cc: armellel@google.com,
	arve@android.com,
	catalin.marinas@arm.com,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	perl@immunant.com,
	qperret@google.com,
	sebastianene@google.com,
	sudeep.holla@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	Per Larsen <perlarsen@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Date: Tue,  6 May 2025 02:29:41 -0700
Message-ID: <aBnNXyJn818ZEKOS@google.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <86r017h00e.wl-maz@kernel.org>
References: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com> <86r017h00e.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-References: <86r017h00e.wl-maz@kernel.org>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022945_511861_1732B057 
X-CRM114-Status: GOOD (  36.97  )
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

From: Per Larsen <perlarsen@google.com>

On Fri, May 02, 2025 at 09:47:45AM +0100, Marc Zyngier wrote:
> On Fri, 02 May 2025 04:52:39 +0100,
> Per Larsen <perl@immunant.com> wrote:
> > 
> > FF-A implementations with the same major version must interoperate with
> > earlier minor versions per DEN0077A 1.2 REL0 13.2.1 but FF-A version 1.1
> > broke the ABI on several structures and 1.2 relies on SMCCC 1.2 is not
> > backwards compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> > 
> > If we return the negotiated hypervisor version when the host requests a
> > lesser minor version, the host will rely on the FF-A interoperability
> > rules. Since the hypervisor does not currently have the necessary
> > compatibility paths (e.g. to handle breaking changes to the SMC calling
> > convention), return NOT_SUPPORTED.
> > 
> > Signed-off-by: Per Larsen <perlarsen@google.com>
> > Signed-off-by: Per Larsen <perl@immunant.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 3369dd0c4009..10e88207b78e 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -712,7 +712,24 @@ static void do_ffa_version(struct arm_smccc_res *res,
> > 
> >   hyp_spin_lock(&version_lock);
> >   if (has_version_negotiated) {
> > - res->a0 = hyp_ffa_version;
> > + /*
> > + * FF-A implementations with the same major version must
> > + * interoperate with earlier minor versions per DEN0077A 1.2
> > + * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
> > + * structures and 1.2 relies on SMCCC 1.2 is not backwards
> > + * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> 
> I can't parse this sentence. Missing words?
> 

Yes, I will fix this in v2.

> > + *
> > + * If we return the negotiated hypervisor version when the host
> > + * requests a lesser minor version, the host will rely on the
> > + * aforementioned FF-A interoperability rules. Since the
> > + * hypervisor does not currently have the necessary compatibility
> > + * paths (e.g. to paper over the above-mentioned calling
> > + * convention changes), return NOT_SUPPORTED.
> > + */
> > + if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
> > + res->a0 = FFA_RET_NOT_SUPPORTED;
> > + else
> > + res->a0 = hyp_ffa_version;
> >   goto unlock;
> >   }
> > 
> 
> Something has gone seriously wrong with your email, and the patches
> are badly mangled and unusable. They are also sent as individual
> patches and not as a thread, which is a sign that you didn't send them
> using git. Please fix this for your next posting.
> 

Yes, my apologies. I will use git send-email to post v2.

> More to the meat of the patches: why should the hypervisor paper over
> anything if the spec is broken? Why can't the host just as well decide
> for itself what to do?
> 

Asssuming we drop this patch from the series and apply the rest, the
hypervisor and host can negotiate FF-A 1.2. If the host then calls
FFA_VERSION a second time to request FF-A 1.1, the hypervisor would
return version 1.2 (without this patch). Per the spec, that means the
host is can use the compatibility rules (DEN0077A Sec 13.2.1) to go
ahead and use FF-A 1.1 (every function in 1.A must work in a compatible
way in 1.B if B>A). 

However, the hypervisor negotiated version stays at 1.2 so it will use
SMCCC 1.2 for 64-bit interfaces. The host has no way of knowing this and
might as well assume that the hypervisor was implemented to fall back to
SMCCC 1.1 in this particular case. 

I don't even know that the host will ever try to renegotiate as it is
explicitly not allowed by the FF-A spec. There is no way for the
hypervisor to say, "stay at the negotiated version" so we must return
NOT_SUPPORTED. 

> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 
Thanks,
Per


