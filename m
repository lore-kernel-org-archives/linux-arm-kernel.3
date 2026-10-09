Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A3ECA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 00:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rda02Gc68Kl74aLnTEh3OCGRglkdPe0qoMqyF8ilaJQ=; b=cITewIYMiHjmZSLk9MZWhuJlQC
	cFu9IlwfLcwxjnznc1U43h3sKNn76ix1wIZ3tV6vLIy+yaJ9BViEasvpeeRRno/y6gPv2P91XS4d1
	dvb8RGBswkQvxQg3+CZMdQYWcHzCG48g/qXeOu6MOarNvyMlBprB66PFXpEjQZYta5SHbfe7xjYrk
	aoyg3kKG1421lwAhWsvvKQ8m+27UUZ6tAAkTb1lCAC6pN89AHKNnEfe0AEcmMwpAA+Z9I+//k1gH9
	UdoJ7HXec0xn33NftsS2NwVXWOPpM2JPi73uLhXXwShUIE9RdCE6HjfOIJUya2oiRpzKUtsDIUeZt
	KZtz/l2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyqq-00000005DIl-2vQy;
	Fri, 09 Oct 2026 00:52:44 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyqn-00000005DIF-2KPw;
	Fri, 09 Oct 2026 00:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791507154; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VEFxDxRU3N6c2y5xEyriWFwc3v1F+9vo5rYzynqQcN581vaKmA6+aJtA+Lt0FPXa9gqU6EUbU22+Lr5hfJvXWJsNX6djwd8Plpem7inpE3V8a17LHyWleeI+eZSrgTI2YGHUkGlGAqBRsxckW8rRoREUGx/b9uOaEGO34vl87oA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791507154; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rda02Gc68Kl74aLnTEh3OCGRglkdPe0qoMqyF8ilaJQ=; 
	b=IFXBwAh8PFQPPo1birbNlqW8GAJDkrdC2fzsJKLjdv5bgSzWIKw9CYx8VpTSxTONngWPKZA90ttIesY26JLf8nrjz/eXHufJmLHdFGF9kslGDWlAy9xYPkx70DbvWQ1w5MY6SFtqb7WH1eP9q5gCb5sBAhAA3w0KuZI5o58cxl0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791507154;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=rda02Gc68Kl74aLnTEh3OCGRglkdPe0qoMqyF8ilaJQ=;
	b=Gp0kSxNxlSkVAUuTYYBLPw2Jbmll1dOlqhZTGzYnGO3MUsZ3gCaN6PJ+Q6Yfcz+o
	j8I9mxhsWf1iuOx4kkCkClcLmHLB2xDfF2OWB3MXAr6peVNA0MdkWrCaE7FoJaGhGFB
	+wH90u9JGK/JZZmM8L3g8XSuMENSXKNUm6tVzozo=
Received: by smtp.zoho.eu with SMTPS id 179150715145367.99786079727983;
	Fri, 9 Oct 2026 02:52:31 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64
In-Reply-To: <sashiko-outbox-164681@kernel.org>
References: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
 <sashiko-outbox-164681@kernel.org>
Date: Fri, 09 Oct 2026 03:52:02 +0300
Message-ID: <1791507122667359270.h64-leds-sashiko@iav.lv>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_175241_766207_D5C9E754 
X-CRM114-Status: UNSURE (   8.88  )
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

On Fri, Oct 09, 2026 at 00:44 UTC, sashiko-bot@kernel.org wrote:
> The commit message lists a total of 7 LEDs being added (one network, one USB,
> and five SATA error LEDs). However, this code block adds an 8th LED for SATA
> activity on gpio4 RK_PD4.
>
> Was this SATA activity LED intended to be included in this patch, and if so,
> could the commit message be updated to mention it?

Yes, it was. The eighth one is LED5 on the board, "HDD Activity" in the
Kobol wiki [1]; the panel has no such LED. GPIO4_D4 only gates it: the
JMB585 activity outputs light it, and a low GPIO keeps it dark
(schematic, sheet 30). Hence default-state = "on".

[1] https://wiki.kobol.io/helios64/led/

