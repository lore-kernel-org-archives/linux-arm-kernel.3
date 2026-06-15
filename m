Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E693CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JDnhwZw9AeUrdtRem41MPZtkkjfAz3vR+qZxfZaCk8=; b=38fBp9oXg5QhAiql6DNojkQw9Y
	ia07eaiWDjdwTG6Evq5HBCG6VYDrE7SSN+AKFXf1yc/F0pRcQGzCjI/ehmIagw5FdgfoihAxqf0yk
	XEuPiu/zyyi2IJigrrceK0zEGcSu2SOyfh3QJkWpvYjteYCmjYVEhDItLT8+7z+pE5uWUeXoeFDca
	5d/S+ATCRfmmbEPqh1NYzlhEOCA6cFsU82vrRfYvmrWcGXctADdMyTmn0p5D8Z+dtLEIWwCJRM05a
	0sok4KG7rXbxWYpOumGufedgOqYI+tpPN+RnOIrzlxGwkcfTryBqsxcskwDjTCM+1rFJsCef9ALJf
	giOwXl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4ZE-0000000E3I8-17to;
	Mon, 15 Jun 2026 10:29:20 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4ZA-0000000E3HX-2ecy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 10:29:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso592350866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781519354; x=1782124154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5JDnhwZw9AeUrdtRem41MPZtkkjfAz3vR+qZxfZaCk8=;
        b=ZrSJhmDeuYLev1HoR5kywRY7HJibCXuURWZ6PUTG1QscBa9KNBrG3EyeZ9W7cz247/
         +LtWHW9f4SHp8IOtoIDxGBRIpox90XiUZJG+wv3kLdXMQbiW5sjGzNSJlSVZbx5U50Ec
         hlHrv5CRNnmOkJopyAVy2wB8lRfQU/zwyjED6kMzV1ms9FqSjM0CTo1vZ+hJsSAacdJp
         tXYIR8r56Z2UcjY7KhTTLi4FatQPV5/jgPUQewUR+yYNW5kKHJBXL0+KEM2fZkago/Bm
         MTCGwVhHfUs0d3ihiGSNEDYcE/Vwklo3K4lSJsIFWKezNpECfG/iSyub6Yvm3gck1n5b
         rTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781519354; x=1782124154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JDnhwZw9AeUrdtRem41MPZtkkjfAz3vR+qZxfZaCk8=;
        b=c2j+kqJpFGyneOu+kjk1X+FKoHszZf/fII8xhfRNDl6+EJWtuVlpIPDV7kW4BtztBB
         SyE85RQEnCM0HzuIKTdqJR7PvOmBcpmm5ris1SH+/FqeN021Ubw0yR+uagl49IdBTFdK
         s1TjjJL9Q04nE9+VesAPaHihf5dZVY3DPuzhxwdnqm6BrilmbCBiROZ4MvU45+EiKtAI
         2tFxkXNOx2Ht16yJmiwgLVsQgcEINKqXkOFORz/QOuqWLqF0RWDgnRBU5PL8yEcwPppY
         x+y5bj4+XMLnOGvCSwI8ddHGF5uLQNu514Zm8fPAPQZJpzsnaSbljzUTrtZL5uWfKA7L
         r6wA==
X-Forwarded-Encrypted: i=1; AFNElJ9V3MnOTWWzpYmbAU9Zv5ocPWt9OwQFpqYNn1w5ifpWWLqlnUGDD1RKyoA4HueZvs6YjgLCIg9irHLfO9Kgr2I8@lists.infradead.org
X-Gm-Message-State: AOJu0YyqyREz8+UdGjg+ORE+JrZc2I4vsavqGIdpeTDrvsXmViEV7wOJ
	GfAs0+DjGr/YY8bvdYdielMnbQ1KEYh5RWl+aSEDtN8mAujLSNDm0ylE
X-Gm-Gg: Acq92OERvonzr+lxbX98Z/U/dKowvCoa7YFviG3cBHCIiK2qI1AvvFrQeAappMQssMY
	i1vgybzTRQpyfDKs2SCUNS3JpHupHM7IlZoXNZRnWqV9YpRYCB96EoCWW7KN09RZWXm8nVSZUVa
	ShsYBzv3fT1BXStuXz0jQQKiY1+UrG5aL84tfY2TR9LFA1vjBN3PPFmMi14xGy4b1dHjScdJdPh
	r42JFdxsOA664Q/7GM6a3hHNTZUe6TWdtDBruo2HdQtMJhz5aYqbWFPW/tefL/787QqbqL8nTfY
	3DRZWUiaiGy/hq1ykATqjnrD9fPSm9JPJQYiZLD3/TsTm8zIhk1QYe6/yPbyXxcqu6qQEYxaTSc
	QOmMO5hd+zw5dqyiXxP/AwFFh/JclsUAtYhacNdSW/KmXaDizzjPFBJDM96HqyYLs0UwsQhY61c
	sr+tHcl16tpKlxFdw+gDh9vA6aOCYTsSFj1CDBWlVdM1HdV11LwZKfHgqhIT+3RhWnHVEJAYchh
	LZORamIzSutfJoUqDnbFkGp12M+a7Cnhg==
X-Received: by 2002:a17:907:c30c:b0:bed:e2e8:d8af with SMTP id a640c23a62f3a-bfe27b2075cmr568641466b.5.1781519353824;
        Mon, 15 Jun 2026 03:29:13 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:8e61:1648:83a3:9167? ([2001:8a0:e962:d100:8e61:1648:83a3:9167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d934sm443625866b.40.2026.06.15.03.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:29:13 -0700 (PDT)
Message-ID: <6babbdea-fa93-4cd7-8198-5cd3accc34cc@gmail.com>
Date: Mon, 15 Jun 2026 11:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
 <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com> <ai-dNlC1_nbQTy5Z@monoceros>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <ai-dNlC1_nbQTy5Z@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_032916_669056_F55EFE56 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi Uwe,

On 6/15/26 07:37, Uwe Kleine-König wrote:
> IMHO selecting REGMAP_MMIO explicitly here is fine because at least to
> me it's not obvious that MFD_SYSCON enforces REGMAP_MMIO.

I think it's better to use comments to document non-obvious behavior,
rather than dead code.
E.g.:
'select MFD_SYSCON # selects REGMAP_MMIO'

But I guess this is not really worth bikeshedding over.

- Julian Braha

