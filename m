Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1060FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPmmV6mrjHp+lAp5KhBgmJc4ilN/3JaEJWAOyFrLPSw=; b=LwtX9aa8x4bC6+zjpRTHMyHiAR
	lAjs7xVbN3y1Qk9y5SQ/33XPJ3DO+DxX7KNSou3zGBZIqP1zmRT0ZfSpQIEdp6N2HyPyWeFUOuJE2
	0eSkf149kQOCo9S4CvLUiYrlY806CatIxtkUZL3QWYc/Be1GVQao4WwGd5VovCy9BflBsJHpvdVka
	1kOUC8AZT1+XGRA37m6V1qbELBCd1Ey4/6ocRtweGQyn3tEplablBzQbHAs6LUpNjm3m6xR9aP/SW
	+qJCKBmnGxfw0cw6MKsoDU3/KkxCTfUffqullZqhGZ2OM4H7imaAMEpB9wt/1P4jE7y72ZcNalMBq
	SHKusjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPD7-0000000GfOP-0j1C;
	Mon, 10 Feb 2025 08:32:09 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPBN-0000000Gev1-0MaP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 08:30:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so8954704a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 00:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739176219; x=1739781019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPmmV6mrjHp+lAp5KhBgmJc4ilN/3JaEJWAOyFrLPSw=;
        b=mhgGf6btRD40dp7KZ1+zNWp7qEtTRRH+RxiSyG5gaEih8GLMM4RA/wNlhkbZPhh2ks
         d378sDN1z0TllQ5mrWAU+gr6mjW0l8UC9IA7xA6HctbwKlKrBWmBvxnsSm8P7S1mR9GV
         obA+3BtW0QokY2HPauwASCp5HRzJ+26DUW72yNgqocg9Vy/mfYuszT0BUBfpzGt9Z65G
         w3EQcePwFL4kKpANBU98v3j7GyjfHH1vVDO7dMUDZ+L+6hQku+6Kh7F7mqfdbFIxTXkN
         FWtG/DFQz1QZZrO24y9czwHIpd7LfIXtm5vyDqyCRtewPvn8/OF/kUL8wa6dvJO0jcrl
         +ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176219; x=1739781019;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PPmmV6mrjHp+lAp5KhBgmJc4ilN/3JaEJWAOyFrLPSw=;
        b=cY2JLtzI4TMyZBtHz+sLdYGfNtJJl91dkRfEfNuX6tsMJdYiF8qXR9f8X8AFJq471j
         Woj9uLEKi4dadaIxjSJXLENUNnw8m5yPUxQzLkLzFy7Im3+vYlAbiLR2nzcCb48haJox
         af/r31volqJOulFCrZaULLrS1tw4d2verpRGZRPeIGs55tXtO/Pb6W1xcBWj777Fayra
         4K5+f7DR70rJnR/OaPuq6GN1TK89kSn/dDZuqwGKKDPdk1CrZ6VP2tGZBWXwSJAae16N
         bHQi16naUU1rQtN5vhXlrBj/efUvyYbAGGurwYOJeuCCFerRfjojje3MQkny6ZEsd+NL
         5RoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwzKjtQ5UeyL5+D99aFSHsnUBpV98xoVQMCeQyJw0BKAQR6g60GicF5kibU8jLAWeLytd49bYVX3PISeQhTrX0@lists.infradead.org
X-Gm-Message-State: AOJu0YwWO1pSXMUEz01lhLmb5gNRANCQhvcDSy0Gtu9Msbgvc2CHUUC+
	eGYRGrNoQ0+iw71VP2znLd7ZtBipb9I+Rxa5s0i1pZwUnLwiuzS+2h2OHIAn3nD5faKadCvMOQ=
	=
X-Google-Smtp-Source: AGHT+IEXo1lV682Dvui+xqTqQ9vsTUnOVO23WNyemCNciJ06wQPtgH2MGkCCmvZ/liuvldm8njt7IMjgAA==
X-Received: from pfbbi7.prod.google.com ([2002:a05:6a00:3107:b0:730:9499:1f46])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:850:b0:730:949d:2d3f
 with SMTP id d2e1a72fcca58-730949d3086mr2135669b3a.7.1739176219304; Mon, 10
 Feb 2025 00:30:19 -0800 (PST)
Date: Mon, 10 Feb 2025 08:30:15 +0000
In-Reply-To: <mb61pikpm3q76.fsf@kernel.org>
Mime-Version: 1.0
References: <mb61pikpm3q76.fsf@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250210083017.280937-1-wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: puranjay@kernel.org
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_003021_130856_A8CD13EA 
X-CRM114-Status: GOOD (  18.92  )
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

On Fri, Feb 7, 2025 at 4:16=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org>=
 wrote:
>
> Yes, I think we should, but others people could add more to this.
>=20
> I have been testing this series with Kpatch and created a PR that works
> with this unwinder: https://github.com/dynup/kpatch/pull/1439
>=20
> For the modules, I think we need per module sframe tables that are
> initialised when the module is loaded. And the unwinder should use the
> module specific table if the IP is in a module's code.
>=20
> Have you already started working on it? if not I would like to help and
> work on that.
>=20
> Thanks,
> Puranjay

Thanks for updating the arm64 kpatch PR so quickly.
So we can use kpatch to test this proposal.

I already have a WIP patch to add sframe support to the kernel module.
However, it is not yet working. I had trouble unwinding frames for the=20
kernel module using the current algorithm.

Indu has likely identified the issue and will be addressing it from the
toolchain side.

https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666

