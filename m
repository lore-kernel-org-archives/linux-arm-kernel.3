Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FA5CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 02:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kvg8fvdZercb/1tUH1fx/ZCsiW65Avvhaf/buqFYuWo=; b=28Dx6OCf5kKjfeCdTwYk/MDpjo
	TavaGLQu18YrcSLHYMRSSe+CCu+Vu4MbdJx6K9GN7Mf9s+/eOZIxUNan5z3R/po1/dggFa7M4ZKt/
	la6W5SjTjtgzNuizjetkNBz6/ubUhgtne1CUsD9sOZdE9V4N33VvFnq26av/ffgG3yideJoKZ5Nix
	9qyVAIf0d76AKlJxH2UdPUKthYupwWLYYoDtfvcrLvKhc9TsNFAEVbEYHLCO9Vc+kRD61z1UelPjK
	JoZmyOdcN1vDGvdGknoWSFH1DMu49aaj11PeyuWv2W8s3vsW5hDBtMG41jHtQHye7iODHl57Ottm4
	sj2H81EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1Wx-0000000CRHn-1Bg6;
	Wed, 13 Aug 2025 02:47:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UN-0000000CQfr-2JuR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 02:45:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-458ba079338so2428395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 19:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755053118; x=1755657918; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kvg8fvdZercb/1tUH1fx/ZCsiW65Avvhaf/buqFYuWo=;
        b=BOVlNnC590VWCBax0FoSTpVRfjdAeDnavTOzwRslyr0txlGIrXi+8XqCwfR889ioVu
         3dm6j7g9sCUC/EIRFcwKfTe9V0bN5mIF+kmAhmfrNNnBRPmcdznp3kRU071Wmx/qBQIC
         4tGqMHgG3Ai51VUoZ6CqYSXshcnO62Ahzduz5OnJkc913+RzQh5nKPw3hHq08RXz4iT9
         uvximD2XRRWYY8CFWMeZzMdMpMSRuYMyvh5t4L7OpZJhF97LAheeswQwsiKNfW/ilO0h
         q10AIcoa9541HSKuLdCGv83AWBAy3fK3xKqlu7e6f1aTbMupr8xzr9YSE85vLR7Y81qK
         S7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053118; x=1755657918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kvg8fvdZercb/1tUH1fx/ZCsiW65Avvhaf/buqFYuWo=;
        b=idS4h8q4Z21BWDhoOeQ69m0IdXDfsPteklM7kQWmK4ukWIPCSsTBkbjnSASI9lsG4s
         bHumX25n19JD4xv/5qtrKLzdGnKq2aqkw6MqdGE4rer3gdaYFqXWOQHbz4+9ZnbqGM/w
         e61hP+nkLDlpr8J9Nx42VhmG4gcFPKyPYn23Ob7HKdVazm83p/CZk7y9ULrTpKuUud2w
         xZK3rb2nimpdnRTeg2DEzHcU/1pST5+bCROtjgvVUwfofIGZpQotWR5Ibz6o5zmRW/Aw
         DXyfIM5og7I8Zn+YXfZ2CVGG0MxGaZ3zhnJ942FXrSTMqLAC+Ib7rJWeIUqwwJE8RfOq
         6hoA==
X-Forwarded-Encrypted: i=1; AJvYcCWBdpfCFYMpi+zFHJnv8idPl1bM3aOyaJVd7KuaK20zgVSoyphokKLXO0MkJvgj2nm22dNX8tC5cUD9pxLUuu4N@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzlk1F9jjIo51OaoBC7yj70SimMhw75FZEeOPeDSuVVE/LgSut
	YRC/KRs2yLgkN3iZ546Dwotv4fF3CwJAkSImDK5JeFdQ7dbu9+5zsFyILmj0YB+jLLXJ95PfKHu
	ZNtZrzdPHIsya5WZr7XSS1EDhlEFBTE4=
X-Gm-Gg: ASbGnctPtULDd2nqonEws7UAH9w8EYiTIUBM8BT3uICs3enm34acEBRKHVBtkkv8yr3
	t7aDJyfyvxCJ5aUtLMeaNN96YYN78Mbi11nAcN+ZlM8XNyWjKvlQGOue5qZFg4vNWiUqhVpNNx3
	RozOWUxv2TB89fqZLZKoV2fwIJtS5nu0sxUhIS94ZvxCAHG58cQgPv31t2FiLzyur7Gyl6i0+Aa
	qpv3U0=
X-Google-Smtp-Source: AGHT+IER/xoh2r0fiZY/zHhrvqqJNO6/Cga2A0F4VDogmsdOv+We2VyU1IsS8IDXJ7I5efqv8sxiKAzD1n7IC1pvaew=
X-Received: by 2002:a05:600c:4e8d:b0:459:443e:b18a with SMTP id
 5b1f17b1804b1-45a1704f681mr4589345e9.14.1755053117827; Tue, 12 Aug 2025
 19:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250811173626.1878783-1-yeoreum.yun@arm.com> <20250811173626.1878783-3-yeoreum.yun@arm.com>
 <CA+fCnZeSV4fDBQr-WPFA66OYxN8zOQ2g1RQMDW3Ok8FaE7=NXQ@mail.gmail.com>
 <aJtyR3hCW5fG+niV@e129823.arm.com> <CA+fCnZeznLqoLsUOgB1a1TNpR9PxjZKrrVBhotpMh0KVwvzj_Q@mail.gmail.com>
 <aJuxuKBm9qfpVkBC@e129823.arm.com>
In-Reply-To: <aJuxuKBm9qfpVkBC@e129823.arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 13 Aug 2025 04:45:06 +0200
X-Gm-Features: Ac12FXx6Pc1KJl2LaFe2eqFw1_0jb589tm6uNaUFSn8Yw7SbSnihGg_Kc_aD0sw
Message-ID: <CA+fCnZdWOh3=KkM4AL1ZYfhyMhdSqgW97Rz+uxO88mMkqT6WTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kasan: apply store-only mode in kasan kunit testcases
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, scott@os.amperecomputing.com, 
	jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org, 
	kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org, 
	oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org, 
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com, 
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_194519_609830_20ACC420 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, Aug 12, 2025 at 11:28=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> =
wrote:
>
> > > But in case of sync, when the MTE fault happens, it doesn't
> > > write to memory so, I think it's fine.
> >
> > Does it not? I thought MTE gets disabled and we return from the fault
> > handler and let the write instruction execute. But my memory on this
> > is foggy. And I don't have a setup right now to test.
>
> Right. when fault is hit the MTE gets disabled.
> But in kasan_test_c.c -- See the KUNIT_EXPECT_KASAN_FAIL,
> It re-enables for next test by calling kasan_enable_hw_tags().

But before that, does the faulting instruction get executed? After MTE
gets disabled in the fault handler.

