Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3949C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 03:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=; b=j2Ln/8oriMGMRfbuiN8PxbAY+y
	Iu9eM9mzXkRSxGaAJwGFS8vTslI8FAb+Og5KPm2A7RS87kQ/c/XgstKtMBHK2FfDdYZYoRfI7mGds
	guvAwZcnPl+ZIyv9+g2Xz5Ek1N0968QhpqzTk5mt6ELqnqrB+dVowR0zA93eDTT07cDPxq1VKPC+l
	UoVu39p/xDRZNU6g3dRjfE+1NSWqiTImR+A7iibsM9+hKHHqfL1UsWdsVmHNHeHBtoFWVzQeBiY+j
	niKoob+1NiBGbkQOot7IcSlpIaE6pyDNaNNaNjX4BDVpLnB2O9o2HaMtrq8okkLEm/Iqx7T8V9oYo
	gVjavV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcFsx-00000001aTg-3baM;
	Mon, 27 Jan 2025 03:34:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcFrc-00000001aNN-3eXr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 03:32:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21644aca3a0so91965525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jan 2025 19:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737948759; x=1738553559; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=r6i4MJaI5+kEa57oJg6L46O6TRpYt34fr1isOw5hOih9ERIN1czkSCxVtXt6KHahM2
         A7bk6Qkwnei2XBfDYN9yi+E3LjMEyUSd1hUZ7jnOnKe/tA8Td9y7HcoDwL/s5EUbvQG3
         eKwL7VQH+eZaergribhiRQV7JwWQO0l1Lk3/BnW8xJwQW/Ixpd/4KvWXeG5GlJWjoeSo
         veg000/t3ixPjZGmKEwosL4/HRKoWGP9wipfglLza1PEdanZqFeBztfsaJk+QGRLVxFI
         Qhf5icE/QNnr5F4bD4bGW/EHpjapfJD7YbIZWutbjAJOXOb53UzZxdXqAnkXk6esQg0J
         XNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737948759; x=1738553559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=va76gRaJDnU9yeDIYomtxi0oSgoKUCFOVJ9FfAyol3dnTqZpCLVoLhDEzfyNyTbYDT
         bxrjcdwxhiWeM7HEZ0xaD1FHEfhHJVHFFypiBULJBiJ59bBqix5GGwtEj15JZYVBmX8a
         j/6TMQik+EiGAtsR5FLJ1AQ3PiEUqwfgN6FNJhra3AlW+aZZ/B7cVM9PSD0aCCSghP9o
         tyN+lnzX5lGCo1YiZrGsSiwwolPdVMfdeKv/dkqDM8toG28FZfpGLQe1RkLvgFswJrka
         DDm1fMIJWppG/m83Dj2JhBE+/q6ozftSY266/uuKJScKNq4qZcvq5w9RRn5JptKhyjkf
         iOqw==
X-Forwarded-Encrypted: i=1; AJvYcCWM+FkSzyCbkGGnJ7T0e5kmYC4NM8vjtwcJ9+Um4Cl2J6zHCY+JoJmB2nPkF9iz7tydsv8Xp86VnLgS3g6G2cfP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/aB3DR1ZrZDYgFxVfMkVEAF9om64J2aOtOFDWGQQlLb+FUtOK
	hSShcdfLeaAC+OWFSHboZ0xc09bSdO8Zqsefc1K5MaLN1AjqT/1Tdpe4oUSLjuc=
X-Gm-Gg: ASbGncumY0PU7yQG/JPh7WcVak0wmwjVBdKHISTRFMIfPvVNMkMXMMXA/2rzULv5F61
	H2vAYKBuMJ3dCpatTHFeTSZkeYjNwGlZsBT9JzoheLJk82q3U2Q9+650D5uqChiqtCtunV5z0VB
	bsJ8n3S+V7mq2vM3ycpAV/0gda7uNW2XXp9/x9IfFsdLLLtjTiquEAMKMzYCib7rIYu+K76uSpr
	vSLh/LTfxAhPXEcEmjVI+pMIBRpmpepQPDe83uueLXu0YP+Mva0wZmdQ9QajpamzY5t8ba+m3hf
	A3v0Am8=
X-Google-Smtp-Source: AGHT+IHvgBNK3NhwKI9n5fMBriq7FLdQFhDFQyHQaZNGZxzhpW+eaG60WMmG2z8DBaIbsP1G1cn9Zg==
X-Received: by 2002:a05:6a20:728d:b0:1db:eead:c588 with SMTP id adf61e73a8af0-1eb215ec4b9mr65731325637.29.1737948759394;
        Sun, 26 Jan 2025 19:32:39 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbd01esm5342591a12.71.2025.01.26.19.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 19:32:38 -0800 (PST)
Date: Mon, 27 Jan 2025 09:02:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>, WANG Xuerui <kernel@xen0n.name>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>, arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
Message-ID: <20250127033228.abeqhrxoprqw5b4e@vireshk-i7>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_193240_923045_D6462143 
X-CRM114-Status: GOOD (  15.46  )
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

On 24-01-25, 12:05, Rafael J. Wysocki wrote:
> On Fri, Jan 24, 2025 at 9:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > The boost feature can be controlled at two levels currently, driver
> > level (applies to all policies) and per-policy.
> >
> > Currently most of the drivers enables driver level boost support from the
> > per-policy ->init() callback, which isn't really efficient as that gets called
> > for each policy and then there is online/offline path too where this gets done
> > unnecessarily.
> >
> > Also it is possible to have a scenario where not all cpufreq policies support
> > boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
> > feature for that policy isn't correct.
> >
> > Simplify and cleanup handling of boost to solve these issues.
> 
> I guess this depends on the previous series?

Yes my series and the boost related patches in your tree.

-- 
viresh

