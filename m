Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10F4E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVOU/hBtES9NqNMn3b9b53d5oMMBwDCM8MS0sfrPHxw=; b=uUZVD+NQZLzUyF
	2QMdDM10OgHC21POGUV4qHE8s0OUg5goUyYIdS/Xb3kaRNaDjZwE2DkRe9ubyvdwfQP57Bn6QZEp6
	iLTQNcJs93ZrjTcg+QPKqXbwVGo2wfJE+5ftHWRNHs36cnNUIjOcpT/xhf8Ja5vyh+RxcR1wUl+RT
	S9cKGD6K6eKR2ggaP83eKk7m4uFxXUgSec8QELRXSUOELKVpJfFF5rpCBqi3ta5zBe33oyq6AbLUa
	y+AciQNW9nr75mpgbxXMIoCfhS5QPmfRxVEmt1OyH3f7e5KInTKfFg7/lB4pW2hU9gpiylilF+zkm
	krulixCwpwSdxEbAE5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVl-0000000Fpi5-0ZcZ;
	Thu, 05 Dec 2024 11:59:13 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ka-0000000FZwJ-1oFX;
	Thu, 05 Dec 2024 10:43:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92C6EFF80C;
	Thu,  5 Dec 2024 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVOU/hBtES9NqNMn3b9b53d5oMMBwDCM8MS0sfrPHxw=;
	b=NJnHShKWQUPjsX2QhlM5RDC+Jzxsy8E7DP7gbzzy10uiSf8zLJzRgetftuIys0UKY5J3/z
	dZWX9tr5Ds/Wu8zUUSUTAIIGSpdwLF2mrHkqpInaACBaJCF7/pDxTfR00uHY4a+epFiWKI
	n18wVl8zCnBtflYJW/vJvYMwUOP/OmzQcVnqMAPbvI5iCIXz75fjvBb8GdFzARHOVBj86m
	zpfcoA5iQUn6ElWHAr4IjGQf2rl8GrRvtUbNYBeDcb+1j1dR37ufXae52mw3NwvlW/oOwh
	ma/3ujT1hBMvn7nnVZiscRbdLoXa4pYSkWvzaAvSSBNJFlydFY1B0v9aihF+Ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH next] mtd: rawnand: fix double free in atmel_pmecc_create_user()
Date: Thu,  5 Dec 2024 11:43:25 +0100
Message-ID: <173339519112.766262.17129619892556491178.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
References: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024336_617940_0FDA66F3 
X-CRM114-Status: UNSURE (   5.97  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 23 Oct 2024 11:40:56 +0300, Dan Carpenter wrote:
> The "user" pointer was converted from being allocated with kzalloc() to
> being allocated by devm_kzalloc().  Calling kfree(user) will lead to a
> double free.
> 
> 

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: fix double free in atmel_pmecc_create_user()

Patche(s) will be available within hours on:
mtd/linux.git

Kind regards,
Miquèl

