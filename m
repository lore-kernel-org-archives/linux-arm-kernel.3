Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6170CF589A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=; b=IybLzIUoyE50Kpri4yxBr2VK2S
	iC+K/vpS9XYgxN1o0TyNBdk/81uOnAHGgZLiIyfDSPmAqeiJ1dm9ssgVCPgRXygzx0f3Q2HMZ+rqh
	3hrlPNxFzIIz2fphX4N8DMTTOu3RdzMBh8NxYpkqp46xVUt6StOqIEArmw74znH7UAWukw8Pq42Gd
	jD1W0Z1FvsCbiVVvMwRMszQ2TzRGfnzJEba/+Zc9MQvHZLofv8Uvl4BFheaBTBREbekgHnng705sH
	M2oxMxPztVfvO4ewF8rVq/xBuGV8b0WILrB2uVgF1UxdZxxkPxdHbAMgIVVcZRl/3tGC6SsfQ+IUa
	tPeklCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtG6-0000000Bcjq-0JsB;
	Thu, 23 Apr 2026 12:34:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtFz-0000000Bcj5-3lfJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:34:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so53534845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776947649; x=1777552449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=LQDOmvGxwGOAKqW7HFJn338NLtGGTg/sdcHAKp4GXY/TStjcuJtJt1+tqTEuYl2elF
         j3bEwjDNqW2HaHW4nfEFOWuswBkMQpdMxdlBz4Nn67FObV8JirgiB54uuqCJ4AvpiPjx
         ZiPIR950pjM6qFfOaCNn4mod35CdtH8o9Us2QCkhlFnSxJU2mytDWk60PugpnxlxZ1wm
         +x88Bi4Y5Ll1zuOQcRvB5zcpM/51Q54YfFgPrhccHhXjxkgybBWuomwweozAtEPxHY1M
         JqUYK86Esb9CmEyoaol3grpwq5gxKmpf3z9RzhdGXTF3TGTk/vFpRuRfAVHDlLV/5aNJ
         N0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947649; x=1777552449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=F7w+lYZ9xAobXBF4kHS3CKk5fSKwYVQSQGot/SHH04+wZMoCx5TBOZM+4jMVcY88zZ
         J1+RD0WgHx1Rw8GwSuRswKyIDQG2bHgUj3U4ejHHTRjIAFBO+m6YyySr+oQXcbT6NguM
         Q5Sv/3YTANTEDZzxRi9tJJXTjjTzaPW0ami6l4exPOiRbfHRSQ6ZzuQkKyamzM5ZV0O/
         wyiTDCVQ5CxjEhOZscNJSHTwXIe4vDKzUX26N1yudAJk01qTT5f9W7krp4YaE6MsZftw
         fMXnyoYKf0POvw6tYMnWOS3je/1enjmrxo2NAfKwaSOt6D35t+V9qq6W7VYCOSbUAVjb
         F8hw==
X-Forwarded-Encrypted: i=1; AFNElJ9Dqg67S1YWS1qdqjQ0rOjONsFOVCoKuGmxf0w1yUooyOxd8C110jHRXymNpZomTsXhMxChap7VS/t/gA922Xxe@lists.infradead.org
X-Gm-Message-State: AOJu0YzzgjubZufg5i+UvyCwjT+//uHVYMVEw2eXEzPzdV+t86pzOmP6
	q53yC7Jv9Id7ta6wBJnOLdR6usn0q/tdPy4de57cPJb5FItLTYNuzZiFas6db1HDQnE=
X-Gm-Gg: AeBDietEOW/HLbfXS9hA6wBfiOUSEx8RrUs1PLa/q8MuSPU0covn1phgKxVHXo6pPwa
	jmWn3nudTRxqpXj0RnbWM7ib1EbpXuVRus/8pQNyF4O+jTGS3ZY75RQtgqdL7qiPnRMHyGBH9eA
	De7uJtC3sWduyTY+AGrKteaSomlB099xySyBW4tGUWqQTONdS3mftTsycTkyXZhSiGPL/jbKLno
	hIBrTsmX+Gasn20oB9z1Q9DYH6tSDCvOlTxvraFKv2tm+T+pfcqWC0JiNKQiOkuKPhVRP0FxVuR
	A80hH1+ikK0P9AhniRzXUKjZM5taaV8rVXrPGV3iHm4KlojvaAV/igQdwDDm5aRYu9GLPzfxYOW
	WSiibq1eem5KgrIl2DlLauwH/sl+31AsAGnHA3ZOusjqLRP6t1Lv9w2lw+0vUZ6SsKF4GDhSZ9T
	Fm8KjqxOrVjX9IdRvGtp4u0m6tEK2phzlORcFp2Gqiru0=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr363286325e9.18.1776947649347;
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Received: from [10.11.12.108] ([86.127.43.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm588535385e9.12.2026.04.23.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Message-ID: <b85c3dc6-46a7-4d08-8008-a8334262f4a1@linaro.org>
Date: Thu, 23 Apr 2026 15:34:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] thermal: samsung: Add support for Google GS101
 TMU
To: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_053411_952705_922181CF 
X-CRM114-Status: UNSURE (   5.92  )
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

Hi,

Sashiko identified few bugs in the existing upstream acpm code.
And two bugs for the current proposal. Preparing v4 where I
squash all.

Thanks,
ta

