Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE99CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw8qvM/k9x3QM3FUGccHK4P+EbI4lHRF8d2YmWsJ6mI=; b=ljBnXShzutwBCavSaA7zQ4RGkz
	uJl7NHtpfvuzXJJfxHaRvfjrOLJlsgO4dKChMQJwtHtn+KINRkROhWHDAGkAgQ4BTDwt0WkmOYToF
	tzHTsDcGic0vGVrzCb6yasJOB8ddXb+AHfZxJ94JfvjNUgOuN1kBJZ1/qOTLWxjly+UfJnaxs18sM
	VyyNoQ5sy/e7wmIG8Asti8KK7K39vX4lXMZ1V9PdPgUZ5p5cK9P9NUomx8FSE4cictPXULKm7Xodz
	0qMhQ+wPTLyrPbkAw62TKWIBeDBV4Y/+tjoCvi3uVn8Ekkq0788RAfqDsv3MBJEoTjjy7RBXqYp8E
	jCSGYRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxoQ-0000000CF2G-3vqk;
	Sun, 26 Oct 2025 10:17:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxoO-0000000CF1m-25bt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 10:17:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4271234b49cso572876f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761473839; x=1762078639; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xw8qvM/k9x3QM3FUGccHK4P+EbI4lHRF8d2YmWsJ6mI=;
        b=szixUCW93YZMvzZoR6Uuup+w0+K1bZuhnz90vAvjphcR6C5/19k7cVi+MC7bZYlMsp
         ybnPQZ/OIh20Ky/irMSQZKOgUa81+75WGNTfOt4q3WIrLvfHibz2e7nHQbJBzSQWdl5H
         QraYKFUWY3OQ3G9lNl9KnZ14BUN1sNc+Z2Hf6+jnYGEwozy9LHUfCbN9rS9/bmG5jt5Y
         ojKW1V8IYCKVBqe7SB1SXfYwYeD8AIYW08er1Qu+2vJ2PCdEiOyDoHFAAVvwQqZ5TgBZ
         NCMThzcheu4i4yn3tDKxRTKmnSyQRI2Dj6cc4/CHgEsKhUrdcwz1dNecDlAVkMapL89L
         +EVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761473839; x=1762078639;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xw8qvM/k9x3QM3FUGccHK4P+EbI4lHRF8d2YmWsJ6mI=;
        b=SXZGE9iX2h6nVXaLB9NypBvNRACWhb6g+KQUhU1VVD8j5TPYVPVW4Ceg4NabA6b40E
         xDZg6U/KVczDvdB/BguPG6jmxUoIAi6Ed+FYHLtnYvu+GvvoE0ndzfpOlWeRZJnKerQv
         MwCVXj6DXSOuK8XerpQ4egfikqR2GWVqb+DSMLeyLc2vlqHan7Pcy+u6ZRdc8BXepet5
         vUp5IH2RtSvBGUiw9Z+Rb2pMeqj9rmTS+y7Lko+EYCFfLZu1U+hcvIE9eGErtos3MC2g
         QdqWD/dboppAlhW1y20h2a4zmSD1mspt89WWHbG3JesMQOLYRHp7mQIDWCqPR1LqrywN
         wwqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJyoD8zB1tHONrd2nfzEC83bjMogOQZqF5R+2xJe0SrNmcYqi+LECmM29mDZB5giOiZWjvmH1zr+nDH8D+rFD0@lists.infradead.org
X-Gm-Message-State: AOJu0YxLe4niUG+GxvFNCwiBF1ASvDniVOYz1XlFe+6feXV9mZfGoZe5
	66AHyzUoAuekQtBfqZDleFghwg0LeZ1PQG0GdZr7fa8OyQaxjgxH0wXcOEoY+iQ8UVE=
X-Gm-Gg: ASbGnct2wPZNmqDBX62gwQglTZC2XjZiImeVna1pR+XHN1iIsMp+a8FhYrHCfazZdv7
	fFwn4FLvbLxa2yfrLi5XbNzcEANSBU9EGcPSc94q43MxwzeSUSAGfHKIcXkRZlV9nPM+tnpjEaf
	kbJCzWukDUZqi2lb6cUwbG7P1teiFXeyvYJFmB64t2EGOGAie5yPxvjCc/mpGZl6PpqDD45uEEA
	yYI7zRTe3DFinUahQ6ftZse1KzdsbXvaHKsOPxrJDxx9WDWKFz/KTgD/VDqIHvuYBtVjlI2DoQf
	34hkNgz0yNR0J3jirW/huMKgpdjaUUTE6Q5CbfVZIEDywr2cmCd501V1QI6Hw1ewGPR1/l8N22x
	rvW9VOECWCxlKohpSyFU2Fo4JCE/PrPae9yOH3dT7xFnLUiZiao4EpkUeUj1IBZ35XWkQsNNRgi
	3pb0OCfPtXMW7lIlC2823X
X-Google-Smtp-Source: AGHT+IFFbfGbMDbsWBBs3RsW/GIAAV6RF9Uol3ZED7FMAKqg7lkgjIlJ6dqknn/N2BG9SMwePdI99Q==
X-Received: by 2002:a05:600c:1d25:b0:471:152a:e574 with SMTP id 5b1f17b1804b1-474942c4fa0mr110129115e9.2.1761473838648;
        Sun, 26 Oct 2025 03:17:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm74937545e9.13.2025.10.26.03.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 03:17:18 -0700 (PDT)
Message-ID: <908748d8-a436-4ed8-abdf-bd228292141a@linaro.org>
Date: Sun, 26 Oct 2025 11:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] dt-bindings: net: sparx5: Narrow properly LAN969x
 register space windows
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251026101614.20271-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251026101614.20271-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_031720_570529_B45EF290 
X-CRM114-Status: UNSURE (   6.51  )
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

On 26/10/2025 11:16, Krzysztof Kozlowski wrote:
> Commit 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register
> space windows") said that LAN969x has exactly two address spaces ("ref"
> property) but implemented it as 2 or more.  Narrow the constraint to


Typo. I will send v2.

Best regards,
Krzysztof

