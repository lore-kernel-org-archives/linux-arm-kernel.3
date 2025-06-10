Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDCBC71133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=; b=ZhQsz7QwBmu5EcNDxXglLgml3u
	NNTTpqwMW/Gsi1gNhk5U9SYLeDKqhngdV52noZOpYBk7w0Hu1LiWA9Xwi3H2kv/f+PRjTrBPUVE75
	9f6/aM5GAYLjUfJ3b9Qg8DjMXWkLJwrWOEM47R1o+sCtOfvRRpBqdFEnvRUvujVMnIJ+vwSuK+sQB
	vDunuOKkEj64eVJ/sYfoyAwezZMrbcqj8PA1HlqhIN+x1d+RPvi/dexs3v6N3JrQoSRTgHBxGZSq5
	l3q33Z6d0sVjAKkVMltrp6GfWiPZEby5sivQfp7SF2rxhiJYpyfeSPBRranLyUJ4HOraC4TKKKOb1
	VBXcKlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l5-00000008EXE-2Tg1;
	Tue, 10 Jun 2025 22:47:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Vl-00000007QFk-0DLw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:07:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-adb4e36904bso1106543366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571659; x=1750176459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
        b=lqaKiHmI0Lqu21XbrwHTFS7Mv12psAAqejq97wTM5TacEQUHkObFRuvcbRzO3S7Aw3
         Gzy77MOu8F2I+6UkjUqIwY4/9Q34u0yxc+bAKJDqs4mOBu/MdIuqiR9X/n97295+87Vq
         Qo0yyXg/BVmp+ZoXYunW0T4sVcvhneosGSqZoyhAdgJKg143Q31B+aqto/cHMtHX8V13
         zrFS05EVIy+GVrkIX3RgVbT/fGWY32Li8sk46jVirltdvtNoprtMYD2rTg8d2vwL/ygV
         hJW8Vnxvkvx/RZ6xpDhHKV/oL6kj2n6gSSFugb0zxU67J03ENWGM24J9Y1tFIYymyp/M
         Rmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571659; x=1750176459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
        b=ojEoyXfcwgxvprw0lNdBS1pB+SGY1WcFaxeusSNWdofW6U2BWdJPbFzIopa13HqKJ3
         HpRwaoAdlKiYvxGSWf6C/OdcGx8704/70Wc/FiGfywgBlg+UAYCPF3Un53cBZ1uuVA1G
         cSJT4diP4/UoCbXS4sL8xn9wpJqs4/lpbUnlkwHShuv0jzryEip4Us8jBhJV8Y/scV00
         /Z0Xngc5JXOqcXuNckD0Wi6CzxUhh7il7iUd4Zv85558BeNEPz3BwNcsvrbQcEtMRL4G
         sOp0nMuGrx+qxAi8VXXhAwNGtmNhr6WVEs0HJPUTB5DjJ5cRk6/WsvOyIhR2iL4+NWnD
         K/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUu2YlgU6AoeJBfS7+gDgnKYxK9Zi1uSqAsC2dvVZqL8czqxg9dJBUHTuQjOH5QzLqsUoMerVN9BPQt6u4c4KyC@lists.infradead.org
X-Gm-Message-State: AOJu0YySjrs81ZddO5LV1R5L3wXiyFUhgFfqH/BXYXAlN6fiM19aemPt
	xuqVrS/Ro6TzWkbgpyKr2Z1pdqmBYSgJZUuJfLEmDGX3zx8osKl7QOdcWUzhihD2
X-Gm-Gg: ASbGncvJ/zM4VWRQcAh+HYzMHI0NsV171qf96ELUacD5E1ANeDwLmw/oZ/Udv6DXigs
	FGxOQDQBKpheZoS5CzGILjXNCXffdzHT/E9AVDgJ+r1CUsICSE+NELXhFalJYIoRC6HiYs43FRv
	Lj6yyxCfQC3HwvJMpF9qkseFL2TfoZxRcxU7M5UeSscKXJS5JjhgnYHddGxjVUGRuQGvd/nChf/
	ApgI09vCO9Y0UK/fPgSJjuCukAw/gCKzmjMj8LtukgkB8SnWp1+MLeUgPLzajx5kcS1QhZDapUp
	5Vw4Chze2hciL/xlbpEJPa2MweDBnu1qm3QHj00YIPoR/4oOwE63AZEaaSs9RvSW/Z0eed+qmD9
	bkVdsoS6Zsa6TOxM0HwElq7d7
X-Google-Smtp-Source: AGHT+IFBP4Ac0eMIqhVrxF6UOvlGCckI5Ip5teFsrW6N1rBQqfQi8L7Td5UuhoSZZjUStG87k5oXlw==
X-Received: by 2002:a17:907:3da3:b0:ad9:db54:ba47 with SMTP id a640c23a62f3a-ade1a9c802emr1697209966b.43.1749571659205;
        Tue, 10 Jun 2025 09:07:39 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778376e48sm6305308a12.18.2025.06.10.09.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:07:38 -0700 (PDT)
Message-ID: <c346fa54-41f1-4574-abea-a6fb2771bcad@gmail.com>
Date: Tue, 10 Jun 2025 19:07:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
 <aD0j3gXeD6Nn6L60@dragon>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aD0j3gXeD6Nn6L60@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090741_097153_04445711 
X-CRM114-Status: GOOD (  12.49  )
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



On 6/2/2025 7:09 AM, Shawn Guo wrote:
> On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
>> Add driver for this IP. Since there's currently no framework for
>> access controllers (and since there's currently no need for having
>> flexibility w.r.t the configurations) all this driver does is it
>> applies a relaxed, "default" configuration, in which all masters
>> are trusted for R/W.
> Just out of curiosity, is there any ongoing/planned effort about creating
> a framework for access controllers at all?

no plan ATM. Though, I would be interested in knowing if anyone else would benefit
from such an API? I know that STM also has some access controller-related drivers,
but I wonder if STM's drivers and the AIPSTZ are just some isolated cases in which
security-related configuration is done from EL1?

