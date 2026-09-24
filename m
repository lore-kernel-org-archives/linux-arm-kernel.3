Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9378DC98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihCaIXxNrufdB165FFQLuKNHzdKzMm2Q3bT5iLKUB2w=; b=vpMm9ywIEN2KrojcZvK+lieceP
	yVkNFC/t1zUmjfuWlvTsDFUEu9tKOVQmwyo4Lze1MOKXR7X+ZiQ+3hOTW1zrDjt9ONabhVK/aHlpa
	3qRPJ2hYv6XZbczz2nZYw+NkzpB8fdnIvwihiIu5q/1wL/158lIIzgBNqLwdMy4U01SXw6ic5VZIL
	VPlD5+wMeH1PdQN3UM79HXdNzTbbJ7Ukln7f5rsknGfVIjgsTStTdz4deeUgvbtrrHrMpbrzzgUnc
	KL6+o5QrJHBlLusQ/QX9rX4lY0qQHpLFvYbVPXU+5kInseTiyHnCzpX7UMznU2Ned8Wfy7bZZWDJ4
	JuT0q8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f4D-0000000AToL-24Bb;
	Thu, 24 Sep 2026 08:44:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f4A-0000000ATni-1RbG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790239467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihCaIXxNrufdB165FFQLuKNHzdKzMm2Q3bT5iLKUB2w=;
	b=bD1RC4EHmkiKb7JiPeS3OleOLyRJ7WtSDwF5sO1h8cQuicHvyZ+AVRgcdkjoZaPkIsxLle
	r2vmLfYBoE0XXZGrO1alluwJHUvUmnA210vO2jWhN/GTWuy2FyEIZ0K/JTmaXIqHz8cp26
	enzndjOE/8zcDqTUNU9zJqxp9SDhxj8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-L2ebGXFGPtGYLS0mWXvoAQ-1; Thu, 24 Sep 2026 04:44:26 -0400
X-MC-Unique: L2ebGXFGPtGYLS0mWXvoAQ-1
X-Mimecast-MFC-AGG-ID: L2ebGXFGPtGYLS0mWXvoAQ_1790239465
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6aa47eed2c3so2281347a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239465; x=1790844265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihCaIXxNrufdB165FFQLuKNHzdKzMm2Q3bT5iLKUB2w=;
        b=zjGddjvBRHVxQdii7WZZwiFRUkMeFhfPGrIZ1v3AN1WTnLVWeS0l6wO236k7SFeIdI
         5ix91t0Z20cE2QB4WLl6RP7Rybrg/jNO5dQedckGgwuZCGDKqvjKyf6JiHJ4/ERYvGDs
         jaznuvu0QeU4O+vJjW+sNHS1Ng2CcFYSpGHZSA4de2F9DK2j/BP4Exvy2BgE4pQdwQIU
         CY2QQjCGnrHFZVTFw5daBu/2yhtTvmEy2XumAz/q2ceJZt1yghcKkEJsybzls3yq9ujj
         ZHnRfPxHrRJ+Vk7ESukA6Nw+NbTlZYr7cvbhsHQDHCAO5d6jljrsg4SI6LvWBHlz4opF
         WJ+w==
X-Forwarded-Encrypted: i=1; AKwUvByA5D3W6YMYjI3WOPjIKD/5EUf2Rv7l4rm7WlR5gDsiok5vp9SX3hV3M8f0WmUHUWBpDFVbNvT3bFctikjFk0YZ@lists.infradead.org
X-Gm-Message-State: AFuF++nYwX3y7NzKaFHUXR3pM4kizf2quklMr3BHFBE62Nyc8O+iSKA7
	gTk5ybIzSgIeNnsm1+2utxuMr5KCC11A+Dikd4SzhgWthr357taaw0q20jygoc0FNGIzz/39hAa
	XZNLWgw20CU8qN/qPbE6wjBbh5pVz8cQ969ZwH7dC3ozC1hvIbBYofFSy8akfpmj46axbca3l17
	cJ
X-Gm-Gg: AYBFou1bLaoPZfOiLNf6gT5LT4/cInxsyl4ZvHWvHNzP3IfT1FL+JsHPkXafn+2y9JG
	tB5czt0WN7QWxalCHR6C5MEXap7+RU9Ji//rXg5tPlbg+P7XeypTTrWN+NIll6dRLrWANFr85KO
	9JSpOTduoE5Hn9Ygj6IGUqWqfYRH6uRe8isDycBpo6OMeE0M6mQ2b3PwoJkICLb81ebzDXvrmUt
	/9rEmUZ0x4HtmmpLYQp8xvn5bKzSowc7O2TlfUn9T5CtmM6RoTw4TgduqPQu7nMVmlmFNSR1PtF
	gOG3U0f/IE/or2+gPDWgTZLxqFVxaMvNjQBZLNU+0u6A+mPvGsV8B47ZxDA3GOJ/Ww9UTHJjApN
	f9j+8XVdR6H6DC4E2hoLv57MJqft2zUHOe1GrGym1OB4wCd093GshbjvKslae5J1CyuJr3pjIzQ
	==
X-Received: by 2002:a05:6402:20d1:20b0:6aa:d223:8040 with SMTP id 4fb4d7f45d1cf-6aad223808bmr435021a12.6.1790239464894;
        Thu, 24 Sep 2026 01:44:24 -0700 (PDT)
X-Received: by 2002:a05:6402:20d1:20b0:6aa:d223:8040 with SMTP id 4fb4d7f45d1cf-6aad223808bmr434996a12.6.1790239464479;
        Thu, 24 Sep 2026 01:44:24 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3883141sm3191412a12.15.2026.09.24.01.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:44:23 -0700 (PDT)
Message-ID: <77c78712-d320-4a79-89e0-cfe11a33842f@redhat.com>
Date: Thu, 24 Sep 2026 10:44:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: Setup TBS only if HW supports it
To: netdev-bot+sashiko@kernel.org,
 muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
References: <20260918023530.31971-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <179004548784.2160803.5129187589966240478@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179004548784.2160803.5129187589966240478@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BERV0vIql9eXal_Bx5HRocSptvmSQksoqF2MvZquvL4_1790239465
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_014430_479956_7FB828CA 
X-CRM114-Status: GOOD (  12.89  )
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

On 9/22/26 04:51, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 2 (1) · Low: 0 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The patch is a bug fix (it prevents a descriptor-format
>    mismatch where the Tx ring is laid out with the 32-byte `struct…
> - [Medium] The new gate in stmmac_setup_dma_desc() (stmmac_main.c:4128)
>    only checks the chip-wide capability bit `priv->dma_cap.tbssel`; it…

I think this patch should stay on net-next with no fixes tag, but the other
reported issue looks worth to be addressed.

/P


