Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA27CDDE70
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICmxhOxf3rIdsIFy95QRYT4rZHpdER7Q9+r8wV6MVMs=; b=ORFU8uPC/DtKhmx+DrScuWbBHA
	Kcnc4YvRtAX1v1ZcPcLNgjJVDDHIdve9Lf46JJ+l2uRGEm7tjxKbtJD3zhCRh5jEjOlKB9t6UP6JE
	B49YEDNi5g83x/Aanet6ZrbIpX9zJVwkwSM1BLZt+1Yi6xl4bj8JV/6dZUxAv94bavHbQWGcFAllI
	Z1iSscnGX3LTAgfa4L3sXtwIDgyBUJq/ayCW3jId34q6QnCYh4wYFL4NpcEcRJme6xsw+Ax3DEN/K
	nk+Wq/EjSoXpODfw3s62COQNaLlH3H/8WqRXptiHzoMrJvyJq/RXeeizMiny5IyZIl/1wO+MM6VXT
	Nml4XOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zp8-0000000EBsG-1wlv;
	Wed, 23 Oct 2024 11:46:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XoJ-0000000DpOK-2yxe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:37:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c693b68f5so70754175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729676266; x=1730281066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICmxhOxf3rIdsIFy95QRYT4rZHpdER7Q9+r8wV6MVMs=;
        b=C+90p/+v8OBR6D0BGO5HcYRAd0Bn2Fclve09/DA5UGAxbCZn8R2vI6bdPI1zWduPQo
         4cJFWedTRQVbK5ffT7X731N60lQbdEazs6u8tZVOh52boR99/NT0RC/Bt/EZYjRjZQCK
         r4Jt05nDfB3GzN+oAfCtOF5K4marcAotRXYCbd2iSW7aCyiT3lPKf9DChXyqghwOEQMF
         LnWfd+C02ctc7uSlX4GTd33eK/EcTubsISqQWi5tajfGaQVqVfCih1Rc3NlrEUfq8y1G
         tYRE0NDCo11Qo5ik5aa39qcWDXkzEttUPr9Bpx9EfVNYHNHqWlzDEJm0dAQYqvGk8uxc
         dttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729676266; x=1730281066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICmxhOxf3rIdsIFy95QRYT4rZHpdER7Q9+r8wV6MVMs=;
        b=JLlLsp4qarnE8T8RtyrKam0rCRdbflv5oZo2ayr5+5eGCsng4/DFpiLqemWIX4RM8K
         eynHt4OS0PSxzcGW4lZyrh4IPnfR6ZaxJ0ZWRv9Co7PHpMN40exmNujydC2wX3HrW+W6
         5kAsitnr8PS7TJAWOHHEtxGk0g21KSUgsv1cdFJ0xCxjTapP/VdQdAfDagJkrK+p+6Gb
         ChloDQXn+06oWS59ie3A7Z3+k5WUeMNduTrM21lYT1oJbPDwiL1qcBf4oN6JErJr0ABu
         FCl/0x2osURRA5CEjrQ5nt1QjP5CovKQJa2Gt3R0zDY4OX9BEyLnxIjBwOCCMZjwuMoc
         BseA==
X-Forwarded-Encrypted: i=1; AJvYcCX77BSTz9ugVzC6TIT2n2ZUdtYsKBI1E2YNukL79CizyuvJviVK7Swj1jDTb22GMITByruwBPKRMEU6aD6bHxV1@lists.infradead.org
X-Gm-Message-State: AOJu0YyqpLMMYBWnJaClw3PmUyImHjrRAyioWX3xEFgy3e2W/YpxsERR
	kEtwpCfGMmUBJspW/sbMf+pB7L91SZiEnRTVBAnatDjee0rTXN7S
X-Google-Smtp-Source: AGHT+IEbaEkENgj6TpE1xbgPBOJYfC4icJXGN8eoL/sRAMsaGVBxN5nGzC43ba8GaiTlcpdMpQDopA==
X-Received: by 2002:a17:902:d4c6:b0:20b:b079:5b7a with SMTP id d9443c01a7336-20fab2dbb0amr16681175ad.50.1729676266411;
        Wed, 23 Oct 2024 02:37:46 -0700 (PDT)
Received: from [172.20.10.6] ([121.202.106.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f3302sm54066435ad.250.2024.10.23.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:37:46 -0700 (PDT)
Message-ID: <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
Date: Wed, 23 Oct 2024 17:37:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20241023044423.18294-1-towinchenmi@gmail.com>
 <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_023747_769941_8537CB5B 
X-CRM114-Status: GOOD (  11.09  )
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


On 23/10/2024 17:05, Linus Walleij wrote:
> On Wed, Oct 23, 2024 at 6:44 AM Nick Chan <towinchenmi@gmail.com> wrote:
> 
>> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
>> iPod touches and Apple TVs.
> 
> This is a good and important series. FWIW:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Are patches not getting applied since you resend them?
This series along with the watchdog reset delay series mentioned in the
cover letter have not been applied.

> 
> Yours,
> Linus Walleij

Nick Chan

