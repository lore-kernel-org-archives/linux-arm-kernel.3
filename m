Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAF5C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XyK2jKdoKkKL5T7snSnH60cAWdSpGKwMQSo4tA4mUM=; b=4K+e9184jbnanOpjBDK5GuZrOm
	gvpV2kawfjg37lQJdyPuQw1TXlgwxyly5y9UA2b+7g9i2y/0H1uOlnC6MTFes/DTO+67+0b0/9zUN
	q5MMmnLgAeiUoX0iQMPiYU8DdX3zMKs/77+gVyHzKEFj0IDFlvZgUUouyczsQoTL2KZhibwb9mFOO
	IfjkxkrpTaR7iW3/AtEHfOysv3R8nh8X/g/UtUlqT8lJ+wWXZmBYd+RmKqPgp2waxXECgW1TYjEsp
	cGRzRJaw96yELI6iUkzZUMcKpV2+X/5XpLHzMz/skfo1oUtjoYQIvpKLBvmu+ZcyafARz3KehFaPx
	+BybqaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjJk-0000000G6N7-3XgU;
	Sun, 27 Sep 2026 07:29:00 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjJi-0000000G6MW-1amf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 07:28:59 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b8eb39a8edso1472083e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 00:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790494135; cv=none;
        d=google.com; s=arc-20260327;
        b=dA/ebAp7R6anhkytg9Y4LqBwSeiieviR/4/3iso5bqNgNuA8p/OIv+5kPinUdQFOBr
         ZT964+Bz63iBHISQbD+B4ZmvdH0RuNj8aor8O9F9J/TBU8Em+lHEh0+gvsIWNYpQnCJN
         wQoER4vNOaArtJqVRTVix3J/c8nmVxF1+BBbxKrzp7Ws415tZ62/Te23POdGqt+VkX9g
         k8mdrVkx67ba34hn0WLZNsCuzOtAJzFObC9coIHry6NLXcQnDHclLDZCp462RO18sBOd
         sSee1uwUyLImtjS37oPv4ILIWMERKfz3HDk4IQJmIbEg4P9xjEvVexpufxeKOtlN2clw
         v/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/XyK2jKdoKkKL5T7snSnH60cAWdSpGKwMQSo4tA4mUM=;
        fh=ZQiXOSfCk8HkS7RsS2XU0dFbyOmDQ98n3C0B87K03YU=;
        b=O4VhA0AKsLuYPQkZmCIpWlkOe3Fg+xj2JtKqr3xA64Xc3BVwBt87M2i3KsL8S2PJFi
         pTtUM2Azf8OJUQETAAfvRitqbigEm/t/TmC0gwsyJI/ZE8tZ92KS8w/ZwGmv51btsOl/
         EQeN3ApUQpcYBWEE7n3lrIeQ9GAbhoO20yqXpat0S7hZOu5vqZ5NgMaCrDI4R4FlCVns
         KcRq3m/uRs1DLkgfJKm/gOMKM5Qto4JpbODkB+TgFVCVPPxG0nWfTU+hmUa3cZjP5jSs
         9+kuPN41Norr7OiWWTvPqOB9oNDEbUkFvvm4p7KqXBplWxKr5CY2YSmydabUj3sD9XUS
         sL8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494135; x=1791098935; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XyK2jKdoKkKL5T7snSnH60cAWdSpGKwMQSo4tA4mUM=;
        b=TsrVlfC2B46zVUkmhWdx1qM1Cd6EcVLdL90b3z+TvlYLvnfJnZsHAWxoHT1l4uftvU
         JzvjbrNk+3xU67IHATLwG2sLqT+MUXkh6ar33bggr4XsefPY3r0u4GASLYgW4YhtsXCK
         EieXi0XgbtKrdfNFEraaiL1arZekdRrcC9UnGg4onxAEe1SDl+JYNYoLJLx1hy8lNP4S
         0mzqW/zworQZHUBN3EpS5vDHW3bzFh2e5y6YJ57UgA0bIyJN4SucGjNW89/vtqFrvwIa
         Qai3mCryCXiaZc4pMXUpLvh1sKsp+bkQwyV3BbCsogfOHSNqCKea94JtG1wOxFUwLew1
         0J7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494135; x=1791098935;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/XyK2jKdoKkKL5T7snSnH60cAWdSpGKwMQSo4tA4mUM=;
        b=PjNZHS4ja6Esw4toHKi/r7J6T1QWpGZMPok9EWYJ5NyoaHrf7BO4FeVtOJKMC0B+db
         iEmyeVANmRUvrZWfa79SE1QGOzveT0gJsw2lEupsVi0aytqOyPw7J2E93Z18yhjOplkj
         kq088Z4AmoMA99dCNNjZE3fEf6TrKlV5AUV5t6hLo+iZxi31qemT8vEhqc/3Z/OgI6I5
         roEnQ/Bpd6qaJHuuDHDMgoRmKBfcbjsQEyoxPAcBcsJKPUTIb+01c4SbNtJ80xNJYDRN
         RKoFP1P5B5UEepustC4wM7R4d6u04JTqfD66zhW9X1e2IiLTkueytYTIyQaiXw6ybawu
         bcsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlJvyjIXeQ8Pf78iRl5S8WsPH/390VcWPaV78IMQ87s+LWLA9F0562A1eZeZryIrhJ2xWbeGuPEcG2mqO7xVwO@lists.infradead.org
X-Gm-Message-State: AFq9FYJXHz9Y+A1IH17V0vEQOSgSLknV7KlsORFk+z4e1eTAQlQTg5UI
	Qq7z2zG/l61sUojLz6uTN4JcJHWuUj+l3HK11Nvu4vtakNTYXol4lvNC3bLdmRlm1Bai2YqwZHq
	glsX2pmTG4PbbscZu/flhd977EdVa+98=
X-Gm-Gg: AYBFou21gYNhyWuW6K8n6HIhZWGcA7C03Oubp2tr0mXXPklhStarHh7TjbySUA8w6pK
	YeWF0LCzTmF/8UXcatmJRFcwoJw+7psNT5zF2xGuE4YZGWliFWLnwZdlCcB+FQW88cB4A3oaXQC
	c0uV2VlhSMU0zoXnNdx/Vt7vevKPFzpiPt74ylm5b14BCV2nbEiAHPRVDPLzRACwOtyrQmRPOCq
	UQsmp94EC6OZd7dM5n+q1oqhsrsUMCjpz+BFQ8oukqkWd0ModB6Vl0hcslEHft6Q/Tl1Jyleu0U
	cLJaMp/g+Mx1WplvDoRxUg9eUZME++t/hL6JNI3Ol4zgn0EhPaPjbw==
X-Received: by 2002:a05:6512:39c3:b0:5b8:f42b:ee35 with SMTP id
 2adb3069b0e04-5b8f42bf011mr467408e87.51.1790494135280; Sun, 27 Sep 2026
 00:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 27 Sep 2026 10:28:29 +0300
X-Gm-Features: AclHuK9jR81YtUx1RQCcrT9bGJMnvoX8CDMxKrKA2UGl4RFqsdHHmwLzPsS4b9g
Message-ID: <CAMuE1bE9XGm31fKRf62kD_rP7xFvkjjePRTPfRSjwH815PPbBA@mail.gmail.com>
Subject: Re: [PATCH net v2 0/4] net: axienet: fix TX queue handling around a
 DMA error reset
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux@armlinux.org.uk, daniel@iogearbox.net, andybnac@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_002858_439537_6ABF3CBC 
X-CRM114-Status: GOOD (  10.95  )
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

I am withdrawing this series.

The review of v2 found a real gap in 3/4: axienet_open() and
axienet_resume() can still wake the queue while the error handler is
running, so the claim that the handler owns the queue state for its
whole duration does not hold.  4/4 has a smaller hole in the same resume
window.  The other findings are older problems on the same paths:
axienet_open() ignores the result of axienet_device_reset(),
axienet_resume() ignores the result of axienet_open(), and the dmaengine
stop path has the same suspend race as the legacy one.

Fixing that properly means reworking open, suspend and resume together,
and I cannot test suspend and resume on the hardware I have.  I would
rather not keep posting partial fixes for paths I cannot test, so I am
dropping the series.  The TX buffer leak in axienet_dma_bd_release() is
posted as a separate patch.

pw-bot: cr

