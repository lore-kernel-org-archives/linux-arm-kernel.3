Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08426D6B6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 21:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUsYVPdjKGafzb6OVe0jWh+nVCSpJ7+Nf5HD5KIu3fY=; b=SawQay3XyUbEuv2tgjyxMCoshE
	Q7w1JOQmB2AiItMBlmzskrF2U7nhSwp2fLhHpz+y4u+oh0uXALpyNc9Hx+8fq0TfoFg9gV/rxBICc
	BON1lbWkmHZz+W83dPPGRT6qIWki8K7KB0/RbvlENKHN9tIN7VzUJeQ1jAPixHC1ZidbCxJFxeF8k
	hvFti7alm/DK2XkXQdeFW3EScJlYY6X9NhII7lZ/3NVaVXJ/crXF6Nqh31w7vqh4S/ahrzUR6nElG
	8g+q2DklVnKilzk9U5R2rjgSp22mNCV1Qb8iT9EDr25WkgvbM/GSgvdlkA3rCBcMFtAlq9AbCzbPm
	fOr0ndHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GIs-00000001qdu-1PQv;
	Wed, 30 Oct 2024 21:32:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GHB-00000001qDf-24gr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 21:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6322DA435D6;
	Wed, 30 Oct 2024 21:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F986C4CECE;
	Wed, 30 Oct 2024 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730323847;
	bh=Ez0u9KTu4Fk9iohQ1J7Ru8euvaEcmW1vF6+OLTjqlzI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lDOByLr2z55hpCBv7hg++3LKpkYVCh8mR8tK6ZfOtsZL5HCbR/Pgd1wNYS700B97i
	 I4CdcF1q/PrHA+hwiQ9t30nLymE9TBgCoxLUbd5Gfj76LPjcW1l4VhA0s7Ljoq05aa
	 XQq4c90++hHu2UM5/LqJvEr9Qu4R8dqoS3437nJpmF5ygyNWIntcjPB/EQvhoIquo3
	 XFe5OopBJ1k1gfdt83KCqh+V/iM462Rw7BWb22vXjlIJiK+qIJHUumHkIVchQfAFbR
	 6mwxt+MTMulKhGE+7caAvtfGPB1utNcVJ0IwaiwpxtikMCyJt5NVaDii7Zz3ticc43
	 /Kq0AGMi5NNuw==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, mark.rutland@arm.com, jolsa@kernel.org, 
 irogers@google.com, james.clark@linaro.org, mike.leach@linaro.org, 
 leo.yan@linux.dev, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Graham Woodward <graham.woodward@arm.com>
Cc: nd@arm.com
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
Subject: Re: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
Message-Id: <173032384741.1221980.12077485873903328897.b4-ty@kernel.org>
Date: Wed, 30 Oct 2024 14:30:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_143049_631290_01E1F8A0 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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

On Fri, 25 Oct 2024 15:30:05 +0100, Graham Woodward wrote:

> Currently the --itrace=b will only show branch-misses but this change
> allows perf to synthesize branches as well.
> 
> The change also incorporates the ability to display the target
> addresses when specifying the addr field if the instruction is a branch.
> 
> Graham Woodward (4):
>   perf arm-spe: Set sample.addr to target address for instruction sample
>   perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
>   perf arm-spe: Correctly set sample flags
>   perf arm-spe: Update --itrace help text
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


