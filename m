Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1F4CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p88yqRzBtcIHaHKazkQdIPEyby4tpYcGRuIGuiev+70=; b=yFrAI0c3ejVs0hBc0dT+YSmRCg
	0wPF01YUQpVdi7X18/27k9xH/Vdnzk3Wp8wX3cG/GrYxmw3U4t4k9GnVle9zs5PymTKoKqwbbzCYp
	RrrLi+tBMDL22TWmZqCzbeYvlULYOOchz3maI7a2oZuXfwtW2Kn+Xf8qTAUhpsB1WP43sWtM+NA/c
	0MT87KbcMjNiEXv3mK2aYAikZ1xEQ96LRTxkXjAzSTMhrs8V3wG20StWidkgQUi56qY1CM0lityZG
	lsTE/0rhzZq6V7Mc+FNE/9z25CVGBGEb39eao66v8oPP03MfZ+Vox4Vvn5w0nZZDYM3lUoXPupewy
	fMbr7qPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxGy-0000000DOHb-3lu4;
	Sat, 03 Oct 2026 10:47:20 +0000
Received: from mail-ed2-x2b.google.com ([2a00:1450:4864:33::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxGw-0000000DOGO-04Pk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 10:47:19 +0000
Received: by mail-ed2-x2b.google.com with SMTP id 4fb4d7f45d1cf-6ae19959791so308967a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024436; x=1791629236; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p88yqRzBtcIHaHKazkQdIPEyby4tpYcGRuIGuiev+70=;
        b=yBX753/gPtSFPZnV0EqrLF1CIc0JRybHe/oJa5eCdvRjFY9yu4ht0pkXE0jJ3jZruD
         bBQoQJxjpOPhZUzaNay+2yXs8dDQSN7NDbfkIGIZRy2zM6CjydXsNcGv+F2wXYW+6A+1
         Jf0CvGMfDn69/v4qd93j/MDvf9oOLfe+7Ojr7JrG4SJkrM6Pl0afk6L2ArubDjJspkoq
         urL9oNkZ0vjvAJGxBfhfWDdyIjEFxW1uLRcxJ2vxwqQagVVFwyWUiPjidd1BMzHCfAtB
         Yvr8yMB2rGAbcADk5ld2Gmk9sthOJEdrWnezJ8k7Hw/o+Y9KK47mxnAPWfLfmeUWAGKT
         lLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024436; x=1791629236;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p88yqRzBtcIHaHKazkQdIPEyby4tpYcGRuIGuiev+70=;
        b=nM6dEkoIGpKN0Ym+M30MtbFmMKT+7JQO4cADDhQqDH4cM4Jxwm4G66kKjP+lq9ftn2
         PrRTX/Pf7Oz2Xe7lDQZn3RlKna7Yn+kJcUQWJc/1KKLiAZD04XT2EFN6u2/p5Zt604ka
         0Nazg+CJPllE/vqGlHa4hZM74HmoiaLt1Ew7xXmW6l5yv9/wbofEnuVHyo5ysh7VB1BX
         OZwvjBH7y0pkFPyMw6k2YrXR2wHU3qzDJDo+JuKeb2Z+gglQnjQrvKiNrwpUXBQxGEjL
         Pk7q9zUE1gxVdh2CPa8+KYJUukNzY8bwlNHm+e7RvHrrYkFR0bfz0UYYNn8sBsqrnmI5
         Wg7w==
X-Forwarded-Encrypted: i=1; AKwUvBy7l92Jj3Ttk8IQ3aRFwSJiJyJ5Q7HClo+oiEt+DlnAnIPnC5JoS75M7HnEOpyvT02JpUR0BQ85w8FQ55HrovHI@lists.infradead.org
X-Gm-Message-State: AFuF++kU/Pp6j/kpnARXvqdOS8jJLdZBy7eoXwYVj9sy/SiNPUx7daaS
	1+uXPbCggHLKWbYVGnEhA6tK6EwbVeshFWnbLuPMFE/nNhvzI0vbMadM16vlk38uaWs=
X-Gm-Gg: AYBFou2zJbZrxg1iFyqRGvr7sw9YKq59K91NgXUqnXnvNEXZTmqEAslkCT6KljJnIhQ
	vXbCkyDo+kEj1bjrzPpf6DqrKkAF/AX1xSBANgvkab0QXwc1gp254YnA8ViKCvQVDX41v1JR228
	dhz2qBxMLgUo2IMdEy3bZPgTZyAZM1vAozA7jInsNi7wrFJ8c25/L2Ej8rjrnnu39fA7wp9venn
	6VVNVvgEB4Z9muI2qNrk/P2yy8VUdvo2Au2SFdA+MboJyss41hIN6I/GdsNty4kUIraC9XZhTLk
	ta5o6XZVxCEkLNMq8/rw4hiSC5HA61Bupwvcy/krIBFvL/mE1fGeWzcgG+LFnszBwKHcTZFAPbU
	lQ99RUEJ3nQtNk8AvjuzaI/sJ+1AH4/ZqBqFtKyG5/cb4ncUAmPB3NB9NzXHBEH0+Gyzkl3Z6dj
	q328MP4s9bzRwLHQ9sgYR/Cjmm4u9wrI9C/DE1chLAha1ZgIuRj2K6pkzCyjEGEskYDYbm6vq8O
	FPxL8VX3T/9
X-Received: by 2002:a17:907:7292:b0:c29:f0a4:a4f8 with SMTP id a640c23a62f3a-c2e4a6a1e60mr460884166b.0.1791024436000;
        Sat, 03 Oct 2026 03:47:16 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm192867866b.42.2026.10.03.03.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:47:15 -0700 (PDT)
Message-ID: <27eea513-dbab-46c6-a1bb-8d9817f39ae9@linaro.org>
Date: Sat, 3 Oct 2026 11:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3576 variant
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <6HuMsILf2j8sOpHhyUAGmHbTeavDsa4sI8LzGK1bRrT-XdkhCbQBfa3ytLaMUPaXjfPyHA_3DGWmAaaAbS1tsw==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-3-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-3-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_034718_059022_FEF8769E 
X-CRM114-Status: UNSURE (   9.28  )
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

On 15/09/2026 11:42, Amin Gattout wrote:
> The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
> phy-rockchip-inno-csidphy driver, but they need their own driver data:
> as on RK3588 the GRF control bits live in a dedicated CSI-DPHY GRF at
> offset 0x0, while each PHY instance only has an APB reset line, as on
> RK3568.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

