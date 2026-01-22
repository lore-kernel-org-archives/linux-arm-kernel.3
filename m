Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB38D6CFA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnpg5oj1LTv6Rw9+56wcJfUjrFRQK8Mr/wjgYWPRem0=; b=bgrMO7noZdm86oYAB/fPii6iyG
	LIF6g/2pIbZuPbLO3Sl4WXMIdU5EXcrr1abIZZZpea/g/ngU/zOHurcjpjwYBvrBnnkPtwmB8nzUm
	4Sk3QbfBOXmBCugg0Kxe/vylNpKEoR3pSGV7m20cUXgFmVqQFcyRSy7UY/673Z0ZND35pztA8y7nA
	eq0yoxZUeZgOPG7ys9BARB77IHkjUS3qz8YqklQM//J9F1VzPmaMNdy50dFGMQgS4sg5LCgO8Z4hF
	55a/Aou8QvKIxQbjgI1ML/TLIvwpKWq4TC2Hycp2Ahefbl5P+nLfj0zlQbS1dFDITsN4034/zGVW9
	gXpLVmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizLr-00000007cze-33LA;
	Thu, 22 Jan 2026 18:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizLq-00000007czL-0SX8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 18:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xnpg5oj1LTv6Rw9+56wcJfUjrFRQK8Mr/wjgYWPRem0=; b=rB1MVtUbsJmSQIwSQZ70NHlIFC
	BFplnkzqNZ9SMAHn8K1faKFMIJYJjNr++CsdshDkUe4sOCwbCrfQLoDkrctDfoPPwHWbQVyQLyilZ
	yyK5Yk2S4fUMwHTilmbD4jBUN8FIrjkgCfBONB5ySJSZSpoZSqvaGxLTC4eADOJnBLknqvL+ha0FI
	A3wtpbg/XeD9f0vzCY/HBxJLxrI1knqWqg+AmkeX7Lu5yFhcwlB0YV2DJ0gsD6f8rTgpZT8UfBGSi
	A9jaG059jqExY4sb9i+I1t3QTwjgNXW9l1VmiRD18Agvi3+K+4A8Z2cixbEJvtig6Pl1QZ7MX025M
	tcRn30SA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizLf-000000013WP-3zkU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 18:24:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4166E1476;
	Thu, 22 Jan 2026 10:23:47 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 200B63F694;
	Thu, 22 Jan 2026 10:23:51 -0800 (PST)
Date: Thu, 22 Jan 2026 18:23:49 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com,
	"zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: jeson.gao@unisoc.com, xuewen.yan@unisoc.com
Subject: Re: [PATCH] arch: arm64: set __nocfi on swsusp_arch_resume
Message-ID: <176910618702.3974174.11617330390922367750.b4-ty@arm.com>
References: <20260122114925.624309-1-zhaoyang.huang@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122114925.624309-1-zhaoyang.huang@unisoc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_182404_216536_23D0180C 
X-CRM114-Status: UNSURE (   9.80  )
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

On Thu, 22 Jan 2026 19:49:25 +0800, zhaoyang.huang wrote:
> A DABT is reported[1] on an android based system when resume from hiberate,
> which is root caused as CFI will plant stub code[2] to verify the
> swsusp_arch_suspend_exit's authentication, where the hash value is stored
> before the page that alloced by create_safe_exec_page. We also have
> tried to copy the hash value together with the function but get failed since
> the value is not on the desired position(src_start - 4). So we solve
> this issue by setting __nocfi on swsusp_arch_resume and it works.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arch: arm64: set __nocfi on swsusp_arch_resume
      (no commit info)

-- 
Catalin

