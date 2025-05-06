Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B09C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgHemNWtqa8k4AyF6DtlkqCjI8OhMDy1+rer4Kv1t4w=; b=BpEtp+sjsetHTSgi9kYddCsfCR
	zGxsNspM0m4WDOq+wGtDefU4GRl7XPKPCvCbplDQ6F8e5XcFwD+E45geKBNdfhvRK4/9321Hr8pxh
	G8IoVK6xdrmWx93hIFYufdUUBbwzobVO01ic7UPhSyHMWwGdoqEh98QQV80Tm5JOR3VsNKfKhxuWu
	3XYugb4ef0OexAaUPyW3tgbcMjlTCurAo1DrqKNPMYfg6xhl45j6YeB4ifJ+uN4HTis5uaVuNxLeN
	0VDijQHGP8AIFwX7cmB/kGWWQ9v1GAjRgcWdmp46hXLSRirYtn58tq12cZhjbFpjmXd0iWydAPujL
	d5XVXoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUam-0000000DurY-3MsA;
	Wed, 07 May 2025 02:33:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOyk-0000000DN45-39Vz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:33:27 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac29fd22163so1020247166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746563605; x=1747168405; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgHemNWtqa8k4AyF6DtlkqCjI8OhMDy1+rer4Kv1t4w=;
        b=CIT3SNZSKKrj8WjIQ7m0mT4To+vGsTFym3NZmqlqPJ0He3PCnkky7OQwl/Mk1MxGXo
         617IjhybBzjvbL0XF8U2Ht404GNVE4ZLycEnyvk1MjHcP4zdbUpcNTqw/ufYOra0C4BT
         thEzhfn0Y9zEj1KZ4YnS9JAbVX7IETKiF6WFt96ihOH/X5t/Gs6ACDVp1/cViJFC/Zxy
         YPw2wMYtD+o1aAhDVrA2vLwtuXfk2FJBUH+WIR0Xct9uV0erAb2fXzDKhtVaw+0zj9ua
         I0MOYlQUBnmhYCSmKaZ3bSxLh74cXnmtY9Wm+Zmd2bKO1c9aAag5/vHuElH72DmZSEhK
         kV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746563605; x=1747168405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgHemNWtqa8k4AyF6DtlkqCjI8OhMDy1+rer4Kv1t4w=;
        b=LLFsc4bhq5Un7NqktOwPLPLjr1WshCLJehZFKsQ1AOmO7vD/V6QRCbZxPzdBJaehay
         ROE0W43wZ0ZIABRLuNkb4pmUocAV5hEo1DHSiegxrUkU3V9tItK0MQAlef8GPMa3X0cC
         VxT/pyWxgxhv89R4NmlyX7Xu5rLeqBoW5P9dXuNApUmG1Uo9z7kh9pQzYwF7mnUZM/4o
         Eb8ES4SebAOPeB8zWXGMFyOu0uQizYdxpIpnUu6c+fpdtUMH229Q/S0SluqCOcab2RD2
         n013Xo255CZRDhVMvg7klo2tafZpk/gsb9lS6encWGM+B46hMqhQepLOCs/Z6kXMM47/
         hFQA==
X-Forwarded-Encrypted: i=1; AJvYcCUhQL6LsXf1D9f8d52Ne+CSeVZ8FCO2l3GI44i6F0qRxkI5NWLchTAiCr3ccMbq+l6i16hlsm7HRLQLSnB15YRm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw31SmahAEu6AMY24L8JOvdUP+DSRVn9wqn36zMTCsSkhbVG9mN
	gewmpQErsIK9S1/uSnLBFTFYeMi8H7JH7Dj1AJPT8zE4Sh6Fztph
X-Gm-Gg: ASbGnctLJeFSxTw95QDmhk2LoOHOc4Gj1/wqPn86hAYQ7M48+TVc7NUPENqTFQkcHTF
	0ofMpzM+Qj62ibviJN1TfLKxZqk2APNcs0MT6qr4ohJpc9H4vNKa8XEUbSEb3FqPDKQ0lx4xEOi
	WLLrvh1ek1bcaqIyCYVpN1tk5a1fO19+NrLhioHMw4gx02Mpu2sx8CGiAIGE80hHIZnE6TrNzPN
	U6e4GFuPpcUH8ClnLCte2Y2XMiWfnv2QAwMA91mab82VrxdPUBk7AINyC4aEt/yQnFGRzoJbI/R
	2FkCvJAZsIYeHaRRD8ZO/RCHh48vtcxmhuaPRCow6NbW+52KlazjqYMC/zB/3YgCAYfCwTQmmDj
	wiQZ2
X-Google-Smtp-Source: AGHT+IHQmjfRpINHsgz9ShdGUI4kDJEPSLEEfjV+MOKkEjV1f+crGBhCrNB3BbnYjWe8s6Rm/a27nw==
X-Received: by 2002:a17:907:7207:b0:acb:32c5:43ff with SMTP id a640c23a62f3a-ad1e89f8dc3mr78243466b.0.1746563604672;
        Tue, 06 May 2025 13:33:24 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540da0sm759259366b.165.2025.05.06.13.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:33:24 -0700 (PDT)
Date: Tue, 6 May 2025 22:33:22 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 0/9] mfd: bcm590xx: Add support for BCM59054
Message-ID: <aBpyEo8SHFq7SDf4@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_133326_797756_D7447394 
X-CRM114-Status: GOOD (  19.69  )
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

On Wed, Apr 30, 2025 at 09:07:04AM +0200, Artur Weber wrote:
> Add support for the BCM59054 MFD to the bcm590xx driver (mfd and
> regulator) and fix a couple of small bugs in it that also affected
> the already supported BCM59056.
> 
> While we're at it - convert the devicetree bindings to YAML format
> and drop the bcm59056 DTS in favor of describing the PMU in users'
> DTS files, as is done for most other MFDs.
> 
> The BCM59054 is fairly similar to the BCM59056, with the primary
> difference being the different number and layout of regulators.
> It is primarily used in devices using the BCM21664 and BCM23550
> chipsets.
> 
> This patchset has been tested on a Samsung Galaxy Grand Neo
> (baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
> Testing on a BCM59056 would be appreciated.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

Other than the already applied patch 3, the whole series is

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>

