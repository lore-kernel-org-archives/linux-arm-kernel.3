Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNEYJ0/3OL6V5KtaRvLweTOXbANv4SgmKSvooy29LIM=; b=zLwKX8NT+q87zku9WhpR1Z48tJ
	1ZWz9/a0mz16uACigwqfZFem4nDzCaafydIA4Bv3sdkqmKkdwp7Ctwo/wXzqQKv0fSezbnkiGmGWb
	6v4kNkYolEkCN7vSufPW6covrSENAkz1KzgOdySrcgxP27xe0zq+TCcss1TkxB7sfmxgaXJ0eeQ+k
	48LWafiSEylohGUWYtp+1yGiwE5+XvkGMh44OKVm0d2PH6VLisz+cVBAg6kbuNSy+b1yMuPyKWsh1
	PWVhkuLM3EJ8a5EZ9AASnObq15vUS1KRv66POEC38dp1ZUH65UsmOnodbrOi5t9fWWBrSYZ3KYuvO
	zZLDEE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMeE-000000026My-1jdM;
	Tue, 19 May 2026 15:46:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMeC-000000026MS-2aRI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:46:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso27700165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779205578; x=1779810378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNEYJ0/3OL6V5KtaRvLweTOXbANv4SgmKSvooy29LIM=;
        b=K2Rvpo9HrF7L50IuWh9whgk7ULLNEbY/rfhO0tvA1Iq9qsi0upfsOjTZcklrLq0xU8
         UGsHs4gYKmpbQwrY0oTRVmcUg0v3rShoFIqFM7LAa4oND/Ar5j31YinNf8QKJ2lz4E1Y
         5pIlUDU4aqmfhlcOYVpwDx2gB1v8RrExD1bvzGiYYPuJhe0qTOZyXCDb+fwshj8r6vYR
         33a9o0CyFoZqbK2hj5bd8rthGzHprBcICAtiCoJvlCE/t5HfVPt0hegy97utvv5Ap5hT
         sKgTCLph4AAuM09kDdizz0SklrXkEI1sjBYl0zAsj6NUZ4ZBBNT/zl+8vj5MDvZNk5xc
         WXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205578; x=1779810378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNEYJ0/3OL6V5KtaRvLweTOXbANv4SgmKSvooy29LIM=;
        b=LDwLheKd+FSbXl1DbQbdhpSlbQYqRq/swaBZSFWx0iyB8OJLIrcWtIN+WzBzN0hzMI
         vck3SfZ9oQ8wpuo6C99D4SSkR+bxtXOoDlHSA4BVfs80CtqB5+09uOSieAqe6ZMUoiij
         cApuBD0TyR4rgxJFDKbo6pvIG983MCA9rT+VnL/UUL4oFuq2i8O5Wev1kRloyXE7Z+rx
         LUDQgiLGroAqvK7rhW1jrWkgmXouqU80bynDa1xq1Hz524zzrp7gR7PZAFBh+ghp6EQc
         3H5I8m/efzIpcbD6UVkZA3lahgMo9FCCjCVH66N+mRkCVX5x+T4xJ+5lnCXKZUyH4Nx7
         il/w==
X-Forwarded-Encrypted: i=1; AFNElJ95pmUlu3hMjh70RhveiLovh6LJ+6QOk/96NCmNiXUuliwIP6hoDUQ5N02yzVOX8bpaR63i8xmL6et2GkQA+4J+@lists.infradead.org
X-Gm-Message-State: AOJu0YzvlYo1XeW7G9rWV6jnp35/5myp7KHGkqyAXrxzb15P2KswXvae
	l9tKksR5KLmzABHUUb69sHENe4Y2UGTMG3g5pkeg74J4AVrn3x8ArBXl3emVUHq6Rlc=
X-Gm-Gg: Acq92OGoEyXEYUHCDzJHRCqZwo6hpBiJ+k4/t0fpu4qQVOpYPOW819CSdecK36WQ/eU
	18EmUzTLpzogUzNrrbx0C9VlikZW1FEWQVmHhU4nXHO1IIWHpITEbKJA+hI416nCaJvOTNfgwda
	+O9qafDg62mNr82TaeX3CjqnWc0mm1WMELlcGBl6InspafhqG+N81sGzerXgs5SQhE1dcTtlKlI
	rL820bSp62XCHxMag6ZmmlF3R6vahkUc7sy40TkiJm/lnnuxHc1I/AZEL/eDteWtUKpIq8oecUD
	Vko/hlVDRx6aR4Rf0BimQ4gzH4tCN1fuCzJ+pZv0IcBRXA3WHY8iZAW7Wv0ZdGh85aVg9Su3beG
	/MPIa1zzpHux2GiTumMnrSHGuTmVFE9fnwn72Njyp8v+SXaDmwmdux6NskmXfv4KeZETc/flrTp
	CKAQJy1+ppX4A858oDwTCXm4rUN4DeOMA=
X-Received: by 2002:a05:600c:34cc:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48fe59af1cemr336906785e9.0.1779205578122;
        Tue, 19 May 2026 08:46:18 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4862209sm333119405e9.0.2026.05.19.08.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:46:17 -0700 (PDT)
Message-ID: <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
Date: Tue, 19 May 2026 18:46:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_084620_683600_4961283D 
X-CRM114-Status: GOOD (  13.64  )
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

Hi, Alexey,

On 5/18/26 2:24 PM, Alexey Klimov wrote:
> Thinking further about this I'd humbly suggest that even
> 
> 	if (fw_err >= 0)
> 		return 0;
> 
> 	pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
> 	or pr_debug(...);
> 
> 	if (fw_err == -1)
> 		return -EACCES;
> 
> some debug message would do.
> Perhaps we need some convertation, for instance as it is done in scmi
> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
> data for mapping acpm errors to some human meanings.

I did that for the pmic helpers. I don't need any debug prints for
gs101 TMU as I have clear instructions from firmware: 0 for success,
-1 for error.

You may update it for e850 later on if you need it.

Cheers,
ta

