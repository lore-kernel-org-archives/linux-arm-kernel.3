Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DF3E6BF3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hP+m169YdHkMBzGPknU7zjeOfw/2sZzFjzxQI+0qmzc=; b=WlhaeYKUec/sGlA6YNoXhwStCd
	LX/a1wOCLGDlJHi6vWAOtn6Z5vVBlzh7s1wdo8S513X9pofpeJjnzEGWFHUyEgShJEgpKFEkiWiqJ
	7cLn9wcRDU3ij9CjAV7hwjklVmZsjKz9RXAjF7vF2f20F06OTcDNVYkW2xV+WToqtkjt2dLkeACDa
	EuhSflmzc6uwmp7dU98/rBrv/xv7dvLApv1+WyJMcgxDDeF4OlYMB3qMe/p1bGslocZR5KZqyyD22
	A9IA2CjuFeQmn5/7Ygzzzjt6iczGdjiI3PbDS0Pdxv2qZ+PslsmpG4W4FEAQWZCFKQMzLCCN7VCqZ
	vx4TFABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxSu-00000002516-0Qap;
	Fri, 30 Jan 2026 22:59:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxSp-0000000250Z-3NDF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 22:59:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D9E9E1A2B4A;
	Fri, 30 Jan 2026 22:59:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF3476075A;
	Fri, 30 Jan 2026 22:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58507119A88EC;
	Fri, 30 Jan 2026 23:59:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769813978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hP+m169YdHkMBzGPknU7zjeOfw/2sZzFjzxQI+0qmzc=;
	b=ZQA1vcdnbzBZ4+z90jQxUbkci+1XJ4Gd/WA8JBcVURJ6itW1OIUakC3rs0E2Witk9JFtyG
	JB+SWpZpTQ2bRpFLZ2u2gqTH9hgIcES2qwbFQmBeJt2Co1A310wZw0aTBQQGYJMw1d3KZj
	yT1eQdNQVNC0je62LlOnSnoJJu7Z0xf2BzhMtvkfttCJPcd6EGZ0wtkERX1d+LeBUKZCsd
	FXqJFYZynuKe8RACit5OejqeNudLhuN6PQECIEfDUi+6f75RBC9tShgPF20cR3BN7r1a9+
	r34pAe2yD3P8L4GVWISvLHUiAJQP9Hfw1LcpfF7U82xAIBbstyX2+YRn2XNycg==
Date: Fri, 30 Jan 2026 23:59:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Michal Simek <michal.simek@amd.com>,
	Tomas Melin <tomas.melin@vaisala.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Harini T <harini.t@amd.com>
Subject: Re: [PATCH v4 0/5] rtc: zynqmp: fixes for read and set offset
Message-ID: <176981393513.2222240.16272626152840820332.b4-ty@bootlin.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_145944_327377_56493B41 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, 22 Jan 2026 13:53:44 +0000, Tomas Melin wrote:
> Add improvements for read and set offset functions.
> The basic functionality is still the same, but offset correction values
> are now updated to match with expected.
> 
> The RTC calibration value operates with full ticks,
> and fractional ticks which are a 1/16 of a full tick.
> The 16 lowest bits in the calibration registers are for the full ticks
> and value matches the external oscillator in Hz. Through that,
> the maximum and minimum offset values can be calculated dynamically,
> as they depend on the input frequency used.
> 
> [...]

Applied, thanks!

[1/5] rtc: zynqmp: correct frequency value
      https://git.kernel.org/abelloni/c/2724fb4d429c
[2/5] rtc: zynqmp: check calibration max value
      https://git.kernel.org/abelloni/c/83b9e5eb0437
[3/5] rtc: zynqmp: rework read_offset
      https://git.kernel.org/abelloni/c/0f9989443fae
[4/5] rtc: zynqmp: rework set_offset
      https://git.kernel.org/abelloni/c/9f5af70268d6
[5/5] rtc: zynqmp: use dynamic max and min offset ranges
      https://git.kernel.org/abelloni/c/2254383176fc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

