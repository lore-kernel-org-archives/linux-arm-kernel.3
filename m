Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3750CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hukg1h3ozHOZYYKzu8a9q8XV+g6fS+oS92fdsP1ACq0=; b=FtrF4X449ryEMfSsoZA+8z4BJW
	MbR20qXcr8TNqdKy9wEkcNI4oOaB65028xhP8ynklveMc0pnnFELN6jV8SvF0NySxQ2doLhj+9lUf
	s/T5xBdi9gBDhT6yQMmjYiBespAbkJCtpmjoUlh8UgDSDcVxXrwqiI0zibneI3UqFTH28QlzX9voz
	fp3C4kQ9EkERCiGQu/JN6CzpfC8nAtEhJU9wMuERdWO465INwIHnbd+HOUt3oeYYizZkx50UReMba
	fRnWOZz9eBPqfp5d74MH96spkTjDickA/4MortGm4CHWqoS7Mgqk/LEi/U4LM56/0HjsSjPfnhT/8
	iUiRPyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96aF-00000002ejP-0xBb;
	Wed, 15 Oct 2025 18:50:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96aC-00000002eij-3CO2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:50:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-591b99cb0c4so475728e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760554243; x=1761159043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hukg1h3ozHOZYYKzu8a9q8XV+g6fS+oS92fdsP1ACq0=;
        b=iFxrttn+zaCn7MdRWxBebTIkkDANq0PUGe0WN0u9katlHMTbMQY1LeU+5dNsfLjfkm
         xNLQiWIHAe7Jv18KkTbl5hQZhGFXyNOADiqOC4cVFjACi/MbFR00UzcEV/4M5H2Vkj/k
         ROx6Gff3X3pBpSJJgGFbmMkMSKHvANkwgvpoogHvGhS0vUqor0L6P4FpM+al2TwppIpp
         zTuv788gXi/Zzsd8tw3j8JGAIpDo2C+PivvuNVpe1J8M9Lq/r2H7WPh/M9CRZSXq9GX1
         j6QH+2ETNY5AJZW+q5n4QiYsdLHVkrJcFNcdPNHFAJRHy+AyMA4sQgRUfM07XESm7amo
         oqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554243; x=1761159043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hukg1h3ozHOZYYKzu8a9q8XV+g6fS+oS92fdsP1ACq0=;
        b=fY7mDWZNhA2pRxlw0+ktNTqd8QDuKE0ep2Fy7gYLbJQxS5t2T8miVFm7Z4rFXt/uoS
         2ZM3u6WKmcTmyCR2ehgtC1Sap+iZ7lDc69K9h0DM1KkVpxRiz8b+7KlhT3F7tDE7LBDJ
         1fdVUd7xcdowZltI+QxHgfBKcd4Bm0fIV+v4x/+4jGaCyURhhlqQ+YGjFIa4LEQClW0i
         0gKFkSBD48defmoTjyMFC2o+TWNPzwFjaxyh6CovSdo7blQs7tme9kQxqg98jVZE/+MF
         AhUmR4jBUif3UOBVX4wWvlWmQv8xrFf71V4+1ZZEeA6jbdqUKGq2ps57b95C2wggVXAV
         ztjQ==
X-Gm-Message-State: AOJu0YyP52nCteQl17z0us8q2yCFUi5jJHCINbk1Dsf5q2GAxwloPTgz
	ESvqLD0z7V/t6Mw8RT1f/SDPp+fCGrZyX905GvKfLpwp/5bg3hXSQkHgRxbgil+N3OY=
X-Gm-Gg: ASbGnctIwm1UpLAz0KogWbeiaYeO4lqTBSY+JIiBJC/1ZNL+SJ6y75ZpNNo/p6jLgsQ
	/vit66BMhMUfLXmYMfrSIH5+qSyfj2DVeUBFIbv4jIs02t3Ti1ThWVE145Z+2bmtELkJdXggkZ6
	hU/h8WQnCCwhMMbjD69XvQUq56yPvpMHMVfgzzKYQkBrM5s8rEAbTAEBclUvYDDATCO3nvyU/Fd
	A9jb5PHAIjP989KrsXWxRZexRHbeWdCFlylzQJ9PqsNe0Ex+8kcN2bTLoKWLxJA1QzmxhEiY7HS
	R353BHwKKDQJg15NW0p+V5Yyax+aVLYt4fkoYmZ/YFRReW9sPiRS+iV28lr2F7uCCx1WgQSXgTI
	8S0NUwU+u4JkEdhXSX/KLDYnqxgFxJdp+vNAI/XWKgotDGEuEeJ3eoxcFx4AgznxYLCWZFPtpHF
	EeKlxH8utaudMwYR9MJBuT5+PUlLgoqZL2PwU=
X-Google-Smtp-Source: AGHT+IG+0JkONJK7diPS9LC4IMA7PvSE07P+bqP1KzE0xk93DSkWmTXn5VqwKTon3a4GXj+CVo91gA==
X-Received: by 2002:a05:6512:3b14:b0:581:9295:1b10 with SMTP id 2adb3069b0e04-591c9017360mr816502e87.5.1760554242641;
        Wed, 15 Oct 2025 11:50:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e09sm6425776e87.23.2025.10.15.11.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:50:42 -0700 (PDT)
Message-ID: <365d2e55-8ed8-432a-964c-b57601fd2385@linaro.org>
Date: Wed, 15 Oct 2025 21:50:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-2-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015131303.2797800-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_115044_815138_FA2E6140 
X-CRM114-Status: UNSURE (   9.25  )
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

On 10/15/25 16:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
> 
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

