Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06BEE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1xLPBUzUotQ8W4dnkHC8pvofzpJw52qNUZu5+hvGuQ=; b=TmNNg3uMAC9HbzRZan8Lc/8zzO
	UmZAcrw2OaQ0qzeg2TKQUFxJV3UOIfEfW9vh1GhvfmwNB1UGEFjJITDkFaKZoljN05vv50UlexCCW
	/fLELsV46eH0/7pnvIGQ9Yi9BdfNvHQHpuBJMKpzER/Af5LxipBWrSH9zK0kQj0r+zMJXUXo0ZrsZ
	C/AUwBEYKrpgNJCQWMdXop6b+8eTG7nLywLSxMH/WtePR7vCVGHYlmk2FobwWFHt9QVPbxXIIZKwt
	rzIhIJ8nXcrDY4YL4AR6hDy2/qQ/U+KNIdjx+9TIzx6GH/g6sshByTYQ2VSXroMCLU9yPJPMzEj9J
	jklDAGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjid-0000000BhXR-09v8;
	Wed, 04 Dec 2024 07:22:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjhc-0000000BhNP-3P0A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 07:21:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4349fe119a8so7564305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 23:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733296899; x=1733901699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X1xLPBUzUotQ8W4dnkHC8pvofzpJw52qNUZu5+hvGuQ=;
        b=pBPd4vD6qHFkl/1kBIwO9drv/sPrSm1WcGYs9z9gpzAlEMDp64Bl66M8aJA6vfpCCv
         ahBTPybKYhN1tAaMHeNCFhLDbn5uv+SFrQnVdLz70xBpbl2ctlTyUIaLFP7lFcCNdc6N
         sHChPUxdfi4bQw/HsvTNVnelrMRhMlgfI/dpGgwQk7jYlEjdv5tBbHY090CsCsg7TmLW
         towLJmKFJ0vvC/alvOXzDwmkJqNXJpTcmrgZ02eoPArFTovNFSmqODaY6/gnGpQEGcrq
         5becc3jUhZk7XZltt8EONjbEYk+RLCe8X5cnkJkgcxxu7e6VdbZTs5nn6VujO5X1wCiY
         Rukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733296899; x=1733901699;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1xLPBUzUotQ8W4dnkHC8pvofzpJw52qNUZu5+hvGuQ=;
        b=viS119Trqb0BPT+Z2yjvxL+wNyfJML+jtI0W3021h71sCoFqFfeK9CevRwMfcAg9wc
         yfK86DJ9JJ68ulJVBoEl5N7/Mvhak8+frpMZuh/SVETGNoLMST+iwVtSEqMho+NGkAML
         KYzUgDqN2winmyydkHg6nXYH5JT+kbhvEooVN7/hO1RGwdDJAQ4AWdb13TKglkaZuSg3
         BzzxYVz8CZjkOLcq4n15lEa3FsgNZ6gIaF47gIwH1kjUNoyRtYM6DBR2ikHsgSMyv8nR
         +r5iWQwM+F4zdVZzc5DCT66FuhQkWdixX3AmgQLRpUZC1Qs09YfKBTxqmZci8hq4T7x+
         kgJw==
X-Forwarded-Encrypted: i=1; AJvYcCXLfjpGSmW+7/LJ6GS9E/cOybU88uSvQ7NXy+tKnsogPY0A90A5UfnsomjvMOC6QZwgSF8FWHVgFzP+0fPuF6af@lists.infradead.org
X-Gm-Message-State: AOJu0YyQtkLd1YYouLUTf1Pip1Nvf0EGl0xblCwf3CITjsWXgFTOOajh
	3WXHI7d/lq7eAqy6+0RnP6qSbJ0k0VJsGhsgeez4n6WFtQKCXssV1JvjxN4Glog=
X-Gm-Gg: ASbGnctmtgkAjbdVjPfFrtd8YmJeRKhcbnJPlOZKod6m6IpD03zga5zrT4LYmrCUWaU
	sNewQT8b7s1u7XrpRO4wltcHYYqRDcnjbE77nTFtRF7+mnNsc2H7RCA0BIVKkAP0kgC6l4cyckE
	hhOWgep5dQpk2w6dA6x5vUOO0PwM25RFM1X+Y74VHfGiBWJbVlAfPdTUtMgbRjKNEWLEYdRC1RF
	fLkBs8GXydVsz1DrBhyTR77rqLD7d0P0Z0TNolGL+hLu5P5LytrQvHg4TqP+K03Ex39cw==
X-Google-Smtp-Source: AGHT+IHtCdQ05BQDY20/LpYx6IfP8mgaeR10Q3ey/YZ+JByIUyxE2J/jobAU8fTKHzVmlAdPD/L43Q==
X-Received: by 2002:a05:600c:1ca2:b0:42c:b63d:df3 with SMTP id 5b1f17b1804b1-434d09055a8mr17717385e9.0.1733296898918;
        Tue, 03 Dec 2024 23:21:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52aa0b4sm13924315e9.35.2024.12.03.23.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 23:21:38 -0800 (PST)
Message-ID: <068c4e43-d64c-4f08-abff-675334e8f5e9@linaro.org>
Date: Wed, 4 Dec 2024 08:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: aspeed: Enable video engine for IBM System1
To: manojkiran.eda@gmail.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20241203-dts-system1-video-v1-1-008e5e660106@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241203-dts-system1-video-v1-1-008e5e660106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_232140_865188_212A0CA8 
X-CRM114-Status: UNSURE (   8.24  )
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

On 03/12/2024 14:22, Manojkiran Eda via B4 Relay wrote:
> From: Manojkiran Eda <manojkiran.eda@gmail.com>
> 
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Regardless of the
reason, process needs improvement: please CC correct address.

Best regards,
Krzysztof

