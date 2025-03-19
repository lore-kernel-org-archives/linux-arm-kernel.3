Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C61C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=; b=n+yvUqPVv+iLwYewAMo6Cc6+C3
	GkmDmkHaQN+MI8Iy15hjkfQlRuciw6j9VN6ID0E25g8hWqauiH2kkn5TswQJIY4GMvCA1kQdAp4OP
	2cIqpCNJGJHYJivz/3PA4mLAevJYEOR8/Q+BU9rHe4eSPgSKnZGeHTMaJNoVkVnrIIO+bOILn13Rg
	16vAA8g+8gecDFD1PQrSWbwUH9NJ7EYpYoHVFewIJTzGPWzRP+mHcE5NbTVh3XSLHPjBAZLLq7/jO
	FmRdaY64fAPciAw4dNfLaS9G9XjGWOm9pWRI5RGwZb7sn9y7G1gyYo7H42fa//G6EYDtVqS9Gx0OU
	w2wHDeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqYn-00000008e7N-1AoV;
	Wed, 19 Mar 2025 10:22:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqX3-00000008djq-2jCz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:20:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so4290212f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742379616; x=1742984416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=Y0E83llGpBM5YjX2IGa0YIsRGPiOeSoGZp8b3JqqGdO1iNBRnIM2ZM0YSVaUybilNU
         wGQ6vuTB0vwAX3FtjhN+C9qB8JAkJscBvUgOd4rbCODLwQeTX6y5NhLAE04kj59IEQmq
         Spgzs0VMCquB8H5EK9PLu8n9L2sWknbWxGKj7D91o2V/pN/xXL0+/x86fLIsX2A0Q677
         XyygoAV8fqm4XdU+ItR1Qa1tls5+6vob8/X7+pdPA/3s7k/dv+J2sCBVpMEF4uNITwTK
         2Dx/PZ4jRGZcVyId2+scX792kY6p881xtOMQuIuK/eNhWYK4SiEnBcsX/uLTgiYxC4Vx
         hO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379616; x=1742984416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=i2pXosTetNhcZtfwp0jVLxlb4vs9oDP4QCRBFBVkbRDiFpV5vQWM7KONrcZecDvjSi
         KWCQBLGo0w3SmTmYbUN/xsq9ZB6kcUVNt+TQzv617rGrsCtc3+iMdlWyoIUenkU8cy58
         6YFKiOnrOJjBe7E76S1TNERO/MqJrwAefJXl4Ykk3NR9RO9cGSnSDAXtYvpEuWMRM2dn
         rLrkG25kDi4qOY/AdKuHAVHJ5eZqFS83f0sduy6gtUQrGrbCFxQcJRZOwDw0ImCeJ9oR
         r7KBvzcfTZz5iSVNjkWtBGgfpRlUjaHIP4RZQpXWiQsmmSHclDoXdI5xHJGQsW+5NBVL
         Hjxw==
X-Forwarded-Encrypted: i=1; AJvYcCUTLrw48h37Zx6N2YXphGJbg7ehXoWuwZXRGCxzkfkkntCAj2wxhaxN6ncssWrfq4lchjTprVq3Ja9L2Qdsv/ab@lists.infradead.org
X-Gm-Message-State: AOJu0YyAmZZtwU7/RcrukwdnSyZVA5+BI0lxoE5DuvUG5eEBIpShStto
	BD+Dz3fUujvwU8BFf3Xn2GghqH98FDA9fZ8T/VlofLM/Tsjh6d5K+TiCN/cYYRM=
X-Gm-Gg: ASbGnctFsM1meNss3JinqeNwdDr/tJi4WHF8MxPSz9o3abTO4unN6SE0bzs/P13civm
	37mdZezUPGq7N9mPAObZxl1AUhOjhkqgpaJfOFE04Lv3BwVWPsaXo3JOTtPpI2W6VICNtPg4fCW
	Xz78HWPZHdxkrISceoffsKzrRcalb5FFnGzXfyiAoR3AYXnmuzKo5Y1jFVjm9AnIBzaEam9PfGe
	1wL2+QkgFornu0ik6lmcCUypxio7Keix1EuzBq+qauwTjmSjNl3WrOqzIf3miTDhDtOGI4vSw3m
	6OTYilUO3+/jC76TVQk89rIjY1/2bG2pC3Da3qxK/hH9on5QCg==
X-Google-Smtp-Source: AGHT+IHjcG6/IeV2BOfDblPqcpvGjw3L7kajd7hg9EDti/4DwNoU0L0nZRG8X9Tat0FLH2nt55nwLg==
X-Received: by 2002:a05:6000:1541:b0:390:e655:f998 with SMTP id ffacd0b85a97d-399739ca2a8mr1441536f8f.26.1742379615798;
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c7df3506sm21189338f8f.11.2025.03.19.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <fc197abf-e65a-439f-9d35-83f4665519f3@stanley.mountain>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_032017_683093_169D2E08 
X-CRM114-Status: GOOD (  11.98  )
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

On Wed, Mar 19, 2025 at 09:05:27AM +0100, Christophe Leroy wrote:
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL
> ?

Sparse does have a "Using plain integer as NULL pointer" warning, yes.

I can't apply this patchset and I haven't been following the conversation
closely (plus I'm pretty stupid as well) so I'm not sure if it will
trigger here...

regards,
dan carpenter


