Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D5DC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td2ZJwW7N98cHO5VXORzFw0c5z/lDGZFzZl5RpJ6ZWs=; b=tV5IYyrfXjXqi7AvgH+AAOtnoZ
	jA9QcTFzbviJGW0s2hpxKA5FdizamrvfZzj4ssMKA4OdBvRoCe2amfNCGYwK7eg3iv9fWQte+pjTD
	I2ueeplV+icux1gD+K6FSzRmygRwdUzzDPaEas55gI6zJVA9SK9TG5m/rc674irjgButAIbWGi1Ud
	Vzw6+a6yeUhcQ7RQnRmGrmJfuJ+daOmKTIytlY8XYh+7ZQ4/gvEyDyBUp4s2vhB6rcdRvgiCQFATj
	QGEwHXtAE/k+4WZuTqHUp7bQ8ZKGdfSwIDckWrn76LvS4HLrlHLUXffqqyPG7KgVxErtRuonbVd3a
	9sFeAPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIR7p-00000003lkR-2u3k;
	Fri, 23 May 2025 12:03:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQzd-00000003l5M-01Qp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:55:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso569511f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748001314; x=1748606114; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=td2ZJwW7N98cHO5VXORzFw0c5z/lDGZFzZl5RpJ6ZWs=;
        b=UBOGthCSYSlBz8/PikfUpGsH3ESzFP6MiSp11OowXWfK8rAxBQIgMHDBpDiV6uShpG
         Ip7KGYPEDye6nXZbdKQidWc29yWILxhy8lTLmPiRlnOHT2h3I2LP/3wwSNQIj9Jk98sq
         h9Cu5P2XtMRdjNd3B4we5KqM8oSCZ0bX0oML7qAWqLE+E4/94DjnME7I3gcICyRs0PpR
         cQqRtFWvTw4cHxzn9zfaC4HZORgHOhnCncb8L/B9JFXUDn3wTSIqebtbiQRvNItg6hi9
         b3J7F7DUZlVoAIFBL3+/TutBXvTZ1o0uJ1Gi8XDO3WYhmxgBfl1PR/pq6Mc/G37rImDA
         wGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748001314; x=1748606114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=td2ZJwW7N98cHO5VXORzFw0c5z/lDGZFzZl5RpJ6ZWs=;
        b=XHDc+RwxxQaUMM1KKQ0O6mft7Q61Qt6QktezUfzJMdhFJLGDkgToPmABrUxOgiTdb9
         y9OkEQFynf9N9OdKWRiZdC9awED0xe+ELRFIgPLMxzCmNtnQrKL4Ubqsed3tlK17ROp1
         DuToTfADATTLrG9o9j98oHFeEiXGpejl1sUwkUzfE3TdBhhNDnPm1nIhRP7IDO1Cdo2D
         DPIc7q/t5304EMQZ2CDSi6lw2A+RSdUv744s/bRz1xnfIX2aTxIMlFIPRG95iouK/bsc
         1wKE1AgiI0TJQTbX47/r8RSKgYtPi04HbkVqqnbD+d+wETjBE7CfbbwiQ89ZRFzsAxA4
         U/CA==
X-Forwarded-Encrypted: i=1; AJvYcCVTnEd3105WkrLg6pSgWga1R4I2FD9DqOOjJXSoxb9Y5/VyViFdmQk5MXE+JqIOL3A6+W8TIFHFTyp/64VRqETB@lists.infradead.org
X-Gm-Message-State: AOJu0YydEzzZ5CdYaqIFSfrL1DupW51HPk3fBr/09F+nVVlYXX2/amCO
	4A03ZL41h3J4fpYw4b5kBobh44qzDv2qD/B5WREjepOfBlCfLWGZ1QJYN0unWVdQh/k=
X-Gm-Gg: ASbGncuZapaz9jan6KF3zuCgiB0JSCkmUU0ek3UIbS4ZX0XWzni/wmvtNPgXXFRvnCE
	WpNy3RXB3Qddl57QFmODGE+BKBCyJyN0xRCMtCu5eHKcB5YSXUlO/3sRwYH5wDCCOTMjdSfJqEA
	GKsmC1GslXCEqnnI2yJ1TlyiDTYoevyn84AraFLdVQ5yqS7Do2pAtkxtGvKDZArCyyoWE5hdKGq
	3Xz7KguqZ9GYnUlvyhpTqwBnYY4f7pUxlEJJQvlX4tZ8vaAJHhAE0cWt3+QbyGQtD8C8p5DzH02
	BDtxeTUebSKNm7FXx+PNH9wJ2feBFtG+Blnv3k8v7Sy4e6+x411kmrHCZPY1ApCYMH/vLPMAjOu
	QH5G/SDEtLYaqMQc/
X-Google-Smtp-Source: AGHT+IFq/up6OK5NIvAkGTe9WzeGq5BGaSnNPovf4mlxpw66A2DNQPChmD9oNR6vwvtZ2FM67DQ01Q==
X-Received: by 2002:a05:6000:400d:b0:3a3:71fb:78c6 with SMTP id ffacd0b85a97d-3a4c1508310mr2832179f8f.16.1748001314597;
        Fri, 23 May 2025 04:55:14 -0700 (PDT)
Received: from [192.168.1.47] (i5E863BE1.versanet.de. [94.134.59.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c002e937sm3861519f8f.29.2025.05.23.04.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:55:13 -0700 (PDT)
Message-ID: <602ee8d2-9225-437c-8961-6ef94830c397@linaro.org>
Date: Fri, 23 May 2025 13:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: update renamed PHY_SNPS_EUSB2
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Eric Biggers <ebiggers@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, linux-arm-kernel@lists.infradead.org
References: <20250523114956.457102-1-casey.connolly@linaro.org>
 <86b2d83a-aecf-4ef0-ae02-c8f6bdc72e5a@linaro.org>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <86b2d83a-aecf-4ef0-ae02-c8f6bdc72e5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_045517_048248_FF874E83 
X-CRM114-Status: UNSURE (   9.88  )
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



On 5/23/25 12:53, Krzysztof Kozlowski wrote:
> On 23/05/2025 13:49, Casey Connolly wrote:
>> This config option was renamed, update the defconfig to match.
>>
>> Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
> 
> 
> No rename there...

oh damnit, should be

Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor 
sub-directory")

> 
> 
> Best regards,
> Krzysztof

-- 
Casey (she/they)


