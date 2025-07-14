Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F386C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXM71qb1m31nhbK/n/pQAgPefokwfSf5HDbhfJws+L8=; b=luvigTVy5pP6doZNuILbnnYHOG
	L7ZKWYo36dA2qaU9BMNpcSkEEwlvOmMJgKV817S2KgrAR6P4OfcUne/4brPdUGX4duGxG6FvSuMcz
	ZPd0clo44KluzOEa1r9o2WrEAuAYZ239DR6dcOAFjynH0PZChT/lB0WEkUdHmjkIxNb2TIpUF90rY
	FceU+yEMvj8+QwAqjw/vaqF130UpDiQcZzKNvi1YGzAFpmO8/vUwMIBQYFE5KTIjBaf6N0DnBsf0u
	V6Q4DFURdWV9mx8lhQdL6Yeke7zjntZQ49V5ZqS3egpKr59fNXNIbAowGRrrW64RVES6luRONiRp5
	zLT02b8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIwr-00000002Erl-0ol5;
	Mon, 14 Jul 2025 13:10:25 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGd-000000029ll-40nk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:49 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae223591067so745850666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496006; x=1753100806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXM71qb1m31nhbK/n/pQAgPefokwfSf5HDbhfJws+L8=;
        b=cMw8kHar9WWBrVChvmSkfubkHy0qchqmM6D+p9TEIroVx+cNrV6Cm2+uqF6rm6aIdN
         cXHWRdUCO7RsbbTvhIz//KQkrbqUGTR2Q78/9sAl8UvrsnKxeTu9VegOJ3CKeUX4GEvr
         wnSA6HdOUzAluij01IijkvQ/OhEUq6QZHghA8M23x/Pi/ytMnW/eB3X1zxZuMkEaaAVF
         uUThvjW/Eq5aj2MOuBH/2c5nf84ljfbIjIfevGQPsdkUyjdheePFeIwsQsFQf2EmI/X5
         n6+1mUFiN0k+/DLMteskT66aeebdR6fvX1u8NiCxb/5RGIuvkGX1YhzimNaP7Wwcm6j9
         twzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNCDfVeGyEv0YQ4aD0DrI6/pkNRMbZTgpeCA8noecx8t/xPetjM1AXO28K5SnHTIRJyw/DD1WEpmNhVdUcEibx@lists.infradead.org
X-Gm-Message-State: AOJu0YyN4SUbijPVY2Tk5TH1m4DarLX1tcqiDsf9Ni1y3QaXaDFFHku6
	UDLY7e33Tbm5HHOP+YBIF7Y7++I8x2lDkms9XIwexgCKKjyZ/Wb2zcJZ
X-Gm-Gg: ASbGncuSEHsooDfK5ctnuSMeVJCv8Y1YKqccfsJzIy+T6mHmHEdoi/BYp1RqPWcYQUA
	Rys/+dISFgRrkafWyZ4UafyNbsnavkNkBaHBMJhsYWSPC//B2L2c8Sd7HkgQUPpWQaMm4D9p0W3
	K7GLsr41dbtsk0IRZGDLI0YHX7PlQ1vBn1AR8R7GEpBEXw89BXr7WcQGvo9h99frjI4XJOVsx1N
	ccIiUHybpW2vaX0Xck/CGaBcaelTaxBN0X05iHGakKWebuatx0wAVi8AyXqsdgxecUuIB33cOMt
	LYDaQzaPa0JxLZv7pMwR1ZS0dhRcl3Fgy4TNLkGWZ4mOJIL8F4qaKdV4iTTgtREOBkne5l0G7/s
	9AC6VAIPbA6ya
X-Google-Smtp-Source: AGHT+IEoLgaDTKdxcttV8XzUYG/9ga2nLNSfR1c0WihvMvxKRTbmzBUroVW9/c2rdS7BKkmgYDCKXQ==
X-Received: by 2002:a17:906:fe0c:b0:ae3:5212:c906 with SMTP id a640c23a62f3a-ae6fbe13960mr1432723166b.10.1752496005605;
        Mon, 14 Jul 2025 05:26:45 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91a1bsm811147066b.29.2025.07.14.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:26:45 -0700 (PDT)
Date: Mon, 14 Jul 2025 05:26:43 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	osandov@fb.com, leo.yan@arm.com, rmikey@meta.com
Subject: Re: [PATCH] arm64: traps: Mark kernel as tainted on SError panic
Message-ID: <t3v2xvjal67bl5dwyatwgf46tnr2ikxnq62iqmda544llcd7oh@ws3nnrfp7r5p>
References: <20250710-arm_serror-v1-1-2a3def3740d7@debian.org>
 <aHQ3Lu27_mLfR8Ke@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHQ3Lu27_mLfR8Ke@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052648_026740_293501F7 
X-CRM114-Status: GOOD (  18.16  )
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

Hello Will,

On Sun, Jul 13, 2025 at 11:46:06PM +0100, Will Deacon wrote:
> On Thu, Jul 10, 2025 at 03:46:35AM -0700, Breno Leitao wrote:

> > --- a/arch/arm64/kernel/traps.c
> > +++ b/arch/arm64/kernel/traps.c
> > @@ -931,6 +931,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
> >  
> >  void __noreturn arm64_serror_panic(struct pt_regs *regs, unsigned long esr)
> >  {
> > +	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
> >  	console_verbose();
> >  
> >  	pr_crit("SError Interrupt on CPU%d, code 0x%016lx -- %s\n",
> 
> If we're going to taint for SError, shouldn't we also taint for an
> unclaimed SEA?

Yes. I was not very familiar with SEA errors, given I haven't seen on in
production yet, but, reading about it, that is another seems to crash
the system due to hardware errors, thus, we want to taint MACHINE_CHECK.

What about this?

	Author: Breno Leitao <leitao@debian.org>
	Date:   Mon Jul 14 05:16:55 2025 -0700

	arm64: Taint kernel on fatal hardware error in do_sea()

	This patch updates the do_sea() handler to taint the kernel with
	TAINT_MACHINE_CHECK when a fatal hardware error is detected and
	reported through Synchronous External Abort (SEA). By marking
	the kernel as tainted at the point of error, we improve
	post-mortem diagnostics and make it clear that a machine check
	or unrecoverable hardware fault has occurred.

	Suggested-by: Will Deacon <will@kernel.org>
	Signed-off-by: Breno Leitao <leitao@debian.org>

	diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
	index 11eb8d1adc84..f590dc71ce99 100644
	--- a/arch/arm64/mm/fault.c
	+++ b/arch/arm64/mm/fault.c
	@@ -838,6 +838,7 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
			*/
			siaddr  = untagged_addr(far);
		}
	+	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
		arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);

		return 0;

Thanks for the suggestion,
--breno

