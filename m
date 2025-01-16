Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A07E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 04:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOWmyxksIGQ0wwOhQFWR2aE2r3LuQkCrmyY8eIZP3Dc=; b=KYZziJXPz7hS+ffDsh9KOgLvDL
	2dhOque18FlmXNUsAdCS2DZ+HKS9B3jeBmE7LeK2K1D7KqW8DwtDAi5B7jYhbZ5D/aOL12vnzaJfe
	AP5ZUyIZqwkPuC7hILZY5y+mI8ruwVjhAfmORW9fNZieYnse0VQefzOAX9cTwQAKwg81rJTKPTCjN
	XSoiy9z5d9TFUdQdf2/oQQ81vngjRXchvF4xLjq0G31sNkoRH4SVBVhiS2XpK5ClCWGLn2bjVuAiZ
	K6K7vkMZPpiSCWfHVPtIMIDXPd7Y9chnLflMUp2FgVj7s3mmyVNNUmmMumrsg/F1B55RurNd6jlKw
	LsF/rXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHsn-0000000Dpa7-1EeS;
	Thu, 16 Jan 2025 04:53:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHrX-0000000DpUN-1WT7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 04:52:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2165cb60719so7328395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 20:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737003130; x=1737607930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOWmyxksIGQ0wwOhQFWR2aE2r3LuQkCrmyY8eIZP3Dc=;
        b=NeItmDZFlDmCCTgAqAwdyOF9CjmPnHJHUEH2ls9tYxpWdSVB5x5mxGVA9Bd71o217X
         oUKLrimZjPxaFFcqtQulpAFV+EEophbi2V9s4Bahy3unxF+uGKQA8B/W/EREL173SFHd
         4eoVFJXnRadxO1MRTU9lxpX91S6y006KxAel9aTUUIlEg/y+lQbe/fFrto15KSMUvSWY
         4L7Zkku/ao2z/3huZVrNEmPy0Xyxap2nHDHU8XUucM6hDv+KKqFcq1cxHl/Wiyg2REGL
         LyQPS5eaKSh/WOgfMhZqk2sB8TKyPz2C3BRhdem8WMx/2ilKgS97voWN+r1n8Pd4lSeQ
         46sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737003130; x=1737607930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOWmyxksIGQ0wwOhQFWR2aE2r3LuQkCrmyY8eIZP3Dc=;
        b=Hj/QoArlWjXMo3wdxectSf0IkUmHa7Q16prNgHpFolJVXpNGpKhvy9muJnZvyW9XB4
         D3j2U7sgPOnnF2pUkaObdhmcpLntIVHeOrbp5sWrR++f1VWOArjIxpb/PRtcAZ6akWmn
         zo+oR626/oa73HpyLb478IJlyoLbTLqnW5Y+mzEv11LD6VZrDz6eQUepCzhwJwKrJOba
         ee5oVxy2zUniu2HDsO0nYpqtE9B/ARWCZ0G+rzYIpcMlRJgeiqB+zvnQxzYOxBsKoz41
         Y3+yNkh4trtixv+nXTY07M7pBSOthASu9hPQhBSwNvVxVsqnZrmDNJjD96fXx84eF09W
         JlXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiWwu2hFoUYHmhay1/lbar2IBfw9xoX6qbDX1b8IGoNOn/Q22JcIIXhDJ8ER28OWtWy7RclupPblKI7cDZDXMp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq9UlfURYd7NKgmRvxSQQYM9LiPdCAd+Rbf2yXUbBZJRfbbFzg
	dloNpW1F2ZLahg8HLZaLQ6tACiWHUQ4efgritHQFim7TFxhQkkwwzZ58Pii82nk=
X-Gm-Gg: ASbGncuD++E0vqy7VBHQGE5mkKYqIE8IIGNS4kquUq4a7NQYjS02vfYF53WuT16iS7b
	Pzp9kT9DxR8ZrHB2wgb9BACWnb/D3oSOENh+6d4rfmjsNSrLYisQyIpdD23KPpTCd5Jg320TGNS
	2zTMDXrVp8rXbmx9LpppVatBoiI2rDnYxue2p54+D9Zfm7xt7X3HSMsbhqmlii4OlxoUXQYQ0ti
	jxQGLgA6TJq/zEeJKQEUDsc8AAozwi5AU/Ybfv+gufEc0swuVdB3ZEOUlJyl8Fde3P00Nk=
X-Google-Smtp-Source: AGHT+IFdClh55M2sh3NGGkRxPih7LhmCsVDPwH4rFFOPzqgi1cC12kO5lb+ICakqsGCKRHcDhEzKVA==
X-Received: by 2002:a17:902:c411:b0:216:2bd7:1c49 with SMTP id d9443c01a7336-21a83f64abemr481766055ad.29.1737003130537;
        Wed, 15 Jan 2025 20:52:10 -0800 (PST)
Received: from [157.82.204.145] ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f13c92dsm89358035ad.97.2025.01.15.20.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 20:52:10 -0800 (PST)
Message-ID: <05f32e33-8cf7-4c23-bbcd-aaed0c7aa02b@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 16 Jan 2025 13:52:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: hisi-spmi-controller: Drop duplicated OF node
 assignment in spmi_controller_probe()
To: mchehab+huawei@kernel.org, sboyd@kernel.org
Cc: konradybcio@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, marijn.suijten@somainline.org,
 bjorn.andersson@oss.qualcomm.com, abel.vesa@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_205211_393503_1B3008E8 
X-CRM114-Status: GOOD (  15.33  )
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



On 1/16/25 13:47, Joe Hattori wrote:
> spmi_controller_probe() assigns a parent device and an OF node to an
> SPMI controller. However, the operations are not needed as they are
> already assigned in spmi_controller_alloc(). Thus, remove the duplicated
> assignments. An unnecessary OF node reference acquisition is also
> dropped by this patch.
> 
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>est,
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> ---
>   drivers/spmi/hisi-spmi-controller.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
> index 3cafdf22c909..122140b97579 100644
> --- a/drivers/spmi/hisi-spmi-controller.c
> +++ b/drivers/spmi/hisi-spmi-controller.c
> @@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
>   
>   	spin_lock_init(&spmi_controller->lock);
>   
> -	ctrl->dev.parent = pdev->dev.parent;
> -	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
> -
>   	/* Callbacks */
>   	ctrl->read_cmd = spmi_read_cmd;
>   	ctrl->write_cmd = spmi_write_cmd;

Kindly disregard this patch since I forgot to CC 
linux-kernel@vger.kernel.org. The new patch can be found at
https://lore.kernel.org/all/20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp/

Best,
Joe

