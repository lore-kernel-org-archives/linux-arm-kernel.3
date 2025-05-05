Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E17CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 05:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=; b=ThFcLKWwC5IrG+BAoTfPoJIz6Y
	t9SdqztpYUwrk8PECf/zduxZVMaD9UDUeP1cIlTVvD3kSAxSO1ew0r/3udsnfs8PsTzth50I49kmD
	ORMYQNiWFdMTRm4T175P+9ZbBv4GXbQacShFWomhr1Vw2OUkqkzVyPpUoIfUXDaTnXa665K2/czzf
	qQRB7zQ3AEr6+I+vPtNnyP0GoAGiTAs2Qd3O8NxwwUiYDJ/YdKkGqML8FZ05ESKlNeh59wZLMLG37
	mPJ/BU3JknC9iglGhIlXTiuKkX8lpWJ4fSCJwWm3fl6Tc1Ck8EXd7Ie+7Dj/hGPtW1WJgPjnBaE9S
	+cvvmfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoWX-00000006SAL-1Lfu;
	Mon, 05 May 2025 05:37:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoUV-00000006RzS-3pD0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 05:35:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-391342fc0b5so2313298f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 22:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746423346; x=1747028146; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=;
        b=B5HSxdmzRQwGno9mNLD52HutNIlCmMO66qG9lSmvKA8Qf8iaYb/I+WrkE0RjMdK8q6
         acBqdv1jDJZFHsFJiFabLqGJ+FINZIi9A4pq8Weu/eUrz6bB8M/PDYsLmFERoSSPNuSh
         swUO1ZeSh5ehCO0+edwlYipXHYLdWk08PY7qKAwJ8Hy8TFX/RYCW5ttAQbG6Jz6wxR7l
         IJ4zViwo93V3SdpH1a72bXHs9B6yXJe7x/mlWCH/3Y0pKixMdCerfi5jpfTjUB3evhD5
         vijfH8RQeDOqOCqojV/P20cBwh5L/SiihOjt6KHrJcgOoZVXIAxLuy+xCjHW/rBdL9z/
         U4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746423346; x=1747028146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=;
        b=XEnb6BLU+FhZFvl+52PHV/xd8Ub1md9jPHHyMt8RucJsBPte6gIH2z+6uu8sDxulK1
         DL+yHO7clrTwVU1E4qlWJDfHlHU+Ji6zo0t/E8OqRxFKfz2tD30StN0QYnRXOusO5YO1
         idNQJtqONpsHv9NnATNxgvIK8fUcKzWpfGB+UMmxg8E0+eGZqAq/OyHuJG+EOWa0+ZYP
         UJfbpssa/TVbJbQ6UYU1XALLBL/RcKVycKmfKYNadgFh7pN8yakiwi9EUADLOQr7iISL
         NKh84mFHj7M5kRvQOFOYNt5P5CdFzUatWkToxht2dgr8h0MLM9JjqMHVv/TKZE4eUFGP
         iXuw==
X-Forwarded-Encrypted: i=1; AJvYcCX/PbD2rFo/k4vzsHgeHFsxEZmkozlR+sPKhm4P9XYngPSEtNg4H4qfvJEfmDSysExkB+6BsW+o0QyU0XaVzDYd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlfx4psi80IWRQcDZrRjFHDuGXv+A/n1Lcd/FlQjsgKcebtEgD
	71tjwcoke1dCqaxrbN6y4fYgK3tUpkpCjVO3pdNUpeNNclX5VAeEaCpwYUL7t5c=
X-Gm-Gg: ASbGncv7EIikCJuwHuUhoYDq6IuX7zpj2LG+TbTaseKUZ079v/jozPBShKWK1yFZlEA
	y/+MNU3XpTvGW5szCXJch3DFyTQbo1GdCeb738um9+V0m6bqvYf/VV22M5GpmS3H5PqkUVN+Igf
	NvaZVryejAmglzdN7j06b7hCwaKRi+w/xzZ6Cz5pJPkanOfQ15+43kcuCc/VgWLlJk7h8r/BD24
	4qkePrszVsWK9R+rtN3oP/VaHuexlaMr+toDiZiuTvuacOc63CKX1L5rsqiYcyvbQ4KJIE1GUtz
	jNp3aiXP4aVWOBNqtTGlYOxxmSlnFM796jbt/C2PyXYrXyUMuo3GtvCyBxrLymptR9eAPuFwEH1
	lt/vy
X-Google-Smtp-Source: AGHT+IF9Cgs7u7g3N65e59enpUAXh9IV5tRS5n72PCqZAt3FK4OAibdOBXfsQEdn8nqmP06W58BwVw==
X-Received: by 2002:a05:6000:4285:b0:39c:16a0:fef4 with SMTP id ffacd0b85a97d-3a09fd770a6mr3798232f8f.24.1746423345714;
        Sun, 04 May 2025 22:35:45 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a099b172a8sm9361125f8f.91.2025.05.04.22.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 22:35:45 -0700 (PDT)
Message-ID: <c3a3ab95-0129-4cae-9494-817d7e2b49be@linaro.org>
Date: Mon, 5 May 2025 07:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: remove unused
 lvts_debugfs_exit
To: Arnd Bergmann <arnd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Julien Panis <jpanis@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>, Colin Ian King
 <colin.i.king@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250505052502.1812867-1-arnd@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250505052502.1812867-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_223547_942884_0FF10262 
X-CRM114-Status: UNSURE (   9.90  )
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

On 05/05/2025 07:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When debugfs is disabled, the function has no reference any more:
> 
> drivers/thermal/mediatek/lvts_thermal.c:266:13: error: 'lvts_debugfs_exit' defined but not used [-Werror=unused-function]
>    266 | static void lvts_debugfs_exit(struct lvts_domain *lvts_td) { }
>        |             ^~~~~~~~~~~~~~~~~
> 
> Fixes: ef280c17a840 ("thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

