Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6775ECD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztGWR8iEm57omIqLMWGmo/mSUeOOpIElq9fJPbxs8hU=; b=locl8OJEzFpjbB3RmQuxqgOxq1
	poEg4/u33Fkh0VGRci/fNyzkq2R1Q1sUaUf+EpFszzZkQUfg4jIdiLrtJwd85hXEIHhoA6Lmzghp1
	OVQ7ad0ePtLuzE1nhwDZl+2qtfIUuviNHEZUQxsLJ+fckMI6q+H1bUIyce1mpwJnM2osXwKoix7I/
	VGSMFMXp5lIGEMM1NjPc5HZw6VYOcdG/8kqxJC3ocXQ+UPObmzI3/mT9umw+OXhuWzg6B3DLrx5CE
	Fr0fW0TE677nxw6dmKi93fHVRXW1umBqWJwyjIks5ZGRTAauig/BdusKfcYGENpddTXrBSEdBiPoA
	blW1O41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTc4-00000002uTG-35T2;
	Mon, 08 Jun 2026 06:37:32 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTc2-00000002uSx-3PmN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 06:37:31 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso31845315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 23:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900648; x=1781505448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztGWR8iEm57omIqLMWGmo/mSUeOOpIElq9fJPbxs8hU=;
        b=avamxvsr+6WsAItkbK6a+AkHPYyN8Y16LvvXio4C67f2JmFBaLt0E2y22pY6nGHWeK
         IyowYDuB11u3MTpRmPwWJfIJriIJ/DsuCYlqkvGTvn4zKgoZPZSbvo8zbjh07SRolot0
         a418iVriBeleciq9+GpWI26mOYPcvMJYzG7ceBwjiueHd9ONTzrzPByX6nitFNcHGy7g
         R+QUmM9vz2eCjxh9DCypPGJBBrvIv9wJETjso1T6M/NwNDTzzofcPKAurbZFasVdhMQ9
         bxBxfZJ4oJYtxGf6OoQ4x14K8R4B3ZVZPA65XVuERZsIFiuuwgC5+T5NpYybC2XK/Qw2
         oaTA==
X-Forwarded-Encrypted: i=1; AFNElJ+TZbX7aMN4TnoYB6Y1fb1F4DfkMyZzdtyTjAagkVkZksZhudNiTfbYmMLNCIcODqTSUdoOZlQF5EMxHlYdrCxT@lists.infradead.org
X-Gm-Message-State: AOJu0YxIEKedycldx8v+fAY0/kUCePKoPzGctITnJVYDmv5J337Xkx0E
	lzJSMhy5Cxm8kHXa6gYfXyQiU0KZCb87Dzm3MQ+kj6HqGaNbv0RSSlM62gggEg==
X-Gm-Gg: Acq92OGNCsK/6BnkaOKY8/pUj16B844grmZIbK0AhcQwmQqqkJ9+i1XZcIGnmT/1801
	plDb9zyjd86YcMh8jud/vp/Of9eupOxKx1F94TN+dTjuEKKwo9hPfmKXtKSjajkjReEClI4Ikyr
	73tkRLKO/CmMbEqIg7xPevdCnG8PEZ6gHtjPiDbFaco7yrNvB1netiG+GVnmJLLyS3YeyjnbvH9
	lMXUMOm5/Q4dTcjHSpYZlU3Z5lZX2aRQt9cKTwMPYjPx2EF/2aaZzQv2TAOfe87qnhug/WQzR7O
	rhX6YcKAG4D9RhRfqJV5GS0qnjvnVMBQ44zauvRjIo5SUSEdQ3/JevIcL2+erqxYSowdSW6K6mw
	l/SFH/THUyt+e9TC29uydfY9+5/R+H7WQf6KPvFrK9c8ja0zhTGoXbbGiNDty/XVoUFFMgq6VIM
	lp+wmvSPOXnGKxFwyxCrVK7fe/5Zab/wFwPPGjW86+BY0AadXlywFOsYO5s4P8Unw/qQ7HzhB0q
	3OSogkkOqxFwHKiEu3a1MV2FOkTvY7B5IFp2a6BpA==
X-Received: by 2002:a05:600c:83cf:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-490c2cc3103mr176609535e9.5.1780900648453;
        Sun, 07 Jun 2026 23:37:28 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39e024sm489274785e9.4.2026.06.07.23.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:37:27 -0700 (PDT)
Message-ID: <06b3671d-ee79-461b-bbd3-bcc13d3c6538@reactivated.net>
Date: Mon, 8 Jun 2026 07:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: handle gpio-hogs only once
To: linusw@kernel.org, brgl@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260607215647.112488-1-dan@reactivated.net>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260607215647.112488-1-dan@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_233730_882998_8BCD449D 
X-CRM114-Status: UNSURE (   8.59  )
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

On 07/06/2026 22:56, Daniel Drake wrote:
> Closely approximate the previous behaviour by ensuring that each
> gpio-hog is processed only once. The handling of gpio-hogs on a DT node
> with multiple gpio_chips remains a bit incomplete/unclear, but this at
> least retains the ability to apply hogs to the first gpio_chip per node.

Sorry - this patch doesn't work as described - please don't apply.

Current code sets OF_POPULATED *before* trying to apply any gpio-hogs,
so this patch actually prevents all OF gpio-hogs from being applied.

I'll work on a revised version.

Daniel


