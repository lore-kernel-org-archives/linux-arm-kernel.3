Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6289ECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzQC5o3G/5QL6Qh+OxxIc+msYH/uvK2UseyCJUUA/QI=; b=RRENXeG1PZml1qLCWd02ebnyuu
	4Zyv6+v4uhcl/1OyxomS1BfltlOqV2Yk2f5wEKFYyUJQGP6DKOo83JXb3Ay2rCWDJnXw3ES5LVUgY
	gWjZZ9k8Ui78DZIINJQdlQhz2rN0Wh37NKEr2AJIe7bGmvAik2OHKq96JzZ2fga9KCqySP/n0oURq
	0vs3VtllB1iELbqpOS9acMndHH9rR90pz6yIS/4ItXsFXOBPBgcZBJncnQFlg7+UDKjJYEwMnlEzA
	ITkQwI6VLt0K6fXqfZHB24lfu4vcOY6gc6QHSgHYs24yLR62QV7MJfUnhIgRxSX8Fm2QVllRimJkM
	pfMT08KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySqo-00000007Vn5-2dkq;
	Tue, 16 Sep 2025 10:23:54 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySql-00000007Vls-23SI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 10:23:52 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018e9f902so2665495241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 03:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018230; x=1758623030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzQC5o3G/5QL6Qh+OxxIc+msYH/uvK2UseyCJUUA/QI=;
        b=iL1DyFGT90loSA5DVg7+/6rnMkq8GjJoNwhcQ0gS6U/2r0OwJK3nIeNtxuZVN3oDUs
         RUS07HmtXyoH7Fyjn5hK62w4ITWGPFS1N7h4z9v//ns+/3/s+7MBFkd0p7vxDuwTQldG
         IFtzh2zMQcYOFixO/rkYQpdgCDDpRW03NEZimHsy104kuYwKU0kpajF1NoVUhygkTZvJ
         oafXsrE/IkvmmZaAfWUFpXhqaGb6CC3mhInE3CllXFl99QILIUJ8XLLUMBu+Wf0fnxFr
         hiTFvANHKpMAuwbvJJXV0PCrrMK/ewBJQ7ogetQlxGavvZ2fSZ5uhzmlLZWvSqsCBW7s
         OJFg==
X-Forwarded-Encrypted: i=1; AJvYcCV0g23HZ4KZlrf8Nc4Qklpc2uUtSs8LXCvuR9liTcu0RrmmtMnS3I2seuRBY54hne+P/fW1hI3uiY/7KfE0tcD+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo53utn2MFxYQ0F29+oKJv7LIXZKeWdLeljmLmmwPWBG41ISrP
	QLpfX0NGIQvTOhPN6rqdTowffw7CKOO+r2re4zi9QGGC1qJwrqBE/FrmgNcEHkpP
X-Gm-Gg: ASbGncu2DNsqy/18Z7+tJHoEzTGcYxuarwSEr6X8mbpYPK8KnqNk2gv6aUpPwfMPEaJ
	gi+2kPttvvJw9NAijuEI+AJjHY3QOxo78cQ2PWWZhexdLMdMY/3ywnsKg/M4FdXRBJ+YDMuy+K2
	S26p4NwT1S9LEkGUUBxTmKFeTPzx/VHZIWcTwSu7EPXPlG2pKYMADPkg84JaTvrKZgBXvtaZ0yW
	mQG2b5FNhwsgKxdA4OYIO24kgRZjROYTiDLcG+Jm4YKB9WkaCxdrXnldeYGEfKXiKe/MGUpApIL
	XKKbVR0sj/K39MI+GV17ohlmRGvU8RnthhidqBESNYaK/cXGUPi2G7GJ8Z/5hgpplCWCqzjwXgN
	HLQxp/Q6rXIyFujwCXlXezJtgHV8YvNQAc/InqCRNPhXIE2kMv1s8I09TpEZH
X-Google-Smtp-Source: AGHT+IE2d2LF3KDWu1Azs6hDrdePuau9cijHVKBRDc2PTN4GIuZJx7TUhCvgLpDANG5ZQRThzNOLEQ==
X-Received: by 2002:a05:6102:2906:b0:529:fc9e:84ae with SMTP id ada2fe7eead31-5560f863163mr4932211137.24.1758018230009;
        Tue, 16 Sep 2025 03:23:50 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-55374ee8b4bsm3467690137.11.2025.09.16.03.23.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:23:49 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89018e9f902so2665485241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 03:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKnSLkF/Qj+3vXNF3bpYv6ospPuvwSX6U2ZWJkWv1neNVPbZrVfiLzbqmP6Dm8BtodSHd0Zb1Zlkj4HmYg+ZLk@lists.infradead.org
X-Received: by 2002:a05:6122:c81:b0:544:7057:a812 with SMTP id
 71dfb90a1353d-54a16b7e208mr5192058e0c.3.1758017916045; Tue, 16 Sep 2025
 03:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com> <87segni0kg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87segni0kg.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:18:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRNUDNnF7QVwUxbxyOCsTEdJjCuWw3-bqA0tA2uoxiFQ@mail.gmail.com>
X-Gm-Features: AS18NWA9ABGiKPyMIlR3UAj5Udf9cOnnhSw8y3TAUBDcJz0NhqQSnwO50GNAW48
Message-ID: <CAMuHMdXRNUDNnF7QVwUxbxyOCsTEdJjCuWw3-bqA0tA2uoxiFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: soc: renesas: Document R-Car X5H Ironhide
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
X-CRM114-CacheID: sfid-20250916_032351_536249_3905947F 
X-CRM114-Status: GOOD (  18.49  )
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

On Tue, 16 Sept 2025 at 04:38, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC,
> as used on the Renesas Ironhide board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Already commit 1ed2786e9ef8f162 ("dt-bindings: soc: renesas: Document
R-Car X5H Ironhide") in soc/for-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

