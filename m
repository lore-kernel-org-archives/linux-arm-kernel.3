Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F47C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bO3noIAnLIpAAfMnWMpk9qr4QfTQwAh4WLgGAFGPng=; b=hzRF/94tODnB/NIxux3FhWzzoV
	4pn4NtIbzZIpu098gEy/bp5oR38oRYJT7cQMltsQc4zqFmOJArirdwApE83MAlW3i2eqmJ718BRb0
	eoqvCOx6qcwyamLsaU0W2wUgCxTs1g5ydVT/NiO6/nviMTDh56C07IHi5X7kSb14S69mih0LniBFW
	uYdgDirfk3PYpv3NVj30itwrhaiflEkqLS4+Vg6fovA73DFZUeec6bBxSyI2XqbMvCkdxVrlizBnk
	hjkLy0aTQ3n/6DyvfRPjg+0fhb0BjRkPkw4tASGNnKwczC1pWw4QWUJSmbMf37ZD4x/vtdI/S/XQb
	uf4Ey2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyvn-0000000Aois-0aQd;
	Fri, 28 Feb 2025 11:53:27 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyDN-0000000AhIc-3Ya0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:07:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e4dc3d22b8so1196429a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 03:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740740852; x=1741345652; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7bO3noIAnLIpAAfMnWMpk9qr4QfTQwAh4WLgGAFGPng=;
        b=xpqSA7JAVHAndL3lgVXGMWAhRIPiF3YICvCT6NYnB5oKpfyHzCdZ8LmUyVbeN30z+y
         mNZSdNsmQKwUDRlM5z1Q8Lp9gbZiLEhRwY1698ule+BEwU4HXReCMTkns3cJBdbGFAHl
         gTOvDOUiquuKrLqK10Gsc2BFnrHhogZkur1t3Vt8qERoceM3KZs0NeLJTUsnifcETzRV
         C90r2oay5ZvDVcBBBHCxwuhypUh0sS46fB0sFHM2PhFIu3OnIt8YaT617sNUhw1W0jbG
         FfMonuusABHhx9YkFMgmizmIYGG4xgvYIjXj7znJ3b5gsXolE9eq3AEDYI2DZVNMjkgk
         +15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740740852; x=1741345652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bO3noIAnLIpAAfMnWMpk9qr4QfTQwAh4WLgGAFGPng=;
        b=LqgyiSFp0bdForjo8mYGQxOFipjwZYQK3OT9VylzDrcgniY1Ah8agkGgZBxqrZXgz1
         0ubWp7Uwif4goXHR6H5Zqea4OC6lcd1eAUVBawGaWJwN++9tfQcQSGEqJh1QEywT0Yl9
         Y9aktAF+Pitkw/759MS9CGhhKQ/05PGRO/36AWzZyBY4u6Gpt0uztJXUtgAWNpE5Czfh
         1LPJB7MdydtOJgoGxkkuh2Yr9qdvInZeHAzpwGQNpGTDY+J6vROtZ8CnGwC7UvxfppVK
         0DfT4cbaxom+yrhjGFpR2IZqb8cBBRtYWmgUqhJDppaQ9DHiIbAFz/F56UAQyXrJhtxO
         2nIw==
X-Forwarded-Encrypted: i=1; AJvYcCWNB3MDnFzlal6l6ffAM6mK0M1rdhb0CMoyCivfRsj7NFMVg98kKfJB0e4FMFGqdXbZfIYajmJfk77/CarX4ZdO@lists.infradead.org
X-Gm-Message-State: AOJu0YwbzTeqszZj+dcCbKJ7XzjDRQeMzwSvP/Hw6qG0rSla8f22Rquk
	pcLvapqgCKoO1fMiR8dNbpTWNVoHjyoW6/0wSY3IsQb1Al/6uo8tFBUv0sCj3tC4oq17V763fSi
	3xrPCkyZrgitZzRHiVyQxor74ipXkPiNB5msuJw==
X-Gm-Gg: ASbGncvI25OxVISBwYN8HJgBGURAz1lcxIkPItCdiGxswED5ODW9x+GNAZSP8u4cmSM
	1gAMrRQ5J2AxFnavGvsgnjOfZgJPMwO1UmqtKXQ63CuFxmhJJbQkUF7ZPApei29R7QhzLOq9nwA
	Gu5ke3504=
X-Google-Smtp-Source: AGHT+IE6y2PosJlmoE9B8+t4z8hZJxD//ouD+A0OiMkPbIArGuvY/3GdQ7UTMlpkbH6gYdu01DmaN4T7Kr+6onvynrE=
X-Received: by 2002:a17:907:7212:b0:ab2:f6e5:3f1 with SMTP id
 a640c23a62f3a-abf26430310mr261440866b.8.1740740852178; Fri, 28 Feb 2025
 03:07:32 -0800 (PST)
MIME-Version: 1.0
References: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
 <Z4osWNCUfufciZNG@bogus> <20250228082745.rc2u5jiqnq7h737l@vireshk-i7> <Z8GAEDVIUiooPjf_@bogus>
In-Reply-To: <Z8GAEDVIUiooPjf_@bogus>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 28 Feb 2025 16:37:24 +0530
X-Gm-Features: AQ5f1JqpS5GfXKpRF9qd5JBXFvyQxz0hzQ3S-RWDwvb2fNYPEu0YQipblPVbjoY
Message-ID: <CAKohpomoY8uhqDMeUAa594Eh8Oh53hTSsjkAcJU7Z70asvzcSA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_ffa: Set dma_mask for ffa devices
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Bill Mills <bill.mills@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_030733_889586_2C9C7519 
X-CRM114-Status: GOOD (  10.67  )
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

On Fri, 28 Feb 2025 at 14:51, Sudeep Holla <sudeep.holla@arm.com> wrote:
> Sorry I forgot to respond. I kept this out for now as we need to resolve
> the DT bindings.
>
> If you think it can be used/needed irrespective of how we resolve that
> issue ? If so, I can queue this.

Yes, this has nothing to do with the DT bindings and reserved-mem thing.

We can anyways map memory on need basis at runtime and this is required
for that to work. The reserved-mem thing only allows us to map everything in
advance.

--
Viresh

