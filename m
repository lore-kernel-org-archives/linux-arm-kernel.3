Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFB9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCay4j7C41YPfPP4dRmjz27ecUbg9JIQQ0y/wWYi3Yk=; b=KFrr11s9jE0g+kk+WHWOFalFFp
	zrYpQVdiT0ouE8K4WKisejSYwppPY00QU/3S7nWJVYK8p/HkDX/0iztx17lEejQK+mEYv1jAm+Xww
	WBADEt7ivjAF0zIi8dKq7YNobdzsIUEPkMVKTlPRlGHALnm0nGsi84NlB01AlU6DSUaiRWNe40plG
	yA9JbbsfvwSFOcZfh/eH8jHBT3PQS+l0RL26bevV60hOGfUpABfT+jXCu3O8hmFpzJz/Lm62W4kKb
	6ELsjSFKdqGViCby9Q0r+8dZX8X6JJSnNn4p1/+RZNqTz3A0jTfN5cCisVN+C8DBtg2Y9OY6Myg7N
	xy8HkVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHo-00000004mdz-1SkJ;
	Fri, 09 May 2025 20:25:37 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQTt-00000004Gcc-2Igs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:21:51 +0000
Date: Fri, 9 May 2025 12:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746807707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oCay4j7C41YPfPP4dRmjz27ecUbg9JIQQ0y/wWYi3Yk=;
	b=yJbb5Pv23OL+WAcAvl05L189sakxNU2wSigqZjyKPBKo6TN/zVF3XYwjSGhv/nOUsiEjL/
	Tp8tSHES30I1yjcQmteNELFrqGV/wMzPapMmE2mcb5VxV89kHpNkfAWq0W5a43dR7bQeR3
	tj08z9iGNCbD3M+FVqOr5t9j3yQAw8MY5HnYsz+l2fxXFwkjNx4XLdsQjaR13NvfRce8d1
	NmvMvyE+Cg/sJgIBOCWV6X1i6kZ5PwdUwMWq5Wr7lzoRGnFI38esKrtfgKKKRoJSgurIpD
	ac11fOF5/1DfHQHvguwizyJTVaY0X11phlrinCUlPVjjthsGKDpUWi0jK4cwVw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 6/9] power: reset: macsmc-reboot: Add driver for
 rebooting via Apple SMC
Message-ID: <aB4rliBFrUWWuNQ2@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-6-500b9b6546fc@svenpeter.dev>
 <aB39iJm9759RYAKW@blossom>
 <196f84ea-6567-4fe3-9bee-743bb289223e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196f84ea-6567-4fe3-9bee-743bb289223e@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_092149_938841_D3C3792F 
X-CRM114-Status: UNSURE (   9.60  )
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

> >
> >> +		mdelay(100);
> >> +		WARN_ON(1);
> >
> > ...What?
> 
> This is done in a few drivers in drivers/power/reboot. If we haven't
> rebooted after 100ms something's wrong with SMC. I'll add a comment.
> 
> drivers/power/reset/tps65086-restart.c:	WARN_ON(1);
> drivers/power/reset/atc260x-poweroff.c:	WARN_ONCE(1, "Unable to power off system\n");
> drivers/power/reset/mt6323-poweroff.c:	WARN_ONCE(1, "Unable to power off system\n");
> drivers/power/reset/gpio-restart.c:	WARN_ON(1);
> drivers/power/reset/regulator-poweroff.c:	WARN_ON(1);

Ohh, duh, ok. Cute.

Can we do the WARN_ONCE(1, "Unable ...") pattern? Then we don't need a
comment since the warn message makes it obvious.

