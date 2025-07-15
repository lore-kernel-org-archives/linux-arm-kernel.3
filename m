Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7636C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yL4wSRtPtkNOyj5ARmviH3RFGE0B4hQu0q3BGeMkrXY=; b=ekUaAXfKGa6qXV3vNDc+RA5Gc9
	ErwqpAgGId4LMMLhLHqDNL+/apuxPfvlAMZZ5OLvmbyP7LlFV3FqLbHfSzq6J+XhYsz8syxjQkdFl
	yMg2tT7jnDbI9MPPtVoKXEm3Jfgb6Rw+pJaNNjScoI0xt5YT8ys8xzMWHOXTT2oepCc5KOubYWKhy
	uh4fMaV6ocgLAIGqMj/phfqnSmjdM44nbd+ClkXa7KMBW//781TGMaOZZCbiEyGjUjYa8KpIBA0FB
	IKmTZ61z+0G1yclA9a16JasxBjMSJaVupGhILBW2HfQugK19bh1nQaoNf8XU0S+j9nUiNR3Gwzhez
	CpTcgunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBN-000000061K6-3Emj;
	Tue, 15 Jul 2025 19:19:17 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiDo-00000005hc6-2wr3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:09:38 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso8840132a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 09:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595775; x=1753200575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL4wSRtPtkNOyj5ARmviH3RFGE0B4hQu0q3BGeMkrXY=;
        b=eqjHfux2vttZytxHM2y039nn58R78NfSG/D1DwCHTeUnxP6x8xwZmAL86IZqvqJAOW
         rFzYIDXXooSZIUOqbQlOO281aYgG9NaKl7TJ43nfi3h+WZzBM56zZDquHcJv4oj8j5j3
         +DhXYz9xev2m3QtJDyJinVNXdo71VNathIXmNEZbwW65ZnP0s6SxPTngBIa2uZwuUsRM
         RYi/QNdvcgF8XbYiGFijJvILV0asrd6fTYzt4LvYGx9Ddwas1F4L0ivNB9LXZTxvUVji
         mTAk92h7ncouInV5WXbjEIwhbo7inN6QsmXpQOD5k+clUG8ZOWptgb5bvV72ZWhj61x/
         +Dbw==
X-Forwarded-Encrypted: i=1; AJvYcCXdREpEoBoe93snimnwgNuXwgqhLYNEoNXnKVZhV5OpfXUD4hKAoX+2eYzfowhIW+1zM8xT+SQcXc+tUgGsxEWu@lists.infradead.org
X-Gm-Message-State: AOJu0YzM4iqmlACVR2y94zLryfROph3a8uGHCvpnEXa2+o5y3dtxueq6
	HhQKFYyj5AgJEUHRQzqkoy8rFQG7lpn5Kh0POUJsugvz+5b0+I3WbxjA01ah9w==
X-Gm-Gg: ASbGncvagcnK0p8ZVyztKJ4qFVjoqg0MJkVAhxLijbW40FTKCZvH646IXyZ+WbWpKZf
	UUSC16wIFzVdD6WnQbKd95+WMAffR7/Ps5rRtulf4sxyiJdTxHF/5QvTwxQCYfVB2LQP1ep30RF
	xbEfgQPhjBtXsiblNM3HGXsp3aEBWfes0DNAhnHxqAOP5IBXWHtnkNHEaQl9IF08BkRTti75Lkj
	5oWKBZVq3H11WeYQxPT3HCTBiZ1W4ecyl42fwfBWgJBmuNVt2rFKRxqHBULFZnYfJWt8dT08LML
	+3aPgSsVXc990xr547ebMavVQofhRTXGIzZ7+gXUwKzNNesv/rAoNrYeRz4NW9tRY37iP2CPpbU
	Nv/NoT6/8q8Io4bv5iz+5uvY=
X-Google-Smtp-Source: AGHT+IE1uu7wwwSQuObs3SyvQf1CQnWwPhqS50eFzItnbnbLMZnj4W2EefIlYTGUtl2pAQDm0q9ODA==
X-Received: by 2002:a17:907:944c:b0:ae0:b3be:f214 with SMTP id a640c23a62f3a-ae9c994a31emr8267466b.9.1752595774660;
        Tue, 15 Jul 2025 09:09:34 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82962acsm1025469666b.139.2025.07.15.09.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:09:34 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:09:32 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	osandov@fb.com, leo.yan@arm.com, rmikey@meta.com
Subject: Re: [PATCH] arm64: traps: Mark kernel as tainted on SError panic
Message-ID: <dswbcfrlrrhikpjjrr2aluipb7qn4stfmrept27nr2b4egeg3x@pgt73zwmfm7x>
References: <20250710-arm_serror-v1-1-2a3def3740d7@debian.org>
 <aHQ3Lu27_mLfR8Ke@willie-the-truck>
 <t3v2xvjal67bl5dwyatwgf46tnr2ikxnq62iqmda544llcd7oh@ws3nnrfp7r5p>
 <aHZfZbxLGyFjJpNo@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHZfZbxLGyFjJpNo@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_090936_743057_E0519B95 
X-CRM114-Status: GOOD (  27.48  )
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

On Tue, Jul 15, 2025 at 03:02:13PM +0100, Will Deacon wrote:
> On Mon, Jul 14, 2025 at 05:26:43AM -0700, Breno Leitao wrote:
> > On Sun, Jul 13, 2025 at 11:46:06PM +0100, Will Deacon wrote:
> > > On Thu, Jul 10, 2025 at 03:46:35AM -0700, Breno Leitao wrote:
> > 
> > > > --- a/arch/arm64/kernel/traps.c
> > > > +++ b/arch/arm64/kernel/traps.c
> > > > @@ -931,6 +931,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
> > > >  
> > > >  void __noreturn arm64_serror_panic(struct pt_regs *regs, unsigned long esr)
> > > >  {
> > > > +	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
> > > >  	console_verbose();
> > > >  
> > > >  	pr_crit("SError Interrupt on CPU%d, code 0x%016lx -- %s\n",
> > > 
> > > If we're going to taint for SError, shouldn't we also taint for an
> > > unclaimed SEA?
> > 
> > Yes. I was not very familiar with SEA errors, given I haven't seen on in
> > production yet, but, reading about it, that is another seems to crash
> > the system due to hardware errors, thus, we want to taint MACHINE_CHECK.
> > 
> > What about this?
> > 
> > 	Author: Breno Leitao <leitao@debian.org>
> > 	Date:   Mon Jul 14 05:16:55 2025 -0700
> > 
> > 	arm64: Taint kernel on fatal hardware error in do_sea()
> > 
> > 	This patch updates the do_sea() handler to taint the kernel with
> > 	TAINT_MACHINE_CHECK when a fatal hardware error is detected and
> > 	reported through Synchronous External Abort (SEA). By marking
> > 	the kernel as tainted at the point of error, we improve
> > 	post-mortem diagnostics and make it clear that a machine check
> > 	or unrecoverable hardware fault has occurred.
> > 
> > 	Suggested-by: Will Deacon <will@kernel.org>
> > 	Signed-off-by: Breno Leitao <leitao@debian.org>
> > 
> > 	diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > 	index 11eb8d1adc84..f590dc71ce99 100644
> > 	--- a/arch/arm64/mm/fault.c
> > 	+++ b/arch/arm64/mm/fault.c
> > 	@@ -838,6 +838,7 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > 			*/
> > 			siaddr  = untagged_addr(far);
> > 		}
> > 	+	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
> > 		arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
> > 
> > 		return 0;
> 
> Yeah, I reckon so. Probably just fold these into a single patch, though.

Thanks. I test it better tomorrow, then send it.

Thanks for the suggestions,
--breno

