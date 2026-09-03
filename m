Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FF8C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5P/AdgBph3SlVsp0Z/XaOLD0gN95eYKldhRfreJuQc=; b=D67f0+xDKYRsgKAVV5coFsJq49
	RrlS9AkquowBApRs4ldf88WCNxDKomW4rqdJVC1QituzVIPsGIO7A+5dQqjUqQa438t2nR9bgsVPs
	CYryXnz1NYYaAbXTwBkX5UvjwHax3dlycpuPuC+Z/bAGGFZLJcbd/Oqf9h5ZRFxlkZ/wNlSgywapr
	rb50M7RjTZiWCDnOpU9nRjHDY2Vou00T94l9+nH+phpSYgxP9h3H/m8Ab3ftgsp47ZuSqxL/A5cjE
	10fQhVWYRWeiftGSPFheAuWXBwDxmGIOSHblGY5LhB2Y4OYI+D9MAScqsGf+GArlgXyhJ9/mlrS9s
	sE2rL0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26N9-0000000HHKY-0kga;
	Thu, 03 Sep 2026 12:16:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26N7-0000000HHKL-1oPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D93124342B;
	Thu,  3 Sep 2026 12:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D8D1F000E9;
	Thu,  3 Sep 2026 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788437808;
	bh=l5P/AdgBph3SlVsp0Z/XaOLD0gN95eYKldhRfreJuQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FfekgQ+W0ItBtRJlNm8QBpqGSkfMsg4oPcQ7Gcdf1z9bXGY1YuizfoXuaNG3uOfFX
	 42EYTFVmnONyOpvdWeAFppPTzVjFuxCXUwzkwgllmQVcZpaa2Sha2sn/+oOPvPGqDd
	 LK/maSwGR+KMxtXOmDPzSsXuWMizQxXWnNQ5kitND7YOclpXYT1t0brd4rSmdR6uIW
	 EXrFyHGLyLpi2CunJofmitENzCqfCNE6d91wv9QJ5xnD6P6VPMy/L85ufQ7rtsG9fL
	 ca2Q5Yif6m0SYLCLyn5T68hCQen41XpTboSH0/wAF5UM9QaVRR+g8ufitNKcnTcbJk
	 zUCVc8AhEha+Q==
Date: Thu, 3 Sep 2026 13:16:44 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <apllLC2jY4Ak192M@willie-the-truck>
References: <20260825205839.14571-1-brads@mainlining.org>
 <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
 <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
 <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
 <aplRx8f5NprO9dSU@willie-the-truck>
 <CA3C4FFB-FEAE-4537-B0DE-DEBB06D053FE@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA3C4FFB-FEAE-4537-B0DE-DEBB06D053FE@mainlining.org>
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

On Thu, Sep 03, 2026 at 12:26:11PM +0100, Bradley Morgan wrote:
> On 3 September 2026 11:53:59 BST, Will Deacon <will@kernel.org> wrote:
> >On Wed, Sep 02, 2026 at 03:03:07PM +0100, Mark Rutland wrote:
> >> On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
> >> > On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
> >> > wrote:
> >> > >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
> >> > >> This comes out of the hibernate resume discussion where Will asked
> >if
> >> > >> the restored kernel's hyp vectors are reinstalled before we come
> >back
> >> > >> from swsusp_arch_suspend() and free the reserved pages. Rather than
> >> > >> answer with a one off fix, this series reworks resume to look like
> >a
> >> > >> resume from idle, which makes the answer fall out on its own.
> >> > >> 
> >> > >> The series leans on Mark Rutland's old work for inspiration, he had
> >the
> >> > >> same end goal in a branch from back then:
> >> > >> 
> >> > >>  
> >> >
> >>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
> >> > >
> >> > >Most of the series seems to be a rebased of those patches, just with
> >> > >paraphrased commit messages and my S-o-B lines dropped. As commented
> >on
> >> > >patch 4, I do not think that is appropriate.
> >> > 
> >> > Same question as patch 2
> >> > 
> >> > If you want your S-O-B added, ok fine, but yeah.
> >> 
> >> As on patch 2, please read the documentation before continuing futher.
> >> 
> >> > Do you think this series itself is good? 
> >> 
> >> No. At present I think it's in a worse state than it was in my branch,
> >> because portions have changed, with no rationale and no clear benefit.
> >> 
> >> Hence my ask to Catalin and Will to NOT pick this up for now.
> >
> >I wasn't going to pick them up with the incorrect authorship, but it's
> >worth noting that Bradley's patch _does_ fix one of the hibernation
> >problems and has been tested by Vladimir:
> >
> >https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
> >
> >I would prefer to take your complete set of patches, but if you don't
> >want that then should I just take the above for now? Prior to this
> >series, there has been no activity for nearly two years on your branch,
> >so I'd prefer to get _something_ in, even if it only fixes some of the
> >problems.
> >
> 
> So your taking the bugfix? I'll do V2 later, you'd need to review my sleep
> patch tho. 

I'm asking Mark how he would like to proceed, so no need to send a v2 just
yet.

Will

