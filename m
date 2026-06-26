Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C34CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=; b=01OKjjItsco9I4Iu65FtoVIgxR
	N5jy2ZjpziVBZpzz3XBB4JBdqS/JkjQOGEMSTke23DeckoOjQA7PEOrPDSZOqkso651HhMACUhLc9
	EpXm6mirxIoPoGww6fdwsS3TgfkgOLm3pM99ZO8SRdE0hOAHZAjL7VYYm8HfrOAMi9yDw6E1M1ugV
	rK/ZUIMrKuIKymDYC4uTlXJs4q2pAw91Lo2vRwQ0dkOWne2e7BTU9xpJenOsSdgkzpAJjWK2jKKgF
	/aciyKK7kp4ldC4OpB5qIbZNmNmY7jBPmromu1RKyOYcKXDFEI4yuU8r3TdsCsA2ICdUiBnJoM2fQ
	iprfsrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwC8-0000000AGZ0-39SO;
	Fri, 26 Jun 2026 02:21:28 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwC6-0000000AGXt-2NOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:21:27 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c0c41ff84a6so63283766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 19:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782440484; cv=none;
        d=google.com; s=arc-20260327;
        b=VWCY5vcB/ueElP2isZuNObQyj7qHXQyhtlrVbhMSvh1yow80kn4fb2EUZEK1VwXSLO
         66tsuSKv/JzaSqLfdAnof/WzqZZr2tFjTttQBE46KfknmxAbtl1zXFkAxa8STnlHPZt4
         5l3jlm82qayGKvXnMzo/XkcRT4nr/ipGsXks2kEe/OAgPsIDQ7PMqFFt/y2WErF5QbnV
         agNbuhg64n5+C44GdEO+RaMqKt7TvNzk14CS3e22WZOATSlD9Yhvj2QsJ0Wj0WEWYRZI
         lGMWDweA5dHU7o1n7lkGCAzBS3JSvlNhHudPYx2QFnWOi7nP7+KLK3s/MFRkoZlHV1se
         k5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        fh=ihFE4Oft14/H6fVlxlE/pF2H7cCWZE01ENS87IPe/c4=;
        b=S9VGSWVdD0IoLHN8t8nNUdlEptdayzQ9kXNcoNL5Fn6o0noqWy6VayWD4tRuuSp17v
         B6ynG+KIdd6cedrwwBeAHLbW/Oaz/X69f6Kn1O/7GI0mSeBbH8hDT1+QraQmADyV/GGZ
         4gL57St7czscaih1n/KYgrLgAnjbKgRQlh9EIxZQkAsVlxVzNMObAaDaKaIm+7g8Oece
         6zmeJcCg/Wh3STfFY0mWXieuH+Y8eeZ9E0dsygQhIPru9pYAwPSW1ZHLcZ1gvGY7waOS
         I8jbJEzthnqECqGGihnbnHixE+fFb7MGwtiRbVmRGd5alqFAMM+vMutk2Oa5YOw2W6DM
         K1CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782440484; x=1783045284; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=rSSgFCAnGlp53XcetrhUiAUz9sFwNrpstgXON6CHhqYeU1f9kQyEYs2tN79KxJsQCh
         YHci53v10FCFNBnN4LJ/9I2yQfrD/2l5qdBv0AHshbvVEVgAcmFwy/HzH/RklcN3mUCc
         pf5/LIhuw/ovP/isM8zRppq3nJNNosmqCurM1enujdNUzopNPppYtzr3y5kjf6aLdAPR
         uafkFZj5oz8cofcosuIuliFV9GMTFbYyEmc0WzEfstalY7Kbbrcj1Fdaw7d2ya7SFxzo
         PUzSO/3HAkUsB2CrKt/yDFYHY9yDE8QeOQJZ/10bkGV9TYSkiiR9HU45N9ioRmwqMreI
         16VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782440484; x=1783045284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=lp1TEyu7B7GypXkG715oMcv0r7R9Zs4sGoHiubBCdKzexSMqis8JKSbTQuLlvrcD5I
         jJMElEuX8XXgVPYKKEA4D+pp0cYbKK9UVqd4yx9lQ/vOYSYHtUs2ojINH5a24/gnmz0Q
         pBYPgDT1XzaWJksDz4FYNwE5Ww11Er/Rtw8S6p/sZeH/S+/V64/7vKDuHTuxBcbunvn6
         Znazyl38SLcfDEARnou5t16cVyOF+te1/ufBuks+ZtvmGivLkB32lR5WaI8H8c/VhutX
         bxIjR6WEKXc0AxKwDH1u34sSiJxyD+SsVDtu7XKypMKndiVUTmIygGiG2gK/h6uxSLKn
         80Qg==
X-Forwarded-Encrypted: i=1; AHgh+RoqqwB4FM812S53jW3Vv4rTWFqii6fNXm8nmPqc1CGnDLskqG156JuLy8usE5419ofL5DJp81XYyiLOO39F2/wS@lists.infradead.org
X-Gm-Message-State: AOJu0YyQZRtH8MdXQB27bCj5y4nyZZRv1qlyK9HRvQBaBwBS+6zVPIP4
	K4RSSreUopYgPTZfnXX5D5MBkl3DF7Cc0CTnfy4tZ1jC5bZb1fy/38MH449LbFd17gN+K4hNr68
	DN0JkJes8RKivFNKlLW5OlSrmuAlvj+s=
X-Gm-Gg: AfdE7cmwPY+vNMdNlBAKYpyf67g/JmjMzRev7jHsOeIt0VVt5l2krWsuQacbycH7IxK
	sLmu97nJfVh9cdZEsMelTJgsgmMjyRn/pRqI8LOMJU8GDUwkHJyqwGzuPKNEQF36OQZGEOCJ/j9
	vBLZZO8+pocW1wxfciNHNosiq99AY088t8SUuFHhLtpU2bPS+OcOX5kLV04RGvzZwzzq1B+qr0N
	Eb8zWk7vU2e8OLq9nCk9L0IDwbvPhl9N9DD+YrLMk8gGiDAhYExtheRqzgxQfeKOw+bKcLZ
X-Received: by 2002:a17:907:3f11:b0:bee:d554:f33e with SMTP id
 a640c23a62f3a-c1205dc2df5mr316225566b.21.1782440483670; Thu, 25 Jun 2026
 19:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260525033846.1346744-1-dbgh9129@gmail.com>
In-Reply-To: <20260525033846.1346744-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 25 Jun 2026 22:21:11 -0400
X-Gm-Features: AVVi8Ce5zGEk0A9Nfzhtq_3Kde4UYODFXCcQ5p5Q0_x01uwtJUO7uKu8zJj6rvI
Message-ID: <CACrCO_WeuWEZMvwYk8Y7kB09qQHZQNJWOfv30hJ2JaPVPQ_GqA@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: npcm: Fix OF node refcount leaks in SMP setup
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>
Cc: Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Russell King <linux@armlinux.org.uk>, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_192126_641585_D93E9CC3 
X-CRM114-Status: UNSURE (   8.32  )
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

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks

