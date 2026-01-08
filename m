Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AA7D148B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0/cSpUe+jDr+8mlVfQEeowGuJ5hrCv9cMD4OiGr0dA=; b=2zcExVTyeWVv/RawGuBcyGjhgK
	vz4Ppa/sAnvOfa2fil7MiDTIkBikkI4l4F0hT+Spw8EaiuEU83f5Xp/a+L88bmOHiZb4zzm1XkyPk
	1jFup4yHJfDoVUUdjPVrbjroAJ2QLvJ42sr2xozbI8FQF4l0/g3B/ol4aVT1j8VraMTy+DWVnsnwZ
	foaROzowtyixYuNWjCO8MZYGMSSFKmHfPvztuCnbejhIwbHC5pS6IqeTDPq2GVd2fpjxUGW7gMVGj
	8UzbpMdksuQKfdfP3hTFtQbU4fweG+YKg2c+8PgwJD8GzVeIl8BJIjvNqLz+dO3sMcQO5v+oog0r/
	DinrMe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkFV-0000000G4Jb-3oeR;
	Thu, 08 Jan 2026 07:16:01 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkFT-0000000G4J8-2t7P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 07:16:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so4575951a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 23:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767856557; x=1768461357; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0/cSpUe+jDr+8mlVfQEeowGuJ5hrCv9cMD4OiGr0dA=;
        b=bEYPg92hhlGvtbYgOZSxcImrA6+Yr6V3zD2u7F3BoDTdSC8kp54UmJCKhfPhrWHd42
         tfXZKStFw9eGjehnfc125Hi3B/4pUIWwQZhbecdCpK1D1OE5dJaZkvU9xljukbrI9IMW
         SrRKTEnPZL0DbI7P297a87bhIQsSJ+2ZHlYIv8u6RHpSRm/ZhWHNp5WMhUOx6kpAvOre
         +1Dgo7q6rlHTXWe8uqWPVo4NAgmKM5fWIiUIRqB47KZgPIwZDanhdhC/sik1RVldozhD
         9piiJiM1zNYj3pGsSbM3oz+FBwPqjTylg1kW9KxkAbXCjsFjDDXXwWfFBQzpdMB3NURw
         JDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767856557; x=1768461357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0/cSpUe+jDr+8mlVfQEeowGuJ5hrCv9cMD4OiGr0dA=;
        b=w8ePSoa3czifqjaBJDVQwUwZm6bO6pMyHilGme3I67ZZcw/6UPqA5NJe6pqw42zpbS
         aYcyzXpsKNA8UWelgGtCU3P+OTW04LUYNOceRpsOPaPK2aUHfvEU12UE4nwk/KKVbu+g
         pqY9aNJ3Gs9qbQGG+qZiQ1np6B9vPp+Znunq+MSxwhzRi38XhmIilF4t3yN/XB96Qwba
         nVwj3YQCFyRWLm9P0ndkrMCqO4uRVjXy/GK89Uim0O61+nz+DVK6KPNO3FJHLYShpdMf
         7yQa3PUc49kuK65bEVq0WQnYnymmCRgIZmZwASETxLZw/gVIaA4wFoGDBt9DkC7cOdv3
         1+Rw==
X-Gm-Message-State: AOJu0YyLrK5k+a87//T4BSKnY2ZbuyO+/jgz8doKdDQMqJpRkhQaTr5p
	jlmCFZ6vQqnFsWajxgFeMl6disrlMa6w3f581ajduWkZZy0ZvCHBe15c2Me8MiJEdYY=
X-Gm-Gg: AY/fxX5daTiibkm3MyCApq1ikjpY5xTNTgax2LWxFSLK7Pt9IsmaE78/5N4TYE2uuWG
	yje7Ul8EopmVGaMKkb0JXxDwSxWg5waZ69LfBJMLvS6PMVyLXNB6woLToAb43Rraxi7rDcrfXnn
	mC3rP1KnIPTCRj8m7BSj9qXjb/qvuEdVoDlf6kn1Y4XriVrJoGdf1knDxoTO4lY8k6C9DfH7kpp
	EYmxlldWHYuhE7nMbiGONy9TMbWNwbRFt6xzcMr2IaLTzfK8Apx4R9feoty5BuWizrRVNlifWzY
	ypSGU9heDpxBrNANenbkfJNWnNIi1Ur3iRdF+wW3xx1/Ir7c7HbXG2Jf32p7ap97HPTxwFu17hM
	1qk81FL8NyZnImj0CmEjjPAv0Eyi0qb+nVL5Q8Uw64t5BgGO5YrO7NaqawdLxAY9IosrVQKgBJP
	pzPfCejsnyokADqjq+3gtum7Lj
X-Google-Smtp-Source: AGHT+IFqeAdT3XRWDHO4Gx5qxuUZmeOKltliXy+K8Lkc/WtNBQtg8EEJ2lzyy2IW5Zo2A6voGFKc8w==
X-Received: by 2002:a05:6402:3554:b0:64b:416a:cb48 with SMTP id 4fb4d7f45d1cf-65097e4d8a0mr4615529a12.19.1767856557108;
        Wed, 07 Jan 2026 23:15:57 -0800 (PST)
Received: from [10.116.161.247] ([213.233.110.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b22c3absm6856743a12.0.2026.01.07.23.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 23:15:55 -0800 (PST)
Message-ID: <6d94b650-bcdd-4e5d-a607-5285d42b26ef@tuxon.dev>
Date: Thu, 8 Jan 2026 09:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: lan966x: Fix the access to the PHYs for pcb8290
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119134750.394655-1-horatiu.vultur@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251119134750.394655-1-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_231559_893895_41EBB327 
X-CRM114-Status: GOOD (  11.26  )
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



On 11/19/25 15:47, Horatiu Vultur wrote:
> The problem is that the MDIO controller can't detect any of the PHYs.
> The reason is that the lan966x is not pulling high the GPIO 53 that is
> connected to the PHYs reset GPIO. Without doing this the PHYs are kept
> in reset. The mdio controller framework has the possiblity to control a
> GPIO to release the reset of the PHYs. So take advantage of this and set
> line to be high before accessing the PHYs.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Applied to at91-fixes, thanks!


