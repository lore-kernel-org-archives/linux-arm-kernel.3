Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55437CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IZiOaLTYWrn2PDbPpBMfkH3Yjtj8eLXjgw6zPQrEyE=; b=ICGc94MEmTygkf8JraXqU/a6wY
	r5Jjq8tTJqxe3OV7daLEQdqvGO66M1EAe06jigGxd+AO1ByprRttnvVxWYoNdfuqp1lijoP4c7dkP
	UnnN/ZbUQ2fJn2JDkpE/+QuWnRk+HFJs6SJws2bWsghJ/sRLofQl0dvbiYDv/sZk7y+kdzmlPQLEq
	gAhNZy9p0bfQiMieb/NBLNmwAsilgVzgIuEcXFoULw3GXL+USFVxJF3Rs684dLof9aFmrbyj+aOQ+
	K4LEFhlWeuOhZWUjImfMFKOMWPsQJ/mlLavGcXbX9pTy0NFS3kEcHFnGjImJaeJSj4+MOzuvaFLiP
	5Pkev1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUCm-00000004Ld2-1l2g;
	Thu, 30 Oct 2025 15:04:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUCk-00000004Lbm-22Ky
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:04:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47116aaf345so774205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761836684; x=1762441484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9IZiOaLTYWrn2PDbPpBMfkH3Yjtj8eLXjgw6zPQrEyE=;
        b=xlkiWXpKXjNRo+rJQZXanx3KqlCXQzxGiGf19PqDwi6ubwNkCe+y7yo5a7GX2j9YFV
         1oa6Rc8vxMzg/v9l30NDD3wgjFdF9QwNJRa/XYwHhsnojKqp9WM0ImZJZE1KRfmj8mUK
         E7gfBEJRPmWlks0O1ePqjRU3fLlgo4LIIbX4Zja55oLL5iWoJEw3zFsX8LK4CgiOqYNs
         pW3QCIjAPp4Q5nmJaVLhvmh0AVWCcQ9sKOnv9D0zJt8ZEyntmVskZ54lJf0Oe0+/7VmN
         UZmYcCHn8JisktMdWg+7yjGS9iUiycnZ+JyBAZydH+KMIk8XFzBjcU7epPta8vcZ/Rqs
         vr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836684; x=1762441484;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IZiOaLTYWrn2PDbPpBMfkH3Yjtj8eLXjgw6zPQrEyE=;
        b=JQbZEXjVER/zdEsgHvZEtIHInG3EG3DPArIqncHK7KaS4gcP+7Q1QTyAGKo0hFmkY0
         CTDutzYL74zUXcyo0H/8yzygfM+Q2isQTe3naeGVOzZJk0woWui55nM1GrhhATDZOZ/4
         L5hKFOeMltR0Q2aA3lIrTH08b2JQ02PuwNLL2/4I4jvyvHmKKeigAOuIBqJQCsy40Ipt
         542gYyt6hPj9Dz1YF7UNWXDqa6K//8JfugQZMnnlxJCxY15Cx1oNoSOBzvl7c1PcbvCv
         c2jlO5LB/kBD+6m4rJG6bozXaTBN6ldkioIMZCfg7Ms6HPlPb9jDupCJU70F2iY4ka/U
         mQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcBNznX5bcHcb2m8+x72KXIN+wwjPpSc9kU1T1XRyiwGbOmQLabqQ1sTfxgJWK/KHOKd6dK8V7UDQSAxs8UhQD@lists.infradead.org
X-Gm-Message-State: AOJu0YxWuxi74bw/EVdHoOAT955gzwPWmZX3k9Veg0c2YsgYpSGm7OoR
	VcabstKROOS4bKViIqjcltKN8BwjunmO6XSiCsyMSiAvgIVvlZmjic9jb1rj5Idqm1k=
X-Gm-Gg: ASbGncsZY7+ZPHia90ovd0+nA03EYnJJqUm+l0OX0lqmY14DPzfG38xVpjylRczXwdF
	2xK5tWVCpwK71ag5kzkUp5/tIrAZW/s1dlu56op9Ab0yd140AALJWpAbj0zysPpwJjQMi2eyFmo
	XwrvCDMKAWfDstIjxDq07FgTJndOjdzflHgF1JU6gSNxL/X0zg6msAypsWdr0e3mgVLasygXgH3
	LJJwHOS9VL9xQgIB9KO5+6GTLeUkrXQFdZeWBbipciMnXiY3Q60MVhyFHetPbt1YwY2qiTB1yw3
	2W13KI5j0b785nihR2UtR8j/igiKmBnv7F246oiMkrkqEA7L7nGnbtZprSa2Y+qaNGAY9TlVVfq
	7DQmaBt6ie/ePwPa8HwtzDwZYf9xqV9WisUs6C9eruFa3YrD+Ai5X9jYxIKLy0w/kn1ma6fG21v
	JHQiMJPzzFqnEo0sQHNvyR
X-Google-Smtp-Source: AGHT+IHFpMD0eVnDwb5oVS94LvcYZChZWMQJPJhlP6HnGENuDl0EMyzMQMQXFK3G3pWhO/ZhJFfQEA==
X-Received: by 2002:a05:600c:4fd6:b0:476:84e9:b552 with SMTP id 5b1f17b1804b1-4771e1cc7f2mr30753005e9.4.1761836681829;
        Thu, 30 Oct 2025 08:04:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a7csm32848290f8f.8.2025.10.30.08.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 08:04:40 -0700 (PDT)
Message-ID: <ad1bb032-6d58-435b-b2bc-04aa26d41d58@linaro.org>
Date: Thu, 30 Oct 2025 16:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200
 SoC and CDCU1.0 board
To: Albert Yang <yangzh0906@thundersoft.com>, krzk@kernel.org
Cc: krzk+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, robh@kernel.org, conor+dt@kernel.org, gordon.ge@bst.ai,
 bst-upstream@bstai.top, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
 <20251030114007.302401-1-yangzh0906@thundersoft.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251030114007.302401-1-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_080446_591530_7A365F71 
X-CRM114-Status: GOOD (  10.37  )
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

On 30/10/2025 12:40, Albert Yang wrote:
> Hi Krzysztof,
> 
> Gentle ping on this series. It's been two weeks since v5 was posted.
> 
> This version addresses the DTS coding style and property ordering issues
> from our previous discussion [1]. Following Arnd's suggestion [2], the MMC
> patches have been removed and will be submitted separately.
> 
> Patch 2/6 (arm bindings) already has your Reviewed-by. The remaining
> patches (Kconfig, DTS, defconfig, and MAINTAINERS) are ready for review
> when you have time.

I don't understand this ping. You received the reviewed from me or other
maintainers, where we were responsible to give such review. Probably you
assume that my job is to review something else here, but sorry, that's
not my job at the time of this patchset was prepared (we don't count
here recent changes because that would mean you ping me after few days...).

Best regards,
Krzysztof

