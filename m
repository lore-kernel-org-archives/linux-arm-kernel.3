Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A7FFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvfWbNsf7kvzImbLhP8AA1uE2RBdkUT+264nPwInwps=; b=pRr0JXEcu4XRwvOv/jrI1c7BXt
	XvGRrMB0wKnGJoQEDjbikfDCqnGUUShYx0bjnnahuZU16kiKUmWNMLYHOCeYGh/cnh6KNoaIZNIo4
	xm2Q5TkQ7xWmHCdx57v0J9bVNgGDCeJfKSi+ZeGQstjew6e4jcJmw9SZwl2Y0oHlqcYt8+DvKVXhm
	xTeopjjTdyVh5L62uEpFFZISIiS7DPAeIGGrhuIbftiZSt+PkTj/Gp8VY6jLj9Spwiwe0WH2U18B6
	fNh+w1NmRbvJk6vy8YqpfeDPQPrRLxw2w0XLhUV5OBz5kUpVcqN0B6pQp4DnSI0901x0WBRq8E28+
	kwoYd0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi72-00000001UL7-0e7x;
	Tue, 28 Apr 2026 13:04:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi6v-00000001UJs-3Wft
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:04:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b9358dd7f79so809045866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777381460; x=1777986260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvfWbNsf7kvzImbLhP8AA1uE2RBdkUT+264nPwInwps=;
        b=GiVXuf8cl3tuOqnHlBb+yq8JSU8nN5k1ADgMef82z0L9xsCZpaw55W2bnLz3UpidTU
         nhGk/IsedTO5bq6WMW2BJuA0wlOVXTL9aHevdnVf7Pq5Z/8dNhz8BJDPysmuE+0EQx7d
         y81EWCmXhQajruccpdkhiJPIXn0MJ/l5kN81JIiyE2dFt7LhVeWQMBIxG3Pf8deHlLoi
         4z/tgcujl5jDHO+DIK+v+GJM8NIs2puK+4QPH07VTERrhvonANxtdWiwcw3F/+f97bAb
         bQ2DRAV3QwWJ0f046QiMgOooPyuKMUPyGMgs1VxyO4mCbDEZD1Bg8nMF5YOzWx1/MTry
         Zirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381460; x=1777986260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvfWbNsf7kvzImbLhP8AA1uE2RBdkUT+264nPwInwps=;
        b=aeyHwDoyf4MlSIHj0lNyWSBiyNlK/OUgWmzVOWpgn5S1rhunU8jJK1UICMIKKSdQbr
         zw4EfYcInIUEARHcgKCICmVpfqA36TZPE1AeJ7m8l5N18eIYt0AFEIfqBF/uYlIuZ+vi
         j3fRYueA4JeYbSNtzZSPnqhYRFSZtUxazJwqX8HgYQcyr/KyBbgMYNsuo3Zulqz5+dpe
         nO+tDEVrXOUhNl0NPvcoXPzRP1VyMP9lWbQTRvQjmj5UFcFbvaCqr06xXwazTRCVYUoE
         xp4rKYVFokOPdVRBs3NKrNxiZ1UBLxgnz2QeYP0VokJNmEiDky846Wc45ProE+voZoB2
         1zWg==
X-Forwarded-Encrypted: i=1; AFNElJ/P8jovYdCMAjI8p4OgV6Tx493HwH8lutalgALtr5tVVfcVxY/OAQjb+gmijf3zbG918UeKlN1k76+6JOYViStg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6S1p/3RkUhMLsQQ56QOmKSk0nCmEo6lPVNrX7xSk/cwci0Efl
	eJnTZkDeEuKaPb6Hr/e9Pv7CtbdKXXj0cnp6ed1sYwvjrkrPxF2pLYwO2Xjb8pR9wgpuvGyoxCb
	85oOKh04=
X-Gm-Gg: AeBDieveg9Pry6rYLSvpo7iGEbeXBig7us9gdfJMo9ob2rePFtnhVAOi0Bj/1gnJErD
	LeWUdxUenMEPeVPXp6QnKkbh3bM0pjyS1NlDzpls+vK9j90C8cRRoQMoTY+UxejmITFOGx/KGO2
	QPyM+T07kMgKwLKLIrLU5iRZ5eWPHS4kqLfUU2jSHy4kYoimKfcydvfz1WbyVox15rhKUXG0Sn1
	LN257g3caXCjUzq6MFAStx7uFjPCkgMOfHHY7aoDlAIsc3lJVilJgrxeju3mUNtQQYbJyAiMPXM
	n3OtPZ9IBzf5use+9Odxu/f6cUk2xuIVVGawPnrLku28rClz5RMU6v7rYmPLlINkrrJhZ8hCFnR
	wcY2/i6Av0voJMTWZN2LuXsrPFFwnsTkRo5xx6OTwLuyealK3Tap7j+Hac2zGZOnZBUXCEaTPP0
	hfEce6NEEdIgDPhBDQri5tnBYivfrRy0zTiWsNHpI9ihEuPwuaU9knUw==
X-Received: by 2002:a17:907:9454:b0:ba7:e3ee:47a1 with SMTP id a640c23a62f3a-bb8018dccb7mr182160466b.4.1777381459520;
        Tue, 28 Apr 2026 06:04:19 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b685290dsm754196a12.24.2026.04.28.06.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:04:18 -0700 (PDT)
Message-ID: <60f71fd7-1079-4936-b4b0-9d45a2c112ce@linaro.org>
Date: Tue, 28 Apr 2026 16:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] firmware: samsung: acpm: Fix out-of-bounds read
 and infinite loop in RX path
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
 <20260427-acpm-fixes-sashiko-reports-v2-5-1ff8de94a997@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-5-1ff8de94a997@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_060421_890471_E1C044AD 
X-CRM114-Status: UNSURE (   6.32  )
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


FYI, I checked sashiko's review on the set, and I shall act on this patch
and extend the checks for tx_front >= achan->qlen and add zero length checks
for qlen and mlen that were read from SRAM. I'll do that in v3.

The rest of the review feedback doesn't apply, so together with the changes
proposed in patch 4/6 that will be all.

Cheers,
ta

