Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03601C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvPPPRDaspsoA4k2Dj6ph9FjCMOMwv56adQmuxz0BxQ=; b=x30FVOqyda79U2QTfpJycaM+hG
	SbnboBY1QoeY2xuSk23tmPmSu98KpFuAgFlirkuyh4ojhkt1owJ+Y6hKgxXdbyvovEKoAgiVCo72z
	d5aCxsvbAovbFhmncxlyWT1+1o6x6hOqH/mjLeJXp4qopwcrs0B71Vo289OAS2alfjPF0O8xNEFiq
	p2i3wpmLlDOBUUdXECsb3StgwSEWgDSqIje+7WrtaJXw4oxeoxqODjqJ9jZ3tGJP4++YmnQcmwIq4
	tFacmkh5WZx9vXnqfc3Zd+Ob0odpkBmcQxKPeuXLrQRoCIa3XgN85HOlorwkcedFOrBMco6n4QVyd
	V0hlJsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7jY-00000002A3t-2Fmv;
	Mon, 17 Mar 2025 10:30:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gG-000000028vN-0HqE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:26:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-399672634beso281296f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 03:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742207206; x=1742812006; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvPPPRDaspsoA4k2Dj6ph9FjCMOMwv56adQmuxz0BxQ=;
        b=i/1AWoeCb8Taenbtc7dGVRZFcP+84qKmBkhtsuwExUhEcRKVxNQYdRypRY4HWaWpiA
         6ka3glmNAeTYVXMlFMSnmmTA/ia5gVzo0+Ur5joVOmM0O4qh+NZfOZ+BWbgOmhp1Ol30
         1WTlf/TXpxYKdYtnC+77bDNa5UPgQB1lvdE7lh8RmOFgl1p0658Cc90/ggryHZ6M60co
         rUvW0kWF6Sh+XL/gIs4j3GAyxSdFk3BofjQuSq8LzZ3ThTaRQtMDrTeVm7lnflMuNs55
         AmE8WxThchKLFR1l/m5vgAARiyJbDw3MAaqksLKLw7lX1A8t9B9NtKO+Y/fEVFTgcP7b
         xXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207206; x=1742812006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvPPPRDaspsoA4k2Dj6ph9FjCMOMwv56adQmuxz0BxQ=;
        b=QBES7KHT0h5bx6QzSSefDhunYw4UE/YTHHePw0h4CKkRgmwlFJNMyCmkTgOTKpbOde
         jNlZ+0sv3HNfqeMx4ECbxlIxVXodmfswWZC72/1pAPEQRoO9fmhSunaXjZy/5m257VTB
         FqprGWJiqqhAJkHTfcsNkXW4nxdwI2dqw/bs6rK9v4jWj6UG5pBQNUhnA8z1uGcAjw3J
         EMHkzpvz/fQGZoP2alleW6D62zBWuTwiKRr7YrzK5BfseVszPZKzYFMeMxkwsx34S9CE
         6s1c5HsjC+mTwYf6eUrc2vavoZHijZfhe/bJ/cH8PVe515QuCWuAPfUi8Ve6FR1cSjEy
         PAOw==
X-Forwarded-Encrypted: i=1; AJvYcCX6B70GDODzouJZ/jgVooSkSbLnci8TEo/NjcbaBxw5EmNoYRkfK3slRxtA5cHOhkHx05zX1p/AtR5ydu40vL43@lists.infradead.org
X-Gm-Message-State: AOJu0YwuyZu0AOVWClIdzS/0xnCCl3Aj6Y5TX9DTjvi7DQeDV4igVg5m
	2djSA0/5J46xFKM4XT7VIG+/Ei5kAGMzZfLfJbrFF7YYHZ/M5ILWZyiLxjNApto=
X-Gm-Gg: ASbGncunKgnLWJFJkEZeZLhHFbLKflCAC/ZhgS0fCAR61UXdYU9Sg3s23mDWty+JiY6
	78MdiGbBDz02TK4i7kpUNjKOLfXvElLECisS/cygM6i87mPUAwPIhGpet9rlRsgTYBiAMIoB4CL
	S6cfgO83k3OL5fKWR0jvlMiIfY++aYXcAxV7SKnpL/UuQqp23P16igEUdaNOYHZ6Exzb2Y6ZEmC
	seC3Ir4P7ibkcKcjFEF3jJ5z7EckELrGUFET3CHfYM+AtGTVb9T8MiMu6GuClXrZEMFjSJk7ue4
	mcFaqaC1FQSfd6ldZPrq182AiYyxRfo/plSzHd6ziwKPSbTqJ6ajaIdOsTWRYe2/dKhOGR0HdB2
	+aRjv7ZUngSjfW5SuhXM=
X-Google-Smtp-Source: AGHT+IEl2lf5EodXDcMOp4zSumpDeUgpvHv7ZiCprUcc+z1261XnZYzYUr5LHoaWJbWt0CgfV/KCKA==
X-Received: by 2002:a05:6000:2cf:b0:390:f116:d220 with SMTP id ffacd0b85a97d-3971c97ba0cmr10611286f8f.17.1742207206352;
        Mon, 17 Mar 2025 03:26:46 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3506sm14950791f8f.11.2025.03.17.03.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:26:45 -0700 (PDT)
Message-ID: <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
Date: Mon, 17 Mar 2025 10:26:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error on
 boot
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032648_124999_4922D6B0 
X-CRM114-Status: UNSURE (   9.82  )
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



On 3/14/25 4:40 PM, André Draszik wrote:
> This driver emits error messages when client drivers are trying to get
> an interface handle to this driver here before this driver has
> completed _probe().
> 
> Given this driver returns -EPROBE_DEFER in that case, this is not an
> error and shouldn't be emitted to the log, so just remove them.
> 
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

