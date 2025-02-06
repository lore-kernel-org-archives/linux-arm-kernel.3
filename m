Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72284C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 20:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wsnrmbgv/ixh4W6I253tgjjjvCdro2UjGLIWEuTX21I=; b=Yan1X9NRcqCAHkrBDcc2pWGUx0
	9MtSYPpK0+1PMiUx6D8bTwe1MAX/PrhAvz8sF0TvdAzT+Mu/l0f9VV60KZXu7XQwnGt1F1wu8YJWB
	sW2/KFAjyBlrFyJfc6tm1as9HDpvzRGgGYVneu41yZE7xVqTq5FMvL6OX84waRfrtVEAtir/79EZk
	hH0cNu453Bxz+M0IAmfRXaHBnfZhCe1GzymzpDoZZocTWGFR6Pozy8IseQU5I18lMZHf+E6TgAclN
	svta6Pk8qraLDk5FAAP3sWvld4GAfkDM5+7p6wgt1dttUSCfzcwkNJLNw64WF3FvkG3yGdKekdGz7
	rJZn8U5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8Lh-00000007T8S-0SSE;
	Thu, 06 Feb 2025 20:19:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8KK-00000007Sys-02fV;
	Thu, 06 Feb 2025 20:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C260F5C15C1;
	Thu,  6 Feb 2025 20:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADADC4CEDF;
	Thu,  6 Feb 2025 20:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738873099;
	bh=GvVXBTemD8hLI4sDIDJsvsxj1CuS5Lpg/Tdst6/Kwvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iy7LgHXJkzA1mz/gw/rzfCaoVA9gfOKC2PdEO25m0bz1brGms1iGghSjJyHNO96N/
	 SQC0JlWX61TQXrbA0J2lZcvRUN97J8PKO27rcUymErg9BDru8+cTg5FdZJ8uZjE1hJ
	 ze0w/Zsc/iro165y5Rslt8nNSgsW4/aic0eMrn2Dv0T4Tb5SJgOuXrukly2f0Vb9kE
	 e603/OX9msz66Pp7ojWp7RO+8q0eZ3sXCtXnOEmZZJxyggbeovQ/+rPvPg7ImgqGnb
	 1WsVCCMPSTbswC3R4l6JHrCdx5osrOJL19XdkwE0BQVM94ZjJSZDDwRGz+638O3Irb
	 GkEXG1/YHyzng==
Date: Thu, 6 Feb 2025 14:18:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/6] PCI: brcmstb: Refactor max speed limit
 functionality
Message-ID: <20250206201816.GA1000559@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNwY-Fc-nfawc_EtDRBvYht_491v80THW=4F-iY7Nqa81w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_121820_090092_A377C110 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, Feb 06, 2025 at 01:27:44PM -0500, Jim Quinlan wrote:
> On Thu, Feb 6, 2025 at 12:04 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Wed, Feb 05, 2025 at 02:12:01PM -0500, Jim Quinlan wrote:
> > > Make changes to the code that limits the PCIe max speed.
> ...

> And here I thought that uXX_replace_bits() was the up-and-coming
> solution to be used :-)

:)  Yeah, I was kind of surprised that it isn't used more, given that
it was merged in 2017.  And it *does* reduce some repetition, which is
definitely an advantage.  But the fact that those functions are hard
to find with grep is a big turnoff for me.

I wasn't really a fan of GENMASK() and FIELD_PREP() at first either,
but now I'm a big fan because you don't need _SHIFT #defines and it
reduces shift/mask errors.  So probably the same will happen with
uXX_replace_bits().

