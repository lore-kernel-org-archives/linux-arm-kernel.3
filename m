Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6761D64072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24rUIfwiGyBziK1kSY2+b5Nvpi1meTWCMZaQMdMFtck=; b=am1w8N4kKSYH2bgfsIuFNikt1O
	C5HyGNZ0so0HnO1JBMwaV91kmogYCEHZwYhrO/XCg40TKGiCwo4UlWdvrw5sRAZ2+IAF+U6dq34q5
	Pw0mtT3Aa/Elzj/HhxEjORnEhv8x/OTMTsQTPj/y1euTlN5ypTQaoRKAwUhcda1ZDeMct8m7N2wuB
	piyFeMPPmYH4lnmPjLafxkUmhTkBTchMZiY1I3Ek4TAkbaZ8mmD/M9yOYAOWy4SDYijnGKoDpdi84
	CXWM7x3f4qm9DNragAWGOnv++P/n1NpcNlV8DGAdSZtn1qVl/LeXoTprl5gNXak3b4wQt5o6C0wx3
	MZ+leuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Sxa-0000000BQnt-0y99;
	Fri, 08 Nov 2024 17:39:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Su6-0000000BPZd-47LE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 17:36:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d50fad249so1691824f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 09:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731087373; x=1731692173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24rUIfwiGyBziK1kSY2+b5Nvpi1meTWCMZaQMdMFtck=;
        b=lvUWoSY1mWXzqSH3q9/fo8r0Zr5lUwSu1xLU3oL1FHcnd3c8J3HsAqf+dbiNPk9Sed
         5hxfGGg+JzIUW7pSkCJ+r9F221YG3qY9MEf8o5p2XJfngECrFaW1mL6tkKfCyxmtYtHe
         Y3eDypbhJq5tDmSWHaGG+39s7BK3oSZ4u0g9lvMbWlzZ3f2/dHM3nXz4lWcYKdRxesCJ
         MGs61Q0an5PtnoZcwaAKN6cS3SMFTbpgVdK314GTlapOu/zBMEzLgQH6ncXi7Y0MUPf5
         ovowbk88f7qeK0/CXrWuvFHvQ5tJYYhm9Ik7gcWfhLxJxWp379uunRI7cdu7HeX8ndMd
         7t9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731087373; x=1731692173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24rUIfwiGyBziK1kSY2+b5Nvpi1meTWCMZaQMdMFtck=;
        b=W05qE6hUuqhBZFCae9NC1agOW9gkLrbogcXai5tFVuvS6MNq6xB+Ppk2hKZ57LDGPi
         Se8GXYIF/sJdQeTmLwYKsiViNOuEzaTYf9R2SVWW2yidQ+4EKXoT5vofMaH43W35jvSJ
         Kdo/YPtdlKR68Mnk8/+QTi9g+3ls0Az7MU4M2YZ2j/PzxBowrkEkyQ+H9ezhFMg1PvAj
         gTC8yzgsv54soM2OLlNy96G4AFzlAU3T+OnWR9GDpZ1XWTIZQbkZjXKxyAYtd/Ds8BW7
         +X+0wm6g/Ry44GSIdSF5vsvbdLqQi/F8srztywaecP+Vvhn99swXyHbv0geHM6MTmjDC
         07Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVCcm5sitSkI1/yL8hj5iX+5rSpvek6T+PXRT4WRBd0kj8WTAJAeIJSWKB7L22OhnCp4Cpr9MxJgll+sjhNMex8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3k7ST5E6RmWGIEAMU4RW8SnQVBnlLulMUJ8nXb6X9WBqm5KHA
	cecWV9mQb5elllPxIIoo/zNQJVEDtexKwp7RYiq11+A+tkk3MH9wOedlY1y473A=
X-Google-Smtp-Source: AGHT+IFB4cQNv5E0di1VK1U5QifG33FuDYlnKtO6ciqXhye/GnzodGjwkiWo7tPy7OZ37dGOU9CmJQ==
X-Received: by 2002:a5d:59a6:0:b0:37d:4d3f:51e6 with SMTP id ffacd0b85a97d-381f186bf72mr3099046f8f.14.1731087372779;
        Fri, 08 Nov 2024 09:36:12 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97cfaesm5482406f8f.38.2024.11.08.09.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 09:36:12 -0800 (PST)
Message-ID: <f6c2aea7-3363-4c29-bdd8-ee3f6dd1a642@linaro.org>
Date: Fri, 8 Nov 2024 17:36:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-4-7d3b2d235fdf@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-4-7d3b2d235fdf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_093615_076044_F46F8ADA 
X-CRM114-Status: UNSURE (   6.08  )
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

On 08/11/2024 04:09, Taniya Das wrote:
> +	.alpha_en_mask = BIT(24),
> +	.vco_val = BIT(21),
> +	.vco_mask = GENMASK(21, 20),

Thanks for following up on this.

---
bod

