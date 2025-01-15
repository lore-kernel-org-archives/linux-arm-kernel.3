Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A56C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bH+qFIkzfP2ZdF0jKFR3toN5QXpPpNWnsi9wML2k+Rs=; b=da06CnPKhEsodF/CAteaa2OIIa
	adQBV8LpRKMh1KHj3XaP+H2Wql3eRp6csB6RGBOUxre7fiJAA/tmfdUdfpYYm9Q6UVDZrKBbLfzGE
	FEH318bMsP/4kJPYW9u9VvVsKeooprL4rSt0YMVv4rYvNunw123RcrvRuDxUzqaWLdMybVxpGxCLn
	Mc0QdR6H0ehm69wxeJznarg1ca3jFGmgSvXd/dgxprGY59gPl7oVng2mDMnqJqlnMVkQR5ygreHdl
	1uVzD53l01y5HULZ0N/mo956shhnIYTauiagXypy8uN6PyksZUrgajnDydwNL5eCK83QTJ5b9Q7IL
	qJtoCuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2GQ-0000000BoEr-3XQE;
	Wed, 15 Jan 2025 12:12:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2FA-0000000Bo2f-1rnN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 12:11:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso47084775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736943091; x=1737547891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bH+qFIkzfP2ZdF0jKFR3toN5QXpPpNWnsi9wML2k+Rs=;
        b=jNGNm0jek0EeHxASxGaP/CiaFwF7DeavbsFM2iEMBetr2GaawhZGKndyMVZJkOHo5+
         xRp0ag68sQWE0/LDl23FwqED+90ioigxxj/RU8ijjFTTdVkmtV2TgSHN0I94wo9nMXE6
         ahSSHAB+DOOZLD+X3b8BqvLTuqwaoTgBB+99BzlSuf2yOv+VBEwroTiowehCIdwtfX8j
         HkdQ2MF7+E5diJpJ6xuu5Rg+p6cSEk28DJKQczyxG2WdXFNNl7FLf/I9geqsZNZUM2qT
         Tw7uyUWqOx/5G9AxhvXUg7uQdBBUMqklE/TzN2xZD+uPTLrno5mhZfZkqd3gjud/a8U+
         R8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943091; x=1737547891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bH+qFIkzfP2ZdF0jKFR3toN5QXpPpNWnsi9wML2k+Rs=;
        b=gaGbQ+F99pGDbKgMdkoZ0SouQaG/iqIuKc1+uT8JhPcCKWxC+WqUtk8EqY32iDhULM
         VykumaW+4lBaPmvyUD2MA8dukkrumW+2EyVGrXxcSzB1hzOH+nd/0pNWiZZs/CPhhefs
         FgEC9rZJ5rohXfhUAFiV4YGoC9jeOGt0tVc6V1/d7MAhs/WoyTp8UI4xTEGdSmxaeTPQ
         3K/z86ERan/RdE3OzN2oQAlhIUH+AQhO4JVYGNr3rZ4mlzexbWXeuntfWNa055bZZNJD
         BKcwtd+vw2aB78F8zcaG/D3OwZ9fJbVQ2yHUNdnLJfOsGzGjzK3rnSajXHHDSwDeEh3M
         Y00A==
X-Forwarded-Encrypted: i=1; AJvYcCUo5qE/6ik18AFSwo2+kzSGOALPon1htwn7Cug6dqDI4f170ALavzOPGd5vtV1Rm5zh/NiJVN0KR9eG7wkG8HKB@lists.infradead.org
X-Gm-Message-State: AOJu0Yztha4phbLePPUUyBdczr85o9clojvC8JpXL8R8Owv+rUmKbehD
	urHrm9CoLMXVKFpLhM0Ojkz2Mysp4cUQzQ8ilVPrRIgg/MQabxKCGn5xxuYMM4U=
X-Gm-Gg: ASbGncvus7zcEmNfyIT4vfb9kdWm3Z3w3xELzTUoMEUvnzKHvOEB6MmmOooRxE1tts9
	ots09MswY3BTVx7xUon0rQ+ijFP3Df5K7JPSLFeZY96M+/rN+sd/hP1JFIcQMDYyVUDCnJvg8sx
	E4D6bnzK/2C7Srhf+cqXhNN2UZkpShgNf6mynjErlETeGX141BsSlF+TU+r5f2lDj1vVzl9UAYH
	m/xGtuPZD9PsLRyAsW/WYAUi7Tl2alzE8qwe4v1KgGnNwwr6O1R6tuioBowZTkZVw==
X-Google-Smtp-Source: AGHT+IF67pKs8kpi+olSNlNu50s1yq8/8pWrqcBOcbOQ7vJkysvgsGhycYNComXSpVL3sZaZf36tsw==
X-Received: by 2002:a05:600c:3593:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-436e2696e93mr232743555e9.6.1736943090907;
        Wed, 15 Jan 2025 04:11:30 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499558sm21582055e9.8.2025.01.15.04.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:11:30 -0800 (PST)
Message-ID: <41430496-14e9-4b17-9884-0e44e1731135@linaro.org>
Date: Wed, 15 Jan 2025 12:11:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: mailbox: add google,gs101-mbox
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
 <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>
 <uo4zvw4sl6uxsj2ewvoue7l3obugivq5z74ukwnd4sj3ndtwhu@hxxque3r4nvb>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <uo4zvw4sl6uxsj2ewvoue7l3obugivq5z74ukwnd4sj3ndtwhu@hxxque3r4nvb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_041132_498033_33D5773B 
X-CRM114-Status: GOOD (  13.62  )
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

Hi, Krzysztof,

Will send a new version soon, replying to confirm that I address the
feedback received.

On 12/22/24 8:44 AM, Krzysztof Kozlowski wrote:
> On Fri, Dec 20, 2024 at 01:49:57PM +0000, Tudor Ambarus wrote:
>> Add bindings for the Samsung Exynos Mailbox Controller.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/mailbox/google,gs101-mbox.yaml        | 70 ++++++++++++++++++++++
>>  include/dt-bindings/mailbox/google,gs101.h         | 14 +++++
> 
> Drop the header, not used.

not yet used in device tree indeed, will drop. I'll use driver
definitions for specifying channel types.
> 
>>  2 files changed, 84 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>> new file mode 100644
>> index 000000000000..a1fbc3b2b9de
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>> @@ -0,0 +1,70 @@

cut

>> +description: |
> 
> Drop |

okay

cut

>> +examples:
>> +  # Doorbell mode.
> 
> Drop comment, not applicable now, I think.

okay. Thanks!

