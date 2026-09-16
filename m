Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6173BC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyqlA1K0vb4/rd48mxGs7fCQDs5HffhajRXLz681a30=; b=qC/FXMMFYGSCgujYrn7OEOY/Fy
	YEciXRrfps7Q/BQ93L7avf9XnJA7EnDv3TML1ginNCut51pqRovNA5TuYMuMyn1m3NMKBZEDhdD/h
	RQfEAmF/OPbSQ8FRox35R/vsSQPvPJA6wqEc122F4mB9x/W0DrZPsuudqGwP5+ABzUpWERYKUH5/b
	/sPNtcw1ej5K6aKXL+cLz+YszfCOI6UtaE4emvZLnsTdtalycKK8EjG0sGzsRmlAqj7kL2O2pLxl4
	lJmLgOYwfa10mXxhRCZK9VZAqOhU9GppIKH8HACqkkfyqmkOgXmzudGp86jayuLsqo2gEn/zKtcqq
	4hUzVabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sse-00000009nfG-3Jc4;
	Wed, 16 Sep 2026 16:53:08 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ssb-00000009ne5-4402
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:53:07 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so887911a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577585; x=1790182385; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyqlA1K0vb4/rd48mxGs7fCQDs5HffhajRXLz681a30=;
        b=adMUd7Zan1uU4w1lOgvAp7hltLyBYDAnth5+ypbjtl5VKjlzp9k7Pz/6fImz82/9rs
         +C3Qml/vUuBmubetBYIMtisVanvxEY+e+xWev73ZrVLH9vBHXZL7vv//DhaS2nTtBxPH
         eqiXcYLgaSBTdrUQZyjW/P8SeEfgoeN2aSJPhVCQvmXeYZElQfCGhimjvpWqKXCrGMGz
         XmRD9VI4eU0uzrPIWr6oxB9XVRDqbDpc0X4qd7SO2/M8ER1ZErQ+kuf7MNDodsfMia1j
         XfU7Exac4Rh4OlVSk2SmaBfF6h43fE8AenVaszuEU/rKlKJyLrdKRuNXzNNVb6EHKdN3
         VN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577585; x=1790182385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyqlA1K0vb4/rd48mxGs7fCQDs5HffhajRXLz681a30=;
        b=xaIZW58YSgqjzaJviwpTl+1fybe/wjaKP1uK/me2zLd5L0ixrO0lpSvaAXwYVyeD0T
         VVazgO2KNVMn1yapZkffN2xD25AlJ5dERFfoC8Vbl4WZPAiG3ly2ehd48wUYyZ/p9cj+
         nkw3fl8psdzCknL49R9ygWV5eK4YrsK2nfwmQmBoqYUO9DTuI4l7APVM2I225VDtDwet
         1wKuxxZJdd1xDVSI+PAWEHizJi/mmbVK1/qnbnzgVZ35zCNnOgtJ6U7DF6t+y7ZjanhE
         F3KT6shsPJed84FAzdTXE33PXG5khfH/svzXzOXDUph7tgd/0GxsgwarSLWKWdZIzzke
         X5uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfM5/Caz6z7w0xGYI4y/UlCChryF3nh7KNiVF3zf3TMepQn2GD2ABpkW7VoUhb41OC2n2A1AuzVGOFoS9PhsDz@lists.infradead.org
X-Gm-Message-State: AFuF++nD2rzPi98s1gCTonuKAb78+/yoI883nbkWBnFcYv+0vGKZAQOn
	jdu2hTYjDIzrtjxtN/l9/QpNq1Upy85j1QGMXBzMo4Go7xzqDkNbh+hP
X-Gm-Gg: AYBFou0c9DSMlyJn3tM8bJsU7eYEgn4osczJjQCRYxWFVgTQ0pNwOi4pPIqw8LbzI6+
	Soy6Hg7VAil/kL6mJjBZQt8ULvvVn9poAjv/OvOTDDEH7ER336rGSWg3K8jyIUD/O8A3WZrf3QE
	Xynq6VPlnC+4r4MxqtaXFy9G63UvGGhPfjIR0Si3zlr+Pb0QKm6iidt/7HcAJ6OAy/I5KvwFrJE
	rUcOH99yiXaM94HixgX0xvzO39KWGpi/wzbp+FIH4Qkznv1QGJAQTIe3xCqsoYWMg7baDWojo6n
	RdmXhhtIhX3qjqJdD1vIr4bP+kGLDZqNDDUAB5WIXQbSVWBbY/1lzypU+c7BCIo/Hzqd5T10Kir
	WUyDMjY5Hk1X9dfT7QKHMlZlDa1XCX0y1d+I7zCYDie48S7jNRZ2xtAz3qySEA/RBpvJpGyOOl7
	OARPRZdFkGd8XGGY1S37+smUJCNfXbSv0+JMfuh3onhL0iuEXrckgh+9rsROJBMK5/cQobM1CYs
	Va+x8DlMxeJW3U3tWgoINCOtid1+cigWWo+XPJZ5MixSnudkcVe43IyR8Vn
X-Received: by 2002:a17:90b:5866:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e1e25a32fmr7684849a91.3.1789577584902;
        Wed, 16 Sep 2026 09:53:04 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c2c5d86sm2168471a91.4.2026.09.16.09.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:53:04 -0700 (PDT)
Message-ID: <7d7f33ee-1f07-4170-9d0b-cf5d986ab19b@gmail.com>
Date: Wed, 16 Sep 2026 22:22:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] cpuidle: psci: Move initialization a bit earlier
 in the boot sequence
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
 <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_095306_782003_9619E1C4 
X-CRM114-Status: GOOD (  18.08  )
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

On 14-09-2026 20:31, Ulf Hansson wrote:
> When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
> it's of great benefit to attach the CPU devices to their CPU PM domains as
> soon as possible, as other non-CPU devices sharing the same PM domains
> depends on it to allow their devices to be probed.
> 
> Let's therefore move to a subsys_initcall, which should be soon enough
> after the cpuidle-psci-domain have initialized the PM domain topology.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---


Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> 
> Changes in v4:
> 	- None.
> Changes in v3:
> 	- None.
> Changes in v2:
> 	- New patch.
> 
> ---
>  drivers/cpuidle/cpuidle-psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index b250d0dde760..0187d6a9096a 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
>  
>  	return 0;
>  }
> -device_initcall(psci_idle_init);
> +subsys_initcall(psci_idle_init);


