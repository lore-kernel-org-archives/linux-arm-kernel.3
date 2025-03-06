Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F87C4wjGEeOaXJ9FYvPi3cAmLDRogSysr9OIdS0ekAs=; b=AYNtNTZWsZ2Sm87GLJk8bVHKLM
	8J+jXOZ15lZvT54txkwuoydcQCpxsembg8D50WUOKbi7OewJ/e6R7yiFS+3+SrlFvENAnkfi7d7lG
	hoBUODyNK1wTe6X9IUAOaBux+BVu246Mr6cglVQptI+0OVslXZi6BN+qJ/XgsvFC5dXLzFiQsfyWU
	DX728t0aC7rSuoor3E/8BgMmnlf1OOBoCFVK1ZRWts6wgMNhQoNiiWF6Upp3aoGfQdFRbNaOcWWv9
	8cZq3gLbVVR3V1SoB8HT0SWoLw2MLoeum5I2LrIQG37Al4zqOPk3qpZz9KXpAxgbxyBlEzLRRKx87
	jmMF8/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHcd-0000000C6cN-3Aup;
	Thu, 06 Mar 2025 20:15:11 +0000
Received: from mail.mvand.net ([185.229.52.35])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHb0-0000000C6Pe-30EC;
	Thu, 06 Mar 2025 20:13:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.mvand.net (Postfix) with ESMTPSA id 20E551FFBE;
	Thu,  6 Mar 2025 21:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=martijnvandeventer.nl; s=default; t=1741292008;
	bh=Cgdy+MoS5drv8lXdb22ppJ0XjnIjqmgcB7r94/9mKUA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=dGhADVRM3Zmg4x5jYwZff6ZrtJpm2vttKQC/YMrDTscaLRqd5tODw5ozbBXiKYgok
	 Pmzp957BJE0rcZLmw1bDfpA2od0rQL1OB9n6lLNAWulycXkgl91lMesltuFWr0dUhm
	 gcgHJHT78nIm59YuSP4tudZ0RCUPezElCf9bY9qrpN/RDf402faQvDTuhzfb8Z/SRR
	 +BZJcnPZHkHSuVyF6Y2ur99XAl9agj2t5y6rxbtzG2kUJCaSYQjHMLg47xaGcpzl2U
	 /v272BM1oQwqFG6Ez8vpTKLRPWDnp/IcTFEbf5GQQqPOTTDhvHDYSiS2jxkC5tKnmZ
	 qeg7rEW5Y8WOA==
From: <linux@martijnvandeventer.nl>
To: "'Jerome Brunet'" <jbrunet@baylibre.com>
Cc: "'Neil Armstrong'" <neil.armstrong@linaro.org>,
	"'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>,
	"'Kevin Hilman'" <khilman@baylibre.com>,
	"'Martin Blumenstingl'" <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250213221702.606-1-linux@martijnvandeventer.nl>	<1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>	<003301db888e$8ea84e90$abf8ebb0$@martijnvandeventer.nl>	<1jplj3g21q.fsf@starbuckisacylon.baylibre.com>	<004801db8eb7$99808e20$cc81aa60$@martijnvandeventer.nl> <1j4j065avo.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4j065avo.fsf@starbuckisacylon.baylibre.com>
Subject: RE: [PATCH] clk: meson: g12a: Fix kernel warnings when no display attached
Date: Thu, 6 Mar 2025 21:13:27 +0100
Message-ID: <001401db8ed4$392ef030$ab8cd090$@martijnvandeventer.nl>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
Thread-Index: AQH3Houg6kGqwWGxu7A7A+ZA83tGEAI4axMrAfruu2QCUs8BLwIt43dLAg23U/Sy2VxfgA==
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_121330_905468_00D5C12F 
X-CRM114-Status: UNSURE (   9.19  )
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

Hi Jerome,
> 
> Once again, you are encouraged to fix things up ... where fixes are needed.

Encouragement is not the problem, time is ;-)

> DRM is hardly immutable. If you don't feel like you can do it on your own,
> you can still engage with the other contributors who may know this
> better and help you.

Maybe in a few months when I have some more time. Thanks.

> >
> > On the other hand, I also understand that if you, as a maintainer, allow
> > that, chances are it will never see a proper fix. :-)
> >
> > Cheers!
> >
-- 
Best regards,
Martijn


