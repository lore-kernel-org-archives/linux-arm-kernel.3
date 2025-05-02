Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D37C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPkX1wr2i8PKP2B4AcVRpHJv4yvXjlFp1gYod/7yZgs=; b=423z3qpD46OpzH9RQhUSFFmlBu
	ufM+1fNn17pJ5yJkGxKfEfVDG6+US/EEO0IgYxBTqfqMn+poM9xYDsZKSLWMVlc3QR3PJWsFr7ua0
	BdUV+iJ73pGNSFBjfGU8Kq5+w8J+KjHoDl7BQYt91kJ8zWfaiTeR3pMUBdr1Khqtl+++KNjin8uPh
	m8WaN2EtkiXykbrnyJ4Yqm64bJ8hACqPVlB+RHGA1UElnIKndBGnuGyNi/s7eM7sk5IKVM4PO54Nt
	/cnC0gPe1hN9eA4yzd9mogRpCXNUoZcgiWypUaXeFDSF0mm6fuxmzIx3z3nvDdtJ1PkE7KjCIFb+i
	39PU3C8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAwsq-00000002xRU-348q;
	Fri, 02 May 2025 20:21:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAwqt-00000002xJh-2nJc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 20:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF2DDA4C4D6;
	Fri,  2 May 2025 20:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8697C4CEE4;
	Fri,  2 May 2025 20:19:13 +0000 (UTC)
Date: Fri, 2 May 2025 21:19:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: David Hildenbrand <david@redhat.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
Message-ID: <aBUovySaQN8m8L0w@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-3-yeoreum.yun@arm.com>
 <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>
 <aBUC5fsSVzGkQtUV@arm.com>
 <CAMn1gO7ai3EvHhepJJQXOvjc8_Mp6DEAZg0J1gMKSJTECnU0VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMn1gO7ai3EvHhepJJQXOvjc8_Mp6DEAZg0J1gMKSJTECnU0VA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_131919_778738_A31EC01B 
X-CRM114-Status: GOOD (  27.58  )
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

On Fri, May 02, 2025 at 11:03:02AM -0700, Peter Collingbourne wrote:
> On Fri, May 2, 2025 at 10:37 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Thu, Apr 24, 2025 at 10:34:57PM +0200, David Hildenbrand wrote:
> > > On 10.04.25 10:07, Yeoreum Yun wrote:
> > > > PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> > > > opeartion only.
> > > >
> > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > ---
> > > >   include/uapi/linux/prctl.h | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > > > index 15c18ef4eb11..83ac566251d8 100644
> > > > --- a/include/uapi/linux/prctl.h
> > > > +++ b/include/uapi/linux/prctl.h
> > > > @@ -244,6 +244,8 @@ struct prctl_mm_map {
> > > >   # define PR_MTE_TAG_MASK          (0xffffUL << PR_MTE_TAG_SHIFT)
> > > >   /* Unused; kept only for source compatibility */
> > > >   # define PR_MTE_TCF_SHIFT         1
> > > > +/* MTE tag check store only */
> > > > +# define PR_MTE_STORE_ONLY         (1UL << 19)
> > >
> > > That is the next available bit after PR_MTE_TAG_MASK, correct?
> > >
> > > Would we want to leave some space to grow PR_MTE_TAG_MASK in the future
> > > (could that happen?)?
> >
> > The current mask covers 16 tags (bits 59:56 of a pointer) and given the
> > reluctance to have a tag storage of 4 bits per 16 bytes (3% of RAM), I
> > doubt we'd ever grow this.
> >
> > However, you have a good point, we could indeed leave 32 bits for the
> > tag mask, just in case MTE gets so much traction that someone wants 8
> > bits per tag (and likely a bigger granule than 16 bytes). It doesn't
> > cost us anything to add additional bits from (PR_MTE_TAG_SHIFT + 32).
> 
> If it's 8 bits per tag wouldn't the exclusion mask need to be 256
> bits? I probably wouldn't try to anticipate this case since it would
> likely require a different API anyway.

Yep, not sure what I was thinking. So all good with the original patch.

-- 
Catalin

