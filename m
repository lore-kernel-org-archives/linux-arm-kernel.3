Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74318D49C60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIS7Tv8+p6x2LqhRC/mSoQut0LYtAOWTBCiN5CGoQbo=; b=VPl8IHJJhcBmZ8UxDDzKw9mEiK
	+WCdSe2Z+lQEvCchXx6/1wUc//Q1926X42dxu7Eh3/d6xdROrsRwexGjSv5HryVW0uOvkTg6FWOaK
	dAsnlbrFBNqtc9u+8mxZuPk16KBd2l3R03Cy7lSE6AHe2Fr5SeEZJPYZg/r8l0uEr0Of+kwrCgmnS
	TZdCx6y1kwdYbkfeqdxFCdBh91LNeRCcMYHSApZx/mjw15LilYdgsklzG0n+kmddVSOS1geav5ejD
	JxiDIEfZG+Xfn/owGCXC+sR4CCc1MywZdbYyqeDtjk8N2XgzUCwgjk6g0wUb4XUKojYuyKoIawm4j
	BMop4WXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlii8-0000000180B-2CHk;
	Fri, 30 Jan 2026 07:14:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlii6-000000017zs-0ay3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:14:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso7128905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769757268; x=1770362068; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIS7Tv8+p6x2LqhRC/mSoQut0LYtAOWTBCiN5CGoQbo=;
        b=gn5mNBtggD0Sn+Hm9O6VQB3csqwc35y8oKsJWpRn/BnPt5/GAqtcVQ4YnXY3rrdUqo
         uM9kux8jrAKLske+kGZvpdzNGQxstieVa+5dCO/lrDREl3Nc7ZFh6Xnxczh3HEBlYIPc
         qMm+64zJIGbBtawR4QIi3oC1Fo/CuvQlcRqTVnqq/1t0nz5JWLpgDkV45B+0wB8QSIe3
         9gTcBtCciEH0nhUG9lyW6Ab+NnBX1oqG6wtAs10zF+ajBTEITP8lcH0rTzG0qhJa3/uO
         eBg0R84O9LY7tUe59/iRF1srq94OLZHvkbjk271ivQNPyLYCL/9uG8RJBlFHtIH4njne
         p/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757268; x=1770362068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIS7Tv8+p6x2LqhRC/mSoQut0LYtAOWTBCiN5CGoQbo=;
        b=mAR62BvrfbJxMfRFpxnIgTqNCtTs/BSOP7W9KlT0imHeFD46WQQyMjuM0jON6NEWFv
         eBzalp0kMX6GC3kmcFgCp4IN/lTJsfVuBvK2X/lB00ozDXlTQKVe5YLkgEL8QrB5H8oV
         gL3Dh2lVVBLKQkngBKXvwqc2RGocvAcAZlC4o3BsIIj8825kgmKFNPzFH9EgKFgZqwRx
         Vg8OpuX+sHAfPkZg8hxM7ZxLsq9CYVx3EbxAeTQGQ+9j4Ro8p+4QW+hgsFyAh7YVYeiO
         WlJahNGsfZ8WBo9cZXxXbzw/OGkUZZ9qpv1aLwtPlpXator4RzrRmDQvkj1Yd3hjgpmA
         msYw==
X-Forwarded-Encrypted: i=1; AJvYcCXj4E0/EjR9k0BqvMzTDhmX01dWMEMyi2JeNVTFnk9uf1LsqSi7Tv5+SY9lpn3Bui2V/8O47IXfAHgBBR0fhkt8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6mIhVSeN8V6D/EWDU5lfxT6/R8P+tnypVzUJTBkJB1U9Xgym0
	BTU5pbKNMmejb44ZFIzByO+BCyl4jySz6x58ppAIkZ2IS+68WW0+a82Un+keQuODYME=
X-Gm-Gg: AZuq6aLtbOnD+EuRCDrHaFRIm0MB3uozK6ww4d4pALoHQCC9vmJ6gkhLD2S3JSP/rr0
	gBVrYipwpUjR9DSv9aInwJFxcfWiKgMemvpMVP1az+PbJcNWtJMjHBDUXTkDg5xEQyNX+N5OQQ6
	RwAKVBTgir13I/p1kvAnvbubxJiXcPg+Ae3Qi+smFoEP0e/2LI0k2XHu0UUUExHRR4odH8sYgoA
	28/M+/H+ac9EF+PvYX4jRerw1IHv8rycGqVHYLbhtYgTwepsUDfQF1N6YXPD2iK6OCxCH0j6pWA
	J4S1OG5pwk5R4pp0W0rk8Vtr2PajLMvizPxhWVBccUO3UmKSvkmhEVDz+MHfclllqDmjFLq11+P
	57hPg1Qyc037zyrZc3BRSjHL0haqe+eNmE6dwUeAB3QtTtSoBDrpGXni1K91rBKuDo7jVXNbQct
	zT8j/gDgFQgCBNAJothw==
X-Received: by 2002:a05:600c:628d:b0:480:1c75:407c with SMTP id 5b1f17b1804b1-482db4577f3mr20579805e9.2.1769757268039;
        Thu, 29 Jan 2026 23:14:28 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e04a082dsm8021235e9.3.2026.01.29.23.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:14:27 -0800 (PST)
Message-ID: <2d37541e-175e-42ab-a05d-638545a7b7cc@tuxon.dev>
Date: Fri, 30 Jan 2026 09:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/31] clk: at91: sama7d65: switch system clocks to
 parent_hw and parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <96e09d47cbff0fb4593d642a1151791e20c15c48.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <96e09d47cbff0fb4593d642a1151791e20c15c48.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_231430_191634_96B107ED 
X-CRM114-Status: UNSURE (   9.17  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Ryan Wanner<Ryan.Wanner@microchip.com>
> 
> Switch the system clocks to use parent_hw and parent_data. Having this
> allows the driver to conform to the new clk-system API.
> 
> The parent registration is after the USBCK registration due to one of

Would you please make this a bit clear?

> the system clocks being dependent on USBCK.
> 
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

