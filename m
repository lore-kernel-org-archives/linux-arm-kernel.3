Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45236C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zE9Hol5W0Rh1lJT2GJiCCSTpTuhmnmJkeFueZrsNTT4=; b=gWVZhhoui2sgTiq0kDgjcNmLtk
	0hjEmBo4if3U7/Nr4Pauz8Z565ur7pUmb5+Cr0r4+FdOeiRsP0mHr7oJFdOU1J6U1IJIEQENyrCDb
	O19hym+FmGeXeCRWm+rwjWbYLuP40NXCOEx3MnmcnrhyYroC9N6f/dcSgnNkjr2ubFJH/rxLjhYFM
	vf7XdQSDoEKbBovU2SkR9XtywfKU8y7PwaOR14PvfQQ66uK906i5jxjiBLb4owlIZ1gzIW5odqLSq
	JkRxK0YdI0VsPm9eSItvGtp0GX/TuEtwhB+veGfqrHWDk3wV5Ij2lEUgar0kEUdszSC7v2plbR1TR
	EzqPC2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X3w-0000000EHtu-0ISd;
	Fri, 18 Sep 2026 11:47:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X3v-0000000EHtX-0VQX;
	Fri, 18 Sep 2026 11:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9072D4095E;
	Fri, 18 Sep 2026 11:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8531F000FF;
	Fri, 18 Sep 2026 11:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789732046;
	bh=zE9Hol5W0Rh1lJT2GJiCCSTpTuhmnmJkeFueZrsNTT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V2PxFxELXPOhcxZV6isnkG5MVQXX9m7gBGa4ddUD3p+XeCcVP1mCxvI9XUY9i0Pjm
	 9laeeO8y/jLpHl0UuIMfKYWc9WH732l1NXD+ylJIIfKfv1uSE3BlSyzovERlziKDcc
	 7hplXNVEbLZio6PG18aMu1wvgo1PlL/Ra103RuUC0oRh126j7f3sN/P41kbZh43NXG
	 yAjS3wS7LlZ86QxJ/N+KxeiYzfjqOqgx3tWEKeU+iimT5OWCJkX7S9BOuUyseUFyCZ
	 /pFYad1z3xEs6QOFbHVhYcHcfiD4nFKH9HeSm9aTolR0LHqXi8u/Zq+r0+8rMqMc8p
	 ou7QtEuWwP6iA==
Date: Fri, 18 Sep 2026 13:47:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH v3 2/2] rtc: Add Raspberry Pi 5 RTC driver
Message-ID: <20260918-outrageous-myrtle-giraffe-80dfdc@quoll>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-3-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917135841.841680-3-sander.speetjens@gmail.com>
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

On Thu, Sep 17, 2026 at 03:58:41PM +0200, Sander Speetjens wrote:
> +	return devm_rtc_register_device(vrtc->rtc);
> +}
> +
> +static const struct of_device_id rpi_rtc_dt_match[] = {
> +	{ .compatible = "raspberrypi,firmware-rtc"},

Please fixup white space issues, see existing drivers (missing space
before }

> +	{},

and unnecessary ,.

Just take existing latest code as starting point, otherwise you
reintroduce discouraged patterns.

More important: undocumented ABI.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


