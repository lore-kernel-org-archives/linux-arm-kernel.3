Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C23C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1CTkcCN4mgvmc4O+/bwLsfd/yX/UppF+CPol8YE2Rk=; b=NCRQ+6S/60HuOPjf+43wgJjVqm
	41MYyY+VSVVuvzXkWrG8NyCv7q0Z15N3gXsHPwkP8vv5mF2yFXBXNqi86Rk5ucifBsljBimE6+iGs
	erRlIrVHP4kQXRNNTpyPjxzKgzZrIbxHC/XnNqU/nKBoBVbCMBkY0Kz+58lpex5mlXgL92dwSbjTR
	nGEes4tkgRhWze2lqLiNd309K/I/UACNA/01vpfZEox7BhyElo2strx4/ShwuGJ+tvPp5FtHzBP+R
	yzXXRNQMuD+TsW7DteDN19Iex1PblAgYgb3i7z03f3FoE7pb07zYJZULn1W1BmfE4q9nIj9n5nGEd
	2rt1mUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAqJ-00000001t3f-2zbt;
	Thu, 22 May 2025 18:40:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAkI-00000001sP7-3wsO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:34:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a36255d0f6so992955f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747938861; x=1748543661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1CTkcCN4mgvmc4O+/bwLsfd/yX/UppF+CPol8YE2Rk=;
        b=msWokAN2f6XFi5Yaff2u75Hm/hY1witwizqAEz/V9hV0wP86GdvMCZ7EagkR1A7Mmq
         seOlUWuAJDlMWPSkY908z+M7eRpxZ2s2I1EMEs0BvAxvUDGKCuXpcSdkOdJrXhllCKjD
         kfP59+OH2XqME1KymhdXUKUtTVUpi+qtOpqajLPnzZu3B9K1DGMR/r1LkMZmVABAHZx+
         Vd4ak/qXIkrBslhqEbM+1PF6RqM+nTYf5IbWKjyHlMBxGhXzzS7RntAm0iH3/G31wADg
         gDZiasHMBzdfv7jUeEZeFkiQqlr8OQYxoFFd+rHKlMWVk5cdEqVKr7tZhMfNKEOIM5J+
         7+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938861; x=1748543661;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1CTkcCN4mgvmc4O+/bwLsfd/yX/UppF+CPol8YE2Rk=;
        b=E7EzAueGeImuzbvLV7x81pgScMx0ELrUEJP7EagFb8oIzu8v9R+ipw9sTmnQ3sqyJ7
         pDIXGLz0RoBTdTdnCG5k5HWb6MoIs5tD6Nrj8KQ+339q1tLa0gqFh8dY7lRa0b27WRvT
         8FZQccnprxa2s0XphLCH4/5NIZ6oGqEEDx7uzmwXnf6WX3ESF+Fkv6lvZpjoyHgSIpgK
         w6WGhVhqGvcZaKeH9Lop1GtKAnRRjqRG4pchId8Dva/R4M87wUMBo3oH7aoWEURJ3YHu
         bFYk13410IBDe71KQyTKOdFJPtPQupa1LIyGpYAcY8qpetMZqJlQ/4xBPskTRWE1H1WF
         AWpA==
X-Forwarded-Encrypted: i=1; AJvYcCWUqkaXbo/YzAkkSoa7jAeNh0EjEGbC2E4gWLmkTofF8Q/BjnQUNhs3sOsI1UbrA4UySDg4KwIyOmjlxNstbeqC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz0AojM21o4BPBebkznicU5tvsemzvrn9BIiNXOcqbQA4ZlKW8
	eMOBRhv11QD8S9IWRlxrS22WxDClpNs2qpL7C+Ex05Pum6zV3+tGDRRU1JxhWN4paCw=
X-Gm-Gg: ASbGncs36nKHUyzYgJcGrSYmNQSXtPRIGPOqB7211pPFVCCPvDqrEYQ6uGzb3egxwFX
	kqQnwCTaFMAfxBjUxREIQmsoYcePnBXJq/iut1KflrNkgrYGQ3I5UjFBDJvCbRP3X/N7K7Gk2Ma
	kKn+KUE+gWFR/iAXCGEFGUE9MnGBjJwl0cL/3pxXKLsiCr418DuZehekqzq2Oi0zngvtnPzJckR
	u4lVgCiJrMcbeYirA5pIbbkSHaJc7UQuaOfTetpcilTsLGVRs17oNDNTjfMbg+5NHax8Mij6b3X
	AjBLHNzFHyQ6Lybqeq6WbjU6Z8FOCJlVqqEW9h23UrYxs8gDEIGXBWIdebL6z7JRIi2nK8sOnqy
	00jJO6w==
X-Google-Smtp-Source: AGHT+IFynnkis2LoFrPbbKd6EFHmR3CK/Wwm2NAwfY4u2siqRPzXLtZHj+YFawT3eXyBiVwktliX4w==
X-Received: by 2002:a05:600c:198d:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-442fd66dea4mr98494735e9.5.1747938861256;
        Thu, 22 May 2025 11:34:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3699a9bf3sm19018332f8f.54.2025.05.22.11.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:34:20 -0700 (PDT)
Message-ID: <5ebc399d-88f4-4d90-adcc-8c9b31efbd95@linaro.org>
Date: Thu, 22 May 2025 20:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: Do not enable MTK_SOCINFO by default
 during compile testing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
 <3e10ed93-dadb-4d0b-b419-28ea492a1603@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3e10ed93-dadb-4d0b-b419-28ea492a1603@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_113422_987306_8719A946 
X-CRM114-Status: UNSURE (   7.90  )
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

On 04/04/2025 13:29, AngeloGioacchino Del Regno wrote:
> Il 04/04/25 13:23, Krzysztof Kozlowski ha scritto:
>> Enabling the compile test should not cause automatic enabling of such
>> drivers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
>> ---

Ping

This was almost two months ago. I would assume that with maintainer
review, this should be applied fast. What is here needed?

Best regards,
Krzysztof

