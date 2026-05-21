Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6ABCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=; b=UUOAiUrWp+ZwCHuTI+rA68XW/c
	vR6Q0fGoGHaT13L2MMgSZBpo3bhq7vPGUz3Wyl6QqUY/drHMqFGhjzUcSwXRt5/vJbJRfh0Y5NuZF
	dbs5HwnYmIiZxGwivblAums7r+4XTjk8r2dOLoDwIoLVjSWNQqywj8TxRnvM72o2q/ayrajBIKYZs
	kL3I3vhCF74P95yObKwXyb1IOAxQxw9cSOognfpaZNL0Fdxi8JwkD5Pa+DV3yAFyqG01DGSG1TBQH
	LhcLUiF+/UqX6EyZuI2GJ/dosWosw5ncoz8T9vm3HtS/n7CeSrooPDD0wO/24SwmD6O/f9yjLe7Bs
	WAARHfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4ie-000000088ZH-1Paw;
	Thu, 21 May 2026 14:49:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4ic-000000088Yp-1T4e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:49:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so8038605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374988; x=1779979788; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
        b=I/9ELtKyanXyakpUeruQr7w8kgFQEQfz7vuQQjdSbAEqc7WnDKcwZZr2nwTVr2AMCY
         Y0+4SydizppI11s44XGPKoyDqrZfhJTxaT7X0Q4cJMwXlnHzKxsyDCOmeHmBhxwR9lsz
         ejaXamHagOI/Umdc8ChRZAJBTRKrzCpZTFcMGvJTfDBq1spH2Amk/g3GV74OKyF2OspT
         Kev3EYN7ldtm+pOxXa7WIeVSz6j6zA0EnIaJLWBhj/R42i6nF7vNjvUw75JxkKHFqfUn
         PMKYs62faFv4Mcpob/SaSGz8LvYgjBjNsng8JTgLOn+R27NGZzrY4kP6ko7Ec4KXKGfO
         u8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374988; x=1779979788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
        b=R3AjdsUHNCAwcKe6wY9khVtYmy5g8C9d6LN944fw+yw/fAMqJOS0KvSCn9QxjuGsSv
         mtwkiT5kogxBbXmUPbvldJi5Nq0rp0tXegAvtXNbU5UqVnFDioLr32jxgkbe+OzNazaz
         Mikfn7yS8AR9/1RhjlX8D5Q0EQtVYiF64vVf1PTJsElS2XOtAUDETJVjvWLJWb0jJCkc
         4thG2I3ujXPr1NbyukfHrZPYWoNqRxVMZj75iJ0pizwNq7qlQkl/Wm/hnQ7sEK/jYVNw
         eCwYPuCu9qUHTKWBSAVeIFXZFeXu8SLwGyUGwWLsnRiCQApAQkHdsjh8jtxDjXipf86M
         Z/4A==
X-Forwarded-Encrypted: i=1; AFNElJ/qxeGM0oH5fVw8vivtucuPNMKCuhgTrQtBhDN54FMPb51mzBBNRjRMz1sqeAsTfw4ePozlUiDz2VVsqXA6fM51@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7wR6eFkhPlSV53YwngKFu45gw64RA3PVtlGD7OJjZEBgKV6l9
	28r0kib6xDaPRiw93FLj6rtpfw2tHKMO+b4VlXvHZDJwqUmmO6T3I2taZo4FQqUOURo=
X-Gm-Gg: Acq92OHPEdGRXgOfRCGmVwrbXaGbQDh05bLXvm6UdS+6dNLuLMaLdldsmkCxTAX2TEj
	/tUhFh8PWHebqABynvS2se2Zftlz8HSF9lvRKlCgUn6yyw2sBt99Z9flcFdjQMosj5B2rkPv3Z4
	Tc16+AZMVt+1Kh4hlzv6nm6zYQZ+Ik9Xo90WpWKfaNsN1w6nDCktwPMxaI3sdyAuduAn3F10MOe
	4OkOh3NDuwj0VMpFLD1hmQxjIlWIWlgx0afU58c9VHkdKt4E7Rk/iTm7uYbjT+e2Py5e1Acm1cG
	X+dMi7HoEWocO4/bXuxhlp6VWc4xI/FC/Z1Gt1V5tF5gowGzMjLxYL6Sp/++BGvcMt8oqVeHURD
	I2i0RI+m56uiOnctuOVX9wYiCmTxcCNVyIArxKnVbU+jeqmZUL8i7s8F51vYDqHj6PaPcJ3OFbk
	fYfViVntYACdHTJ74yEdMmlmZmUi74Zm8=
X-Received: by 2002:a05:600c:3b26:b0:48a:5821:5ffc with SMTP id 5b1f17b1804b1-49036033499mr48409275e9.2.1779374988282;
        Thu, 21 May 2026 07:49:48 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c6766fsm35082475e9.2.2026.05.21.07.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 07:49:47 -0700 (PDT)
Message-ID: <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>
Date: Thu, 21 May 2026 17:49:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
 <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_074950_403191_32DF45D5 
X-CRM114-Status: UNSURE (   6.79  )
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

Hi, Alexey,

On 5/21/26 4:37 PM, Alexey Klimov wrote:
> Peter, I agree we shouldn't bother about hypothetical SoCs. However,

It's standard kernel philosophy to not add code that __might__ be useful
later. Please consider adding that print when you submit support for
e850.

Cheers,
ta

