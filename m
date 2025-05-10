Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A81C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJptZbL6QovkSOzJ8PBjROmwqQurdv9mRyfz6ZZ9R8w=; b=SnPv6W3aGnxA1mvqH0WB/BGXYO
	E5olQE26dUQZgPBTrGtO7rBPmhsyJTHlbJ1p1N+OYeGymjJUG29OtCyIpUJ7zQas/Wq4jHYZN3pOi
	PmMXIIJIYMNjdgSOW+K2eQRh+4rOQQBBOelqM2bAY/6X7Z6KZSgsKLqkKAU1vW9joG+vWA1i8JQeM
	pxOF/fKf+7NxYFn0I/S6rtOGtpS5IjG3lANfTtaVZNdu9uhndPJ9wN+JexG5VZqPG2igjK68JOC6a
	09wgLzaCILUbFCipmKwMUcEuURPYG0SOsg/Kev6HuQ4o963J1P3TBVU3QnbaxTsrBOpQgPdOR5s2L
	US+HI0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDjct-00000005wcm-3eaZ;
	Sat, 10 May 2025 12:48:23 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDjap-00000005wJQ-1KxP;
	Sat, 10 May 2025 12:46:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-74068f95d9fso2940092b3a.0;
        Sat, 10 May 2025 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746881174; x=1747485974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJptZbL6QovkSOzJ8PBjROmwqQurdv9mRyfz6ZZ9R8w=;
        b=CWM1IZxagfAiOWBJ308DqEPD9H4iOBO/0BF3Op+LIpsUDdbXN25cDH6EC+I2S8elef
         WNLXiDl6zYcqgQWzVytp83j+SAAb9qaHxcMPsRxvcX1AD2oGsMXBy+d0bQx4RQ/e827T
         mI5RdMm/X49b8BGaC9IrQqUBiYxJoiB89m7VqHjr3wux0CTqGkcmrmLxsXNO3DVJx6uW
         XYSUkvREf5GCImCmvfsu6CYnBQ7vDZMUiepjulkm/SiH8pfrG4oYG5DWS39HjCdAKgj6
         zIGsg83vOOviCAfHBjJXPN82rDuj8GaOyPqSBytt9Nuus5eNxPjfBiDfTTkiyMAuVlHl
         W5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746881174; x=1747485974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJptZbL6QovkSOzJ8PBjROmwqQurdv9mRyfz6ZZ9R8w=;
        b=md60WLpiSyvrAb4/VczSVvTlVpUw26CEdWcELLSInkaApC/qIl5aL9ByGFYpQdrNQq
         02Wla2oLzAixjRoVEgPOBp3w9fJXRMuPHgB2kieFlZ8UcjGU+QiDFKZnKBBvUuugfqQE
         Jvj0/vG/FF0j2vHs+eIedvI62CB0PbkNEJwROwn1aHkjKmXIInZb55pIPK5fDoO1aAKg
         4Hat9BxFdyKNK6OEBj3/tNhJLhdzyh6KeaFm5qfAkmxRFc5X92svQCCei5lxWQxHqq4s
         6Xy9jgC6ABjWBJm3QcGmVkSCuyObbwl4HKJ2iEuLxcM4kU5MpM6vcmu1r9zobZQjtQhk
         GAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoP8AJMUJEGegwZfHnMUK5L3Lv+spTzCYamfeTBILp/iQ4E+CRh09Rgcv3UZ5Tj9gnMz9aT6dfBh/TkSRh@lists.infradead.org, AJvYcCVmHZZTfarMOJAYOTraOU050R4QBlExMX+g8sjO4As6pxb6yO7W97XnEmmLaNH4eq75c/JThphWSZIuz/KP86P1Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFwuPXXiFrPWKtimpQ1+PDVNunzJb2RseVMZPqyo3/N656WyqD
	vzr5Ljv3+Hu6MkQwHKAloEvB0uwrEfrczsarh6YQEznjj9O84OD3
X-Gm-Gg: ASbGncshMci9QDttCl7qoRi2BClVemXmXTXtHegC6B8rX9ziU8j+0DpLUd1Osw6O9yu
	jYGKgpoX2EfPSjkkd3hTvqrmcrGZOoDZES0rpaFP2UH5hUWqZIta6gb5HJz8mWZhrE7mdwp2BaY
	6wl5xskfC5ZhUMDIVk+E7+XUM+t+/qd2ONvRPHRYkzuuJE+mDuZcs1mH0MFJS9WPtal+JZkSouZ
	IIxwXUn3BsIUgbr0T5OP/uOEz2NpK/t4HvVZjXRyY8as51kW8N8vGKI2R5TIAoxftuyorhzfBIY
	0g0VynaZi6IRyusA6Z9hihe4cqW+HZLRqYraVqRq2enMiysa1F9PhDucXYBDA6ieXX4j
X-Google-Smtp-Source: AGHT+IFm4BPC2O9iYWCdhvY6ixnruWUPssuzfVNGiLcK0VFlExUGd4bt5+WKSNxgP/7DNAkHJktdBA==
X-Received: by 2002:a05:6a00:139d:b0:740:9d6f:a73b with SMTP id d2e1a72fcca58-7423c04220fmr9215898b3a.17.1746881173804;
        Sat, 10 May 2025 05:46:13 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bea7:51b5:8c2a:f16a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a1088csm3130373b3a.113.2025.05.10.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 05:46:13 -0700 (PDT)
Date: Sat, 10 May 2025 20:46:08 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
Message-ID: <aB9KkD5-zzdnWQRb@vaxr-BM6660-BM6360>
References: <20250505184338.678540-1-richard120310@gmail.com>
 <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_054615_358870_3761D7FC 
X-CRM114-Status: GOOD (  11.63  )
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

On Fri, May 09, 2025 at 08:56:01PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On Tue, 06 May 2025 02:43:38 +0800, I Hsin Cheng wrote:
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Use "1000ULL" instead of "1000"
> > when utilizing it to avoid potential integer overflow issue.
> > 
> > 
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
> 
> [1/1] drm/meson: Use 1000ULL when operating with mode->clock
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb0851e14432f3b87c77b704c835ac376deda03a
> 
> -- 
> Neil
>

Hi Neil, Hi Martin,

Thanks for your kindness for adding the tag for me, I'll make sure to
add Fixes tag in future when I send patches.

Big thanks!

Best regards,
I Hsin Cheng.

