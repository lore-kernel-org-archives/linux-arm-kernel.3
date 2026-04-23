Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A4BF589B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRZHunwqpGKvYmD4/rkQ3r0mzopcgkTtmIIZTPOi+ZA=; b=M7FQZfCmgJ/tgPqwJnXNJaKnYb
	wqFJh59CE03QgvzCqP4mAp7PkgmQHaKat2PpsynPy4lptTFAJukgu4E6wgfO6CV6sV1F/KeJimMf5
	2c8tm2zpyHTCIJ7PYGMmj3+xPABLvoCRaQ+sJ7IpchH88IBN3B9tEn3RtY5PEf4gXyDL7zEun4Zll
	hFb5aF4Wp3xrRc0tT/oVM2IeKYx/1stJlzhiKjYaYemQL8o1SbrDNf6DUmGSFcmIdyWjvSs5NtiWv
	bJ6BU5smx/EEM9RDMSRypKt4Spa4xcdC7xRF5b1vXju50snDGiVaqFJgVTx2AuFpcnW8UuYW3RRpI
	17L6Fj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtMl-0000000BdF9-0m9E;
	Thu, 23 Apr 2026 12:41:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtMj-0000000BdEq-1oJl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F5C96013B;
	Thu, 23 Apr 2026 12:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACC1C2BCAF;
	Thu, 23 Apr 2026 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776948068;
	bh=waRGdMVTGVjwfTHHNSZiaOBkzZauKK4J5ylDPvGMmqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1gFEBpCXaCBrvHhG7Fi7ZdIDlUyoXwTmnxT4GelYwpaox6L0EHL56esiwLVXT+dp
	 1GA+DaCiB+4RtExyiVDvFcHpcPmtlUhrG+CiRW4KjiVqzbuOqthQ/rt+qRZ6iteWsA
	 j4AaEF7Ymnu+4hABQkBgRHqSzwwLdZOkBlGwkkK/rkYMxjI3v0FucRcYP8EQZ4hKpY
	 zpWfu6h5qy144PW8xEtEWdUPQDKR95V+1rt+5ZUgwL19Pl2WEBZwhzakNcodTvdGRx
	 zoxNxXja2HHMiVGcGIeP7CcMNtqg8R6hNDKuv6IzmdNYrhKw0cdaALkeGTQl/rVkvX
	 h/3Kn1qOTRuQA==
Date: Thu, 23 Apr 2026 13:41:03 +0100
From: Will Deacon <will@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: signal: Preserve POR_EL0 if poe_context is
 missing
Message-ID: <aeoTX_6nK6oHw5OE@willie-the-truck>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-2-kevin.brodsky@arm.com>
 <aei87MmXaEdg8YOf@willie-the-truck>
 <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>
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

On Wed, Apr 22, 2026 at 04:55:05PM +0200, Kevin Brodsky wrote:
> On 22/04/2026 14:19, Will Deacon wrote:
> >> @@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
> >>   * This state needs to be carefully managed to ensure that it doesn't cause
> >>   * uaccess to fail when setting up the signal frame, and the signal handler
> >>   * itself also expects a well-defined state when entered.
> >> + *
> >> + * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
> >> + * of the remaining fields is valid (has been set to a value).
> >>   */
> >>  struct user_access_state {
> >> +	unsigned int valid_fields;
> >>  	u64 por_el0;
> >>  };
> > Do you think it would be worth adding some accessors to make it easier
> > to keep the flags in sync? For example:
> >
> > /* Stores por_el0 into uas->por_el0 and sets UA_STATE_HAS_POR_EL0 */
> > void set_ua_state_por_el0(struct user_access_state *uas, u64 por_el0);
> >
> > /*
> >  * If UA_STATE_HAS_POR_EL0, *por_el0 = uas->por_el0 and return 0.
> >  * Otherwise, return -ENOENT.
> >  */
> > int get_ua_state_por_el0(struct user_access_state *uas, u64 *por_el0);
> >
> > WDYT?
> 
> I did get a feeling having helpers would be a good idea. I wonder if
> getters/setters aren't a bit overkill though, as they make accesses to
> the struct more cumbersome and we'd need a pair for every member (unless
> we use some macro magic).

We only have one struct member, so it's probably fine for now, and we
could group related members together in sub-structures to help in future.
But it's up to you -- I don't feel strongly about it, but requiring the
caller to update the flag manually is going to be a bug magnet.

> Maybe it would be sufficient to have say
> ua_state_has_field(POR_EL0) to check if the bit is set, and
> ua_state_set_field_valid(POR_EL0) to set the bit?

I don't think that really helps with my concern. I'd like to avoid callers
having to remember to deal with the flags when they update the data.

Will

