Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EA1C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF1UtyMLzd/FNPDV0GABgsjA1Fxs5QvrOIcxO2UeUh0=; b=UFD/D9GPPW+1CIv6+wnI2e+tV6
	9oYKW5V0o3xWY/lHOQmd31bcWPWH1HAJ786ZoK8MPzbDsKp5kqmrLIEo4aET++OyYm3ZdS2Bk2i4n
	jLBy8ND32H5ZP589me10uFa6lH7i7xa1p8lwHYcw3H+0yp7rMHd44xXCRoKGufKEwPYxj43xe56Ru
	Q4nLvwkrVm5nZabaJquYJ1aa3UOnaTlljrx8sSys1453ILlei7A2xEeake2jJzhmbJITyRCguozjI
	EVx4O5UDQrHhGEXfCS6N7x1yEzuYz/nAwqGjUl9lTqFs3Qvph8/7caXPwbZr1WWtOqfJxDocfAFWX
	BGEuRP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3ZF-00000006UMo-0GTZ;
	Tue, 11 Mar 2025 17:39:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Us-00000006ToK-0poy;
	Tue, 11 Mar 2025 17:34:31 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab78e6edb99so873467066b.2;
        Tue, 11 Mar 2025 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741714467; x=1742319267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uF1UtyMLzd/FNPDV0GABgsjA1Fxs5QvrOIcxO2UeUh0=;
        b=lFS4lpQ2hDXoinhTpA98AjRtCjEnXL0q71yVcpOJl0CTAKeXBwUGvSnpDwpS7ZIEr/
         zkJt5GmAY9sMRUz07L9vCJRy7qxGYpmCLpQxyoI6ye5BO0kGcvBk8mQ9Ee35tx9fa8fJ
         B9PmcfYRXgGdgZH/sCzMxb6QTHm3kxEKgoCnjbe2yHtbm5iP0T+wfXvZ5joRM+kM/Fny
         7Aj8PvmRXmu7367+YIE8pANquZCfyjru87LOBNglEzsnDmDAJ0JH+jSEGLanU0sPc0/v
         vkO4mTzjdteA36LTiROsl3eadvZ1fzkrNYuDQ6wAZISX0d7mYCZ1BkJsOSZyH5JIBuO+
         SyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741714467; x=1742319267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uF1UtyMLzd/FNPDV0GABgsjA1Fxs5QvrOIcxO2UeUh0=;
        b=sxgatCFwX6f3fWagYHTD2VAsv5HftPl/jsizJgdZXQ8ZQfjaXRBXfx/sl+mCQzknPu
         65vbe+AeurO1zBKoUvwPHo3w+onf0Dk9ZzTT6bjWCnsY2FB9pJ3jlWlloVFFhySwTNXi
         YrvR5+SE7ftubXSWCT0k/WaJiUKwoFJGb1XJgxD2E2vr9N3ThlzH3EbgtUsOV8jev3Wu
         hN5wD3jZ+lVSumTC5HBrB30iqaUucv35S6j6rMqT5YdfMxXnKylJUAkUsU3O/fgfRn1d
         Rz7x3vj0lBHIjfu2TpmXvT65G1dB6z25FpvTHkpn8FjhZaCtfFh8vfQZMKbBnLLeD9ff
         fCYA==
X-Forwarded-Encrypted: i=1; AJvYcCWnYiilENFK89R9VyJIwp53D6uzuwK2ooQTxUqXn/sWshhx47WuKfnlWF1Gv8pQ6LnAUrExhBhRZdshqnOTzPPQpw==@lists.infradead.org, AJvYcCXBJdOcF6M0+FVhHTKzEIzjgAyTedE57lVUgv+WHDE7i9jnltm8ju1RFnOfEJ8C2tuDAEmvZvey0Xcz+iKYokXW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv9vPkcHd1lOdZyhR/X+RRiI0S6fK+fPXSi5NtXLSCB1C1DzBa
	eR7k1WnXPrCztXwxgtp4jutvoyvmakn03mrNd8cm/2vQalX1StiU
X-Gm-Gg: ASbGnctoHi9+YK1jm9NncZYyuQ+MNCn3qy/UOhAMGHYgZx1hzRTegJNNu97VsL4uheo
	cEJ43ZuHTj6g4MvsCB25AUYLsZdIXVdORFhJvR5A3/tASoIXGPFdLh919CUjRNlzx5ez0oZegCv
	XMIBXb57gPL1qPo71NKo1Qg3AvxSIfNVOJL6YjJ5TH1e1l7BDrI2X8WZME1L4rh+LcKQvwtatQR
	N6tKDH5F7V+ND7Tt36GlxAh72OH0BXy9L0CLLVoDGQKLYZPTBcR5t9UKRGq7pS42EWhowsgWuGU
	d7InnA+kxurE/BeMcQ40klgIjkm57cAnBQj6Y+Ov2WThUeVauTVBkq5I4Vfcw8Y1F5KQEps5ZwG
	lIkyYr4temmGIQe8qsKM9yQ==
X-Google-Smtp-Source: AGHT+IF1cEXKSEStwKqwH/g7+VlE7YBwRrOlCvluK30s9+aYFAfsg1dGkVTnUYOyp9nlYt++njiE0Q==
X-Received: by 2002:a17:907:970d:b0:ac2:b9c8:b7ba with SMTP id a640c23a62f3a-ac2b9c8b83cmr642529266b.10.1741714467029;
        Tue, 11 Mar 2025 10:34:27 -0700 (PDT)
Received: from [192.168.50.244] (83.11.221.132.ipv4.supernova.orange.pl. [83.11.221.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac282c69e89sm540028866b.167.2025.03.11.10.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 10:34:26 -0700 (PDT)
Message-ID: <8b8b9074-8828-4477-93e0-32be63688d05@gmail.com>
Date: Tue, 11 Mar 2025 18:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] pinctrl: bcm281xx: Add missing assignment in
 bcm21664_pinctrl_lock_all()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_103430_239357_ED8EAEF9 
X-CRM114-Status: UNSURE (   8.27  )
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

On 10.03.2025 11:48, Dan Carpenter wrote:
> The next line checks if this regmap_write() failed, but it doesn't
> work because the assignment was accidentally left out.  Add the
> assignment.
> 
> Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Artur Weber <aweber.kernel@gmail.com>

Best regards
Artur

