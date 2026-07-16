Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173EEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8dMwf2MXhdAxkhcE0UScQxJ/befx1264d3qYo6rnCY=; b=Hq8hy3FpxxAX3lFbXzsqtbEere
	u44OXPaZBwYHVczGfvdCE9e66uonhQ1HfIBenwzGY/9+FN3SHAIro/aC4SV+pESkobYu1J9KA2aYl
	N5uqZSHY0Ce3nmL3us03YVWA54+5UZcK4RtLNG+t2YeRTw8zxunNZqrWNhIB1TwNdZ3f552Wd+89f
	IzCgVhH+a6rrG+9Fj8SUDjeC/IdGBE53wxLeZbIjDndGQSecYyYElr8Zvt0k6IbmX/Owl28QUjP0+
	l7R/qZsfyN7arutZMvhR6kQ2ZyAhiL9lGSwY8sSH1SjeoDpaoc5Zkwmxs2zgcl/rp8+qQvTwPiost
	O27ata4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQDS-00000000JdZ-0IvM;
	Thu, 16 Jul 2026 17:49:46 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQDP-00000000Jcn-3oBr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:49:45 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-81e9f7491ffso87020097b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 10:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784224183; x=1784828983; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8dMwf2MXhdAxkhcE0UScQxJ/befx1264d3qYo6rnCY=;
        b=LVsHpy3ZMVPRnHGhcFvfVUYZrCl9rPmj1emP9EpvDhIiASC7nFI+Na5RkLNfwNhHjb
         bxUFcNUWdFT2k5Ph6VRwkt0KRdWe+sFlVROJrN9kdyIXs81eyUuoxCapV3/eYUtnmx6o
         QFjvhe8+7YYZjh3jT0sAvBz4oYRBZhnhX5/hrv9nL3q0WcG/QA5SquRd3tLtZVGB/Sax
         rTaGeNWrj3+t6tIY5zhNFvC0y86+ZaiWqfGFGSCn7qHyOmikg/aRvH6irI5qys5FBq9+
         seqSwt3i5MsNlZ5OrZ3m7vXxmTKZPQYL6BuHoVANlVqGPOtHKIaeF9fpFxKOW1DTi8pc
         A0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224183; x=1784828983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h8dMwf2MXhdAxkhcE0UScQxJ/befx1264d3qYo6rnCY=;
        b=nW7yYS0lCL0Mi1cW55ElXvNL0ntj5SC0XsfUBqBTfAOpDr/MI6gVPT+7mWvYcjpM/9
         30vwTkayON55axX5NP/GeIxtTT3wq7IxfNHOJQgMSB8yPUSq1VIdXAf9J4IdP5y3H/eU
         ML6aPf3T/MIT4+mJFF5t+wOFhJUgmBRpcH/ouQlokJjYhbWlmYYMqQc/F0XKF9DEaxZw
         hHlTnVJWWk3JmUT8QteJehnm2Uxfs2bDmil9KWze/t8pkXW+jTCX3tnmxJWAgu3QUxt9
         2dWsvpUDBQD6vJ9TlSKyMmxVF3sj4BocS7yjP0UcWNZPr6sjuwIj/pSmAKJ43ItJLehY
         6gQw==
X-Forwarded-Encrypted: i=1; AHgh+RrvZTZAm9RbRXcA1n4deg9ynjRbWdNHCY1ci0hRRgkQp1y2vBaIVnChJVXX73THbMukausqh8ur+Frq7FUw3Sfe@lists.infradead.org
X-Gm-Message-State: AOJu0YzK92Vsx1bHD1kzUappEAOsVb8SdCFH0u5VZV1yecNcq8EyBX1z
	NOhBwg3mMyzdvpeX+gIWkxEpyHcqIsDcIgA51rEQwc4KD5J6VsXk49Kp
X-Gm-Gg: AfdE7cksMbYvyZnSjYt45pWQVrZh6ZvxgFZC+OR3NWV6LPPGDiONET2BsbC2fLklq/R
	k6VyXSiziqor5AAmJT+TpTjFwC6Zoyh/q0REwtEUoMiuAdyE2vcCKXqfetuoAhL42doDEkEUDxB
	zAao7yTzKCm9boNFD8L5x3AFyU2swvor64BLXHeYqDQGJAPfI6/eNG5tEWwcRENEY4gAWrNuNZV
	DFKPe4XCz/vaTdH7jQctioTkUY3PL8IJnL6xs3eWdsJy6YJf4s3OoYTqBPaJcQ6KP6z9DnM5WrC
	p9+UowKwiwZdWZUMmVa/mZw6b+J8t+w+qSK995sS1XKOa1Iu7GQ1D1w88ZP8/mKKEkE3y9dIjH1
	YhOd9QLj7MjVBi21pMRvEAhgNMR1lSAQ78c6T6kCVdbCL0tqqjMqHj8Cs3izvSbxQyvArU3Wzk3
	kaC7awFH6VhTn15qptNVhHqA97GMsdCJ3dHZzU8PjM1d9sSf1eF0X+cViJabIW4Oo07yHkdrrSi
	ow79um3baZ2o6o=
X-Received: by 2002:a05:690c:6c12:b0:80b:dc35:6a2 with SMTP id 00721157ae682-81ebfe0453cmr90014527b3.18.1784224182692;
        Thu, 16 Jul 2026 10:49:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:566e:ba00:93df:11a7:3aae:a53c? ([2600:1700:566e:ba00:93df:11a7:3aae:a53c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1ee792sm201943927b3.38.2026.07.16.10.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:49:42 -0700 (PDT)
Message-ID: <9688c5bd-db01-4234-b9da-809747e8cdd8@gmail.com>
Date: Thu, 16 Jul 2026 18:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] soc: qcom: Hide all drivers behind selectable menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
 <9bb44840-c3fe-4bcd-af2d-149dbc2c7c8c@gmail.com>
 <5a69bb8e-8a06-4678-bf20-f0dbf76f47c4@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <5a69bb8e-8a06-4678-bf20-f0dbf76f47c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_104943_976300_D90A6E88 
X-CRM114-Status: UNSURE (   8.00  )
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

Hi Krzysztof,

On 7/16/26 06:48, Krzysztof Kozlowski wrote:
> Can you share the options leading to that? or config? Without
> reproduction steps that's really incomplete report.

Sorry, I spend a lot of time looking at unmet dependencies. I forget
sometimes that these are actually pretty rare and not obvious to
resolve.

To replicate, enable QCOM_PDR_HELPERS without QCOM_SOC.

The problem is that QCOM_PDR_MSG depends on QCOM_SOC because of an
'if QCOM_SOC', but QCOM_PDR_HELPERS selects QCOM_PDR_MSG without also
selecting or depending on QCOM_SOC.

I'll send a patch to resolve this.

- Julian Braha

