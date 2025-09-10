Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14520CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=; b=xg2HigYUhzvn0UFuZEjfIG05u5
	hBiuZRWfyh/X2h0TQXlG4QiQtHnXtRsIeexZCTjpz613Dm74/aqlgXc8mq2WHoylTR/jHoJKg/5Y9
	ZC8emlgto3ker1SESGTfvuWoVanE1pSLgDENBqrvbrT4mVXEYpIy/An0IHWSUINJ8IBaxI6+FRa+l
	+9fufk+h+E5PxzjmaFFXioEsGBEyGSDjM1r4qbOM4nXemzMK7RdO5Ek9ygxpCmJTXvlzyFUvyuEOt
	YCA0EE22O/4LFqdqeJGIbbrqFkcB60s/EkWFzLwxpYe1z7FJWjxWk8ZVDnnmJGc5Co9eJAFL+9CqE
	l9ldxZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9Hl-0000000BIqu-02Ho;
	Wed, 10 Sep 2025 01:06:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9Hi-0000000BIpM-2icv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 01:06:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b043a33b060so980853266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 18:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757466364; x=1758071164; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=Nt3XKgdTei2qLeqDwbBdCiNV5M2ZqfzeHBzi/D5114CfEZ5IjScuGuV95gJXrR8Fal
         X4VMJt9RgSXnf7XFp1ud4Ipb9fZwuynU66n6sNjLqvUIbZqq6LBOOTt5gGRPVk+FDx8f
         0lqpQceTlk4bfkgSNLLDbEPaWv+okIvxefg004HglP69kC41/oyKPX+9QKCi9G9zR/Z9
         98BmUMn+HnK/uTA48CfCRXzO9cri56SlnCGSn8lETbW7jh2u4Dld65p9uPn25WV/bI7J
         OWHPpMGcTc9ZugXrpBt2ypvb4Pa48vmVmCSI5KATbQDJxmW2482OJJd1sUA8BNYmlT6e
         P0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757466364; x=1758071164;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=KentneNHR9jIq/mVpmUw1MqJGzFF775frwxYv0Zywj156isbOmWrfGTUGvqTFLfCuq
         i8cqUvqK693I/kIAtw07VwJKy1AtDMBDupZSaxSCxh/iEfieaPqWYDG166cvt7Pj3fAb
         ZJw0Jjk7KVCpvcflmv5ikAOl3bJ8Ews3w1kmWv46DKIeTAegqx3huHLjSMG0bEKc6Kws
         Jq+qsnRtFIKc15iWntGcwgTBYI+vHPWYXW8buYdH589LdBEG/QJ9N0ii8C6kMnp1Tm42
         1qH4JaPCchfWuICSd00Hmt5L8tM5X1V/Gk77Q0Ec0MDBWlZHXlnskfqRzNZHAUfY++yt
         oZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6gP31l72dxKnZdYjo4hP9TFXjnyBmzA13ODKNWIDVTWrtFRLo7BpGbmcdDVyzTxa2OUrqD4SsjCgaZ9frJk1u@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm6l7ozC0IG5kpMsXrf+J/96/lpOru6Yi18AFnlFjU1dz2LO1Y
	WNI8+Mmd2LbHiQAndI460Et2O1ubzwWtODb+HJ+n5bQkvlMPgNfwf1+8CmBr9c4Vg6U=
X-Gm-Gg: ASbGnctlwQG8A1KVoA5UtG7Hhvjpj2XWeM8iJBXFUYdw0+thKYnHE/IGmFnOko/2na1
	ZStWPCl35ZquMfOqzmW1TTxkLoStbNW1MBXRUNyot1eotCXNydoFfgcPxZRWFmuUPzyok1WuXUD
	8Y5ImuAIbhIxujgfZY+kShHbJpkPUeMCBAgbHBULFWRwqQ0hw4XHEJPMVif/FCzrp3HufGk7JhE
	q8ckzw1vdYhC3SSaNmpeYCOLjK8+8ApU0gErOvvsstDAFG8BZHWCDrOenoYEEUoaNlWUKu0U028
	k6aoLqSPVr9PIctnkxywSlrlkw2J645GX7O7udoG+/7YyVeG163LgoV780hPWiZKY7jFMFeu+c9
	qjAJqpDj/b+L7x3XEYN0jO+iOH9EUkpYmoZNvEqm0p6rqxorCDXk3V/ITVNWOoghgo2bFDcma
X-Google-Smtp-Source: AGHT+IFjBmxeo0iihWNvQGW9XaPHPBKL/NIGGGOL86gq7iDWLkzDSZTSGw6FlnjUE/qdjGTpbeIhew==
X-Received: by 2002:a17:907:72c9:b0:b04:4ba7:4e0d with SMTP id a640c23a62f3a-b04b148a54emr1331824166b.26.1757466364453;
        Tue, 09 Sep 2025 18:06:04 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830464f9sm78316966b.9.2025.09.09.18.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 18:06:03 -0700 (PDT)
Message-ID: <bf46e8f6-221a-40c7-9da5-8003397ff113@gmail.com>
Date: Wed, 10 Sep 2025 03:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 david@redhat.com, geert+renesas@glider.be, heiko@sntech.de, hpa@zytor.com,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 richard@nod.at, rppt@kernel.org, sergio.paracuellos@gmail.com,
 surenb@google.com, vbabka@suse.cz, willy@infradead.org
References: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_180606_706218_6F26EF8E 
X-CRM114-Status: GOOD (  12.84  )
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

> Well, while on x86 1GB systems did use highmem, they'd typically not 
> use very much of it.
> 
> IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to
> be exact), with something like 120MB highmem.
> 
> So they'd either lose a bit of memory, or they'd use the 2G:2G
> split.
Right, 1G-128M of VMALLOC_RESERVE, but they didn't generally use 2G/2G 
but ever since it was introduced late in the 32-bit era VMSPLIT_3G_OPT, 
i.e., PAGE_OFFSET = 0xb0000000, i.e., 3G-256M/1G+256M.

Although at the time the patches died an unceremonious death, 4G/4G 
patches for x86 were also around; I used to be a (conceptual) fan of 
them: it takes quite a number of TLB-flushes to suck more than highmem.

Not one hint of clue if spectre/meltdown is applicable to these systems 
and if so, if they in fact do or should already be suffering through 
those same flushes anyway but maybe it'd be an option to dig those 
patches out of some archive somewhere.

I promise I'll test them on an AMD Duron with 768MB RAM :)

Rene.

