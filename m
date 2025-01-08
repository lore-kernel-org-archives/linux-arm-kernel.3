Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20E5E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRu1D7dGFpm2VosF+UybZYQj2P1M1/nlzDOmVqBRd/k=; b=p7AAZHFAiWbS0tteLaFMNXjFRZ
	j0ugTbDxA0JqPRL1SbQaXWf8rQ67PH+vXUR2d6We70eP98T5XU9Z07BgKBdDmA2MeU5WGCDsDbPSU
	1Y8k/FwD61ixbX26ctHToDQ/BXeaCsfHBxOB9K5nmnM7AYOsfhKZrpErPtwWAS68UwS5w8SAhWXqj
	lxFHkMu1Ioka6lRsXz6IW+Z2kSHlM733zwSJV4Al5l8bg3uXiVc/ETGnITGedL/aDns26ruBQljsL
	d7OLbrP078HIRZWg3fCmGyoefXejkw0ti63CVh7bQBy7TZ5Q4OAD11QEvO3heF01puqspKiZKpT21
	TGVLvUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSZl-00000007pzY-33jY;
	Wed, 08 Jan 2025 09:42:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSVw-00000007p5Z-2GSz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:38:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-386329da1d9so7750783f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 01:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329091; x=1736933891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRu1D7dGFpm2VosF+UybZYQj2P1M1/nlzDOmVqBRd/k=;
        b=Api+1RfoxkvNCmViuANa//ozaLF0stE/X4FxIB6ulRkCYNyVeUcdnTkOoLifBMTf4T
         snO11bQc37Lz7Ca5SmjJg0wIpnOPx8gQZ7ucM7mrM5BxKfTPfExee6GdTDskDX+A6p9+
         2Xx8ZBbpoo3YKjjQqFRc5lVtYCyr53c+o2f2qLR82JU+iUDr+btS4nQWyuyupMELUwoy
         IW6qfwMmC/GjF2yByjtR9fflAMAa4RexaZUb4YJ0NOBByVGmph9izM4THkOgXJOM2Ouq
         22eKOkPT30lyUPPdAbKoV/Zfi1wgPpXV/H4Op9DISYydc23qMpPM0Mza8TxE7RA2DM+g
         rq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329091; x=1736933891;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRu1D7dGFpm2VosF+UybZYQj2P1M1/nlzDOmVqBRd/k=;
        b=R/1SdeaRFN7QcAvgoPCRDqQnrTWpq+MkiEF7LgYKSuNdU3TvpPFJIiga2VamFOO9br
         JhKnfgUrhLICuNkCFLl1aN56OVdD/75MD0zuvYEVwp/gTRvQhUWYR7BqMdCu0JRTedEJ
         TEYGDs40XT4U4dCgPf4qcVcwAEhxYymZrPAxCe+X16Zv4951dY7vdOdXV/L1RoiAwVPk
         w5Jc4nkfuej7AssNDQQ2+osmmA24ZNfBVKpLwcxFMdOBDdGc2Jjf6zwQelrMevtxu9yt
         OudS8qVLfseBNjdEze+IftyDZFO5MRzKTCMV6qHZhKWd+h5K6Wfd1FC06OXyRs4sYklD
         dS6g==
X-Forwarded-Encrypted: i=1; AJvYcCVkHxgRbt+2+o54Wh5TNHhjeVeayiCJPzqIRzNIDsDS3KcWPfeZ7NevBCHTtmDkdDkwS0STD3ULJWX0QwkvFIBE@lists.infradead.org
X-Gm-Message-State: AOJu0YzlYGYEfEA+oJwxmb46YybAn96j+wCtjRS8jh49ZpkgAE5I5O0c
	ebyA2kqldMhkWAcIKmZ6qB/jFRle8qDKztkb6Ww1HeFam3cvlAndoCEHesPBT6M=
X-Gm-Gg: ASbGncvm3a3bkLmkDoS2WgmRaRRTRH89rcr938ae3EeBlPHQV+Rb57xizrxufbE4st5
	NLWhE2nwVLVcW9eDPvsgKORz76t9+iubF+fpJVunokJPOQtUhQUG6QWdm6ecjtrE9VLLjmi4AT4
	MLA3iX8bVlsr8CMIWsOss0LmYKR+Fk2hOEHbvBbTQzObxy/UhxS/PaucOBQFm+APbOWYy4fjxtV
	rt0AuNheRKclVeUaNn6mrwE/oadOP9cgvDhgTNkU0e3PyrAdhILTkgnC3knheFI
X-Google-Smtp-Source: AGHT+IEgum97jZJPYPy0T8bJnOriFmAqzwKIgHxRt19SfRXXojRd9i53LcCXOyDAxP3gnyZZAo45SQ==
X-Received: by 2002:adf:b1dc:0:b0:38a:88bc:ace1 with SMTP id ffacd0b85a97d-38a88bcadc9mr703276f8f.34.1736329090756;
        Wed, 08 Jan 2025 01:38:10 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd1682e4sm23612385e9.1.2025.01.08.01.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:38:10 -0800 (PST)
Message-ID: <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
Date: Wed, 8 Jan 2025 09:38:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
 <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
 <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
 <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org>
Content-Language: en-US
In-Reply-To: <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_013812_584630_4BEE09B2 
X-CRM114-Status: GOOD (  13.60  )
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

Hi, Jassi,

On 1/3/25 9:57 AM, Tudor Ambarus wrote:
>>> Then I updated the mailbox core to allow clients to request channels by
>>> passing some args containing channel identifiers to the controllers,
>>> that the controllers xlate() using their own method.
>>>
>> This is unnecessary.
>> If you don't pass the doorbell number from DT, each channel populated
>> by the driver is just a s/w construct or a 'virtual' channel. Make use
>> of 'void *data'  in send_data() to specify the doorbell.
>>
> I think this introduces concurrency problems if the channel identifiers
> passed by 'void *data' don't match the virtual channel used for sending
> the messages. Do we want to allow this?
> 
> Also, if we use 'void *data' to pass channel identifiers, the channel
> checks will have to be made at send_data() time. Thus if passing wrong
> channel type for example, the mailbox client will eventually get a
> -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
> misleading.

Shall I still use 'void *data' to pass channel identifiers through
send_data()? I'd like to respin everything.

Thanks!
ta

