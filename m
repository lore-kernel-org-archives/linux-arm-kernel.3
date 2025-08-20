Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CB8CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o46xinVR1s0iYeN1jBFkHlapCwoj6PpvJWdxxR0YCtE=; b=HcmMUCJceRf73jBCihWQRO6PHE
	96dW6zyCvvUOhOQKriP8jIQrc5ga092FK4gSnd8x/RxKaPsn/0jNo5OViQkcuXu4PVu72aAXdkqNS
	+MUcQjM9yLgzgroXYMcCjJQL4KSQF3rTOYJ/Zv7P2ExLgk+xDC2yJV1EdP5i2RgXMwPsHtsY/mkF/
	MUeBOrx7ql+v3PTgCoRiWa/vAa6hB76HI0enx022PiZCLCYVQ+CKa0qRvIFNqdOsMIQx2ZXjZItWM
	ujDm6uXBeClnpGJPNhS+97JN1ryS2HHA48/rT/cf/S9X2vTYor59jRJs9czQe0eXA11D32Yqpcq7o
	ISGZJg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog9r-0000000DBWZ-1zIX;
	Wed, 20 Aug 2025 10:35:07 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeJq-0000000Clm2-2qg6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:37:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so691246b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755679038; x=1756283838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o46xinVR1s0iYeN1jBFkHlapCwoj6PpvJWdxxR0YCtE=;
        b=PCWniv2q6iVnlMhMhG4sx7DhbIg+3Iwy2poGWVjTL11DTbv5NR08XM9c1uIPNH0z+0
         4nHzoGdo/4pbdOeGdUZOnFzUGxbuz73A6wBsGA4awxNRqudNvJhJUs+t1lVBpVw9xD8u
         xkBfbnlXosaV5LJ4B4d+rqbqwe8etmEySY5d9C2S3E7w274SC1zYtyRzIsihxwl983q/
         Fvh/0roBAbuGxLisN4TkVWTSm3S7uoiDszFwBGgsbkbUt2V4gdD2JDLOUhdMfn6O1+BY
         YTUemUh2LWjugaRxCRdv4aYxsNmQha7ddJJ+X6Kisz8OllgVSTIawr/tMoEDfNZfAgmA
         v2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679038; x=1756283838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o46xinVR1s0iYeN1jBFkHlapCwoj6PpvJWdxxR0YCtE=;
        b=nS3jajLdPrnq++ZHqW9PTw5phrxijPVsKrgjlajUDqRFlqEemTPhqZ+IOSBo2Irplt
         zabOWcNcGEJaf5tw8zcKnNXkG8TNdf6kIeQshyOc7wZqcncUzm7YdFB6SB1Uw5d25ibO
         YVkGEerlvCiRK7b1pKGFPId22ext8Xj9ZxLJbp1uNAl4xVM3uLVJgc9iTwRcRK4FA4ot
         l5pv1dtEddzFfX6cy8UqAwazvWMw9OiSh+zE+KGvMdawgWyCcgJH6PBqQQOZ6F6Mc4E0
         VBzOhXInfF7EPkrmDXCHXZUD8Z4J8Cxmm7Ld2ylzGWw8PDbGFqf/xX8ZZsmTGiAVhkxB
         ivpA==
X-Forwarded-Encrypted: i=1; AJvYcCVG0RVcadJ1J4f8qPETTqmu/Uw2JYRazwDJbZ4FDJbWmRK46xqYPjABNSQuxw29YV09S/DMg03NpPkbFfwlPWnx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ObrNy4vA6OliqQhzHcooYKxdJSc9bpUr3vMu5GeL9UNqejO8
	FI2lb5yEqsyFx30xhRm6g7XWwzm9s6hKYbxx3WYMDV/Nk87TvboM0qvKep3MJ/qr5R4=
X-Gm-Gg: ASbGncvmXXPS3diSuPuwNf9UcLVP5Cv7SPqWkxAsmIt3oRn3Oj0J1F2A4Bas5ZB7x2Y
	U8EE2ZQZ7vYNgC8zWcUYfCLkYlhj++YtD4bKfz/nFUd6rVfhYwP60GSNUZgw638hdrFi7DoSKow
	x77IYH9mlakI1xDPOjeNHZWsOqOVSQDvPu1y4e2AxbvsKiJzYsU1Gqo+BkWen93DpzgbW8UCqfQ
	V+k/h5/D4GsGP75GuDJLZs0jhFjMP5P91Sv3hyCosTJcsz0p73qr7zkTDbimNZMPW9Yuas8NUpy
	Qu8pr2HuclvXV7refiyy4LFWcLCwTgRPWTTVmOW+viKgUEN6FNg2VzMfd/X4XRfO1U2mJHq1J56
	DhLyOD/sXMLvBqSNT0PzBzWLH
X-Google-Smtp-Source: AGHT+IHpJFoo2XVLENsEBA/Y5llAs8G7zIxVfwM+c4WxloFPk+FGCECVKHDac8lZXlFp3d+0H3OcQA==
X-Received: by 2002:a05:6a20:9389:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2431b7c629amr3202399637.11.1755679037542;
        Wed, 20 Aug 2025 01:37:17 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e2625998sm1600813a91.16.2025.08.20.01.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:37:16 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:07:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com, bb@ti.com, s-vadapalli@ti.com
Subject: Re: [PATCH 0/4] Add cpufreq and USB support for AM62D2
Message-ID: <20250820083714.bvocz6cmcbhnrsmt@vireshk-i7>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820083331.3412378-1-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_013718_717584_B56E4125 
X-CRM114-Status: UNSURE (   8.16  )
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

On 20-08-25, 14:03, Paresh Bhagat wrote:
>   cpufreq: dt-platdev: Blacklist ti,am62d2 SoC
>   cpufreq: ti: Add support for AM62D2

Applied these two patches. Thanks.

-- 
viresh

