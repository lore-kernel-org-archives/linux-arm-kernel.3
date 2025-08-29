Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB41CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1CXCLkc3V2gOKTrIvLbzThifD/xfD1NRiFqcp7amsM=; b=3tblncZpDR6FwTG9XUVvZyOYVS
	WCL7PMJ3funr9oaDjYd4WkKFSHxGQJbcu8Gt2JqQuWSU4/6p4Z17d4zs/0OWtRswIfTqQIutK2wVS
	PpQcp2zKf3icZ7LYKj1sJRO5h1bXUBGWg4Qz4SgpiP8BXVZDtLQLomsB5nG6Bf+ghgDGYAb/kBakC
	/kG2jkQKpLUljQOTvBWZNoXsWysEemsaH/vSxhn/y6t/9RbHRzwaelfA+NKNysfU5Tla4fjeSYx4t
	fWEiGMyOhCOOZgW5sH//CRT/FZpGI9XDTcybkNBtygGKiIfibYcN6ofnBJk0waWuIhIaMm+7RNWTS
	7oTvqLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9o0-00000007Bmd-3KbI;
	Sat, 30 Aug 2025 00:50:56 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us47e-00000006fKX-2apE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 18:46:51 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-770593ba164so1989451b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 11:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756493210; x=1757098010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v1CXCLkc3V2gOKTrIvLbzThifD/xfD1NRiFqcp7amsM=;
        b=EqEbXoaNU/FIETVDhdCjyk5IPDMc6Fsos6DZMUzzUx3hPkDjq/7T6VMi0FZQL5jadt
         Jx44KXoYd/ZNILcI1WbjiBlFZGvrQZA7n3lKmLJFUnay6KxVDhV/SVicV+xk/mma1i2S
         z4aD9vrlTYM3RhLXCEIi9OZ4AU/Tm4Fbp6pIcsaZ6fRW4GgO5KfGCadEbVYqnZ4lAiP8
         s6PoZQe9d+CBzUdiRSls+/Z3Aoq3cQFQYy1WgKAKYa70ezyFrK5AE+0IFhQ314Gg28fO
         cSrH2eonAz7T2G3boMw0IVjs1T+1C3FIryPbZKCimbPavYZ0lH79mRSYRg3qe1D9d8QO
         vSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493210; x=1757098010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1CXCLkc3V2gOKTrIvLbzThifD/xfD1NRiFqcp7amsM=;
        b=Tvxs5OzqGZUuKyPtbVt7nstshZTDRcAepefQq7+Wwotomdhrhcn4NHTGakdlE8h2ZW
         VX9NAroEqZ12AJCb4+UObUB7xwZGgQFilNJV1NOezVfGsPLOMiID8VEB9/gEIeZe9Kks
         H7WQ31qrDG09ccb3cDTQsfYXJn6dqnWxOgkc4nU2C1PMRMbs+K1/bZkPezSbvLmRmtd6
         QdulJEOMA8UfJJO6mgiHE/k7I+02dnxDCCLogQZCHMXE54GqOQJjPGG2ZoSbYuK07q2Z
         kvY2NV6UAjPo9ZfNgrAq8pWTVw4eOsY6H5j3oHnKp6U13GOAjTmGYVPSWMUoLkzSB3Qn
         vbHw==
X-Gm-Message-State: AOJu0Yyi/1LJP2DpJOc19GoDJqPMqebTD8Vrl1IbTn0aDAXmNcLhIOCj
	/YyFRKDTeNMGoo83beOoIiEzzWq/wZzrbmphcUkI08O/fJCE0h+0DziQ
X-Gm-Gg: ASbGncs6h5kAt1lYBI1gqvgU7JTIlNb69qsBy4OQzMATWIRu7Inb/sWPSC57GFnqYQu
	Vvn8nqAeYHCXpSgXlm3c7CVRm2Il8mNgjOCmzUjcPwIQKSvCV6eRlyLo3fEgUZpbATEUIJpXnMG
	viqj/EPFdG0OdRW5IYmwe9ODVjMjTN6/9tyLb9DLpR3BUb6q6eO4fa3xJ+qYHJm6zo3NY0gTh+H
	zYX4JDlO6DuBUVfC5WVz++5ZuLgOu24ktuUmygJgvkpZogKgSft2nxmAew0IhmbZC4h9Bd3/NXx
	V5Q5Mq4RHMvSNSmpCAg5NdbqaG2p+ND+CeFDDoaHr5KIpmC6u00MfzHpzRcghq2eUMoQk2Isbe1
	sZp4BYdWlU2+e0mwRJEhrbcc37si63Y0S1yw+gOZe0WWj0KDQkf4Iti+KModyKwp9tnI5DAs=
X-Google-Smtp-Source: AGHT+IFkDUn0Bj27WhzY121M482vhMayXfNAABYTgrCz865mRDEJIuDhY4dOuhuI9V5Yw9Osyp3N2w==
X-Received: by 2002:a05:6a20:65a4:b0:243:a251:cf5b with SMTP id adf61e73a8af0-243a251d425mr11908511637.57.1756493209662;
        Fri, 29 Aug 2025 11:46:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5f7a9csm3051681b3a.91.2025.08.29.11.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 11:46:48 -0700 (PDT)
Message-ID: <3d6c251f-bd3b-4f9a-aa3a-edb9da0caced@roeck-us.net>
Date: Fri, 29 Aug 2025 11:46:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: s3c2410: Add FSD support
To: Varada Pavani <v.pavani@samsung.com>, krzk@kernel.org,
 alim.akhtar@samsung.com, wim@linux-watchdog.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 gost.dev@samsung.com, aswani.reddy@samsung.com
References: <CGME20250829140010epcas5p1bc06faf0001ab2695f0199db65fe678d@epcas5p1.samsung.com>
 <20250829140003.109588-1-v.pavani@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250829140003.109588-1-v.pavani@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_114650_660188_B434AF7B 
X-CRM114-Status: UNSURE (   5.69  )
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

On 8/29/25 07:00, Varada Pavani wrote:
> FSD SoC has 3 CPU clusters, each has its own WDT instance.\

Full Self Driving ?

Guenter


