Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69763C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/paesbovSzrTupRBXtGkPzbN8qe+AklT4UWudtC92Q=; b=MO1x8grzHmf/5eP14RVYYthdWB
	kdbuOOXclhHVln3fwZt8H/Sm7t0TWY4CIdHrmHDezPzAB6V6nCa2a2ZENaDozlwe+MROcM3l4xokE
	ZFbyyb4ULA5QmCeHd5oa+Envq5PEoFW9yjfmGQ9S/9N4iCAzjC2VyPdtxiSYmruamGKmLLDfJ1pFJ
	oLaavUdMqFWdomXURQfA9WFwk+qwUgAfUrdG+m3WBCMw39/A2lZT7G05DH34CrHAgDjJy//Z9KL19
	a09eCXEfSypRz9XpCCnnOLork0Gl4kLGbVyV4YtkF+kPGkI8JfnWoSHkrdVkb7qnM29j0V4fmD1Sl
	ziXO/HGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp51v-00000000laN-0TsP;
	Mon, 03 Mar 2025 12:36:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4I7-00000000d94-33Mp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:49:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D6781063;
	Mon,  3 Mar 2025 03:49:13 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6FC83F673;
	Mon,  3 Mar 2025 03:48:57 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Set dma_mask for ffa devices
Date: Mon,  3 Mar 2025 11:48:45 +0000
Message-Id: <174100249569.1456.13505107409018325740.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
References: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_034859_807597_45D28342 
X-CRM114-Status: UNSURE (   6.30  )
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

On Fri, 17 Jan 2025 15:35:52 +0530, Viresh Kumar wrote:
> Set dma_mask for FFA devices, otherwise DMA allocation using the device pointer
> lead to following warning:
>
> WARNING: CPU: 1 PID: 1 at kernel/dma/mapping.c:597 dma_alloc_attrs+0xe0/0x124
>
>
Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/1] firmware: arm_ffa: Set dma_mask for ffa devices
      https://git.kernel.org/sudeep.holla/c/cc0aac7ca17e
--
Regards,
Sudeep


