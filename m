Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EADED7496A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOrqOC5iQbPsgw0GDAF8bS1t4BrrEVQdYEt9Qz67A0o=; b=ozfk/dUr/rsQRZol4kodH4j1M2
	npBjACyNFELJ+9W0tFiJffuosH8fbAt2bg+9NJZ2bLXd7eecuU/RvbTShEm2mojtIjupl7W6nEO9u
	1j15FWiP+pfvZjRkqzQeOjnukuevorZOmyRU7z1x9bTG9UH5byP6w7GBwB2C4irZoA0ACTE9x3kwu
	MlyNFDlny/pNA9FkshV7+NdahU3aX3T3Ww4EMhLLuk/fi8NftLv1+J8SBl4BUF0ER7cLw4s/AR3O9
	Mhb6c9/nfzsIxI3KM9GzutCThbNldlFnCeJqEuaUSPx2D9pJ0TH9jSdikeqHvlRECyphNh4cgLNsk
	iojhyUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWcc-00000009vXe-3NBX;
	Fri, 19 Dec 2025 09:18:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWca-00000009vWD-1nKX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766135877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOrqOC5iQbPsgw0GDAF8bS1t4BrrEVQdYEt9Qz67A0o=;
	b=g4jOVjbEmK9XEuspXciVHvTff7vW18gG4zsAK6UmVadgZkJvfTEeinxOs/EkCVs2UQ8u2O
	qJ7rnSB08Vw2ZSw9njkajDPiU/7lrmPrh0gjy5unukPfun5qXWlZlExZkFfkS+RgXQuVVV
	UyYmfAFtGZcE9do6PHZiPI5NlkOjSjg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-WEGMJSt4OWi12QUvx3kBFQ-1; Fri, 19 Dec 2025 04:17:55 -0500
X-MC-Unique: WEGMJSt4OWi12QUvx3kBFQ-1
X-Mimecast-MFC-AGG-ID: WEGMJSt4OWi12QUvx3kBFQ_1766135875
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430fcf10280so997099f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766135875; x=1766740675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOrqOC5iQbPsgw0GDAF8bS1t4BrrEVQdYEt9Qz67A0o=;
        b=VaMw2QxMgM/8vHzJ1jM1aLspjJk3qqEEjfthhud4yZZa6iepAIAU5CHfyJ4Jt77Yc2
         T8sbj/W5gFwSRaXrmNA5U17k2+hvM+2okP2xtwmq3CSy99Myp5RJKvib9p+JbR60phqo
         3fogz4Xv4ZXiNx0DKh9q/Q6/a6rxzdGIqhjNugGVL2WWH3+Mcb98dQi5ccnKxcCdqvKY
         OFFAKt7BSHFwM5sVvqJbF94VCOcoLYh9QQ5/mikdGCPa8BgjShgIPzBzbzlk99/xnrSG
         FHb9+GqK+KbZhAqkL+mEhBYH0phaYmbnkBxg3l39PVorp59nQxPpwSyDmfsjoot9kttV
         AFMA==
X-Gm-Message-State: AOJu0Yzz4H+ASpib07VWapK0pZYVbsoEYAh1kJCu8+McHKmoiBuqJbtX
	kXoYwm5kc0px0rUxIhgNv1pRxB/+v9gRA/+AWezhSvbL+zANGBK93cCO5J7BKs64CSpuToGO3lZ
	60Ptqs4HhkzcfXDvV+LZqbE1YVoYWUk4nX8eyrjcCFyG9UscCECszqhU4M5CTzxWKNXEakR3Dng
	ai
X-Gm-Gg: AY/fxX5jcJFrJT8cw2Xp57/3ZoUaNqLmkjDmi4ATxCMJuc18P73murKvLo+Qm4KYS+5
	2NPVT9ZcgliLjHr6dUpWhHDyHHtMkKvtIRnF/wDvCBEWGPl9OlXZGN9FAEpYhLWnISLyQQxICCc
	omZbjwT9X5SdRzy13nPQDaFv3FSwrdh+9JFCWZVM57SzmWCdEE9p55Pn+HYJ3HUFIdu09OO5Irs
	w3YTF87a71JyxjzbR8LrtXoV3QPRDErrXNxktbMggpEu5TyPNBKdfmYiltIFrfxsByl2+YfcPJ9
	S9E7MLRbh5VbYOhIhjDGHlfjwjd5Pp58YzhSJFyb813J8BPSb18ftJneusatsAP56jeYsO7epi0
	eSG5UMp0EieDO
X-Received: by 2002:a05:6000:178c:b0:431:104:6daf with SMTP id ffacd0b85a97d-4324e709ab3mr2628701f8f.54.1766135874641;
        Fri, 19 Dec 2025 01:17:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgrjQPRHArCAjoq010AgJgcm4Stpg3HSOJLPvFxNuWXO0HKkDXVAQ+3nly1Bi0al/c+unpYA==
X-Received: by 2002:a05:6000:178c:b0:431:104:6daf with SMTP id ffacd0b85a97d-4324e709ab3mr2628669f8f.54.1766135874255;
        Fri, 19 Dec 2025 01:17:54 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm3924193f8f.15.2025.12.19.01.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:17:53 -0800 (PST)
Message-ID: <3c72a0d9-88e2-422a-9f9b-900ca7867091@redhat.com>
Date: Fri, 19 Dec 2025 10:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-rk: rename
 phy_power_on to avoid conflict
To: Lizhe <sensor1010@163.com>, heiko@sntech.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20251216150611.3616-1-sensor1010@163.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251216150611.3616-1-sensor1010@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WEjLhyMzn3YJ6xVyDhLtPUUWGiiaTQ6rNanVNJZP-XY_1766135875
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_011800_614861_730324F5 
X-CRM114-Status: UNSURE (   7.45  )
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

On 12/16/25 4:06 PM, Lizhe wrote:
> Rename local function 'phy_power_on' to 'rk_phy_power_set' to avoid
> conflict with PHY subsystem function. Keep original error handling.
> 
> Signed-off-by: Lizhe <sensor1010@163.com>

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.



