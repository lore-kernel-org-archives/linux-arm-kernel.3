Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA5AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAVQolx9KExb7Tb78lU8f9flTHmTgz7gOctqgRk6LUA=; b=DgqJp6wOQsQlT0Ij6aYgjqRLhL
	IakC6lXerFIIfPd361DDdw/TFaCE3/yv9csAnwcK740mQzD2ecEDX4K5Z9kkHy7mOvQXHQFrpNhEW
	Jp50IfHUAcdlY2Zz5H6r4nRnY1+UBgVkrV6MmXhJfMlgp+a8jQlZvyjoFWiouCjFmt83tifSNsGOW
	wzRnxfi0m1GzYJj2DvWT/11VkgPX+G+BuDVxo22m4a/148ImaeeqpEDh1V5JnLlwv9lqF2rsRJbsF
	fzk4hBlvbMw2vxmpOCaAC6a1pCjA2z68RAl0WMjoHU7yAkXhhYS3hqHxeY/IETu6FFjdpt7g6mlmE
	NDm5Vqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoEz-0000000G4L4-0RKJ;
	Tue, 25 Feb 2025 06:16:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoDT-0000000G48j-2wRP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 06:14:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220c4159f87so73230345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 22:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464091; x=1741068891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAVQolx9KExb7Tb78lU8f9flTHmTgz7gOctqgRk6LUA=;
        b=Ztmiu13FAcgTSbsUz6mGVAuRw0eLjY7nD/R6oij3bQX/76fVqhvOEiws0FvFh+iqWG
         k8kyKMPI87RTAtoDC8RL7TWySzVRB6fOONQRo66IHsatb35F8+YGQIiwiUo7YGf+Xeta
         Jr1P+2u44HjfdL8Jx9kkwOFjgJ4Jb89REb6u1Y1oysZV8+JBTsrkdWDGbg6S6DrGjVAv
         s74z0/azBOuU6B90tBMRWNhfR/nI5K5NnI3FQd42/YqxPX64aIF+Ky+7nXKNlDgFxnFY
         6pbOWPvtGnDVzpF55AVwfyhsAYGZgClhLoqUGcNZN/8H8KYm6GxVcdHJW+nbqpgolTbp
         K4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464091; x=1741068891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAVQolx9KExb7Tb78lU8f9flTHmTgz7gOctqgRk6LUA=;
        b=QDOyiFkscchnN9xKJQnNgGihw7zfPMC2f6x4YxemgzK2dzy/xl7n/j7ziqsKwSx+G0
         cDeRo5DucbaRmxSaZ/WeWwvzjJWwpSbnQIppbDcx5ug3C5V0Nhfut7Zu1Wak+NHrTE7u
         6F25Kh7DfOk5R0FLWmdi3aV8m0+8q/ODLHLtNdbUBASZif+JCOn0noC6oBrkeKXrqxiE
         ty7Q3Tf7x1/peD+MMoIbEbVwqaIuOWxCqhDicpdhfoSwqwZmCSaPKVsZJCC7w1S8RxmW
         1jRywXjd78kEOOCxpPuyF6EC7BTMDI7tBxOVOo6kzhitw/9/R5rvO4DNIMkHPeY5iRKu
         USYA==
X-Forwarded-Encrypted: i=1; AJvYcCWh9SzyA4zzepGYorzcN/HSUbT6Am4771KNxTcOawcACnQ5IDRXBz6SrRiD37Jegkx++gHNySl+r9sxYCmK8cWW@lists.infradead.org
X-Gm-Message-State: AOJu0Yztc2shEZk3PydmLfn/RyYoPvolvpIYBwEv0/0Vjwq4LxgBRrIW
	/2vFGzypa40Q5nHoef94kxbGZCNR8CFH4lmCu+FyvBHgUKQcmL46
X-Gm-Gg: ASbGncu0ouzaXqkoKrew0dmJOud/Qohs0kqwxwwVEdICLZX7bARKjseFRyhHZA37cPx
	2ghbi6Fh+dudXPbPwB+0FKPFdPuqLwAv9TbWDqdXviGzKIzOa8bJmmYn4T0nEGMv3KK21ns+Xak
	DpOhx1ikgZWV7I1hc7K2Wy87sS/BNy6W5fIC3+wCicRu00wFNJBxNJ1NPxLagNURTVU8EFaloA/
	AoahoGq1LDL1zEk3e/eFsUSIKbHhIOeqMxfbMS1dgj7ZFTwEBsIjzqCaI0cFqUKuDVtsYZNGZ7+
	akUWxbl9yAtmMhxXj2AMZbyR/rc=
X-Google-Smtp-Source: AGHT+IGwkid3k/avMSIUbwqT5je0rV66CDm1UlnOW0Q6bT9hXylAJGMLD+sehIyy1nTfXR9ACddpGQ==
X-Received: by 2002:a17:903:22c2:b0:21f:55e:ed71 with SMTP id d9443c01a7336-22307b45598mr38223475ad.5.1740464090521;
        Mon, 24 Feb 2025 22:14:50 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0927a7sm6292795ad.143.2025.02.24.22.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:14:50 -0800 (PST)
Date: Mon, 24 Feb 2025 22:14:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v7 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <Z71f18TQLEiexUaD@google.com>
References: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_221451_739318_AC7684E7 
X-CRM114-Status: GOOD (  15.44  )
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

Hi Sasha,

On Mon, Feb 24, 2025 at 12:01:08PM +0100, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and for the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
> in charge of speaking Z2 to the touchbar).
> 
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v7:
> - Added a dependency on ARCH_APPLE to prevent potential confusion on x86
> - Link to v6: https://lore.kernel.org/r/20250205-z2-v6-0-cc60cbee1d5b@gmail.com

My apologies, I already applied v6 (patches 1, 2 and 4). Could you
please resend against linux-next (or my 'next' branch)?

Patch #3 should go through Sven's tree.

Thanks.

-- 
Dmitry

