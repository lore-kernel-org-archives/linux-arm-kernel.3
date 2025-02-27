Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582A3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 01:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSv+cwsFRwVh/8elVXcAColPKBd5X2nwPYiupPML4Bc=; b=GuNpp7raCjd6QR0038XaMTqZss
	hD/8TDAlE2pDjG7nbsjRTWGWPAjoBkbA0gQszPwFu6c2AqHbZNHQn33wJ5Bv4dpPTFpG256pDL2wt
	hKgpBJEeOw1K+mhZhxvKGxNBAbenEBpli6qLk7UNIJORk6x+HTETCG6kCNlPcQElUrcoX/08Ix/dW
	If0tbuA5DpbTz+Pvn1ZAm0zBQi6RGw0b0SL+ACR9o8nYxfHDEZ+IwLQjy86zIZC9btosPKjbWN2AG
	ZwBqVyjffRD23xdjysGb3qdZMf+0/Mh5ohq9QLcoNrj9G6czDLggdUbUHPqrZkh3S2Ed/oO5vIOpS
	v/DwOXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSqn-00000005xYw-2MZZ;
	Thu, 27 Feb 2025 01:38:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRgh-00000005oBp-2WcL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D00835C75C4;
	Thu, 27 Feb 2025 00:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD563C4CED6;
	Thu, 27 Feb 2025 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740615818;
	bh=arZMEBXiCeOAemtlaMD2whA3gu7IqKG3QKa02itcVOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2xqihsoUtx0mnh8RLLIjEAjPgloTP001LONjPAwoV/xeiJy8u+h01ej7a1b68K+7
	 jUWOnoHeJxZDumCmTj/ZzoZaZG9ydutU8FnLZBzWkpQMicwuNBvJXS2zrYCAs4X0PK
	 9kteFfAcP9iTwJz0s6ulQ9jOb9Lt2ihSF97X8Vw3k+vC3npgDNha5RcKi1axciDgWl
	 bQ11PamfREIi44x+J2k4VjfstgeKYqFPYJi2np1bifjKJWgWJtGvY9/9IF2ysvlNd/
	 vbi3gA4SceTDZaht2tDFNVSpwr3sVxPgE21Im3ifhTnJ3VD2AkKkqxicmsGA5ts9Yd
	 gDhpiL5fqcsDw==
Date: Thu, 27 Feb 2025 00:23:31 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v7 09/11] arm64: Enable memory encrypt for Realms
Message-ID: <20250227002330.GA24899@willie-the-truck>
References: <20241017131434.40935-1-steven.price@arm.com>
 <20241017131434.40935-10-steven.price@arm.com>
 <5aeb6f47-12be-40d5-be6f-847bb8ddc605@arm.com>
 <Z79lZdYqWINaHfrp@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z79lZdYqWINaHfrp@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_162339_726262_D4583FA7 
X-CRM114-Status: GOOD (  24.30  )
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

On Wed, Feb 26, 2025 at 07:03:01PM +0000, Catalin Marinas wrote:
> On Wed, Feb 19, 2025 at 02:30:28PM +0000, Steven Price wrote:
> > > @@ -23,14 +25,16 @@ bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED
> > >  bool can_set_direct_map(void)
> > >  {
> > >  	/*
> > > -	 * rodata_full and DEBUG_PAGEALLOC require linear map to be
> > > -	 * mapped at page granularity, so that it is possible to
> > > +	 * rodata_full, DEBUG_PAGEALLOC and a Realm guest all require linear
> > > +	 * map to be mapped at page granularity, so that it is possible to
> > >  	 * protect/unprotect single pages.
> > >  	 *
> > >  	 * KFENCE pool requires page-granular mapping if initialized late.
> > > +	 *
> > > +	 * Realms need to make pages shared/protected at page granularity.
> > >  	 */
> > >  	return rodata_full || debug_pagealloc_enabled() ||
> > > -	       arm64_kfence_can_set_direct_map();
> > > +		arm64_kfence_can_set_direct_map() || is_realm_world();
> > >  }
> > 
> > Aneesh pointed out that this call to is_realm_world() is now too early 
> > since the decision to delay the RSI detection. The upshot is that a 
> > realm guest which doesn't have page granularity forced for other reasons 
> > will fail to share pages with the host.
> > 
> > At the moment I can think of a couple of options:
> > 
> > (1) Make rodata_full a requirement for realm guests. 
> >     CONFIG_RODATA_FULL_DEFAULT_ENABLED is already "default y" so this 
> >     isn't a big ask.
> > 
> > (2) Revisit the idea of detecting when running as a realm guest early. 
> >     This has the advantage of also "fixing" earlycon (no need to 
> >     manually specify the shared-alias of an unprotected UART).
> > 
> > I'm currently leaning towards (1) because it's the default anyway. But 
> > if we're going to need to fix earlycon (or indeed find other similar 
> > issues) then (2) would obviously make sense.
> 
> I'd go with (1) since the end result is the same even if we implemented
> (2) - i.e. we still avoid block mappings in realms.

Is it, though? The config option is about the default behaviour but there's
still an "rodata=" option on the command-line.

Will

