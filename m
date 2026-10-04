Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC7CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=; b=JXJpWK+P3fXUrGQ4PcD5i7QI1+
	yHE6W2IudcOsAxk66jPWgiO6gwedIFjq8ZAW4EqPqG3617bE91AdfPl+IrTTKfx0pbP4RjC5sGv2w
	TV4baRXWkLSAmqvfnrCWgK0dWUcLvtzxMg9baLXmzM4tAwsEdzv5AOvuauECjkdycZqqRkyW3Gamh
	aPUJrZd8XgdMXz9ob9R+UHBJ6clzT+JBQKOp+EMgy2zvf9LwYoPxF/w3LUUHgqoPORQqzhJ0nZR4x
	kidbckTbRNgdeG5L/BZe3dX8zzNNhtCYJ1hsXzKRTpTA0SkzpHsLuBtOqqznIpOrYpnoq+4KcYugR
	sYEGxGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMam-0000000Es9A-0gp7;
	Sun, 04 Oct 2026 13:49:28 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMaf-0000000Es8j-1Xgg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 13:49:23 +0000
Received: by mail-pj2-x0c.google.com with SMTP id d9443c01a7336-2e58733c31fso95245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 06:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791121760; cv=none;
        d=google.com; s=arc-20260327;
        b=jnc+wbvnpbzQdQTyWXq9YAXl/PoX/ptMQDKG968sFiP3qp5aBSI+2KkbDql0PiWgYZ
         wU7WQhCpwrkeGMROupj3wsDf5YhrJ29jnV3bu981liD+Uv5Yr7qe83JqVhSvp0Cw3Nqs
         m3Rguc8X/Ip0r+Y+NDpjDcSVOx8nebz1Pk//pyrAkYoPNTOROSXtR2RhcHVC6RntzQF5
         OhSqbcbfAWOtAws7agQjE9C0pNCJ7eLKg2TvUdSd/4rh74GuBFQDqFXdfBIIBTpyAu3m
         bXaaXX+uNRNxso6cxxqjXNsPeUI+HcSGJ+mprGT/lbMfmwkYJfJPX5zu1kMsgJd2HP+a
         kFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=;
        fh=dX04rp6Ajgs4yjKyIlhsZiyu3gaiTn0BnejbLSYNRlo=;
        b=StmRI6LIXiVG65cf3cAp6auc5JeRSeN49eoZBpF3xU/0OekaelGHZBVVyO9Cqt2WZ9
         gxkYhDDrMbz9qs2DRb3iUgfLj44oR6rZd+ak1K0t+HN8kwypBuOvZ2pp6H+ofeqdmDIV
         OCTjqJnzyGrqXBW0zm5C6bN7w8LkRJh0KdpSMsF44v2f94AwCoOeP6XuEIpsdpMKTfcF
         u1O3pYYeuDlTu6/9KHL+8MQB9xX+yH0/sc/LA9t08wR76hBLPonjlwOhe8Xs1ql07sfo
         /sNICR5eMI63CNY90yXp+7M8nLM7jlLZgDtz8y2MBgOf3u8ocZhZLa24AXOQplP7TeaQ
         YecQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791121760; x=1791726560; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=;
        b=Q744Pl2Wm4JxRkODVqA65Gj16FFBUmUmjziFxhir1WFGSIdPos2WhvEce49MUTp1+p
         DUH7F1VCVqfTeJEEYds7UqnZ22Bfa7flIxUoWpv+L9mK/+CF+x77toAWtIeZ7xCVoXuf
         qUaXuUItw+uJwxxkE/qGB0pmIeecH337b0+bvLSVZg626X+1uqscH87ysUAqCrnP1ReT
         iZ7o4K46Q5vwgY/AMTmOTnIzcuJy0Prq2x4cEcckBrFe12cQv+mkxmeMp5Unq05ED4Il
         LRBZcyoYwjGObm4YjA5N6Xkkt2zbt/9HBd8Zl07PBrRWXmGHJMenLoaDyRu+ueHNVjpf
         Yw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791121760; x=1791726560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=;
        b=yb5Dr6aiEoExMjRco1yG2jPKFnjLDuEptnZDl0Q1NF/CUktp7JHDyyqsvJJhrvfV1k
         oKPysTYQ5RFUu33BGqvUNy7ceaT3hc7ZknyJiBVBXHTp2BbPqrkUaOb4w2qsq6W0g2L6
         yhZjWxz2ONLp3nX0B3ZzDzABo4Yip3zodNyGJ1VNKwXOnZnxxrjmUIOCAoY6ULMCWhLR
         schazQyMVT36IT6Mt99WfKAfYoPmkcZiXusP2440SCv4MGCvwNJlpoWXuE8GzWPrfLy5
         UbGUh51v9TWwn4rPY3KkrW/zYQN3lsjxJ+/Oum8xbMiEl8YQbBSv7Sj4tjHhFoCsGtCc
         bULw==
X-Forwarded-Encrypted: i=1; AKwUvBx/+ymkEYZJ3LnyaGS2QgPg2UWD6d4e+tHZwenpOEA+3iUpkerefts9Rgvqu4KGKLdoptXoiLEuyh2h9jtBfX87@lists.infradead.org
X-Gm-Message-State: AFq9FYL3hJUwsCGt0kw2lMS0RnNFuB1IdVPfyWV27y3su0yy73hXoIuy
	1T/pnW5UqwKsmyHxXfsBzdzDVkLL/G7MQUzIELXEdCIf9lOheDcCMC0yPzKAk7EeasZYu7McKAt
	No/Lbp5FpW11tRnXddIeopC4AgO8XFqN17AY5
X-Gm-Gg: AYBFou3z5Lay96teyY3LQP1awUGYNAQRgC0ajvHq93QfPMDV0ViKendrodYOdfX6riO
	WRjX7F1FdRjnReVGSf3a05u3CfLDeHw8ZMcYToop/xoR9jeuTSWU3dpMc9VWUTWFTE4L+dMJeo2
	A2pc2bFa4x7YXRGLURnfF3pSRoKzS5nGDRB+Y8P6ZAdk3emFKXJkDk7pj7IC1xTqUiGYalGfL5R
	Hx3cQAK8FAofaAJe4ic7j0dOaYK2q3QUJj/ZIrYjOglke1+duU6e5bwinGgQVmvyKbFBuLdHZBE
	Z0RsAgiXI6r0qVfVHZiMBPfcNqQhB7xu9YS0PdcVQGeSBC3opUXZ0jovgxe+7YrJg09fD7UzT5m
	5HUiI+hNtfFFt+Csbw+bMGk/Xp9ApwpCjAoZsA6q5zOpXeqIBc6PEf95LxUpFhkXPVPPCdU1zsf
	rrj6Y66/3iggAMtD1nRQNyjqyRhQ==
X-Received: by 2002:a17:902:cf0a:b0:2dd:ad74:6d22 with SMTP id
 d9443c01a7336-2e49b654fe9mr80221975ad.31.1791121760020; Sun, 04 Oct 2026
 06:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
 <asCyI2_CNSoDJy1w@willie-the-truck> <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
 <asISGdljsG86gUwb@willie-the-truck>
In-Reply-To: <asISGdljsG86gUwb@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 4 Oct 2026 20:49:07 +0700
X-Gm-Features: AclHuK-zrgBelXuI-I6swFhIOsgOnzrRzpoelrWImLhb29cQsM2UcUlf5WCmPxw
Message-ID: <CAABR9nFMR+D0j5kYR+HwLBOHG4WF7PUDrqjE4Bt0-VTUacxmBg@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_064921_407966_24729ADF 
X-CRM114-Status: GOOD (  12.01  )
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

Hi Will,

>
> Sorry, but how is failing the probe possibly better than continuing without
> the optional interrupt? Add a diagnostic if you like, but aborting the probe
> feels completely unnecessary to me.
>

My understanding is that the driver is designed to be generic and
support various hardware configurations, some with this resource (IRQ,
GPIO, clock, ...) and some without.

If a configuration describes the resource, it means the board is
designed to use it. For that hardware the "optional" nature of the
driver no longer applies, so if we fail to get the resource the error
should be returned.

A log alone is easy to miss, and the root cause still has to be found
and fixed later anyway. Failing the probe makes the problem visible
right away, when the board is being brought up.

Best regards,
Phuc

