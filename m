Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30923CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWneBoACYfMuiuSESr0/5daG1MHT/M5YTM3M8vS2pFA=; b=3A6RnSne2A+WKud4gOyOkcQU6h
	15DpuE/T/GbdBMdIq9fnMnfI5ABYKOUpu3G2gwkJi4g3zMEq/YZvcM0/Jn093mVWUgZr043ALMmWy
	3IJTuLQE7NxDSaJmxdadKJ96DMnPapnxEokgjv8Rf+ua2JKN/rBt7lnaEUOe8Wamcdq1ThLiGIigj
	0/oWAlihp4WHXJeDREplrLAa+26pPEglYsya4kcnowDX3ExicW31Qz4Hw2M8iaoalVteT5wy8kbQL
	TF8SyLC98JCUKYFk2D2H9xcEdUnoTWgmWfqB4zbmgayxXOaj1p+y1BFI0+H2rSS3bY3BRCWlGUATD
	1xJJ/eZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdzw-00000001HPo-1McP;
	Wed, 06 May 2026 15:17:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdzv-00000001HOj-3rB4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:17:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso69475135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778080634; x=1778685434; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWneBoACYfMuiuSESr0/5daG1MHT/M5YTM3M8vS2pFA=;
        b=potjpTRX8kp9mCgTONRrZWLwNsqBC0+R24W5LTnJxVtraYb4zdwmIGZ5iJ6weYbLWL
         fcRc7pHnUNL02kwlgK1CpyhtR3gi1r3G6iBVto4cbyYvTfEs2yrSKdv7dxc2rqK+ToMb
         +XrJhk4LtQjSptxGn87iOcvlBwNuLxzmAVBJUs2MzSu8v7X/b8zgIWIHbJMY1Dhzl0Gl
         7qlubMCd0FzMb5ntg8xJGXs00G74TSsbTG/kz9uqR6tFVl7cY+z3A5FcZU0KV1tfQbGQ
         1uVc4q5lstu72ytDPCBzuTYE6PEcscMo/GZ3SlxvvVe5GkiijGdrmPYztCtviUmlVC3+
         BWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080634; x=1778685434;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWneBoACYfMuiuSESr0/5daG1MHT/M5YTM3M8vS2pFA=;
        b=HclH6vyp5tlzw5Mm8OFEQzisBGfs1/RvbLCW60pZivys3vJeX8XCuCyYvqH8nth/mP
         snlCY/Kx0K2rOGu3w0pfcZ6IukT76gVz4L6TqGSA/JgCrKKf+yB9tvo2P6ZzeRrhdvzu
         wUK15I+NR3HptVhNpAM6RTKAfPXy1vcFgNOHOP8T4UC2OsX37AT7O6KF0+rEkdGk/9k/
         Y6ZvG/hDneD3ygwoxg0yv2ml4GhJM6YsrLJZjl2nDR1ggb/lNSDPNOLhlQpy+b7jIMFT
         QzIsjeM03KgSEGoYfTCNo9xcSr8g7ERdmQKYi2SZNBWy3YqsZFpBMk7AmAz8YKCFlkAu
         13uA==
X-Forwarded-Encrypted: i=1; AFNElJ+HOfUw6GHfJgRBhd/oBAOGU+w7OkZN/tqY9DZfBm5JDpaHkgT0It8LPPZuBXUvjC1t6BihqPb+4lGOUlWt3MWm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv6diOmRGC2nZ9QQTJRFu/YZt0HQeRi/gd6/HIeA9fZnJEF/uH
	k5/JWg7PhhgkT7ye7Cb24fp3CgWr086wSXA9ADrwREeKLxeq4B61VP00gWvt12ZHhYs=
X-Gm-Gg: AeBDievCdGeChrNlW+fTnInAWCqKqzmx7Qt/tOCl02CZqMO+b+FF0HIj71c0GNyC3N/
	TX6GA8yuBzKwto/xsR/liRe+ejWTN9m7E7irHH2O0ZmpX2f6oo5DL0fJKR+tvjJfiyLuASn7t3y
	T4yHz1tF7BNxgpqitTZqBkDjR8h12739Lf37eRf2ynlwzcP9/cjfGLVwlCKsnKupmfJYSObHCFK
	0lSgGGILnR5pBKudSmKe/32Q7WE/PpZ/2XrIu7KFKxUZneX4QX9+uV92KcUJM5Xh9u/aoYgFOI1
	jbhy/lITEzBaCuc5WAV6CP3xk6bPbxF9TxMbRZM/PHbYGUfdw+zDRGNtYq4kj37pTxwF/uKRJaG
	kxrcbum6q5u5U3EOPcNUIVowDHRcc6D0V9E1PuxL8BSgPaIbCOhmhN7Yh8BRxXJT2Mry/qmfo1X
	I08XKNqCXV90KyHNp/o79oFhKvgXEIrr1Esq6vQ/VnnYTByBBmL8mEQbLx8a0ZF59sxaPHmAl7A
	6iDkLIpmAAZ0hHR+xsf19bTELde
X-Received: by 2002:a05:600c:c094:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48e51e1a7c4mr49435305e9.9.1778080633868;
        Wed, 06 May 2026 08:17:13 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:da69:ce01:65af:7871])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm51990165e9.3.2026.05.06.08.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:17:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 16:17:12 +0100
Message-Id: <DIBOZA3G83XE.13MZJF4AJQAOU@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <peter.griffin@linaro.org>,
 <andre.draszik@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, <stable@vger.kernel.org>, "Titouan Ameline"
 <titouan.ameline@gmail.com>
Subject: Re: [PATCH v5 1/7] firmware: samsung: acpm: Fix cross-thread RX
 length corruption
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org> <20260505-acpm-fixes-sashiko-reports-v5-1-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-1-43b5ee7f1674@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081715_980181_E67C208B 
X-CRM114-Status: GOOD (  15.70  )
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

On Tue May 5, 2026 at 2:12 PM BST, Tudor Ambarus wrote:
> Sashiko identified a cross-thread RX length corruption bug when
> reviewing the thermal addition to ACPM [1].
>
> When multiple threads concurrently send IPC requests, the ACPM polling
> mechanism can encounter responses belonging to other threads. To drain
> the queue, the driver saves these concurrent responses into an internal
> cache (`rx_data->cmd`) to be retrieved later by the owning thread.
>
> Previously, the driver incorrectly used `xfer->rxcnt` (the expected
> receive length of the *current* polling thread) when copying data for
> *other* threads into this cache. If the threads expected responses of
> different lengths, this resulted in buffer underflows (leading to reads
> of uninitialized memory) or potential buffer overflows.
>
> Fix this by replacing the boolean `response` flag in
> `struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
> length for each specific transaction during transfer preparation. Use
> this cached length when saving concurrent responses.
>
> Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
> helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
> prevent uninitialized stack garbage from being interpreted as a massive
> expected receive length.
>
> Cc: stable@vger.kernel.org
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Reported-by: Titouan Ameline <titouan.ameline@gmail.com>

As far as I can see, the name in this tag should be
Titouan Ameline de Cadeville.

> Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b2=
6%40linaro.org [1]
> Closes: https://lore.kernel.org/r/20260426210255.73674-1-titouan.ameline@=
gmail.com/
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c |  3 +++
>  drivers/firmware/samsung/exynos-acpm.c      | 15 ++++++++-------
>  2 files changed, 11 insertions(+), 7 deletions(-)

[..]

Best regards,
Alexey

