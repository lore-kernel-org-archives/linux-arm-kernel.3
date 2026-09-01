Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2FEC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=; b=Am4tOagRa1C5o19ksjMyZ2FA6/
	4u6UJoiNwL7zjUnNf5Q/wzfpkz8lX1arX/QINuFmL2RLES3YK0D82m1aHDf6/8IJ8WGjTWAsm5tu2
	Z4DzW+rIcIW5BHEXAgVt9kdRU9ZNik7M2P2OFQJs+quEMn58xKvDTQ+O27QLX0GV/tsBTf6TNDRSW
	Y3ViERNb85NfG4oFjH47cf2NFZ9zD6ausNUOM4Jh583cSqnpr04wU1x1MxBvSPVko+b5ntT1RUqmr
	lQOFtHRjYw/MeQnTWhA5+fdE2zvovj+1RsRU/tUCeMuKDoDnIMjDdtWHmoj3P5ulaJEAqCz5N3L/M
	2chtSrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UQl-0000000DFHk-2PSA;
	Tue, 01 Sep 2026 19:46:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UQj-0000000DFHJ-16df
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:46:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-499add6348fso535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291959; cv=none;
        d=google.com; s=arc-20260327;
        b=mSriqFmFp5OE17XAfel57UM1lQ3vPs1EmvThfyhrdySbtH8tn/yC4RlBazefsuvSqq
         liaGvgVy3Xg/ei4ZymDNMPeRxDw5Co01AvWqZ2IGNh1WB63xmINFaMBjbiUgMrqpHP9c
         tsLJ0DVh/L7KFtvU7NUlBzV95eOSxY5gZTHNp4Ht6yzFwFQSO8g4OjXFL7DL5eYzYiBk
         ww44C5tSMyWGrNCRM7V0TRJJfX4iSdwoFp4aTiJwsQjd/M8QKcKeC0DO+boXfrIsERes
         uc6p2bwI1pTTTjkOWgu3fFu+V0UAW11nzYt5E8rzPFbyrQg0LMRA56Wxmr/ZfO4FCa9P
         qoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        fh=xw88maapZi14d15613qhgBcsqmKkZxrt/Q4apawS7dw=;
        b=BS8AlPTRBeNJELKePfBzNQ4r8i9NYlQB6rCxYYzJU1xbk3FCHqnuvYTkUep0aJwRHS
         tDB6XQEQjVCTQzqJmPq5kyUCuyjNl4jotgU4AHRm/G5SnA6Bn2eNsT5EH/g4LegmBo2M
         WnLVAiYnNp05xuOSl7peLtOuSudP4FqMnzPmIf+mNSXaj4qkXfH5tyMd6O/AIKOrC8zW
         81dFQLtfbw3vwaqaIkEAMaZqxPJVfML77BoQD/foLRIn5uwH9jFGo+2ZR9o3yrXdezEp
         R6IdZtrVAOz0AONi9S/KazCZhu//jVFvFJHNx3tOcBEtQChOD/ayPyhLW/TBH9YrN65H
         m3Iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291959; x=1788896759; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=YpWWJ4QuoSS5FMj6EBdPYmDDbpTG2ohznhVILzW85y1tgsTQx4t2oAj3JRKIMZmeDU
         rO4wso4D1adxNV1EXkwR2wvG3IPiOZf4Hs3g9bSjj2SRj9eIfANuoRjGDlyyqip7T377
         IA1XvJyGrnyhsQVitmFTKRX6zkPoPR8kDZpK3lxixjH3tczBzvwGF6BZzGcxeDX9AhmC
         dNZzTpaoD0S+EwUFvBD1tUs4zVeou85sXILtyDkjAiKZkxjwbF8KqHBQjZtpOkksLCwL
         kWbgPXnYOvbeBttIUzOo1mngL+cETwjYLaHpvFM8917iJv4DSf4UufLvLkmo9MkMhxdL
         4veA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291959; x=1788896759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=UR2T/TdjmEeZ7jDQlGVyY0fc2qOF6uxocPCQXocO6kqSBbzKmAJyzxewYFFYbaafnN
         Pqb9AuXOiNPXsNYBQzWXUzS3uQFJfT/yvjLn0Fb3Orhkeh9mZsEycQgb6MxKzaD1OYmE
         n/Vi/SnR6dbI78R4LLhgQcUTteKdj9eIsSGC+P2KDd12+ZiWL4AlRstfywOsLltt71i1
         o8JmV3K0okUapa4zcfYV4KkXG2R57w6JjmD5Uy+/ZYRT0ezaImj4tNIJMqm/54rlKRMY
         ZEkBDmV7c5AcePLBaG8LAlQ3ngJuA6LNAoPxZYSbBl88w9MLw8DhY8s39990liEMTmvZ
         Yv9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqw3kF/S1A3/LHkyt9FefzoqAep/6ZLH+K8Q/tTva22s1ZbZukkudLRAAl0LhsQD7ANzNutvkX1TPscsHiY6pJ8@lists.infradead.org
X-Gm-Message-State: AFuF++mKZNJP7fYFxiiMIXGLenzk2r3US2eBYkSseKf24kEApb0ns9mX
	t96vWKsoe9gxXh7vnVIIK2+0ISYZxeZHgZKNdh0z25uewEIkss+hQDJfhV0ODwyfrJt5xqCfoK5
	C6I87BwbEGQXVVU2b66vpjb1kG+AdCdx8Uwa3cCiq
X-Gm-Gg: AR+sD12J7THhrFeZzDGLBPo1SoqdeqaH4BSz9o+Gl6NNlftiAiidH41f9kth1PPE9RE
	QCnOpkoBZ7y2tLseve/aAOL4Wy1acUbzS7noAWjhZVyLp04evoNkpNtUG1NyuCbUN2vdiJuGMXf
	w7P516f+yxnsUAl4dCVcliNrZ+Z5FpXoYcJEYk8ihL5zsN96wGx/ykbfwIJlAMEBkhPoezqsocd
	m+4G+PlO1PEmqzzQv1AASrYnQO5WarBftrw3OkEOd4yOXOyL6iV1yrjYi4lqenGhPNUgE275M2q
	kdE4Vwy38fLDl57VfvBRQQsm57plzgbOPrzZr9m5mpskHmqIeUf95pGMr29wS/hbFfXHkVuD8Xr
	E40vpA+UXOm0=
X-Received: by 2002:a05:600c:6050:b0:495:7a0b:3b4a with SMTP id
 5b1f17b1804b1-49ce47dbac0mr115925e9.7.1788291958768; Tue, 01 Sep 2026
 12:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com> <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
In-Reply-To: <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:45:21 -0700
X-Gm-Features: AcwNN1Vx40LeKlkhxLn2rqkujAMnERf5APsKIrQ9ivuoQyg-T7s82dgNrM0lw9I
Message-ID: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_124601_319605_342F2A71 
X-CRM114-Status: GOOD (  14.81  )
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

On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> omap1 might suffer from the same bug: their suspend routines are also
> fncpy()'d into SRAM without a type hash and called indirectly. They're
> all ARM, so asm/linkage.h still seems like the right place for the
> macro.
>
> Do you think these need to be fixed as part of this patch, or as
> follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm not
> sure how to test the fixes for the others.

I think separate patches for the others should be fine.

Sami

