Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2331C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJYPmXboQeojO0XbyZDuluIzJnpZa07kRJcJoEmoYTc=; b=whI8wXJzQFwRClgNgS1+JVET2z
	NV/2rOFSa3hcmnUCa2+9ARDv1vx5Fmi45DPJ3pxvM26I2LYax1Fh0GEMWiuqK52FBv9rtN/AI4nNA
	h5yUr4THWofYkaPmc849TmDXa5UB/f14q0sKYu15ariNXb7Mqr4EWg9F/BIWXXn8zPtRRU6+qEC2g
	PdQhbDgvBBliU+4UPjlAOl7q8XmvwoBedr1DmaMA6vxe4qeX5eda0GufMN7NeByu3cux4PPTbSu+E
	nZN477FBOS1zWF64K+tzoCJ+BXQyok3/UwGUk9wkJYSt0JMAWZZZ0dful6f0L0/BibUH3gtDl3Gjf
	G6C73q5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmV9v-0000000BePz-0Rfg;
	Wed, 22 Jul 2026 11:30:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmV9t-0000000BePi-257S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:30:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 471F3600DA;
	Wed, 22 Jul 2026 11:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61241F000E9;
	Wed, 22 Jul 2026 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784719840;
	bh=jJYPmXboQeojO0XbyZDuluIzJnpZa07kRJcJoEmoYTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NNcjvFBj5wBum4cD/s0P3Vl13pO221Q3UcY3hUMbRWEPxdRD4dBIh2nLIhIVgKlWn
	 pzxJSFt5B9FQkctlk3MtOcxQJjZVVNFux8nqyFYynbr0aEPUw7Au/uMF6Wdaz2Ccif
	 TAMjJT7RCS6NEm6Ol8QY7D1S5uLXnZ5QK+NQrCH27l2gZEwFwSb/Kn8rGNQwSpu3Fh
	 qg2UwW6sgouNR1gKNd7aqVHPd6sljDEiJB2nRuIgqpCVejipIiJMpcv7dhfSEIax5i
	 OUXqPryVuL4L8H//ocakDlLdFpfUkaK/JisVvTymyeHKxpbCO6vcyR8KeeE3w+cxl2
	 xCp29Y7PnxIcg==
Date: Wed, 22 Jul 2026 12:30:34 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 0/2] arm64/debug: clean up some HW BP edge cases
Message-ID: <amCp2vHU0XKhC6xT@willie-the-truck>
References: <20260527161553.97676-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527161553.97676-1-ada.coupriediaz@arm.com>
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

On Wed, May 27, 2026 at 05:15:51PM +0100, Ada Couprie Diaz wrote:
> This is a small series focused on fixing some unsoundess and edge case
> related to hardware breakpoints and watchpoints.
> 
> It is motivated in part by the recent discussion on the
> FEAT_Debugv8p6 series[0][1] regarding unclear guarantees on interruptions.
> 
> It doesn't address the issue of instrumentation, as NO_KPROBE is not
> sufficient to prevent it (specifically ftrace) and would require a pass
> over the whole debug handling code.
> 
> The bugs themselves are very much of the self-inflicted
> "you should not be doing this" kind and not urgent, but it does solve
> some of the questions on the FEAT_Dbugv8p6 series.
> 
> Most of the raw additions are comments trying to give more context to
> understand `hw_breakpoint_thread_switch()`.

Hmm. From what I can tell, these patches are trying to handle various
cases where we take a debug exception while executing the hw_breakpoint
code itself. Even with these two fixes, is perf expecting to handle that
sort of thing? I think it would be a lot more robust if we just prevented
this from happening in the first place, similarly to the discussion from
the other day around kprobes [2].

Will

[2] https://lore.kernel.org/all/alpuL10h7-OK2hFb@willie-the-truck/

