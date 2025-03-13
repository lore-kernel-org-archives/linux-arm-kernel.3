Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C9BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 22:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTjXi1T4bUJ19yI/wgfa+d+7wu+qFfENxpFZSodUzTs=; b=v/gGMd62mfQuMvKk+6ezUAyHNx
	v3NoleQlj3Q4cLBBHuQxAvKBQbVNIprDwZX5AcdRF6cLgqQaX4LgZY9PNxahellZ6vtldXPF9MlJG
	BbVoc4/mJ8I2KCfDceC4WsHuvCu9oyzMM085XT38G0cSKOyc4Tj92sW0vBEDi5jaQg6Lqbu5RHlMH
	LIT1s1Y/l7sPRA1Mq8yyO3auve6W4k9dfd9hGAxWbb8EY65wBRietUxEg/742r2TfVB6VdO/+t9XP
	d5UjBl5LHvkiHFHyKcLLb6hq9J2A3fDe4jT6rq+sO8E0yTgWQDWXGnHyC72g6iFWRyBQ82DLK9QLL
	VyZjJ8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqcS-0000000CZsd-0kME;
	Thu, 13 Mar 2025 22:01:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqZj-0000000CZYO-1ms4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 21:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 116765C5FC3;
	Thu, 13 Mar 2025 21:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B77C4CEDD;
	Thu, 13 Mar 2025 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741903126;
	bh=CMEdgnjugZeUToy/g7hT35ZGBDAhS0urRzVAaSlc6YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxMHWsAx+I68z884Usre4kpVRjdwCLYi9Cq1J01YOTPDs39rR4XfLx0jDR/jZkxEB
	 U/cQxUbF73mJOREp1r1jnijY5jUgWxQfC1gpfVZL7tFedXS94eVIaDq5t0Vafl4PZa
	 tuNQAy8NY4WdxtDTusyMrwB5mhDEntOXQ2IjidDq0f/xhr+5J7N23e4bNv1wyShjji
	 ES2JKPSRFa7C10a79AKPCi0IQIq0E9cIwQE1nI6QD7Lp19479h4WQA9zmrEbB+jF5d
	 pqat+hZhrdwGPGEtHF1MZ411fRJ7fOXYgqWQ++8U8niwLL2ikMHPH10daj84LwYm08
	 HcbpBME82LTHw==
Date: Thu, 13 Mar 2025 21:58:41 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	broonie@kernel.org, maz@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64/sysreg: Sort sysreg by encoding
Message-ID: <20250313215840.GC8101@willie-the-truck>
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-4-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115162600.2153226-4-james.clark@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_145847_508039_DF438C8F 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Jan 15, 2025 at 04:25:57PM +0000, James Clark wrote:
> It's mostly been sorted by sysreg encoding, but not 100%. Sort it so
> new entries can be added without wondering where to put them.
> 
> The following python script was used to sort, keeping the top level
> SysregFields and comments next to their current Sysreg entries by
> splitting on "EndSysreg":
> 
>   # cat arch/arm64/tools/sysreg | python3 sort.py > sorted-sysreg
>   import sys, re
>   def key(block):
>           reg = r"\w+\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)"
>           match = re.search(reg, block)
>           sort_val = ''.join(f"{int(n):02d}" for n in match.groups())
>           return (sort_val, block)
>   sysreg = sys.stdin.read().split("\nEndSysreg\n")[:-1]
>   sysreg = sorted(sysreg, key=key)
>   print("\nEndSysreg\n".join(sysreg) + "\nEndSysreg")
> 
> Tested by diffing sorted outputs:
> 
>   $ diff <(sort arch/arm64/include/generated/asm/sysreg-defs.h)  \
>          <(sort before-sysreg-defs.h) -s
> 
>   Files /dev/fd/63 and /dev/fd/62 are identical
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/tools/sysreg | 1006 +++++++++++++++++++--------------------
>  1 file changed, 503 insertions(+), 503 deletions(-)

This looks like unnecessary pain for backporting...

What do we gain from sorting this?

Will

