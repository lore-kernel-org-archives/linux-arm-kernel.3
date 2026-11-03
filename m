Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57713606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aw1goCmt;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dkeideyj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6pvXqxRXPMjsEETSg9LNTP6JozH1dAr2ppJVpOpiMJg=; b=Aw1goCmtzbzh4y1x+sLL9DIeu5
	aO1b7zMjb3hpofN01qvLbv5OpBWhaAATMltZrgRgi4jB2prGpQJtXyzHce0BhTzZIT3AmmniWaBkQ
	7yc/jhI1Rtdlf4Q5QRwfZ3ZntLxAYk1Jmlm3Qa+JR598DHUTsCXx3BHmVdgsOX841KoqA/bFyXx/6
	qCyiJ3F15oiD5TEk6Q3znAvASTcxPvdQM12CJ082GG5e7SaN2OuirW9jUY7OYPj0cAWkgDSn06T54
	FCrhBfY5svQDbD9MZ8ZbOKw5DskoqSoForUCZE2fhH7hpopJjljGpqwPXtEHJVjCeKg8DtErM+cu4
	om1YcqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIAT-00000003Hv3-1rCM;
	Tue, 03 Nov 2026 17:19:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIAR-00000003Hu7-0wHc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:19:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32EE81595;
	Tue,  3 Nov 2026 09:19:23 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBA343F673;
	Tue,  3 Nov 2026 09:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793726366; bh=NkN3i0ej3cUcmuSflm8MM+RqtYaqbkaxPdwWJVsyp4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkeideyj6Sh0JkCmgr5ctazcOfhVYfazcBnETkpe79Gaea6qKPPR0ALLDtAeyUiXl
	 Na4ewsHg8KUfgIgS/MNtn5bxj50NwH6VJEoN4skBpFoYfvoEaKMnrzQ6jpBIOe0jsn
	 KQ8vPcM8z/kb1bnC+3YIzjr7U6nLvmaeaMWSZbiI=
Date: Tue, 3 Nov 2026 17:19:22 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: will@kernel.org, mark.rutland@arm.com, ardb@kernel.org, song@kernel.org,
	dylanbhatch@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: module: Use text-poke for late PLT/veneer
 emission
Message-ID: <auoXmvKObg3IWWTD@arm.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
 <20261010085055.2200241-1-qirui.001@bytedance.com>
 <20261010085055.2200241-2-qirui.001@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010085055.2200241-2-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_091927_402333_82631E18 
X-CRM114-Status: GOOD (  17.23  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 10, 2026 at 04:50:55PM +0800, Rui Qi wrote:
> diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
> index 7afd370da9f4..fa89ed014bd1 100644
> --- a/arch/arm64/kernel/module-plts.c
> +++ b/arch/arm64/kernel/module-plts.c
> @@ -9,6 +9,29 @@
>  #include <linux/module.h>
>  #include <linux/moduleloader.h>
>  #include <linux/sort.h>
> +#include <linux/text-patching.h>
> +
> +/*
> + * The .plt section is marked ROX once the module is fully formed, so
> + * late (livepatch) relocations that emit PLT entries cannot use direct
> + * assignment.  Mirror WRITE_PLACE() and route the write through the
> + * text-poke API when the module is already loaded.
> + *
> + * Return: 0 on success, -EINVAL if the text-poke write failed.
> + */
> +static int plt_entry_write(struct plt_entry *plt,
> +			   struct plt_entry *entry, struct module *mod)
> +{
> +	if (mod->state == MODULE_STATE_UNFORMED) {
> +		*plt = *entry;
> +		return 0;
> +	}
> +
> +	if (!aarch64_insn_copy(plt, entry, sizeof(*plt)))
> +		return -EINVAL;
> +
> +	return 0;
> +}

As your comment says, this is fairly similar to WRITE_PLACE(). Can we
have a single macro that's used in both places (and maybe give it an
arm64 specific name if it ends up in a header)?

Also do we need the !NULL check? plt and entry should be 4-byte aligned
already, so it's an unnecessary check. WRITE_PLACE() doesn't do this
either.

-- 
Catalin

