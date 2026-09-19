Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3C1C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1nUjk9VuBCM7ULANZtpDZsdAc2C3fd8JSuzKbgnvQ4=; b=Z6ABG0+lJYFrQf4k8DiA+u4PeT
	yOjI0mHCL9mKZxEjUdzyjaJkFGZHc/9DJmC0cwwzGL7KCKA5hb0zHooEAg0kb99RL3R9toX8qGj/G
	FpKBMYAk+GldoevESbgS4AfhvM24oVrf33ux3bUQP9ZHmzi3nqoJWoP3uZk/w2cACPjzUXi+p2qYw
	senBFmk0bLSjgtMCw9UQEB8Fh81vPcZ5FFd/FCUV3u7G+4idCPhAGm/Ch8hVEb8It79vB06nEZyRx
	bb9i3wEPLcnOBivnLuTHmS/0MJbFCj18wEQstNCIRTu0V46xuiRTsQ8mQt0S4qDWS2rUWnDFzR8PK
	ggNbUmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pkw-0000000G4Sw-1aI8;
	Sat, 19 Sep 2026 07:45:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pkt-0000000G4Rl-0rsD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 07:45:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F1601C51459;
	Sat, 19 Sep 2026 07:45:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB066606CA;
	Sat, 19 Sep 2026 07:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA9C31032907B;
	Sat, 19 Sep 2026 09:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789803898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Q1nUjk9VuBCM7ULANZtpDZsdAc2C3fd8JSuzKbgnvQ4=;
	b=jHPYmXICISt0CBNQjPTDTCC2qeZGvMsEMJrbnwLOm3YogxWf3b761RqRUgHk4k/qiSDy7e
	W/YLodLm8ONW3xTvS2dp3x/JSSjNy3k/Q9BQKZFU0WRIc7/gEPd3koACUfo2mPE6HKqVOb
	cPZMjC4/1pc4R+u/YZUQXVgi615GFpnT1TbLF/cbrIE9PftbtkKQTrQL0tidZO5ZvryMYE
	we+X/a+wBLsMrbDUD9Vaw9ZOeLPWg7gxzcA3DJ5VBlUFDUMPbtXyRUr/IEYmQPcRG5qsQu
	O0uSGkuHhtt8p51XvVvFo4mUEqAyuhWx2UDpVn4VdsiKCih4gqaTshLp7R82Ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Wentao Liang" <vulab@iscas.ac.cn>,  alexandre.belloni@bootlin.com,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  vigneshr@ti.com,
  claudiu.beznea@tuxon.dev,  stable@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  nicolas.ferre@microchip.com,
  bbrezillon@kernel.org,  richard@nod.at
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix HSMC clock leak in legacy
 controller init
In-Reply-To: <20260917103855.934A81F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 17 Sep 2026 10:38:55
	+0000")
References: <20260917102804.2146887-1-vulab@iscas.ac.cn>
	<20260917103855.934A81F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sat, 19 Sep 2026 09:44:51 +0200
Message-ID: <87se35elcc.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_004503_407377_68E85CF7 
X-CRM114-Status: UNSURE (   5.61  )
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

On 17/09/2026 at 10:38:55 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] mtd: backward goto in error handling path violates kernel
> style

Yes, it is strange, can you please fix this?

