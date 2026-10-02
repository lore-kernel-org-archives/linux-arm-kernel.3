Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C43CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 03:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=; b=J7m9V7pQlJbWRKuo1OGpCGKOdc
	BX4x+Rcz2tbFTeYL15DLUU7iZiO2H+CvHLGZXpE4MYg6UHLdF5apwhgXW+Z4XdO2gFoRDKhZNSw+r
	ytH9Rts2JHOvv9iRKd+ZAQ04tZPUEz8K9XDG7d5ZoQuY3wS47NmF/q9KYjpRevbSU34MaymupR+ed
	IQ6sY012hCv1Hm12Er32v1ytG3Yxj5g3kX9ZUVC14yeHlT+vTwXcr96tGF2J03Ab/MhgYS5xKaLCU
	4YdzTTYqJukMAneNPfIeBaAYj13XlG8dNTQAl0TJ5qVoRAI7fs3wrHVFpHjKu52DBeeRtFe2y03XO
	opX9v/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTa2-0000000AXON-1OZM;
	Fri, 02 Oct 2026 03:05:02 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTZz-0000000AXNW-0E7t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 03:05:00 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-3a4fe110578so988527a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 20:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790910298; cv=none;
        d=google.com; s=arc-20260327;
        b=aQh+ZpVFDmrhrOYGal+n7IZ0PMq/CVEtUAxWWR+Q5ylsBUoLkX4n/rnIkRwuyL7ZIw
         dGxTz6VAz0KBudeHU7YL5rnOT+8dB+M6sb7faZSN0qPSkTbsiffQG9rfWHnNun0n63xb
         IIYokcEs9DA4P8H0LJZg8xDCwVhWJK9XhoFz+pYH7B2Edv6RvaMLhzV34zmpT5+AMOip
         MNqNYMKjjCYJTiMVDRqGrmSnTezsFLQsAsj4qXo4pe4DTnNncYrT09NMGSdS132W/4FZ
         8NG0dcmYQek/W1hSWgWCRB13T4gAFPj7sRvGCKwzaevPyOi6GFtKf/UwiM/NquQIAalj
         dZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=;
        fh=jCson0shyf3XpPtqTDCaodSsmhIyod/b8YHVERwGNn0=;
        b=S4vThEhG7CxqXtPRCsncIYEtU4wacZkQjdKtQake+L1mYnrdU5+p+uGwEmd2XX0Fkb
         kNyNEwBs8fgohqd7lbEQqqh3zN+vDjIy3qt2bvIKmMKWsTDNWm8jsqcKIRLsyigD64ue
         Tjzaez6A3DfDQrbaHPbTxpzAmu8+2m/LKo3eEb5JtOiy3LOpq/NYHhAEmrktrm38EqKV
         jhjlYmxkhuEomKDpNSghmPY26aUNMIUP44VWVNMxiqUuBENYvAIfUUt+iKj19RkPF2iS
         lTSr411NCbCPS5/Wt8VJY8dELuzUcJyeVrfZY0mLllT3srkUJpHEI8gYgNrbrBuzKPyv
         qS7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790910298; x=1791515098; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=;
        b=opEaALeqW388vX1SLKF1WzrwZw0Zu8hXtc/g6eVYmpnhm1w+yd/t99q9tNmkawJeEt
         q5hdEigOvLYrnUkEm4SnEUAUZEI1QOHMaUrn/dhTSWzbJwhQTZsZgJiVvzMv3bhTn5/i
         XnU+F8DR3W3qAiFPSffAX/+RHrojJTIqZLhggX+UzCU8G8F/CMN93Gifxu6JoEa4/v+u
         RezJtO92B5LKo72HObr9YmAOYy7WyvZwb+Yc6EzYu5NractxHve5o6EcAVGPJKON9URf
         Qa4GywgJoPPWi8sIMGCv9HO8L+T9Zbhl0t/Jre8qMXtTwCp3L5h2ehiEQdhceS3aN0Xp
         LG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790910298; x=1791515098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=;
        b=sW3K3tUQ8dNLXCKlwAbzw5A/cpVr/OjcGRAtytiaTDllzey1lnV3khsfYd/7bvKnGG
         gIu6YNpaYxjGN/sbUpd5hfGj28f87wxOBBOmRubDyk0SKMeF4Uorz87n+NAtNKQklle4
         lvtFY+OHAjVNA9Tic6u8XCrIvcJxHp4JGj3wNgwFLsHPRgmaPjfKFiJoXtNTD37sI/Oh
         /PT/pccw+WXx7E+p4eCeCm4jlIXbpe0X4FAhUjzgRTgMQznxIIYj37tUIldeW+67gdJH
         F9PCnIjwpMQTblo6I+JpQRd7nuJpMDLxWN9X/so1onkeDH0yNoih8mGwIDlE+z/hVEWP
         29xQ==
X-Forwarded-Encrypted: i=1; AKwUvByrRfxRALsFfN6N5feZbJbO4R6SMyB6s9DEqq1PVECzD+wHo8Dv03iq3mLrcfx5nNlf2ebks6IZGur2+CAiwq9y@lists.infradead.org
X-Gm-Message-State: AFq9FYLS8tHfXKj05Y+kwRgYmWsYdzu2ilFT88s7QXNLe5IxBGTQFrZz
	pY0VrWEtwFvGlPeaYCTw03tffkNmeK6VT+Rq82+cE4rPe6LgnuYEOCYg+MOpkmzu4GrOqrrgu/X
	/4WJYhBA43RDETdHvcADyClAN7wYvVVI=
X-Gm-Gg: AYBFou3J13PyFGj/hL0CNcCqVV/yiahloNteMRZ4UiwbjXwnlBmCv95V5UShwHC53Qr
	CQ6WUUNljvdibfv6pL3C3hpFYj0lbr/ED7EFWxB8LdEQ/HUS6IX8VOCUvXv2emWkY2Yq9l2+w92
	qGq+X32lhku2vVCVHbYYrpjHcGFZQz1/QoF+6xvPb2RS6990fH1EAkTxlJILH5Lr++hddy3icSq
	xZFvxHxHxQtc40wsfD1sM/Ef3p7UeiyA+Q/Nhz0HxKVhDSmNByolhjupHyEUyU48DOC6RzSO7uH
	269UhqrPgh92FAuXL/I6O7DId2tyvXqFG3ccQqIRWx53JHcGmc/7JCG8
X-Received: by 2002:a17:90a:4ca7:b0:3a6:ddca:112b with SMTP id
 98e67ed59e1d1-3a6ddca11b8mr489962a91.21.1790910297480; Thu, 01 Oct 2026
 20:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260929075106.74731-1-suwangquanta@gmail.com>
 <20260929075106.74731-2-suwangquanta@gmail.com> <20260930-curious-narwhal-of-calibration-62442d@quoll>
In-Reply-To: <20260930-curious-narwhal-of-calibration-62442d@quoll>
From: Su Wang <suwangquanta@gmail.com>
Date: Fri, 2 Oct 2026 11:04:46 +0800
X-Gm-Features: AclHuK-KfgGwZ7bu_T0onXf5TVB_lsME61cxwHa_OQd7XBi3kxomvlalflHsano
Message-ID: <CANoBHH2a_Qu=eMoQ9GFYYn-MVg7zhVZJbiBRP6L+roU2zp3d7g@mail.gmail.com>
Subject: Re: [PATCH v14 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Steward.Shih@quantatw.com, 
	Martin.Peng@quantatw.com, Fred.Zhang@quantatw.com, p.k.lee@quantatw.com, 
	"Sue.Wang" <Sue.Wang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_200459_131921_74D0C3B1 
X-CRM114-Status: GOOD (  22.68  )
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

>
> On Tue, Sep 29, 2026 at 03:51:05PM +0800, Sue Wang wrote:
> > Document the new compatibles used on Meta Ventura.
> >
> > Signed-off-by: Sue Wang <suwangquanta@gmail.com>
>
> Please respect our time. Actually other contributors time as well.
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>

Thanks for the reminder, I'll add the Acked-by tag back in the next version.

Best regards,
Su Wang

