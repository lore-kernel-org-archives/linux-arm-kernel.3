Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B85CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJlK4WkEfRbWEw3zV/b5T4Bu/Nyg8DEPoH+DiAjRgFs=; b=TaS8IX/uSNa2srm7RM9ksBAMRQ
	++jHYaF1tjGgNvEYClYe9fv3JKDWOyxduhZ5vM6RGr/bk0+XDrUUOIkJoOsi6EvG8K9gpQdZTLAJd
	jnqnOXOOkkPVDDmpMlzV9+mPloGMgu7E2AxJKaLOIlUY9ZdNYa/esM9KAjYhFTCP6cyUlkVZxWG2c
	d8YLiyQknq6RBCnbC/cm9SVuIqOPUzgFfBgQZW7OzdME1VNxJ+Wxg2qj8JGEpaq0fsqMgYSRj8AEE
	URi6dEjz71Nvuu3+NcYgXsQ7qKFK0UOzCQXfNljJ/WWFNYC7eg5Vp05G7w2JmayabiMcGb9/zd6Io
	nZG/SeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaaG-0000000C7TY-2Q1A;
	Mon, 24 Nov 2025 17:42:40 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaaC-0000000C7Sd-19ER
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:42:39 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ee1939e70bso43729011cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764006155; x=1764610955; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wJlK4WkEfRbWEw3zV/b5T4Bu/Nyg8DEPoH+DiAjRgFs=;
        b=IXSf4VedzHsjPeddTT6I7erSptcCUY3omGE7AuZ6O3mCr5BgDFAmzL20C43FBTyhnV
         W3Hs5DpGyITj1OU7/q2t2dfKLCKtrPa6oqr7RpVwhFP+Z35OrSfiS8jY4mr3jOxolAer
         rVRtdWq3I89ZYfXi8wypYg7EmccW2bIW00Ilqoxm+pqyue3bJCI1eiy5bGFCOY6qRaFt
         APEct51P4a8GHB++V7KS8BVxb+oICGbLZ3y3qoFqxIPGZRNN/TIZrXJUom84AS2ZYBnP
         C823dbYNpnpeSf+azQMGF8MUFc+USnZ65EK9Y/p+AbMSi8el/vI6FM9LHHE2ebTnakjc
         GPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006155; x=1764610955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJlK4WkEfRbWEw3zV/b5T4Bu/Nyg8DEPoH+DiAjRgFs=;
        b=ddLSOzGH4sZ/7gaVzjgFtqoz8QeYnQYB4Vq9k5EuasBctL+G/vjrbW8rpZdybiS87x
         kkfEegChKgFYSS8q84n66XEnhDYaHpTctPAGyD3L14f66+rEYnsFiF2dJglM7sodizAc
         +3mwPRgZqK7YmSLKc9rjFUcfxmArnQRcMg6M/IVOfpV+78FVZ73p7yebPnSelaWg/bB4
         OmoD3K3Gpd+bEaV9Jz3slNcvSoxNztsbd7RBgTvpwTsjtKTm3Jj8XNj+vmte5M4kEMYH
         t64uidcH+eHvZDSMVBOBeCYfPLiaYTLshDYubPaUBRYKrGiLRCTpVe2PVreHM0lsYIoC
         HaEA==
X-Forwarded-Encrypted: i=1; AJvYcCVl9DqCsrK3Nc1sdRwlUOmfrJ1LBBGfwk8DzaInUkGYxPu/tIgCFZpnxu/mgbyKODUvQix3n90oKE7whM/NYl0C@lists.infradead.org
X-Gm-Message-State: AOJu0YxhhcFsrxHB2Yc3DYPMfmBsX+zl6+bBiNDhNQ5VQl2gKYtjQWn4
	Zgu2ug5B0l5wyk2n8VurRa19e9YEF9QZR6X4gN3q2+q70IXqsptIhKda7uGE/sr8a5sM7T1UJ00
	ashJoXoDIcrg2ofL4XskKHbhEJa+fRB0perksHy8OIg==
X-Gm-Gg: ASbGncsG4yRbmedZeaU8O5+ssQpGmyo34KN6sNQuROS9XlWieAz2cBXyICOj8QESKX1
	5BbRjNye6GxZ4VTD7DiK2M41+tBpsN6fsxVcV2upSNhJ3QDfv+Wy3OJ2XgB8Pg5Z97MeZmFuesU
	r8aRQ3CFKx+4d4pJOEyibQ9pavfy5hM74BHcDuyRdvRxR1HUkxSbQ6xhEE2wjaB5q61gqiAlvxX
	/7druahN5AOPX7AT71RNN/Kwa3RDtFOvqmUCd5isH/zJiloSl2npMmsbCbSY7T2XtL1wxY=
X-Google-Smtp-Source: AGHT+IH68eFLCxGAwB70YXKDcrzscx1x/5nopbEjXq3rg0i05BtoHBXKwXgwKJ1Je/SGb0RGBvXAIWmKGfE/9kaXr84=
X-Received: by 2002:ac8:59c5:0:b0:4ee:24e8:c9a1 with SMTP id
 d75a77b69052e-4ee588908eamr163978631cf.44.1764006154636; Mon, 24 Nov 2025
 09:42:34 -0800 (PST)
MIME-Version: 1.0
References: <CGME20251117073601epcas2p2c72bdd8689a69b35b988894653300c75@epcas2p2.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-1-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:42:22 +0000
X-Gm-Features: AWmQ_bkIQmeVVQ1__i6Ji95mfG_JBQNHpbx1ya0fFzrMqWuIcxJaF_YHxRYrtX0
Message-ID: <CADrjBPrPpgy93At1bBanBoka14eyRbAArep5zuvbGWcOEnOuRQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 0/5] pinctrl: samsung: exynos9 cleanups and fixes
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_094237_836581_64BA64BF 
X-CRM114-Status: GOOD (  22.17  )
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

Hi Youngmin,

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> Several SoCs carried near-duplicate pin bank macro families, making
> tables verbose and hard to share when only the bank type (alive/off)
> differs.
>
> GS101 had its own helpers even though the newer EXYNOS9_* helpers cover
> the same semantics, including per-bank filter control (FLTCON) offsets.
>
> Some pin-bank tables didn't match the SoC TRMs (bank type, EINT class,
> or bank names), and FLTCON wasn't always at a contiguous offset from
> EINT.
>
> This series does
> - Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
> - Fix table errors on Exynos2200/7885/8890/8895 per TRM.
> - Add explicit per-bank FLTCON offsets and update affected tables.
> - Drop GS101-specific macros in favor of EXYNOS9_*.
> - Rename gs101_pinctrl_{suspend,resume} ->
>   exynos9_pinctrl_{suspend,resume}.
>
> This series was based on the pinctrl/samsung tree [1].
>
> I tested on Exynos850 through boot and verified the pin values as
> follows:

One thing I just noticed is exynos850_pin_ctrl isn't actually setting
the .suspend and .resume callbacks so some of this code won't be
executed there (specifically saving/restoring the fltcon register). If
you're using e850 platform to test this series, you likely want to set

.suspend = exynos9_pinctrl_suspend,
.resume = exynos9_pinctrl_resume,

in exynos850_pin_ctrl for the alive bank

You can then #define DEBUG in drivers/pinctrl/samsung/pinctrl-exynos.c

Recompile, and do

echo platform > /sys/power/pm_test
echo mem > /sys/power/state

and you should see all the debug from the newly enabled exynos9
suspend/resume callbacks

[  871.104840][  T741] gph2: save     con 0x00000000
[  871.104932][  T741] gph2: save fltcon0 0x00000000
[  871.105022][  T741] gph2: save fltcon1 0x00000000
[  871.105109][  T741] gph2: save    mask 0x0000003f
<snip>

Prior to adding fltcon_offset and the gs101 (now exynos9) specific
suspend/resume callbacks this would generate a SError on gs101

Thanks,

Peter

>
> $:/sys/kernel/debug/pinctrl/139b0000.pinctrl-samsung-pinctrl# cat pins
> registered pins: 42
> pin 0 (gpg0-0) 0:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
> pin 1 (gpg0-1) 1:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
> ...
>
> Additional testing on the affected Exynos9-era platforms would be
> appreciated.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
>
> Changes in v2:
>   - Added base tree for this series (pinctrl/samsung).
>   - Renamed the macro parameter from 'types' to 'bank_type' for clarity
>     (struct member remains 'type').
>   - Reflowed commit messages (wrap at ~72 cols).
>   - Replaced non-ASCII characters with ASCII equivalents.
>   - Collected tags:
>       Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>       Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
>   - Normalized hex literals to lowercase and removed double spaces.
>   - Aligned backslashes in macro definitions to form a vertical column
>     for readability.
>   - Added missing mailing lists (including linux-kernel) to Cc per
>     scripts/get_maintainer.pl.
>
> Youngmin Nam (5):
>   pinctrl: samsung: Consolidate pin-bank macros under EXYNOS9_* and pass
>     bank_type explicitly
>   pinctrl: samsung: fix incorrect pin-bank entries on
>     Exynos2200/7885/8890/8895
>   pinctrl: samsung: add per-bank FLTCON offset to EXYNOS9_PIN_BANK_* and
>     fix tables
>   pinctrl: samsung: fold GS101 pin-bank macros into EXYNOS9_*
>   pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
>
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 1069 ++++++++---------
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |    4 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   97 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |    4 +-
>  4 files changed, 562 insertions(+), 612 deletions(-)
>
> --
> 2.39.2
>

