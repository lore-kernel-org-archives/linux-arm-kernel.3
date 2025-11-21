Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6492CFA474
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfKOGJnWoc6+nmyYlT5K304xJCnByiY0NWCp1O11fSs=; b=udq0XW+rPhZZECSoQ++Yk1GrcH
	j6R/tSHcBr91+6+QMbvP0g950mT4fVrq148KgITPOj3kqtx8nTdRO4JMM93/vIfgSBLSg0gYZmA5/
	Aw04mA5NKjFyW/awcO8kEFUBSLgI52gp5TGeXw6VD+VEg3yOHeVxoMxtU9KJUL32p3Hyyad1HH4PR
	DSbbJsn3kBQY/NB7qqPgem8BJD3vCYm92ljCPACT3e1i4wypGMCOSqLHnOjYk2jC4Rf0t/LHO7Wmj
	WXy0D+8aaobqurpUlqQiSePmv2UKps2GVKxXBKhiN+d3aFa9vGdc8QA10t4Ho1SuicFnJI4jbbsMD
	yDHV8mZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZw-00000007pvf-12uF;
	Fri, 21 Nov 2025 05:21:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZq-00000007pu2-2iHL;
	Fri, 21 Nov 2025 05:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 179D16022C;
	Fri, 21 Nov 2025 05:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3602C4CEF1;
	Fri, 21 Nov 2025 05:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702457;
	bh=nfKOGJnWoc6+nmyYlT5K304xJCnByiY0NWCp1O11fSs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qos1E+FXxG6/Zzokc+yzMNg2sFaQFjWbTqutq0Qitm4uX8Ns7J5XjYnvaC5jNWMbP
	 vOmOn5cbytqGq091l4BYh1C2T30p2oAyiyqq6bFROHauP6JsfkjjQZlslRpcnqMxJU
	 D/q8A7219Gh65LTgufryw/Uylpa5p9kcwl5ZBHqIqjjmmjXc18ymMZhYD3jux+lYW2
	 VD30Myn5VnqXZofmvEtoibZyYG9K0gZB6otEFgpuTOorxPcr/JJSSF3spd18HJNupc
	 t9zdNLUBudmmDon3jd2OKyqVu7PSV53RIwHUCJURGeYYbaB94TC6Z7C7fNfvPeWDG9
	 pDXfEOhLSnVMw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251028152013.1697585-1-abarnas@google.com>
References: <20251028152013.1697585-1-abarnas@google.com>
Subject: Re: [PATCH] clk: actions: Fix discarding const qualifier by 'container_of' macro
From: Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
To: Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 20 Nov 2025 19:24:50 -0800
Message-ID: <176369549068.11952.12533090188793303559@localhost.localdomain>
User-Agent: alot/0.11
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

Quoting Adrian Barna=C5=9B (2025-10-28 08:20:11)
> Remove const qualifier from functions parameter because it was discarded
> when container_of was called. Received pointer had mutable access to
> it through received container.
>=20
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
> ---

Applied to clk-next

