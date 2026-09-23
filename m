Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305A1C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCRN4DHgD6jqSzbMa54UXzXSIZG4JDsooNiRjXbs5co=; b=sR1f/tfphXopaWdTsC4p58heRH
	DtGuIuQ1ZIVMEDYCaudOkHMLZGW4D7BbxoHcpi9nKV2HH47/qLVfj5bZOnsJdBGyJcF2kkEdoT3FY
	uFXGpJUTmBMMv3Hi+wJjGUDj53D59NUzdaKUGReslS79WmEIv6JTVKwbnl+hHdLr0crlf3RyC7Ozy
	irxh0c8qSENXmIAgkPOJAt4A64uGvrJxW8sq3U5Azjil2UCsrQjTaW19tNeDUSWE0hbm1xUOLBKph
	/ZZJUmI0lQkgTqo3JQl+GcH6u+vmz6QF1IJqy4OvpOLO8OreYbKWsKkcpMcKUEDu35WySqpQr+KO4
	wbS34XaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q6k-00000008uqa-3GLC;
	Wed, 23 Sep 2026 16:46:11 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q6d-00000008uow-2ESZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:46:07 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so6428675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181961; x=1790786761; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCRN4DHgD6jqSzbMa54UXzXSIZG4JDsooNiRjXbs5co=;
        b=gtd/II9dYH4+7yPm+GVdJSkVH1wMD9eGtxPmcGMN7/STeuYpF7Y1OPzxGIreDr2gck
         ib0oNTGda+akGedQkb2fSUy9IHLv4yCOcG28j93NmeBnlhqi0eot/W60jCtNdw1fyZoD
         R5pF6I4J9sZ3/PslwOkxBJldULtFm10c414fieBK8aIXMdA1DcvFFXS7DjX8Lt4LqL5W
         rUHIRtb6k6lZJXh8Y3azyKGv3P06LkFWn607fQsaoSf7kKbuIiEDJEHRNy4rBQzaxfVR
         C6BLdOP3L1//eLj/itX4/JHe8Y8Trfk5utuvJzyWgSJVhtCLS3KMTraPkfZsb/52WDFE
         HZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181961; x=1790786761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCRN4DHgD6jqSzbMa54UXzXSIZG4JDsooNiRjXbs5co=;
        b=SZsInk8xYPdWzgXvXAVUOGg5F+/TCXmkT4UiUCfN6WLzo8ClS3MWXKVZde8rj9i07m
         FaqzvBJsXxiRljrMLJPahvdTaDx+spqFdgK289i2wS2PvzZevhZHh40tTw/n3cajw0xp
         bmL6nxRQQvXQdGorGyEdjWvRU0/a3bqWx/w3zM4iKqsdXj3Hp0XzM27ONoLFjgq1+nhD
         UnnhHf6BAHI+fPym7xuiIjS7sDm/rhmqJlSqFyMXmdG/qPlEXKOy06GEhgZorvrvASih
         1t5hC1BPe2UDgXHl6wl+7nsdDzmqYrwc+5A7bqH8NsNiNWMCOx5j42xi/CC9JoFTxXu+
         Gg8A==
X-Forwarded-Encrypted: i=1; AKwUvBxvy7Sx+cIadHqw4dZBiXBLagDIXfY4SVT1IpSIpFFsHGyFL51mouUTOePruAYPIRqaym+BwX+qC3Tk0fuqCkbm@lists.infradead.org
X-Gm-Message-State: AFuF++lVX+82jz64V/caAeHTAKN/NQixbikdFIUbXZaIEydiepx1Xg8A
	AOpuYwMGYkDbTv9AgICPbJjwtIAev1ZoH3gInBPm7urZDy1/QJcyFlg/
X-Gm-Gg: AYBFou0Ms5f6Sf0yK7M62F8CbdrY1f3MlFm6UyWVDie6XCvsijbNjWY3L/CtXOItTrT
	obFZcbEWplFO7TwAj1lzbF+YYAc7bO9yDDRGa3x7IW1XrqOqxmSeBaZno+9ctmqC5fOwhTsHSGR
	lfL0MY3Rcr7vvh4GhLOuV3qVLtJz+S6pHJ4N8Q9rQrDPJa70uLP9J7k/w6vtIaOoBlHhPUCPomm
	NYaPyVSChAoOkZdMRDO1k5KpXDSf16VU643Nm3L7BIS8UWfnwC3m8pdYNeSErW3VPjNGhjLXKEb
	aHPXz6+9Wy9or4n3cjX1R8PXbrx5VZjTTj2czNumhjS3kg/r3w7xx3KnjrLsNoQAjAoP9F4pzc/
	dwUFIAjanFKV4LDMHwFifY7Z4BVCalzl5f7ovNRfrynVR8NvhOvXo9iGa4PvrHV8GPaJ0eDc67f
	57MTaadWeqrUwHpg5OJ3fTAx+cWnmzAMlIXyRn7oZ4kDyV2J2wdHi7JWtzPg5hZhCA4EDR7njvc
	11YI/p22Jq6joHmVG7QZsoy0IFp+FwIBHYc0dHRZbY=
X-Received: by 2002:a05:600c:3515:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-49fdee0aa22mr49910965e9.5.1790181961405;
        Wed, 23 Sep 2026 09:46:01 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c104a6sm65685625e9.0.2026.09.23.09.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:46:00 -0700 (PDT)
Message-ID: <6de301bd-0bb6-4704-8c3f-8da09c5f6830@gmail.com>
Date: Wed, 23 Sep 2026 18:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260923131323.1099979-1-sander.speetjens@gmail.com>
 <20260923131323.1099979-2-sander.speetjens@gmail.com>
 <20260923-browbeat-judgingly-b047721f5cb3@spud>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <20260923-browbeat-judgingly-b047721f5cb3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_094603_721946_6721C8C8 
X-CRM114-Status: UNSURE (   8.69  )
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

> Is this actually needed? Shouldn't the type of uint32 come from the same
> source that the type in rtc.yaml does? Or is this missing in dt-schema?

The rtc.yaml does only provide the description not the type, I also 
expected the type to be there.


