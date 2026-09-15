Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FB9C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=; b=30xT3ZPs5LBKE28IetLi3xklOL
	Pw/XWLc66U8VojQ6eqoDt83/wgAeTEjjz2WoZwncdLlDC2W9Ni/bkCYvOyIMOuumenMYltu409hmo
	5Yf1pLnS9x/OKOpFkkFXJZdwfXNs3agHyLj7+qMb37xou6hbb5+brDvxyvMNxJRdhHGLwry8cBSuv
	/JyRUYxVRA5Uq7l9sN/auNj3Mzglxik8q7g0BqbTw7hnlT3gv+Lry3UxVfe7S76L0/t9LpyGnybjK
	SBZEibT2zfbBCjP7L0QtUbKDexeCj+mrVX54fNURioRoMbbC7wdpwBAZ6WL966jpUjGrjA6UpTd7e
	3OeY4srw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YwQ-00000007s2V-11VV;
	Tue, 15 Sep 2026 19:35:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YwO-00000007s2P-2EDk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 19:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=; b=JBupOyo0cnd0qqBxKnGY193uYZ
	f0/YPtoK8rj/W0go3hEOAegouZfC0WAGmnmgWzs++YfM2iwfWQSIvsmDVButHJNjn/jRGZsRiK4dJ
	vwyr5VNRXR44xHSrdopiqgBC9sxFML0jHCRaT4ykJNNrp3DQoWPqOpv1+BUk8+rcs1wh53eAF0ndE
	c+AbUrTsXVsg4o6y/m4YXO+2Y8fZ6y55wL4Ms75bbvPc4CHTuW+5n/oad0Ikoj9q69KDzbA51I+xn
	/grLhq6uyhXlP7MwHOw+G5brWggV1d6hvVod1vPuXRJLG8rHnk5hYt/MxKysAcyWI9utJ5hgGahRl
	YQVIkKlg==;
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6YwL-00000007CSF-1nKm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:35:39 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-530411c7ee1so65771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789500936; cv=none;
        d=google.com; s=arc-20260327;
        b=iyOfWwWeJEIUYB877AQpZAl2WzKCraSWxrueQcxhvAAXkbQn9wMvkpbh7HkdAsREwJ
         fpNxE1YjZhDDieCP9EgipWH8sVUKXZ3X19LpoHXGcbvjT0KWkIYw9q932AOUCRK8simn
         1FBgIyxy9vFkSjK+3xX7qdndYb07OPSzw+F8uspDBGGh0v4DJdNe0iyG1l0s167Q/OZ2
         fdzqBOrQcSihvUiz2zLWzsI0E4IzTI2xG05GdSSa8y8ZRJKG2TMYOJC/expxm9KdAErv
         BQ3zs9kJ4xlREifjVKVW1fmudb6LrOKf4r49qSu23sNw9QqUzH5u87e+T9mJ38Qz/aPk
         za2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=;
        fh=sHVQr0jvzuDlEj8pEjc6mnDFy7XymhnUbBLX96U7Ui0=;
        b=IMPYjdyOTQjrGtUFZFXNDFI4xGRcm5DfG2E8aPLEQEfIqis1SOkg3f0XRGqV7Zz6aQ
         lteOWyoMrok1yAFhm3JaaEkLpgFuqzM7GUpDoyW46SQyMmz66og3KSMfqXih+vCU8wVh
         qJU6GZrKZo85JO+T1P3TIlJD/J+y+fjBYg+S08l57xk9AHVLojtWZSN9Q6zGrfJlrl1N
         996JOa8M/Wh2wFsn07MkquqXx+6xkhMmJ2ZevFnH1M9aCLy2zq+OCYzrrm+QCMS0ILDP
         DRS5JF9E/sA/4OCLENALzhyPSQ5AWNApCzVGuAWSVfzShxYKp+AuYN1H0v+Dn7PcQO23
         A7Cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789500936; x=1790105736; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=;
        b=hJR7cvMUIP8Uy7+zG3LT1UQJoikHcuVY7tWSO2g9b85HwrBjufAlgHWL7jbOyfCREr
         oxgZbPsW8llkUAunB2SoTgIB5KHYQ26tjXW4IaX4BD1BbD6PUocWqIkMVlI07MLXuG5J
         dpeScP7UACaGu9TbaZWgmHDtVRVJFDKVXStzbBfR6ORX38lEg85cWnn/VhWstYg812dP
         VJvcG8z0czJz36o4VOjQne5rWN1EpnmrSiaFIuBRo5I0Jnc9VO6yPWqDo5j+MfY7TfeN
         /3v5PO6Tjo8b4IpjztHc3TNaaiFBnEo8nuFimuO8mdVOsNdBDU2RtSI+PY3b18hcbwaT
         roDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500936; x=1790105736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=;
        b=KocjFaH7jSzqFzN8cKsSgfNcAl6y5HX/JLosW+fSuOM65iRC+mDORzkiKpWVgh3Su2
         VxgYDB7yS6yqutfeGCEoR+lSA+1M5G18RNSjZcEHu+t6uVSKtZSPfSE3CIXS78ewnalC
         ZhI4hGRr/IkNLASBDmc7QKw8jJS5oEWxW7REAdg2jBnqjbOBB3zQuV+GPIDUc2hwNTHe
         X1yOnEo/GIr5SbtJxsm2ArDJ7SrWW5+DDhMJBZD5N+NgL5gm2SHtaa58y8qS7FiSjeyk
         BL9Xk6nydZZLS84e3fiJB3ExP4N0Fbv+cDWgo63x3bG7PHhQIrJF6C3WjjaGCK0U2PwX
         WECw==
X-Forwarded-Encrypted: i=1; AKwUvBzULJK1RJLVdx478o/c2arqWEgTomk/MP5oVZldfV5G9GrBJ7Ao7D0S48qrS9fwxx5jfzOY12PoIQHUZuuXjt9O@lists.infradead.org
X-Gm-Message-State: AFuF++m4NdjZK84Xmoc0IlLzCVkr53IuyljsghdwPhrtdCPHkWUGdqM/
	C59cBI+UsJVruRT9js9AKIRMV+5YQSr/fI4pYoBMYbk3s6W5sVdIQGvtsxR+h30SeURCzl8nEjf
	yv5riHJkxoS61HxQGAX3OSM4zPOxoAhlz9tPt7aji
X-Gm-Gg: AYBFou3UIjzWrjeLZxUc2O16ZXMw5BisQzVyUx9acDA6q2xe96F3ssuHQOeeQtAh0Tv
	DuQEJlmtoWldMS/Vpyu6YK2hUqu2lGmKlsmZKZI8kc4zJNkEp51DPiHM6x3PyoLKzm5fReC7eKa
	te3G3/l1ZqVSmNbySmKo7v6KdeG4beyM4s/eFMbbhUrGDtjf1fykl9jMakFgYMwvrdCRfUZLhGs
	xB3mTp53IZu7VRsehwV6V5w7u5ZUx92ln4XthFgKF8+u1md5ayfKnwIhpG2J7e/KGN4SScws0qR
	W+eFAy3MEKadVgo/2m82sehOEBOvouL+S9F76TGq3OKQahai7sHxEuKcPV5Q7/bhklzk0y1HJJM
	BJzp16Q9jcQ==
X-Received: by 2002:a05:622a:1a93:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-532583a627amr3002591cf.14.1789500935305; Tue, 15 Sep 2026
 12:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260914121903.1212-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260914121903.1212-1-cp0613@linux.alibaba.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:35:23 -0700
X-Gm-Features: AcwNN1VYoT5oxIlcFTffUxjtkWkLWpHOZQGEahUpqwEycg875lihiCow5XKgF3M
Message-ID: <CAP-5=fVW6nJXoh8qf4e_jkLXGUzCGCTCg9YivHkN9kkVJmMa-A@mail.gmail.com>
Subject: Re: [PATCH] perf test: Fix a leaked map reference in the arch dwarf
 unwind tests
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com, 
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203537_574349_A012FA6B 
X-CRM114-Status: GOOD (  16.23  )
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

On Mon, Sep 14, 2026 at 5:19=E2=80=AFAM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> maps__find() has returned a reference to the map it finds since
> commit 42fd623b58db ("perf maps: Get map before returning in
> maps__find"), which updated arch/x86/tests/dwarf-unwind.c but missed
> the arm, arm64 and powerpc copies. Release the map after reading its
> end, as x86 does. All other callers of maps__find() already release
> what they get.
>
> Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/arch/arm/tests/dwarf-unwind.c     | 1 +
>  tools/perf/arch/arm64/tests/dwarf-unwind.c   | 1 +
>  tools/perf/arch/powerpc/tests/dwarf-unwind.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/tools/perf/arch/arm/tests/dwarf-unwind.c b/tools/perf/arch/a=
rm/tests/dwarf-unwind.c
> index f421910e0709..d4707e9ffd2a 100644
> --- a/tools/perf/arch/arm/tests/dwarf-unwind.c
> +++ b/tools/perf/arch/arm/tests/dwarf-unwind.c
> @@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
>         }
>
>         stack_size =3D map__end(map) - sp;
> +       map__put(map);
>         stack_size =3D stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
>
>         memcpy(buf, (void *) sp, stack_size);
> diff --git a/tools/perf/arch/arm64/tests/dwarf-unwind.c b/tools/perf/arch=
/arm64/tests/dwarf-unwind.c
> index 440d00f0de14..fbc161a49369 100644
> --- a/tools/perf/arch/arm64/tests/dwarf-unwind.c
> +++ b/tools/perf/arch/arm64/tests/dwarf-unwind.c
> @@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
>         }
>
>         stack_size =3D map__end(map) - sp;
> +       map__put(map);
>         stack_size =3D stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
>
>         memcpy(buf, (void *) sp, stack_size);
> diff --git a/tools/perf/arch/powerpc/tests/dwarf-unwind.c b/tools/perf/ar=
ch/powerpc/tests/dwarf-unwind.c
> index 66af884baa66..b4bade5d59e2 100644
> --- a/tools/perf/arch/powerpc/tests/dwarf-unwind.c
> +++ b/tools/perf/arch/powerpc/tests/dwarf-unwind.c
> @@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
>         }
>
>         stack_size =3D map__end(map) - sp;
> +       map__put(map);
>         stack_size =3D stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
>
>         memcpy(buf, (void *) sp, stack_size);
> --
> 2.50.1
>

