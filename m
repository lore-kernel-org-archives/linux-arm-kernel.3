Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D18C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPnwmthWDwezdK/eAiPhQt/h8k4dkuoeyLoZ7qPq56s=; b=0LRaQ9hkdVHmqXiCVGfMa1bIJI
	dWU94s/GM/DjJ6PRwMq48al0qKYBluvQ72eTeI2bLVFfI+C55Q+5e6hn6hzixRkWCTwtUB3HUWp1H
	5W8YTfN0tkJ6TA9QKbEu1KpCIs2mhmXXiWlQZDMSQ/MBuoE3RZLHzNA9uagc1Do411LDtWh+2EIEK
	6EOzVPXgv6t+gUjT4Qn2PCfl5oMgeFR8pktoALHVsBXbs+SwJUKsQzP/P1uOGOYMbkDvkamKd1pGW
	MUb4UdR3Zsg3GgGhkuYtKPIRjHf3xHL4uIyorDfp5JqEOF1ORwg7OZvNxuSJW3VlTfmPbAKkTB20L
	K/IkYLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjC3-0000000ABaH-0MyR;
	Wed, 19 Aug 2026 16:31:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjBy-0000000ABYC-2aDV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:31:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 13AB91A173C;
	Wed, 19 Aug 2026 16:31:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D775E5FF42;
	Wed, 19 Aug 2026 16:31:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C464011C7590D;
	Wed, 19 Aug 2026 18:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787157060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BPnwmthWDwezdK/eAiPhQt/h8k4dkuoeyLoZ7qPq56s=;
	b=VjMxh10j1dJbIKWW8BCxfGOy2W0PopuHcb6o+FEsZyHb+IbzrDcgTgZaVMUvmCh8/Qkh4h
	Gjo7Bs1q126yO36bgFcIjzAugtu78e1bG4ZqsqSFYUFYe0f+anmb0O8Th+JecZTUGuL/U3
	rpo0hqJBCz9fUsJ/CSWzYrghsXOrQIBu94pSOg8NCicub2OSPIpax9FBZ1cWkno4Affzz+
	zVS+TMFU07Gkd2WIfipXj88gltYf/b27HmcL0lXWdOjw50TU3T+mDSR5REUFy11q6A8xkT
	GVlKiVK3O4akBAYYLfxpFkexTHpPxYFQqJtIiCm2OeFaYQP2tEXXXcpjE90qnw==
Date: Wed, 19 Aug 2026 18:30:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Michal Simek <michal.simek@amd.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: zynqmp: Return optional clock lookup errors
Message-ID: <178715693834.130787.997883397079617124.b4-ty@b4>
References: <20260624055524.38522-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624055524.38522-1-pengpeng@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093108_449660_84B4D73F 
X-CRM114-Status: UNSURE (   8.42  )
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

On Wed, 24 Jun 2026 13:55:24 +0800, Pengpeng Hou wrote:
> devm_clk_get_optional() returns NULL when the optional clock is absent,
> but returns an ERR_PTR when the clock provider lookup fails.  Probe
> currently keeps the ERR_PTR and then passes it to clk_get_rate().
> 
> Return the lookup error instead.  A truly absent optional clock still
> reaches the existing calibration fallback through clk_get_rate(NULL).
> 
> [...]

Applied, thanks!

[1/1] rtc: zynqmp: Return optional clock lookup errors
      https://git.kernel.org/abelloni/c/5904c4109554

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

