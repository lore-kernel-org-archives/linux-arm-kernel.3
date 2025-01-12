Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB2BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 23:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Zd4Crf5dozzhc+r4YH7BcgHQz1O7Obz/jZqJO/AifQ=; b=E0ydanBD6yuamv2ulQYzxTvBLD
	DcpNvfCUM3o+hYNaAWmkKRAbzDR/mumCsG7VrPYvOme70Q0gbFFxp3ac36ZSuJ8yOnBv103qxeRRo
	vyUnRrL2g35lfz0SaQD3RN9tIvtOrPtEn1KcISul+gIqbXD/5LfbkAgv+oHVOZxuQyLpSjeYxKECy
	xq9XlPnKiKkTSiXoKWXrYVlM++9SGMtMDw479LZ6YrxDATbKuZW5gcG4cSyFdI13Ojy1Bw+iP+7Fz
	cG0VIr5zixBO9Ov+UlDKFRMr8GOUrncOVFf5tJ3bfO8yzuuXFh7Jlam01c1GG07h4J3L6Tu1B6zqn
	tfzzKmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX7bl-00000003eCJ-2Ffn;
	Sun, 12 Jan 2025 23:43:05 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX7aV-00000003e5O-45bA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 23:41:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7486C1C0003;
	Sun, 12 Jan 2025 23:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736725304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Zd4Crf5dozzhc+r4YH7BcgHQz1O7Obz/jZqJO/AifQ=;
	b=peOjpli9G/AqxbBzILroJY95A/J4iAi/yDF149WGIyA8zhrwj6H+sodxaX52lvW/o/qRKo
	4/HXWCUbQvsXjV74zlbKG8NQfmv14GQicNxjlmUY0/ixw85OZwnC/FpY7hrNouiR0983JS
	mW09+cEnD+TB9zw4d/qzF19UCxzmqSu8zESDeLCunmobQPPiuQF6uMb7YOb4oYP5QgYptk
	21adyFbBijM/9T2lBzgHjZjbQtPjAg+z+IlKd5EZ2Wsd9AS9edU8YrCxX9LGaYz48e5Uek
	fSaERKqHmR292kzgn27rfYcE71mSfTTWYL2rkGrLIXhO3HytIFJiTmPESBiT2Q==
Date: Mon, 13 Jan 2025 00:41:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
	Michal Simek <michal.simek@amd.com>
Cc: stable@kernel.org, Srinivas Neeli <srinivas.neeli@xilinx.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: zynqmp: Fix optional clock name property
Message-ID: <173672529557.1488825.1587396647301990386.b4-ty@bootlin.com>
References: <cd5f0c9d01ec1f5a240e37a7e0d85b8dacb3a869.1732723280.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5f0c9d01ec1f5a240e37a7e0d85b8dacb3a869.1732723280.git.michal.simek@amd.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_154148_146512_A56C2A9A 
X-CRM114-Status: UNSURE (   8.19  )
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

On Wed, 27 Nov 2024 17:01:22 +0100, Michal Simek wrote:
> Clock description in DT binding introduced by commit f69060c14431
> ("dt-bindings: rtc: zynqmp: Add clock information") is talking about "rtc"
> clock name but driver is checking "rtc_clk" name instead.
> Because clock is optional property likely in was never handled properly by
> the driver.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: zynqmp: Fix optional clock name property
      https://git.kernel.org/abelloni/c/2a388ff22d2c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

