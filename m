Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE21E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEV3nRHoiTlZpRaNa0mL8YmEmkzQLNj/99WGhY7D8xk=; b=gT04m22DMnNSWHb6M41QDXiDAE
	qeP5iwoA1BBt2Msvc8DZgCinFXpkXI1V7Bw7/rkbL5ql7gM52XpTe4cu6qwSkHaBxdYgkP3QVioNq
	VBxgYqTVALxuMinqWWMo4Z5SoLyfO8iKpX5QfKarGZIU2q+gRCKJvspT11MBTeL8kJOVR+Pygz2T+
	kPizDlNBTNk4ZXr+In7jXw4t0GmwYFV4slqESPb9qaxFH35PSurbmtx2st8waNIiJkBpCbjVXdE+r
	7noSrbhjOU+igrFLQjVCAgDKV2AhkktMr/fX7vo1uO9zkocYBp7LG2iAOaElB/HJog4Rn83OhSzYA
	uduZua8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVReu-00000007btB-1Ojq;
	Wed, 08 Jan 2025 08:43:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRdi-00000007bj2-06no
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:42:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so19574468a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 00:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325729; x=1736930529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEV3nRHoiTlZpRaNa0mL8YmEmkzQLNj/99WGhY7D8xk=;
        b=iI5T4MUAqBSKh5taILYvzGWz7Zl5XoeGXRWbkOoOO5siyXr6QZuLA6bxZVkvaGWcS9
         ss4HnjBwpUTlf5Ixmdhn3L5y4hcskWHrDoNHU/1HNMqoXy/yPLCgA6qnaQKBMjIqvEFh
         w1ZqLj+lvVLs0aeCAq3xjauhBnRPN8TYbXS7dWfiEDLkJvfmdSx/EmUrnbLfQAxhN22G
         TvqzKg+NNvvtP0C/6kL9aQWTRo0SKtwWWIHb9JPaMZjS+2XsGHrgbgcOboImLTjlyfF+
         Kfmmx3rtO0yNBrw792PK+GF9sG4dfHS5Vj0ra6zIx+pIfTaoJ9gtZYDqQLu9UcLd2hG8
         haIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325729; x=1736930529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEV3nRHoiTlZpRaNa0mL8YmEmkzQLNj/99WGhY7D8xk=;
        b=hemTyowOzivQ2wAVj1lKJV0jR66a3gG0dTBTjbK3DT5EocT4RAib4RVaXu6EjRMoII
         3ubokNXg4FxCfRhPAiaWRTcuYZ2HOBaV9CvIJhKsMk0Rv95lZIRnHgJWFRg8rDX7AtSh
         UeIeag1kfz3uIQW2UKjYtsBRqxuBhzvR7DkBITZwrTpHeWeogoOrFhRCfeL5/T/LG8Nr
         m3XIOH0ySWEDR5lkofFc2SyHHDXgfuo8olAS4sOn84FIaSxXswvB+tsAA2QITXtQHYRu
         jSpcMuhabldjB6vPDMcJxc4FYMPyVLBNyuwdWo7iFcdkBYUlskXWYTkUBC3lA3JDY5oy
         BILQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9+Qnjm9bDFASAPw3jYQZsEahSQgE9ILQnLC42tLG7c/ba4H4NDbvaRZveIwJE+5SV67C8B9yrb1bttBmbF+7r@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/WFoEeST//SIpK4i2/Tf5jPeYnEGWx4KillWkxPK8JbnxE/O
	ixZpD/rgAqi3EU1aLX5F7HcdWwAkRNQbDtqV9iyyBgt9gba9K7Z7
X-Gm-Gg: ASbGncvObIWc+sbkZxc7OUNsGOx3RbgKkh1eMV43zZb7yGzFwfYCvU3h0OY6gvu/egS
	QInw4MHKyE8EnCGyRaunvI2gYVva+VMpesz9Ya43l1KMBzJggSZGJOOe8MpZqW2FmG5PKFLBgKM
	gi9m0Qhz980BEwbbdOZWPH2+n0n7VKZEpalkRs2F8gTdDIaEqSb5sid6OiCyGac7SnkR3cf/bp3
	iUdhnW1pG/cNSQ7ln6m9TdeL9RHc8757NqzFH+qQkDsZDrzCXKNcAhvzyFHGquynibvdnvi9w2Q
	akHwf1+eq+V1gJnrb423Sr2Zo6ME
X-Google-Smtp-Source: AGHT+IFt6yglBzdu45lcZKpQn61qSWlD6NrmmN8E7eokh2PUNX0tWId0GEleVKxvnyjttHMEYAjgrw==
X-Received: by 2002:a17:90b:54cb:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-2f548ec9267mr3450483a91.17.1736325728988;
        Wed, 08 Jan 2025 00:42:08 -0800 (PST)
Received: from [10.0.2.15] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962940sm321592415ad.34.2025.01.08.00.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 00:42:08 -0800 (PST)
Message-ID: <820def99-4990-4391-a45a-0d3908d3306b@gmail.com>
Date: Wed, 8 Jan 2025 16:42:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 peng.fan@nxp.com, arnd@arndb.de, sudeep.holla@arm.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20250108011812.627-1-mjchen0829@gmail.com>
 <20250108011812.627-2-mjchen0829@gmail.com>
 <ux55pgpmkngxjsl4semw2cfiljbszvotaydrxrihdu3zphsfqc@vsk72c3wqorc>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ux55pgpmkngxjsl4semw2cfiljbszvotaydrxrihdu3zphsfqc@vsk72c3wqorc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_004210_065513_48C5412B 
X-CRM114-Status: GOOD (  12.73  )
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


Krzysztof Kozlowski 於 2025/1/8 16:13 寫道:
> On Wed, Jan 08, 2025 at 01:18:11AM +0000, Ming-Jen wrote:
>> From: Ming-jen Chen <mjchen0829@gmail.com>
>>
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>
>> ---
>>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 82 +++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> new file mode 100644
>> index 000000000000..889f253b3bc2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> I don't see changes.
>
> I already raised concern that you sent new versions without implementing
> or responding to comments. So the fourth (!!!) time: Filename matching
> compatible.
>
> Best regards,
> Krzysztof

Thank you for your feedback! I now understand the changes I need to make.

I will modify it as blow:

   compatible:
     const: nuvoton,ma35d1-keypad




