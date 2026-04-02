Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F08CD39418
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=; b=cWp98J0hFSM7jV0XZ00rbRfxo3
	UnOwEH0zPrAKA6qYWqXtIwp9lGMnz+/1g8mdvoAEkQjbOGOhkiDC0gZFeEm7Cpctmu+g1zeTiLUbH
	4RZH8NtINSoSw/nIFi2KWTqDAIrl09pnCntuIzHJmdlz27cGJiSetSChGrCQv+bwtJvmwNh1VaS/V
	Izv0bP8qTfrJErK/IEp92sVd2V7NWzX2COz+1HTUPqtspGOvzsqvnB3jD7snDByUYWrdEvDchxj/3
	YNrlGcpav90ipW5CdJ+P1xTucYk+8Zvvsup57CF3BiLPl53rVxvByxvcZh/3NyFZtCAPTtrcegX8a
	O5SiezsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HfJ-000000008Ke-0Slh;
	Thu, 02 Apr 2026 13:00:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HfF-000000008KA-35rO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:00:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48541edecf9so10148225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134847; x=1775739647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=LtMccDLMZWqS2iLTxwkyx9Qe5oKVpfEl4NM09Z7Y1r9u4ziXIT9NdPoypY0K2T4vjc
         1E1Gx0BXyJIUA1QRlVZER+PmogPawvP9tyNAPMxLhZkXYG5BBGgXocS2yQcu9pDymNK6
         FpMsTfcy7HXYMBdwAbJ1Ho8WYIJcbOP0X9Qe3fHHiHN9dv8USVLu0NOfpFgjG+eRb0IU
         UVgX29xvBgPZib3xr1+fW59yfb+XgB4M94Spwx0zgvxIM+qFFZ4/viGcuYbbiOI0IcVH
         Rb4hB9aRVHcg17QepYJ4y8woKDeCSgOaH5ZYVijWKBZTN760SU23FBhbvPnNlcaxhXvy
         /jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134847; x=1775739647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=sjIOzl5xQf8lD9ZhxAlgNlDGnaoH9BJUjDQH1WaxOUIcfcbI3zswdhMYnGW8FVNcRo
         eSTc8o2l/yhiFGuO7rOYuVzvFm7tY+sY2Ty9d7O1Zi3+zj1NDSjcBXqAtJPnnvUrzo1D
         c4txGVJO97hsbjvAZtLYSq2DMYohSpMmSLSYbKF163wLFHoYFxW7dsD+YStOmNS9Yj7h
         Cw3pbWlMjSnkpMQ6seLdswcL2BNLNirQneKScrbxt/Zbfodc6IuQ7IU4TPlQM8yk0kWS
         jYjScF6oZZ7smYJ48i1NgkOrHXM5YInyxoJY+AugKmn1aTFV2M9c2TmXajF4SFU6dZNy
         eWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4i4RZ3qpUnJptZxOoYooQt0CiyNaaet+IwW7RTWjBnOzqKb25jDYOeqCXrk8EwE828xFH+2lThjpvkDPmqa1X@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo4h7wELASOcg53JfQnuqPCunrpyX85u/XWj8edsocpR87Vrw3
	XoieB/mkI5CWnDFmrmp3niXb0AdW+qMuVIaH6ihCyDrKLllAerQKNS1B
X-Gm-Gg: ATEYQzy77FCxnpKb9vKlZnl5uBjpUOJgisj8XGN2tslF06Qisq6Jk+ocJ2KpYSI68nb
	Jrv7FfkcyBPijJwu9pV74imR96hscWvBpGoac72DO84fuwcH1Mk0+XkYcY1PvfzdC+2TkY16R7l
	mMrkZLaYAlfS/fV/PX6/r6WZ4BslMly65G0mlfQc0JAtmROF3ZNN9qDCAUBIavFtDz7zhWWpRz3
	Zn0t57gE/tJ2Jf5a/Vz7iK7dvxIrCzexFsC+hO2c5b8/Ewd369kwyJ7yjLs5Mf4BpktpsP1qLAw
	teNXvxY+FRRCuxjWwDv9NzCD1PSZ6sqVQ9rO+xTs/QXMarS9ljILCWa6o1i858ponjH417HUMoo
	NX3/CHbLplrWggaUvExaTeqgnxDcma4G9YgmHPg2U+Lt96eeHLFgdCIIz+YXhZDHBFiBIDKDS9f
	GC8xnnyerIAktC6JnEXbQ=
X-Received: by 2002:a05:600c:8b83:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-48890ac91bbmr39369785e9.5.1775134847181;
        Thu, 02 Apr 2026 06:00:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a626100sm121462725e9.1.2026.04.02.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:00:44 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:00:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <ac5oecJ05oZD25VF@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_060049_786020_32A4E6AB 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 

git am isn't set up to deal with two From: headers.

> cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> like disabling runtime power management, releasing claimed sram.

The first part of this sentence is missing.

Otherwise, the patch itself looks okay.

regards,
dan carpenter


