Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343B5C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDUVqF9bGKPqsW39iH6LzgBQf6STHLl+9ztnXalCrFc=; b=qDOTPMHtCxdy7HLKcgK6Ds0Ful
	96iGEfWNR0ayEkLtXkInjE6RbuB8bZtxWS2zkLv0ByeOj7ghjJ2jAVINe15ETandOUzr9B11BUTL3
	wXNPsTd2EKU9eelrFhZHaKUQ/XaiT/F2cU0YMAZriPwRZM2Y4ZS8SY8ZLKcM4yhqUEDUHyCOxMKcI
	ZKtb36gsoOdYkq0jyDMBhY46tbBjVksJg/u18dp8BWyLQTeGaNG+VDI3Xae3FR04n3U5egpUoB9b2
	cetv7ovFI5LutSJbq55oWFsFIL0cBEUkDemqEz1jUb5bUr6Waa92FvG8i9HDlY0MyPomGcX+mqc7I
	KDI0IEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRKm-0000000C5kc-30qI;
	Mon, 10 Aug 2026 14:50:36 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRKj-0000000C5i8-28bM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:50:35 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso3014646241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373432; x=1786978232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDUVqF9bGKPqsW39iH6LzgBQf6STHLl+9ztnXalCrFc=;
        b=CaLCbp6B8ubaiFDa0bAxUlX7Jcdhv14jsaSFnhffn4lD/+w6U+VTzhM6vVN+AdwtJa
         3IlQOfGOr0npPeRNo/6aJ9OUr7E3b+hI9xIZtrtYfErZfd2bA3cQoMnQQfQP2Wj4sJ7t
         K8HSmkUiV4UX7LMdLHc0Z4XOJJKfJZGZ9UxkUOMBXf2bh+wiOEPKLC2QteBRNv5wYgDw
         QOoQVf/n69zHlIr1Mo6KnpZetBk8CPkYgfs4eaETGclwI/6FMeBdwNiVvuUfCSPYe4fp
         LDoG5N6s76XkWvpDn5gC5mKRUUGBQb4E9mmgtarkib9/NgmnbOqOCRKU+25yw9qWzVlx
         GYGA==
X-Forwarded-Encrypted: i=1; AHgh+RqO4sdIytqDvucSmDyYvv2FYXalEMiqAyVU7bd3JiQYKnnQi5OHaUCvfFh2VRUTpZaa41036ybAGHBgWUAjiV2V@lists.infradead.org
X-Gm-Message-State: AOJu0YzIC2ToBiugQ6GbtgcYONF2XUT7QPmMT3PF5VwEF0vVJn45qnKY
	UIKG2YKHcwGi6pLjnt8WoQettP/lq6afQXU/S1XIKVSwGc5s11FSs3bHP+MLtVdG
X-Gm-Gg: AR+sD129+r/TrJMHKvnYyoPCXLWtQe+xe6YPfMxE6XTm8frr+6IV1y392oMoNvbWpUc
	X+MpFS2xL8dSaBXwWSWPwkr4aZUxnvQaL0nrlFUL3ttTAGC0SgJU/NG+U/tqAIWnxA7a7a7G+93
	66aayHbuM4GZz0o7hCDFSg21GOcncv9VBERZMWqu49pORF2jWMQLuMsYHq6DeUnjbS5NnnmQbO/
	/EHMWszyGoegjd7Rf3Phq/1KoIu2Lzn2rRqnqp+eOt1djTty8n1933FWKlLXAAt3Mfzghn/LTPE
	pcT5/zRJCY1Wx6E2ejrF63kUcLyh8PlLk3zy2ncFaJ7f8elbkxF/jMVmOkVl+xvpKM/vdZXXxxi
	y+gHKm9fF6YpNd0mx8qSwnqb5M4Vk7IpybA2fg4rxivBFU69ZUCPBtaItiqAqtz3iedAg+/dWQ8
	SBNpPrM6ZO4ejhej0uTK45flsHw0QI7h/oe+w4hipiVctTvlM73j9dZ+rK2kSVefKt7BY7N3zPV
	Yb+C96En9bySgcgGuyebaKXpA==
X-Received: by 2002:a05:6102:3907:b0:613:3fff:febc with SMTP id ada2fe7eead31-7652028524amr2275430137.2.1786373431949;
        Mon, 10 Aug 2026 07:50:31 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fb6a7164sm4846337137.0.2026.08.10.07.50.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:50:31 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so1516162241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpkyu/qgBkfDYaCVPx8vCR+mhqsvjoSHLFhA4O3lOblWXhel2FtDT0GzMQdGOhrimhRVewGZBd276RenqMwkyUZ@lists.infradead.org
X-Received: by 2002:a05:6102:2082:b0:74d:5456:b6fb with SMTP id
 ada2fe7eead31-7652241d10cmr1596982137.16.1786373431244; Mon, 10 Aug 2026
 07:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
In-Reply-To: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:50:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
X-Gm-Features: AUfX_mzSDh0l0A6CyrHddRhefJg-h_HSruJEAkSrbmndCIqd_rMaLktXcM1WovQ
Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075033_590655_FB63C73A 
X-CRM114-Status: GOOD (  43.52  )
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

Hi Ulf,

On Mon, 10 Aug 2026 at 16:18, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
> On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series adds minimal support for the Renesas R-Car X5H Clock
> > Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacin=
g
> > the dummy clocks in r8a78000.dtsi with proper hardware description.
> > These two components are closely related, in the sense that they are
> > both supposed to be accessed through the ARM System Control and
> > Management Interface (SCMI) on the Ironhide development board.
> >
> > This series consists of three parts:
> >   1. Patches 1-2 add DT bindings and DT binding definitions,
> >   2. Patches 3-4 add minimal CPG and MDLC drivers,
> >   3. Patches 5-6 update the DTS.
> > Note that this series depends on v7.2-rc2, due to the use of
> > <linux/device-id/of.h>.
> >
> > Changes compared to v2[1]:
> >   - Add Acked-by, Reviewed-by,
> >   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
> >   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks()=
,
> >   - Drop fill_clk_map(), as it is not really needed until SCMI remappin=
g
> >     support is added later,
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >   - Sort MDLC nodes (alphabetically, by label).
> >
> > Major changes compared to v1[2] (more detail in the individual patches)=
:
> >   - Add default support not using SCMI,
> >   - Drop everything related to SCMI.
> >
> > Note that this series does not use or rely on SCMI in any way.
> > SCMI remapping support will be added in a subsequent series (old versio=
n
> > at [3]).
> > Full hardware support without using SCMI could be added, too, if anyone
> > would care about that use case.
> >
> > For testing, I have pushed this series plus additional work (including
> > a rebased and updated version of [3]) to [4].
> >
> > While I know it is getting late in the cycle, this work (especially the
> > DT bindings) are a dependency for about any R-Car X5H progress, so it
> > would be good to have it included in v7.3.
> > Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> > (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> > Ulf: It would be great if you could take the pmdomain patches (2, 4).
>
> Patch 2 applied for next, but I left patch4 for now as it didn't apply

Thank you!

> cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

I guess your tree still has the duplicate "default ARCH_RENESAS"?
Patch 4 just adds a single line there, and the conflict should be easy
to fix.

If you want to send me a new patch, please let me know.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

