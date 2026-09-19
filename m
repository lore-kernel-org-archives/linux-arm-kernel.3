Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B49C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 07:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=; b=sNaXppvSIGxt044/9imJRT5keB
	oLX7HXQ78lkLAxx1GEVfyAP+k7W6eNjSNMHlac1gHL/xVteXHX7gMm0+Qc5sA6L8mmU/W9LtvTPog
	vwWd7pn33ZS9WtkycfGdgeCQXNOccKrRffa/m22nN6FF3Ky/uGVfaPTwjpjbFdNrhpxCIjYS+8UBN
	B2Dn7OKa0NuOWNQLWsbv5KY1+av6xlZ6Rd/cft0m78hm36UjP+WFnT18NZNGo4Uhoy0Jz1iHcTMGV
	N64oEg5M8cnnnfcYTig2ZLnlf4BIU49zrRDK6Nj874Xk9Zt0zFfeqVw2LWrCK5qT2wLTpNlveiQ50
	/s/ir55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pl6-0000000G4WQ-2H2U;
	Sat, 19 Sep 2026 07:45:16 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pl3-0000000G4V6-37xn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 07:45:14 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1537641a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789803913; x=1790408713; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=ANSwHEeA2r4Nap/0NMQRL8RWAUO6is6/7eGPKw876+yEO9Os99Juqcn5mVd+87AAHC
         /19oDHukn0GXwk0lHPCKP/ejDGKCsLq/z7R9Uf++wkLig41/Ma8hsnaf5voTO9lo2HHe
         xWRBK422yCMQpbI4ETcCfFDd1d/MKOirh6SL/sAgHn1PPgZc3NxwdweoRlaKHN9yi5vp
         oBl55XGYlVy1gMGB/bTjYGAksIxX7JxvHn+0qrq+Brtnhx7z353Za1cmBOwb8JhZAGFk
         pyP45oElZo2KGH5llU8ckFLTClI3WhHlwP1lcW0ifG8kojx1NsUJzS6Xp7JkS2IiDjuX
         zhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789803913; x=1790408713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=owkGCn20nQyIY0TNwwNcDvcqzO9GyMYfvOF0dGqwmxXPesLaJMsiPd95XjttD3wD+P
         +xUc0PMuckJremVZyZ/vGcp4godGR4RZ6C8vSeCMc3D/F7MtLOtPJEjH6HCis3PUFpBc
         BsciMXaWlMSKLaYkXGCF3BsBeT2PRZUZOL6SibGB5zNGGPLjkIY4hlxc8jYYZioLAOTT
         ThIIlL4Z50B2O45UW+TVNGuzk2N36daJP0KUD2w31ROhXExkAjU4KJEKEwrvqPFePt1z
         GQ6eoGiKAr+L8VdUsbG4iv9TOTgO6XQcmHZaa0E8nxalKJtq2JPdKxwAY/fCvqYR1tVd
         me/w==
X-Forwarded-Encrypted: i=1; AKwUvBzdXqBCiA6Eruij4pyW+DbGkDAcn3R1KjYR7t0vKPyS8aH4o7pSH3k7jGDlanarY7UbW/4ZEwDP5gJ8VVLcIC7P@lists.infradead.org
X-Gm-Message-State: AFuF++nIboz3KzyhmGeM554YsHvUhdaVYaZYzl0pqxhTtcTEKEGNglfH
	it/9d5KITaVlyhdfLO7JBICcf8Z3uYS6ql/a7daRthUc73VS9Gb+UxOJ
X-Gm-Gg: AYBFou2moQpkpXpbC80JMiwRyDjuQasRfRQXyfzGz000tuBbJfNk9cEAnKYzFwSFAtp
	NQDcvkxAKZfcgn1Yfc+tn5jPtRXJk7VbsA7D47R3FHXCwP3hQ/aCB9zemf/q7by7zHCJt8eVqfN
	P2RAMhrb4eu47oYtCO4Uicgw4/sbpX6m+8Jalb0zxd2KJvtvcXS1QJDNv6bAdHGZyLlGx5J5eJD
	8wmsBwINGIVjEn2iBz8HsBzWIiwOOV/kSpAsVaWSncl+t4iFBQcKXWucKAN9XD5TukfMENJ2Ntp
	Qv+PgAS/M6ed+vqDpA20f8vyQTAhvYT2hohVQlLbHxTp9rQeKx6H+5nvvMr++xYqCzB/7wTAQ6i
	OWeEOTP+2IMQy08MXPJHuPNqNHWPoh/xW/7LS783j4hrkCSkb1pHnsSQpm8BueQalEbJG8JayBG
	4XFwCa4H2EZnfikfJDHAJBZ3FqlkBWRukz43OuVbYJi3W4NjmDpcrKWv7YXBNaG/GDzMWScdo+J
	w==
X-Received: by 2002:a17:90a:c88d:b0:39e:4c80:f67f with SMTP id 98e67ed59e1d1-39e54f3aa58mr9006171a91.30.1789803912686;
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Received: from [192.168.101.188] ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm6860122c88.15.2026.09.19.00.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Message-ID: <aeb5b8a8-e01e-404f-9788-b4770ecdd9ef@gmail.com>
Date: Sat, 19 Sep 2026 15:44:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: allwinner: a523: add DWC3 USB3.0 node
To: Per Larsson <per@palvencia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20250816084700.569524-1-iuncuim@gmail.com>
 <20250816084700.569524-7-iuncuim@gmail.com> <20260915013336.68ee3611@rpi>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20260915013336.68ee3611@rpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_004513_795285_43C765F5 
X-CRM114-Status: GOOD (  17.36  )
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

On 9/15/26 07:33, Per Larsson wrote:
> On Sat, 16 Aug 2025 16:46:59 +0800
> iuncuim <iuncuim@gmail.com> wrote:
> 
>> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> 
> (Sorry for the more-or-less necroposting)
> 
> This is the only mention of irq or interrupt in the entire series,
> which at first led me to believe there was something missing given that
> there's a "Nobody cared" message appearing when the port first detects
> something connected to it followed by something about the irq
> being disabled.
> 
> Now I read in the text of another patch (adding a TrimUi dts) that this
> message comes when an interrupt storm is detected, and given that the
> value in /proc/interrupts goes from zero to 100K in no time, that seems
> likely to be the case here as well.
> 
Yes.> What is this interrupt supposed to be about, and can it be handled
> better?
This inerrupt should be disabled in host mode, I'll do it in v2.
But except this message it doesn't affect functionality.

