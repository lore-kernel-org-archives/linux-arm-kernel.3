Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2337FCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=; b=N2ZAs4y/0GyAXiJ1YKKn0R+lvl
	R4kz9Mu8oqzqUa8/etQ8Nli9K/s2vO5+WU6u8NfuAUHRZycnQfGFf5wejPY4MW6iO+M99jp6sE0Zh
	cDnSs3wWKcS9AvoTB0t5XQfbaL6LinEcjFvG2cIPLI+3iNoEfyDj9R++vuM/tRXoT1ETOqwjHvIzG
	OlT6QO+rFa06hpwzRlwxZbT1CQCIygNIYV7kHiIXpvzamXeKgXb5DV7hySn8xDBZuHUMynBZbYM2N
	8Qu/xMiK33ZJddkB1rMFlEjn+ibEMhF0BP8sfIcOXt4JZ7rsHxdV8pgjl67cK98viciPcXR97bl4P
	9xD5bJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hzc-00000007RwQ-36iN;
	Thu, 25 Sep 2025 09:10:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hza-00000007RuN-1HfY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:10:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3f2ae6fae12so389160f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758791420; x=1759396220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
        b=wQJpA/rKE7jH/R+3rhoms04FrCBSCcSnO2jdekyAr9FPRrAcS9rZ2q2psyIxO0vKRq
         gbAS5EPY1tST0Uu0y5vBQJCHoNeItC76m8IZv/ou9RgS2JgMIOhxt8VEScXChIWyQDaD
         dFkqTYcgWMBoXmkxFOg9db5yLsFGgiImIpSjNkqUG+TDS5UhAS7ssgTdcrbqVj+9BmbX
         Yx1w6g3R7cEDS1YhZpRBvE1qSEgRt+MKnxwmX+6hUWOwcftv1gGO4wQYEjUrT9ywZxhL
         9RPa0Z7HIDSGcEQxvLxU9OtsG3+hvyZtpo409n2oQ4ijJhkphS8p3iw5MtZ83EoQHn2E
         q+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791420; x=1759396220;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
        b=uItksP21tzj7XoYOjApU+w9ZZxBldXbzeJ4931t/pFpLp3e0xcu8eDVBVPuZDSDBZH
         36SysDVCObT7/BDuSte7wyH8tf2C5Ar41oKFJ760JufZTG7JL9eCEEhQHnD6edFFmLuE
         RRNdS6hYY0u/F/OnM3JPP1a6cxTcKe2vUN4i46EwTHXz3x9cMsoZnqk9Zdo4oA3QZ7U8
         eNvpvS7ilZuUDXx24fk72nFS0tGyY+DD1hP+QAGMk2nTKgywLMoy0BEotIkhlDjQqYx4
         VJVFSYNwoHiYMJEQvhZ9qCYeNipxIh3ZLX7qq6j8oJc+6hqMqrZIxlC0Q7PmL7W5WqXZ
         CA+g==
X-Forwarded-Encrypted: i=1; AJvYcCVhqQdrvgWwhc2wsJZB6WLrmrsPfoWsU37CK0JrevwjLV/IkBOoMIQEac6C714FLu39w/w+ljOlBpHayRskeVPK@lists.infradead.org
X-Gm-Message-State: AOJu0YzVg7wzcOXbG3TzmriozvXa79/MxAbrLoZ/Xoq2Srhb0Mx44zku
	O8tz37LfKxn6es+9GdV0uP98GAqbdM1SpMcCIHKHRFCSz1yIi9nSDw3+InvRAsDCLBI=
X-Gm-Gg: ASbGncv8hXYHLIq/PrdEJIMa3suFOPbsSqyPtX+TY8RRBSVI5Jy7DoAcaFT2cNFEIoz
	Pz2KNVKmGa8GzdZI5ch/zG35bUf6G4DT18eDnIIVLDaXLZsDVkqrDBb9tyt5fKoOYXAVRTs3HZk
	N+FIGq9UTg1YOqkRml7vI18Z9cdy0fRt9pVmYqbtDQq6Ly+XR2kcBab2chmJxqlN37PLDzkX4pB
	UWB1jRT6JGqBPr9MX3Si80/y6WXP1BU/HJZLQi1Q2PSOeZoenfm9mP2++EVbARf8BXxBPvoqkYZ
	mf9GHsE98rKoXbfO6HmMd8jhQGdIl33MwcTD5rBy23aQ+0SDYCRE1V0KSfMjn/kcIKwPvEAZoX7
	4YlCxfyRy83ADztSAAIdewWgpNFzdjFHoo0V9+h1pCqIMrDvafJ3eFZnU8+2pclIOz+LOjEZHeF
	02p6szFvWMYPTnJ+G3Jcbh
X-Google-Smtp-Source: AGHT+IFDpMpHsFRgd6YSWfaUgP4h+TK2gackvhjt2ED62B1HXzzX5IdszOWCjQD2qcaPDSO7lAZ6/Q==
X-Received: by 2002:a05:6000:2484:b0:3f1:2671:6d9e with SMTP id ffacd0b85a97d-40e497c346fmr2389638f8f.1.1758791420460;
        Thu, 25 Sep 2025 02:10:20 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33b9e3bdsm27566255e9.2.2025.09.25.02.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:10:19 -0700 (PDT)
Message-ID: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Date: Thu, 25 Sep 2025 10:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: camcc: Add support for camera clock
 controller for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_021022_367337_61FB68AE 
X-CRM114-Status: UNSURE (   8.10  )
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

On 25/09/2025 00:56, Jingyi Wang wrote:
> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
> +	0x21398, /* CAM_CC_DRV_AHB_CLK */
> +	0x21390, /* CAM_CC_DRV_XO_CLK */
> +	0x21364, /* CAM_CC_GDSC_CLK */
> +	0x21368, /* CAM_CC_SLEEP_CLK */
> +};

How is this critical list decided ?

For example why is the AHB clock critical but the CAMNOC and AXI clocks 
not critical ?

---
bod

