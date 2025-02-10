Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B03EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njuMS7BiU+m+7gGg8n+mg8XFqJ1rxm1y2JrVuUIvS+4=; b=oIexgJfJUZsuSoNidApQPWo8EG
	LbzYEPMjg5gdupnV0JChtRLA7dyhh/JfyHl/kGSd0V6bVWtUI2wT12eJMbVLRRtFtoo8fH+V9g7n/
	B0aYPcbUfC2egM9QiivA/mWfhm5wS0B/4kurayKxd2Y9GDdddYuVVdE7eyCbKM4yPB5iG7RKUlG/M
	OPZHVOmJzxz56RYMo5HgR+3g00y6S5q7UlcRoNUrbj2nX4oA3cIbUcbXtOEDK0q3Pb2EY9Q/Eu8KK
	kPLZF/77MDVMad6aa73iyMboyEqvjwTvKcreT6dPWDMaXtTVPhYC/OlJ11r1pIkkqd+WGnR3OOG0U
	2++LsHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXhA-00000000kXn-2dMy;
	Mon, 10 Feb 2025 17:35:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXSm-00000000hK5-3Xjd;
	Mon, 10 Feb 2025 17:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75005A41C25;
	Mon, 10 Feb 2025 17:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5060EC4CED1;
	Mon, 10 Feb 2025 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208051;
	bh=AqAuO64KrFmIEpmbIChBp1sariAYqOYuraT4EbNk9HM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iBmnjxe0jaqoN9l3oxXx6Nfl2tOwdVaBn7nL2unL9ImA0UQW4IQDVvt0KdQX3SsVm
	 jSf6/pQz0jvoj7MvMlcDmobv63lXKpMcnlMCRysGHb2x1+4cNojVMfSUue7d0kf8ZR
	 5K6KdAaJs8UVumN/xToAOrARvz6ICg0E1g8IkO3VZZWAx9RiN2IZrErcBJipYTmgQG
	 /7oLusu/0xdSxkc8fb4PkfOI51bqSFZCcs0pdynYZHoHme+fXQ4f16fer1je46X2Hm
	 O6SIL0qo6+rYHM0VW6brAI2jVAWISa41wtfsmmqsGISpfWn+6N/HQ61QcDdiAXqCd+
	 DvuqllMtvdYXQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, Christian Bruel <christian.bruel@foss.st.com>
Cc: arnd@arndb.de, fabrice.gasnier@foss.st.com, 
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250210103515.2598377-1-christian.bruel@foss.st.com>
References: <20250210103515.2598377-1-christian.bruel@foss.st.com>
Subject: Re: [PATCH v2 RESEND] phy: stm32: Fix constant-value overflow
 assertion
Message-Id: <173920804896.103688.2205901158085066356.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 22:50:48 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_092052_959051_829889D2 
X-CRM114-Status: UNSURE (   7.84  )
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


On Mon, 10 Feb 2025 11:35:15 +0100, Christian Bruel wrote:
> Rework the workaround as the lookup tables always fits into the bitfield,
> and the default values are defined by the hardware and cannot be 0:
> 
> Guard against false positive with a WARN_ON check to make the compiler
> happy: The offset range is pre-checked against the sorted imp_lookup_table
> values and overflow should not happen and would be caught by a warning and
> return in error.
> 
> [...]

Applied, thanks!

[1/1] phy: stm32: Fix constant-value overflow assertion
      commit: fd75f371f3a1b04a33d2e750363d6ad76abf734e

Best regards,
-- 
~Vinod



