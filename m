Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328A1C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XjVam93oa3spMQHjTS09LkSETmO0biyQOMZVXxMvCA=; b=enqnWUZNJi9MQUrezbMNUSWDFB
	l6z8LuqlEiudyYjXhPk3BCfxyT+SYo+ndfJ5lf4/5zoZADkYfyl2Z3iaRiKvP+mIblUUdaKY2zBcY
	4lXihWb8pTpKTwd4KrsYBWKQX0BFcCdNBu+wdih9+hLX4bDxeDt0vQrYzd1Ikg3v+dwSeHc8yTCxD
	R5IXioR9jfyCmLFIrTA49Olv1Uo4vcRhnnHidpeUQPSTedeRIvbUQVELmyOf6YB1WtVEDLGPxlkUc
	MDsJlMZ05UwzmiGnazLzhl+RK9iRancC6sRmWzdmkDR3w3F61Ta3Tv0FdX8Tlcat1lRKb+Dq0HTo0
	CbKeOMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pfd-0000000CMqU-0emD;
	Tue, 01 Sep 2026 14:41:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PfY-0000000CMpH-06Ub
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:41:03 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-39675172593so4354275a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273659; x=1788878459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XjVam93oa3spMQHjTS09LkSETmO0biyQOMZVXxMvCA=;
        b=J0ExXRcNOAUSFwS4zu7bFmv1F5Jap3+EtLbLWG4LhPyJHJyWwjwqojCWsCVlw4QaY8
         C46ohB5u2mZAEqeOp2vJ0SNulNnHd3S77ZYMZEgIUi7RJA0WGvEdt/AxNFLpePV51smt
         TueOnktzPQJkiKdIj9saqFo9eSYE96AK04/6Sc0eEeZAsQ/tDVB17UIqZotU05rbAznx
         gH4shKQ7IYwgI/WCqi2SnJdNBAAedlcdQtaG53JPPBQstuJ8Ygz6opkQV9lp7qVbbCDP
         E9L5F+85C1rUn6Oj9Tm5igqAoyApvICEvBUOQYaezDtv7JCuHLiSUcOyfzhQ7+upx+KF
         t3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273659; x=1788878459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XjVam93oa3spMQHjTS09LkSETmO0biyQOMZVXxMvCA=;
        b=LBfJtu7JxQZUUpixdc5Hr7A6+mhGbm3WS3OjW98qWIdJSPtlMYTSnzUj5MD57lQxix
         LushkbS/xoBzdO8G3rfB9t1owo+SkROcDYvyxEFyAGWbLOV6bkM0J8os2Nm659GumfSI
         C6GtUDa9sBG2ebaKxdHzDs66X/C1vJc7LxBXjqyvwdTBDNQ4L+PsqVgfP5VnAWdi4545
         NWXG0+fC47UZpE0OqGEfiT+vjzPd03l51VIzBikMotxqseR/yO6Lc5cGvXbqbUuZJCcM
         kuC4EQBae1sDfdTCPVqCxsL7JFpBwutg71WaiU52XpVaojaZUSwNSDS8T7aB7we+47Ot
         qbbA==
X-Forwarded-Encrypted: i=1; AKwUvByHJpBcYPODjDVyDUJMsnVoZlQz9HvzBGBUwO7uNBNQ9V6752NK/VNAR6hnPijBNLeYdkilShtlC9twyMQeQmxQ@lists.infradead.org
X-Gm-Message-State: AFuF++ml46jweCs5D2j40AYniuBqGe93eJWoh7pHjhj7Amj+QMM5D9RU
	+xde0p1PRNF/sDoiY7nwNZciqH5/Xfx1Wpcs8Xj4n+Oi8NJ5YeI9ONT0
X-Gm-Gg: AYBFou1YvUaCBQvGB6R/KUiwQQc4F0WLORskZXPYroDb13WwICzHVP8bhe8ypffP8oY
	teiz30uavQuFX/6V8qkIRW0m70fiXZNI90HPzd1CmrGnC7/MXy/0P2nHhd45xSwuiac1Mk1IA62
	2cNRWbY7iZnBmfYonUNqb9KlNzJHtNK+cuM2KaekJqFRzZVIZxqMFOsMz5DEPmBXVovLavmsYpd
	F3lJ2wFehxQGUaFJLTuEbpdWnP7xI9Dcg35j3gIvwoNyAqnVWp23ltsEnMHUSCU/AaCen1Taat1
	wkClnzzzQ83WwKsvhQ4b/5ZtRvWGUbL7/iFhvv7OMwRyodyka2/5MoYhKC1p5ahLWl+myFWIznU
	bifkyQOX5etSgY1mzJz6SkMFLQyvQi2kls1fcQCC7W502eqO/ztr8roBnA/v8SCtdICfwVMxbXx
	0r/CVnU4yp9eBaW5ovn5pkUDtCdUV8Dbad/OgfpVLxY95WXq7z7YSOP6WYBg==
X-Received: by 2002:a17:90b:3985:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-398e46eb068mr20470492a91.23.1788273658460;
        Tue, 01 Sep 2026 07:40:58 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:bf00:62c:e311:6048])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d7casm21027a91.10.2026.09.01.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:40:57 -0700 (PDT)
From: mdshahid03@gmail.com
To: jic23@kernel.org
Cc: marcelo.schmitt1@gmail.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] iio: adc: bcm_iproc_adc: use device-managed resources
Date: Tue,  1 Sep 2026 20:10:30 +0530
Message-ID: <20260901144030.509802-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_074100_064263_DDFC60DB 
X-CRM114-Status: GOOD (  11.14  )
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

Hi all,

Thanks for the reviews and suggestions.

For v3, I will incorporate the following changes:

Patch 2/5:
-Add the direct includes for <linux/bits.h>, <linux/types.h>, and <linux/array_size.h>.
 Keep <linux/device-id/of.h> and <linux/iio/types.h> out, as these are already provided through the appropriate headers.
Patch 5/5:
-Remove the now-unnecessary platform_set_drvdata().
-Return devm_iio_device_register() directly.
-Remove the unnecessary backticks around function names in the commit message.

For patch 3/5, I understand that splitting the ADC cleanup into a follow-up patch would be preferable from a patch-scope 
perspective.I will split this into a separate patch for v3.

Please let me know if I have misunderstood any of the review comments.

Thanks,

Shahid

