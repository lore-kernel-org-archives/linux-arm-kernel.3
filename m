Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB92C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFyGmIQMR58Rs4TZaKfP31Tc+fGtMZOG3Ql12fY9lU8=; b=Q5yThbulgMnl++kk/lmSpsEIMP
	CtalZQlFjGIWWvXiBZlQvj9OJnG/T+Jxh+SbfcqoLNkc3xDrh9E54yOzkf0CCxy3qnnXm+5NwtaVU
	Xm09ABF9E/wUJAckucsG/Ugm5n1eKfGEbvCfuZgjBzRYKCPQqK9jfizXwDZQZ4t7TAJCQH2SFd6An
	+KJrlwuUrJQp62/s3nqoVf2QajgmosLXUnqhmRXtm2ul4CUInVkdKMcjHmxSwO8z2xmjeOC7NdcD+
	ofFNByJzdWKm6Wa4quF3/dwy7Zqa85oY7j1gs8/cDaam/2DZXk0qTb2nbEX3PqCJAb9VjIhzdeaWu
	AdqNh9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyst-00000000OAi-1KiI;
	Thu, 07 Aug 2025 11:34:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyRD-00000000KHR-0zWK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:05:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso13391666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564734; x=1755169534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LFyGmIQMR58Rs4TZaKfP31Tc+fGtMZOG3Ql12fY9lU8=;
        b=qQJmxMkFgJgUUSp9DW5SBgx0ETToDdCqalzhFF6bstv7U9u4XZT946GpGg20+vVrBw
         L6pwvpCZrMTVrP0/wVIUvMQYt0Rx759Pe1KG76l6j5Ut/epH3C2xwFv3hiMcyyb5rXvi
         WWozSq3C7E75jhSoOgop+2S7qNn9ubjq6YvDidE0nAuwdaMdLje90J4oOAmPo6c99g7Q
         XlnEyrUOzGVlfb85kZWTaWWrPFmUyR5z4emrU3dI7nJ3KBJayG1gFRarYP//zEsN8+SE
         8SpyGHfEa+DG/PCAKQ158f3/zK3bSgTqSAERUmtVUDjrDfahtq+d35izARD0eNCr4Fx8
         tiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564734; x=1755169534;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFyGmIQMR58Rs4TZaKfP31Tc+fGtMZOG3Ql12fY9lU8=;
        b=hPM81UFUQMXUc4byfAVJEeNLBpF953hsPaZveAwv4RtN//3Uju8t+qDRTSu54hjEIx
         U7a3V+spvF/0HDMjkWapNzFqAdhZ1SV1eBX9J5ftrFwGioe+teOIHEYFOhGLxpLRi/3t
         ZEUiM+gE58F3R8XMgJJ394ErzxX1w0BLi7SPT+j1ptRBVURXV5CXxGL9yienjfwxuSfb
         Ihx9opMZogGi9xxDAHnvmnfxlEq7nudjC2H28JJlhwiWhGwIyEtvnYRmS+saziLuQrvy
         CYCCJkZNS8MKW4JsHcB7xF41MxcdMmiHkT9eF+Ct/RKK0kbhSCSHBtYXRhRL9HlD7kZQ
         b2lA==
X-Forwarded-Encrypted: i=1; AJvYcCXqJWEv5T2Xk5kiezY2aQlBo+j3zURFCGuAtKMz7xZi5Eygy6hPsOgxufuQJZJu+kqcsLRDQ9KhbBRsgVKLkMvn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx74e5Vpz0pFjll7EbfkYnTpdFk/4H1GiP9THXehW0uFHTOEUXW
	iaMTd2RjYjN+c9M2tKuJkfJoo9DPR9Vc4m2eQnzDnIfLLVjKVdYXNchr179t5Cn+m7Q=
X-Gm-Gg: ASbGncuFLtYduPkDpU2w5kPWeLmCL//NPYTX1utFrStgB3qJ/B95qMmrsE8bNJttn7A
	mEXGeQnaCHJPsdileE635IOGoafElf37XVsLP4VUrKX7aFN4C65twfwEsMCr1StDlWRjrOpt6LL
	xkUBdQFnOfGfhznb93liiue0jhJNVNlyH7cVSDmkDDt7LdROevgBRNf5JNXw0303idwbyIQp4Zo
	T8qSJo03vD4jqwh7MMLWjG3o2iTT3Eas5JUu+Cd5u5izmJyxH2dUzx+zfeq2uRMeoeykrlUmXoU
	W4coKny7IDqQu2smjsmNzqiRT0b9VHaRgyZqFQ8vYodmMC9c4UTCpRtlocww1HWk1pJLsieWl/x
	tu+9FkwhsDM/K5PfzGrKzfBXWgUteTf6H+YLZQ889axM=
X-Google-Smtp-Source: AGHT+IG0MGxUcNNzxqOIwu8lt3gGqI/Kl3a4dy5p1ccfcQ+CYryVnARUENcRNCNP8MHLSG+XfQEzYw==
X-Received: by 2002:a17:907:1c89:b0:af9:3397:ee9d with SMTP id a640c23a62f3a-af9902f5784mr239225166b.3.1754564733615;
        Thu, 07 Aug 2025 04:05:33 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm439667766b.56.2025.08.07.04.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:05:32 -0700 (PDT)
Message-ID: <37294484-a0d9-4b88-bdc2-0bf950cb1608@linaro.org>
Date: Thu, 7 Aug 2025 13:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Use SoC-specific compatible string for Samsung MFC
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <CGME20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22@epcas5p1.samsung.com>
 <20250807032449.92770-1-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_040535_293700_51282F9C 
X-CRM114-Status: UNSURE (   7.91  )
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

On 07/08/2025 05:24, Aakarsh Jain wrote:
> This patch series modifies the samsung MFC version compatible to
> SoC-specific compatible.

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.

This also might explain why you could not read current kernel
practices/docs?

Best regards,
Krzysztof

