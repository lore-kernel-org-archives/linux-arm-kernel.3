Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C95CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zaI1eOQZkIMp2A/7WYxuml1I3ZODhqYihYDuIphYpE=; b=JcL49bBCPcmnWKXwVKdJp2YqS+
	isiI2QGBcBgd2EyKZm00woJ5HyOdLqRXaKoIDVwrdahrO0XhapI+1QJ3M+KzE/neU24mWeVcWoMSJ
	qL+VgtVNV3W2RABgtSQOWm0QXn/8qhIxyHWg7ncaddE6LhHzTnB1fEqMxTaqAiA4Yjz5LolYVj9VV
	zexfnAMegJzzi1+VlF+Dl4ssD+kqBunUyU2NvJqG2Zi1zHIYwEhl99R3+WiRASR9F1hC/dUwSR/Pu
	dhwaDTfUuMLAcmkqCfMcvDN6K5u1Flxkt0pNqZoXP629noVqWxP/ZhnqlPPMTQvX7nphil1wD/Xpf
	hbFOZCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIl1c-00000006aU4-34L6;
	Fri, 01 May 2026 10:23:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIl1Z-00000006aTd-3GCS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 10:23:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1113385f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 03:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777630988; x=1778235788; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zaI1eOQZkIMp2A/7WYxuml1I3ZODhqYihYDuIphYpE=;
        b=weR+tcAKIYasf1NM2M74Y8LHSs8MT0owP72iqyhCH+UJJzRf7iVeAUrkhT7zlMGNii
         e6ekaEUDWgMZa0+CLs/5KTaO1Hce74tWTbprX5ZEbgefb5K5C1C9KboznVc9OInJ2jc3
         WCTc9sfeQ2hLuCExm8ZvzIEogwlCnov24TS6OykyOeuXd7XW+edZEe469Rrn4HcqvUGb
         8Poz0yxmeQPlMfIcNJenG124FIzWSrVR0vybHN0ia6t67l8+wFHgGk9rHw/VxSkkGXPE
         WkFKmo0okH3thBZ1wkvuW2s5dQgEbReuYoq/6bdarX56LxWOJdhP/x6kcF3yCglrA9HI
         QAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777630988; x=1778235788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zaI1eOQZkIMp2A/7WYxuml1I3ZODhqYihYDuIphYpE=;
        b=X/tpyw7Bp5WlCZwKauHjJxonwsurVkEmKLCpY0gj6WhWr0VFDFfeySzX9Gpq9D/Cmk
         u04PZtqghx4cxtXC94qUkkPm1NrmNnIbW5fgiayp+GOFwv5Wp1rzZQ4PWK+1d4yV77GS
         57MNL7gEMt6df56wYGYyz/KbVem+/irn8csRhSpay6nc/9smSuO2ohou3mOuseb4BHbR
         g/xf6jy6nvA+fo9rUZwWKTIOUfQ7JIFgSnItvhMWPSUBkRLLLaQgn3A5IPNYcnWeJH6y
         B2xlKehyKImXm7myKnXJDqldrnejTmq9rzTplLQc79WY1F9ifs17vtyGb8D9CNDFvpJN
         UC3w==
X-Forwarded-Encrypted: i=1; AFNElJ8tI1JMmqwwy2Z3BTmK8e/1iQkAdJVyXFC1XV9scuX4DeYboyn4dH/0JOrBWRhR3aC++SWCR1nKLYSUUdE1vSj5@lists.infradead.org
X-Gm-Message-State: AOJu0YxPOqguNhKKtRhuKA3/ro+jvypcJg7rMxM9qZnn3oOuiIK03dIg
	lHb67P6iCU1kz+39+ZLGbfJx4s1y4eVGyV/xHjBQ75q6mqdY/Um+Ubk6h/7Y229raIo=
X-Gm-Gg: AeBDiesQoJq6t6PfIbycFwp+gTX3QecKo9b7G4fUZaZ1qC4vMI9vfriGafxa5/9IVLE
	JdOh5A41i4b+5aLFqc8rbXZTWbWps31V9s/LttTd6mzwfIm5IXIShjGw2IRg1qRWQD3NdwJTUWY
	zfgATL5OAfCycI43/XTrbUmutU7pUXSbJmJLJAx7FYd+aLZ/VvFLyuFwtaRkf8TKc/i7KaIsvza
	CDKPVIrYUlakGWUojH5e2lDYcEE+pmbrEWy2hrqF7eIR4VmuFuKJkpuJBUdllCUvz4wBuhxhLGR
	piaMAoFjbKUERUYzKfQeSTZAbJbOxQt/t7apNHfp7e4HlSMbaWjGUbd3PzxvBUC7X+vHD1c3HWh
	YJxe27skJMENexE7+s1Yu+Xp6ZPtMktmibHhs0FbKi4w9Gdn88dbd3xqJgLwSNyIk9u3ZFPVyB3
	olNRTCPRiCJfkmLgAQyh3+EDfFpaJR2XdYhxLOmldFIcA=
X-Received: by 2002:adf:f001:0:b0:44a:8880:ffd2 with SMTP id ffacd0b85a97d-44a88810005mr2603191f8f.4.1777630987660;
        Fri, 01 May 2026 03:23:07 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44b63d78692sm60672f8f.27.2026.05.01.03.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 03:23:07 -0700 (PDT)
Message-ID: <380547be-8eda-4395-b13c-b6cb6804ec5b@linaro.org>
Date: Fri, 1 May 2026 13:23:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_032309_858708_AF6A134B 
X-CRM114-Status: UNSURE (   5.68  )
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


FYI, sashiko identified few improvements for the current set.
I'm preparing v4.

Thanks!
ta

