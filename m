Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA56C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgG9H+/yLUvbzNY3rv9rX7GNNFG7+EB7vNcdFV5CSGA=; b=pMsEQ9dED8FPS0TjCpDmhrKyAD
	jfNjoPUAOEDBRuSlZpEDOJxB5g5wsTUshuHMbjsOFteViwYfEpxRhbwVyzU02K3ZEKfIa+RshfuyL
	0IGWehjtNg3TdcmW3mXN9LIQFC8b6rdhcoLFC4dHuiAjXKb6VzvRmpmNvgOfP1+5By98wUQEmgj+e
	rh2RuGwWtyyWeN6vFlNNH0tgNCV+DV3oT7wpJMZ7Z6iOnBMUrLMwYITTIEHsdaQ5Ofc1km4ayCAW9
	kYJuJlge21xs6kkjJbN1VPRe6Xfjuri8l5S+JYGfpCN7NHYqkWOS3U91AGMbvlbraUMbQQqMLDpTw
	auXMXPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8me-0000000Aghw-1KtG;
	Thu, 06 Mar 2025 10:48:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7n4-0000000AWgD-3AN4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:45:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43bc30adad5so2455415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 01:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741254317; x=1741859117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UgG9H+/yLUvbzNY3rv9rX7GNNFG7+EB7vNcdFV5CSGA=;
        b=PwFf6VoErEyia8Pi73I4SxkCuWHiKubY5rhLXe8s8kmK9KytJkuuxarbnmHWHakzBw
         9UqZZn27wX4mdrks1jm9mADOJtm7AA6YQu9Vur0F/HTHDkZGHXI5gT8NTkmS/VhR2x56
         pVJDIBNUE7tBQBTqo+h+wbO7EowIu8hdtzAUIgpjC4jreCPD+wPn29T9Z0JJHUvaawKR
         lFFz7ZTFCyoUc3ovs+lXDsza66tk4H2LeXMyxAtKHFWmMXht40iTIgy7O0ckEJn7N+Wi
         97dy4r3oMh3x1fd5rCR9yD92X/lkVJLh7L012NuqLxS/Bx3H7BBynowr651Pt5Gc9XRn
         DRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254317; x=1741859117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgG9H+/yLUvbzNY3rv9rX7GNNFG7+EB7vNcdFV5CSGA=;
        b=P6w6x6sSPxm03+A7vRpHj0ciePrhmfGn9M2FnRZlpLuryTYC65YSqnQM2vx84+52Po
         tPxuesoCViAt+Yf9QlfE0CZyo0t5L1NdE0hBHqLU+ke8LngOfUYdhMaEH3DwTWzSSWTN
         1ZSz3MS63phU8JMVVQfHshik7wPvh9QnsY/LKcf4l3dYaxhscaFcR9vY+6Lm5EebezoC
         IQ0RSf+cP7t2z07X1C9phUac3bml0KoEvwfmbofXgfMFtnm111/nsFzoM/1IdWAw2jPL
         C1/un9iPr6uTxtX7cpMIeasd+mIUQRFQHs28nyBC9NM9c4QCkbaJeeA0vWYx5yKCa/3b
         l9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUDdDE4zl5ODuq4qedJ6y9QT+KSjruSSvd0GFp03fhmcd12DfoHp6WJ3OSpWQv83w34t1S1oUltXEnNiTfYsMc2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qDpjEvLTWwseDVYrotEdAQMqUdCLnMMMJ4u5bEMDJQNzrp8O
	9NlV5/vmPPUnKCcqOxyzuBL824euZttfmgzx17CvO0wb7kiK42QlR16837iBXZA=
X-Gm-Gg: ASbGnct264TPbCL4ImXl4SHgjRsTFMkkNOAQFl9oTfraR7DZaw4UDcpIkWx0IQRVQbE
	L5sSujcvT89axLfNXPWWJUKNQMTpWE2Km5q9N+7f8fQzVwRsfyLAbqU4VTg0jpQmSlNdhSN8QT7
	9QGEteMPmZ+RmEWPu70HNQJe+2TkQ0IxamcWg8CN5EJa5dGE2/tAdWUUOwlbFStiQSH2wepyeRm
	nR/uP4Bk94WbJFvl+RRfD2GWuMoa4jr2ThQVHWM9ySn+u/+9r6NAN4dnoV5ojV5M6tE2GrE1okL
	EZhZ1shCp6yHz1AQNqjtzFp8h7hysXnEACv3HMa2yBqr8CXZybB3HQ==
X-Google-Smtp-Source: AGHT+IEISP1nQtvK9hy0m6H6pYOyqBNm8mOvrsmIxOtK6VYosAFmYZyHfZakap513Qj/EeP2jmSvqw==
X-Received: by 2002:a05:600c:2d16:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43bd2989f68mr52790685e9.15.1741254316983;
        Thu, 06 Mar 2025 01:45:16 -0800 (PST)
Received: from [192.168.1.247] ([145.224.67.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdff57sm1515867f8f.37.2025.03.06.01.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:45:16 -0800 (PST)
Message-ID: <749f9235-d7cb-4807-b671-2809b5e8b948@linaro.org>
Date: Thu, 6 Mar 2025 09:45:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf/arm_cspmu: Generalise event filtering
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, bwicaksono@nvidia.com,
 ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <cover.1741190362.git.robin.murphy@arm.com>
 <c0cd4d4c12566dbf1b062ccd60241b3e0639f4cc.1741190362.git.robin.murphy@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <c0cd4d4c12566dbf1b062ccd60241b3e0639f4cc.1741190362.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_014518_806988_3EA8CE14 
X-CRM114-Status: UNSURE (   9.94  )
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



On 05/03/2025 4:10 pm, Robin Murphy wrote:
> The notion of a single u32 filter value for any event doesn't scale well
> when the potential architectural scope is already two 64-bit values, and
> implementations may add custom stuff on the side too. Rather than try to
> thread arbitrary filter data through the common path, let's just make
> the set_ev_filter op self-contained in terms of parsing and configuring
> any and all filtering for the given event - splitting out a distinct op
> for cycles events which inherently differ - and let implementations
> override the whole thing if they want to do something different. This
> already allows the Ampere code to stop looking a bit hacky.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>


