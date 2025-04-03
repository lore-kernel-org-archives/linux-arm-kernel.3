Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ADFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvD1Km7wGFLtWOqgEFNWRLw6eJ4esFFynlnh8JehOFY=; b=Hp+N6HBxZR545ClISxxpyTDQKQ
	3916jZSH9Yyxl0QLhD/+yojTPysO6Wf/xPg/UjJmRuA3iTjd/estlud6RIlTQe/JFUmMD/C9U5Kk0
	ynjGGy+eIVtIz7IJPt2O0JFVxlHkxvXBZngsAiXT8/gFqboBlN5b96acvqh33l0dvcTPRs2kW/Okv
	6i8Awkk5m8XJo0a6Fm1206brtLmCw1n9em4Zx167oMSn4RMs1Rym1oPtXSjjrN6ZO6sBFfV9AUBUg
	gE96Wd+Bwm9201KTIH3DmYuJGa+5jDg02DiR8LNo9nYoGopDuB1L29FXcPoJ9+HcqG+pAa8iHi/z3
	UTqgFtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Rw8-0000000A7xd-0MuF;
	Thu, 03 Apr 2025 21:17:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RuJ-0000000A7ZW-2Cay
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 21:15:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso6718955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 14:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743714925; x=1744319725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvD1Km7wGFLtWOqgEFNWRLw6eJ4esFFynlnh8JehOFY=;
        b=Lgan7tQCVLVCkwztFU8lwfenGo78/LW05p70J/CrFQV5NQ1VVuthbjhEjYyvnxKdST
         EKNA5TPplZBjBvGRKTUk09td/peZ1tTAm7St0QUlxdVeuilziBGRK1cuXfeQQwRKFmTu
         E0elOwt8umUhXLtujRPcCqp0Obhd2ushnW0ii3oIP2LevBvw0l27midRwJTj9YV1TyER
         PSsdUmcMGzvNfB79PKpvQ7l3qJC/Wc9oL0aAiYkg2bIEih0VnNk2oPxX4oqA2jT/ZjaC
         RyLBHMjI3U3h9SZLm1bO5IGW21fu+RrD9miBWlrRk4IDAZIQN74vj4Fgf/VRRjJcUJHn
         g6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743714925; x=1744319725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvD1Km7wGFLtWOqgEFNWRLw6eJ4esFFynlnh8JehOFY=;
        b=gHusJyTOcDknnV9XfJnsHUiAZ63r3aby5yDyt/rzj9HY97/nwcg9qdJBZo+aTs1X52
         8HzRyxLgeUbkgYdwH73516pD0De2BA6/Y0U4YDqd5OoVVFwDk7XuaOmhIMd99ZV+Im6p
         jWe8V5DsktTUG7tLKXOJ2X+yp0fDcHUmfzseHiFuEf1Tsy2+zErBQOA/5KcozSps6un2
         /2LBf/6k+cxptI2gmgQ1wn5FJEnDI4bZeF4v2Nms2ZNsAUWEtU+Nu+TLpLZDSfcrOjip
         tw8Sp99awEK73wmgofpRGDVq6RcpHw3pRV1BqWzY5TCrmXrWtX+He1n8UhsHkV+Hu5cD
         6QlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqjAyVRkX+gxU2rZOOdxxALQsIXZCRXHHOQ/uPuyIz9nr7qrCdgyLOoFg3Js9UTfaY35k51bF3VLZZ7qR9+5v4@lists.infradead.org
X-Gm-Message-State: AOJu0YxSRkeSW561CTP8mASR4uNRbEVwx8s3ubw3DqwvrL8aD5GT7MRN
	w2pipoZ02Y/eOMcEKn8cu/2HLKlC1yFKZXp+mSZivwjSChmYAPu5
X-Gm-Gg: ASbGncsapfl+FYx88mWSuoJUcgsl2zAl2+ZisgnYDezn4oGilcwOyI8j2th6HzH1G1d
	s+WrSEDyDflFQnzXC9TsrFJx+3n2cCL2c00QJY9763hfXQ7eDH9NUP6sMJPzZ/9M8ruqZFdMC/8
	j4vGesxQSKcUi9EyQoPQjlt5LBKF+kpSorfWYEAzW5sUwBu4FkspHkTxhF4SpFhoJl0FTkUsmCm
	oKblSbo971qAxtrUXGwzlQlPCaTBCFb+AGh5WXXnLyydlPK7moczRVyd6tCJUYIDtSO7JvwNV4q
	4Ff07xoXWjqnSghaoQNH1lTXkwWtI+AW0lrhdU+OEyK78uLD7dagOcasAQJoSMOSZFPkkDAALn7
	EuTrTn6s=
X-Google-Smtp-Source: AGHT+IGBaHYjceQBSmbH3010b6NTsG3JdQrqaS3chq0W1aRj/OYqtwyl5jYbNbbhjuezGo2AbkFbvg==
X-Received: by 2002:a05:600c:3494:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43ed0bc8d96mr2756455e9.9.1743714925141;
        Thu, 03 Apr 2025 14:15:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0a38sm31305665e9.34.2025.04.03.14.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:15:24 -0700 (PDT)
Date: Thu, 3 Apr 2025 22:15:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook
 <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, Andrey Konovalov
 <andreyknvl@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] string: Add load_unaligned_zeropad() code path
 to sized_strscpy()
Message-ID: <20250403221522.328b174b@pumpkin>
In-Reply-To: <CAMn1gO55tC78BpD+KuFgygg1Of57pr16O4BvKsUsrpo830-jEw@mail.gmail.com>
References: <20250329000338.1031289-1-pcc@google.com>
	<20250329000338.1031289-2-pcc@google.com>
	<Z-2ZwThH-7rkQW86@arm.com>
	<CAMn1gO55tC78BpD+KuFgygg1Of57pr16O4BvKsUsrpo830-jEw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_141527_562680_E6C8E145 
X-CRM114-Status: GOOD (  19.32  )
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

On Wed, 2 Apr 2025 17:08:51 -0700
Peter Collingbourne <pcc@google.com> wrote:

> On Wed, Apr 2, 2025 at 1:10=E2=80=AFPM Catalin Marinas <catalin.marinas@a=
rm.com> wrote:
..
> > Reading across tag granule (but not across page boundary) and causing a
> > tag check fault would result in padding but we can live with this and
> > only architectures that do MTE-style tag checking would get the new
> > behaviour. =20
>=20
> By "padding" do you mean the extra (up to sizeof(unsigned long)) nulls
> now written to the destination? It seems unlikely that code would
> deliberately depend on the nulls not being written, the number of
> nulls written is not part of the documented interface contract and
> will vary right now depending on how close the source string is to a
> page boundary. If code is accidentally depending on nulls not being
> written, that's almost certainly a bug anyway (because of the page
> boundary thing) and we should fix it if discovered by this change.

There was an issue with one of the copy routines writing beyond
the expected point in a destination buffer.
I can't remember the full details, but it would match strscpy().

	David

