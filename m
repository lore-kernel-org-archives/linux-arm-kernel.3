Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B277C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMAEufYTCwR87g7HGV6xU9skq8IOQ0ObyPdkgemU744=; b=KbZwbfaTsyKIlORSmQYQX8lkcG
	Zj7ZfeKV/I6dZxDNLlxHQO1XlpR+rBaBkkzinChxiJ2TLxM9MN6MsfZSs493YQ9JXGobMuS3ObRTY
	QTrsEAO+lQz4HFQY4jILZ4A3+ujN0EV+hg4uB88E2jZcBviRULvCM7C95mOiLNushXfxVRdtqq6uR
	BZ4Pi36MsUc0eqK65SoLAZOYtjppsR/TDIhE6it14MN50JW3thW14OSfnFeL7m0PSaBmYiejYp+Eg
	cswUDw1y34rOwPKFQ1FzarM5TzpDDD1z5hugb9n7jEFOB2rNDhdgIllzxF4Pqn3Nyo+yBDZDQr2dJ
	LgXNEvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjjc-00000004BiJ-2my2;
	Wed, 05 Feb 2025 18:02:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjfR-00000004BKk-3CLa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:58:31 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab7515df1faso14196266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 09:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738778308; x=1739383108; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMAEufYTCwR87g7HGV6xU9skq8IOQ0ObyPdkgemU744=;
        b=feEI16mYyjbzIJu0gNGDm+OP4qChLpeSi+P/EqdC2BkRpNyErhWV0x/uyUfA0E46C5
         UGJPQPBkQVAWgip5Uzgfibz88ZTN2qcX+1Lg34hYpGpK3PgP6vHZtEbAEdJaefASR+ap
         ekrjXWzavateRZlt8unJGbjt9se5qZpRnG3Qh8K/9uuxMf7m09mte75W/nC1evizYjL8
         SmUVTl9cKzYexyzmfG4bGfqP0CRjW/FD8Vc7sHEJksQKhvNbYqK4xjg/2czzttaCLuSk
         Q8q7pvmWWPruYD158q7BZ7LoSEotgjOak0P3arNvnDPqtSZYsb1drLPUD7t8IpaNcrfu
         O2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778308; x=1739383108;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMAEufYTCwR87g7HGV6xU9skq8IOQ0ObyPdkgemU744=;
        b=Mc0rQtjX9bLh0F5VBEVSHv6EserGsLp2Uh9S0I6ogV3lmii6ZJD6GmhC+Fe2zWQEKi
         W8qFpNSYfPT3T/o+5Lq7gaBVPFBvk/zTbOr6Y6nSXhdhvGEwTakyRjaVeBtCKvhCUTDR
         FQeHQ5NySRvjffEiYAkW59LOELI/xgX1iscEB10w8bjkivRuoewqJAUKPN6IGKuJuMhc
         u0EkBXhsMMVhfzYkHzrLiJgk5cUhgd2wosA8AM6dcibkXtmhobJ+PttUVLAZTO5PXEos
         p9KX3C4b73i6oNOwi5e1MXcRGpIg3QSVeAKOuBxWlTKUDDi8YBRcjop36jKKSJ9mDwIG
         473Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTQlJxKNI9CczNje42yNlkwMXqJcMjwkQXH1r67aZQsY0H1hBcgkpmhaI21ofoMBR0MeuAHFJwH8I0EI0uq03F@lists.infradead.org
X-Gm-Message-State: AOJu0YxCxIJ9xawwcEhlwFwbrb4NXxHOlcFbe9e3Jp6Kp7PHEgWjvo/w
	EHe6M9a3nlgOq1AoUx91tmYWsxKNVkcb6XtJ04yVREYdhk9cD+ffwVv8gA==
X-Gm-Gg: ASbGnctuBEaq5eiYwxCATglNrF7XuC5/jH3LuODFa0EAWViLq/Qr2jW1vxC2W128f12
	eIhRD+uXKAM15PKt1ciVnBiG3/1APj1lPf16XTZQhEsf2slhSaP9yoBkkQO8yuQU3qUgehaRtJr
	JuZgh9/72+v9850FficKEJtAEvWLoBAwxof7HJMFHpcRHowo2FD2z0LMCN8KfbE0Iik59EPuI8d
	pUiJJ3Q94bDBKtMjRCn0D+7fihq3Au05pKrTa5vW3fFDeH9Mt8DaOLCxBjoFJ1Ji6tm8RaGXEHN
	T0FVbAwEXhJXxa/yicmqy3CzqNufNfDtFclSevblnc1z4wpm0kx62OQrXSo7LRbaog==
X-Google-Smtp-Source: AGHT+IGilRrBoelGh6e28f+nxniHAFHixKNw+Hqvl/uNj+kVv7H6qbFpMqopbuHdNVB1hSsL6gks3Q==
X-Received: by 2002:a17:906:c144:b0:ab2:b4bc:41ef with SMTP id a640c23a62f3a-ab75e2a7677mr388312766b.29.1738778306863;
        Wed, 05 Feb 2025 09:58:26 -0800 (PST)
Received: from [192.168.50.244] (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ffe44sm1133806466b.113.2025.02.05.09.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 09:58:26 -0800 (PST)
Message-ID: <ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com>
Date: Wed, 5 Feb 2025 18:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
 <20250202-noisy-impala-of-triumph-c9aa8b@krzk-bin>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250202-noisy-impala-of-triumph-c9aa8b@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_095829_805498_538D6A70 
X-CRM114-Status: GOOD (  16.09  )
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

On 2.02.2025 14:24, Krzysztof Kozlowski wrote:
> On Fri, Jan 31, 2025 at 07:13:50PM +0100, Artur Weber wrote:
>> ...
>> @@ -22,7 +24,6 @@ properties:
>>     regulators:
>>       type: object
>>       description: Container node for regulators.
>> -    $ref: ../regulator/brcm,bcm59056.yaml
> 
> Refs should rather stay here, so I don't think keeping these devices in
> one binding makes it simpler.
> 
> Simpler - drop ref and add properties compatible with enum for your
> regulator compatibles.
> 

The only problem with that is that the regulator nodes have no
compatibles. I see two ways out of it: either we add a compatible then
use the compatible enum (might break existing users who don't have the
compatible, unless we make the driver ignore it), or if we just want to
simplify but not add compatibles, list all the refs under an oneOf
condition (like it's done in
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml[1]).

Personally I'm in favor of keeping this as-is, though, for the benefit
of the DT linter preventing accidental mixing of bindings for different
device types (e.g. BCM59056 MFD node with BCM59054 regulators). There's
at least some precedent for this method[2]. But if making it simple is
what's considered better, I'll go with one of the aforementioned
options.

Best regards
Artur

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml#n147
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml#n69

