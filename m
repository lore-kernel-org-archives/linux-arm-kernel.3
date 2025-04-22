Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C28BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFEryJTJrYlbNEPG6EOeE5cZYQCM6sOwjcE6fp5zhZc=; b=1zQhhLN0xm0srGlZ1QU2HRnUHX
	/IR5BR6Gd+awxD+x4SbjXBaGL9+YPHqc/MG/lTNQiEA2RJShCZ/dLGwYR/TTCg0rOiPobuOPUDkYp
	0rDuZ2yZKw92rGI84rybp46DVvNMEEaCK/X8ShkCDOb91KrjIOwUY5+G7NpntiKuSCeI21oph3iba
	m3UuGxBhTxd1EUK2YQ+QQvLM3LIBazx/FMd2yVTnn+i49ENo3ZLUXRmWYijWaINM0eZbuJAorgyja
	dIPkYuYHQYbfxmC7a5Oq4YEoqfr3rUrkhw3O5ivxRQE3uQ+6bRDOMToAZPmCz6f+bxkSBvCbnb4Wh
	cyzRiHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MHj-00000008kHs-0Bhx;
	Tue, 22 Apr 2025 22:40:11 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MEh-00000008jrI-230q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:37:04 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-72c1425fbfcso2943590a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745361422; x=1745966222; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFEryJTJrYlbNEPG6EOeE5cZYQCM6sOwjcE6fp5zhZc=;
        b=bn7uK+56D/NnRKHWjt2x8QAix68G+hjSNWuXMXQ+eyo7+yUbvnkwoqrATtCp577Sm7
         0qTPVKUg4/74+Uu+RCL8wkC4B2rCZrN5hhDlsVzix/cMgQaMFyzDNFkcda4hXGRY1vCh
         uCozSQFxV54DzLHylHfbn0gs8i4U0uOqfR+K4xu9XAD2LUYQpHvoB2VR5THjmwhDrL1z
         IF6IaYZwFbOQOY4oaw4ZZnqUWa/kWl2erYihqQxB781rXwPecYNXNo67Po0lO1e7Sk4u
         GAqKzFe6dxYoqxj0ovXlO1drEo79SAEsNBxdCY4XN1xqRaNof4FU82Q8RIUGn4tDXZe+
         mOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361422; x=1745966222;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFEryJTJrYlbNEPG6EOeE5cZYQCM6sOwjcE6fp5zhZc=;
        b=ggaAG3txRd36C28vFzMQBnmKV2z0EG85xwsckYaf8MQ8ZQg0G4yE7ukbERKHbZtPHJ
         5Tuxbb7fgiNR6YjP0egs3ecamlJKL7M3bVI/zW+7+69ax1EQu0ORo/oBxV3xRK66Ombw
         R1HSZXmYy+W/WkSlu3BgvSc7ASAxuMhoSq4BCcJjfhVW4N5o2wAp8DEKTthhyGJdiqTv
         QqU1CpkgGUzfNeMTHx3HaCBq7pfBhg43HPJlr68EDVXCaVY/ouaUh68gWnENXE1DRoJr
         5mQfaIeL+nzJAgpkiZb/EvWMf3Z4Un3i5cFlBSxirG19SrWcfNuaPTOH28CxchYyUktG
         hV0g==
X-Forwarded-Encrypted: i=1; AJvYcCVMqJyUhfMJkOEqvTbK3x/5Ww6G1EbfKG+3yOoYm6ao2isSoob/Y3qI0CWLBhzBqeuvrv/5PucnKY/9qKGAQbO3@lists.infradead.org
X-Gm-Message-State: AOJu0YxheLYkV212TEUA4DFm1o5xQs1AsJmYQHgmtiM0B0NvE/Y7wOne
	eAqNOZFwOEEzt1LWV/t732BUjIld8eOJLTVOL/deDWiLIFRVdGldObmg2kEMPNI=
X-Gm-Gg: ASbGncsVQ6gyuRUP7TywzwKenrEkhSqZB2pN80r4ssrXuSQI4ZAwlG6xJYJg/8tEut3
	2tP05KtV9LW1h6q9q3QvJbBSJfsXBVxNogSUWSKocUtMV6qvt1Vt0ucKKvaQUK+G9HEUA26/DMr
	qMrwQKYME4kgWWY/FgtEv0F1aRj5KxHwjpjfBjHuJco1iWoBxQ/bVmC1hoVUN3YW7oe27vFeDcT
	dFZYjKmQry8hirfqpj3lyLi1lLIFKGEnJ95RNSd+M08KaM6Hy9W5gOtzhas1n2T9m09DlgikKFX
	U7Bs82PulVyGvQfldx/pphtz4bzK0J/UIIVhE5eoCy1Vs9I2Cub+/cKdG6MbQR0yETJy9kUONlE
	OBpQOLNiMPhMVCIStow==
X-Google-Smtp-Source: AGHT+IGgff0HbnynsiGyzAMNRyImRsk0W8jB40NIbqdBsgqXBc+HF8ytnQSIYbKf3QzD5ZMhIHryIQ==
X-Received: by 2002:a05:6830:601a:b0:72b:9d8d:5881 with SMTP id 46e09a7af769-73006336191mr12246352a34.28.1745361422741;
        Tue, 22 Apr 2025 15:37:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047afc11sm2208277a34.25.2025.04.22.15.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:37:02 -0700 (PDT)
Message-ID: <f0948adc-8130-4417-8c59-f0b52a7a0e01@baylibre.com>
Date: Tue, 22 Apr 2025 17:37:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
 <CAHp75VeuNhfJrNAZZwY2tEHte=UPHLOPNUz7y_J20xv2+_Zdeg@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VeuNhfJrNAZZwY2tEHte=UPHLOPNUz7y_J20xv2+_Zdeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_153703_529947_0C40A637 
X-CRM114-Status: UNSURE (   9.02  )
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

On 4/22/25 5:30 PM, Andy Shevchenko wrote:
> On Wed, Apr 23, 2025 at 1:08 AM David Lechner <dlechner@baylibre.com> wrote:
>>

...

>> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
> 
> Why not static_assert() ? Because of the message? But static_assert()
> supports messages AFAICS.
> 
>> +       "macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
> 

I just knew that was standard C. But I support BUILD_BUG_ON_MSG or static_assert
would work just as well here.

