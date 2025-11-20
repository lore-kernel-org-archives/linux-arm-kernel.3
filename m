Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9BACF64AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgKDOVoDH4RlbNfWg6tdHS/5Vq1G2WuzhlcLCiibols=; b=0IJnI6AeRON39mK9aSOBjUQ6A0
	ZQHrexX+Gi4nv2mRPJocuqJMw3CkjyJnM79140JAPSj+WuQj+8b+vbhXQdGxOQT+K+L/S2wKG7f4a
	SN/+oJXE/ftIcJLZdDBM7okyGnYKlJ4nx4Ri0GYM2q06toC7AiLqp3qO0QnV9V/R8Abyy7jCtMiFl
	U29m4zaOn4zpBEUwmCoQVMl2ZtPsTQrqDgoNkkGbttGMX6Sr7Pke9M9wN/qg6ETVSOAIuhCSnXphA
	U0crIq2kmJedTe/jvxtUUqe7LTqL7NbCvHPtgevACKZvRqaU2uRr1/gdFw90Xs8sfST6masAashkO
	07woUkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Y0-00000006TlB-2u6c;
	Thu, 20 Nov 2025 10:05:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Xz-00000006Tkc-1tb9;
	Thu, 20 Nov 2025 10:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 834766014A;
	Thu, 20 Nov 2025 10:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6408CC4CEF1;
	Thu, 20 Nov 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763633150;
	bh=vMghPovkhQw6tivt57mVVvNBm3XnZqhpjKCNtHi4dyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUw3yLVzkCnhfgea52J02hCu7VTJL/31ccP2PorEF4XhnV9QEREXEU1sqqkzAW7+G
	 +IYERAO3tgr8qigL/3vaCPxw4puhM8WV6GyKXZPDypTh7r2UZU4+SidSI1gzlLxIAU
	 GGI+c1TVoYJFte/uKRrzK7bLAoHCZAt8tA4OQAmq8NZ1SyT8cDn9cjlJtKLJ3trHVT
	 JlMp4nQ87X6RzZke+TMNbpEdQiQurbZGle28lKRR8FA8xj5y/b7gzHc0HcExtunW/t
	 kjobnWBt03UCVucq2E3TMfPPNYcgBc7Du15RgYsrJJoGC8YccL8oW2gB05sL5t8W+B
	 DryNgppmezInA==
Date: Thu, 20 Nov 2025 10:05:45 +0000
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] mfd: mt6358: Using a single IRQ array instead of two
 companion arrays?
Message-ID: <20251120100545.GX1949330@google.com>
References: <84ddee3b-df7b-4022-a864-66da95283394@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84ddee3b-df7b-4022-a864-66da95283394@web.de>
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

On Wed, 19 Nov 2025, Markus Elfring wrote:

> Hello,
> 
> I have taken another look also at the implementation of the function “mt6358_irq_init”.
> https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/mfd/mt6358-irq.c#L227-L293
> 
> I see that there are two arrays allocated so far.
> How do you think about the possibility to use a single array with the needed data instead?

It'll be easier if you just submit the patch.

-- 
Lee Jones [李琼斯]

