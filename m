Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C106C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z82crn1n4U//C3FmIvYAUlHbuVIi9Mmyz72zvrX3sxs=; b=mpLNmg/J0Y7FhsyrV73hmwT226
	SfN1bjh/Ix0cHMELvouNi5fy2rdp3RR4KKGrEyjDtfZCROGYAA02bCAP29WZWZOrb3nD8kiknIz9S
	gvVTffKKV2VmfYOlHSJqK84pabVXD5b/btMbEtSJQsm0/EFoJzc8odbpQNXK3EEoc0OuK4qEPAjfi
	6euAvUUYeTeieT0sJfk5ZwExxBrkMf3XyRIVP5va5E0B1BiX/LZR1MDpAGEWiILCfQKAxAqVX4TLg
	Tj/wo/IWc0VZLR9ws7b8Wp5NJE7BvTsCO8UGy4osTy2LlifDeKAv1iPt6Zwn2sImNEHop7IGu78XJ
	TQ5gYc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrPN-00000006oHS-0aXT;
	Mon, 05 May 2025 08:42:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrGc-00000006nId-0rQ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 08:33:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39127effa72so220342f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746434016; x=1747038816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z82crn1n4U//C3FmIvYAUlHbuVIi9Mmyz72zvrX3sxs=;
        b=YOn2k4knB5fmjQ2Calr1gdlyGdbkse0kSYHF2Yee8RUn9l3bWPsgiKZjNw01aImNGB
         MlqWGvPrqMToXPkcj8RYsIQ/g+9bLrFQ/LDxlyHQT1adTlbMJvDKe9ZtZKOkkJjOefLO
         qGMkrEVjaZFkG0S5Bprc1j2c0nkH1gkliYbIIniKE6cc2zzkWMEpXzb8Y5BDmErf5IYt
         1CzIH0u9Yz9dMoeaIlVUWwbc7m7ONnNjexOmg6toqa5HfQHCNBW3tUa9f8JX6GbBKXSQ
         SXmKAMEa6gDFor9nkUDWxdzDlNKFe93Nc6y2mNt7NVX+DCrk09TNwc64xy4NkBDSfy+Y
         G/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746434016; x=1747038816;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z82crn1n4U//C3FmIvYAUlHbuVIi9Mmyz72zvrX3sxs=;
        b=mK77BI3ABsW4XlPWYScbndMf9Oiir7wVGiRfnyBZKPLJp05bPMAoxxhQAcC86no75/
         C/dHz1XpbAoa2sPits9WdeMlDGRmgR6AcvlZ1s6yqdEaT02Hrc7FVwYa0Sob4tAl4bd1
         DPvqlBrIR1yJBSRiA5PDLByGGPcdXWGoC0BEwbc28gJrQ8Xx5WFW4bq5wrlPTnECqtbh
         gX4pMnfWsnln+Kns8q3l8XXxJ30sWaTxODS6dJegTn/kdwTkYeBC+3fej7viGDO2ixAu
         Cg40Lk3nnGTqRcbdl0wSIycvQZFMZwAmJVm2RZ5oYijVekD3NYpCJUQbzhY6pyDFeYqm
         VH1w==
X-Forwarded-Encrypted: i=1; AJvYcCVfpP5QlxlT/DdDN83JyNQUsy6LVtiCY9pywl/T37OvM1fcw0z60dcDr2hiGCYURGZhhR3tR3OzL+8AIEZxYiQH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw63/N8ky7rmxY6ZmRJldCv+w08zHs3tTgY4PXYiyJVZiVn2KCQ
	o6q/HocRq5ghJgqfKK0Cj0bBhRnj1b6sGBkjz5s+v3EHyDy/TjPe8IaYy7YWbV9tBdQa2EzlZtx
	M
X-Gm-Gg: ASbGnctLDp5fIUXb3LsZUrW7NlLvCkVK1tXus7Q/CNJgI80ONhd3gRvyc74ZJ2wqqd/
	sQD1gf7E0aSYneQCHKWRd565EbKjn0u5I5pZIgT+refPpjkZ7q/Zq0/bfvWrgceLOaJGl2P0T2F
	R0CWPiIDQpDwB7+qFTMTWxqlkNTL6CYsO5GVw7F0Xwyg/9tJMDp4YbYS7W8dvyEiTWtmU41RGg8
	gGWI1gOizqoSJ1njtTsuonS52Ha2PNt/WRzobTRXpkQA1/pFgENfv0XTwjLGB8W2n4tIpwVWAr/
	Calov/0zQ5Cgw4JxFYcVVjFypvqdTzm+heQlxELs5VUvDqe+ZC/aqhmokaQ=
X-Google-Smtp-Source: AGHT+IEhVDlgnkhCQe7xH6R6QkjJrhUV9ZpsH1Vh6lTQF8rYoOR/pBbGMl9fMDNjidLas075uHLCoA==
X-Received: by 2002:a05:600c:450d:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-441bbf38acfmr35906465e9.7.1746434016288;
        Mon, 05 May 2025 01:33:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe92sm9813966f8f.68.2025.05.05.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 01:33:35 -0700 (PDT)
Message-ID: <ab0ab264-4fd2-4826-8a89-eaa55c462183@linaro.org>
Date: Mon, 5 May 2025 10:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH] arm64: defconfig: Enable BANG BANG Thermal
 Governor
To: Daniel Schultz <d.schultz@phytec.de>,
 Garrett Giordano <ggiordano@phytec.com>, catalin.marinas@arm.com,
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org, neil.armstrong@linaro.org,
 alexander.stein@ew.tq-group.com, biju.das.jz@bp.renesas.com,
 javier.carrasco@wolfvision.net, elinor.montmasson@savoirfairelinux.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250113185607.2210352-1-ggiordano@phytec.com>
 <f40e97a2-41f4-430b-b3f4-815587201191@phytec.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f40e97a2-41f4-430b-b3f4-815587201191@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_013338_251722_0574DEAF 
X-CRM114-Status: UNSURE (   9.61  )
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

On 05/05/2025 10:18, Daniel Schultz wrote:
> Hey,
> 
> can someone please take a look at this patch? I can also re-send in case 
> it doesn't apply anymore. Thanks!


Sounds like a product thingy, so I do not see much need to enable it in
the defconfig.

BTW, the more people you CC, the bigger chance no one will fell
responsible. You Cc-eed ~7 persons not related to your subsystem.


Best regards,
Krzysztof

