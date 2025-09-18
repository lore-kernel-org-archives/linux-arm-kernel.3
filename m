Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7276CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIPAGga4FOA5RTuOCxh82ZFvj8TL8c2aRMORyqNz1+U=; b=xR34qIOEczWv6U/KM3KRg8ZHdD
	wjfN3ZgMCD0FLXvHz8/7+KoC7vgyDxDuCvHcxoQ875XScGV+eVoOfArZacgu4bpxq4jfIC2G8SQrS
	sm3GSsAl02wynHNopPtQDnz0EgBou58rLXaTmRzYorIQbbvGy4ZWImTaWXf4my8SM9iwfIqwE340O
	EiZjVzkqvL1inlu3PEFQN5I1Jsmx1Xn9+Imj9EKy0lOREgMXxj/iffDHc3dxaCKNVzA8XtYNXgOz5
	Tn1h5Ij4DuRBgDpEicbC/dRAq7GviBQKt7FF9wmkjYVFbnELtfVctJtkXTzRfb3YVqmfXRpzIgsQK
	6bJY8TLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAw0-0000000GsEC-2lf9;
	Thu, 18 Sep 2025 09:28:12 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAvy-0000000GsD8-4Bez
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:28:12 +0000
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-4240111d446so7749625ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187690; x=1758792490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIPAGga4FOA5RTuOCxh82ZFvj8TL8c2aRMORyqNz1+U=;
        b=UHseN8rJsPJZ/X4tYuYKnMs1NKkOMBCu3nvIKt6BoP3IlS1hX1pRkJ1DaQYfHjZcfM
         3sVh+TsCx20+h9tl4/a7NnnPC0QI3eeMcporlIoq5dsryM427F4lfXy4wMb1cbCF5s5/
         3opID3UrTYhTZrd9xxBzDfw2kqffC6glJMiHLN5agu5OH9suqjclqHB63+NxZS5OYgb/
         ZUIKFUdWZrrbaUVkvuOCEnLN1e1t2es3bRf4BQgurfDOC0MwqIOjH8Jjb7/vBEft1orf
         RFT6f1jARzpN/RRegRIy3UmcdupWf2MemqETxt2BG7RDphQHwCsO0NCTVgeRb1vhOKFY
         GVgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtCW6MTNCMKEv2+8PrkFONAEXypnEwXI2DH6ley8M5Lz3f96lmPFEVucTqP3Z45sEvZ5pq9SLj0SLaYNygf4DQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwT9r9Gyp2thWUlrIdSTarbQJa8hCKOeW+GqeiZohSLYSn+gLzF
	s0cmSd5WxdGWVBa42i/Jo+4CfwPcI8L/4bWOIRU2dm5LtdlW9KAdQvgNycmtwkAs
X-Gm-Gg: ASbGnct/oZu29eabNOk0ejD0jfQwreG2VmVyihqhI3Tvs7J/1lbtnEg1SlBgoRhFTnP
	awVMkeAwfVueIArwbRw7c+uS62rfuCb1kNy+1ucqCoHFJhOBRq2X8tlwFa0nnEvN2fR13SpGRL2
	BJ9vx4iqOL7KC7HLkRemvNj38sJ4kX/hn+uq3OkHB+3+BJRiwvUKzslQfHjwIdZj9eghGOpxQVz
	wnDM2attNkk/ugFkVMHsGgVah+KV0cSW6Hktnbvo8RGMTGqPjmv63O9XjPoSzAtQNzn3XMwwTub
	zahUrzPEdYjhSNmKMRsv9yyW9/INHg6KYDid558ctogXHXAM+imuEPTFF/CwEkhjDFGtWQndhpt
	1HsKaXCqoR6gR0UmxDdRaoUr0XcefuzFthmcOIj9hXHHprV1ZXwwnWq5mYBrI9O5Qt94RjPyFy9
	uRRJA=
X-Google-Smtp-Source: AGHT+IHpRKfrdi9j9XxTwXAa5yT+DbJVaXANiEmGVEyFzD5R05QlPi2/jScA5muWdo7pwTZxAkt4Ug==
X-Received: by 2002:a05:6e02:170e:b0:424:7d95:b90b with SMTP id e9e14a558f8ab-4247d95bac5mr9509415ab.14.1758187689595;
        Thu, 18 Sep 2025 02:28:09 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9f6fsm7733065ab.22.2025.09.18.02.28.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:28:09 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-89737fcb219so61842739f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXod2p5D/Aqf0Vdx2v/5oT6pa1GHZ9TRTPfJULVzSBdQAm1mMKXY33SSvUqNBSMKrKuk0vO9Ar5fAy8Egj6/r/I@lists.infradead.org
X-Received: by 2002:a05:6102:26cf:b0:4fb:de9e:6d87 with SMTP id
 ada2fe7eead31-56d5376a64emr1999299137.11.1758187210414; Thu, 18 Sep 2025
 02:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87ldmcnup1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldmcnup1.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 11:19:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+59oaCo5oOqTLhQMDV=SJhvBu-gGr4vUzyyPxEEBJpw@mail.gmail.com>
X-Gm-Features: AS18NWB4Q9Ufki8ANAbzyQzmxL_5lVd8LQK2sw8BXyMmuM4p3Xg-lO7FkssDvz4
Message-ID: <CAMuHMdV+59oaCo5oOqTLhQMDV=SJhvBu-gGr4vUzyyPxEEBJpw@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: serial: sh-sci: don't required
 "reset" for r8a78000
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_022811_034901_4FBDEEDF 
X-CRM114-Status: GOOD (  26.18  )
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

Hi Morimoto-san,

On Thu, 18 Sept 2025 at 08:25, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> commit 6ac1d6047372 ("dt-bindings: serial: sh-sci: Document r8a78000
> bindings") added r8a78000 DT bindings for Renesas serial, and it sets
> "resets" as "required", but it is not mandatory, because driver doesn't
> use it. Remove it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> I'm not sure this is acceptable. This is optional patch.
> If it was acceptable, I think we can remove "resets" from required not only for X5H...

The question is not "Does the driver use the reset signal?", but
"Does the hardware have a reset signal?".

According to Table 12.1 "Reset Categories and Reset Source" and Note 2,
the Module Controller takes care of Software Module Reset.  However,
I couldn't find information about the individual module resets in the
documentation for the Module Controller.

> --- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> @@ -126,7 +126,6 @@ if:
>            - renesas,rcar-gen2-hscif
>            - renesas,rcar-gen3-hscif
>            - renesas,rcar-gen4-hscif
> -          - renesas,rcar-gen5-hscif
>  then:
>    required:
>      - resets

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -181,7 +181,6 @@ allOf:
>                - renesas,rcar-gen2-scif
>                - renesas,rcar-gen3-scif
>                - renesas,rcar-gen4-scif
> -              - renesas,rcar-gen5-scif
>                - renesas,scif-r9a07g044
>                - renesas,scif-r9a09g057
>      then:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

