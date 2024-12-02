Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21498D7833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVlR4u3XPTn/rMu+TnprxAhfo8+DFJbzzsjqMS/n4SU=; b=qG1yXAF30SDVkWby6tav1/6gQ6
	1oFN1hif2HNzP+OZLHYw2yN5vcPTVlHDOkHSzQMVQ44abRAdGREUWdbypGnXFj3jzv4jit4Nhj6UZ
	iHptnNAhcYEP0Lday5HbORTd9dptib1YfnIarhiAumHwEuxhy+QxjeDjfv8GU+Q1iQFrMNiSgO6kG
	9mtX909L0hp2iYy6QSnPb2RFnxulWAf56UUdNuoiQKsO1w22vTtgdgfbh0pcFJO4aX5xnn9/Ehpw0
	cboX3kISwIuwdj+EYe4zOq2jd3UgfDhMBsYg6GKjNL9yd4oKzUgkrENHw26vkOKhHstD/dJex/Cht
	npFCwl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAak-00000007568-06aZ;
	Mon, 02 Dec 2024 17:52:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAU8-0000000742w-1q1u
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LVlR4u3XPTn/rMu+TnprxAhfo8+DFJbzzsjqMS/n4SU=; b=Bm4tiwNfR26ZPEywRM+FbcPQN0
	St2JrsxIbSoFpy2nRhikd6Si5q7/3pWUDM8kNVCpoW3CEO0f7AoG83Zet+GovRfFYQ/6FKSXILqF+
	xD4oP6g2pYdolLa8r6zrEaqq4Fc0iKGYt6JJOPTahs3J63EWqAB+SxAZzxGz8ClA6BTU7PP/43Cpv
	ks4WEeSLzPO1vSB1DimCX7cLewus7PDT+LGFjw6vyqY7KkGFmqNslt08fC/wiQrnpSJEo2w8ZsnMt
	sMEGVfM3zIamO2X5trytG4L66Rn2EjXpPbqZ3Exp94HRKzlu/6xfT5nd/HQB7gGCPYDJH3nOOPMV1
	fi+QQmLA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAU5-00000002DxE-06IJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:45:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 812731007;
	Mon,  2 Dec 2024 09:45:46 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0A2F3F71E;
	Mon,  2 Dec 2024 09:45:16 -0800 (PST)
Date: Mon, 2 Dec 2024 17:45:11 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, hch@lst.de, rppt@kernel.org,
	thuth@redhat.com, will@kernel.org
Subject: Re: [PATCH] arm64: patching: avoid early page_to_phys()
Message-ID: <Z03tNWwlOz3Iil9J@J2N7QTR9R3>
References: <20241202170359.1475019-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202170359.1475019-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_174521_285861_9CD67FEB 
X-CRM114-Status: GOOD (  11.90  )
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

Looks like I messed up my text editing and left some bonus words...

On Mon, Dec 02, 2024 at 05:03:59PM +0000, Mark Rutland wrote:
> When arm64 is configured with CONFIG_DEBUG_VIRTUAL=y, a warning is
> printed from the patching code because patch_map(), e.g.

That was meant to say:

| When arm64 is configured with CONFIG_DEBUG_VIRTUAL=y, a warning is
| printed from the patching code, e.g.

[...]

> For historical reasons, the structure of patch_map() is more complicated
> than necessary and can be simplified. For kernel image addresses it's
> sufficient to use __pa_symbol() directly without converting this to a
> page address and back. Aside from kernel image addresses, all executable
> code should be allocated from execmem (where all allocations will fall
> within the vmalloc area), and the vmalloc area), and so there's no need
> for the fallback case when case when CONFIG_EXECMEM=n.

That last sentence should have been:

| Aside from kernel image addresses, all executable code should be
| allocated from execmem (where all allocations will fall within the
| vmalloc area), and so there's no need for the fallback case when case
| when CONFIG_EXECMEM=n.

I can spin a v2 with those fixed if necessary.

Mark.

