Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B310C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4cNJ7zUGr7tO+W7VEbJ8gglNZQhXjP3xsTkrEaO8DE=; b=xK6b6CLAgHakdL8r9A5LOMrtii
	jRbyZi8ii2BmF5jIFeBPLQKQBnzTV+xE63H9WoUiqqhLasKlDI3pxiEjU90Bl+/KdyecvV02ayMkD
	otK5aXmuSa9L8Q3nnLWhv//sqfL9Q3pKcjnQ1QcmlxKIrTovcgbU51tPCmQLsvWT6Z0pXjVEYu0pH
	F4Bsd4mwXQz2DZ8S8pYI1jKoLtDKC1E6vu55yCrHXUl/TRlbyG6Wvw6nlAiWNfaNmBd2pEQ7zVHAJ
	jr6xe/dB/dL2s+RBraYvYOjTMLz9slt/BDAIUOowqoqRFaUg6QNxAaTMI6beMlMNaR0poQzKjPLDJ
	3YI1voPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAOr-0000000AKcs-39CN;
	Tue, 06 May 2025 04:59:25 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5CL-000000092wN-0MNS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:26:11 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso2992146b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 16:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746487568; x=1747092368; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4cNJ7zUGr7tO+W7VEbJ8gglNZQhXjP3xsTkrEaO8DE=;
        b=si0x0RcpgosbSGQa672FgtWarAd0P5fqpUsCQKTj26tdzhI47gZkT6ppDfMKz61T7y
         RGiFzemT6YI6sfESjzHzlXFKyLSXbO+5dlAubrDzmocaqYAMZQNxYeDosBUUczA7v0NB
         sDOe3rl/tlipc7BUG2REsM+xq6wZVlVkPiAKH6Nak6n1AmgL+xFCS15/RfUnO6Gy51II
         1ApaWZf3f8QNpF6Hdr77GCAAW74/RMVrC++bvF00XIyPEiYeZZVVbkgs6d6MnqiML/+Q
         O/XCDQh7+pNXEyutGfw5dYEGL1Qvxe2eIB/v2HSFLPrpXWg6tJsg0446EC4CoemipwLX
         Qj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487568; x=1747092368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4cNJ7zUGr7tO+W7VEbJ8gglNZQhXjP3xsTkrEaO8DE=;
        b=hRYQJAew5/g6RiikgYtFI6ZxoyOPYSbrbeeoCmyZqM7JgBDenZoyPIU/by9dMMZ7WE
         d96Vn/y3IMOXq4MKSYgjiOZIZ8TyLPhi/eApT57Iqp+tRawLKdYclHnNcnb3uT5aT7ui
         Q3s4wLjwWnI5TfTlGcV2CrKi1GYVWMEXH6/PiaeSRnQ1K7Z8DSFB4b/CADV5G0r4QAvJ
         UmYaYSdkDe4FB8s28+xMVXKxUVc6DB4pUJrayhRX6uixKRX/tgTJpJADmNB6nfXQQSBX
         CqR6OwV+JKcOxB1qltxBYw7MWig+hJ1dAHXhA+hNxebKO9bQAdKLIuO60a5ropRrTb0f
         uYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWipzpmJduDwLLHs8LqnaeftdUspxApsMmwJa0mKhRzwrLCMNDnTfyzVKOnjzPGQE1OwLl2e1CrWo7d3FeQN4Zs@lists.infradead.org
X-Gm-Message-State: AOJu0YzdjLXIwub2dZHpOV3NN5LyqpCiEEMND6DvShD/ufhL8MogaXXE
	pm4BSaivI6kGL7dGtBFN4w9PQ26/s+AApa8jpXb4dvUQLPROIIcHjW80ejbG+YBQ1Zj4AmbZ9gD
	NcA==
X-Google-Smtp-Source: AGHT+IFs82iZrMFUBe/Um77R6mZCtOyNM2zzn8fFKGEUvfFdFbOehTmWdf7D5nF7WYhoGzjYDtAoO24FpnA=
X-Received: from pfoc5.prod.google.com ([2002:aa7:8805:0:b0:73c:6d5:ce4c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:600d:b0:736:2d84:74da
 with SMTP id d2e1a72fcca58-740919e16d9mr1113768b3a.10.1746487567641; Mon, 05
 May 2025 16:26:07 -0700 (PDT)
Date: Mon, 5 May 2025 16:26:06 -0700
In-Reply-To: <20250505194836.GB1168139.vipinsh@google.com>
Mime-Version: 1.0
References: <20250222005943.3348627-1-vipinsh@google.com> <20250222005943.3348627-3-vipinsh@google.com>
 <aBKWmRDBrjeZhAW0@google.com> <20250505194836.GB1168139.vipinsh@google.com>
Message-ID: <aBlJDjBe3LXT8mbK@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Create KVM selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_162609_132129_8CD69109 
X-CRM114-Status: GOOD (  32.56  )
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

On Mon, May 05, 2025, Vipin Sharma wrote:
> On 2025-04-30 14:31:05, Sean Christopherson wrote:
> > Printing the timestamps to the console isn't terrible interesting, and IMO isn't
> > at all worth the noise.
> > 
> > The PID is nice, but it needs to be printed _before_ the test finishes, and it
> > needs to track the PID of the test.  If getting that working is non-trivial,
> > definitely punt it for the initial commit.
> > 
> > And presumably INFO is the level of logging.  That needs to go.
> > 
> 
> Instead of removing timestamp, I can just print HH:MM:SS, I think it
> provides value in seeing how fast runner and tests are executing.

I can probably live with that. :-)

> > I think we should also provide controls for the verbosity of the output.  E.g. to
> > skip printing tests that pass entirely.  My vote would be for a collection of
> > boolean knobs, i.e. not a log_level or whatever, because inevitably we'll end up
> > with output that isn't strictly "increasing".
> > 
> > Adding a param to disable printing of passed tests is presumably trivial, so maybe
> > do that for the initial commit, and then we can work on the fancier stuff?
> 
> You mean some command line options like:
> 	testrunner --print-passed --print-failed
> 	testrunner --print-skipped
> 	testrunner --print-timeouts
> 	testrunner --quiet

Ya, something like that.

> I can provide few options in the first commit, and then later we can
> extend it based on usages.

+1 

> > A not-quite-mandatory, but very-nice-to-have feature would be the ability to
> > display which tests Passed/Failed/Skipped/Timed Out/Incomplete, with command line
> > knobs for each.  My vote is for everything but Passed on-by-default, though it's
> > easy enough to put a light wrapper around this (which I'll do no matter what), so
> > my preference for the default doesn't matter all that much.
> > 
> > That could tie into the above idea of grabbing keys to print such information on-demand.
> > 
> 
> This will be very involved feature, lets punt it to a later versions, if
> needed.

Sounds good.

> > The runner should have an (on-by-default?) option to abort if the output directory
> > already exists, e.g. so that users don't clobber previous runs.  And/or an option
> > to append a timestamp, e.g. $result.yyyy.mm.dd.MM.SS, so that all users don't end
> > up writing the same wrapper to generate a timestamp.
> > 
> > Having a no-timestamp + overwrite mode is also useful, e.g. when I'm running in
> > a more "interactive" mode where I'm doing initial testing of something, and I
> > don't care about
> > 
> 
> We can provide user an option like:
> 	testrunner --output result_TIME
> 
> then internally runner will replace TIME with the current time?

Why overload --output and then have to do more parsing?  I assume adding options
is easy, so presumably --append-timestamp would be just as easy to add.

> If user doesn't provide _TIME then we can overwrite the directory
> provided.

I don't see any reason to tie those two together.  Again, on the assumption that
adding options is mechaincally easy, I'd much rather have --overwrite or whatever.

In general, so long as it doesn't meaningfully increase complexity, make the
interface as flexible as possible so that the runner has a decent chance of being
able to handle whatever use cases people come up with, without needing constant
tweaking and churn.

