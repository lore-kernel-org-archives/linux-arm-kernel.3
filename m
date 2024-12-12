Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD6BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzQGJmvH+r/yv9jwC3++jU/5AXa6EzZFVLdWoY0TuKk=; b=L3Cc/1hIVaFJYLGABtcq4FmBAt
	Bmpd6Td12nTX+ZGuUbyWgxANztIbbX1xrr+TYECz6xqDfk1xzxZvW5ylEPTktrvvu6HZYDZCtMw4E
	Or39h8OrEXMNLVOc0DnX2oFNTAKt2mewd8CN1MkncG8xA1kgyL/c8shelCj2LIJMVYnhFqwSJOFbT
	pYqVbRfaITcB8BiaI50SscDX/KWOzycA9CMLCFkzVmZC/zRKIJV7y41SUm6NB9nmJ3s2iUyKw0xJV
	6WEqAOjdU1JmhMJJljzDnZ6o0XLQysWq7rfDoerUaHu+j4YFxb/U0OkvANCDxuP5+ImObMz3ssy9/
	hK4jIftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgKk-000000002ig-2Apz;
	Thu, 12 Dec 2024 10:22:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgJf-000000002Tx-2AlB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:21:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434f1e5e77dso522735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733998866; x=1734603666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pzQGJmvH+r/yv9jwC3++jU/5AXa6EzZFVLdWoY0TuKk=;
        b=k1W5polHlKhN7YE4h3YM1ccfDpoNOgbpveTBSq2a3PqwG5+ZP9WPddpnjzpXr4lY8Z
         Jj0E+0OGh/+jzHStbywhX3UO9Ohmnocw5L8aQpIQuZhn9o9cR5hj7JO58R/OgfxtSihL
         eWe8oqMI8mFZkS0ux5/NsEncMeeZ5aKlaZ81JQtdAwi1//3JO9RKy/XlooT95G/+sODr
         DbGApPPScCsNKljl7GnEbKPcE6Uv2ER+FkatP/JtL4dZncudk0bWXJpRiWFJF64HYzWS
         ItgCkpTUIGJpQBYUyMjA4hrKImc9adYu9jeVn5KXT0sLpl590n45y8cKulT/Cg37Cx1c
         l8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998866; x=1734603666;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzQGJmvH+r/yv9jwC3++jU/5AXa6EzZFVLdWoY0TuKk=;
        b=ZNRtTAolq+x1pQOnXStY7YEuiIIdeGAshZ/IPWa/ioyL4DVPEsJzPy5RtuiI9l12We
         a3CsJcYXoR7rXacpahQvs5Eb32j8zUZMVl4SD/U34JDPiKwOQqAp9zEQkRWv5exUsjNI
         CzevcCwswTHWO1yik4wt7FdZBeSUer3N2xUbOUPrWlfpnIcGzgxVA93PIAcSsweIlWvJ
         FPCR4PcgaynNI4DaFqihwwJMQaPhR215yHfWJyo8+aDuTQVdCgKOmtrliTI3zcR4+/zz
         Y90dKRA1scDs1DUSs11ooBvpJCJBxE5HzZtN7WRA+RppVDQEBP1CQxMKt8ZAbjC/ZGcP
         783Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt38JjMcB34cQKwWgVn5A6j1eOhybwcnEv2TRykYsy0rX5aZOVe4OlnsfHJJLg/dGQADenHZ3Pp+2eKTYc9acw@lists.infradead.org
X-Gm-Message-State: AOJu0YyNrbC4kPty8yntZxYPrpDNQ0nO6BnlykdPZHg5o5Wh2qXxm9lG
	8BdiuALFahHM5MwkEITidGwogH33EcoYwbugnA0KDaST7lMblS19PL2dy7I9jtQ=
X-Gm-Gg: ASbGncsYqLud3JiShb/mFbiorx1XDVFhAJToSeP/mjlvngwmQ2NyPyzDEU6RwEAxWhv
	0SNpUg81YIjg8D2dU7kL3XlcLnyTxyOkbBNG0ifZwCvYxQBLeAZjcc7+CU/NdxsCFDCmH1ArlFI
	ZI9sjQbMVgolBcB3ZY89arLygo3mUKZzQf7tCl+GRUcTa4qdVZeR3g6yqWs9sGzHi80/1xsI1Bh
	oB8n6G0COLXZNdQt/4YqkNiJOQkP8EmRXN6fGk8pDbJ609Y6j/v87QBI7J1420cS6stG1KVnNRU
X-Google-Smtp-Source: AGHT+IE7Wr1brjnYyJz+kx//UHL05ClFVdjQfpqxjAH8jEHL7klZAmd+vx/9Vm0jtpTbsqjpVqsz8Q==
X-Received: by 2002:a05:600c:4450:b0:432:dc5a:b301 with SMTP id 5b1f17b1804b1-4361c41832amr17669115e9.8.1733998866012;
        Thu, 12 Dec 2024 02:21:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c6cdsm12094055e9.15.2024.12.12.02.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:21:05 -0800 (PST)
Message-ID: <c6ac74d3-d3b5-44d3-bb12-8965034dbb15@linaro.org>
Date: Thu, 12 Dec 2024 11:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mfd: syscon: Fix race in device_node_get_regmap()
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Pankaj Dubey <pankaj.dubey@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org>
 <20241211-syscon-fixes-v1-1-b5ac8c219e96@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241211-syscon-fixes-v1-1-b5ac8c219e96@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_022107_619424_9E687E33 
X-CRM114-Status: GOOD (  12.15  )
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

On 11/12/2024 21:57, Rob Herring (Arm) wrote:
> It is possible for multiple, simultaneous callers calling
> device_node_get_regmap() with the same node to fail to find an entry in
> the syscon_list. There is a period of time while the first caller is
> calling of_syscon_register() that subsequent callers also fail to find
> an entry in the syscon_list and then call of_syscon_register() a second
> time.
> 
> Fix this by keeping the lock held until after of_syscon_register()
> completes and adds the node to syscon_list. Convert the spinlock to a
> mutex as many of the functions called in of_syscon_register() may sleep.
> 
> Fixes: bdb0066df96e ("mfd: syscon: Decouple syscon interface from platform devices")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Tested on arm64: Qualcomm SM8450
Tested on armv7: Exynos5422

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

