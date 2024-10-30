Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F280D5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=356ISyJwQrslqNkIAE5HnlpLPQYYjpzgyFzJpPVwQPo=; b=y35kK5cRpnLuTEa7cGBTjU7r37
	XWOTxjYNhwVJGamMB2/1x0xd6oSrHt/0xHCI3rki0eNmWh2xIb0xT2noex+NE86pzh32KM32pvamv
	mFmXp9zMTtDt/8EBEHk9vk2ZYB5TnGm3XDvwcx033cNjs9QaL39oXBL06sqgrgCyUWdT2m6aF1V+B
	gbNePmOQ5hhd6RahxYTZgyrDVCOQzbsE1Jl9c7iDiadsR1JWBk9aui+6hM69KJKGrLHSWUAQy/l/S
	SbMl7QW2ibSV1ssaLHkeiR0t2uk6DNvhNgFHH+jU6t9AflpRqCaMTKeK+Y1l30e+nr7cgtV+FpaUu
	elsCksfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t675C-00000000BXj-1VSG;
	Wed, 30 Oct 2024 11:41:50 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66ho-000000006RF-3ktu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:17:42 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53b15bc0731so859858e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287059; x=1730891859; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=356ISyJwQrslqNkIAE5HnlpLPQYYjpzgyFzJpPVwQPo=;
        b=ldZsWBiL3zDjiKXkeQDvuayBWtvN2rOl4ca6TxivAtb50tHKvS8uaTSkZJxgrxLN85
         GafBwR184aWwQN1RHPEzdlTu6eJVCo7tsJ5smNdSnUtqZu/UAcoJ2I0SBI51Fi3ieG7H
         9x5mNLKsy7wBgLdKy/urRfoGiQLSwxrzd1fPYvtxnS3kQE2UCm748n1migjUyMtN3grB
         sZhEbrwLZ1SSEH+P4VUZmuERW5n3lD4EiPrAeeH07IAJeF9AA2KKWZGajKZmSitSqWcy
         WBce7MTju3kp3IEhp6m/JHGJMenJDQUvYSyTwjwwxwUkmFkD0kEAYmwi6pxFIxW+EQw5
         v8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287059; x=1730891859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=356ISyJwQrslqNkIAE5HnlpLPQYYjpzgyFzJpPVwQPo=;
        b=ZoEhuraKnMYRxVw3WN/XysZJLWlaIHSgYSc0T06SudPL7k8DhU/okd8nNRtQcGZvBU
         fKRjW1SMZ3kUr1stJkZmBY5GN8XbSZzOLHefuk9fu13cpWDmhC97IXJupp0CbrB79aqr
         MkROEOcwAi6FQNTHnlhv2f55sLtCYAolhwlU5U8nMFwZ2z3IUTp9wL2+LN7dgYkWP646
         7a3oa84J3mCD0UeLchIop13MiWIBpP1e6E6Dt+2mfOqRzGGqTVhHPQvCEJUMJSJgZfQp
         f9xvSGjYPZkmaDGpfQtDnB9QxDx8LgdGf+P7XqRGzPfzqiLSK1QRGPRS/tIi5o15+r/X
         VJyQ==
X-Gm-Message-State: AOJu0YyrTMYCKn2uyvhSGn5nrcjGQpUqvGd/QPDX4wCvsLCv23s9nN7H
	kSZ3aVlu9ForgaUSnN7HkmZE9oO7C/QDKn1Z8fIte2RaT461NhY8/Ivt53dEcg0=
X-Google-Smtp-Source: AGHT+IGnM+oSnQStBfWKHreFs9i4FFNZc119m+7yiPhy6glNaO5Ho0YNgrbESTHVYDwlQmgkL1c1/w==
X-Received: by 2002:a05:6512:2255:b0:53b:1369:fcf6 with SMTP id 2adb3069b0e04-53b348b955dmr2386293e87.1.1730287058996;
        Wed, 30 Oct 2024 04:17:38 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb819070bsm223221e87.5.2024.10.30.04.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:17:38 -0700 (PDT)
Message-ID: <78f6bfc4-69f6-4a1f-a47d-6347910dfb46@linaro.org>
Date: Wed, 30 Oct 2024 13:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: camss: Restructure
 camss_link_entities
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-5-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241030105347.2117034-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_041740_979003_498A9E70 
X-CRM114-Status: GOOD (  11.37  )
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

On 10/30/24 12:53, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.

I kindly ask to exclude this change from the series, it is unrelated to
the support of a new platform in CAMSS driver.

Please send it separately and rebased on the current state of CAMSS
source code.

> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 159 ++++++++++++++--------
>   1 file changed, 105 insertions(+), 54 deletions(-)

--
Best wishes,
Vladimir

