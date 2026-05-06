Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A55CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=; b=WesEgrkQgmn21aK91X2LK4M+yP
	GNe/tl3XV8VO46Y/VM6vxg+VEkTdmvAj7B2suunthhoPEBOWJKLDT/q8CmxtJuemTbQVZ21vHg13T
	YjStlKgZcEU2emuLz2i/Oze6fLlxkmY8HZxDvafACBsDmBhWI5vDpvue0FAKweaddhAgDqb2yQRYF
	2qroMy6NiRD+ufJg4ODdw6YW4rUa6+q3dHXgQP7FrhBXp3u0WjMBlQtMqi3knwNz4XYQHNA1mUu9h
	4N/iZ6mzVQGwNJHSK5TX3JZqwAm1d3vAbL0pKnI4Qee1+FTLFF/ca8/jHhTPtXvSgA/ds455UfyWu
	HUSfjFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbde-00000000oI2-13Ng;
	Wed, 06 May 2026 12:46:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbdc-00000000oHa-3qPC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:46:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso35603865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778071563; x=1778676363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=ZjX+nIdOJ6e12BZoCc01zd3WezysG0DIABRfJ92l0dvQvMbtLt9XosEM08l0hXFWsu
         7uc9xuRnIS0KDNzq3kNp0dMX56P5A38ekrmzbCl2LCNXUhN+gVWbZxEpMJGOzd5Ya2lv
         +fGACL4GYb1jUQkNr9cJ7umCihM3mRABgo3cqDoaLhxUUKN8GaGj53linQcIqdxyWYgF
         nd3ubFpIKCaym4udEFA8S2uCzLxcU4Pz/gutU9N694AWpEkifQGbu67C65WoyxwviMfh
         576WTXWGP04fEEVj+apXRcET5ndoCJx9XPyYSw3b2ZEdDMtOySc6TjBxKf1iRvja03py
         xP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071563; x=1778676363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=qUR3qUrTiDrMn62OwulHWiGKDkphWohpj8Nn6pgG4VV//Oi7mDAsZb0h35qMouVwlW
         2FF1OCS28waMaLkjxAhe94Ebia9W6W5JsFGGIq8IQGYVWgVcFGwmmQmn7ikFjp/Ft27M
         l7wAkcAbGUdwbZI4UQ8JNPATnT9IWfZDvlA+l9+xDMc0b7SISxiwTa0LcgBnyppzBRIj
         O7kyOatSMYdr0aN2cyRwNcL5XENhxUEndU/7Q5jINUVpJhIE5VnAFu9L+sXW8F7f6prx
         CjFdZcbNXMmBDVXOftcuByut4b0eS83oo/72nyyqcGnQpUAJ7yknWnUs88szo7bmC8G2
         3+Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8L2JMpEmUkVxdJFxvzTfQFXS0hbOUJeKr5S49QjhDk9GuociCvh9b10+vbGLWm19veCmVbWFqGev0IquE78rN/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6DvSJ4cNXrDQwqtHtyISwzprw+ToYIZAdzNd3ATd2GdSozKwq
	/XqeMPwKmOwjA6zAn1t8Ami0WfPlxwT6yNSka/v6HmCphlrLbILUDhvN+Nl7ESO38pQ=
X-Gm-Gg: AeBDiet5f/JABdi0VcJGo+Xg+u7x8v0VWBklWw9RIWy6nOI+q9z65Ocuf0hj/RSCNXE
	VqMVM2vspuX4HdFX0bNJlkRxkM/eXnBnytc2akHbciVvTo9+dvT6of7/XnDhBr15wn/8oYbKUGG
	/oeJdh0Ox4dfqL87wF//6vqiDLSZX/3mGB6I5KRi0gtoH5gJMYulpTPBEYtGYeVNP1LW4dA55FD
	lfjdpEVK+dUaVLIwvfopTCbZB/adlE2f7GkacXmCv8SOyCeDtt5BehuPEvxGNr1H89RKAiAczTn
	rmqiz2RIV6ej0LfxkHloLOdxi7aveAESEDBz5CjsDHtiRquVxD4ZTFX427DUR7oXWtAkZiofjGu
	ZTJaBAi2Ach5+zcYyyRW+D3CxoEK8uGpIJBQlyjLob3YcL/6tsqSndrHfWDgTMdfBJ7b0VQz1CR
	NUKcY7TVF9s4ftieo9DGcOQKztTFGVKkgqQLALgboI1KU=
X-Received: by 2002:a05:600c:8218:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48e51dd386fmr64833155e9.0.1778071563011;
        Wed, 06 May 2026 05:46:03 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm84332045e9.0.2026.05.06.05.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:46:02 -0700 (PDT)
Message-ID: <473925ee-ba57-44f4-8993-d953d29caa18@linaro.org>
Date: Wed, 6 May 2026 15:45:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_054604_972413_D6DB545B 
X-CRM114-Status: UNSURE (   5.45  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

