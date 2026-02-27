Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD994FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTtIa50EX2gBjUIgh/4hqiDtH9jDI9dvjYOsiss415w=; b=V0Qc6QWqxKpRay+838lMmQdmkr
	5ABlvcCIsYlqnabLpsIqPfN/4IUJT3dDi8sa376hAOB+kODBkzyWoIRp3itiVAxPvA4eVqct2CvWG
	IljBw5SS9bPoRXcCgv8B7YDI0m8g+z9VNQZ0HbY4958DJntKOCiJXviTZ2AY2zv3MO8Vhc/yD8P1e
	YU2KCl33ary5SEN2q+na1Z9w09D8NKp3q6692RXMKKLTZ8l1sLTZWFwjGuCODuujLhUDvwvQstT/w
	4hXq3T4ABRZdcoVxo22ragORqSzu0UyTy43OSVxS2CHwUzTPMHqLI9Ywrl5MBb1O6oM0eDetKyoPH
	1GPfyJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvztH-00000008f6b-21Gj;
	Fri, 27 Feb 2026 15:36:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvztF-00000008f5z-3413
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WTtIa50EX2gBjUIgh/4hqiDtH9jDI9dvjYOsiss415w=; b=qIvAtdv1H/QVIdhroAQ1JzyV3d
	SZAJLmgz6T2iE9PxdtOz8xincWx4sAiF5l72odPKPPFU8Cpm15gHm2vfmwtz5v7R/+uQ5+BpfuUSv
	41vtiFM+TJxbx8CdJQcpalbWoxtAz6In9KcQEYETCxw6TiXHrfPG8lLtm9xkYSh0EO4k8En4Jky0c
	GjySf98aG9NSx6ycgcpdAjIpZxkdALpHx54V1acOO7kBvuPGp0J9oL/YJyMM3YkiFOXtcAD8KpNiZ
	A2WXFd3cMZi+wktfD8PntLK1+3FB5moOcmFgM7Xrj1gd+D4GnYRATEwfibHiJv4sQ2qp37NoVZD3P
	M3lXQYYw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvztC-0000000DOP6-0QYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:36:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824c9da9928so1289893b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206584; x=1772811384; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTtIa50EX2gBjUIgh/4hqiDtH9jDI9dvjYOsiss415w=;
        b=UP28z0i2Shx7ikkG2U2H92ezgKVua85EHGEM4+3ZlKQWwyC5TTaLyoGM8PKa2PM1z7
         uaOWe1SnZd7mw4ZlVNMqYXyRdHr4PSxWkdTGIFRvuRylr44E94lojOpDZOJwS8jZhQor
         NKuQkRuiCUXUVVBeXdnSFH1Ksw5VKEl+MBhVgj59qrTk5ixCcuFL89S6BbF+FUNRHO/y
         dEFVfA2WHLNM0k8c+NlRx653xlgaS0V/jhUt0641i+6uGxUkU9G2TGWvRAXgJXs4dIew
         Ik3/fFDVwjgldGzdjJdaw0ZzZuXxGlt8Is4I4DfqJYJXxEWZBBLyA0Y3jiYr66nmfkHW
         AFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206584; x=1772811384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTtIa50EX2gBjUIgh/4hqiDtH9jDI9dvjYOsiss415w=;
        b=gJobYJR9QxS50RIMAf+rIA7ym3fjRYmjfPnlb14r9oWX6Lva+oHOpX5SuLklGTpOw2
         yft0W1lDz4ScmrRZh3D8dIf3p/Gz32mmHNAVcB8JFgu4Rm5IODbZO9B0nAxY9/yxh5DE
         W+r/UOK7skvfSCzna3HM/btNewJeO8Se7SOPIPGS8bwm3RkvRkCQo1FpxHfyjMnDCNdG
         3EdnFSuww6ftc/wdYJ5OuPkw3Hx5mk85JwqRihyE6q7Dn0thHzEebaP7wul/1dkhTZHH
         apWfNDJ18WU2P8YlQeiDXTfd/KM21rwq14OW2+8wJK6B0ug1eK4sVSqB279ZbQLpWEkF
         QCcA==
X-Forwarded-Encrypted: i=1; AJvYcCXP06BEd8KsZ5qfB7AqceYJvkpe8xb+w25aLL7AQ7Ctest2PDk1XeLma0H6vMji03+y/dDjthngTmxFAISbomw7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy42W4NnH/XFLtx/Vu4c1ANvQ9PA6mYDSsyGQx8x1JPOTQV5Q4X
	Qwq2spOGMrxEyoHeEMq13Uqyb5E4ojQkd2zgEneFfEkDjiZVvOVuzjuK
X-Gm-Gg: ATEYQzzECc3q/7W1OZMEa3CMfYJ2HNMQK7bTqY3MqSEswMnWGYIKDh0RBujiamCp66P
	hjl4LeX4HauU2C/1WakxQnl8du7RaDb+NtP/dArIfstdRixK4lpzrvg3S7QUSt+eI+2X7LT5TL8
	q7HmsxwENtYu3qLwmPAta0Y9FKwOx7Gt5+9IdRKdwmXNFzi452FnZjAV6kqC1No5oopZeYd50ov
	sYRmTXeybqZwsgXSvBTnDKpyNjBVkJug9He7JysKozxYYZb6uM1EvJ11XATJpNw78O+gKkO6A2z
	qHxHjul3XxssarVpbF1uMlHGp6qXRBoXFma2sUx0UKJ47mKdeHaga3UauwZlORhYIso/3qmJjHA
	m50liYzQ+JHiag4DdiSRCE48a7mExoIG/Wp/A3gvfnMUoO5h/Jb3k9ZpeE3F5R3ElqfbvdyQMfZ
	OsS9tiofhGg/mSVRRawwK7zMcRsDiXUqUNSfGOFHcGHcjkPSQwogO9MAJP/rWyLVgMP6Ee4b6rL
	D5OhvJ5MXY=
X-Received: by 2002:a05:6a00:ab02:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-8274d92e2a4mr2562694b3a.3.1772206583901;
        Fri, 27 Feb 2026 07:36:23 -0800 (PST)
Received: from ?IPV6:2401:4900:8f4d:f11c:79e4:e568:8dbe:778e? ([2401:4900:8f4d:f11c:79e4:e568:8dbe:778e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8bcb2sm5413525b3a.22.2026.02.27.07.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 07:36:23 -0800 (PST)
Message-ID: <f6d4dd37-3817-45b1-a642-8a07405f505d@gmail.com>
Date: Fri, 27 Feb 2026 21:06:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc: convert
 to DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
 <20260226-arm-microchip-v3-5-0bda15abd922@gmail.com>
 <20260226-escapade-staff-4f2842222b3e@spud>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260226-escapade-staff-4f2842222b3e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_153626_407333_B2CD9474 
X-CRM114-Status: GOOD (  15.82  )
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


On 26-02-2026 23:42, Conor Dooley wrote:
> On Thu, Feb 26, 2026 at 04:13:37PM +0000, Akhila YS wrote:
>> Convert RAMC SDRAM/DDR controller binding to YAML format.
>>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>  .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++++++++
>>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 20 -------
>>  2 files changed, 67 insertions(+), 20 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
>> new file mode 100644
>> index 000000000000..1516fc8e09e1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
>> @@ -0,0 +1,67 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip (Atmel) SDRAM / DDR Controller (RAMC / DDRAMC / UDDRC)
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> +
>> +description:
>> +  The SDRAM/DDR Controller (often called RAMC or DDRAMC) in various
>> +  Atmel/Microchip ARM9 and Cortex-A5/A7 SoCs  manages external
>> +  SDRAM / DDR memory. It is typically exposed as a syscon node for
>> +  register access from other drivers (e.g. for initialization or mode
>> +  configuration). No interrupts or clocks are usually required in the
>> +  binding.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: atmel,at91rm9200-sdramc
>> +          - const: syscon
>> +      - items:
>> +          - const: microchip,sama7d65-uddrc
>> +          - const: microchip,sama7g5-uddrc
>> +      - items:
>> +          enum:
> Whoops, sorry for not noticing this earlier, but an items list with one
> entry can be reduced to that one entry. For you here that means that
> "- items enum:" becomes "- enum:".


Hi, i changed patch as per your suggestion, but i found some errors
with  dtbs_check, anyway i sent  a v4 patch.

let me know if any  changes required.

-- 
Best Regards,
Akhila.


