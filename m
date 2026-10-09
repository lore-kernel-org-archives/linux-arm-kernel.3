Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA62CCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbGK0Sz7kyHCLqIYUeDRcT+I53yH0bFA2b5RQEVnd20=; b=KyfMnd2CFIknD3fK1hkMEAOI3O
	LrH5BhpWj+j9V6RGbLvXQ3cVeC96VXpFrInJcAViojpCkLrigoUtbKsvdHcrtGjx8pvzvVCiPf32W
	Fjc73T9HMQxvp6irpb2k0VuzT7gztosMSbY6pzMjCE5Zq353pi6Niak/v62Ej1BjxQ52Dvm9OyVRL
	/3JPeDQkdBT3z98TWp3OxMnGJNAKC2jgEwdCUln8g/lWN9NrdHy9BW2Bj59JEnmMhZBykBTCALRg8
	p5YNsjInYSbsWk1126kf3xK3SR7bqB1agdP0EtOC5MLvJEUF+NO88lkZ2UyXzXwuGNipviXN+GFId
	SE7YyFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDG5-00000006dYj-0lYb;
	Fri, 09 Oct 2026 16:15:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDG3-00000006dYZ-1p4Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:15:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C726A42A64
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 16:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F691F00893
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 16:15:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mJRBv9s3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1791562540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbGK0Sz7kyHCLqIYUeDRcT+I53yH0bFA2b5RQEVnd20=;
	b=mJRBv9s3wnaDUPUjbCa0GHWuvfv7vWsQ9RyQ6IaDLpiHSs+ZJnNK3UxwoiGCX8q8yzthII
	tCPcGFAGwx0CPGP+qYP+h/6vogFLHV9t+ne/xTfNryspur5+iVSRcFf6MmHIPViKnYqptV
	unEgvEAMbNdpsFodKuC7r5RpmNY7Jrk=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id c65fa5fe (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-arm-kernel@lists.infradead.org>;
	Fri, 9 Oct 2026 16:15:39 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae185cc40fso3605059a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/KX8GE+ZgRZoZubFMb5vOvbnIexy+s0syBr030K1egDuzaSjrK/mVe8ZfDu1YTKH9Xmn3I8HBi04yMGEHPPqA@lists.infradead.org
X-Gm-Message-State: AFq9FYLoluvo6Di1AtyiyOrKSfb2yVOAgfNRzFbvC5g0xyMPosyBujHr
	IejGhzNo7r21TtYPYojLLxrMcEDEgt8DHYwJEn4CcEaQ3E0oAMzBLbdE2JjEYH1K9C0f7+CiqQL
	SJVz7PNZIDD9/QplWr2jWgREjSNaXtSQ=
X-Received: by 2002:a17:907:7f86:b0:c2d:cdc6:8271 with SMTP id
 a640c23a62f3a-c31a702da86mr320375966b.13.1791562538187; Fri, 09 Oct 2026
 09:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20261009125354.315476-1-ebiggers@kernel.org> <20261009125354.315476-2-ebiggers@kernel.org>
 <20261009161328.GE321175@quark>
In-Reply-To: <20261009161328.GE321175@quark>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Oct 2026 18:15:26 +0200
X-Gmail-Original-Message-ID: <CAHmME9rGhu0-0EhhHq3vKgw5PNa9umB4iTnUJw1am-=9zEYn4Q@mail.gmail.com>
X-Gm-Features: AclHuK9owDu-KUZU6Q-fxO8D1wjx4SnJTfIFvrUjEFDQlu1-zO_TXwzWlmcjBxg
Message-ID: <CAHmME9rGhu0-0EhhHq3vKgw5PNa9umB4iTnUJw1am-=9zEYn4Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] lib/crypto: arm64: Fix lost Poly1305 carry when
 resuming NEON state
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

This is a nice catch. Thanks for this, Jeremy.

    Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

