Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A47C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 00:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sartwbMLAd82CyHAx3E4ga7ShC8eqpPTOdDBwL+lAo=; b=QBYwmz1OtDJHA/7gfqh8rcOR+/
	5/epLedgWP1zGVN79ZPWLhIHq1UGDy7AukCGamArGhAlH4a7lIl1cozOBMdmjow7YFaXVX73Ot3Gt
	KF9VEumGhwggXnV65N8xV7+EQ/eRKv7uqnx1MU/aqYaxcJHaliGevPHnXqX1PTR2v1FaF2z8jIIxi
	7kjISMZTOc3Jr/X2/ekvIbIMcnfZFzqE1NkGJkwpqE1BGGot8AoL9/C9dMwSze+9yuJz9waRKAFlN
	FP16wJXwaH+8eNLR+Y+SjStFM8n3SyZ6Ye3xJrTTdOEIgGwwV2Jz4U+mZbh3U0BiZL3tD58jUpcnZ
	2ohY97nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgCGy-00000007srh-1brm;
	Fri, 07 Feb 2025 00:31:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgCFa-00000007sYh-2opk;
	Fri, 07 Feb 2025 00:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFC255C60B6;
	Fri,  7 Feb 2025 00:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09692C4CEDF;
	Fri,  7 Feb 2025 00:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738888181;
	bh=394j8Z0b6091bH8cpo4/leUwPDluUyEIe29eznp9v/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cH6WfmxnF52p9Zequ1wu7UNwiFQG9Q9DFgHs3+QDdI63nHyM6sfGRF6ORytziBHBG
	 1svUtzspmlPno7QIYJtnR9zgKZPtG9f9VRRcOxc9zMOT1pNOcS0MkqJE4BtWRzysLo
	 MVYoEEfJiWjb8IfK5tW9plqHYJnc6c1PwQKhrUMc=
Date: Thu, 6 Feb 2025 16:29:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, Andy
 Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, Eric
 Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, James
 Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Pratyush Yadav <ptyadav@amazon.de>, Rob Herring <robh+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky
 <thomas.lendacky@amd.com>, Usama Arif <usama.arif@bytedance.com>, Will
 Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Message-Id: <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_162942_771858_033783F6 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> This a next version of Alex's "kexec: Allow preservation of ftrace buffers"
> series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com),
> just to make things simpler instead of ftrace we decided to preserve
> "reserve_mem" regions.
> 
> The patches are also available in git:
> https://git.kernel.org/rppt/h/kho/v4
> 
> 
> Kexec today considers itself purely a boot loader: When we enter the new
> kernel, any state the previous kernel left behind is irrelevant and the
> new kernel reinitializes the system.

I tossed this into mm.git for some testing and exposure.

What merge path are you anticipating?

Review activity seems pretty thin thus far?

