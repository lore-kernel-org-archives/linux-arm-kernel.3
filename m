Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F25CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNjDpuu2hwLIB0IxXf/2OHG10BiZJ+z4qaTrgnV6E6Q=; b=hIyKaIPHYAxmhMrXik7fIAaMpV
	jfAI97uvmK6xrDlpEM3RQwYhMn9L8mvAzaCIWdl9kFmUFLPcsWTzV+eyt4QVnSXL34fXgI8Ga8bqY
	k2QZw0bBxHZne/+hT6UsvTj5PxU22t04N4R2wFZTgcSz/paeYcDl79jebrgPEEJSCzulN6jxcuLJE
	og84hR2FctTaeMgDLxVP8ilPbOlphxwdxXgs6NlinQXTLg1TqOJKypp3QqsSuXew+97GqpG8pfs4D
	XobwUdgnyUzLSpQ/iGWKv5Lowr3Pdo8+6WScP08Ueu/BfCchKq0U2Zxfl5GLtSg/njRDEbHn4MBGB
	l8JwmZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXdH-000000009xV-0QFc;
	Wed, 06 May 2026 08:29:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXdF-000000009wX-3Stf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:29:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488ad135063so57687415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778056164; x=1778660964; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNjDpuu2hwLIB0IxXf/2OHG10BiZJ+z4qaTrgnV6E6Q=;
        b=vhLg9ocCHD5CLhfJr00gcJhGds7sBHIC6Psh4+4DEbRyoiUqPqXKnpIuHXIyyPCnEP
         LCOgSgzIK9QY7NrahvtAoWL+YIlZRVVfuhrYLANy7hqGVL0fjtLx4OQPXlFTMhqmApzr
         6w7i663cY9rmCpctIO4fz6/nf5RJ+BNQ0hgUecTvTIw6Ox+tVWtkcsgKe+q9/4TSyph2
         Dnjp4G2Q2hIJ7YLU9bQJxriUUW8aecOZ+EEgMtizOTejaut7i+8f6akvlohFoovHcn/E
         nBxMRHQvkZF2H5r95gQO1GA2pbayqIlY7F2LWSdxM0CGjqyy+ALul7IefSOu2TupmWPs
         pZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056164; x=1778660964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNjDpuu2hwLIB0IxXf/2OHG10BiZJ+z4qaTrgnV6E6Q=;
        b=KrNEKJMO32VePrnn2eHoywhgyTpUlO4TNI5tpKGNb0fcbC+8Ad81WZA3MiUaSdJc0y
         itI6Bpsei+KFZotObqEvBfRiBZLhQZ+qFt0yPSzCmUfujCZtB+F/q50k4Q3SEr5ET4Ku
         UJEPTP5kcwqOwd/WqyQF2Kki4vBvey9EmFgI2hEdWO0KH5zkcfpfFC+9B3UGDUyNzGMg
         evx1F1P5+P1Fwm3zPTL2LU+QFScAMLp0j2jX1+SMn+yaSvfGN/1uevDpT3gCrI2tb6Xy
         BWTHo9NbEmuUbUL/F6s4P7KZmHOFkbcioqx+YKs5+llU62unCW5kYDGHQTE9KvsaMRvH
         1mLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HoI2LV5svQhdz1gGCWzxsuReq634ffcXOddRiynanZ/SWmzX4bthVTfsUF1sX80MmzgPEzIhLB4Q2zdyyI+si@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6GATESr0aS3mK8W0YuhUBTkDde+lEdAAbRpD3HwgiOIJ9L/wZ
	Ri9fHEJi819TYMYhr0/lS4heTw3GX7wEAPmpUkL7GJjCc9f0q+25g6j6R2lMLIjgk9E=
X-Gm-Gg: AeBDietCMaxFMKyHU9hLvB8ivNFzs/Rnu1VKammkYlStXngBulXmjHsiiWsNscLxDh0
	c79FKGz81EJvxcB7Zkc2ujx556E4+r94nMKFFeiaAh2KvGyKmXKEe0gw6EwuMJ0sqaRsy/gMArv
	+cIF0RnuLM/fXGDM1UIqPt/W3QoulSBAZzrS9oPlffcq/Hxtt8zNFCNU36oFCDclsEZzNnCe2LY
	HAsCUydaMjcGSOkQ2pfRQcXQAH3qoR8zWqnCxYp+27a8o6FO8vxks6XKmugwHW+euNe4hJj51nK
	SMKYxF2OZG3zLpvMxKSdVLkQuRFIQTaqabWhqeRGYfd4Q0LhgF4kv/+Ajcm1EUPEVoVOaTVm3zU
	EHtUDejvgh+lmSdj8ebJHI2M2e7B3bLVoSCqhjFZ95fBxEOBUQvAR+iKNT2EYlnXqVVVkam/NVR
	3HUWjkHoW4qYXktwKTqFy2razmlzn/zXlPYL/iCUblqkA=
X-Received: by 2002:a05:600c:354b:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-48e51f32a7amr41967685e9.17.1778056163955;
        Wed, 06 May 2026 01:29:23 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm10276212f8f.18.2026.05.06.01.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 01:29:23 -0700 (PDT)
Message-ID: <8dd42c4d-2cf4-4118-b2ba-99670cfc94ed@linaro.org>
Date: Wed, 6 May 2026 11:29:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org, Titouan Ameline <titouan.ameline@gmail.com>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_012925_885482_993EEA54 
X-CRM114-Status: UNSURE (   7.19  )
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

Hi Krzysztof!

I checked Sashiko's review feedback on the set, and in my opinion the
set is ready to be queued. I'm going to send the cleanup and the
ACPM TMU helper driver patches now.

Thanks!
ta

