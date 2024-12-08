Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E71E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qhusLfuIgsMbQqxPaQUwX3ow4Gf24/DeZxPYGalAiY=; b=NWzg/Oro5wUalmWPfCYGDHVRie
	DM7ZYianKUNkdkDIf8wJZd/G6qa1Bo/h8kHEngX4ffiMfMrn3G/3+026Vdi16U0gGcTpTzV3Y2JOV
	JxaK6iJ0MZZAE8P9Kh8Rk0giC/hppwYwsDJtxwpB2cQKdzJJv/IgkSjjJMp4BJJTLDRv8hLI6zOhn
	Pi8NwHROpQc+eV2t3B49DxH2ov1IOGa/ezCFJSjCQfCN/xk6jaaR/+ObQx2AC2LVVcapEB3ihV1eN
	pttExNXGi45K3vdsLDKFTdQwufqeZohyjq6Q2qc/9WrB+44sKSeraZkQAj/Uw7Zdn/7cOBe9PTq3G
	P6/KBUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKCa-00000005Yhr-0PrD;
	Sun, 08 Dec 2024 16:32:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKAw-00000005YVV-1B5y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:30:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso686298366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675429; x=1734280229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qhusLfuIgsMbQqxPaQUwX3ow4Gf24/DeZxPYGalAiY=;
        b=MsvQfUrEFiMEV/w/cBnVIY3KmD4ZbrwfandmeF4Z/vqUsb4wFDiGeyKGeyZHt+LYBn
         ZaDqT3A1nFHIu8cSkN5JEPyDWkLH+TzLF6Awn2gokMOlysamNNIswStrTD9K9PsMdorS
         UkEEBnlVt453I5nwTFZVDYmMwkgPytkibC8r47CA5g//b6cTqzaqzwtyqeg6rorXY1h4
         S0PBSN+mMBZxusKdj5JE2C/USE6oYnBQQPY13V4w//yPxobWqv4Mec47ROCZJIGLM98v
         IXQi8eFxGYDYoShSB6Zh4BkrU8ZZ22WK2i6hnBf5p8y4WCE6DRBA7z7RWWmdAwjob6rF
         R7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675429; x=1734280229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qhusLfuIgsMbQqxPaQUwX3ow4Gf24/DeZxPYGalAiY=;
        b=BslQYOsnj36nn5f64U+CzjluUjLCEaNgkhRNnE65vWVFIf3ZOAwNqRa9j97ToPNgDL
         8ZV/KKIj4l3+DWewg/bgE9G79gRaL3XUCDriKuvJMLNVE2JuAKAq3zHZAFSXu3qAFj9a
         o2cCbbF/5eCRDOzcw2gTR4mJA5iddMm/fsRWFlSAAO6LPHIP33ClwbR8wOvTMT0IXdod
         x4DgQvcFlWu13pYC+0lZql/HDS83yguKVS1vL12906H0Tq4Y3QAp0OnRMxl6OXxKq9pG
         IdKWq9yz/iaWxU3VfXBKvlLvCkI8OnNfnls+BXIp98FA45YI/AlelrG8prqE68je6Hh1
         T4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUg+0ydsWV1A064fSToR2UyQcRZo9X5SK4oq0PQrv1f8R+vGnfKjgm2Yt8nHmXr6gmedRABpSVh70Jo619vOr0/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/UnxpKAPBtNB16YziYQg6Rsu79EGzfdu65OSBmlw0AFWSXucm
	Bm9WwWXmYYGCNvfc1aminQcQh8E+cSYPhIdGKbHXO3siCpsQgX6LNW9+bdA4OHg=
X-Gm-Gg: ASbGncsRZ2UfehbI8z0JN7Nsi6MujK5z6Omo41jslYt50K0UrcMT2lq1Na35XPiEnNN
	ojPvSbbm5ZChKt3aT9/4xRdkldTYHHDnqZ60Xx4bh2F98KhQ8ggMJE5DEKMWbPb6Ijd0GuWwu/z
	mnvHOnRFAYykvl6rRvxnLRsg+po1cYPoVCnOtjlLib3oIWEDBmN9OuL0lFxoMObSsWFOm8TmweI
	bnxwF2GvmUEH7ue2FKIsCSLfqm0vpLJsDpFci4eDqyX3LIBv07WtQJtoX4=
X-Google-Smtp-Source: AGHT+IE7YDoN13k+KH8JOtiRLrAMtuSmlPV0i3qWniWezo/cHtHK2Sxr/2xiHf8TyJV2wCkaLPDXWg==
X-Received: by 2002:a17:907:8315:b0:aa6:7148:91f8 with SMTP id a640c23a62f3a-aa67148942dmr286404966b.4.1733675427547;
        Sun, 08 Dec 2024 08:30:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68a97498dsm5949966b.99.2024.12.08.08.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:30:27 -0800 (PST)
Message-ID: <022a34e4-2a9e-4cb8-8998-d5decc4d9fdb@tuxon.dev>
Date: Sun, 8 Dec 2024 18:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] ARM: dts: at91: Add sama7d65 pinmux
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <a8f880b89cd4470526a2955a0b6aaaaa24ba65b8.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <a8f880b89cd4470526a2955a0b6aaaaa24ba65b8.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_083030_324947_25B3962E 
X-CRM114-Status: UNSURE (   5.60  )
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



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add sama7d65 pin descriptions.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

