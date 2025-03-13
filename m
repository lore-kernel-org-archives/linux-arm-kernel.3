Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A2AC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 21:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkWJgCpi4IMDDL0/3GZ80gBUzVHdo21aXQE6CJSvNic=; b=dGuFZpjOSSvuCBZxrdA1Pqvj6L
	8xxYdEWovcWn0LRF30gAK6Wsf6LstiDNivrZnmfz2FQUOFRmmXIiRAZqbjaDcegg+Di7MtkNp3jWu
	hrzYH9bOTgCEwGQabjvt8rXzILymQWfAF0p5IbxxXmGHffmLpQY0VvQTmE1RKsZqOXMoACbgY39Nf
	3cg2q09I+504BRnBWD7LcgYea1RDpB6J4nGrm6OANeLIzwZGo4we1ISdy4Y9nY40ABRDGaBcNbbI/
	q4gBrgF2t5FZLg5HZjKa/vl4BTOrl479Qm2jaylQCU6EzgpInikzZpbfgAsysvUhjql1rlLe9v7Z0
	cDFqx/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqZA-0000000CZQM-2v8X;
	Thu, 13 Mar 2025 21:58:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqXV-0000000CZ3F-21dy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 21:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBE8FA4871A;
	Thu, 13 Mar 2025 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658C2C4CEDD;
	Thu, 13 Mar 2025 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741902988;
	bh=TKbcK7oZnLUUFbewILYOfqu9OkRqcOXwMXKVHin0yq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCiqFnpCEhmcNzdl5VjMdUP4t7FYJuXbcBM4C7NMRZE9AaR+m0pEsDTdD7vMsnUNb
	 8oqi41wh1aMVJCjG3bAZuUTpqyIhDpJj/0yiwMXpGj5mwhtKWa88vhSCUtJPdsrdOB
	 zZthIx+NCpjVKdJ3msZjys79AOyGfIPK+YS/R67+V3j/18TXu2133YLcVbedYvfRmx
	 msFlCbC7wqmzncu8uVMGRPQ5vzBN18HjBi2mQNPv1OLKL9JvQlyV1EISclMd6PjQnu
	 /GTW/AczLkojfdfl7bK5NZBTayXpIWKmQ93DeP9J57qUnnhYTqUpNz5c3qfIFLtvf4
	 /VTpnGzBmL0ew==
Date: Thu, 13 Mar 2025 21:56:23 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	broonie@kernel.org, maz@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64/sysreg: Enforce whole word match for
 open/close tokens
Message-ID: <20250313215622.GA8101@willie-the-truck>
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-3-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115162600.2153226-3-james.clark@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_145629_588085_F1C2E47A 
X-CRM114-Status: GOOD (  16.56  )
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

On Wed, Jan 15, 2025 at 04:25:56PM +0000, James Clark wrote:
> Opening and closing tokens can also match on words with common prefixes
> like "Endsysreg" vs "EndsysregFields". This could potentially make the
> script go wrong in weird ways so make it fall through to the fatal
> unhandled statement catcher if it doesn't fully match the current
> block.
> 
> Closing ones also get expect_fields(1) to ensure nothing other than
> whitespace follows.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/tools/gen-sysreg.awk | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index 1a2afc9fdd42..f2a1732cb1f6 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -111,7 +111,7 @@ END {
>  /^$/ { next }
>  /^[\t ]*#/ { next }
>  
> -/^SysregFields/ && block_current() == "Root" {
> +$1 == "SysregFields" && block_current() == "Root" {

Stylistic nit, but could you just do:

	/^SysregFields$/ && block_current() == "Root" {

instead? That way the diff is smaller (well, same number of lines) and
you avoid the ugly $1.

But I'm not an Orc, so who knows...

Will

