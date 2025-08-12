Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C315DCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFgqOdxV1F9ejz004iGryJ3qWW5B6GXnUjljpVgqkLk=; b=UllhIQXAn/sl2yV+NzXdNNr4xl
	uc6XdG27n23AdbsEScNCXDzGTdjIqNPR68F8+LyqDGgJrks0ZpGufH3z+0LfnOXXnaYdGiU9KEy+r
	Hj53nKQ17LVP6an63YU/ZTSSADpP1o1bnTM1yCLPOSQzAh2vDXBLwXdsCwTT2TtGzOLxU6V9Orbqy
	wP8biINLN4fCV6SZsaxfAVxDUM6dqBsemck2rhPwBRENIvxgbrDbDusz0seKw2+/nouDcS2DlW55+
	++79yC7WghQ649nVeX4XjLWx/Dcq9JanptCpmIZQhMAcFIeJ/Zet+q+FheJcwFXnZvmGoN713F0t/
	Mb1W7v6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgU-0000000Bws2-2lrV;
	Tue, 12 Aug 2025 20:33:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultGt-0000000Bf40-0fOh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 17:58:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so53119065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755021530; x=1755626330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFgqOdxV1F9ejz004iGryJ3qWW5B6GXnUjljpVgqkLk=;
        b=kYVFRVrp0c/ZpZtglG5+NGpXxQA0Dd/ezq6Fvsa1lCsoLFAcr4LBbVy/ja6xIyESC2
         JyNtXtfVLP9/7yLynrEjYb+Mu3b8Yg0g/iXWaxtTe4M9IDZLypxXOwz16REtXHmGfH4B
         V5rctSLGCQqn1OOF9ppt4LTCkLjWReWivDU9jvb+2bndBY4QtFRWD6LmfzAcet6KJ6y1
         LdzGDTsNhoMmBmk0cCsmKvlBP/bG/aW+wL7SQHOcMaftXCcv2rH/ekhCETz4I5+BBOBJ
         N5t1JsmX+w/+kv9kONGCj1EM+qBgQxJmyD0jS7KPe6xu2+NN0hTk53RFsg6JBC1bTcwk
         MCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755021530; x=1755626330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFgqOdxV1F9ejz004iGryJ3qWW5B6GXnUjljpVgqkLk=;
        b=crMBcac4cAcy3ylj5RyhyAybLKhRdXJgZhG5Zpd78PTn0AynYjrLLeEdHohGXcAuyP
         J+baHaLG1xwewXv7QntwnqhivLgZoeqS/yxL3j5iczcM3E9NyLIS/KjiGnBT5QzavR36
         f+Z/Lyhf+4Ognd61m6YjVC/qETs3zmbsNQlG3/jTDEr9zA1+59MTp4HUhvAD7lhlqaG4
         6JEdUM8wn0q6E5qfkGGiNRgm9/qRf4Vgh3pHc3X5ivdaFsarewqGnwEP0hbXjczkoJQm
         OHwkRuxm4ryyIN0Z1UWLtpg4qbl58uX2qFTYa/l4Ymbwc7lqxMCBzHIwt5xT8RMrcWDt
         3uCw==
X-Forwarded-Encrypted: i=1; AJvYcCWuk0BJY3rHUi09Do3oheOwblXCY3/N5a0wUOjt1gC8AA+IXOCkWQsCKaHpIi3pXel1B4MZrLUGGUK1gRWf+DQm@lists.infradead.org
X-Gm-Message-State: AOJu0YyUd8jQnIHFn3BnfUeQsTP7QVT2RzOFUC5IHAZetCXGXNbfsq2x
	cLDUxE8nw+KYr6xBDwStlKe9mMbzI+IHV+VHnbRVXGWu6VyKQ3dqgyr7XoI51J6GZGzgpxPeFun
	3XFXbAb+ouVEIBaNkru28HUMeqnWMC3k=
X-Gm-Gg: ASbGncusu5IbTja1DMULQWwXpjNhmUc8FcihiAyJ5kqLvzErnqWJJmsZECCqZimhiiT
	WG7vpRPMPKLQpA3hJOVuCjfyqjOZ1gr01TOY/mt6E3voDSpKTPNQpxblTKA+nS/IN/V9F3amzCs
	Y2w6lsx5WMZ8Tq8Suzk5V8QJBnN2ui0VIQekvjf/CC//qEMNnwwp3BMwA3MRYkjn25qC6kZY2Ni
	MJ7gxIz8g==
X-Google-Smtp-Source: AGHT+IGCSqi+u7zPAKJbXiVle6HBw4vaddTrUBJW1UYwaHGnh/4m0lYlidEl1hsmzcOBFaEBgHl1CB3LcKFa24raxFg=
X-Received: by 2002:a05:600c:1c01:b0:458:bbed:a827 with SMTP id
 5b1f17b1804b1-45a165b7b15mr660355e9.1.1755021529570; Tue, 12 Aug 2025
 10:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250811173626.1878783-1-yeoreum.yun@arm.com> <20250811173626.1878783-3-yeoreum.yun@arm.com>
 <CA+fCnZeSV4fDBQr-WPFA66OYxN8zOQ2g1RQMDW3Ok8FaE7=NXQ@mail.gmail.com> <aJtyR3hCW5fG+niV@e129823.arm.com>
In-Reply-To: <aJtyR3hCW5fG+niV@e129823.arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 12 Aug 2025 19:58:37 +0200
X-Gm-Features: Ac12FXy555KMqM9sRgAgjXOVEGNZdNcePtQ9D4aII7b1VUPGHKMWOpB_9plVIlw
Message-ID: <CA+fCnZeznLqoLsUOgB1a1TNpR9PxjZKrrVBhotpMh0KVwvzj_Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250812_105851_197109_CF3027F9 
X-CRM114-Status: GOOD (  14.69  )
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

On Tue, Aug 12, 2025 at 6:57=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
>
> > Right now, KASAN tests are crafted to avoid/self-contain harmful
> > memory corruptions that they do (e.g. make sure that OOB write
> > accesses land in in-object kmalloc training space, etc.). If you turn
> > read accesses in tests into write accesses, memory corruptions caused
> > by the earlier tests will crash the kernel or the latter tests.
>
> That's why I run the store-only test when this mode is "sync"
> In case of "async/asymm" as you mention since it reports "after",
> there will be memory corruption.
>
> But in case of sync, when the MTE fault happens, it doesn't
> write to memory so, I think it's fine.

Does it not? I thought MTE gets disabled and we return from the fault
handler and let the write instruction execute. But my memory on this
is foggy. And I don't have a setup right now to test.

