Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAAAC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl4yKcZcskbxJHRSu8kbVYJqQXgOenvSubnVY0PIPLI=; b=nUk/bhobuj7QHVI2JI+XIR4ZuV
	MYbj0Q9AzH3Be7zgz3OtL8ofU+SVoHZEEPhTsxGgEXVDDFk8NrFHqC/Dqae7CWooZDO6wwd+sFmWU
	tIU/l8XoZnf8WpzEwn5ApUYJRyvWAwxxJRK78pR686goPogruAqq9VTF5D6BsWjNa/vOGTPUgUzYg
	VX8nRzg4lAi2DfDJjdQYwcMAR07BbKsd3bAXVRKWLoRzlceSH8C/6a+Jqc+9hooj28W8/Exfn4kXo
	r/DzFOfOyR7wvFuedr788pmfXDR7TuwX7h7ME7u05WuD2ieYUwaeAdBhCItV0mp0UqZfDS77VAwU1
	0f2M/yKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ufm-00000002LlB-1LP3;
	Fri, 04 Sep 2026 14:13:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ufj-00000002Lju-1hzD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:13:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F775152B;
	Fri,  4 Sep 2026 07:13:34 -0700 (PDT)
Received: from e140010.arm.com (unknown [10.57.70.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BDC93F673;
	Fri,  4 Sep 2026 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788531217; bh=mbcX0BRjZ9tHtv7uAMzxSZb/LiI6JSOCvOcS1JOdIek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gbQgRzTxT6BPex33JLT7Pp8oraxak7yfyL5lHfSf7+jZx6hiadbkvjkMYEO3tQ3Vc
	 WZy/t6W/Ia+cI4ajpvLK/YblZ7ei6nrRcxN9vJYWnNYh3U+WhXknz0/g6SPUckWI02
	 rNKmKVIqOG71DPAI0cNlqDoxy12rjpZgTpRVpb7k=
Date: Fri, 4 Sep 2026 15:13:31 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Message-ID: <aprSC0hpm6tWdXvh@e140010.arm.com>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org>
 <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
 <apqrky27mJmUV9UA@willie-the-truck>
 <05f1e2f4-173a-4226-8c98-1452c20f0a47@sirena.org.uk>
 <CA+EHjTx87SnshzrUF69hGTSA9JmjW9oKbx+GbKjx5W+gnWYRgg@mail.gmail.com>
 <aprKiP2YlBuBwDU8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aprKiP2YlBuBwDU8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_071339_493891_2F0C9BAB 
X-CRM114-Status: GOOD (  26.86  )
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

Hi Will,

On Fri, Sep 04, 2026 at 02:41:28PM +0100, Will Deacon wrote:
> On Fri, Sep 04, 2026 at 01:20:44PM +0100, Fuad Tabba wrote:
> > On Fri, 4 Sept 2026 at 12:48, Mark Brown <broonie@kernel.org> wrote:
> > >
> > > On Fri, Sep 04, 2026 at 12:29:23PM +0100, Will Deacon wrote:
> > > > On Fri, Sep 04, 2026 at 11:33:24AM +0100, Mark Brown wrote:
> > >
> > > > > What about pKVM, my understanding was that that is very much an ongoing
> > > > > concern and uses the nVHE hypervisor?  My expectation was that this
> > > > > would only ever get used in hVHE configurations when people enable pKVM
> > > > > on modern hardware, actual nVHE mode was mostly just carried along with
> > > > > that.
> > >
> > > > pKVM uses hVHE wherever it can nowadays, so I'm fine with only supporting
> > > > S1PIE on hVHE and VHE configurations if that's easier to maintain. We
> > > > just need to make sure that the failure mode for nVHE results in the
> > > > feature being gracefully disabled, rather than e.g. crashing or quietly
> > > > doing the wrong thing.
> > >
> > > I figure that if we're supporting hVHE it will end up less complicated
> > > to also enable nVHE, it reduces the potential for having bad or missing
> > > fallback paths for features downstream of S1POE.  It's not like it's a
> > > huge extra bit of code and it seems likely to save hassle down the line.
> > 
> > For pKVM there's no fallback path to get wrong: any CPU with S1PIE has
> > VHE, so pKVM runs hVHE on it, and a CPU without VHE has no S1PIE to
> > disable. I couldn't construct the protected nVHE plus S1PIE case under
> > QEMU at all.
> 
> I can't remember the exact incantation, but there's definitely a way to
> force pKVM + nVHE on VHE-capable hardware on the cmdline. So we should
> just make sure that doesn't go horribly wrong!

arm64_sw.hvhe=0 id_aa64mmfr1.vh=0

From kernel-paramters.txt, and last time I checked (two or three kernel versions
ago) it was working.

Thanks,
Ale

