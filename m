Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86927D29FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvBa3njoZ2+hnaTL66dhBL+2TR56R1rm71lLSn0SVKk=; b=lDTNm7G+aQUEZTlxew3APUd1Zy
	cyV89BkyBvv611Hxpl7PUBngNY1YF0yOvNh91djZB+teuRt2kkGMx2/VPQ16h93HkZcPK+kylxl3O
	gA0LBrvtZHQZaDTcwEC3qf9kxaPk/lOOlGUlLfpV862lSnNu0jt6sluYjsjMmoR+4WdQqTzDAV/gx
	MaP+0bXl/eewvTdB52P/EO2MnL6g50YftoRcy4PnBGOU2rFaWy1ULass7wdnLB+xcDNZRtkVJaKxq
	K+69v/7ompCKRVfVeQuJocRzDhfBYAOgOUqds98wFQ2zmyMe74CqNFKzo8yCJ5Wp7wyDGV+05am0L
	mCZNEkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyzj-00000008wkA-2GL5;
	Wed, 14 Jan 2026 11:24:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyzh-00000008wik-13ZA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE56F423D9;
	Wed, 14 Jan 2026 11:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACD8C4CEF7;
	Wed, 14 Jan 2026 11:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768389895;
	bh=iJLNoucZhPgroGfA+0z3zT8eafKTFprZmaAe4syhOrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ctt8xlq+BMVDXDWYhbbvV39G7apVaVVDgd9wXOUbHuYlreHqZuXogAPj69y102szr
	 192Xcrhk1SM+OErZldUV/qHVC75Gqk+AJ0o6oN6hplccFDJTHFtN4ETiwjcvq1SMUP
	 FC/8UAJBuSTZk1SfZNS6+6kq7ZPAb5xWMXUHNMooOvbeE4Af4NDQQNTIcBTJX8canN
	 Z7Qq7KWeqXGH7/XMjaX2W0xZ499pFFF4AgDNEeCczvP730lqZOKcV1/Zf9bB2LELdF
	 V0dg4uDYQBd0T7p3OENomVI/+D8yG5d17yGXhxYQCQTfYGi8j5cWAitaloD1rqtMmr
	 GRkH8/Uv5hxtg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vfyzd-000000029Zc-1uug;
	Wed, 14 Jan 2026 11:24:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	oupton@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: fix missing <asm/stackpage/nvhe.h> include
Date: Wed, 14 Jan 2026 11:24:49 +0000
Message-ID: <176838987352.3448823.13539745930697394773.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112160413.603493-1-ben.dooks@codethink.co.uk>
References: <20260112160413.603493-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, ben.dooks@codethink.co.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, oupton@kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_032457_336499_F100A88D 
X-CRM114-Status: UNSURE (   8.84  )
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

On Mon, 12 Jan 2026 16:04:13 +0000, Ben Dooks wrote:
> Include <asm/stackpage/nvhe.h> for kvm_arm_hyp_stack_base
> declaration which fixes the following sparse warning:
> 
> arch/arm64/kvm/arm.c:63:1: warning: symbol 'kvm_arm_hyp_stack_base' was not declared. Should it be static?
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: fix missing <asm/stackpage/nvhe.h> include
      commit: 4b16ad0bf821d4aceb050e9f569dc329883f1c5b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



