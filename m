Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5FBCE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8spWPzzW+RpkKEZEymL4RDCa/iyttnxIy8IqNQCgQ7A=; b=tUKskXqsnMLwitrrLskoWlT4i1
	pK22C1jeoxPaUgzgO0QhabzRWMp84rU0zq/S+J1p3jDZwbrv5zcxXkt3hU7nyQKzYVfhkk29DXU3n
	V201f7RYSarfOW2qL47UgMsbZv9QPHmz3FWNLBoA3evNVClELYyUzD58tz2KkUN7TX3DfN4555TUT
	4hJVYCLspLfebJjmjgIePo1zeyDGFcp+RpWdX3A8Dcoqcx09eDoMEBJoQ5K5StTOTUJSRK7lhIA0I
	dP/zet9SzeSzwQWRhj+wlniavxJik/5lehTrVNkU0Pjh3v+LsezE67eAvONTBKs69pUJRdH0j/kjz
	eSpm7uZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwOT-0000000Ci7J-1iRQ;
	Fri, 14 Nov 2025 16:11:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwOQ-0000000Ci6K-1Ky9;
	Fri, 14 Nov 2025 16:11:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763136678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8spWPzzW+RpkKEZEymL4RDCa/iyttnxIy8IqNQCgQ7A=;
	b=oVgbwioBD/6TNTKY8meNQAeUQVUHEPhW52odZ12L7J43od1/WiyI3F5/WEWKrbcTp4vrly
	o1KCg/dBAs88qjZvaBNJpTcl6UYV7dZGzAiAsMg7ZnybYwYfqHgBIrQV+xenXFL1NY/RCj
	Cb3fvucG1RFLRt/cwaMc3yIZcyOVdYg5zSgdeVKiFju2+xYy4qLAtS+z0HqNpHVOO66mjw
	cX6cQzJs8aJ9undnJKUmey+phf8ejGdDDogdWF/PFSDZv6bjs69F8if5nna1oMwIfyg8wF
	RUHtJoQXitzaZ+xUZ2M2ZvJlUnQ0RtNdP09zwDKaXD27Jbk2g3ssQDpWGjLO9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763136678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8spWPzzW+RpkKEZEymL4RDCa/iyttnxIy8IqNQCgQ7A=;
	b=BtP+hfQ7bH5zpsE6Ty5ce+Wlrw5LK+C1+844V/ZHYhQge3fb/2SzGwHOwp6Bbijhk7VKKr
	k3V0HP+8QXpQRKDA==
To: "Rob Herring (Arm)" <robh@kernel.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, devicetree@vger.kernel.org, Heiner Kallweit
 <hkallweit1@gmail.com>, linux-arm-kernel@lists.infradead.org, Jerome
 Brunet <jbrunet@baylibre.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
In-Reply-To: <176313578804.3261993.9727195642647352249.robh@kernel.org>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
 <176313578804.3261993.9727195642647352249.robh@kernel.org>
Date: Fri, 14 Nov 2025 17:11:17 +0100
Message-ID: <87qzu0bnmi.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_081122_499718_E0FBF5EA 
X-CRM114-Status: UNSURE (   7.45  )
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

On Fri, Nov 14 2025 at 09:58, Rob Herring wrote:
> On Wed, 05 Nov 2025 17:45:36 +0800, Xianwei Zhao wrote:

> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com:
>
> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: interrupt-controller@4080 (amlogic,s7d-gpio-intc): compatible: 'oneOf' conditional failed, one must be fixed:
> 	['amlogic,s7d-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
> 	'amlogic,meson-gpio-intc' was expected
> 	'amlogic,s7d-gpio-intc' is not one of ['amlogic,meson8-gpio-intc', 'amlogic,meson8b-gpio-intc', 'amlogic,meson-gxbb-gpio-intc', 'amlogic,meson-gxl-gpio-intc', 'amlogic,meson-axg-gpio-intc', 'amlogic,meson-g12a-gpio-intc', 'amlogic,meson-sm1-gpio-intc', 'amlogic,meson-a1-gpio-intc', 'amlogic,meson-s4-gpio-intc', 'amlogic,a4-gpio-intc', 'amlogic,a4-gpio-ao-intc', 'amlogic,a5-gpio-intc', 'amlogic,c3-gpio-intc', 'amlogic,t7-gpio-intc']
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml
> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: /soc/bus@fe000000/interrupt-controller@4080: failed to match any schema with compatible: ['amlogic,s7d-gpio-intc', 'amlogic,meson-gpio-intc']

The first patch in this series clearly adds the "missing"
bindings.

Confused....

