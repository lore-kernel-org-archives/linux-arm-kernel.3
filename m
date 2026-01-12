Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B47D2505E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37jw5nLaZWVZ6yrJck1zZSSpLqHqkC9MlKG8jIO3uBA=; b=GIbMiS0Dg3662fAALgFqmu3/1x
	4kv5mxCiNaSBwHMsivOsO/KI50zpEXHVIIyBDnbAOoRM9p5ltod517pqx4IQ4qTFP6r0WwjSIOgBq
	ErweqOJlq+npCyhcy8ceY8+8LnzhdGXZVGsOCrUs3kA1kD1oMmJ0D/JUfPGMypJXZ2sTcmlgYLQaI
	Sdx6Wg8SwBzcFltp4Zu1TDVgKMVc/sed7cWFtgPRJk8IYoKMelTX48ITVHIwA3eHLMhEe6x02Y/nv
	tTcj0R7ButHSgpYaW/5vmYWPsw2p2pjT+uJFtUnbzoTIlzcVDqTmvJG3QZGOnHptgx0AQyDpB9pvZ
	fgh9ZY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfERp-000000056Gd-3OWm;
	Mon, 12 Jan 2026 09:42:53 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfERn-000000056FV-09Mb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:42:52 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3ff4acb6eebso3912315fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 01:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210969; x=1768815769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37jw5nLaZWVZ6yrJck1zZSSpLqHqkC9MlKG8jIO3uBA=;
        b=M0mhXDfdV+7AS1E5xo3XD6TGYqKyQfHxXD32pUkenbgJF2dG8MbeZLkkEFhffYxUCY
         GYeVxVKfJYh/2eSwQGLMC25CL+ltvdp1Nqx6luOqSWdQREeSec7OncK7qkrjUsKUVQRd
         3kgJ4duirgQdu7NiMsIulcZk9mf6LNzRLjBTQ9CK1j04Mcm7JClls3wcL21gvIBsY6gA
         yKSpldTFha7rkir3hR4PXfdSheFkGxpwpthHm6E0yEfhTOMrGlSUcdoDPK/+NG2mngfz
         v3SDKACt8WnTFLk2ePjtEHOgNydpt0d97rXGKY/LH8tioj0zfKy92yN+l1mCU6BEG9av
         30uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU/phXMKHqKvJ32rmbtahW2i1s36MnxVqH5brRXEe29N2vyR6riVbVRqeMnrYWzOIoBMXR4tO8U20NznC6GDSR@lists.infradead.org
X-Gm-Message-State: AOJu0YzpwTyGTS+oHGY5pTIn8/SZr5/rDvs4H6A+lKUKBKVYHhDVWpHb
	G/gcDMSeicw078QvP2EyNqXxwX9vRtAP/JP9wQ4oTorOEpjatqDY2BvV
X-Gm-Gg: AY/fxX5M2uIQZmOC4JszVNtBU5gMNMufYoQx4xaoGA8nr9IgDS+JN54kuSWSoIhsP+O
	a1rk61yY8dhwzB0ECgmbFIbU5UcK2lQxOEFMu9pCAgsePALjCeDjNWtG2S1sDs6kb1F3DOvgVAb
	ro99vL7mlEd2BY4+/m+2vIb3t5uppVcmQfQGvWU88k5Pj1pKInJHNHY3fFdv6zkzpP/kuAJ6Q5X
	2tZUalfoLKvh5Nrf6ZdJ9wmh6Rl0BmdmkzBdWm3kwVm3nMAZin9FJ8SCYiFOETSITcr3rBcGNIU
	MYjl1oP5kfHw4d+f6r7y9WTXTRov8zAiVP2miXXOjsZvuX80dneZ6WM+mT5zU9ursnCBV6VUkLE
	8kKChDRPsqazcBzShb2L0utVNf4n9WBk+o3DRElhEqcQhe/RHBi/xg3btGGXZJR5xrdJfnoNrpp
	3UKw==
X-Google-Smtp-Source: AGHT+IF0hJgzX75ZcIowtNhUjlPnKr/1ZMKF6Ic3Py2DL3yFdhUTF0b1MKvrSAqEbri5ZvRTLM8gzQ==
X-Received: by 2002:a05:6820:16a5:b0:65f:1038:1317 with SMTP id 006d021491bc7-65f54f76ed2mr9334798eaf.70.1768210969330;
        Mon, 12 Jan 2026 01:42:49 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:72::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48ced969sm6764615eaf.17.2026.01.12.01.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:42:49 -0800 (PST)
Date: Mon, 12 Jan 2026 01:42:47 -0800
From: Breno Leitao <leitao@debian.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Laura Abbott <labbott@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, puranjay@kernel.org, usamaarif642@gmail.com, 
	kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Fix annotated branch unbootable kernel
Message-ID: <74f52o5tq2nodc3otsvknrsf2rpzphtaba7lxia5u3i7322vni@giqfw3ofnnyk>
References: <20251231-annotated-v1-1-9db1c0d03062@debian.org>
 <aVwp_BJx84gXHPlD@willie-the-truck>
 <20260109145022.35da01a3@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109145022.35da01a3@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_014251_075488_1627C19D 
X-CRM114-Status: GOOD (  17.84  )
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

Hello Steven,

On Fri, Jan 09, 2026 at 02:50:22PM -0500, Steven Rostedt wrote:
> [ Resending with my kernel.org email, as I received a bunch of messages from gmail saying it's blocking me :-p ]
> 
> On Mon, 5 Jan 2026 21:15:40 +0000
> Will Deacon <will@kernel.org> wrote:
> 
> > > Another approach is to disable profiling on all arch/arm64 code, similarly to
> > > x86, where DISABLE_BRANCH_PROFILING is called for all arch/x86 code. See
> > > commit 2cbb20b008dba ("tracing: Disable branch profiling in noinstr
> > > code").  
> > 
> > Yes, let's start with arch/arm64/. We know that's safe and then if
> > somebody wants to make it finer-grained, it's on them to figure out a
> > way to do it without playing whack-a-mole.
> 
> OK, so by adding -DDISABLE_BRANCH_PROFILING to the Makefile configs and for
> the files that were audited, could be opt-in?

How to do the audit in this case? I suppose we want to disable branch
profiling for files that have any function that would eventually call
noinstr functions, right?

