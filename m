Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EF5E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pn1vKLoEhp3dMmHo1GlRl6XpB6aqXjCl5nt7IETPCw0=; b=RYEQFAthgWnclZZ1jGinwaD7R7
	0VRFjCPa2te43jO8f1hS376zhVMtmCFLw31eZYtC5TKZa9TZDOGvyOmLX3q7dwIL99aoteLzeIfVB
	9lPZmbX9cUtkkWvWrwZZX/PICWQh402k2urcpkXY8+dTOhkP6mD+YkH+McPUu0VqIAwy+FJQplB5X
	131XlU+MDO4YDlmk7wH0O1U9bh3Bca9egJ2UyoMTMYU+Nr8gxRzEaWe4p4fkGpyqRSxsA822fe6bj
	d48qNOD0Bt+JB/EsSHamEkhSRZVA2jiNt707gJfuI8snOUMRl4ADGIaPfjHOlxdY+3vDr39W3muy5
	xvMFD3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUMd-0000000GC3K-3k4O;
	Wed, 11 Dec 2024 21:35:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLULa-0000000GBou-0mvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 21:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B9D05C64D4;
	Wed, 11 Dec 2024 21:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731DAC4CED2;
	Wed, 11 Dec 2024 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733952857;
	bh=A4SsJa/gV21qeqY5SupSQf+YT6zTnX33XWVSHXjPKLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGiodUnETIVdlukXlYOxY5nBS8nYII7/A7aVBVY0mCY7ks8RUzNdDi2051tUWc4hF
	 bPRduByAPOoINo6L1VyQZ2taADNS5SmUeRduni+lqMGoh6+yUeohi8GT7H8na9Z6KK
	 TWlIrR6x6m6GyWWu1/5jZTQDAygYOW9JDWjWnUlFBomEFP695vOa2HD2Shjn5785ki
	 qMdh0zoevPYStzIF9xFofWBQKwOREhsFfowu4PBQNtHPpGethamkGVgvV6aOWkH9aU
	 jqvlfkBU0cxj4M/JyAWIzQKxAjWrVPJd7e+TwGGrvKQeeJv9XXlWBN/UYJFGzCIF1a
	 Qz20EKMWmRrDw==
Date: Wed, 11 Dec 2024 21:34:11 +0000
From: Will Deacon <will@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH 0/6] arm64: errata: Add Qualcomm CPUs to the Spectre
 mitigation lists
Message-ID: <20241211213410.GB17486@willie-the-truck>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241210155604.GA15918@willie-the-truck>
 <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_133418_309816_1781FBF2 
X-CRM114-Status: GOOD (  35.84  )
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

On Tue, Dec 10, 2024 at 08:53:46AM -0800, Doug Anderson wrote:
> On Tue, Dec 10, 2024 at 7:56 AM Will Deacon <will@kernel.org> wrote:
> > On Mon, Dec 09, 2024 at 09:43:10AM -0800, Douglas Anderson wrote:
> > >
> > > Since Qualcomm CPUs are all derivatives of ARM cores they all have
> > > unique MIDR values. This means that the tables listing necessary
> > > Spectre mitigations need special entries for them. However, those
> > > entries are not present and that means that some Spectre mitigations
> > > are lacking for Qualcomm CPUs.
> > >
> > > I've made an attempt at **GUESSING** what the right patches should be
> > > to enable mitigations for Qualcomm CPUs. This is mostly me searching
> > > the web to figure out what ARM cores various Qualcomm cores are based
> > > off of.
> > >
> > > These patches get more and more sketchy as the series progresses and I
> > > have noted that the later patces DON'T EVEN COMPILE. I have included
> > > them to make it obvious that I think these cores are affected even if
> > > I don't have all the right information to mitigate them. Hopefully
> > > Qualcomm can come and fix this mess for me.
> > >
> > > I'll note that I am certainly no expert on Spectre. Mostly I ended up
> > > here running `lscpu` on a device and noticing that it thought that it
> > > wasn't affected by Spectre v2 when I thought it was.
> >
> > Whilst only Qualcomm can say definitively whether or not they are
> > affected (and what values of 'k' are required for the loop-based
> > workarounds), I can't help but wonder whether the current mitigation
> > code is structured the wrong way around in this case.
> >
> > It looks to me like we don't have a way to identify a "vulnerable" CPU
> > for Spectre-BHB; either a CPU has some sort of mitigation or it's
> > unaffected. That means that there's very little incentive for vendors
> > to add their CPUs to one of the lists -- if they do nothing, userspace
> > is told that everything is golden and they don't pay the performance
> > hit of a workaround!
> >
> > So I think we should consider turning this on its head and assume that
> > CPUs we don't know about are vulnerable, having a list of unaffected
> > cores that predate the introduction of CSV2.3 which can be queried by
> > is_spectre_bhb_affected(). We can do that without the assistance of the
> > CPU vendors.
> >
> > Does that make sense, or did I miss something?
> 
> It makes sense to me. I'm not sure I'd be the best person to actually
> implement that, though. Maybe someone CCed on this thread could take a
> stab at it? It seems like folks from ARM would know the most about the
> various mitigations and which pre-CSV2.3 cores were safe.

I think we could start with an empty list tbh. If you take a stab at it,
I'm happy to review it. Folks with knowledge about the specific CPUs
can send patches on top.

Will

