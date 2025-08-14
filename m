Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98982CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 05:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCWbVPquEv5y1FRnrw2PZ9CdMWwpcBL4OO25oZxPA2M=; b=zRmCOlHLNi0AF4ikVwWQzYPADh
	taBO2SL5Ou7chyNw9xxwmFLYw0aT/FGzclInyvj1EwpCWiMnvGS1lxNCG4nWd3E02vwK3n38oqWAy
	i47jZ4J825bqmvdeC9nSAc65ENeOH3Mf56DExVp+zKqHZ9kve0C6ErTrgls5HVrw2kr/8XCDDr4pf
	CvSom2xUgYiaeQC+N5sl5gwgrKgqKEI3Kj3YS31zN+6Bxp3/D38M5kQtZVpJ++geIO/+AVvLFV/Qx
	xEg0h/MOsqlPJ6fa7cznDBqYjgIPUhrQd/ZUcv8KNMeaIPUtEMrOiyxjQy/UcngyDf8TxSQbi54+9
	TK3A6KQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQD4-0000000Fnyf-2Y6l;
	Thu, 14 Aug 2025 05:09:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQ8T-0000000Fncb-3SnH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 05:04:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so367861f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 22:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755147860; x=1755752660; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCWbVPquEv5y1FRnrw2PZ9CdMWwpcBL4OO25oZxPA2M=;
        b=axAN8rkSQdLHPDDrkICb54/ShT2B84JzNholuNWqjUKmuztJOEY5Ilu6y/QKbWmaFO
         vhxiE8ma1NpPulCi3ZW8Oce+9lqJ0Sbs7nJINJkNNgLeJpgkyAL5Lb8YfMsECXelCBOv
         ZYm4YJyc0RM8cC+DJNEFhGWw8kKM+V4s5GTUVTFetHCKzP7q6WijnbKQE8L6Qb+vDJMf
         7Sh6S8fnf0f9sr5MwOowcYJZGC3uWL7N9qmZ6Qp7KPSJbFQ2gopp6X1eWrcwNEfXVJoS
         ircLz/bvk9A8IyvzmSiCKvg7biFZ5RAoCM/eBBlH8RMIDCcMY7a3MXbI58af4hFdcTyC
         3kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755147860; x=1755752660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCWbVPquEv5y1FRnrw2PZ9CdMWwpcBL4OO25oZxPA2M=;
        b=k2ia6dmTAnmKQmbedvJR7QFu3QwR4MW2FmYT3JWFsIefsfPhxYt3DRZ5PXalNvarHY
         Iq1kZImAF8WwBQcAH25wJQCyTBNhOcC/70I7wk0vwg6RxdykD6KKqldAkCef7angbBrL
         RrNQsRY3fJkcIctmZi0GFlWn1H2fI9pRT2lHBmG1USs1QNFY2mIXX7+h0xUTKh4cQVNh
         Sa9cASy8rAN9jVnhOkmUrsRaPCluPS5SYf4sWM/XoDGHN4eWAUTAGzvnOCPZ7x7v6wud
         t4/1BMoOV3FPvvj0VSFI/1l19DD1HE//opHVt90SywC2CTX1YJd2Cds4pQSd+MokhF78
         3W8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJzE7sIhTSsfZUUM6Nuh8ZCTvm0uqkwD+dB97t603iPd9uOELlahCnMUMtLVbtsU9zasMAecfxTqoDNKt4J8/f@lists.infradead.org
X-Gm-Message-State: AOJu0YyPF61L6SeIBKHCSeht7bRQki0xPmaPeX5bn44Ph8YYaeIcpTRE
	TS/fjSvLfQhatvjLgXwGDlE1wSmaotVXpHMxPb06FXGc9NzslHgRgVjJElWSV4j7vR5Tq4Ck6/T
	Cz8A2tp/gDEEqDYWiOqX5T30Rx9Zg2zg=
X-Gm-Gg: ASbGncuuKIDIFVcWXa6MTMDI2g9DXXy5t6XpGVAZW+B6rW5Y77AiErx9FHQCxE5+vB1
	SdVzz616ci+z+cbyCQ/Mxz85sz7KEbGQVaZsW5BetBUZaSA9LJ3QrOKHFuUTg9EjNNQWb4q94Ab
	mZR+CtOofj2edgrTA/V9hoi+A5DPLUquK3L/DUNVswDsGthffqgTTD771ZEsZAlKA4F7FmN1L84
	xSIPHPJprQSIFKTMYDE
X-Google-Smtp-Source: AGHT+IFLJ+cAjhzkSNH+CuXsF4vI5bOc8BeId+vHtA8XwPrwD04ikN55fvK4aJ5sqm4jpjqhvwVeIm7rxYIEdxHb8EU=
X-Received: by 2002:a05:6000:1a8d:b0:3a4:fea6:d49f with SMTP id
 ffacd0b85a97d-3b9edf45fc3mr1190013f8f.49.1755147859952; Wed, 13 Aug 2025
 22:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250813175335.3980268-1-yeoreum.yun@arm.com> <20250813175335.3980268-3-yeoreum.yun@arm.com>
In-Reply-To: <20250813175335.3980268-3-yeoreum.yun@arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 14 Aug 2025 07:04:08 +0200
X-Gm-Features: Ac12FXyLOyZaE_ECpYWEVQi7GnbEZOQMKRL2nuRgMWfUkOASyV2tF222LbrEdfg
Message-ID: <CA+fCnZeT2J7W62Ydv0AuDLC13wO-VrH1Q_uqhkZbGLqc4Ktf5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kasan: apply store-only mode in kasan kunit testcases
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
X-CRM114-CacheID: sfid-20250813_220421_913352_9ED657B2 
X-CRM114-Status: GOOD (  29.21  )
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

On Wed, Aug 13, 2025 at 7:53=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
>
> When KASAN is configured in store-only mode,
> fetch/load operations do not trigger tag check faults.
>
> As a result, the outcome of some test cases may differ
> compared to when KASAN is configured without store-only mode.
>
> Therefore, by modifying pre-exist testcases
> check the store only makes tag check fault (TCF) where
> writing is perform in "allocated memory" but tag is invalid
> (i.e) redzone write in atomic_set() testcases.
> Otherwise check the invalid fetch/read doesn't generate TCF.
>
> Also, skip some testcases affected by initial value
> (i.e) atomic_cmpxchg() testcase maybe successd if
> it passes valid atomic_t address and invalid oldaval address.
> In this case, if invalid atomic_t doesn't have the same oldval,
> it won't trigger store operation so the test will pass.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  mm/kasan/kasan_test_c.c | 366 +++++++++++++++++++++++++++++++---------
>  1 file changed, 286 insertions(+), 80 deletions(-)
>
> diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
> index 2aa12dfa427a..e5d08a6ee3a2 100644
> --- a/mm/kasan/kasan_test_c.c
> +++ b/mm/kasan/kasan_test_c.c
> @@ -94,11 +94,13 @@ static void kasan_test_exit(struct kunit *test)
>  }
>
>  /**
> - * KUNIT_EXPECT_KASAN_FAIL - check that the executed expression produces=
 a
> - * KASAN report; causes a KUnit test failure otherwise.
> + * _KUNIT_EXPECT_KASAN_TEMPLATE - check that the executed expression pro=
duces
> + * a KASAN report or not; a KUnit test failure when it's different from =
@produce.
>   *
>   * @test: Currently executing KUnit test.
> - * @expression: Expression that must produce a KASAN report.
> + * @expr: Expression produce a KASAN report or not.
> + * @expr_str: Expression string
> + * @produce: expression should produce a KASAN report.
>   *
>   * For hardware tag-based KASAN, when a synchronous tag fault happens, t=
ag
>   * checking is auto-disabled. When this happens, this test handler reena=
bles
> @@ -110,25 +112,29 @@ static void kasan_test_exit(struct kunit *test)
>   * Use READ/WRITE_ONCE() for the accesses and compiler barriers around t=
he
>   * expression to prevent that.
>   *
> - * In between KUNIT_EXPECT_KASAN_FAIL checks, test_status.report_found i=
s kept
> + * In between _KUNIT_EXPECT_KASAN_TEMPLATE checks, test_status.report_fo=
und is kept
>   * as false. This allows detecting KASAN reports that happen outside of =
the
>   * checks by asserting !test_status.report_found at the start of
> - * KUNIT_EXPECT_KASAN_FAIL and in kasan_test_exit.
> + * _KUNIT_EXPECT_KASAN_TEMPLATE and in kasan_test_exit.
>   */
> -#define KUNIT_EXPECT_KASAN_FAIL(test, expression) do {                 \
> +#define _KUNIT_EXPECT_KASAN_TEMPLATE(test, expr, expr_str, produce)    \
> +do {                                                                   \
>         if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&                         \
>             kasan_sync_fault_possible())                                \
>                 migrate_disable();                                      \
>         KUNIT_EXPECT_FALSE(test, READ_ONCE(test_status.report_found));  \
>         barrier();                                                      \
> -       expression;                                                     \
> +       expr;                                                           \
>         barrier();                                                      \
>         if (kasan_async_fault_possible())                               \
>                 kasan_force_async_fault();                              \
> -       if (!READ_ONCE(test_status.report_found)) {                     \
> -               KUNIT_FAIL(test, KUNIT_SUBTEST_INDENT "KASAN failure "  \
> -                               "expected in \"" #expression            \
> -                                "\", but none occurred");              \
> +       if (READ_ONCE(test_status.report_found) !=3D produce) {          =
 \
> +               KUNIT_FAIL(test, KUNIT_SUBTEST_INDENT "KASAN %s "       \
> +                               "expected in \"" expr_str               \
> +                                "\", but %soccurred",                  \
> +                               (produce ? "failure" : "success"),      \
> +                               (test_status.report_found ?             \
> +                                "" : "none "));                        \
>         }                                                               \
>         if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&                         \
>             kasan_sync_fault_possible()) {                              \
> @@ -141,6 +147,26 @@ static void kasan_test_exit(struct kunit *test)
>         WRITE_ONCE(test_status.async_fault, false);                     \
>  } while (0)
>
> +/*
> + * KUNIT_EXPECT_KASAN_FAIL - check that the executed expression produces=
 a
> + * KASAN report; causes a KUnit test failure otherwise.
> + *
> + * @test: Currently executing KUnit test.
> + * @expr: Expression produce a KASAN report.
> + */
> +#define KUNIT_EXPECT_KASAN_FAIL(test, expr)                    \
> +       _KUNIT_EXPECT_KASAN_TEMPLATE(test, expr, #expr, true)
> +
> +/*
> + * KUNIT_EXPECT_KASAN_SUCCESS - check that the executed expression doesn=
't
> + * produces a KASAN report; causes a KUnit test failure otherwise.

Should be no need for this, the existing functionality already checks
that there are no reports outside of KUNIT_EXPECT_KASAN_FAIL().

> + *
> + * @test: Currently executing KUnit test.
> + * @expr: Expression doesn't produce a KASAN report.
> + */
> +#define KUNIT_EXPECT_KASAN_SUCCESS(test, expr)                 \
> +       _KUNIT_EXPECT_KASAN_TEMPLATE(test, expr, #expr, false)
> +
>  #define KASAN_TEST_NEEDS_CONFIG_ON(test, config) do {                  \
>         if (!IS_ENABLED(config))                                        \
>                 kunit_skip((test), "Test requires " #config "=3Dy");     =
 \
> @@ -183,8 +209,12 @@ static void kmalloc_oob_right(struct kunit *test)
>         KUNIT_EXPECT_KASAN_FAIL(test, ptr[size + 5] =3D 'y');
>
>         /* Out-of-bounds access past the aligned kmalloc object. */
> -       KUNIT_EXPECT_KASAN_FAIL(test, ptr[0] =3D
> -                                       ptr[size + KASAN_GRANULE_SIZE + 5=
]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ptr[0] =3D
> +                                               ptr[size + KASAN_GRANULE_=
SIZE + 5]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ptr[0] =3D
> +                                               ptr[size + KASAN_GRANULE_=
SIZE + 5]);

Let's instead add KUNIT_EXPECT_KASAN_FAIL_READ() that only expects a
KASAN report when the store-only mode is not enabled. And use that for
the bad read accesses done in tests.


>
>         kfree(ptr);
>  }
> @@ -198,7 +228,11 @@ static void kmalloc_oob_left(struct kunit *test)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>
>         OPTIMIZER_HIDE_VAR(ptr);
> -       KUNIT_EXPECT_KASAN_FAIL(test, *ptr =3D *(ptr - 1));
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, *ptr =3D *(ptr - 1));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, *ptr =3D *(ptr - 1));
> +
>         kfree(ptr);
>  }
>
> @@ -211,7 +245,11 @@ static void kmalloc_node_oob_right(struct kunit *tes=
t)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>
>         OPTIMIZER_HIDE_VAR(ptr);
> -       KUNIT_EXPECT_KASAN_FAIL(test, ptr[0] =3D ptr[size]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ptr[0] =3D ptr[size]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ptr[0] =3D ptr[size]);
> +
>         kfree(ptr);
>  }
>
> @@ -291,7 +329,10 @@ static void kmalloc_large_uaf(struct kunit *test)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>         kfree(ptr);
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[0=
]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
>  }
>
>  static void kmalloc_large_invalid_free(struct kunit *test)
> @@ -323,7 +364,11 @@ static void page_alloc_oob_right(struct kunit *test)
>         ptr =3D page_address(pages);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, ptr[0] =3D ptr[size]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ptr[0] =3D ptr[size]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ptr[0] =3D ptr[size]);
> +
>         free_pages((unsigned long)ptr, order);
>  }
>
> @@ -338,7 +383,10 @@ static void page_alloc_uaf(struct kunit *test)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>         free_pages((unsigned long)ptr, order);
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[0=
]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
>  }
>
>  static void krealloc_more_oob_helper(struct kunit *test,
> @@ -455,10 +503,13 @@ static void krealloc_uaf(struct kunit *test)
>         ptr1 =3D kmalloc(size1, GFP_KERNEL);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
>         kfree(ptr1);
> -
>         KUNIT_EXPECT_KASAN_FAIL(test, ptr2 =3D krealloc(ptr1, size2, GFP_=
KERNEL));
>         KUNIT_ASSERT_NULL(test, ptr2);
> -       KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)ptr1);
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, *(volatile char *)ptr1);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)ptr1);
>  }
>
>  static void kmalloc_oob_16(struct kunit *test)
> @@ -501,7 +552,11 @@ static void kmalloc_uaf_16(struct kunit *test)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
>         kfree(ptr2);
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 =3D *ptr2);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, *ptr1 =3D *ptr2);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 =3D *ptr2);
> +
>         kfree(ptr1);
>  }
>
> @@ -640,8 +695,14 @@ static void kmalloc_memmove_invalid_size(struct kuni=
t *test)
>         memset((char *)ptr, 0, 64);
>         OPTIMIZER_HIDE_VAR(ptr);
>         OPTIMIZER_HIDE_VAR(invalid_size);
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               memmove((char *)ptr, (char *)ptr + 4, invalid_size));
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       memmove((char *)ptr, (char *)ptr + 4, invalid_siz=
e));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       memmove((char *)ptr, (char *)ptr + 4, invalid_siz=
e));
> +
>         kfree(ptr);
>  }
>
> @@ -654,7 +715,11 @@ static void kmalloc_uaf(struct kunit *test)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
>
>         kfree(ptr);
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[8]);
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[8=
]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[8]);
>  }
>
>  static void kmalloc_uaf_memset(struct kunit *test)
> @@ -701,7 +766,11 @@ static void kmalloc_uaf2(struct kunit *test)
>                 goto again;
>         }
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr1)[40]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr1)[=
40]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr1)[40]=
);
> +
>         KUNIT_EXPECT_PTR_NE(test, ptr1, ptr2);
>
>         kfree(ptr2);
> @@ -727,19 +796,33 @@ static void kmalloc_uaf3(struct kunit *test)
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
>         kfree(ptr2);
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr1)[8]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr1)[=
8]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr1)[8])=
;
>  }
>
>  static void kasan_atomics_helper(struct kunit *test, void *unsafe, void =
*safe)
>  {
>         int *i_unsafe =3D unsafe;
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, READ_ONCE(*i_unsafe));
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, READ_ONCE(*i_unsafe));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, READ_ONCE(*i_unsafe));
> +
>         KUNIT_EXPECT_KASAN_FAIL(test, WRITE_ONCE(*i_unsafe, 42));
> -       KUNIT_EXPECT_KASAN_FAIL(test, smp_load_acquire(i_unsafe));
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, smp_load_acquire(i_unsaf=
e));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, smp_load_acquire(i_unsafe))=
;
>         KUNIT_EXPECT_KASAN_FAIL(test, smp_store_release(i_unsafe, 42));
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_read(unsafe));
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, atomic_read(unsafe));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_read(unsafe));
> +
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_set(unsafe, 42));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_add(42, unsafe));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_sub(42, unsafe));
> @@ -752,18 +835,38 @@ static void kasan_atomics_helper(struct kunit *test=
, void *unsafe, void *safe)
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_xchg(unsafe, 42));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_cmpxchg(unsafe, 21, 42));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_try_cmpxchg(unsafe, safe, 42=
));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_try_cmpxchg(safe, unsafe, 42=
));
> +
> +       /*
> +        * The result of the test below may vary due to garbage values of=
 unsafe in
> +        * store-only mode. Therefore, skip this test when KASAN is confi=
gured
> +        * in store-only mode.
> +        */
> +       if (!kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_try_cmpxchg(safe, un=
safe, 42));
> +
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_sub_and_test(42, unsafe));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_dec_and_test(unsafe));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_inc_and_test(unsafe));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_add_negative(42, unsafe));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_add_unless(unsafe, 21, 42));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_inc_not_zero(unsafe));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_inc_unless_negative(unsafe))=
;
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_dec_unless_positive(unsafe))=
;
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_dec_if_positive(unsafe));
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_read(unsafe));
> +       /*
> +        * The result of the test below may vary due to garbage values of=
 unsafe in
> +        * store-only mode. Therefore, skip this test when KASAN is confi=
gured
> +        * in store-only mode.
> +        */
> +       if (!kasan_store_only_enabled()) {
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_add_unless(unsafe, 2=
1, 42));
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_inc_not_zero(unsafe)=
);
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_inc_unless_negative(=
unsafe));
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_dec_unless_positive(=
unsafe));
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_dec_if_positive(unsa=
fe));
> +       }
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, atomic_long_read(unsafe)=
);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_read(unsafe));
> +
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_set(unsafe, 42));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_add(42, unsafe));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_sub(42, unsafe));
> @@ -776,16 +879,32 @@ static void kasan_atomics_helper(struct kunit *test=
, void *unsafe, void *safe)
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_xchg(unsafe, 42));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_cmpxchg(unsafe, 21, 42)=
);
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_try_cmpxchg(unsafe, saf=
e, 42));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_try_cmpxchg(safe, unsaf=
e, 42));
> +
> +       /*
> +        * The result of the test below may vary due to garbage values in
> +        * store-only mode. Therefore, skip this test when KASAN is confi=
gured
> +        * in store-only mode.
> +        */
> +       if (!kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_try_cmpxchg(saf=
e, unsafe, 42));
> +
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_sub_and_test(42, unsafe=
));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_dec_and_test(unsafe));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_inc_and_test(unsafe));
>         KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_add_negative(42, unsafe=
));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_add_unless(unsafe, 21, =
42));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_inc_not_zero(unsafe));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_inc_unless_negative(uns=
afe));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_dec_unless_positive(uns=
afe));
> -       KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_dec_if_positive(unsafe)=
);
> +
> +       /*
> +        * The result of the test below may vary due to garbage values in
> +        * store-only mode. Therefore, skip this test when KASAN is confi=
gured
> +        * in store-only mode.
> +        */
> +       if (!kasan_store_only_enabled()) {
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_add_unless(unsa=
fe, 21, 42));
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_inc_not_zero(un=
safe));
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_inc_unless_nega=
tive(unsafe));
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_dec_unless_posi=
tive(unsafe));
> +               KUNIT_EXPECT_KASAN_FAIL(test, atomic_long_dec_if_positive=
(unsafe));
> +       }
>  }
>
>  static void kasan_atomics(struct kunit *test)
> @@ -842,8 +961,14 @@ static void ksize_unpoisons_memory(struct kunit *tes=
t)
>         /* These must trigger a KASAN report. */
>         if (IS_ENABLED(CONFIG_KASAN_GENERIC))
>                 KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[size=
]);
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[size + 5]);
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[real_size - =
1]);
> +
> +       if (kasan_store_only_enabled()) {
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[s=
ize + 5]);
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[r=
eal_size - 1]);
> +       } else {
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[size=
 + 5]);
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[real=
_size - 1]);
> +       }
>
>         kfree(ptr);
>  }
> @@ -863,8 +988,13 @@ static void ksize_uaf(struct kunit *test)
>
>         OPTIMIZER_HIDE_VAR(ptr);
>         KUNIT_EXPECT_KASAN_FAIL(test, ksize(ptr));
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[size]);
> +       if (kasan_store_only_enabled()) {
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[0=
]);
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[s=
ize]);
> +       } else {
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[size=
]);
> +       }
>  }
>
>  /*
> @@ -886,6 +1016,7 @@ static void rcu_uaf_reclaim(struct rcu_head *rp)
>                 container_of(rp, struct kasan_rcu_info, rcu);
>
>         kfree(fp);
> +
>         ((volatile struct kasan_rcu_info *)fp)->i;
>  }
>
> @@ -899,9 +1030,14 @@ static void rcu_uaf(struct kunit *test)
>         global_rcu_ptr =3D rcu_dereference_protected(
>                                 (struct kasan_rcu_info __rcu *)ptr, NULL)=
;
>
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               call_rcu(&global_rcu_ptr->rcu, rcu_uaf_reclaim);
> -               rcu_barrier());
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       call_rcu(&global_rcu_ptr->rcu, rcu_uaf_reclaim);
> +                       rcu_barrier());
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       call_rcu(&global_rcu_ptr->rcu, rcu_uaf_reclaim);
> +                       rcu_barrier());
>  }
>
>  static void workqueue_uaf_work(struct work_struct *work)
> @@ -924,8 +1060,12 @@ static void workqueue_uaf(struct kunit *test)
>         queue_work(workqueue, work);
>         destroy_workqueue(workqueue);
>
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               ((volatile struct work_struct *)work)->data);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       ((volatile struct work_struct *)work)->data);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       ((volatile struct work_struct *)work)->data);
>  }
>
>  static void kfree_via_page(struct kunit *test)
> @@ -972,7 +1112,10 @@ static void kmem_cache_oob(struct kunit *test)
>                 return;
>         }
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, *p =3D p[size + OOB_TAG_OFF]);
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, *p =3D p[size + OOB_TAG_=
OFF]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, *p =3D p[size + OOB_TAG_OFF=
]);
>
>         kmem_cache_free(cache, p);
>         kmem_cache_destroy(cache);
> @@ -1068,7 +1211,10 @@ static void kmem_cache_rcu_uaf(struct kunit *test)
>          */
>         rcu_barrier();
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, READ_ONCE(*p));
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, READ_ONCE(*p));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, READ_ONCE(*p));
>
>         kmem_cache_destroy(cache);
>  }
> @@ -1206,6 +1352,9 @@ static void mempool_oob_right_helper(struct kunit *=
test, mempool_t *pool, size_t
>         if (IS_ENABLED(CONFIG_KASAN_GENERIC))
>                 KUNIT_EXPECT_KASAN_FAIL(test,
>                         ((volatile char *)&elem[size])[0]);
> +       else if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       ((volatile char *)&elem[round_up(size, KASAN_GRAN=
ULE_SIZE)])[0]);
>         else
>                 KUNIT_EXPECT_KASAN_FAIL(test,
>                         ((volatile char *)&elem[round_up(size, KASAN_GRAN=
ULE_SIZE)])[0]);
> @@ -1273,7 +1422,11 @@ static void mempool_uaf_helper(struct kunit *test,=
 mempool_t *pool, bool page)
>         mempool_free(elem, pool);
>
>         ptr =3D page ? page_address((struct page *)elem) : elem;
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)ptr)[0=
]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
>  }
>
>  static void mempool_kmalloc_uaf(struct kunit *test)
> @@ -1532,8 +1685,13 @@ static void kasan_memchr(struct kunit *test)
>
>         OPTIMIZER_HIDE_VAR(ptr);
>         OPTIMIZER_HIDE_VAR(size);
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               kasan_ptr_result =3D memchr(ptr, '1', size + 1));
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       kasan_ptr_result =3D memchr(ptr, '1', size + 1));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       kasan_ptr_result =3D memchr(ptr, '1', size + 1));
>
>         kfree(ptr);
>  }
> @@ -1559,8 +1717,14 @@ static void kasan_memcmp(struct kunit *test)
>
>         OPTIMIZER_HIDE_VAR(ptr);
>         OPTIMIZER_HIDE_VAR(size);
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               kasan_int_result =3D memcmp(ptr, arr, size+1));
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       kasan_int_result =3D memcmp(ptr, arr, size+1));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       kasan_int_result =3D memcmp(ptr, arr, size+1));
> +
>         kfree(ptr);
>  }
>
> @@ -1593,9 +1757,13 @@ static void kasan_strings(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, KASAN_GRANULE_SIZE - 2,
>                         strscpy(ptr, src + 1, KASAN_GRANULE_SIZE));
>
> -       /* strscpy should fail if the first byte is unreadable. */
> -       KUNIT_EXPECT_KASAN_FAIL(test, strscpy(ptr, src + KASAN_GRANULE_SI=
ZE,
> -                                             KASAN_GRANULE_SIZE));
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, strscpy(ptr, src + KASAN=
_GRANULE_SIZE,
> +                                                     KASAN_GRANULE_SIZE)=
);
> +       else
> +               /* strscpy should fail if the first byte is unreadable. *=
/
> +               KUNIT_EXPECT_KASAN_FAIL(test, strscpy(ptr, src + KASAN_GR=
ANULE_SIZE,
> +                                                     KASAN_GRANULE_SIZE)=
);
>
>         kfree(src);
>         kfree(ptr);
> @@ -1607,17 +1775,22 @@ static void kasan_strings(struct kunit *test)
>          * will likely point to zeroed byte.
>          */
>         ptr +=3D 16;
> -       KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result =3D strchr(ptr, '1=
'));
> -
> -       KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result =3D strrchr(ptr, '=
1'));
> -
> -       KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strcmp(ptr, "2=
"));
>
> -       KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strncmp(ptr, "=
2", 1));
> -
> -       KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strlen(ptr));
> -
> -       KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strnlen(ptr, 1=
));
> +       if (kasan_store_only_enabled()) {
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, kasan_ptr_result =3D str=
chr(ptr, '1'));
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, kasan_ptr_result =3D str=
rchr(ptr, '1'));
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, kasan_int_result =3D str=
cmp(ptr, "2"));
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, kasan_int_result =3D str=
ncmp(ptr, "2", 1));
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, kasan_int_result =3D str=
len(ptr));
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, kasan_int_result =3D str=
nlen(ptr, 1));
> +       } else {
> +               KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result =3D strchr=
(ptr, '1'));
> +               KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result =3D strrch=
r(ptr, '1'));
> +               KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strcmp=
(ptr, "2"));
> +               KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strncm=
p(ptr, "2", 1));
> +               KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strlen=
(ptr));
> +               KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D strnle=
n(ptr, 1));
> +       }
>  }
>
>  static void kasan_bitops_modify(struct kunit *test, int nr, void *addr)
> @@ -1636,12 +1809,25 @@ static void kasan_bitops_test_and_modify(struct k=
unit *test, int nr, void *addr)
>  {
>         KUNIT_EXPECT_KASAN_FAIL(test, test_and_set_bit(nr, addr));
>         KUNIT_EXPECT_KASAN_FAIL(test, __test_and_set_bit(nr, addr));
> -       KUNIT_EXPECT_KASAN_FAIL(test, test_and_set_bit_lock(nr, addr));
> +
> +       /*
> +        * When KASAN is running in store-only mode,
> +        * a fault won't occur even if the bit is set.
> +        * Therefore, skip the test_and_set_bit_lock test in store-only m=
ode.
> +        */
> +       if (!kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_FAIL(test, test_and_set_bit_lock(nr, a=
ddr));
> +
>         KUNIT_EXPECT_KASAN_FAIL(test, test_and_clear_bit(nr, addr));
>         KUNIT_EXPECT_KASAN_FAIL(test, __test_and_clear_bit(nr, addr));
>         KUNIT_EXPECT_KASAN_FAIL(test, test_and_change_bit(nr, addr));
>         KUNIT_EXPECT_KASAN_FAIL(test, __test_and_change_bit(nr, addr));
> -       KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D test_bit(nr, a=
ddr));
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, kasan_int_result =3D tes=
t_bit(nr, addr));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D test_b=
it(nr, addr));
> +
>         if (nr < 7)
>                 KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result =3D
>                                 xor_unlock_is_negative_byte(1 << nr, addr=
));
> @@ -1765,7 +1951,10 @@ static void vmalloc_oob(struct kunit *test)
>                 KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)v_ptr)[si=
ze]);
>
>         /* An aligned access into the first out-of-bounds granule. */
> -       KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)v_ptr)[size + 5])=
;
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test, ((volatile char *)v_ptr)=
[size + 5]);
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)v_ptr)[si=
ze + 5]);
>
>         /* Check that in-bounds accesses to the physical page are valid. =
*/
>         page =3D vmalloc_to_page(v_ptr);
> @@ -2042,16 +2231,33 @@ static void copy_user_test_oob(struct kunit *test=
)
>
>         KUNIT_EXPECT_KASAN_FAIL(test,
>                 unused =3D copy_from_user(kmem, usermem, size + 1));
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               unused =3D copy_to_user(usermem, kmem, size + 1));
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       unused =3D copy_to_user(usermem, kmem, size + 1))=
;
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       unused =3D copy_to_user(usermem, kmem, size + 1))=
;
> +
>         KUNIT_EXPECT_KASAN_FAIL(test,
>                 unused =3D __copy_from_user(kmem, usermem, size + 1));
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               unused =3D __copy_to_user(usermem, kmem, size + 1));
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       unused =3D __copy_to_user(usermem, kmem, size + 1=
));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       unused =3D __copy_to_user(usermem, kmem, size + 1=
));
> +
>         KUNIT_EXPECT_KASAN_FAIL(test,
>                 unused =3D __copy_from_user_inatomic(kmem, usermem, size =
+ 1));
> -       KUNIT_EXPECT_KASAN_FAIL(test,
> -               unused =3D __copy_to_user_inatomic(usermem, kmem, size + =
1));
> +
> +       if (kasan_store_only_enabled())
> +               KUNIT_EXPECT_KASAN_SUCCESS(test,
> +                       unused =3D __copy_to_user_inatomic(usermem, kmem,=
 size + 1));
> +       else
> +               KUNIT_EXPECT_KASAN_FAIL(test,
> +                       unused =3D __copy_to_user_inatomic(usermem, kmem,=
 size + 1));
>
>         /*
>         * Prepare a long string in usermem to avoid the strncpy_from_user=
 test
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

