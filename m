Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76189C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6rc0mXWsY6/K1ldDEszmUHwAu1WzPiAqosXbNFO1Fs=; b=D9yIiD5xqEsej5TtmHKGc8FJ87
	7Sy32CIYEtXN/xB72W0WmoDdd6aP/UiW43V2vZtMRDENlGWRjmwz16cyC4mKusjwHlHZXAzpopXvB
	POkprTpiXnjJqSvbtWPB36gasL+HvvlInsd+7vSjFuk1ZSIY3HFRKYNK/BkB+8alFQP8Za8mgM6ep
	PhVYF/LLSjvCaisVzetA0wZlrlGIPcb7lTSvcdeIltmDhxfFmQhBGarP6BoPF8kfqE78Q3xHkDIrF
	4xjrgH7rJzCwJV3hp0RvO7Gc8NIGQX7JQA2t2MFIkUIa/ibKiPP3zDbRBZ8eV0Bgn+W4pudilrZ3W
	MjRbwb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsVBQ-00000008vrB-0kbW;
	Sat, 08 Aug 2026 00:45:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsVBP-00000008vr2-1QSU;
	Sat, 08 Aug 2026 00:45:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D22CD42B32;
	Sat,  8 Aug 2026 00:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E0D1F000E9;
	Sat,  8 Aug 2026 00:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149902;
	bh=o6rc0mXWsY6/K1ldDEszmUHwAu1WzPiAqosXbNFO1Fs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=mEZR9FYhPVQi9OEoX82qZV8WuvXELMbvymWxy/n4z094hX48TbK/9pRaUAX41rFjL
	 YXyGrOSL0Ss+HPoMrdfgMn8b0IGCA86TMRJxD4d4eZJKETEqPPPnqHYDyHUdPoE7xu
	 WN0Tn7y0rwWU6A2uD0fNsIwWMsSuf581JpdvshKrakQuPGOP1GQDd1/D2rmMZxPn18
	 LZb5X/ZBJ0IFt9sT5A2UDs0s+CvhPHRROR209EAu18bjeg/NhqCTC3FsoBAYGN4q8N
	 GNhZiEB3cZJSBpCwu80ZxYhSfOCtLZkVt8y+IXnZ3M8en8lfGCRTjVcRWoCMNhPt18
	 x/H6ZltPEUUwg==
Date: Fri, 7 Aug 2026 18:45:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev, 
    anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: RISC-V: check cpu_hw_evt before dereference in
 overflow IRQ
In-Reply-To: <prp0001riscv.1786064390.git.liuxixin@kylinos.cn>
Message-ID: <9109b689-1145-c714-ebe0-ec368f242a78@kernel.org>
References: <prp0001riscv.1786064390.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi,

On Fri, 7 Aug 2026, Xixin Liu wrote:

> The overflow IRQ handler dereferences cpu_hw_evt before the null check.
> Move the check first. Defensive only; the cookie is valid on the normal
> path today.
> 
> Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>

Could you please add a Fixes: tag?  Also, if it was written with LLM 
assistance, please add the appropriate Assisted-by: tag.

thanks 


- Paul

