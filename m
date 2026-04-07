Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DE2EDB7D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzYf1Hv2JmuH8VIiQtUJrr8SNTqHqZ6SpcJMeA9CfZQ=; b=BJzrc1Xj7G8IwGBhXL2iUeUR/2
	zCi69+AEL9XDks/5LWg3F+UQk6OCIB+cPaDQAeQQo/yQJ2rN6uVgupSVRV8mtAZJuLKKEYSiKTULQ
	fuDs+mcDFfrov996UiNEDOQmbk8uhQeAyAm6hLLAHECEm2TZ4qogTxxvA5TQqHUdq7waRROm3aYWs
	dsV9Aeq6B0XBcOCGk2z/rF8fWA7r5ie2A2y40xmlUfdTDHoTwBLxDf1edBAEUyx/bnMwmk7jMO5Bc
	m1IanTRmoFylPxpIkFU7Pp/DidnHqT8bqafYDd24Z8GyXirPLohwx28u+cAPD7j+p/RU27WSKbb1B
	fbsfQyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2nA-00000006E52-17Gl;
	Tue, 07 Apr 2026 09:32:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2n7-00000006E4c-3INm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:32:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74C121A00;
	Tue,  7 Apr 2026 02:32:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8770B3F7D8;
	Tue,  7 Apr 2026 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775554330; bh=bghqVgVi2rFpebPFdJZ8KlldKSei03ZbC3RuMA7fBIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhWYcbEhkFfiMRGOXn92UL+3h4avxJGszc0GnCTCQst0YLBovrcfCb2id6UFMHVgq
	 lNnUC1uqwmd74JeQbK0LBmuCFiIYw/dECq6d/pDT8ZmGmNiVDaNDy6eOI8/ZkgUczG
	 Zz1hOhxPL9x+aJNcEQBXD2WbAyOcplVVWlsipxo8=
Date: Tue, 7 Apr 2026 10:32:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adTPFrlVCEt-hioX@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com>
 <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_023213_884388_35E864DE 
X-CRM114-Status: GOOD (  23.39  )
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

On Tue, Apr 07, 2026 at 09:43:42AM +0100, Ryan Roberts wrote:
> On 03/04/2026 11:31, Catalin Marinas wrote:
> > On Thu, Apr 02, 2026 at 09:43:59PM +0100, Catalin Marinas wrote:
> >> Another thing I couldn't get my head around - IIUC is_realm_world()
> >> won't return true for map_mem() yet (if in a realm). Can we have realms
> >> on hardware that does not support BBML2_NOABORT? We may not have
> >> configuration with rodata_full set (it should be complementary to realm
> >> support).
> > 
> > With rodata_full==false, can_set_direct_map() returns false initially
> > but after arm64_rsi_init() it starts returning true if is_realm_world().
> > The side-effect is that map_mem() goes for block mappings and
> > linear_map_requires_bbml2 set to false. Later on,
> > linear_map_maybe_split_to_ptes() will skip the splitting.
> > 
> > Unless I'm missing something, is_realm_world() calls in
> > force_pte_mapping() and can_set_direct_map() are useless. I'd remove
> > them and either require BBML2_NOABORT with CCA or get the user to force
> > rodata_full when running in realms. Or move arm64_rsi_init() even
> > earlier?
> 
> I'd need Suzuki to comment on this. As I said in the other mail, I was treating
> this like a pre-existing bug. But I guess linear_map_requires_bbml2 ending up
> wrong is a problem here. I'm not sure it's quite as simple as requiring
> BBML2_NOABORT with CCA as we still need can_set_direct_map() to return true if
> we are in a realm.

can_set_direct_map() == true is not a property of the realm but rather a
requirement. In the absence of BBML2_NOABORT, I guess the test was added
under the assumption that force_pte_mapping() also returns true if
is_realm_world(). We might as well add a variable or static label to
track whether can_set_direct_map() is possible and avoid tests that
duplicate force_pte_mapping().

This won't solve the is_realm_world() changing polarity during boot but
at least we know it won't suddenly make can_set_direct_map() return
true when it shouldn't.

-- 
Catalin

