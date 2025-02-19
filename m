Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDCBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 05:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfk/XizRuq+amnzwh+c94ADuRH5dLJfB81y/ZMr4Q7I=; b=ciQREHtjGY6t4SqzkAAxC89UVX
	3cr0dPYDGX+QTUpj1wRbx1QYibI0FmSi/veP9l0xj2SHICI8rv8WQj50SHhpN7A3BTSzQ9hD/eiSo
	nOicJUydCoqO8EtCfeB21w2xmMVAICs7w1+Xfv4QXIqGBn/iq69UoPj9cSJGBT8ee+jz+t/cxbbgv
	tc/M2zGnbOSpmE51kRjkpOAZrdyn0U1RPK2erCkmxEVx6WoKs3OHytuVMRcW7ubdyExfr+7tQrmju
	dGuqgTS5QkLs6ue1LmqavWmFVxKcf+IYxoafodAwdVFgPKLU2zuPbcm1xcZCUq3BYbcGuIon+F5qO
	nNFXMXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkd1c-0000000AxZW-2Svw;
	Wed, 19 Feb 2025 05:53:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkd08-0000000AxQv-2pL3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 05:52:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2211acda7f6so69721165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 21:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739944324; x=1740549124; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfk/XizRuq+amnzwh+c94ADuRH5dLJfB81y/ZMr4Q7I=;
        b=ZAEjQ6ifshuE1fMFpdT6WEqVjSoNDFp4Ur4aUUV/TYDwrn6r/AxdNU4FmU5TccOREX
         aj2jRTaZnygJlKUPfY0+3Fa27H1wMYY4lQltWSIrnw36K8kjIx3RJoHZVTE+jE3MjoHR
         2BadMsb+JEM0AymRpQG6NukqXzC0s3jJItB76wDg4CzT/ZGdxZH8JpWCl7f7HkMHp9b8
         +fS+mGcilwsWhOeb3v5AghyaknE9opAc5wCmMrYRDaGYpAb0ja1txhrnsS2o3lOw4zWd
         bz72YCY7oNljAKStUFoIHTmTZxpDZDe2YX12xMLc2MeCuC9F2SyR3xHEqRUiQgFqs1Q7
         XIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739944324; x=1740549124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfk/XizRuq+amnzwh+c94ADuRH5dLJfB81y/ZMr4Q7I=;
        b=Q21umsFQ1o8KoRFf+16nwPfN38p8TZ1iw3daeoL/Ur9SoK3Gc/GfnNz0a30khqkFlP
         4H1exvWAEqAxe1Zugj1rUVVTi8eZjPUFqaWxOyLysa+4ZImitmOFmeOBud+hlBc6Pu01
         BT7WYLNAtWkJ2p0ieIXGzBxD4vh8Y7/LxJVrGCzE0ib5VmjjJqaeuZzTfDWuHRyB6w+Z
         om8CpRr7q4lTCCH54yFVu14gEdQYCVONCMaXfYN/HtLacScrSXcilCJBA/IYW6gPA0AY
         mGp73/IzZgdNXAuBGH/X37dtaqyu78xUEq+A+VwnYQFE8/rUrYpigWPeCBePsKK0/SIL
         vj0w==
X-Forwarded-Encrypted: i=1; AJvYcCXyhgQtwjF8Avf9lo8f6u7WCVNx+xde30Iy/LSHycUHTye3SiJg7E2mBRGWrZIDVqz8rIQkfq1Zvsd3wKiTqag2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxd+m2H2efUVyvITsom1ni2PCNwEG7XSdiyE4JLROabmjBgQNP
	h+3BrKurYOOvBQmfbSvaGezC9gutGl5cA4qVokzaF9Rj2KebLfh7WxYNhMeSuaU=
X-Gm-Gg: ASbGncspEBMJmW5oqzsTrh8ZfuqIFIvWrt+8EIqRMskejMDhgdSPBAJ3oHe9ODSnjNy
	QWqVi0zk4PgEJBhMjeOnZJL8Ob3bmGrjG4C49A2654uw7hIhaKug+V9bD5kX5nmowvSoztzn3WZ
	0Kdp/suqgagvFOqqdDbXRr+kcKaQCOCGRtH3J5akNQ6HsQ8wYkYm02UdsDLZ+TkARIBArUIvWgA
	4p9v6PgY5WwtIr966tyNg1qmlQKce8ePOSfimmbSKrxduptE4xD2Cs+52511Z+qM6RnhbNSyYUT
	TLCHoO8znEkQ2lQBbw==
X-Google-Smtp-Source: AGHT+IEmzrI9J1teC1xw2bZD6oIzjvalj4grBPjeXzr9SebtpOPohSw5PBj/tF//qK/NL4kw/gkJIg==
X-Received: by 2002:a05:6a00:2382:b0:732:1840:8389 with SMTP id d2e1a72fcca58-7329dcab9d5mr3854964b3a.0.1739944323727;
        Tue, 18 Feb 2025 21:52:03 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265678abasm7341166b3a.27.2025.02.18.21.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:52:03 -0800 (PST)
Date: Wed, 19 Feb 2025 11:22:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: bschnei@gmail.com
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benjamin Schneider <ben@bens.haus>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] cpufreq: enable 1200Mhz clock speed for armada-37xx
Message-ID: <20250219055201.noi6hxe6sjox6evo@vireshk-i7>
References: <20241125211452.14987-1-ben@bens.haus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125211452.14987-1-ben@bens.haus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_215204_715233_3281A9B1 
X-CRM114-Status: GOOD (  14.74  )
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

On 25-11-24, 13:14, bschnei@gmail.com wrote:
> From: Benjamin Schneider <ben@bens.haus>
> 
> This frequency was disabled because of stability problems whose source could
> not be accurately identified[1]. After seven months of testing, the evidence
> points to an incorrectly configured bootloader as the source of the historical
> instability. Testing was performed on two A3720 devices with this frequency
> enabled and the ondemand policy in use. Marvell merged[2] changes to their
> bootloader source needed to address the stability issue. This driver should
> expose this frequency option to users.
> 
> [1] https://github.com/torvalds/linux/commit/484f2b7c61b9ae58cc00c5127bcbcd9177af8dfe
> [2] https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell/pull/44
> 
> Signed-off-by: Benjamin Schneider <ben@bens.haus>
> Reviewed-by: Pali Rohár <pali@kernel.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied. Thanks.

-- 
viresh

