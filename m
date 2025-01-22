Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C37C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GtyY1cVaBALO0x9itDiGJGSMS4qefrx4wqmN5pEG4Q=; b=zzhUkQKVvWcATmPXohgZazr6YN
	kx3IB+vr3k5QicFhwWMLlIZ8BGuNBPos5XyFOdIS+inrZAkVplH3LvBhwAoULDxGHtSmKS8j5osDj
	4B2IQKehnHfyUgjhknr986LyyN83J9VdPAz5ScG5+ZU37JpPI7blhzEYmvLr2Wdpa3FCRF5URKOMx
	nHabjG9soCarasJUfDXB9Jp1Vu/nVMWQj4ODWXr+Fy68jbLuJebDtVJtZcicWMuFXTdd1al8r8kt3
	7QIxRwhtBoI7u2x292te5lqDNsVuSCqx18eYzGXOHDk9/5VSejvM+k+sOQl2Rr1+kcA5gfz83aBSh
	V+kgj2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taekF-0000000AtWP-3j2T;
	Wed, 22 Jan 2025 17:42:27 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taeis-0000000AtMa-3ruS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:41:08 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e54bd61e793so12867546276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 09:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737567661; x=1738172461; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GtyY1cVaBALO0x9itDiGJGSMS4qefrx4wqmN5pEG4Q=;
        b=LuhVhS5/vZZk0ntN43evuJbtXNC14ezvmh0YTFd0LTQ3mfxlKkvGq3FLCvsN25Jlzv
         l0FOvjm8CKknTbLl5Rp8VWXJQto9slGlGSHTVgRwDRjCbV31b1QhVQqQpAd9AuIHyTto
         pXcIixXswTSi2bRQmWHAtFCZGwi9SvWVvft7vsHZGkgou3U2tlafwIFtnRj1BpzEXSeX
         0faUJMGXdb8OlVbzvB+dfq4sgGNDwj/+VkjnFEMFbA9U+/sL8WH0RgELpJtwINXFj20P
         aE877TfK2cMQ8M0tLvl5iQMHVRyy98mFLKEnVRQIcOzNZSJL50BZxwF5/8RRhkcV+ZvA
         r1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567661; x=1738172461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GtyY1cVaBALO0x9itDiGJGSMS4qefrx4wqmN5pEG4Q=;
        b=VsrTcdQLG6x0VVp5lpqsPingiYecahO5Go+Yb1LAZzW72ppg4YAbkw50abQiFxO+0d
         1429Kjf5dpyk7Y+zCo4kTJY9FenqqkcSoAJJAjx4hCDV4U29PKrxXetPXxOer8w14FPu
         rJ5TcNL7r7BeIytPWw3KLooKsog8XjqPjN0RoYHTD+RTRpzjocV+qlIpvrhE/HbmPs1M
         qvxtZB41Z/4GbCK+YwiyAstqZ2TPkFFMNeratrhmlsFmyOt7p65YiN9sUhTqYvq6YBM0
         RUUD7hTKpEPRob1tNcpehRCqeOzQ/r6J8gp/ZBvRV2eLVCbvIL7ht7og1jjUk8iv02BG
         tLKA==
X-Forwarded-Encrypted: i=1; AJvYcCXmx8itdGap7/gW3TRc4JSawWkQ0QSA9gODpg/VvfoGiPL+frSii/xMBQZ6PNNe3nWG7kJQ/Uf64K4hPDeK/LXz@lists.infradead.org
X-Gm-Message-State: AOJu0YxjdfAXriSFs80ZR62mH1ff0BOahTpyy3hGj1+oSclUVzWA8Ab3
	b2ZjRa0CAmqV5GcT0OBL8/ESMdjpzwaRQ3uMvR4eeKK1pH7Xj9IgeANE0ACDopbQwG79yyM5OLq
	JXth3fB7fs7cXWnJOrysBTPLynbA=
X-Gm-Gg: ASbGnctELn4WFMBWVHauzDJtO7uQ1xD63PjzQKDwiC08BKf8mWkHJbT0P7sMl6GaOTJ
	enTqN9R722t1RjF2h3WZP5ABkpOJoL4dcLmIHgXPXeKrhWC6iknpU
X-Google-Smtp-Source: AGHT+IFd650glm13bU2UYBiJTAE5o7XErEbuE5bAZ5JZaThH06YEG78EurncTUvsjymmBNUVyUAlYia54MjS7SuCnQg=
X-Received: by 2002:a05:6902:10c7:b0:e57:6644:ea3f with SMTP id
 3f1490d57ef6-e57b1051acdmr14913763276.15.1737567661245; Wed, 22 Jan 2025
 09:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20250118-z2-v5-0-6d38b2582169@gmail.com> <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
In-Reply-To: <Z5CNx9natNYmJ5il@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 22 Jan 2025 18:40:50 +0100
X-Gm-Features: AbW1kvYyP8Dx29asGtYcXu-mkX2Tn_inSrOkAaAFhCNj0HIYUTnNwU_fXtcLL2A
Message-ID: <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_094102_971351_5F5CB6D5 
X-CRM114-Status: GOOD (  11.34  )
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

On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     z2->input_dev->phys = "apple_z2";
>
> Phys is supposed to be unique, however my understanding there could be 2
> devices in the system?

All existing devices have at most one z2 device, and while i do not
have visibility
into future apple product decisions, judging by the current stack, it seems
unlikely for them to make one that needs two of them.

> -static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> +/* Build calibration blob, caller is responsible for freeing the blob data. */

A comment on a previous version of this patch requested to not have functions
that require the caller to free the return value
https://lore.kernel.org/all/ZAlM2DzMmwzWIZEF@nixie71/

