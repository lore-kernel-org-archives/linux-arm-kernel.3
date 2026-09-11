Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B85AC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgyMvad3ooLpvm/jCLKD7Z6/JEFk0gV7nLYGOHZ1KIY=; b=bD3g9ZlhhrlEg+QkZQSmbUDwAq
	/TERPbnRM8QpxM3TpvxXRC1qIDBCNZyznNtJnnq/N0Y0IybhKEvRS1+K+ZsYx25qdNEjOFLOeTDsQ
	GsXV/dK/xsZOyvunANabTxUyPYFgOKt9kXVf7JyrUaKoToeFQYHdLZjyt8hInM6uTNApsuu27ZL/c
	K4ISPh10dWH7ty7nhjLgoAhA76ISayVwlwZzB81f8dpD2ttOZ3l/2XYfc/fdvOpNlrleJKGRHQiwK
	vkzTK8zdktQHqMFLFfC2hzigAydxTSBJStA28Rz3bTiOsLvNy9bEgF6fgG5o8Uu6cGZjVeYzP4yoE
	KZLK6thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53sv-0000000HBTA-0mi3;
	Fri, 11 Sep 2026 16:13:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53sr-0000000HBSn-3HW9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:13:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1247716a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789143229; x=1789748029; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgyMvad3ooLpvm/jCLKD7Z6/JEFk0gV7nLYGOHZ1KIY=;
        b=EYOAqMx/npAVhh1HiNEfcm5bGkywM//q5X2hv4/aCNO5TzUTtfVuJkMFA3LVsNkRjV
         3gsLpPXy2Fs+/9e4M1lWj3ZmPa76daJ5huqYa5UDADxQnc2ePec2MxFJI331AdqZl/Yq
         Jm5nNZ3xNpMetl0lFTyCmn0Tm7fccrSn92rHsjkhkvEva9dD9Vd2mouQRLt0KyAm6G8G
         oQnFNTzHkp1GWyEqnK3pEfU+8D20hd+9VKN3JIx049CPc3Vbvu92IoGOYrNAdhgc+66B
         hLEfG6r0idX1TiH/5FMhIEenCfTT0IzJFHox/InACRpX2MsdMMeMa76OUW7iGQ7L292L
         wFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143229; x=1789748029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgyMvad3ooLpvm/jCLKD7Z6/JEFk0gV7nLYGOHZ1KIY=;
        b=q5h5gHNuzMLeMMg+m+TGCC0CJWS7cIfpDVcS7wrwIq73RjW9PjkUbM7ArWcUX8LOgI
         3rw4pObA6SqQ5hMX4hTbFge+aIpAF29JDOg20Asl+s+OAZ2hK53RJc2H3IgFa26yQAQK
         ZSBM1VpfFmE5VaLPzdjeXuv6vtvI9QAgYleczkuu2yw/AV1zls4V4MMloPSJkOgyRgrP
         IIYtluT/g9+d7/ZiIBHcx1pjdKcv5RTvWfN6EdE7KHROZGQCx0edhmYhTB6TeLWsEz6i
         svcUtpuq8yk3tfIp/KlIEJ3Fo/hhxrOtRMZbH0grlGAvXdI3W4vSJVAyFD3B5T7J1jpS
         KQ+g==
X-Forwarded-Encrypted: i=1; AKwUvBzcGqtQZ5CQvG9eESb/yQtUuoNVeCPe3Q/SmGtK51Ee4HCX0rIAU7rmWjPAtCPv7QC8b70meqB5hZF7GjaogNQw@lists.infradead.org
X-Gm-Message-State: AFuF++mSNwgw75S2j/Y1zmf6eUCEeQnaZLu06+7yAv+1CzTfUCZWCjpa
	9i81sykgcqp56uFnv+4K6Gz7vqjOIYYQiO/+gK047Xn7SUNq2Dc4Eel6
X-Gm-Gg: AYBFou2A0dlSUBNlDzl/bHjdZziXm2hsAjC183aprmWkfP07Pii7bVC0RW9m2W1721x
	z86AKebXd7MAAa34vvYbkbK4oV5Oh5tUiQa7x+T1lZJ86rOvapelXaAwzkPpv8zafLuCINEW9FH
	P4o4vM56Gydc9paVTcblOUKy0DIeQdlKE7I9hD/5eUzfkK1g6vdia4LFUBqIjLguqH6N7xQLDV/
	jUcSjO5YWHpY8aqUUTJP6PtncJ2VoSTxm+DMNFYkA+3yezCDRn/FztbepNF5NkleHvf4ePYNTBC
	wWYT6JU3xF/w58OFmpOSQBRHlmWVAU89qUU3R7ZOk0fGs3hMyAoHuKB91076Mzxdi18rJJdb9aO
	qnMnt4Nqw+nEQo6PuP6Uzhjsn1+P4YBrK468biGEZFe/ZNsF64Qqp4amiDsemvfcyQYhlG88Y67
	0Y8qoqavVpL2sXyiMFrOps8rBXafI/HeQ9Y7LuiwypPEfLPzi6iO9SgxQHVOz8Jiq4cOAl9vy5z
	iVR/gFzAmyyO5sApdQ34ut7Xo5lBBX6CyrHaSARUPCzIUDYyw==
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr8571433a91.24.1789143228656;
        Fri, 11 Sep 2026 09:13:48 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm5497522a91.3.2026.09.11.09.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:13:48 -0700 (PDT)
Message-ID: <daad9a84-61b1-4983-bb22-030c33cc6ec0@gmail.com>
Date: Fri, 11 Sep 2026 21:43:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] pmdomain: core: Add a genpd config to support
 unknown initial status
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
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-4-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260907111659.263324-4-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_091349_852486_BD6C6464 
X-CRM114-Status: GOOD (  16.11  )
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

On 07-09-2026 16:46, Ulf Hansson wrote:
> It's not always possible for a genpd provider to know the initial status
> for its corresponding PM domain(s). To register the PM domain in a safe
> state, the genpd provider driver may therefore have to initialize the
> genpd's status to be powered off, as a way to prevent the PM domain from
> being used when it actually could be powered off.
> 
> In these cases we may end up to power on a PM domain through the genpd
> subsystem, while from the HW point of view it may already be powered on.
> Under these circumstances, it may also be required to keep the PM domain
> powered on until all the consumer devices have been probed. In other words,
> until the ->sync_state() callback for the genpd provider in question have
> been called.
> 
> To support this behaviour for a genpd provider, let's introduce a new genpd
> configuration, GENPD_FLAG_POWER_UNKNOWN.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> 
> Changes in v3:
> 	- None.
> Changes in v2:
> 	- Rename the config to GENPD_FLAG_POWER_UNKNOWN.
> ---
>  drivers/pmdomain/core.c   | 6 +++++-
>  include/linux/pm_domain.h | 9 +++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
[...]

