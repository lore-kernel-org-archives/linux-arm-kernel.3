Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF37D35159
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+K3p909lQJp4qb4sPAC49UNQHhnygwyrcg82WmuyFaE=; b=gasWqa+XyHs6YU8z7eP9kXF/Cc
	Cinsv3KZZDiWGMufvnfbazhb3GXWW9qPjRUNFKnAhJciBzrrBqqwy4BBAAqvkCbPEzFFLwTmP6N0s
	MwXBho5A8/7vkLMNsr7Omaam5vi28A2x9fFkebHJ+n8w6HplavM5UkgLrjrCbT5lsYW/xPXUOzM0z
	HLmzhdFZrrr/QjBgqyI6hNGldgnMR7ovW8kmW1SwxAAsGzr1bnlXBLoVuEP9mMhKz/OfuNb07lYMv
	RyLnczbzpP8wIAEPSGpWhIvKMi6NiQWQEm1ojx8YCP7D/pgGHFcU0wNLh0HvAJq/JwUmX7FsyokcX
	8auLMBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qvR-0000000EJoW-3YyU;
	Wed, 01 Apr 2026 08:27:45 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qvP-0000000EJo7-3WoB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 08:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775032061; bh=+K3p909lQJp4qb4sPAC49UNQHhnygwyrcg82WmuyFaE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fuMZdP5UJWf0uN9V7Zqnhhj1E6gHRVyZrdxyNqIRcQlAWGwNBsjHhl8M7/Ls6j0qU
	 FrRsymOnPJ2T4VTApd8UfdMbnlFk+RPL7eoOU23IRTL3mNJsfgXYz7BBk8zc/5som0
	 mvbDIW6qH9ZTpYmZ9XfvmeDbGFYPTDKoKKKNUCXMcOkZCD9wo6y534ts5JQGShiJdR
	 whg4Lwj68Dd/I6ZUwUyenb1X21LU9bFHKj2T9J0uGKqbVYFQNbefa6DwkCg+6LMbJg
	 M3qTsnCgFdkhZ+qTqi4VuueGTfQ8heauNbL3vdlbmrbs/GVu/vqlNaSGTvSeh9Um16
	 B9hZdF6HML5Mw==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 316CB5DF94;
	Wed,  1 Apr 2026 10:27:41 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 10:27:40 +0200
Message-Id: <DHHOCNHDN27K.RIE745OFAACD@bereza.email>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix CPU stall in
 xilinx_dma_poll_timeout
From: "Alex Bereza" <alex@bereza.email>
To: "Gupta, Suraj" <suraj.gupta2@amd.com>, "Alex Bereza"
 <alex@bereza.email>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Michal Simek" <michal.simek@amd.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>, "Tony Lindgren"
 <tony@atomide.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331-fix-atomic-poll-timeout-regression-v1-1-5b7bd96eaca0@bereza.email> <vA8GpbivDeKzKN1k0B6m1cvW-rZwJjKzvhksYdUJPo4fsfhLQoXtWoK59V1YX_U2U3jcVR2PAmzrleamvq8Dmw==@protonmail.internalid> <833bb42a-65b8-4c93-8109-d2959f8b807f@amd.com>
In-Reply-To: <833bb42a-65b8-4c93-8109-d2959f8b807f@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_012744_097735_63B1274F 
X-CRM114-Status: GOOD (  19.42  )
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

On Wed Apr 1, 2026 at 7:23 AM CEST, Suraj Gupta wrote:

>> Rename XILINX_DMA_LOOP_COUNT to XILINX_DMA_POLL_TIMEOUT_US because the
>> former is incorrect. It is a timeout value for polling various register
>> bits in microseconds. It is not a loop count. Add a constant
>> XILINX_DMA_POLL_DELAY_US for delay_us value.
>
> Please split this change in a new patch.

Ok, will send a v2.

>> Fixes: 7349a69cf312 ("iopoll: Do not use timekeeping in read_poll_timeou=
t_atomic()")
>
> This patch doesn't fixes anything in iopoll, please use correct fixes tag=
.

Ok, but I'm not sure what would be the correct fixes tag then? I though I n=
eed to reference
7349a69cf312 in fixes tag because this is the actual change that surfaced t=
he CPU stall issue that I
want to fix in this driver. I'm fixing the call sites of xilinx_dma_poll_ti=
meout but they were added
in different commits. Should I add all of them? That would be the following=
 then:

Fixes: 9495f2648287 ("dmaengine: xilinx_vdma: Use readl_poll_timeout instea=
d of do while loop's")
Fixes: 676f9c26c330 ("dmaengine: xilinx: fix device_terminate_all() callbac=
k for AXI CDMA")

Three call sites with delay_us=3D0 were first introduced by 9495f2648287, t=
hen 676f9c26c330 added the
fourth call site when introducing xilinx_cdma_stop_transfer (probably copy =
paste from
xilinx_dma_stop_transfer). Would adding these two fixes tags be correct?

>> Hi, in addition to this patch I also have a question: what is the point
>> of atomically polling for the HALTED or IDLE bit in the stop_transfer
>> functions? Does device_terminate_all really need to be callable from
>> atomic context? If not, one could switch to polling non-atomically and
>> avoid burning CPU cycles.
>>
>
> dmaengine_terminate_async(), which directly calls device_terminate_all
> can be called from atomic context.

Right, thanks! Just for my understanding: I still think there is potential =
for improvement, because
from my understanding it would be beneficial to do the waiting for the bits=
 in the status register
and the freeing of descriptors in xilinx_dma_synchronize. Do I understand c=
orrectly that this is
currently not possible due to how the DMA engine API is structured? To make=
 this possible I think
the deprecated dmaengine_terminate_all would have to be removed and all use=
rs of this API would have
to be adapted accordingly, correct? So this would be a patch of much larger=
 scope than xilinx_dma
driver alone.

