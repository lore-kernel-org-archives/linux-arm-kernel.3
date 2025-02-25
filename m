Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E947C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 06:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGVgTKfQzcM6BCbf3nLCuH4nvK6a2ubqTOhh2w4FSvk=; b=1zPuXFPBqAyVLnxRVlstZDOmyR
	meTxIHRBy6p/uu+g8f6u8+7VJjd0wg31KIkMytlVwvP6rNRR2BrvKFJKluJqSlpoIfFZw22lM9eOE
	WuO1Z+a7RihIqm6Ku1UDuR+CRQE9UDD5PaFupsw7IpQhtbJDwHQADsa6Wu1cpA+RpoTQuJpHpH1K1
	93A74bFMKZzVyVwLvNnFr+TYo+wY3n4s3u9BXR0Xl6SkzL7lP/pf8FMej+2SFwceAmcGKXTZzqqIR
	W3HE+Nc+gz+rr4/If+eaYZJsAEvGSaXHmYGTVyHqq3iBCmVWZejrCIbRFc9sh/E+2wGrN9MSnocHO
	XdYFAzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoHy-0000000G4rk-1s9m;
	Tue, 25 Feb 2025 06:19:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoEe-0000000G4Gz-3UCj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 06:16:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-220c2a87378so87586065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 22:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464164; x=1741068964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGVgTKfQzcM6BCbf3nLCuH4nvK6a2ubqTOhh2w4FSvk=;
        b=dR2vDqFbhxBJivFP7zYxKbyQYj6F/cjtyiGw4qWbX/eKTzIFdzQAtyAJhevnBFKKPk
         257JeZfx78+JfF//695sc82N6mOLYy7X7IRAar+VOs8JWrMSpC4XbltzM/fug0IgB87U
         DtwSlDYd5EHmpm8b3z130w6V91YbL8XXrAqkcrVMl89piZfQAuOURitNHQ5JZh6savKl
         mFON5wphGP/fctO1aIXusgzXLH+qUIs+9velP4Ycl5JZfcfdtLKl+9BJMDKc7XjpbQZ2
         7F4ImUIp+1vviSVgMoEOg+r/2JHHR28TdHbad0e+ft3OmZQn/7uKcvjzuuBVI2SHMl5h
         vIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464164; x=1741068964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGVgTKfQzcM6BCbf3nLCuH4nvK6a2ubqTOhh2w4FSvk=;
        b=DfDBsqWjwRpmajTk5oqZ8XcO1FFG6B8m5Gq4jIMJA0baGOyl/5UH3W7kezYH+QUFPV
         B7sz/RtK7+uiOXj8Eku92bbCe8SMSK9ew0fVZpbaFJLvwIZJhp4q9LPr5EvhROAueH5W
         XvfdW3ISnnO5kRU3EY3BY5N1Dgx6w3StOiEF2uIMLKT4QMXbyiZzqD5N+ISpsAezXv32
         yqG+0FrQLVqLurM3T7aNTAFj3DSJ2wMwUa+GIJpvyWt02Nx/AMROg+KnvcrsmAuGiG5t
         Up57y+n31/lGg4CjjDS8uU69OiOe0EQRq758vGM2jW5Gq5aW6kCAAPoDnDZnE8eAYXht
         NZ0A==
X-Forwarded-Encrypted: i=1; AJvYcCXZBA9zdg6QzOeFun4fhpYLT84K3j1sejAJ0TC+Ew4tdeKpj4SRCsS8ge7+1mHW3V6ELNRK+guOL5LQ/YQZhMDk@lists.infradead.org
X-Gm-Message-State: AOJu0YyYv37DILKSrK58wyG09Sgt7Etq4TWBs7bFDZWokOCbpjOmP3nq
	jJvA02ry6/+AgELGfVMouxcj15ZK15Gz9XxKKawoTZ1HHTyLmYvS0ANTCw==
X-Gm-Gg: ASbGncsLGgvHc1vJKAtgNboRY3AsWUwZdNyLQ+aiLvfUbTb3gprhxWnaO3WDFamtVLG
	n+QH4wSg+fhSoUmaTw+Gy2mXFwAGvONN2fO5iDgbVlxlboMVj2I9k7GfP2uNsZIwGcFn7G4t02t
	XI86XwsPfYX9OmfjG/MxEk9WMsa3DuMCUhprtW5iiG/UKLw44c4h1jJRUHnMrxFgQ4tcgfBORIj
	a3SIjEPHi0WB8upgxjO40kLnZjsfUoLswoBfrm+QC+QRMDVtpt9DpWXKrwAqgvqV/90ZghByeGj
	ZY7Jzy6siIfXfwcC3jjdym4hQEY=
X-Google-Smtp-Source: AGHT+IGs+VKr+OOlZlfm7dkEfjYmOfYQgfwqv6Qp2AFuCJdvwfEPwuo5Oa3/2GGy2JMQF7Y0gUE6/w==
X-Received: by 2002:a17:903:1ce:b0:221:7b4a:4773 with SMTP id d9443c01a7336-221a11c2577mr235316805ad.51.1740464164054;
        Mon, 24 Feb 2025 22:16:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a613bsm6264785ad.192.2025.02.24.22.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:16:03 -0800 (PST)
Date: Mon, 24 Feb 2025 22:16:00 -0800
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
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 4/4] MAINTAINERS: Add entries for Apple Z2
 touchscreen driver
Message-ID: <Z71gIEbbnA3gCQ0O@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_221604_867787_58DD2480 
X-CRM114-Status: UNSURE (   9.81  )
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

On Mon, Feb 17, 2025 at 12:38:04PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

