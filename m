Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A94BD2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcsB1A3dyzX0YAAHRE9KIQnIlq4KHMm1Pz2Q952VEY4=; b=r0Jr6At7SE/B8n/+m6yfQs3EuP
	DaltfYVjsbuZsYOyNsj5qS/s3OA20xm18g/a92Od1OJPGW3suwXHQeC6/CV+7DIRbyU2qgNop0GSb
	lcn8/xRzmqADo8OMqcmppe42fxBDU6ojrLbML0acaBG6dbdhjlvac6gAkHwRt9qhLPwctqNe374yn
	EybvrhzoalZ5iZDDbYBAQnhYuxRoM5id8u7omUduAxFC0ppyUfTc1BfuGwH9xrgw2reYl+2ZzNwe2
	2ZDk83fk7pbVDpWfLBj0dRJ4rJ8/9J+jvxQzWN3SwOIRTA9EjpP5x1VMePNqbQjObJU0K4YI8OCMS
	sI+2NRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAFs-00000003kxn-0YD8;
	Tue, 20 Jan 2026 11:50:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAFr-00000003kxh-2OFr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A8A86012A;
	Tue, 20 Jan 2026 11:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC9AC16AAE;
	Tue, 20 Jan 2026 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768909838;
	bh=fwzc7yqIuJaeQHw9CCm5cdBaBfc+5ih+Xegkbgg7jAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iINjgdbI1V5aR8AhZ8qLkcXEaGUxqTCm+ER3WXRtrPQ4Ipsdr5FtiABTAxuRDqK58
	 N1FiFW+SK6Cev9SnwDHk0dTlDmFnEU8jMrXGIkHDJVkE6DT17rn1I967ZxcdX3XlA4
	 GNsHiFoXO4O8tnrJDxw2Z2agpi5uAy/Bai8WK2YORZ2xuezF7yJHTlW8P1w18MaiLy
	 DXwlwrbDzQrMojAA6teHCDKQ+TkNZTnEP8MopY2xujgvNifTeCj/0IzWjqYD4WPE58
	 CLIbIdZb19uSaFgbGW1CPlac5v4ZtfUEDDuhlOBQmDpzcRk1PEUHoIqDKRaky15gk2
	 wSh1njOz4d7Gw==
Date: Tue, 20 Jan 2026 11:50:30 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	catalin.marinas@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, ardb@kernel.org,
	suzuki.poulose@arm.com, lpieralisi@kernel.org,
	yangyicong@hisilicon.com, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI
 for swpX emulation.
Message-ID: <aW9sBkUVnpAkPkxN@willie-the-truck>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-10-yeoreum.yun@arm.com>
 <86ms3knl6s.wl-maz@kernel.org>
 <aT/bNLQyKcrAZ6Fb@e129823.arm.com>
 <aW5O714hfl7DCl04@willie-the-truck>
 <aW6w6+B21NbUuszA@e129823.arm.com>
 <aW9O6R7v-ybhrm66@J2N7QTR9R3>
 <aW9T5b+Y2b2JOZHk@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9T5b+Y2b2JOZHk@e129823.arm.com>
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

On Tue, Jan 20, 2026 at 10:07:33AM +0000, Yeoreum Yun wrote:
> Hi Mark,
> 
> > On Mon, Jan 19, 2026 at 10:32:11PM +0000, Yeoreum Yun wrote:
> > > > On Mon, Dec 15, 2025 at 09:56:04AM +0000, Yeoreum Yun wrote:
> > > > > > On Sun, 14 Dec 2025 11:22:48 +0000,
> > > > > > Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > > > > >
> > > > > > > Apply the FEAT_LSUI instruction to emulate the deprecated swpX
> > > > > > > instruction, so that toggling of the PSTATE.PAN bit can be removed when
> > > > > > > LSUI-related instructions are used.
> > > > > > >
> > > > > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > > >
> > > > > > It really begs the question: what are the odds of ever seeing a CPU
> > > > > > that implements both LSUI and AArch32?
> > > > > >
> > > > > > This seems extremely unlikely to me.
> > > > >
> > > > > Well, I'm not sure how many CPU will have
> > > > > both ID_AA64PFR0_EL1.EL0 bit as 0b0010 and FEAT_LSUI
> > > > > (except FVP currently) -- at least the CPU what I saw,
> > > > > most of them set ID_AA64PFR0_EL1.EL0 as 0b0010.
> > > >
> > > > Just to make sure I understand you, you're saying that you have seen
> > > > a real CPU that implements both 32-bit EL0 *and* FEAT_LSUI?
> > > >
> > > > > If you this seems useless, I don't have any strong comments
> > > > > whether drop patches related to deprecated swp instruction parts
> > > > > (patch 8-9 only) or not.
> > > > > (But, I hope to pass this decision to maintaining perspective...)
> > > >
> > > > I think it depends on whether or not the hardware exists. Marc thinks
> > > > that it's extremely unlikely whereas you appear to have seen some (but
> > > > please confirm).
> > >
> > > What I meant was not a 32-bit CPU with LSUI, but a CPU that supports
> > > 32-bit EL0 compatibility (i.e. ID_AA64PFR0_EL1.EL0 = 0b0010).
> > > My point was that if CPUs implementing LSUI do appear, most of them will likely
> > > continue to support the existing 32-bit EL0 compatibility that
> > > the majority of current CPUs already have.
> >
> > That doesn't really answer Will's question. Will asked:
> >
> >   Just to make sure I understand you, you're saying that you have seen a
> >   real CPU that implements both 32-bit EL0 *and* FEAT_LSUI?
> >
> > IIUC you have NOT seen any specific real CPU that supports this, and you
> > have been testing on an FVP AEM model (which can be configured to
> > support this combination of features). Can you please confirm?
> >
> > I don't beleive it's likely that we'll see hardware that supports
> > both FEAT_LSUI and AArch32 (at EL0).
> 
> Yes. I've tested in FVP model. and the latest of my reply said
> I confirmed that Marc's and your view was right.

It's probably still worth adding something to the cpufeature stuff to
WARN() if we spot both LSUI and support for AArch32.

Will

