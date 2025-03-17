Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A77C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuHbh4MYV3gTJ0X4cZQ8+nBi40Q4Lk1nrGFJC9SvTOQ=; b=fBT3fWaYTuhC9kl5lN8em/E9ok
	EDA9RliHM4pWTQYgX89YIHx949nRakcHVGSW/zlVnsmcWiQBclifeOpxUC508BmmvzwCKtnooCw8r
	V+y8NSNvYPOrRI+W/2e+6j+qfKlAz9bV76CPQLA07whfjZ/q+LNUdFwbN2YUqWHkd/iPXNpSKCpRw
	jiAELrO94Ygu5jLbcMAmZQxgvxdnxgl923pfl0DTl0VaSo9td1vFWZCEH2padnucM9Z0Jwhz0wk3A
	KuzygeWhcWekgEhun22sTvO2fYYXC7GoWwPj3DXffGdR80MPRKXYlXdaavI529a8ZMZN32AuHoIPn
	IFvVtxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD1j-00000003H9Y-2fRf;
	Mon, 17 Mar 2025 16:09:19 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCzy-00000003Gje-2GCv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:07:32 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2c7a367d9so77221466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742227648; x=1742832448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UuHbh4MYV3gTJ0X4cZQ8+nBi40Q4Lk1nrGFJC9SvTOQ=;
        b=oKKf3iAWl0mQw4syTl+lbhAK6ssKYUBmBbISNraUEDYqxiszSzFH+HBE2iLawiO3pB
         VAmIMZpOPc6xxGzHe+iomHWNj1aQIjRtKHNGSiXzmiW9cAJu0yU6iMgTmcCld6ROkNzP
         btW4mTjzhJaeh+VlFia/8kskvzDog3SDManMc5X/I2rR8NeF5yQYgXZ49OfGFN862Vsg
         kbN8zV6Vr4w4NQCvySgXd5Cm0fm7l1q7biDOQAE5OnTgtPB+MC2I7e8a9zUhzePSa2+X
         odfA9GThoY06dtXk8QJ7eQQqrSNSRpS0srQ9jdT2+8tqj97WWPASu9LN3ItMqTPW+zvs
         /2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227648; x=1742832448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuHbh4MYV3gTJ0X4cZQ8+nBi40Q4Lk1nrGFJC9SvTOQ=;
        b=iK1NW/dV7g6XBHxNiX+Pb52gBNyX4T5c+t01WLO0ZixTutce4a2dHFMlv8jsgXQz3T
         S3OEWbukIkgnnD2DGY69Sx17ku3JjrEgXs2QdR9nK0wEmD39FejGWwD1zBHYn+OcOYWx
         7out+mHniIM2StfyeEgpAA0jVtseWRkhyu0oBeG+CiViZmvMEtI1+nMioWvzZ3xHACLo
         u60AcKSQfZ3zfsPXVoV9MozWy/8czMxTuUG7D7cNlixtcx68D7uKRcbIqqYOSSQlO1k2
         zAOQjgufxjScxyz4CTNTRPpWuI+IbghEnopYaizyAy4Xk3YSyN52r2O9uXgnTHTW2u3n
         hJDg==
X-Forwarded-Encrypted: i=1; AJvYcCUM+Sx92qKVaBK8dJNmboW9FxcA25AWPfhE5lDxCfBRF1yHMT5rjj9XShfqOMWWufn+sEF/uyccZDgdKiSZH0vy@lists.infradead.org
X-Gm-Message-State: AOJu0YwfSIJSTu7q+m9sa6O5UDgNjbkUztvWYwPbK4/4lv+KcrcyLrJL
	R7SphQYLQOw80zsbxULrnVO8QvIs8wof1jfVHps8oMs+RWAenBv56lOej3wqXdlqserLpk7Odo9
	+
X-Gm-Gg: ASbGnctvM1tg0cTiXovNHst4nLsDKcQw0nJB+6VqZ8GdhyfiZXecyUu0A87qlichq3C
	3UxZwlVCsvztJIA+KHUFvhblsr2cQeXbUENZLw1uVmYgeBuNKMHIvz/979Kv6fh//d03h/dOWiy
	b3bvT0emrvF8Yw/qJW+yPqkN8ZV+8ZtVgNXstrZx+H/eQWHPv9IxcxHoVhIDAwk8Daf6QwwfhES
	zRHCDGNviE7ceCurtDTxjPDPuUJ3pPgFSDiEGQlUCjgRYVJlB7/NTarVH7iYiEyLdvjRVYEZ57C
	YhXOEdjV0+bilufLpse7MgV2adEcEG4NeMCgt5INur80O1VFd5w5ufRyRXXtCb4=
X-Google-Smtp-Source: AGHT+IEUcabQmU7N1TkMij7G556EuNjnPQ9Y37gUtsBadxWZgY7a5v7ADjlBJypctwLLzxgaf83Hgw==
X-Received: by 2002:a17:907:ec8c:b0:ac3:79ed:7bf0 with SMTP id a640c23a62f3a-ac379ed7c5amr119005866b.0.1742227648257;
        Mon, 17 Mar 2025 09:07:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac31484b234sm684404066b.77.2025.03.17.09.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:07:27 -0700 (PDT)
Message-ID: <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
Date: Mon, 17 Mar 2025 17:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>, shawnguo@kernel.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090730_594591_9362B4B3 
X-CRM114-Status: UNSURE (   9.03  )
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

On 17/03/2025 09:47, Alberto Merciai wrote:
> While playing with linux-next and imx93-11x11-evk via NFS and TFTP
> I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
> not builtin then the I was not able to reach userland. 
> 
> The following configs were needed to reach my goal:
> CONFIG_DWMAC_IMX8=y
> CONFIG_STMMAC_ETH=y
> CONFIG_NVMEM_IMX_OCOTP_ELE=y
> 
> is that something expected?

You mean they are disabled or you just did not put them inside your
initramfs?

Best regards,
Krzysztof

