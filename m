Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfmRBwpMkOAL1gdqiVsz8y3IJffq2RYA84kWTiYDvV8=; b=gQrPDatC2dw6VgtZ9oT92A2JOv
	EHitx6JHAgni70hQlO0HRNHx0HgA/8EjffD652ZT0Jzzk/6q/NwX56+lYNR/tJV/E4vetA85BqHKs
	adbg+Auy7DBsTqVs2oKDm9rAeVM1+6GlPKRXZFpotx/xmnGHlIz1A+Vt9QLEriSwEZcqUe38bW0kK
	PPJsKoIy5PXr+3m21Aaie+DOOo5EyvB9z4Br7WCvJlUEcSH7ld3tSc2QLX0PUONgKZ+mhJLC5OnkI
	3fjXV/X4Bupavnw7qUQXxI7sO/fVvzR81/Xo27sZ7nRZWRr+VofYPPo9BOOxOa/5ZiEwaAsNgInu0
	weN9BpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnJk-00000002H0o-3ts1;
	Thu, 09 Jul 2026 11:53:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnJk-00000002H0h-017y
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 11:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cfmRBwpMkOAL1gdqiVsz8y3IJffq2RYA84kWTiYDvV8=; b=q26fTAkJHuDt7Jj/y2b6u8ATfT
	0U5HauF9k4HPMDV1FiucCCs1qmeFKWjQwRva3OwdJaSjOmyMCz8gJMJkIRRSRvULE7uOQJO+8/3H2
	5peKyOeoNFmUvOGXRjqK0botUOrgvdktAsVrsqwzHKQx/v3lrc2JU2+GXrUYtj3kdTblrbn9jMIg4
	iSTWKegQsHvb+dVOmftjP2ZyHmebQq3s76hgSNkZCgZnynvlPAVx7QfKBIu7NdAwFpFU7Yu0hpf5g
	YQrVXGbEQ30AEdvvTdq7fldTSaVjbQZ7BklPWiXPLHZpwRvKQUevMSQyhQFoR60ay0wbhEU13KQbU
	Yads5FhA==;
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whnJg-00000009AfB-1ySl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:53:22 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwtdM40ZMzKw0Q;
	Thu, 09 Jul 2026 13:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783597991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfmRBwpMkOAL1gdqiVsz8y3IJffq2RYA84kWTiYDvV8=;
	b=qwUaHM6Eg3Ou3Bb0vunTLAoXs61dFPHLMhhiF803+/Jk7tGXPQHdkPqRqdFwX327XNZbfY
	AGx84tbDctqfUeDtdV7muYc5c9MTJ6/5bQe5aJSl0RJvyfnAG7zBXzAbS1WGBy/8VXozCw
	lgwaXl1i84PU/h99cC0CnWhxCMZqZP8dXB6kYcB/65GtrGQ+qBVfnNZl19aKurE/EJAbN5
	ZAHhFia89/apdfMAKjk3ueNTBX5ajX3OO5ybC5755NvmlBRD91slVDshtWHy8eEViT3UEG
	GphaTDKfONhxR9prkcBdrsKt3dVXvfCQTWcpcyChtwOh0iR+ehCiV24h5OQnPg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DOOtB6P8;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <c0c8f839-d3e7-4253-9d95-85bf425c88ff@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783597989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfmRBwpMkOAL1gdqiVsz8y3IJffq2RYA84kWTiYDvV8=;
	b=DOOtB6P8+pOLeA4ezin/VGU3dZ/2eAbqKz0Rm/2pZxSeukm/lorAVbfc68T7EQvZan9PiD
	8eDFhl+etBS6dr/LrnEEjo69DVUUmoEZdX6SNeqf7K8Yik2bmxPr6YxfW1L4h/x1+bUXtX
	HDRgOmafzDfBZi7gbMAg+aF6QCjVj3cToFLLZc6/wiSkBpOdRxbSdL0ifwWbAALBQ9K8n2
	m8WXdXok25uC1/CO2Nr9s8IKLPOE/DMZ0BW5IGjBGxFxCoa4eJAsNW6JSlYqYxCxlkKFzd
	5/JZvXB/pBcgJB5UB4iLO4yCnSkyoBGVuoGytn9nOlj3P5EhqR9q45BejKkYIQ==
Date: Thu, 9 Jul 2026 13:24:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
 <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
 <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3um84g88ek55xnbu4c56jy8ahwccrd9w
X-MBO-RS-ID: 50f867c705c83dacbe1
X-Rspamd-Queue-Id: 4gwtdM40ZMzKw0Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_125320_745388_E0E51EDA 
X-CRM114-Status: GOOD (  10.47  )
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

On 7/9/26 12:24 PM, Geert Uytterhoeven wrote:

Hello Geert,

>>> +             mdlc_ddr7: system-controller@e8380000 {
>>> +                     compatible = "renesas,r8a78000-mdlc";
>>> +                     reg = <0 0xe8380000 0 0x1000>;
>>> +                     #power-domain-cells = <2>;
>>> +                     #reset-cells = <1>;
>>> +                     bootph-all;
>>> +             };
>>> +
>>> +             mdlc_hscn: system-controller@c9c90000 {
>>> +                     compatible = "renesas,r8a78000-mdlc";
>>> +                     reg = <0 0xc9c90000 0 0x1000>;
>>> +                     #power-domain-cells = <2>;
>>> +                     #reset-cells = <1>;
>>> +                     bootph-all;
>>> +             };
>>> +
>>> +             mdlc_rt: system-controller@19440000 {
>>
>> Please keep the list sorted (0x19440000 should be before 0xc9c90000).
> 
> These are sorted by instance (Module Number), as per Table 18.1
> ("Target Module hierarchy of Module Power Gating and Module Standby")
> in the documentation.  This order is indeed a bit odd, as it differs
> from both alphabetical label order (unlike e.g. hscifN), and numerical
> unit address order...
> 
> Any guidance?
Do you think those MDLC instances might be on different sub-busses and 
we might need to model those busses using simple-bus in DT ?

