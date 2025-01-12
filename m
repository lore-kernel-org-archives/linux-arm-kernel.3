Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78471E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLIBK3rk4FZvefXRrp/h66V6u/1v8yJK25LGqINfgME=; b=jJUzt6oqaFkOdxTqBQTWUB6/uQ
	c3muTs61NxEjgWQ92iqKXf1qn+pwBm31CaGCJ3OXPyGS2UeJ0QY61DvZ2YeQCrrgcOELnvGOVAV1I
	S5EgdPF2NNjmMKkWJvBG/JS6/QS2v4ntTxgDs4eEu24qVFKenK7jTS5l4fcPiCodULuXeC8daVEo4
	PhzHBSe5/ynrBHLK9+0vLLLV6/gqk6l5B1mvrMB4tIMsAA4kfaFq4eT6D7q8D/2fdN17hLWMSOoCx
	9YHkM1mlR8m6y6ZV2/2BibNtcECNE8vfNimZfAOBBubgmGjR6aR1Q8OR9agXIlfEnmJ8Lyv0MTX04
	uUTvOgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWwZm-00000002cdV-3s1A;
	Sun, 12 Jan 2025 11:56:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWwXf-00000002cKQ-0gDh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 11:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD34E5C3A7B;
	Sun, 12 Jan 2025 11:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13B8C4CEDF;
	Sun, 12 Jan 2025 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736682846;
	bh=k9CUYWfksPToLLELTTvrBkhNkzM6VlpA7t8yoRYCU6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X10MBEIyhoPuClKxHrwevxo6PbuR0AuZt/CWbNasgn/OF+CGu716enYtbB1AadHPR
	 n84wL4ThACtPdQNsMH66UqqS1WWRpKesoaiiGZ78N9i0TYoml3H5NveXSJaDH+d8xp
	 dBeRJKE/iI38ZeNfWZZ07y6F+PxZgiQUdgrlMMI0=
Date: Sun, 12 Jan 2025 12:54:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: stable@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Baruch Siach <baruch@tkos.co.il>, Petr Tesarik <ptesarik@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: mm: account for hotplug memory when randomizing
 the linear region
Message-ID: <2025011247-enable-freezing-ffa2@gregkh>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <20250109165419.1623683-2-florian.fainelli@broadcom.com>
 <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_035407_258358_55D6889B 
X-CRM114-Status: GOOD (  19.99  )
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

On Thu, Jan 09, 2025 at 09:01:13AM -0800, Florian Fainelli wrote:
> On 1/9/25 08:54, Florian Fainelli wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
> > 
> > As a hardening measure, we currently randomize the placement of
> > physical memory inside the linear region when KASLR is in effect.
> > Since the random offset at which to place the available physical
> > memory inside the linear region is chosen early at boot, it is
> > based on the memblock description of memory, which does not cover
> > hotplug memory. The consequence of this is that the randomization
> > offset may be chosen such that any hotplugged memory located above
> > memblock_end_of_DRAM() that appears later is pushed off the end of
> > the linear region, where it cannot be accessed.
> > 
> > So let's limit this randomization of the linear region to ensure
> > that this can no longer happen, by using the CPU's addressable PA
> > range instead. As it is guaranteed that no hotpluggable memory will
> > appear that falls outside of that range, we can safely put this PA
> > range sized window anywhere in the linear region.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Forgot to update the patch subject, but this one is for 5.10.

You also forgot to tell us _why_ this is needed :(

thanks,

greg k-h

