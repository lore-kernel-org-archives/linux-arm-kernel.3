Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A465CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=; b=m55HhjunhBaXIF/tH/8IqWrSna
	fUxHVKEkgDgxL1uwdHloeZLjsi2NG8meTca+9CV5OwkibtSDu9foNDniYLwEhWAGFQaxcu5lWnR+Q
	9V7dCtuHw8iin32F35orHWgJvODRGN2fMm/bd+labJ76YYdkRR8qmGB2knxpA2zWRMMiwKmMTSnsa
	J8H3o8pjuH2xIeeZkihRUpiuEpH2a9rmktnhxWWP+05gZ4OHxikfMhY7NrkshRNmj2BgzE/QZ/APH
	AYdDpP/smqCynVnPYU6pla8JOGoeq0cLO0JNsOM8Y7iLxPUjQrHE06KvxGvHedHAr0fw6mK5QwAAp
	P9qTDgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM6o-00000006f9O-0SiX;
	Fri, 08 May 2026 14:23:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM6m-00000006f8n-0Wyz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:23:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso311451666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 07:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778250193; x=1778854993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=KZpumPZ9mjdLDWVS9cbII8XCSqmObWMB/R1k+7FQSOQfeiQfUGOuxg4SNiUg64boZi
         ogth77hpmLQ//pDXr/8HDVmECptYBsYUG6EaHTriU+mVuMZkw7b9Dc1JtCMZ1f9YZR5+
         MlxchBeMn7MKnwCwjVmsSTzDvI2gYumMC8uRj4NIIs2DOnUk9nno7o5OeY6LyoKJsCwB
         BDHuG6jQ6seAN3e3GxsKXUFqwQ4gyEmc3n3INiypLFbBmb1WAIpBgQ/5zUtzrAtR3Uza
         +jkCNXpy5OWLLrDdM5L9rBVLpF7MigcTrUQNZD0G6rpr8eQgPjBxNF3UsPco8xLGi8UF
         dcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778250193; x=1778854993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=bO4Anxh99EyqO4/iLOCnOc0/gLUywifW8xAdtEn3a1QfSP4pKLZc7zI33X+Q+mNqkH
         g5TAEslBk+tADpfnWt7Qe64Mz7VGJEJALrXhV9qi32XxA2PKNflddbDX+LZJkSMsbfRQ
         S9lHFoyFSFw1Lq6nAOjU0pMP7RiX7K2q0bgIuq1nuUtgqGsY0I7DCZJyjzTbLGr03cS/
         OlK58r/w7yl132bw39t+C0WDJWK/5R+YbNJm55c2sme1LXbwsTrzudTsGaYcRcJrGjrU
         vZx50aVstHtJ2rYaNKRBzB1ubF6xAM05yapyfLVH1MD4ByyeF5bmOneltoVC7/b+p4DP
         qrzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KiC3z4qQIRZ9synJgKKYpMMNVXrwM14jNKbkXtEWLY9eTb7dKWEsPY/pSM6SAkOsn1wltJE0lKLPjh5r8xk93@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJab9hYu44GkQwUo2R4AmWRbj/wRUWIHwPiBcQ+84iwMNaiQR
	jNK9AMgrmhcWPc4JHapxKqdWMCpvT0cqCKyKDOQLlkUC+x2i9YMIN9K2dCR/Fsinj98=
X-Gm-Gg: AeBDievN8ueOQC2J6Ad1ToUBLN9zUba/dPZjtHVhkAX3hqHqkP93E09xKLHvSFJ1HX/
	o9+JRZL0UlMWSbaWgL7GOd2dbHhN7tuv29WJQuriSKlHwGtdCnbOqK8PI2Csqd4pXnz/Lf0d33h
	1oEgLxTJOF27QdcfJC1H70rPul2ekXtUk/2PA5yDpwHMr2XSaXe2nrpVW1xO8xxKtn7WGKL0uwe
	a/YftGeNeYDPx5qgCFSpVkJDGqXlY4L39t7piXgJZgS1+5wgh3DWYBMP1CC3sEMCkZHbRfHqgy0
	8a8JL8mlnEK6dRJA79w3vV35zyWEosjmJ2zCWeoeEYF2X5huii/MtwNHfLEb9ftns2kdpL1JmQ0
	qZ1bUbFL6mZs3iwqi0WMRDMTF2E4S6U35jWgu0dvD0idrzC3MBSGZu8aAIEnQR8EvduRwfaO0cy
	7DBBEuY5zHB/H6N3Tmy/O0VDFwGiGUt9uCiHM=
X-Received: by 2002:a17:907:807:b0:ba5:2f0a:2f40 with SMTP id a640c23a62f3a-bc56aa45eafmr738018166b.4.1778250193349;
        Fri, 08 May 2026 07:23:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a648sm703741a12.7.2026.05.08.07.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:23:12 -0700 (PDT)
Message-ID: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Date: Fri, 8 May 2026 15:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_072316_177395_AC199803 
X-CRM114-Status: UNSURE (   8.62  )
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

On 08/05/2026 12:40, Wenmeng Liu wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
I'll repost my working version with the PHY stuff so I'd kind of 
appreciate you not posting an old version here, just wait for it to land.

---
bod

