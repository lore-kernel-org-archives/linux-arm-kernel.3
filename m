Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A30EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdNOR8NXUxquHEOai7Jddyqm3K6j5St2h4nt9NmtQPk=; b=01eBpFTWe6Stxhwf3mOV1Ph3ng
	LiAMgzyZ2M6xU61lYlDf+e+eFHLOuomONnqo7EYO2gTY6HzK4NNWLQ0azka6Ykjhv0uStnE+lPjAn
	bqgp3XhA0mJ/65Yrvpl+o6jLeebL2KC1foy9JAkRWBUp5g+esydVNzI+ycFTqNAm4x+T4uw/B+IGt
	HxYpB9QWozMPK9IHSBNHT91JhWhMtY4qqpmIbaRw7PicPlVbPHIrZHfxa/p5NLlwZg/nAK3EE2Mfo
	kch17rBfhF6idW0mrzz4Pv7kWQo4etI0DoE1olyReBgEXXEGyIE5cInJrVJ6dRHtaPTjUUNBr+HOG
	cjtgnRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugI9s-0000000DqtU-1oIz;
	Mon, 28 Jul 2025 07:20:28 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHQb-0000000Dlq0-47Hg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:33:43 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55516abe02cso5108642e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753684420; x=1754289220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdNOR8NXUxquHEOai7Jddyqm3K6j5St2h4nt9NmtQPk=;
        b=JEXGxGJHI9goOA70bMiM+4AXpQjhtw8Q2RqhZUoepMp0HynBluCnCJz8JKujkwSVMt
         kpL+QzTzq6DezWElQszEx0U1XY1roOuH3ciWUSt2nxdSuaIazdhDVgrqOG0cZPEnN/Hi
         zO8u4X4a2Mui5ubfN4P54FaoJyBFzFrFNLEdBcYNr4JMpV3xXezGqxF6lYaiT+JufbrW
         WmE+m+yQAz3X834O7sLD23Hr4OyyR99AbLScNvvHSALSJxfPhRClAQsTfY3YdORbK721
         zog/yvMw0mm8bkxCEjenw+vqZaN4l4Ce9eyLmZUZThBswkRa27GkRWNYLoQ1a4v29+Rq
         M2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753684420; x=1754289220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdNOR8NXUxquHEOai7Jddyqm3K6j5St2h4nt9NmtQPk=;
        b=IgZZQc9mTtbCKBmsKYycejdeBud+Kh0wO8e6/R6HUIWYG0GVCh4ULQ1MTag+M4t4wF
         b+li4OR/0qi+XlVNrwKPvsuE1dJRjRfydlKZaARHGDpGi3B7CdUVF1TduXY2DUYoBoux
         4SFuVr41rbJQzQYfVr6CCBQ5vbVHIAawPBcKNJyINg+mPTbWUOdiqsfhxRR/Ivbr6f9H
         I5vMKQA5itxy58QXXNwR9jG72uaAA+E9tsQSbU0LCqwM5C8YqRBmHr5/6CNXWgiTJ4+n
         6Uoc2rRt8pzhQDoflkuBp1826EFVWo+S4cXL+z0C9aJjv542/O97A4swNvyuNK4ar06K
         OTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg1M9aUFpQqQ8BTR6P24feepYaAhkZhNEPgRtnP0UOgDeafL1jlGtp3Wb6OcbyqkWfCnwhLhl08edN76lmTIkx@lists.infradead.org
X-Gm-Message-State: AOJu0YygNMT2k0XpmHkdmKf6iumTwmrLPNL+uNIo5VOm0dUflzPJJQKV
	Fw9jxOmoksiqpHchBgn5LQKZB5fOJKNR2X3oIO3Y2gkaANj83k/qalo3
X-Gm-Gg: ASbGncu10OJWBA+lGIo0FTunJM2WvURAcDFqE18H1pe/NTKRgC4gIIgP2Ec9U3Qnltp
	XCR8r/WYWlZ6EgEatSRlZKVsXIBKGBqVTLJrcdg20DBeUZOL5BqsPq5mLMPm0dNPMW10+NE7xu3
	vor1UnwPjD87bLahY9VNWOX9z60+VkdEL1bLPri0BMlwa5uRBcBcFKqrsuP/bocMH9qMr5TYgpH
	bF8gR4SIa99F/jfTcHBgLwoNVFOwDiHNCcv1ttlwBsPmo1u9Vto/whrU75qVvwqGHIO4gQGqI1v
	6Thz0eIT7CPsxb+aWHpJ0NSvqxGPj8iH9FmTAnHcgKTCd0bFqtqJRQCQ4t0SLholL2v0CVIR/9E
	CXWkBpyXVEHbqpi81uTorWpX1WhC9ebfwS18Sr2t4w+lS
X-Google-Smtp-Source: AGHT+IFFMGvFbpsHTpgyMTjNhjVZn0guX9tOqWVxwLzxKoFlR6LjQnKCPbPvhLmPFm3kqHCiJmT+Aw==
X-Received: by 2002:a05:6512:4028:b0:558:f939:4435 with SMTP id 2adb3069b0e04-55b558b8ed8mr4360723e87.13.1753684419849;
        Sun, 27 Jul 2025 23:33:39 -0700 (PDT)
Received: from [172.16.183.77] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b631a7e13sm1127133e87.76.2025.07.27.23.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 23:33:39 -0700 (PDT)
Message-ID: <272b1700-7ebd-4693-829f-8d842e6eece7@gmail.com>
Date: Mon, 28 Jul 2025 09:33:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: iio: Drop unused header includes in
 examples
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stankus <lucas.p.stankus@gmail.com>,
 Puranjay Mohan <puranjay@kernel.org>, Dan Robertson <dan@dlrobertson.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Ceclan Dumitru <dumitru.ceclan@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mike Looijmans <mike.looijmans@topic.nl>, David Heidelberg <david@ixit.cz>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Andreas Klinger <ak@it-klinger.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_233342_024280_AB4D8ED5 
X-CRM114-Status: UNSURE (   6.94  )
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

On 24/07/2025 14:13, Krzysztof Kozlowski wrote:
> Drop includes of headers which example code does not use.  No functional
> impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

FWIW:
Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>


