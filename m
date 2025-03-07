Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CE3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 08:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrTQhqGlLV5cWQ6Nh+cod8+JI+BnnsiYR1gmH7cf4OM=; b=Yt+W66bWHuYf54jPudRYhjaOmF
	e7OB92gmEcCJiPQgCZWrC+iIiHkV1sq/xIL/ngiPYGgfHcnN8dPXHaOqP4rLqgfovmSB39yPtSo+E
	DVZoyEboo7iTKdWf3Kj9iBpkCIx7DOyfZA+nMeeCu5bWK8RK0Su7Rf7XSZCV0zAxXQX2TueNWypvJ
	KN0cUcS7BHuvxYtGXL3+r1QEdnkFRTTtq12uhVNXixsZWPLRRtqtjpsJ4pVIJgk76hDKZb63aBS1K
	yhoZfC5MRpc8qorYp105HlURw3wk3JTcaASuu9rBl2Cg4BiLR4Fs/L/kOwhtaamAFFRJc7DtZ006t
	JSt/2piA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSg0-0000000DUoO-3GhR;
	Fri, 07 Mar 2025 08:03:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSeO-0000000DUWn-1LcP;
	Fri, 07 Mar 2025 08:01:45 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741334502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VrTQhqGlLV5cWQ6Nh+cod8+JI+BnnsiYR1gmH7cf4OM=;
	b=cGUTpD/pe3+W5tQmc1UM6R77BLDtZLZPh4MzBkWfM8xdOdIstwwUc72y/EM8DW5lICWEtO
	QDmtT7tYePDwwGwkUCsSEFKl6oHKnmJYGulQtm7IP/OZuM+B0a0LulmxnQ24WxVSOhIYHc
	Ilayib+gPL/+blLqWb51BoD388E2Kdm4OYFXFqM/rH3olhYhLmc1/iKAMZ+o0EbzY12bDl
	/o8gJBKYfy7GsGxjGn5gN19tGPN6jOeZzt8FZWAwJopqI9MSJ+CUJ51evyKYseUlCMzzz/
	8ME1P1KZANA7uwYovrS1UZ3ZNEw696ySyr5djYKum6oNMBGYmJs0yRN9nNIwwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741334502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VrTQhqGlLV5cWQ6Nh+cod8+JI+BnnsiYR1gmH7cf4OM=;
	b=X/42zBxjbdatW11BeZBnTTaD80z26A5ii1/XPwd/MSjYv0wfuJQfp1V0qduef7uS1MOlJU
	UowQ9qoOHXEF1bBg==
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v3 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
In-Reply-To: <20250305-irqchip-gpio-a4-a5-v3-2-1eec70352fea@amlogic.com>
References: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
 <20250305-irqchip-gpio-a4-a5-v3-2-1eec70352fea@amlogic.com>
Date: Fri, 07 Mar 2025 09:01:41 +0100
Message-ID: <87h64546ca.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_000144_494602_1B7634C3 
X-CRM114-Status: UNSURE (   7.28  )
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

On Wed, Mar 05 2025 at 18:02, Xianwei Zhao via wrote:
> @@ -358,16 +385,19 @@ static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
>  {
>  	u32 val = 0;
>  	unsigned int idx;
> +	const struct meson_gpio_irq_params *params;
> +
> +	params = ctl->params;

Please fix up the variable declaration according to

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

and initialize params right in the declaration. 

Thanks,

        tglx

