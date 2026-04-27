Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407D7FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYUpsYBEN6196owDLzfH5/F1IIkOtluq3J8p6eTninc=; b=DkTrBILIJPHKaTGRSriNFN2Q5+
	rj9TTSjF9lleMLGHLzcMILCj80b1FdgAkXI/KtGdiDDrV/O0ifTcWe+1EqCOfGxiCdm9qdVuQgaZ3
	WXIifLuo8xCUJok7Gj9fTU+nu9wNtk1B6vbD9Of7CAXGZVlaLpL+v8qmBSMzP2zIRnRN38hLkEyw0
	T5jjhr0SBZ7eeeL9qEVCUYfUCUIbZI8ITKWVqS6X2n9rUywpK4qh90xzcALhNoiXqlIi2+rS+IqMk
	g0X5bpQUsY2EPsLqFe+mRIR71ihThzOeC9yoqueC+dihNcRx0y4JKZTD832H0bIfhxfnQ6fw6cJuJ
	+dYqr9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLfp-0000000GyMe-3yPX;
	Mon, 27 Apr 2026 13:06:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLfo-0000000GyMR-2NG2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 13:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IYUpsYBEN6196owDLzfH5/F1IIkOtluq3J8p6eTninc=; b=GvnCOGB0BHkerg/wJdNgL+1gdr
	t+tvC4iswkCRuQYSm6oCM0rx2/u6CbrkxGs69mjlqKPu2ykt9+GddTM+5iQwzs4TAz1aBib/eMhW8
	fruPAmLoZeBfsI9yFNz9okW/e+ZsYsCmR1PpfEheZEXChtivDoDULKjY37SRIi25AdPJSBvzqJ7of
	Ku8SjnO23f9B2VioWykaEJta/P2ZMnhu3w5PuXvUhviz/LnTuUZ58JzMR9Hx2wO0gkchlk5OQBYuI
	xOOo5o5VqRh14KuIBRppR4ryv6/mzE0XdsLWliR08uxDNrJkPvoJMGYl2xh7z4CHL7OO1xUdBaj3W
	T+sSZjHw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLfl-00000000cyg-2cQo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:06:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso69346535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777295207; x=1777900007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYUpsYBEN6196owDLzfH5/F1IIkOtluq3J8p6eTninc=;
        b=eWF51kQ229bDKz9i6YHyslSncAOZct5hHeLjMKHQGxIwLE5mRHiJUNq0n7sO1L0/GA
         bVrCMGhDZ5bi+WmZ+EL7Qd7m4Wbau0bWwTwoAA1nxqYuZR8t4AE7Yk1wNpuORZEyqkX4
         823ZfZg8YXSqkjihfqGCFp6JNYPpyuJVo/gzB+Z+ef5KbBKvoVDtIzEbZm6k3BBiOGmW
         LhljIN2BoLbhyEnLCoKOmkLzwbM7dERIliSr8O1911V10v32RV25zduiGcs3llFVBSXn
         2pjR3nSb43y/iG3x0pxtvcCHJIJzygbQpZlFezhSMQsA25ze803DtYHzR7Jrx4kBtt7o
         SvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295207; x=1777900007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYUpsYBEN6196owDLzfH5/F1IIkOtluq3J8p6eTninc=;
        b=jb8o9/HZ3sPOcY3QcZmVJXVoFfrwvyyQGgE3aLDKal6D30SelgVUt9KGKyRPawJaC4
         fAZU35Gs2Lfo/JtZp80GvhVUNjK4DetQtHY+MzTjB9tEe5nWfNIIYWmh4cthEYqunrg+
         /mKzidonEPxSuz+Be0XAGJhf08IsmRrTSJchGvmydKU90QufkMMl4j/AxBpWBFO0WMG6
         dYHlCSZ7sZLNOZ/HSsw25eZ8mDtMuLcSJXxFAEx+PIYwRiUk5ZRnniL3Ps4KcO36SQS/
         IBw98rNPpT0xbg9OuZw39rQtMlGCFMsRKIk4jkX0eP1Gpl+uaBQNVFWXJ/GOJNMDhvl8
         uFuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rbhNkpytOKpzxxHtAACpMoFhFxOd8jCV1Ts3xna7+zcVdzqN1c5O2dRLA/4/Lv/RNJvdBIjriT6IsFPiAyGEM@lists.infradead.org
X-Gm-Message-State: AOJu0YxieGketjwIS61Gp44mTVf+Q4agHQTIPDOjXaMBR14xrqr5F6+n
	rv6N/7Rbdt/F3XjyrDHfRgC3OcKE8ksgCLHGsiUM8vM3Uh8sFR6o1aL2GOa9Kxfll4c=
X-Gm-Gg: AeBDiesKXyRAYAz66Ss1Lxw1UO1BXtpUTsZ5UTNzPwJEgQ3hkSohpsjjygFPI2C/CLJ
	gpcine4tEH3JGL1gkM/fAjzNDZcCKh3BKs8F6UlxEcvFTZyR9jbn6I3OFBde+pMJ6+SM3zFTalB
	taglF/4G+drDbuoWie6UAnB63Wxah39K33aW+jb2U/FkM2SDUY9Bs+m1TOorJB1QQKSCMzCX5jA
	nouhWrdpya15xV32Bq8QRIzRCGHMtCz3AEAPtTTLmX8N+g+6p6tW5zhDSOxFuWeBSrFH6E+Lk2H
	zmaiFAwgAkKrtzNYc9bT6TUB3tC8qs1ssUSfhsDeMGKiJ1qtQ30IdZTK/PrDeNvAf8AwuuL0Ul9
	lKAEXyO3vNO084/y0QhLYdydaKUByXnENoTjC5zWJYfXdzA4v4TjfES/DdGxfI3rLnAV8OsmhZk
	LXVraucAz2AHd2mo8ROubQZjDe0TlZSX0oZcHdixsoGM/52R6FpK3dfA==
X-Received: by 2002:a05:600c:8588:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-4892005b4e9mr301808215e9.19.1777295207493;
        Mon, 27 Apr 2026 06:06:47 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm348440715e9.5.2026.04.27.06.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:06:47 -0700 (PDT)
Message-ID: <29a976ae-c8a8-4a5b-85c7-f52a7901a7d2@linaro.org>
Date: Mon, 27 Apr 2026 16:06:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: samsung: acpm: Fix sequence number leak and
 infinite loop
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
 <20260423-acpm-fixes-sashiko-reports-v1-2-2217b790925e@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-2-2217b790925e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_140649_764492_FFF07C94 
X-CRM114-Status: UNSURE (   5.98  )
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

Hi!

I need to drop this patch, as it can cause silent data corruption.

Will send a v2 dropping this patch and adding a few more fixes for bugs
identified by sashiko.

Cheers,
ta

