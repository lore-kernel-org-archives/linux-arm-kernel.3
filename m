Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B378E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=; b=SI/kGsU5ZoRwRDyUBtDZyGsCu7
	8Q1FO81aFdQwkCmdOeiKnMg5wdqFH+ZaTgb9XZ+9W7eKAf1i+dJG+G0yGma/+XzbyRSO0BfeHb0QI
	ftBKEdK47mNOLVcnwQtzUL7t89nGZbYHbx1/bjoK8I/fUfPmOy6SnpbjJkKu3c3r9fQOedObTeogz
	eF0EgveX2ABz21i0gFQ+TH9/mFp1d0hkOd2uOK2jMZSeT6u1K4mgWJc3kOM8vA74pPmAsPvvEVm/O
	+upGB5xWuwpgYk/UxflFygVK5iP0/yqaxdn5dZFPjmq7unMhVy0Td8vm9ErX/yEZ/1OIyLvqjQoMg
	sRHENO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpdJ-0000000BUg5-1o63;
	Thu, 09 Jan 2025 10:19:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpZt-0000000BTpx-0sHD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:15:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3862d161947so361901f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417748; x=1737022548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=;
        b=xZM2bn1aT293JLPqwr1ItfkJ6l57o1Mz+q8bHeNKguMrg6lZT6Ej1fD03uz0jAIHfE
         eaFRVeFYBhLn+SH4sL7xrw26e8JmIVi4q8pAwlKmRqWUr2a37x6XEw3FJ3c0PAyIfy9P
         qhZJnfbl+/+7zmCySF4tILnk4VVGjh54er3N/F4Wl/OU9lThr105FmXjDSTQ0cnevhUG
         eStkJlgzCA5ABA4wythj1VSHsixsqZYee5kiRNAI8cqoqpCydk0/sANNhDmgGSx9NaWL
         XOp+XrGVNJtnCyIqCvqXTNHs8iSj42ZvCRtEJDz7+zuhsUw2Gp+HD4Jp1/HRwksQxgNg
         mRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417748; x=1737022548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=;
        b=AQzP+MqnnOROn8l0Snk4ll4jS4lPONOohHsW2rAhObQ9wNHGOy1XxlHAo3ZplFBAhF
         0cpJJYS+Si4yBlq4RNsxGmTOZ5Z5jr9/6yX6cOiBzfivGNH7VdltSSWBrARFozWl3L0G
         15lH6rOAIBJi8NJfyJU3VcMjHIb/aHavkjHXn6YHL1skHydcasEuLw5BhLV7HUii4NmP
         GVUkf7+SM+vhQtjLhQQ7zK3WwSJvpsI3o24yYjkrpYxGEgSN5/NZf8WDKQa/VnH7OlFC
         m9Nnv6n3h09n4mJTVzO3JiqKHRVVaOzGeAYPxNzAhh9bECKJ8+vNJRvGbCN/rc5Coez6
         twNw==
X-Forwarded-Encrypted: i=1; AJvYcCXKYQu7DprGFqGVbWPbWk0xzrFAh/nIUPFIPM3lTYg5zdwdeMllUHOzhyn7XUAJcvJ7qJuXOlQ6s0SWNQqqfJWP@lists.infradead.org
X-Gm-Message-State: AOJu0YwwgZsAcoJu8aezhhwUFz6Uj/gmOshftc97kQFxpeNLPZvR1nC/
	zeqTHJyzYsFBMxnCJ1D7Ed1G3N6OBt1zV5Whx2fpWgFE/E+4iZUaetBKOsoO+vQ=
X-Gm-Gg: ASbGncuZ+zCIa5j2sAO1cPxFmXIsWNzcRAov3B7jAg5vU5fJB+5On9PlVvtzDkcNv1n
	hGhqMezpKU/hHANaNVprsiyHUHUPiSwPVbOPibZc31eqDPIgbc3z9GTLN5fWUVaXKmR8INID3I8
	zRDQ5nh4L7LoBJHbKI/hZVW7Y/YQ2LXbIiA/rW4dkeWrqDdiOVwk7fR/VC1FYf6praM+Rzhix/k
	BpWFF+ouF8BuIqQbfD/Q2THwQQGC6vDG9NW+JQ0jpb8Pe0wkbJADNoLElQDTfGoznur2KAaCGJ6
	9xKqSCInt0sFBu5Kln/mhxTjkQ==
X-Google-Smtp-Source: AGHT+IFDFX3nATWzt3JJXgsFxlH2455Ys5367JQMJFp3tUUCUzhjUi2qmO4yXeOxwH6ju4OueG0nOg==
X-Received: by 2002:adf:c08d:0:b0:38a:87cc:fb2c with SMTP id ffacd0b85a97d-38a87ccfc17mr3463841f8f.18.1736417747781;
        Thu, 09 Jan 2025 02:15:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e? ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e385026sm1389541f8f.42.2025.01.09.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:15:47 -0800 (PST)
Message-ID: <3506d2e1-d7b6-47f2-b2b7-edc208ad45f8@baylibre.com>
Date: Thu, 9 Jan 2025 11:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: mediatek: add display support for
 mt8365-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-7-3905f1e4b835@baylibre.com>
 <325c495b-8e5a-412f-9974-3ec7ab15b479@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <325c495b-8e5a-412f-9974-3ec7ab15b479@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_021549_258301_48CC95BD 
X-CRM114-Status: UNSURE (   7.09  )
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

Thanks, fixed for v6


On 09/01/2025 08:55, Krzysztof Kozlowski wrote:
> compatible is always, ALWAYS first.
> 
>> +		compatible = "ite,it66121";
> reg follows.

-- 
Regards,
Alexandre

