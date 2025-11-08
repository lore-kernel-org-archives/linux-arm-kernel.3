Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5BDCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjskvN6jH7m+Duu1eq+hr6O2GRgMWF9LB47syyf4F5w=; b=O1q1tlx09YKLXpD62/4xi/fliS
	rQioyiI+FOVVownMZwSDeF8KmhfeTnOGBY+36m4TQfSITbALsLqnOVkjfMGVsCLbVvKeoSJj0w/aD
	ih0bpubnz9Z5o3ehxTpH66FHcmgliXOjOzd9xV6Z2p5c2tPVpPGCnOqmfLwBq9uyaab12dTfRRRST
	gn0MDdTy14Gqju7SzOWABf43nPQLBv7swR2MjmeBvl3cugZGx45nKp5ASPOWKuBI0CJ95cBM+sc4C
	Nn0vzvUaxRMWk9EyKm1LcAcaesPsCkRqJUShl8UzYfoZE9MjtC1Kj11YMMu27+o3268FTutOOj2fF
	RNFtie7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHk5D-00000003CDm-36ZA;
	Sat, 08 Nov 2025 14:38:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHk5A-00000003CD2-2TUh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 14:38:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42b3298502cso8084f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 06:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762612702; x=1763217502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CjskvN6jH7m+Duu1eq+hr6O2GRgMWF9LB47syyf4F5w=;
        b=MAQ7sYXyoYH9FrapJPCTn/q0j1M9nvoIY4q0Hc19oVdpewa7Cd+NmKA3FpC31O/PrF
         vA1X0IK+8h6HEJg7AAFThGKLZnR1K1lADdMFuKseesb1Vi/nPsQopxJZNwnqgToWdFqV
         iRFIdA3EWiwoGhxC1hifyqz3JHUlz1JmUZcLMWDrAWWHpHfRmq/79StT1zoQlrXDtxzU
         eGJrzvrOsAzDkgKrD3vsTNRSuDTOwjvzymQ21ASgWboud4BattXuG2V+Z9I0HA9XVXAw
         C7auZ14y8suE9wRU5H72tUtEukILYeXL1cw0s0d3mQP86C2WsHIsyctc3e9KU1EFcbLj
         KBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762612702; x=1763217502;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjskvN6jH7m+Duu1eq+hr6O2GRgMWF9LB47syyf4F5w=;
        b=VoBqoFwb0w5roER8yzhhReV/AxQQ0FEK8Pr/yLrYTjgOlqZz72NAal76MVeC8DJNaM
         bd/DSoAuOGUih1XQiqvhsYM+1Ys0XiYy2Eg2c8XTptHF4BflldDJ55q37vGys+LhMVuL
         tcwcaZYGWd00hrX0CKZ0m8slUqH2b0Cf/qduAAGvYZUE+dC3xWBzz+0bZPh3QjV0IpFc
         aLkFyWLDrHPw8NA0oUaE008FLZ/ApK4CCqrmgkFjernjOyR18oVb3hgl67aSJ4g1dvtd
         QNER+WdSh7aK63QumipQCEEyIPQYZROP20TohVv9hiaExsx1cmwQ3K9x8RLhVeAOUzb8
         4FKg==
X-Forwarded-Encrypted: i=1; AJvYcCW9sKsnE20NX+BfcyzlGJ29vL8jlD/98gmB0At865gtDFipz0PK/viR8sXeVdbK+0ZKXxy7dCcft6HVRoDzY3Ed@lists.infradead.org
X-Gm-Message-State: AOJu0YyVGbB/gHKgsBQ+WFvdsguf4tpDDmmxgyZNQos9WJwOhoM7wqMF
	Mi8mg2nT9tIHUNBmajaT4IWDxeDVbnxmYhdSpGsc6cm4VOgEOQRCNo9dcRU0THmmDxQ=
X-Gm-Gg: ASbGncv18hHpGPqX20UpYq8N6r+1VuLYpRqVhLbpU4E4rQShcIdJNPlEj7f+EQ/OMRI
	NIBBT8tlrbhaZgyBUUT+cx8G6SfrKg7bH+EfSH9sBo5zXALZBIkec6VRCzhZmEOChmO3/1SnHcB
	cPLeLqo6uyyxRJEzw1NO39Qn/6rdjUMLWKAxpluYX9rR7sRXLkCEKC91jvYkgZBKze+HUCxxdgP
	CbwcHza4U1yPzrGkC2kbng2yefxZbaYkKasPjc1X+oET8F01z3urgU2isGW/pNfPd2DqNeSLI2j
	GMoRTqNUWZaK/+8uNQATQvzHzjfkQQSo/8YQZKsr+yfjkNe6ucfRgEy2p98W4NGzUyigC+2gG6P
	BH303Eznd8UfLqZq8SWqEtz1HrqbZfW5F2OrmFOA5LHIHUe4wsWHmBqkF/zduy5+8B0nCSGGot9
	/otVwsS+RMRrAfPqsFswpiD247WWmwp64=
X-Google-Smtp-Source: AGHT+IFiBiRhpsly3YGEqjvxj+Py3Q4DK+JCa0siSF6z5aJmBhaLltU7plhNOwZpv/U5i5Vxxf3qew==
X-Received: by 2002:a05:600c:4ed1:b0:477:bb0:5e13 with SMTP id 5b1f17b1804b1-477732aa00amr11266585e9.8.1762612701759;
        Sat, 08 Nov 2025 06:38:21 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a278a32sm56562505e9.12.2025.11.08.06.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 06:38:20 -0800 (PST)
Message-ID: <07cbc020-ece3-4483-b078-c265e3400d2b@linaro.org>
Date: Sat, 8 Nov 2025 15:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] cpufreq: ti: Simplify with
 of_machine_device_match()
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-5-d780ea1780c2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-5-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_063824_734878_648B4C8A 
X-CRM114-Status: GOOD (  11.07  )
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

On 06/11/2025 20:07, Krzysztof Kozlowski wrote:
>  static int ti_cpufreq_probe(struct platform_device *pdev)
>  {
>  	u32 version[VERSION_COUNT];
> @@ -564,8 +554,7 @@ static int __init ti_cpufreq_init(void)
>  	const struct of_device_id *match;
>  
>  	/* Check to ensure we are on a compatible platform */
> -	match = ti_cpufreq_match_node();
> -	if (match)
> +	if (of_machine_device_match(ti_cpufreq_of_match))
>  		platform_device_register_data(NULL, "ti-cpufreq", -1, match,
>  					      sizeof(*match));

This is obviously wrong patch... weird my W=1 builds did not flag it.

Best regards,
Krzysztof

