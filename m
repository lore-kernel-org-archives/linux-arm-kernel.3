Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA8A6082BFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZVf0fmXl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nA3OMBqW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GAY7T9NQ/2byBz25PRaY9dnQ/M+bRZtNm/ceVen4yX8=; b=ZVf0fmXl/h+RZFyktt8wAwmYew
	AfZhNhH9oVLoGs8MtjUrg3AdKAaGUSWYiG/oQiNnX/8pvivL2FtSL+BQCR5nANMJsCnRQq1z6BeCN
	UUKEJ9lx4KSt/4ydbCQF7gFSGmmYwJEpCmrX+r5RqH0XuFtI8zYyU5qQbHlUuaKG/mLtlcm26hXHE
	nxGD1gIfl9eRWsHmuB7ytrnVjh0g8S7xMKDMB/4JTzUjjeriRg4Fj+XS4/cTbDvambhF9JaMNS7yM
	9k73My90BNoWNMyPeQQ4AbFofaSrx2+C9i1C49hyBvkpfh1xBCHQhREwTrQ92shLMKn0gimiVgfV4
	H+H6z/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCoD-00000002CWV-3bld;
	Tue, 03 Nov 2026 11:36:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCo9-00000002CO7-0VDs;
	Tue, 03 Nov 2026 11:36:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BC6B43BEF;
	Tue,  3 Nov 2026 11:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC561F000C1;
	Tue,  3 Nov 2026 11:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705764;
	bh=GAY7T9NQ/2byBz25PRaY9dnQ/M+bRZtNm/ceVen4yX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nA3OMBqWR3BQKf86wg06Nkoydxsho4x5uDILtm0Wr4EW2r2fdhXIP5OCdlAW4ZDaq
	 0BJft8wJVNe5odsp9CN31xIr5c8PkYsezfZitLD659jFaV6L6smQxMcklu+aX5lZEO
	 Vb3cUdHRZdLiVVpoqlbqTXZ8h+APFIqpnQdOJ+TfmL8+wpGtKrgBR1osymsimxZCkI
	 QkBLZg9Y+v/+Hvut5kBk0l0a9WTRfC/j5DSnPW5ywu0eCHNv0JnPpAf/Ma6d/otvBo
	 d9LlnSqLIAEx1PLOfF5lKfUFFyv/ejU7ssVijiIBTWOTCrm3VYJxZNPJRnt1SHOJaI
	 GFS1LbeJoZoVw==
Date: Tue, 3 Nov 2026 11:35:59 +0000
From: Simon Horman <horms@kernel.org>
To: Alexander Goodkind <alex@goodkind.io>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tarick Bedeir <tarick@bedeir.com>
Subject: Re: [PATCH net v2] net: ethernet: mediatek: preserve sibling PPE
 bindings
Message-ID: <20261103113559.GH865646@horms.kernel.org>
References: <20261030010517.45639-1-alex@goodkind.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030010517.45639-1-alex@goodkind.io>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 06:05:17PM -0700, Alexander Goodkind wrote:
> __mtk_ppe_check_skb() clears entry->hash for flows bound to other
> hardware slots in the same software hash bucket. mtk_flow_offload_stats()
> then skips their hardware counter updates. L2 cleanup also frees sibling
> subflows without invalidating their hardware rules.
> 
> Restrict both cleanup paths to entries assigned to the inspected slot.
> 
> Two UDP trials reproduced the counter failure on a GL-MT3000/MT7981
> running unmodified OpenWrt 25.12.5 with Linux 6.12.94:
> 
> 1. Start a UDP connection.
> 2. Add a control connection in a different hash bucket.
> 3. Add a connection in the first connection's hash bucket.
> 
> AI code review of the original patch identified the cleanup problem
> in L2 subflows.
> 
> Full ARM64 builds with allmodconfig and allyesconfig passed before
> and after the patch using GCC 14.2.0 and W=1, without new warnings.
> The builds used CONFIG_WERROR=n because the unmodified ARM64 kernel
> already emits warnings. Hardware testing has not run for this revision.
> 
> Fixes: c4f033d9e03e ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
> Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
> Link: https://github.com/openwrt/openwrt/pull/26107
> Assisted-by: LLM
> Signed-off-by: Alexander Goodkind <alex@goodkind.io>
> ---
> Changes in v2:
> - Apply the slot check to L2 subflow cleanup as well.
> - Add the Fixes tag for L2 offload support.
> 
> V1: https://lore.kernel.org/netdev/20261023012529.5994-1-alex@goodkind.io/
> 
> Codex assisted with investigating the counters and preparing the patch.

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>


