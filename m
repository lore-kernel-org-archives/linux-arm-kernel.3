Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ACDCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYShG4odej5vYKThNx262uoG6FdT0LyVmxecSIMK0Uk=; b=EN8UNPr88u+bIn/trl98/jsz3o
	tJU8OVrl+q0TcAbWhi7dDCVag5fCaotyG3NfYJrqIpV/n+Ql48Q/FtqVfyv0HBDCFVb/hmN0AAYvU
	bm8bnnwvnMMpBW5qxQq4/UqKjSR6DR4UG15JlAWZXUcfzNb3rQ2uPMlnix7Td5s2zLqJCf9V2NGvL
	8IMmIiRW+LGR1kGV0y+q4hSP11/B0oMnvUrImj12XloqqdH9H4vvC22SW8egofs1w374DL0BXGJo5
	r4etRUuaBBQptNPbGXm7EtALCsHMUcUM6JHYnlXS5n2ld9D24Vg9dJrRnPMFp8POnl5WgjEgb7vWI
	e8dZciBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24Yv-0000000HU6F-1Yv8;
	Fri, 26 Sep 2025 09:16:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24Yt-0000000HU4W-2JbC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 09:16:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46cb53c5900so21035975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758878177; x=1759482977; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYShG4odej5vYKThNx262uoG6FdT0LyVmxecSIMK0Uk=;
        b=XVJCuNpwolAoJ9ert97TnqpJGytNf4dIag84RF6ccD9vXNvYcI73QIf1sf4GYwgkKz
         TfL9A/XiPuNJCKzo/7CFLfVpGqO9ftU64sxRPx7SwRf2aj+PGKg15A93kO3YcFqUxC9v
         kIcZXePhyPKuxkSkHN1czxWT8lQ8vglFb71yR2tR+nWeE0cLN2K6wUx2YvVh77OJ0ds9
         fy5M6hpGrudOg+cBkdf934Rmaiu7l1Z3+sEJ8TrQ9DQg/vYVt/j+0F+4eDxxTUMxYqFr
         TT0yf1/kiVf0UjSrGhu/Z59cy372mjvRisp03hrq4942Y51dl8s2725K1z7Zi6cCPMIC
         N6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878177; x=1759482977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYShG4odej5vYKThNx262uoG6FdT0LyVmxecSIMK0Uk=;
        b=YYke9Hn2x8rdqzANKyxOk5eL1QheKe36WlHX5Najur9JX3PaWid5lupn+OVZ2DVTIb
         s7+o5eaE0d5BWKznS57Qg3OF3ho1yJJNc6JK4ucFa2VL0IDRhowegi+ISFxrcPLU99To
         kbDyhxIaDU+1qB0lY0pu8lT6QkVgE3H+00BMgpvd36VakmnCtzIyZnW8wY0xRJHBICPr
         ctEfjvvG5onMSpi8gm0aDpVC9+BVSGIJ1LRbgW5vy5u7eQlht2Zi2hpSRK7OVzubnCnI
         JpX62p0YOEm8ctSBHfrfQK8559RlF38x7mguDgT10o1SVHKyS4aHG30S0Ab++W7Y28qw
         l9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUIR7KxPAeLMM8WLI4H/9EG+tkeAjLKfVjFEDDXupQ+Xfkno63A4fj6A7LBw1PwocRcrEplXgZieZa70uZSqfVH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7M5YpWRdbZNyyWJ9uuqIyDDppYaRcDzBy3b+Pv9myPYN2fR98
	02fK/ZlW8oR3eLEHAcWuJ2W9RvrbeFMwslcJyNohk9nXD+F6LkdegiV2az6zrV8P+5M=
X-Gm-Gg: ASbGncvxqY2h6Xd+YkQKljazrprFW70Sqk5AR6CkTTDRxDSB8t2dZKZfNpqTz9vq7iO
	rAsA+ad1d3BUn/1zM8sJruVioKzofptSreQXpef3b5qB+2OrFwXNqUPwfUsd24fPByNVOdIS2KN
	JPeQ83YlHG73Gn3gREyBjJqaWU9+HF2roaYDe+WGleTJ7Uww2jyztnpi+480r5v6gN5uI5PYuAK
	7jLYfv3Lpfv5dxwd2EsJkPWLdI+xxItzFXzutfaYJf+Khllzu3aM7DRsZhFzj+qjivsw91MjFX+
	rOc+MbSrjuGF+YJOI4n8LGH8qmHkoeMkn3D7M32+yVr1B7EDAkIxzyTli3Eui5e1aE1vzpnXrW4
	kbo31GT7dXrzTphL4G3CuGfZ4RpUztMQ1
X-Google-Smtp-Source: AGHT+IHWIpWJkFH6MgSaK7Lwa2sAdlk8StsGUnX1BeyXoXscm4t51npqgFevzyhLcqPW6OMTyJKXjg==
X-Received: by 2002:a05:600c:8b33:b0:46e:1fc2:f9ba with SMTP id 5b1f17b1804b1-46e32a0d5e7mr75187965e9.25.1758878177511;
        Fri, 26 Sep 2025 02:16:17 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb71esm6152127f8f.1.2025.09.26.02.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:16:17 -0700 (PDT)
Message-ID: <ec25789f-eb79-4a52-b93a-3005756cb572@linaro.org>
Date: Fri, 26 Sep 2025 10:16:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] clk: samsung: add Exynos ACPM clock driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
 <20250924-acpm-clk-v5-4-4cca1fadd00d@linaro.org>
 <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_021619_599293_4124F637 
X-CRM114-Status: UNSURE (   7.47  )
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



On 9/24/25 5:00 PM, André Draszik wrote:
>> +	ACPM_CLK("b0"),
> The last one should be 'bo' (bigocean), not b0.

Oh, yes! Will change it, thanks!
ta

