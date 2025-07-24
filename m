Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E912C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUvLVElCLSd0K3GCZddLLCKZ+5bCIdL2CnUQsssKuDE=; b=v12vCwiKiyghjFAu+CzA2yz1Ed
	7e8NjqytO+deEsHBvuTsRbiRDtH2fheY7mfXSDmyeE3iLkAB43yw1IgQcpHK15d0b6T0ar1a8WkpP
	M3j+HcNw2Dx5bhMRVt4Cz7Nypv1zm0e67gzVkP4v5dcIli5cr+w5J++2gld+2LAxu3EzY3NIR1rLq
	nCyTwPPk5wWquukSciqqRgAeU5Fy9+HEohY5wiCcBm0WcdPYsGCp384sLJmJ3vSDHeSGJw20fsIVP
	v9z4kb7hlhc+AWoA+Z8p1EgvKrikQEJ8qVgURj8Qrlr9vigI+G3DUHpIN330hcf76qbWomSkYWVVH
	oGKbdG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesMV-000000073qm-3hDy;
	Thu, 24 Jul 2025 09:35:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerFX-00000006qqn-0CzA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B67E4A55FC5;
	Thu, 24 Jul 2025 08:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C27CC4CEED;
	Thu, 24 Jul 2025 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753345461;
	bh=T2iNyoV3kaxSizudN13IYjiild8gnS6gEPKgFMynUSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F4RUMyUxtou9sEqR/wU+24u9Yx+I5G6xK/Oe+lB+vP0QaNRJMUn1//mz3Wq54sqf8
	 qbX7jfYpFsAJ1I7UfVpvMTF1zptYTK9VVS1BPMnBQCWdw4zPemECDSLDG4y+l8i03y
	 XAyBDEa4j7H0kednx7hoPFFpUN0JKj5V+EnCDOFon64b8vrnFL5AzIMGS6haCxSuxQ
	 Kr/Uqz4myFKBTJdjqzDqBBXygt9NGuuWjQCLYN6+fTv2sIxhX1SGs0ArYlYuqNouyM
	 GYTXsdw7NLchjp4xWsn1Igc31RDjLQ5nlc6dz9VVCx4yziLV7OCVyI14mjsF8/hFL5
	 UyubH/Ay3wy5Q==
Date: Thu, 24 Jul 2025 17:24:17 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
 acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 thiago.bauermann@linaro.org, broonie@kernel.org, yury.khrustalev@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] uprobes: uprobe_warn should use passed task
Message-Id: <20250724172417.cd4a5092a21d65c337a59df6@kernel.org>
In-Reply-To: <20250719043740.4548-9-jeremy.linton@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
	<20250719043740.4548-9-jeremy.linton@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_012423_155302_30ADF0FA 
X-CRM114-Status: GOOD (  18.22  )
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

On Fri, 18 Jul 2025 23:37:40 -0500
Jeremy Linton <jeremy.linton@arm.com> wrote:

> uprobe_warn() is passed a task structure, yet its using current. For
> the most part this shouldn't matter, but since a task structure is
> provided, lets use it.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>

Looks good to me. BTW, is it a bug? This is introduced by
commit 248d3a7b2f10 ("uprobes: Change uprobe_copy_process()
to dup return_instances"), but there is no excuse why it
uses current instead of @t.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> ---
>  kernel/events/uprobes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index 4c965ba77f9f..2dc4fed837a2 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -121,7 +121,7 @@ struct xol_area {
>  
>  static void uprobe_warn(struct task_struct *t, const char *msg)
>  {
> -	pr_warn("uprobe: %s:%d failed to %s\n", current->comm, current->pid, msg);
> +	pr_warn("uprobe: %s:%d failed to %s\n", t->comm, t->pid, msg);
>  }
>  
>  /*
> -- 
> 2.50.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

