Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96509FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aQ2HY3ym/1MPGFPjep0gj0W84Gq0f3CZ/BSTdc5PC4=; b=c+6mkBCiape+TA38A2HqGuwhdS
	P0ylBI+PitBj6qfa5Z4lxxigSlwwnnGN2qqRBp+EtC99Z5KA7XhNJY1xhm36ScIVHR2fO1WixJO5A
	j87ZP31ei1Sm9E5osmSqrdqyu1Mw0vRsGk/w9wpNfeQDiDasEgU7pWGA8GplKuSH2RKrsEpW4JAKd
	2Tt48xw0TW5QMX7LEFve23+LMwoK8JayfwNXCksBogW3ZkzJY2umhNC8boyHaJAkYSlH93yT/9WrP
	5aEgHLWC1R20FnGhxvQ+6/2On45azyCFMNdCmJdWi9lQy4MVDMqoVQDGMTL5TwdNHYzi8VtaPpKrC
	cdGtKryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7eY-00000003uMb-0S1f;
	Wed, 29 Apr 2026 16:20:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7eV-00000003uMC-2W94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 16:20:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b243198058so106155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777479642; cv=none;
        d=google.com; s=arc-20240605;
        b=khiCbuA2PBRbZMREwH9cQH6/OZA8nPQakElO5iky7We5aj4XrdrZFiNuHHXEjJkgei
         sfOJbYbx81O0yIBPTy19UnMdWjFYVtFsKlTcKcoc2Fxsy2MMC8c+YDM9LuH0V5DqH84b
         JzxDGdiBfGPQvYbH4W2T0HFOVDrObdVahRSy6xo3uTyBUV3rGZ+ShwAW+Ay7sx2NKzFr
         yeBI51Xe7fwf01I0NqNRdh2glr/N1nqD3Zx1ki+hhvz7jSmGPVV/HkkCsKyGFL5q3cNS
         lCESUtsiNsKxDf5wdj7PchmAj1C0oqK36sX2RAlX7cFyHL6/f1UdBDSCEYoN0x1xBxgW
         p61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9aQ2HY3ym/1MPGFPjep0gj0W84Gq0f3CZ/BSTdc5PC4=;
        fh=Wu1EDOmutY9+uo+6NcOmgQ6f+9l6xtMnQhL0LROSLCk=;
        b=K7e6Dddmt2Dwe2jCom2GflqseiqtGdE/WFj5PQuLFUBbVzfuNbApY84H9TeGrddCvV
         3KRspxbuQzapJWp8b0Bj69AmcvpvH2ZQ3V+G4GD8zAB0KPybBYn6Wob+V+2ZasoNtYSU
         uQAQNweHqHyJo8OnHiF/L1DnYvhLz8ll/WxkK4yWEkxIieS19uv3w2KI3Bo3yH2OdIp0
         1bu0TUgF4b1msmUxyBVjYBJyVmFvWEqdpPxhnZz6TInQz17okoIwUM+94NQPyHVHQXjU
         tLKPuLxCWp70Bv6ZRNJMNEggC3HMFpSRLrI2R6ilSlzTjigTrYjq7UdyR8I64kFPylNc
         Iv5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777479642; x=1778084442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aQ2HY3ym/1MPGFPjep0gj0W84Gq0f3CZ/BSTdc5PC4=;
        b=j93bqX5GbHxqlBKXaSQAMNu5ff6NDdw68ivkhBo4qjs4hrJphxG4+xsTzYkaWf6Zvl
         nfAUgb9OAuJ7DeaRWZtheijaho0eEzB0sUTwny+neCJ+hxMWg+s9mAhQAIgnZ4zFNkwI
         NYKZKZR1R07lFT1wXUhkd+mQcsnu2EmlwV6sYjtm1NX4kk60K+3sksyyMI3YD+I8N8VK
         SXiQvZqRv1+T3gSJKzgipya6P2Q5fGzvOcx4MhkJEz5YOXLfH6Is4cq40P+9eNdr1SJT
         VmCT4B8oDLAXduAdhX69b2YMxDXwrQ/jp4LIiW2ADDMD2g/XYwADXV4bpCbjNi6OlSso
         GVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479642; x=1778084442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9aQ2HY3ym/1MPGFPjep0gj0W84Gq0f3CZ/BSTdc5PC4=;
        b=TsfQpC7HzjToLVhBwQotdx64hH+q49oaLVZnoywi6UA/jO6lz77M0ev5k4eZaoPgAh
         VCPCrLRkMkOCYSxhEFTeuV7NHofFYh0EjKeN9nNcQ76cNA5NHNZoF7wmHmtmGwrdVZ6W
         GeXPXrONC7WnUNxk7r40CKUEkquW6Rp4fsFa6IQrfMKqhpP/P43wGsDER6Ny8pwmlf7x
         KziXyLgUyZgakkTREQyfS3orvLj77oVM68lBbZajjTuGml2SP37PzXHT9gt6Jy4DCV5m
         sDgmCLZwhG6lRYxdywFE9LaQ1PkAAD1OF2UijGo956WLjhXooFXXd7RyZecPtkaneeHm
         CeJg==
X-Forwarded-Encrypted: i=1; AFNElJ/8GVRrvCvr7vLg7N7Mmm0SnWQcRLoyB4v5vX/LDqoLbtsZjpZSwKxyNeBGzXodLLhf8nVjrxcks3XUzpd+Z5Gk@lists.infradead.org
X-Gm-Message-State: AOJu0YzPoX5vZ5H0RoMuNDm2TsCpltgNcZXj/RNgam593+HvemQ+am2o
	Gi/+7xwSsafKQoHMr/CrchBhl+0vAIYodq5D3diJss61tQMbc/8YJCr2hHq4d7vs+0BJ0hbr3ty
	9EKpORiraR+GySeLO1/v6z6jQGaLaT+dj8EaAZyah
X-Gm-Gg: AeBDieshuj7mihvaziIg08kN0HwZ4tFkyc9VyEGlGsFkP12pGJiCM4sPKgqdie+xeKF
	r12jP56voYSvLopA8xokFPAYot5SIc2QztnFMWJX/cMLHmxqYBIU8sCJZo35aFVKfNvQQVM5RlE
	6wV1bC9ECYInumbxT54tODEYgv7QSPQxqLGNlj7xznEStWTsp+9tyuKE0t01Ln0hygq309mvUz9
	JmjvTlkD9T5pyDSFMgQ7IforrpqWeuMtKfX7XCy7bLRRQmzJBXKfyxf372gTsETnYnapDILchXL
	Q3BVpbWAVO+2u0Hph4Lyi1dphmJcX8NdbkDZXn7KgVS1CplDgkSXBTsylzE=
X-Received: by 2002:a17:903:1ab0:b0:294:ecba:c8e with SMTP id
 d9443c01a7336-2b988bb154fmr4565995ad.3.1777479641919; Wed, 29 Apr 2026
 09:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
 <20260428071903.1886173-11-irogers@google.com> <afG0WoBnoxC8VJNx@z2>
In-Reply-To: <afG0WoBnoxC8VJNx@z2>
From: Ian Rogers <irogers@google.com>
Date: Wed, 29 Apr 2026 09:20:30 -0700
X-Gm-Features: AVHnY4K_MpCLxPNE4F3zPBfyInZmI9YnYHCk3xieug18H5aS76QsDZrAHMiQaQQ
Message-ID: <CAP-5=fXVvg3=aDDeAHwaH=qVX9zCCi8+PzmvUCS9K75meb0fXw@mail.gmail.com>
Subject: Re: [PATCH v8 10/58] perf evsel: Add reference count
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_092043_644039_8F7B4184 
X-CRM114-Status: GOOD (  20.65  )
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

On Wed, Apr 29, 2026 at 12:33=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Tue, Apr 28, 2026 at 12:18:15AM -0700, Ian Rogers wrote:
> > As with evlist this a no-op for most of the perf tool. The reference
> > count is set to 1 at allocation, the put will see the 1, decrement it
> > and perform the delete. The purpose for adding the reference count is
> > for the python code. Prior to this change the python code would clone
> > evsels, but this has issues if events are opened, etc. leading to
> > assertion failures. With a reference count the same evsel can be used
> > and the reference count incremented for the python usage.  To not
> > change the python evsel API getset functions are added for the evsel
> > members, no set function is provided for size as it doesn't make sense
> > to alter this.
>
> Can we make the reference counting model simpler by just using evlist's
> refcount?  Assuming python code generates no evsel from the shared
> evlist, can we just think evsels belong to an evlist and manage their
> lifetime together?
>
> Maybe I talked it to you already.. but I forgot the details. :-p

I agree that would make the lifetime management easier, but we already
exposed evsels as Python objects and the existing cloning approach
makes the code base more complex and divergent.

Thanks,
Ian

> Thanks,
> Namhyung

