Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED7C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohCohA8pO/aLaURdh5N8y4309+qrDGsYRc0D3wSsgsI=; b=XmNZFIb9uv7EsP9SaJ2wuAUMRR
	Xlh9JIMGfLUBYCFcfz93GuuDqJPOPqzSPI51YbZnom6crryfA/avxXmh4dyoc0Q/fBbmIuEoEFwmt
	znia0Aqcm42DJygxn6a2jH1EALKSsDrBuk4ilTJN4CnCGvmhcxBsfLJPsvG4mIekx0AKt8ddvg1YT
	dzmnAVP9i+FaFINeCy3raaAJyZOKQR7zC3Gn7Ktay/BQ2aTU95Jk/MzYV9rAHrHfpZey2bW7Cg17L
	pQ+4VZqDIN3knG8DFAXAV2PtrHHGlq1dEcjb2BWtF8vQEO8LzFguV6lrZkFg8BnQV5/QkZCQdVtIX
	Cmt14URA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rgH-0000000AlXC-0BpL;
	Tue, 29 Apr 2025 20:35:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYl-0000000AkT1-3rvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A6DCA4C0CA;
	Tue, 29 Apr 2025 20:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA7FC4CEEA;
	Tue, 29 Apr 2025 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958487;
	bh=q5qnGWin/gWeyke8MwKqAHQ6UyRcIimhz3Mx7LaAL8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfRQnp0d/aFuC6pYINtv3BmNH59De0BoqRJP1lna4Yf88BVRO/UDm/Ndf8CqO84IR
	 9n9f7Fc0JuzJ8brIHC6jI4dFE1d9dxurYesJNRjn/Vp2PSdhpmWE30YipQQJymPKV0
	 AyQxBV+vWUq+ATWL8faysa06Lr8PhO6A30XNndaygrMZdjxJPTwxxRcK5H5bG7+REn
	 Oq/R0yW7IIU+8+MToQHTShEPdTQHtwdORqV6u4uP+txoj/Apo7dREagtHISob2LKRi
	 DUpf4tSI3zrKUmf2s6PfiAxs4SvHCQaRd0DbqA736sQwbvhgSCvJiopWQ1Ykk2FHPZ
	 Gqe5ophSDqGvg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Dev Jain <dev.jain@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	gshan@redhat.com,
	rppt@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn,
	ardb@kernel.org,
	david@redhat.com,
	ryan.roberts@arm.com,
	urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
Date: Tue, 29 Apr 2025 21:27:45 +0100
Message-Id: <174594039520.474971.2876521667626295214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
References: <20250403052844.61818-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132808_032190_9E640163 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, 03 Apr 2025 10:58:44 +0530, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
> which does not support changing permissions for block mappings. This function
> will change permissions until it encounters a block mapping, and will bail
> out with a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change. But this is a footgun waiting to
> go off, so let's detect it early and avoid the possibility of permissions
> in an intermediate state. So,  explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
      https://git.kernel.org/arm64/c/fcf8dda8cc48

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

