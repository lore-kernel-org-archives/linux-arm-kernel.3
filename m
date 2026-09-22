Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20D2C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aha4/q4JfCKqnw/sQC0ZeUyw5tRBX2jwelFYVzPtMc=; b=1468JXk3pI9l2qfIrfPS0/LJbu
	qnhqJ6yRCNIBDiNoHAavMvytNfKFNoyjH8/3UISkvTPWKD3vcaNOYbd9o2gT4lN1Pi/OrI2LQktOC
	2+oIP2jLEQMam7VarCFpOpzhMufW38HULq9GLZkf985Z+4g3bEUcuAq9vQ/WFR1XSigiA93CHRNMF
	b6U0tgH7AQyroRT69A5bEBU1Bkwn//X6LKBN1O5Il9+zC8JKzlbZSwYQ4pGXJeOQ9o99GsF7iDCR7
	tN69PbyACTiKAF2ces5+mOBDsK1Qo8PrsH6hI6aVTPQr0VbT4HrYCPKJu4U6roeGab+rjon7CjAbg
	M15B8Qvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94si-00000006GJ1-1tmH;
	Tue, 22 Sep 2026 18:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94sZ-00000006GGr-3qD9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45C5B4333C;
	Tue, 22 Sep 2026 18:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170AB1F00893;
	Tue, 22 Sep 2026 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790100367;
	bh=8aha4/q4JfCKqnw/sQC0ZeUyw5tRBX2jwelFYVzPtMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BjeaxxhixCSh56rNWbZEIjrdJO5kUvDB4KCFv+qdZp2oxY1Zaf15Xg8lUKiwCYC5x
	 k9yo5iOInVtGXByVspjtza0DjyYVyyOTJp+OxHfatoYu209tvHbj871SzMeQNSkYdC
	 i186KSrYYfZIcW9pwYkUOCQ2OO/bmGizH6+GjchokKRatbsuAgUaMi1KFa1HCZQ/0n
	 VycmhrWGd4Y6UM7JWwS+c8vX65o+J1ucaflNimSgFpqTKbAfMGMHURS/0T+e5qYplz
	 iADoYCr2hvJaZDNJ2ykfI6VKaKS9qlPa9WeyRrv8KJ6t+WtNDh3NVEiDyYBbzL8d2/
	 /5Ke/biuqSr1Q==
Date: Tue, 22 Sep 2026 19:06:02 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Dat Mach <dmach@nvidia.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ACPI: arm64: FFH Operation Region support for
 FF-A (offset 2)
Message-ID: <20260922-exuberant-earwig-of-opportunity-4fecff@sudeepholla>
References: <20260901192906.133670-1-jamien@nvidia.com>
 <20260922-purring-fennec-of-exercise-bbce5e@sudeepholla>
 <20260922155211.676134-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922155211.676134-1-jamien@nvidia.com>
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

On Tue, Sep 22, 2026 at 08:52:11AM -0700, Jamie Nguyen wrote:
> On Tue, Sep 22, 2026 at 09:46:59AM +0100, Sudeep Holla wrote:
> > Could you clarify how the build and runtime behavior are protected when
> > the FF-A driver is disabled?
> 
> There is no build-time dependency from ACPI FFH to the FF-A driver. The
> registration direction is from FF-A into FFH: the FF-A driver registers an
> optional backend after probe and unregisters it on removal.
> 

Equally ugly. FF-A spec doesn't talk about ACPI FFH, so it doesn't
belong in FF-A driver.

> With CONFIG_ARM_FFA_TRANSPORT=n, no backend is registered and an offset 2
> access returns FFH_FFA_NOT_SUPPORTED. With CONFIG_ACPI_FFH=n, the
> registration functions are static inline stubs.
> 

So if on a platform, ASL has FFH with offset 2, we fail if FF-A driver fails
to initialise ? What if this FFH offset 2 is used in some other device
methods that need to be executed before FF-A module is inserted ? We pull
that device down as well ? Is that acceptable ?

> I have also built CONFIG_ACPI_FFH=y with CONFIG_ARM_FFA_TRANSPORT=n.
> The W=1 build and full vmlinux link are clean, with no unresolved
> references to the FF-A transport driver. I'll mention this case in the v3
> cover letter.
> 

Fair enough, build dependency was one of the concern and not the only
concern.

> > Are there any other technical justifications for this tight coupling?
> 
> FFA_MSG_SEND_DIRECT_REQ2 requires FF-A state already owned by the driver:
> the selected SMC or HVC conduit, the sender endpoint ID from FFA_ID_GET,
> UUID-to-endpoint resolution through the partition discovery ABIs, REQ2
> feature detection, and FFA_RUN handling after FFA_YIELD or FFA_INTERRUPT.
> 

Yes but are they strong reasons to break some use-case like above.

> Open-coding those operations in ffh.c would duplicate FF-A initialization
> and state management. The ops registration lets FFH use that state when the
> driver is available while degrading cleanly when it is not.

There is no state management with simple FFA_MSG_SEND_DIRECT_REQ2, it is
synchronous send request if you look at it along wih offset 0/1 and without
FF-A driver knowledge.

I need to think apart from duplication, we shouldn't have much issue.

-- 
Regards,
Sudeep

