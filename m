Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E0CE9D66
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQTUy1kZhVd6QFKYgDUasG/BXOAj1nBI7IAdTwgQh4k=; b=SRnNi64sMe1lm5hG0Wy25GIc0F
	kRg1vnFu6azFJue/dkJUEhmrp5b6zpg3vRLyY4lGFYqJAKCaW7FhWAOuCDDBsCNYh30KBNG9UZ1HT
	zy/YNZJ5fZ/jL4oPRXBigH/3DnmUCb+lZzrD9vBUslLQa6VuUm7aYU2fzSETE8AxqeEUm4sJnAqSZ
	h2rf/62BMRpryCiq2xRMuJfhJ5QkcEA9t0wea8VmUd7MaMjxbWZS5a1ptLWhW6f/TanQKhar5AS2a
	byEcy1EFICBXg/gDqAkgW64vDC9jHt/eQXt4iq1b8tAR75DBdt9uzrLE16fdSW5gEwpcweU/HQiOt
	OBuDmQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9G7-0000000DQnf-1bA1;
	Tue, 06 Jan 2026 15:46:11 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9G5-0000000DQnC-2x9F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:46:10 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c7613db390so600564a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714368; x=1768319168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQTUy1kZhVd6QFKYgDUasG/BXOAj1nBI7IAdTwgQh4k=;
        b=qsnXxJYipjlnepeYFDVhLEwwkCscV5vCCU3CXIQb4CDMyHsKqmDIaVD6xdTZcvz0Qz
         LA2aElYLuY1aTEe6q4sec9/QS1g0w2d94sIpjU0y7vcJBkCTU8jRiNRnLsKxaW3EiLDe
         1+ulRqIo11EKGDVmWiFX16Q/jbXg6/1Axj6xGgsBX0SF5v7h83td37MrkI0Jdhaf775E
         S9RCGU7mTZ/MTSNiGqpHYM6ENKPii3MlQMVk0bMfeU2UaDbme6WAeAZp4sgbZfinbpxm
         QASk1nKQ+78bbZknhW/RKh+BUzh9YwVu6ozGg2Y4tK5c+feC2Khu/DG/o53uqJLZcDoe
         xIXw==
X-Forwarded-Encrypted: i=1; AJvYcCVxpazGTEFLjTVfTJe2V4DW+L1+KFxXAhrNyP1EpY+Vq0UrYhvXabhcGOhQCdEGuGOo2zhshwh+/Fo9cbrUEwPP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw75s2spS6aoNFaJdIKrdJBnXAgDUmi5PARcXhnDrQ3CSPnBJg9
	ZFzw5zr1cgBbCYp5ddLJjoKwq4J5Gz1nfzB6HmFPNdWF4KcpemPVQyHZ
X-Gm-Gg: AY/fxX6ept4ToxT93sl3hwerHy+dAchrU3ZHnQtVMXNU+pdEVOp1BprgsEJl/bQf3Tz
	tyjdaSLgwUXuiq4CnWCbOiVneKIXBFUlv3qAWrrG1QlI79Gw8v1MZiYOHVhv3w2Va/rmPTy88VW
	T1NSCiN7MNvsPslLBNmR9MH2ZTpkY256lpZEeIpp7g1iaspExRuQiFEhKgQP35yQs2tb28Fgquc
	gu7cgrUvE79MbBEY/jgaTfMEmo4UKDEkqehxNhuXANgY2riUt0j9YU6mzSdwfP4C8nrF4a4gN+W
	fDLnPuPjuBq66CFZH+MGdfL9Uqn8MsyH1iKnc437DaswWNwOjLH+akLwHB+PBZ3hkGrCM+lhzSd
	mdnDJWRnrvXf3wphxC1+Mf58LMC/oVjijx1yMQiPg1yw4iTmysCsld26OgHM4votnOvvZ12mB7b
	PDZYQGHm5iy7EfdWGX3Nxy
X-Google-Smtp-Source: AGHT+IEDVtPF+jdII9GyQUl1ZSSEpCxWJpHOx5hPHx7PAH7getQJEBbENhpATdFTeDD/D3J2rXVxsQ==
X-Received: by 2002:a05:6830:668c:b0:7c7:1e8a:c9d8 with SMTP id 46e09a7af769-7ce46745fcamr2517821a34.36.1767714368554;
        Tue, 06 Jan 2026 07:46:08 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478029a6sm1603103a34.3.2026.01.06.07.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:46:08 -0800 (PST)
Date: Tue, 6 Jan 2026 07:46:06 -0800
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Laura Abbott <labbott@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@meta.com, 
	puranjay@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Disable branch profiling for all arm64 code
Message-ID: <cllfyxsg4gkyg65j3bko2fncibwmr2wqzzs2255qp6l3vupev7@2ke5cv6iqpow>
References: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
 <aVz-NHMG7rSJ9u1N@J2N7QTR9R3>
 <tj43kozcibuidfzoqzrvk6gsxylddfpyftkdiy7xb2zm7yncx5@z33xu7tavuts>
 <aV0qxGioAXxkh6QD@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV0qxGioAXxkh6QD@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_074609_743541_A585FF40 
X-CRM114-Status: GOOD (  25.00  )
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

On Tue, Jan 06, 2026 at 03:31:16PM +0000, Mark Rutland wrote:
> On Tue, Jan 06, 2026 at 06:05:37AM -0800, Breno Leitao wrote:
> > On Tue, Jan 06, 2026 at 12:21:47PM +0000, Mark Rutland wrote:
> > > On Tue, Jan 06, 2026 at 02:16:35AM -0800, Breno Leitao wrote:
> > > > The arm64 kernel doesn't boot with annotated branches
> > > > (PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.
> > > > 
> > > > Bisecting it, I found that disabling branch profiling in arch/arm64/mm
> > > > solved the problem. Narrowing down a bit further, I found that
> > > > physaddr.c is the file that needs to have branch profiling disabled to
> > > > get the machine to boot.
> > > > 
> > > > I suspect that it might invoke some ftrace helper very early in the boot
> > > > process and ftrace is still not enabled(!?).
> > > > 
> > > > Rather than playing whack-a-mole with individual files, disable branch
> > > > profiling for the entire arch/arm64 tree, similar to what x86 already
> > > > does in arch/x86/Kbuild.
> > > > 
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: ec6d06efb0bac ("arm64: Add support for CONFIG_DEBUG_VIRTUAL")
> > > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > > 
> > > I don't think ec6d06efb0bac is to blame here, and CONFIG_DEBUG_VIRTUAL
> > > is unsound in a number of places, so I'd prefer to remove that Fixes tag
> > > and backport this for all stable trees.
> > 
> > That is fair, thanks for the review.
> > 
> > Should I submit a new version without the fixes tag, or, do you guys do
> > it while merging the patch?
> 
> I assume that Catalin or Will can handle that when applying (if they
> agree with me); no need to respin.

Thanks Mark.

