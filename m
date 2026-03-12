Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6CA103E2F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 00:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMrrvcXulRZkoBfi9FaZ3WzGUIx2J4qRVHmF1FKtVWA=; b=IcL6NPPQLwIv/aIuSdBCnUBNdU
	EpEZiDw2zPRM9L33U8VgsrzziKPBWfGjQWtoUbDFwVanVniZouNdgffRZsMdrkCa4XPu4g4sZ1tqG
	B6tH+aTSnoEtr/p4TFVxJ0KgnigZsCzbOR0ASnIWtRKq65/T4euQIek9JUFmrLL6ua+oil8SCbkt6
	fU1Ug4Wn9HFs3a7he8V3DsqHjC3NJhWErw5DUrf5T80aFPG2pjRFUOKhfoHNaA2N3B+kgWI7b0Z1b
	QAHG/E3GG8HnH6QUc4zU5Lo1Rr44QLFQPoJCWNYFORMDa5SswbiGT54AzZcxjBWIwmlc+YpPssQmt
	HeAsqdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Tik-0000000CvUr-2S1H;
	Thu, 12 Mar 2026 00:16:10 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Tii-0000000CvUD-0z4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 00:16:09 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-126ea4e9697so2716c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773274567; x=1773879367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMrrvcXulRZkoBfi9FaZ3WzGUIx2J4qRVHmF1FKtVWA=;
        b=T4tU4i+gU6QCc6jaVNap4R6vDC8mYtu5mK9DxuFYT2zyNr2jmaJJ3fqK8HRrIyY4Xb
         zIc65E3O0yboDL22sz+9v5WVrmWAlOB1I5V2LwijbIlAsCDSFmCmzGfXx6I71UFCDagU
         Dt9SbjYumaBBHWILnAn+Vf50orEtyPX7hjjcwEEpu9ICtD3D/tQKrs4TMyrfOGeeKub4
         itsLva5FA9+hZBRMXcpXbMvod7TgATdUeqH6gDK4YMOjKjw4wdeuA4jglUQO3IJ1syq5
         UC+5xKgsujBMboyiJs5yjifjDD+Cv287+QS0k75dAypdfNf7WARozRllPLrBcbJ06Czj
         RZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773274567; x=1773879367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMrrvcXulRZkoBfi9FaZ3WzGUIx2J4qRVHmF1FKtVWA=;
        b=aKIHS9VCpLb5zxQFJYiVEVQWW8jp4ZlfpX7zce1jp20uzp3H/65nrs7A6yod7QinkZ
         Vnmr0pbuCWx1VkqQIiWy1B9/Yv9hbISywYwm18Sl0W98vymUpvSMX1W9rPT6Wz+mMdEf
         HTLKZP1K8tofY5F/ltN77G1be/MEjDVqzC/f6SBcJKMII3WEj+ZrLGs0pgIQMJ6R650X
         znWAUbISsjvJKZzqOFfZzUXHFnNcPNCBz5HkDzauPdtuqh+fQOV2dqb4mVCH8caeYRnO
         wPp7erXrXQ+aL4OJZt7trmY4S2rRAwskKwxx6zBbfgfVZLVxeeMpzTGOzjU05bssLnTT
         Nmlw==
X-Forwarded-Encrypted: i=1; AJvYcCXqeuOymO5wEZcjnx/mXfckslc/UDaVagMnj0SUy2kBSXWf9k5vtu+FlhJc8wL2T5gm2xdQld2Z67m2WGyHI867@lists.infradead.org
X-Gm-Message-State: AOJu0YzgaMAtDYwc2Iym0YFBnVdJVMK8Y4lljCbx68YmnRNv/dB+CV8x
	Ea846305UD+JIy64s3DTA0XaOyqh1AMxscIq5yoy7KSty7WNhb1Pzsf2UgkJjdceUg==
X-Gm-Gg: ATEYQzx5oOmcfnvYgIi8CHqoa7y4LuNC1ALpTTX/d2esEhqF1r4Idi5iQt1BnKTa8Rm
	c+sXYZKwOqr0EOOdbZhfXh/qzkGN8TpRmC8BAFKdCxbxILxPtIacUhF6jb/zn4wIcJKjMoBY+Ek
	AT+cQGRJgEdyUGymHxEYg9KCw886ZhvXEa6FR7AUIPQ07goXoURRow82hk0jEikXo2+b0e8Y5//
	RGdrmts8fe8YKz9dzmrgkghFvZIOqJWkqKKfmJZuqAeQCQ7rwGXESSR32LPKjHygKsBp9YLpGjP
	XpakSR+m6Wv2rGgBQBGXKfem1wKQoXA5o8PEXXEXy1qStoyRF+LObo5QxGLH7IE7YQwpzspwp1a
	FY5LC+dAp0GjGpvZKTBWA4CX0Lcp90Kf3n5VCmVfrjA0n5ob/R9fERVpb32wUtK7y7zcLWGohyV
	dnsuH7n/4MrUZEvalPqL2jXGcob4adKR1CQI+K6xWSyoDsk5YXUZcxIva/Cm3MKA==
X-Received: by 2002:a05:701b:4243:20b0:119:e55a:808a with SMTP id a92af1059eb24-128edc2f354mr29180c88.7.1773274566569;
        Wed, 11 Mar 2026 17:16:06 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa4ecbdsm4377079eec.16.2026.03.11.17.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 17:16:06 -0700 (PDT)
Date: Thu, 12 Mar 2026 00:16:01 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Jens Remus <jremus@linux.ibm.com>, Juergen Gross <jgross@suse.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	David Kaplan <david.kaplan@amd.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	James Morse <james.morse@arm.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>
Subject: Re: [PATCH] static_call: use CFI-compliant return0 stubs
Message-ID: <abIFwSF1RqhC96C2@google.com>
References: <20260309223156.GA73501@google.com>
 <20260311225822.1565895-1-cmllamas@google.com>
 <20260311231406.GZ606826@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311231406.GZ606826@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_171608_312684_BABF7A44 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, Mar 12, 2026 at 12:14:06AM +0100, Peter Zijlstra wrote:
> On Wed, Mar 11, 2026 at 10:57:40PM +0000, Carlos Llamas wrote:
> > Architectures with !HAVE_STATIC_CALL (such as arm64) rely on the generic
> > static_call implementation via indirect calls. In particular, users of
> > DEFINE_STATIC_CALL_RET0, default to the generic __static_call_return0
> > stub to optimize the unset path.
> > 
> > However, __static_call_return0 has a fixed signature of "long (*)(void)"
> > which may not match the expected prototype at callsites. This triggers
> > CFI failures when CONFIG_CFI is enabled. A trivial linux-perf command
> > does it:
> 
> *sigh*...
> 
> And ARM64 can't really do the inline thing because its immediate range
> is too small and it all turns into a mess constructing the address in a
> register and doing an indirect call anyway, right?
> 

Right, the range for the jump is very limited. I _think_ tracepoints
have managed to implement the trampoline work-around:
  arch/arm64/kernel/ftrace.c

So it looks do-able I think but a much complex route.

--
Carlos Llamas

