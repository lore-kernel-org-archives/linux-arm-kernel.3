Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C418ACE8D46
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j71jY3dsC6A+TgLo22tRv4gtHy9EDTKDrRH5VX7DJ1o=; b=p2m/hrXJD8rrGhRMgr9dgqFpkk
	+c27KZkfOAITI0BZgRqVAigjvliPcsMR5ADWqnsDO1SNbhZUyLpkuYgYkVAEgg1yYFy1YZVeuBvs9
	1y61Qw//HIsLieg4tvL/6Y3K8YJqRqMM5gR+sd6lCEF96lra2kF0CVMgYbmRGwkWgMgeGCP3rBi4D
	0ImLWWUuQiDP9XClZL1hKu0ly4M0nwfiN8WecYcT4igBfErBrqLTfEeCqfHxLQU2Wrwp9o8B3gSn5
	VpCaogOS90uHFEYvfx2z7PcEtqz5Yns4cqtZaNhXh5c7KWxzQdfw7s7qB2n6eiN2g61Kh1XULGWRk
	a4PzkVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJve6-0000000CY85-3q9a;
	Fri, 14 Nov 2025 15:23:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJve6-0000000CY7x-1KE4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D8C060150;
	Fri, 14 Nov 2025 15:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6623C4CEF5;
	Fri, 14 Nov 2025 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133808;
	bh=HR765DhUvED/IAYt/KalTJoC6rZzlIvAnWmGbhovKJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKZv8SOpFhYMv82Bb47ixVSYEdtUwSvyoBkSDMrRmTQ8GK2ndLwlMfMBiLHAbjcbV
	 cmJa43PIae5JaMtaTovUMsc0qCviAYBshBxDfKh8/HhrLi6Zz1whJkL3vSISFhWflT
	 POl4U8ytpyfaGSG6QTkmH/TWGNoDxmBCAxKFbCg59ApZIbJDnlvQ2ucP9L2THsHFa7
	 EUc9tX+pBbG/xXpL/jmzkUjt82d15rZ70vtrChAZtwZQeJ96VOW007zQPX0m5a0b2M
	 iuol1iU51PaxZWzccFf7w0H0ZKHod2V7ZjI297Na45RHTSejjmazzexuuUElxc0eBU
	 3d5vzsa9VOwQQ==
Date: Fri, 14 Nov 2025 15:23:22 +0000
From: Will Deacon <will@kernel.org>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: "Kazuhiro Abe (Fujitsu)" <fj1078ii@fujitsu.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>,
	"guohanjun@huawei.com" <guohanjun@huawei.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>
Subject: Re: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
Message-ID: <aRdJant_3FzZt9w6@willie-the-truck>
References: <OSAPR01MB7669F9B9E145A50B38819E13D5CEA@OSAPR01MB7669.jpnprd01.prod.outlook.com>
 <20251112044239.4049011-1-cmirabil@redhat.com>
 <OSCPR01MB16310F566905156A462CE3727D5CAA@OSCPR01MB16310.jpnprd01.prod.outlook.com>
 <CABe3_aE7EjKX1uJbA_r9W_Em3Eu8F4xzdcKh0vfjjJ4YQe7C4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABe3_aE7EjKX1uJbA_r9W_Em3Eu8F4xzdcKh0vfjjJ4YQe7C4Q@mail.gmail.com>
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

On Fri, Nov 14, 2025 at 10:20:39AM -0500, Charles Mirabile wrote:
> On Fri, Nov 14, 2025 at 3:21 AM Kazuhiro Abe (Fujitsu)
> <fj1078ii@fujitsu.com> wrote:
> > > On Mon, Nov 10, 2025 at 07:38:17AM +0000, Kazuhiro Abe (Fujitsu) wrote:
> > > > > > On Mon, Oct 20, 2025 at 09:23:05PM +0800, Hanjun Guo wrote:
> > > > > > > On 2025/10/17 15:39, Kazuhiro Abe wrote:
> > > > > > > > AGDI has two types of signaling modes: SDEI and interrupt.
> > > > > > > > Currently, the AGDI driver only supports SDEI.
> > > > > > > > Therefore, add support for interrupt signaling mode The
> > > > > > > > interrupt vector is retrieved from the AGDI table, and call
> > > > > > > > panic function when an interrupt occurs.
> > > > > > > >
> > > > > > > > Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > > > > > > Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> > > > > > > > ---
> > > > > > > > Hanjun, I have addressed all your comments.
> > > > > > > > Please review them.
> > > > > > > >
> > > > > > > > v3->v4
> > > > > > > >   - Add a comment to the flags member.
> > > > > > > >   - Fix agdi_interrupt_probe.
> > > > > > > >   - Fix agdi_interrupt_remove.
> > > > > > > >   - Add space in struct initializsation.
> > > > > > > >   - Delete curly braces.
> > > > > > >
> > > > > > > Looks good to me,
> > > > > > >
> > > > > > > Acked-by: Hanjun Guo <guohanjun@huawei.com>
> > > > > >
> > > > > > I wasn't cc'd on the original patch but I couldn't figure out why
> > > > > > it uses IRQF_NO_AUTOEN when requesting the irq given that the
> > > > > > first thing it does is enable it.
> > > > >
> > > > > I misunderstood the usage of request_irq and enable_irq.
> > > > > Since there's no need to separate them, I will remove IRQF_NO_AUTOEN
> > > > > and the enable_irq call, and send v5.
> > > >
> > > > I found out when calling request_nmi, removing IRQF_NO_AUTOEN results in an
> > > error (-EINVAL).
> > > > Therefore, I would like to keep IRQF_NO_AUTOEN specified.
> > > > If you have any comments on this version, please let me know.
> > >
> > > Could it be that this is just a bug in `request_nmi`? I see the following:
> > >
> > > if (!desc || (irq_settings_can_autoenable(desc) &&
> > >     !(irqflags & IRQF_NO_AUTOEN)) ||
> > >     !irq_settings_can_request(desc) ||
> > >     WARN_ON(irq_settings_is_per_cpu_devid(desc)) ||
> > >     !irq_supports_nmi(desc))
> > >         return -EINVAL;
> > >
> > > Perhaps there is just a missing `!` before `irq_settings_can_autoenable`.
> >
> > I tried this change without specifying NO_AUTOEN, but it resulted in an error.
> > __setup_irq succeeded, but irq_nmi_setup failed with -EINVAL.
> > I haven't investigated further beyond that point yet.
> 
> Thank you for trying, from reading the other commentary in the thread,
> I recognize now that that was a naive suggestion.
> 
> I think that this patch should go in as is then unless there are other
> concerns, because it seems like it is not possible and should not be
> possible to autoenable NMIs and that explains why the code does what
> it does to answer Will's original question.

Yes, I wasn't trying to derail this at all. I spotted something that
looked weird, it turns out that's how NMIs are enabled and if the
cleanest thing is to treat normal IRQs the same way then so be it.

Will

