Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93311C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 05:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoHt8I8oDs8GqSb7bHRfcwB/Dfr54MBmMPMgkF3/JOk=; b=ZOqJ3Cs/FBippeQGDf/RhRmF7c
	9yJ8rfibgUjZK0A8JqA8pG1HNLQWyK1hTnz7cuyB3f80uDxtEidQ3K5w81FoaTBzhbPWBvf1Azxgw
	XgDMdIp1RoD3u9uOh2qEEqWXLQwfhe4BN3bSC0/w3Wx4yw1iF4MPOjMB/EknK+JdF0z1czvoAyUnY
	qn7fzM4DdwU0MyHX42Mq070NR4N3NnEr6QSOZCRqUgA4z77sPNXGbp5hUveD9T8Q+woczOUOIROvU
	t/QBgGFbh7kT1VzHeHviOXhRMgvXMjfBduhg6/aMWh4mEVByGDFHQaVssI4bG4Aq3w9JBxN59zv5H
	C0aFplZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfPp-0000000DLYx-2crZ;
	Tue, 11 Aug 2026 05:52:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfPo-0000000DLYZ-12mF;
	Tue, 11 Aug 2026 05:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88632600AD;
	Tue, 11 Aug 2026 05:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436351F000E9;
	Tue, 11 Aug 2026 05:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786427563;
	bh=RoHt8I8oDs8GqSb7bHRfcwB/Dfr54MBmMPMgkF3/JOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BSeAxHxZuwXbkLax//y/bgPNyiE6ABIV2B9PxTwevZxeuYoXfqzU0eMXhC5UQL44z
	 B+DF/7msEPGzclMnyeTQhKApXlexbtN6/f0AQek+5t8K3yXUZOkBBWkeOLQcfTfnQC
	 +iiv/Qjm15GXc94hwaUzZZBbvtWnPNlIjxlo6HClHDsv3gIs89C9GdlPQQsAmzdLOz
	 OsSqssKh4IUzCLXSyfapY7P19zJyjSFRpTIQx+UEcqjoB+1ecSovx0Jo+eakTfc2ya
	 bH/dQFZCo/YiPnCJsa0OkqGMDF0a7GTxYeoxr99dbhnVWEAbFvjt7QMYo2zVK380Gn
	 UFGcHH8F/+U+w==
Date: Tue, 11 Aug 2026 07:52:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>, shawn.lin@rock-chips.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, heiko@sntech.de, 
	dlemoal@kernel.org, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip-ep: disable link training work on remove
Message-ID: <of32vj6w52rwcop7wn7vi3rh6o7im2wkbds6icp3mapxf5nzrt@efoivwhiltvd>
References: <20260811025315.136998-1-fanwu01@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811025315.136998-1-fanwu01@zju.edu.cn>
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

On Tue, Aug 11, 2026 at 02:53:15AM +0000, Fan Wu wrote:
> The endpoint driver has no .remove callback, so on unbind the
> link_training work can keep running after the devm-allocated ep is freed,
> causing a use-after-free.  Add a .remove() callback that disables the
> worker.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: bd6e61df4b2e ("PCI: rockchip-ep: Improve link training")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6

This LLM tool should've told you that you cannot remove a
builtin_platform_driver(). So this patch is essentially adding dead code. So
NACK.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

