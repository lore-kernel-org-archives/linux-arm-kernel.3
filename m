Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396EBCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNAsSRzsosPIy3ZkgGv5CY0H+l21flmMwlSKUZ7UsXk=; b=rJQc3hnbOF3dyiL8kUTMqUBw/R
	twHJnLQtH3PItvF+t4xmXANy03vbSCQmZKrWqac34U6JzGMhybSbeB3icohNKxUgsaGU8+fXJJeha
	WKqT9e1lba2GblvaFK4V7jVkDv1uZQ7FG7DCtv9vt8x41tekHhZVjlvcJ9HuDAVY3+sDoaPca7wbR
	PW6H9B0IIGsi7mKIqku4zyvYsW0dRkzvZ5OPeYDh9Jxrhvf/qFlP54qpLcOSAWXog2O2PGKGV/rs2
	V1vksx+RqGnVqDYa9Y8VvvZ9aRmKzRzNRV7pJN+HruCCXjOHXkx+VonhWm8NIrxNdPEcrgtFCsdck
	Kd0ccj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXMF-0000000FkYj-2Saz;
	Mon, 08 Sep 2025 08:36:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWaN-0000000FPx8-35u9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:46:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45ddcf50e95so13975945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757317606; x=1757922406; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNAsSRzsosPIy3ZkgGv5CY0H+l21flmMwlSKUZ7UsXk=;
        b=fgHpU/fhGUb97DrXIskUAskTG/un0TbZ8iXAfxMkosLz/Ysl96FIHHBIpY8DNXNUN3
         SmsCmBaN/eNiPQjKKPlPnCxTc98zFau5PvrzikP5XvAusArpKnkVc+Nz+/4F/4s+yFvG
         RXnhKIQozJJm42D+bPNBbk2d3L+rCQ1d1t4/U8+ymX2o1vS8Xh5Tefjg8iQVBra2piWc
         oLpsS1I1GcrVUazuemoZnAvuJm2vpxiz5Z2tVcHfLygnSP8yTPGnIlSCO93H6R+f1bEi
         zaPRglLnd102qbzr4v1COIx6zjk0GU2vpPoUFcHUkwm3JzskyfMbN4fDt/CBWLwdcRhr
         5qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317606; x=1757922406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNAsSRzsosPIy3ZkgGv5CY0H+l21flmMwlSKUZ7UsXk=;
        b=UOZJ5QRLOdIabhSwB/L5RJllueX5WrbgbWhvDmFQo8R0J6M3Gvaiq7wkEx8X3gdA01
         7Of1jw9O0a0CNCfH1VFWcCKgrEtx5O5Il92fAMS0KKRus1PuW1IMWXZ+jKZeRAvkQvXN
         dCYF9U7wki4QusBbtiP8/grA+JHkm5nwzxkII8bcSgXCSg7++9aerO7qkns1rCL/dCQK
         BNrzJJiSdoBFk1VrDaT5pmJ/DWRvmW8tPtlS7HzZSsdJTlvYRFZ7LkOz19LFJVLZpc65
         Mb7RbxZgzw1Gw3+WUsFjEPKt/tsqU1T3TeK/ttc5E1Z89szCcNeJE2ByVtIBXkWo1qBi
         7cqw==
X-Forwarded-Encrypted: i=1; AJvYcCXf52SaT5h+wjzv6wUD6zUaBS6h/scbx7L6O9qme2ly9f5ikRHURjR63GKD5JmR7X6mcQOI9cVUd7BjmIEzUfea@lists.infradead.org
X-Gm-Message-State: AOJu0YxYpK2unzsW9EWZyxK8eq6ht5fcqf5tCp15NM02I8QU0WpDVxGQ
	brciabWYL62BGvijN/uHppLgmJIj4s5IA3j3yQctTTUEBTHWgiK360uGzayA59M5VVE=
X-Gm-Gg: ASbGncuw6mUj/q9GW1NZrUzSZXwQNum8+aENwwcNAW62yPAoPq6uipg0s7x94MCSIfS
	qHKJkfQB9Q4H66WLgwGhrHGCrdDS4RlA8czm8dPVI2aOMuOZvNvmQmcjp4waYQ8e++aRxYzKkHC
	nklPI2FqF476V7OGmPPbQEpNN6wgBaNi43m4hA234lgVRncmnBmJtObCcMpsWJLuPZm8nfevV/4
	24RU8fFYTfI1xj612JpR2dr8llcT7jgOu+aokqYeXs2zI8BouqCJEDEZWXHLJpODvm5Gf8Oj8E5
	6hgk+/90j9Q27iDOASxw+vCq2SxBZ/ZWR6B2XBIpSKcjHW50CbvsdN77KnfW3N4TdNr8tISFEFp
	A14pR9gzjkmgb2oPv63uZErCkERnaNeuY
X-Google-Smtp-Source: AGHT+IHn3jMawLrugAhLgtdrDjKbbgNOsVBJuZ/1bwRiJ8MlERu9wdEB+XckTY2iI9k7tkZoET5gag==
X-Received: by 2002:a05:600c:4744:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-45dddebfae0mr61565605e9.20.1757317606013;
        Mon, 08 Sep 2025 00:46:46 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcff67787sm181785435e9.16.2025.09.08.00.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:46:45 -0700 (PDT)
Message-ID: <33e80e92-d68f-4919-b535-e76836fbabd1@linaro.org>
Date: Mon, 8 Sep 2025 08:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] firmware: exynos-acpm: register ACPM clocks pdev
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-4-65ecd42d88c7@linaro.org>
 <700967d0-ad8b-471b-b2cf-6544727db26d@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <700967d0-ad8b-471b-b2cf-6544727db26d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_004647_782273_990E9357 
X-CRM114-Status: GOOD (  13.31  )
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



On 9/6/25 1:20 PM, Krzysztof Kozlowski wrote:
> On 03/09/2025 15:56, Tudor Ambarus wrote:
>> Register by hand a platform device for the ACPM clocks.
>> The ACPM clocks are not modeled as a DT child of ACPM because:
>> 1/ they don't have their own resources.
>> 2/ they are not a block that can be reused. The clock identifying
>>    data is reduced (clock ID, clock name and mailbox channel ID)
>>    and may differ from a SoC to another.
> 
> If I understand patchset correctly (and your cover letter supports
> that), this does not depend on patch #3, so please move it before that
> one, so both firmware patches are one after another.

You're correct.

#3 depends on #2 and I thought you wanted the minimum dependencies listed
somehow, so that the clock subsystem doesn't pull extra patches (that would
be #4). I will move #4 in between current #2 and #3.

Thanks!

