Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B5CFCD0DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ET8szmYGRuPMnrSefH3mBHcCE+mfXmFnmhWK1shnUM=; b=YKcsQPliDG35cofy8+YOuy2fEn
	+4PjDu1Y2i8y5g/c3cxCgy2XLBIFcu3jUEKkNTlt0Mv7/pyiO2XH/IJeuNQWPmAxEEexfG57WxcCT
	pPDJoXd+0gP+ymN3N3B61g1JPC5ANazhQBscgjazHWOepg/zsKnww23fxihaxcoJJHf6ruCms6z6I
	E5AriVpuwyHBYMpbW2/Mb1IGjnJwi6OgsfTkYsWqTUucm7mHfud6odYwFwSfFwwaI/Q25JZYKzE9t
	kUZHHrp7Z1/erLjVvHEG4LhLlhB6fDEf4ZPo3jQ4W8tEJ312j5+3ovXpKCy4o7otfATh/epOBZ3rR
	4oNBkAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ml1-000000085rH-1DAF;
	Wed, 18 Mar 2026 09:00:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mky-000000085qL-1fMe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 09:00:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso56503585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773824398; x=1774429198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ET8szmYGRuPMnrSefH3mBHcCE+mfXmFnmhWK1shnUM=;
        b=ollbz2iY8WFuIlDWGdHtjzBg1bwXkgpgh5D9KnuWTUZ7JYSO7KqX03ehlbYWXDGYTY
         19sen0aVw5xFni4dfp2LRIGZD3oYliLkJx7JwKBVUsPo+b4lIwWxA5F28B9Zy2w1cSho
         fgrZheUhoRjcO99PxZ3fqumXrruKRjgWGgbPem+YaPeAPzfZUatC7EjlC2zyojpylmA0
         SwtJ6qed/ERg+phQBPLEC/9YnGc0uiTtkEHhdh+li/jcpLpFE+6LN8vFh+goHZQtebb8
         hRrFUNxR04I7sOX9Vrvox/8+HkdHbOWwLBkTen6wEcxykTRltTQSxBeW6xUYyk4mn3XT
         susw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824398; x=1774429198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ET8szmYGRuPMnrSefH3mBHcCE+mfXmFnmhWK1shnUM=;
        b=roZGcdNCykEjlI92+M95HUZZP7q2PV3Ufhe+ukvK0zwfYj33EBiR7zoG6lkrGHeCNB
         KlaYKb8RopSMwaSDKpzpiYv3llcaq3QBN4gRzh6BkZO7rH3gXQ5T+TPnxbSK3Jtmsr0+
         FFs0xxmLoOYR4o8X7N99kydKvoT72kqgBYEilMDGywtn9/94+q99sfYXNtQUK6/EGvfF
         O2x9NnOTBry9sN/8XwRYTwKegP8Zhet/Y5LaWkUgt+OvgdtQt2yIbJP2BhSAEknr03+f
         9uP6JVWS1j/ZWTdprN1XXSDd7fwNUyjBz70h4f7QbYKQJ9TZohuAPSiLskV8Hp6Hr8yI
         GxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM216rrNNuodXdX2YVJTnq+OPzXL03FSAiQK8ugO4m9BSEGDY30B7IYK1QvL9fL7gx9mjUoTcRMFgNB25trpDO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv+W82OI/7WLE33rFA6nVTXekiJd1QfI2TRO6xuCHsSK2GiYS6
	e/eTaRkAp9Xo5OElTcO+sDuYbEX0qPnpFFtBdxZUjA4JzsAB6s4lp5ij4BJ6uVYYp70=
X-Gm-Gg: ATEYQzwt8HLYrJB6Ss6T8yMPKNl7ZVm/FTSPoYvl1lB7YYRDNq8/1hy7D8Dv/xXDsSe
	54H9H/2a3yQctFymnm9AfDBcXpED3yKNCMdeVW0sH/UNf/ig5kHpRTbW39uPhayzoX1GmUGh74c
	EpplykN6rtGG7H7j8JsINPWd6c2rreclV5pWoWN4EnsGHJoQ4XMNym56dZ9ot8Oni/ghXmv+NpS
	/ZZS0bavkn+7pKhXWLW2Sry79fTwGd1xaWvrAyBkadGJqsetKT3NNatR1CKE2dzBqaAkBl61xdX
	La4/AtKMqzwn23O6GLUxLX7xnVpuvFNkvpkbb072u4Nct0H8r3bsT//HZxMnNOP5WO9wgacW5jt
	j1Syl7olrW6t3/XUdjfHqo0ZDxoNbP4+tS4XSVcQUHaES3RHvbPtjgNfK0a0o1hmmnofY5H+yxa
	qZ9BGDm2oTkQqE7XV+Q6qMEzsCZr52wVt/jYdd6hA2ell/05NoLmJje57KiXLU9nu+wzDnFhQ=
X-Received: by 2002:a05:600c:8b45:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-486f457970bmr35422975e9.23.1773824397791;
        Wed, 18 Mar 2026 01:59:57 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6208:0:9a83:6416:9bf0:46c8? ([2a02:2f04:6208:0:9a83:6416:9bf0:46c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b9892esm13741065e9.19.2026.03.18.01.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:59:57 -0700 (PDT)
Message-ID: <af957661-a108-4c6d-b6ee-f11971c7b938@tuxon.dev>
Date: Wed, 18 Mar 2026 10:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip
 platforms
To: Bartosz Golaszewski <brgl@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.marko@sartura.hr, Steen.Hegelund@microchip.com
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
 <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
 <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
 <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org>
 <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
 <20260227-wolverine-slogan-7af0661f6e44@spud>
 <c9df99ef-9bd6-43a0-9f22-721bd6bfc90c@kernel.org>
 <20260227111748.ddqdf4avpvfzu4cm@DEN-DL-M70577>
 <CAMRc=MdrrzoL3r-Br2pvR=TXxXVdS_ouf1ikNysd=GuhR1V84g@mail.gmail.com>
 <d9f9884e-b4f4-4f38-9732-66ff90408b4d@kernel.org>
 <CAMRc=MdsnPLJdZfkiHGh6F1X5AS5eL9TrmjzcrhO-d-=f=sX2Q@mail.gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMRc=MdsnPLJdZfkiHGh6F1X5AS5eL9TrmjzcrhO-d-=f=sX2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_020000_522966_07959987 
X-CRM114-Status: GOOD (  11.27  )
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



On 3/18/26 10:21, Bartosz Golaszewski wrote:
> On Wed, Mar 11, 2026 at 9:58 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 11/03/2026 09:32, Bartosz Golaszewski wrote:
>>>>>>
>>>>>> Here's the previous discussion when this was added not too long ago:
>>>>>> https://lore.kernel.org/all/20250811122053.4bfyoefln7wpz2a4@DEN-DL-M70577/
>>>>>>
>>>>>> Daniel is probably the one that "needs" to answer this, I think the
>>>>>> lan969x is added recently enough for this to not be particularly
>>>>>> disruptive.
>>>>>
>>>>> I don't get arguments there. The policy is one ARCH per vendor, so why
>>>>> exactly upstream would like to "having more granular control with
>>>>> separate"? That's downstream or vendor wishlist, not upstream.
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> The out-of-tree defconfig impact is minimal for us. As Conor mentioned, lan969x
>>>> was added fairly recently, so the number of affected users should be small.
>>>>
>>>> /Daniel
>>>
>>> So can this be picked up directly into ARM-SoC please?
>>
>> This should go rather via Microchip ARM64 tree.
>>
> 
> Hey Microchip maintainers, can you please pick it up for v7.1?

Applied to microchip-soc, thanks!

Will push it later today (infrastructure issue ATM).

Thank you,
Claudiu


