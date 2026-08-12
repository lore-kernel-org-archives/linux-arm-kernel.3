Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DBCC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxTCgxbLwPaEZ5RMZIdQy4oFKksftlIdy6hjctTqwoE=; b=hTVPznS2XaaWrGOQmHgxD3+HR+
	lQtzkzBZzWgxfkieT7bQG4KeWOzUjGhGLXnWPxnxrbZ03x6O2UI/OBcKvCaPEfZytAQ0fTIDbRAhX
	wsRr//ZSDIAmUNfeZCnJyTxpwSiA0ANRJmQNVhuS+tx6SW93b8WAPS7o15Jw3yUwAbFPF3IJLgDB1
	6R7ipaMAsGEVxTAZA98uHg6K/zvQLCGGvJdQFN2CkQwYXOdWwyQuIoY8AjxzTr64oGbSV9smgbSM4
	sYbITME87GAZiRNtX6nQO47BOtSEDg99sMBSlBz4N4le1/lGe2Kl2j8wNruXqe505XMx1a6d7lhi4
	gGvhmyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Db-0000000FUhd-3fln;
	Wed, 12 Aug 2026 06:13:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2DZ-0000000FUhD-1R0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:13:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1721596;
	Tue, 11 Aug 2026 23:13:31 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E778F3F86F;
	Tue, 11 Aug 2026 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786515215; bh=+97eQgCji9sNbU/Qzga2naHnQbyNVNXr+PewirPY+sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l0mqd9c1S44ovYmJTL6E5ds/2Z45IN93MHLWfF2RsMU0ybUK+wHbUUBD7StJP9yoS
	 2/Cx1FX7tV/TCXtQwbbI+p8OXgn5JYv7DGwJ5omPt5WjiwRsVJqci1Sg1hU2H4yJZe
	 3zfwRu/RhoSz/lrmukKPEdUjRjb7TJsOZYFYjv4c=
Message-ID: <db63ceba-68b1-4b3d-ab8a-9ecd2231ad87@arm.com>
Date: Wed, 12 Aug 2026 07:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260811185013.26960-1-rosenp@gmail.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260811185013.26960-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_231337_432828_E5C4FB79 
X-CRM114-Status: UNSURE (   9.71  )
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



On 11/08/2026 19:50, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.
> 
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly. Also remove error message from ioremap as it throws one
> itself. Same with devm_request_irq().
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

[...]

