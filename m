Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E18CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqSQR9XwXClJ1dx3NWVea2VA61Fsyqn6eOD6/POM3iY=; b=dYNwGwA7C7WDyWqGDHOhKgoOsS
	Cc140Ri6f9/gLUowhyZE6G/5ra9lJNHPavai3lRSqDUVGjx5j8XCW5Np8uiEc9cxyYvG4U840W0tU
	0KBFyoPnTGibOlUdoWHiqm+oNwO5apKKU4t5hrbuve2AcldBbMXw+Qai4JhAFJytNa8BhGT0Y8R05
	QMsxz+LdW17kMLT8yuXnYxGV+/wwISMLaY3H+SgP16rn9iWi1UeaJxpHcrSlqJvPQxKNBGI3P09ug
	wJSmmVOkBxGz0UH1jENLFkAh4PdaQnk4j+aoAgt7Cudu1lbc62dBKiZf4/vlU/I7te46dCi2U+Hhk
	e4/j6U9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIUs-0000000C2OH-3ola;
	Sat, 13 Jun 2026 07:09:38 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIUo-0000000C2Np-38UK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 07:09:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so1162040a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781334573; x=1781939373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqSQR9XwXClJ1dx3NWVea2VA61Fsyqn6eOD6/POM3iY=;
        b=GU2rC0wrSUgl7Tu9cAFJcygUx0NpKteuSoeLhoHd7CN9QyZwpP9PLBiFH2mMDEAPlD
         rzftk1e6AzrxtpID6o7IzyzeQM9WnVMJMNqpeC1eNX2/egewv7nMibD09/4nFRy+QDVd
         mJmDrPsChNb2CL3uTTYhEI6g0jomg5kfKWTph0FzEESJn/qgSLUGD71yQp2dDu9tM7UE
         NXWeMx2VETPlo2EcmFUNE9GBAtHTjSKSZbc1qkkG8fl0OH6fQC7mobtXyXt7CrIQfMni
         IgwFOakVzUY34/n29Kkr2aaUNlr/KdBD0tXps+kCA3yne9Xohh/x05uA++72WRczEZ4/
         wZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781334573; x=1781939373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqSQR9XwXClJ1dx3NWVea2VA61Fsyqn6eOD6/POM3iY=;
        b=XG7c8dT2PblBIw7omqiBcBd4gCjhNBl571pv6tco+QIe0a4detEgQFCHK5WAkPtZ5A
         +85snDKMMJXmB7lDDPSwNgBmAac7WgeHsJDYTjupidn8UIjfc5gTSQOTeHr2k+zg07Nw
         vlujziZg3mJB6e2tyMJ5PiNnbpCICAAqLk94WBjCCkau8KY/rVUkes+2k9HRth1TPYh8
         s+DL7Mvi3l/md+dFa9IeSM3vChotNKap6AW9vyPcQlDr06nM6lQrpcS8RfYTFnplyNN+
         8YlyOgmUNLyx57zhdh0Yc9EX4r1ukIg4t/hqrQfEqyb0Pi4SdKhT/X8rbAUB5XU83eZW
         9Dzg==
X-Forwarded-Encrypted: i=1; AFNElJ+bDBDmhCDFzYRIfL086/Jc8M7fE7eh5U2OXShC9a4Sz9sRbOh85OR7/Zv4sgCfsd/r8hf4TgJlRpJOmzViwOei@lists.infradead.org
X-Gm-Message-State: AOJu0YykFcVLx7sXFB05aTOMWre6xiJuVuOxZvMHZZIuXHRwwaBU4edm
	WtdCkwhGBik62dtUYrvlXD66YdlGE1TceO0LaH03we/tmkNwOqyJj7XSSUdaag==
X-Gm-Gg: Acq92OGcXETyLMEPpLyaCBmCePKjLaG7oH4mEjQt8bcA7yUVeCrfNMH3+bkslJTBvGg
	rA0eW4ihMNZqoIfyHeH0T2iNOby11pYblsXRYub8wmUTSYlomOkG40HXiNmly7NAfbUteebCnW3
	3rIHG4WsJHA8E+o55b2UVBkP7chxIxxfOlJPpd7sj7OI8/PaP/SigbCGkI5sEXpkOu+ZPMmWXqP
	4hLzhzgZ7s/v4Wb9LP1kSaH0Mepq/D4dD6OdgUhESRV48LvKgc/0eGLZ1DYQ9bb4hn3/A6Ok5Cc
	EhBblMiS0J2005GL+aGJIiBrVpZa6jwLJr+uxfKjwhpkeJWkgGHJz48pgC3X4YrHbXdncGOjX8F
	4FrHWGID+n+CMh95U1w6TSuAsS37SMCR8XmtUgNBgU7keYjQ/CeFqHnIgI2Xr9Y+HfpDUcEd4XO
	26Q06S74dz2EQ39SZmZn/Lc4RhbFkm0L0v6TcHe7pp99PL
X-Received: by 2002:a17:90b:2d4b:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-37c2bc65207mr2649723a91.8.1781334573307;
        Sat, 13 Jun 2026 00:09:33 -0700 (PDT)
Received: from [192.168.0.8] ([49.207.61.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f363409sm4369435a91.8.2026.06.13.00.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 00:09:32 -0700 (PDT)
Message-ID: <f3e1ecce-9917-456d-b02e-a75827d9c867@gmail.com>
Date: Sat, 13 Jun 2026 12:39:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
 <CAPx+jO9woUB9VGUx+ebWD9oOhqCwzXL9=41MEesnWS15Nyr66g@mail.gmail.com>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <CAPx+jO9woUB9VGUx+ebWD9oOhqCwzXL9=41MEesnWS15Nyr66g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_000934_793084_3B49AD54 
X-CRM114-Status: GOOD (  19.09  )
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



On 29-05-2026 17:40, Ulf Hansson wrote:
> On Fri, May 8, 2026 at 7:23 PM Charan Pedumuru
> <charan.pedumuru@gmail.com> wrote:
>>
>> This patch series converts the legacy text-based Device Tree binding for
>> STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.
>>
>> Note:
>> The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
>> depends on the patch "arm: dts: st: align node patterns with established
>> convention". If the DT schema patch is applied before the DTS
>> cleanup patch, `dtbs_check` will fail due to the presence of the removed
>> properties in the existing DTS.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> 
> The series looks good to me, but awaiting and ack from some of the dt
> maintainers before applying.

Yeah, but until now they is no response from anyone.

> 
> As the change in patch2 for arch/arm/boot/dts/st/stih407-family.dtsi
> doesn't seem to cause any conflict from soc maintainer trees point of
> view, I can pick this up too when applying.

Sure.

> 
> Kind regards
> Uffe
> 
> 
>> ---
>> Changes in v3:
>> - st,sdhci: Edit description of reg property. Modify reg-names. Add
>>   "minItems" for clocks and clock-names properties.
>> - Modify the commit message to match with the updated changes.
>> - Link to v2: https://patch.msgid.link/20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com
>>
>> Changes in v2:
>> - Fix node name in DTS for the MMC to match with the estableshed convention.
>> - st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
>>   "clock-names" properties, include an allOf with $ref to mmc-controller.
>> - Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@gmail.com
>>
>> ---
>> Charan Pedumuru (2):
>>       arm: dts: st: align node patterns with established convention
>>       dt-bindings: mmc: st,sdhci: convert to DT schema
>>
>>  Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
>>  .../devicetree/bindings/mmc/st,sdhci.yaml          |  91 +++++++++++++++++
>>  arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
>>  3 files changed, 93 insertions(+), 112 deletions(-)
>> ---
>> base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
>> change-id: 20260327-st-mmc-c906ad95ff83
>>
>> Best regards,
>> --
>> Charan Pedumuru <charan.pedumuru@gmail.com>

-- 
Best Regards,
Charan.


