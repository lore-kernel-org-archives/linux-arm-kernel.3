Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA83C47BF6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu154TMX/+mXm3su25sIKI5TQFzYMOjfJ7G1hsxByO0=; b=bUEv4f2rZRbYjdokpuJeLxCJwE
	3jormBUZY7Ab9shkOrEj9eTggvrEfcAyWg13sedRdBiVmXuwF0fAF+pOj9NWdo5tg55JLUEdlMuWO
	xzXrYWzp4eBN4lkI+wB13PgPH6hOvq67PmBTuN0/lX9PSNcOFVJAZj+KMEVq004vxvJuokhIXpRZh
	I7u2fLF2Sxz23pcDGvBkoEZubVt5kwkJuRjvzORsRCwMsu0SLJMufGw4Edt+oOlXomJ7JOwaOPwYL
	2qimPIpqK0QNWt2J41+xkposvdJ+SsTTNzxo5lQMfruycsTHaH+R9b82KQkNzJdGi8ysrLTEdGMyY
	IKFPlpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7gt-0000000DFTG-3dUV;
	Tue, 06 Jan 2026 14:05:43 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7gr-0000000DFRZ-02GP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:05:42 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7cac8231d4eso553288a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767708340; x=1768313140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu154TMX/+mXm3su25sIKI5TQFzYMOjfJ7G1hsxByO0=;
        b=PC4vRdw0U/s1aey4HagwTnsfH5k1SIEXy3o1gm1Ue42qmikHKO2beL8PHZa1qN1lWB
         q9lHeTJXhzmyczUxCqX0cPn23wceaLtKP61Xg/tXtbdDrrh2Idzmst3KTnwyHXy2M0hD
         WpvCqP7YShjFIV2YeOU7ePqxDh3B0F9XwtI5ipByhLvm9VzW1Gi5LQPbLVNA5YrMh+TO
         F/h8fUI4YFT3k71st96vmaZHblfuPn1rq/RQ+wuXQb5W5YBt9IFE95fv1CN3JJqoqj7p
         UeXtyQbCLkCtfGNAbhGvvE62aJiZHD27jZpicslrDuO8X17OqQQMDO1znZRzlMriNwQ4
         0pVw==
X-Forwarded-Encrypted: i=1; AJvYcCU0dNPjvo9fmmYJGpDWeKFcfgw8+zS8Adcsm3V5kq7gt/7srE02vf1i++GBesOQJjd3J1mKs4kOF3o+ho26IUUP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo2ENgWntXZ4QQhfzCW/JEM90zIQYQ6I1gb1BgiDzIkkRhbgXl
	eoFvIFPvIvTfjNCI33orVZl6VOASEtbs9s7xZ54OkP6ZJ493804gGlI+
X-Gm-Gg: AY/fxX5KsUf6vZDXSzxsiVGfSKt7MEc37IKlbMPweokgGVQ8UpQmMj6X3JOexZChcHC
	B1trxigOHRkvy1/ELcq3Y0aCPWX4HHVefOltqj40aF/JRMkU1vXY2oyCuD6G7tRDql/lGhCMBNM
	GRF9ghTkVZurC5aJ7uAbEDWpmhpuOzWTeX7I0aYSJESd80IOAFkTLiPpn6rOVZE4EqeNCM/IeRi
	TyGRClOAeGt/VpDCA3KEKpBevPqf8B97WwnaRIKc+oXvYqbQc6Pp8xw2zCUzwdG2MQAj4P1qEq6
	SHnoXYgNUDd3aggQH8omrfVUqDkTJizB1UXK6kSMFWQqBQONC2BZVqR4O+wqFSN5+U0SCBbWOg2
	WjCA/5Zq8BcXHrFVhVoat0MV4+LnTP6/6tpPRyliTk5Nv0JtX3tj4VZn3QLdvOpfEa/2hTQPrAp
	gIbJnYOdtIbtL3cw==
X-Google-Smtp-Source: AGHT+IFAyCOognsDglACCwRtgGmfQBOzfISqmFQxoBN8Ni16ip7RMf//hSvC9Q3nMRwn6KHPU/PCow==
X-Received: by 2002:a05:6830:439e:b0:7c7:827f:872b with SMTP id 46e09a7af769-7ce46767c8fmr2483407a34.37.1767708339811;
        Tue, 06 Jan 2026 06:05:39 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:54::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47832780sm1459846a34.12.2026.01.06.06.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:05:39 -0800 (PST)
Date: Tue, 6 Jan 2026 06:05:37 -0800
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Laura Abbott <labbott@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@meta.com, 
	puranjay@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Disable branch profiling for all arm64 code
Message-ID: <tj43kozcibuidfzoqzrvk6gsxylddfpyftkdiy7xb2zm7yncx5@z33xu7tavuts>
References: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
 <aVz-NHMG7rSJ9u1N@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVz-NHMG7rSJ9u1N@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_060541_049530_86A64EF8 
X-CRM114-Status: GOOD (  22.34  )
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

On Tue, Jan 06, 2026 at 12:21:47PM +0000, Mark Rutland wrote:
> On Tue, Jan 06, 2026 at 02:16:35AM -0800, Breno Leitao wrote:
> > The arm64 kernel doesn't boot with annotated branches
> > (PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.
> > 
> > Bisecting it, I found that disabling branch profiling in arch/arm64/mm
> > solved the problem. Narrowing down a bit further, I found that
> > physaddr.c is the file that needs to have branch profiling disabled to
> > get the machine to boot.
> > 
> > I suspect that it might invoke some ftrace helper very early in the boot
> > process and ftrace is still not enabled(!?).
> > 
> > Rather than playing whack-a-mole with individual files, disable branch
> > profiling for the entire arch/arm64 tree, similar to what x86 already
> > does in arch/x86/Kbuild.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: ec6d06efb0bac ("arm64: Add support for CONFIG_DEBUG_VIRTUAL")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> I don't think ec6d06efb0bac is to blame here, and CONFIG_DEBUG_VIRTUAL
> is unsound in a number of places, so I'd prefer to remove that Fixes tag
> and backport this for all stable trees.

That is fair, thanks for the review.

Should I submit a new version without the fixes tag, or, do you guys do
it while merging the patch?

thanks
--breno

