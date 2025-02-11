Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1BEC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=; b=g0R7YYXrrvrnh8bK0U+syTxosA
	RiCVFyGQ7j5yNPz11tUkNi3bXAT+2OFjRX+IjXxqMmKsfayY+XDZgR0mtdsIG3WNfpCvpMQkKW0u8
	d4Zf1jX0oW/OtiFesMqvAkOrfcdQrrLXg2gSO1fQEEyHzc6AWAKxCUM86d99givmBjehU5VhHnb+3
	yPHw/I8cnAeJXKJ7vRL1yyHhhWNQqHjD9VJXdvIys4ge72UGoDC0VwX+NzhFrsSQaSGsH7ZE74yeU
	+NuivskgG74PJZBb5GAIF4Pb0yd9cwIVaL9NX7b1mCEcmJu0s8QT+E2lVSpI4c2wot6NG4MtOCiTW
	1nuRENQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlpr-000000031rl-3uY2;
	Tue, 11 Feb 2025 08:41:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thloR-000000031Z8-2fFW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:40:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7c81b8681so265382366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263209; x=1739868009; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
        b=hdwB9NrLtxeO7qlFxQZvnFnIhPOb1cErfQJSoYlTVEHBywpBcG+NBQYAbrVdIjSlsL
         HaV84uhzc/fKgyid0E4F/RoskD/eDiEnBdqpwOLMG6KCHqBGBEdhlQKj+QoLxklMrD1K
         EDlW6T8Y5RD7gQmUL0JMLu5/MHs8RhfmpAiiXOphWC/RFwraPDcRIfoItibWEr6v4FN2
         FV4O8UHDZrsGN3b+rnA5Qlt9DMnfuQ2+aQEjYROb7HCRueiLi9VomzvcIv7I+cC8MQYa
         of3Lth54N+r4cZV0xb3wAN3DxK4DYXoIScCwJ9A8/MKsT3/e7MyLhmf1DMLajBNeNDhj
         JHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263209; x=1739868009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
        b=WFOUvQmWKQpaqpufDkCM99gGL+ZqE10OO8ssEUoQVkSM/K+HgZCCO60kIMlTJlg1pE
         3DHB9kA/P6379onCPoZNsPnYmpGVo3KbGG4KYyRSA8VVSFjhMBhfopYlOjF/5Q21gjfK
         348epLSdxO9oQOWLwiarFZBcIIeUx+XMj6xmKLr8LPslj+XSTQTfqJEpivf5VPjqTCJe
         cEBs2k4EtBKxHpEYBfRtpkQtCcXcP68fmb3TcmPYXFez5lNWPU2W2EGileNOldfpzZyh
         MSLOfxLLw4ZRVpS3OCZ6jHhVgUQ5+cXIkJSLDwyxGv+qRi4GDkJJ7UeHNg9En54V0D6R
         N6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdBcXlGtkJMhxjdWSU+xbsg2KkCWxWdJ4Eno2nwxFk9m0dn488DjyEJU2n2ahY/RaI3K8RUIKu4iyKwekOEVYb@lists.infradead.org
X-Gm-Message-State: AOJu0YxWC3XFJejeqbIBPHWc654P3Zgdbscs3QwVRy2qiw3dbgjZwMf8
	tMBVT3b5j18d00BsCGvybnEse8oIeO2yFiPMIO0viHkvWnDrt00F7iVLgZunrWA=
X-Gm-Gg: ASbGnctV24EsuOP8mf1zh0UHonPYvGYjFtN/AknERHrid0zErVyi74ESApVJJvo9lwz
	jIR+ufiaxSTFvLUPKTByb0iSsiKTEWKqjXAcv9UtZINsQOtZr5OhvjRPskTpZMhxU+EDqcQmL/1
	BJ1vIZVqqwOvlkcdzrHJQdURzHoFWobqaLU37Nh8qfi+4KpwUOxgTWM7nJvzTcLgNOvJBTP69CP
	Tz1qe9/Z00yTiQE+8hUUxGzSDop28LIxPVa21J97t2QzTzO11aDrgjkWKe9/RlOozxTX9iYkL0T
	NhaUgtzdGCQOomWf1cL0R2lw
X-Google-Smtp-Source: AGHT+IGcNPi3rZA/CTA/KZxJg/KYFxP9+ErymmejAcw4HslSUTPYtftnIqEPAddfpjtGO6oKFni/vQ==
X-Received: by 2002:a17:907:c308:b0:ab7:c6f4:9527 with SMTP id a640c23a62f3a-ab7da33acedmr246065566b.3.1739263209240;
        Tue, 11 Feb 2025 00:40:09 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4aba036sm470650266b.45.2025.02.11.00.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:40:08 -0800 (PST)
Message-ID: <b29042fd-919f-4e57-9ca3-58ead8a8011b@linaro.org>
Date: Tue, 11 Feb 2025 08:40:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
 <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
 <503b7ec9-e0b1-4351-aa34-3089b2055eb9@linaro.org>
 <60c7ed79-c344-4f6a-aefc-d6d45a4d9004@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <60c7ed79-c344-4f6a-aefc-d6d45a4d9004@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_004011_699495_0EF2BE47 
X-CRM114-Status: UNSURE (   9.50  )
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



On 2/10/25 9:23 AM, Krzysztof Kozlowski wrote:
>> I'll replace the open-coded mutex handling with cleanup.h guard(mutex)
>> and scoped_guard(mutex, ...), thanks.
> FYI, Markus is PLONKed so I won't ever see what he writes.

Thanks for the heads up. I don't mind using the scope-based cleanup
mutex helpers, it results is smaller code. And since I already have to
send a v8 because of the kdoc warn, I'll include these as well. I let
0day bot run on my v8, I haven't seen any complains, will publish it
shortly.

Cheers,
ta

