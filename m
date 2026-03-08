Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA785EA8531
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSh7bLkjMFDN2+k0Og4RkpgntElpEZk2W1y0Ds3/R6M=; b=l09cIpmCKW7RPJlGX+VVhy+xcb
	+cH95CEnB8slW/mcFfhBJWigJxpSMn6nD2ceicsfUDa+QfgTluIDaghgwhFsoeh79v1QaBZnOPKrd
	tdMSaGPJmuN3svontlRj8xBhbdCtERNM5dw4jG2GHcAHRgyjNeSdnw0v3R8/vrjKcVoXvRVxe4u96
	GUy9VKKliSC7kAcC+tvGQFns4PdJu6UOidodSdPVe4OE3Nu8npYZ3LJIXOnMkZLE3RqxGH5MvdBxt
	eJ4mGUSBmIeyi0Bu5DdupoNopNOWOsprEbj94QJo7+ghbJ9+ZgYUUw9ZXJx/nRf9tgUu5TxO7ISK4
	GwyQ/zMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzGg7-000000069gj-0UyM;
	Sun, 08 Mar 2026 16:08:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzGg5-000000069gN-1387
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 16:08:26 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439b78b638eso7894209f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772986103; x=1773590903; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSh7bLkjMFDN2+k0Og4RkpgntElpEZk2W1y0Ds3/R6M=;
        b=blDyS4TPHxkAoHaCYXgpfQ5MrC6Y4itGp71WBtV3mvFMhZwkU5ae/34XcdrFXuOL8h
         Kxore/Ubnl5cBBArJVpfB1N1DGLQiN9G2eFgkfsvWxaEKb2EO6JFH+BAJw3S9jiyPGHl
         3J9FCyHYVUZQZvEdud19QWdOj1HYE5m52zZSNN5LQa3pLh5BtT114ypsrUT+6VZPMWKz
         zkoxHM9Jlfwugb/PZoI5hCUAR0poTjaFqsajEsCnEinzDfqNRjTDvP8jmiSG9as9mLrz
         6OiU9L6nBfAE39P8JUJckQTbmm5UZGXliNs8QnE+SPi/LMB1FvNcG9BamIrjBCBaVgGE
         ipTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772986103; x=1773590903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSh7bLkjMFDN2+k0Og4RkpgntElpEZk2W1y0Ds3/R6M=;
        b=YQvXTwlRYOUoS6AfgT+6/qw51bwN2hSCdWtH9zOUvki1knZXYvKuXMF/A5dpetoda0
         /RK5RD9vrqLy15iKmz/tQa+KYWeP5Vvt388YE7kmQzNV4G44jaz/gkDzJmLKN1KJxhbu
         GeaGVoA9kaElW8fhJsiHQfgaQo2tzGZim/Ks/9Yt5bSsNiJVTswEpBEsgR9D6dz1rLPH
         8Xca4BgVKkbtxNiYcQv7goe5mumak8U3GqU7JpSWyXM7s/gyd9KIpjU4EJtSWAdQRchV
         zewSu3twsffwOGSS1LUipDpTQiPwEMR7tO3XKKqfl0i0Qm8XWOG8B27+9wKEGzwa2jLe
         k9AA==
X-Forwarded-Encrypted: i=1; AJvYcCXltaCc+lllltLe6RQheSZuEKo/iwBG+Co/1mqUKDN4Nz+CNdNUkbXtM+whE6s0Jqn8xSg1D6qhMTtKM0tgEkSK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm8ZGA+MHoznb0oQo/kYtzp+oHZKTYAqNJd0ts7GO9b6pDeR49
	ut06JpopJjPSKDMBt/B75CTE2eUsCw4ZFWfaApp40OoM2uycIaVtCrHQZqBJ3uAGTl8=
X-Gm-Gg: ATEYQzz8Q3ZEWxJX9MZC9gNp+IvdLC1pGWP20EYMG8O5Zaz+DM60URMDtmu7j96pg/z
	vW332nuQMPL9xzOyaV0EsWwHL16oDh+c4bcTnRn1tzFrG1BOYLIX1MhBISql5uYYRvXeiQ7utvP
	wNqRd+ybJ26PqFwKB/QVYzB26LLZFUadRykIRfwbyx/UTwWvASTs9bv8YbUMrzePzaHLTGFvQdW
	P/FJQd4PvvQI16sQcUnv+0zr2JKzenp84Oi9Mld44tR06b/HujtU4niykJ/GrxILjTPFFXpl6V0
	K+SAbR4MJOA3kOanItzwhivkE+v9N+beIkgsdIWJgcbzdXlOpZI89u6wXFPE6MsA+szWWsYEtc3
	mXwE/A0pw41JyHWCVPjAMH23iclao5icYUvhqkWBDBXDdjOwPC9Hr6Oi+Ac3HGO3/I/i6aT9/Sz
	/wNNz8Lr+L6PdHxIQXELghb0HWpeCNiA==
X-Received: by 2002:a05:6000:2c03:b0:439:cb79:ab05 with SMTP id ffacd0b85a97d-439da88bb1emr14215350f8f.36.1772986102899;
        Sun, 08 Mar 2026 09:08:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm20725300f8f.21.2026.03.08.09.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:08:22 -0700 (PDT)
Message-ID: <9e9bb433-3409-4e9c-b499-6f15eb1a4eb1@tuxon.dev>
Date: Sun, 8 Mar 2026 18:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
To: Akhila YS <akhilayalmati@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_090825_303995_313D7C84 
X-CRM114-Status: UNSURE (   6.25  )
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



On 2/27/26 17:14, Akhila YS wrote:
> Akhila YS (5):
>        dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
>        dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
>        dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
>        dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
>        dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema

Applied to at91-soc, thanks!

