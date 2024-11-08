Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7ACD64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ+J0uCnaT+x0yIPYmMnG9zvQPdwpvJwn2l27mxNTv8=; b=JalWlc4Udt6iz9pnVk31YNGQEn
	ioV2q7NLfmGy5+qHluWw8RZhkaXMkWdyeb3VW4TaNN7Q4S4psj6x6bw5ZoUMC3Z2UStoRTtkwV5z9
	jvJPXLCFUhL6rYDXg7G4HqnBJ3KFRLoLzWdr00Ea8e5vAbpmuv+vKGGWtuCAh6SO3QTfd3bWqR05/
	6IqfWql7ZzNBk/tMqScKUAQD/Aa2Mjboh6LcX+aCPMss80TpH+4WG00WPN14tfS5SpPukLCi0jgkR
	4pQiR0uGcj5JW+zHDYh3omoPVSwml+dK/Ns7Y8nwZ7CRED5+c/9NaE3Pff2BVa0jvXpm9xNrq8/V1
	25g1nw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RvK-0000000BET6-1bEc;
	Fri, 08 Nov 2024 16:33:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RFN-0000000B6P4-2dgH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:50:06 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so1826570a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 07:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731081004; x=1731685804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ+J0uCnaT+x0yIPYmMnG9zvQPdwpvJwn2l27mxNTv8=;
        b=lkdRHutbxnX/gsAj9OFse9bCDgm15boX4lMEM/m2GKiSAOprzE1MSqVqNC3xsDf9BZ
         E0OkmR1XDw93u9iAV8GqtLbTRH9pi7p5o696RMoe66HPcCOGS3nbG+zGlaSKtK9tl+yS
         jesljpzTqo2U6kEdiBhEX+ktanJvLMnfH+FkO44u45YHAI2cltYB9kcHl+qC6fX9v2jb
         a7HRkeAkixhwNnlXdLp9h0B31aOyupyJj7H8BzSpu7aayXxMMKE5ajQJSMyg06c9Hvjw
         P8Tzib7454U+36DmUOvROxFu//x2oKRbx5Nq/lwBNTopUMUegFod2FblZPYJYP/HaSvf
         4IdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731081004; x=1731685804;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ+J0uCnaT+x0yIPYmMnG9zvQPdwpvJwn2l27mxNTv8=;
        b=uJaYayS7bZW7CT3LOZT4qUezyEgffACJBLXOi71iml68Ud/Y67u+WSZVdpPR3vJPj3
         PBFF0639/M1x8HDemNLMLwo3T86RsEilt0FLlcq5jHpwsSp9SACwtLwV9JdM1OJ+shTT
         mmdvdJvnfSr5Kjp/yQ5d+mofzDdInGpe5HgsXOoIT+wGeu0WyF0x1g6pd3FTrlvDp8X6
         5gWWmcQGNzpiipvAeOPVI5QaIpnR+QJ6d/0w3ZrDA7Jh/rllmInVLdM/oTTNVPmPHN3N
         /OBPobFNJZaNRP2rOLlYP4n0ArLL12ltEl2GZhiUhBYw3dTn1WnhP7Nl2A1WaeZnX0H/
         MWRA==
X-Forwarded-Encrypted: i=1; AJvYcCXaZv6SiyzqQshbIax6oU6pk5oKkxjv03opoZA2PJI4UURvBizQ9tj/sSWk0xw3Nss9ltQdM3Zbe78BAa0hEBAv@lists.infradead.org
X-Gm-Message-State: AOJu0YxaMvngjs5ztUgCTrNolzcNx4tgfO7HjenUu9YnsQkKBRSWvmnv
	W2sVYKfNw0WI9HjgpZrgToTqVKsKNcnnTvfuphd/WL6OipM7eBQG
X-Google-Smtp-Source: AGHT+IHRoj1cc4ePvYEsz5DmCSDi2av2jJaP53p6RwfYTf1WJ4aBuGYIc1+XeiJWDJWQDrjRxbKCAA==
X-Received: by 2002:a17:90b:1e4c:b0:2e2:e545:82c5 with SMTP id 98e67ed59e1d1-2e9b16f0529mr4094709a91.3.1731081004272;
        Fri, 08 Nov 2024 07:50:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a62d6acsm5720627a91.53.2024.11.08.07.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 07:50:03 -0800 (PST)
Message-ID: <e566ee56-523c-4cfd-999d-1cd9ca8eb7a6@roeck-us.net>
Date: Fri, 8 Nov 2024 07:49:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iio: temperature: Add support for P3T1085
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Carlos Song <carlos.song@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20241107-p3t1085-v1-0-9a76cb85673f@nxp.com>
 <20241108152856.000042ed@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241108152856.000042ed@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_075005_710691_1D6BF09A 
X-CRM114-Status: GOOD (  13.02  )
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

On 11/8/24 07:28, Jonathan Cameron wrote:
> On Thu, 07 Nov 2024 18:02:26 -0500
> Frank Li <Frank.Li@nxp.com> wrote:
> 
>> Add basic function support for P3T1085 temperature sensor.
>> - Add binding doc trivial.yaml
>> - Add basic read temperature driver
> Hi Frank,
> 
> For a simple temperature sensor the usual question is why IIO rather
> than hwmon?
> 

 From looking into the datasheet, this is a chip which will be typically
used for hardware monitoring.

> Previous reasons have been:
> - Very high performmance / accuracy part (i.e. expensive)

0.25 Hz ... 16 Hz sampling rate. No.

> - Remote temperature so not typically hw monitoring.

Local only.

> - Same silicon with a more complex sensor (typically humidity or similar).
> 
No.

It looks like the I2C part of the chip is is compatible to TMP108, so
another question would be why to implement a new driver in the first place.

Guenter



