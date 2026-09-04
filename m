Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983F6C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=; b=grdD+JXbb0AJOLLfwF2sgQ4fWa
	oQ6DjUkZcJ2Wv6rFBQte+yrsAvGMOK6U6davaVrtTtAEPAqYzagOvN5OLfK5e89sK0fnd2kAwPWdI
	wEmsWlc4+vTP2MVfILXKwb0GYDveSdAqSre2XrvRDqvn7Cmn4zleiFt5MQF98rw+gLIyLCLeuUWh/
	AJ4bKEzUhfCTkQ8D/Px9WEj8ixg8ieKBohm1J+oTejeX0oUcSxRxop6jtDvNmOHt3lNcp3/MFmsMg
	RIebI8iJo52dMVBDCRnDqiJc24BYTZnGUBv5P9cbxt+InZ0SxZ8TTIEsZpYAwxM+EBpYNKfyDovU+
	A5VB/HBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WpC-00000002k6r-3G8p;
	Fri, 04 Sep 2026 16:31:34 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wp9-00000002k4T-1TBA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:31:33 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so389142241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788539490; cv=none;
        d=google.com; s=arc-20260327;
        b=HZ0DHWURjyoGvnafMJOfSphG493/Av3N81WmtdiJl04Vse6xM0h/Rfk+RfKRpdtCfB
         BoQphfdb+0zfYW3CG5lNp+XEdguwCwK/+RWdoIgTec7aUeeWvFQMsoLoCrgapl6e7T9M
         fwkhE4WmWxKWX5aObdPYDD7EAtr4xer6ZbXP586cALhOGgOFBua+wL1tjxlkPcQ6zRpZ
         J5AC2/DQf2eEAPa0U6upfOEETFyjLnciBiealLKmLOSnCZ+xUM0eRUHs8SG1PhXYTFtX
         0sW37JJ1pKZBVIeTfN/k67H7O/V0ookMWwzdC5ibz2Gd32LnkxKw80CVU8BlX3kqw8yy
         ProA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        fh=hAzwdLBeQoDh6QKCGCMVxzwTgbQyBJ02V1toQ0ZaS3g=;
        b=n28qFkr64FesfLRjdF/NTXVIsGQLo8U+O3JGKruEuVUAbMrkWSFUp5Pl0gq/xU0XHe
         +LkkEs8zMrRsxY2f6xwT/WtHBvpA15nATk7bvdsR3Uwvl4Uyne6fwPIctcoB1CBeJw3p
         OVSV1XLMsGsUlg6LGGFbU7ZrmMDzVkatT6HEjkOklcmWzdCiwleIuCa1rRvo6OSrVYfl
         vCXn0RzRw25mdxvLFDWRL/CpTtQXVibqu15YHgn2aGbZBCE7ccXsmW0HPsE5mnNV7YDv
         lJE+6JjUQNlOmb7mWzj8q8ZtfIzvFh5t5L8N5OQZOIOm8HdyIFtTNnJZfqoHP1VxkWME
         I6KA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539490; x=1789144290; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=QiLDnnZD9/CQehw45szf+NQNIBJGZ2IIjiwUVo2PsB1NZBladNw/WQQYTv9ulasmt2
         sVqey8Sn2zi8KgNIaCbhYo1QGewVgHkRH8YhbaynuZE3h/m+9ltSQVf6MDERlysrSeT7
         wc8YxcS2+y6HR+Re0AeqrnQBscOZ6XUwkbV8rhfPPpYIRLmni+axxu7NmVCMHcHwVkzz
         WedMDQZqYCt81JCl5+v/5frSmKlnCnFYuTp2ozJncgVtfHQ7bZewmHM2VZmd/ANt/MtF
         XKbw6miGLQyqL52LLXzsgSSBQ3l/eomgAPHWEivjI/Ty78qxDmmJo7uJxqB3GZfMWQb5
         hOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539490; x=1789144290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=T+zxoCaXSTa1h/uiptI5G+1xLIvGfD52heIJ2UW0l3WCr7ya6znwHdb7Np/iGbjmFG
         5wVFso+7tSc4iT68p/jXqLlnSu7fJaACs0NGZ9g91zZitIcrRFvwYwvRfLq447OdbeT4
         txtWFkSuTF5kU0M/+6yyisr/K1RaSyAwIlRi4xC0ELUJ+FpYgqSmjXu56sViTP0zTYEz
         A0q3Z5jUdC4jrGDjSkrI5HzaI1pg+D7U/8q1ehJYSwMeWv2aDZKT5KiXKMpKsVrU79hD
         2g1/e3U4v1/LJSQkwDaG4Ztz7Mi18matovItnR3PL8kii4oaOwtIu8QlLSUdEqzPW440
         iC3w==
X-Forwarded-Encrypted: i=1; AKwUvBz2ri8MgZ9X4QHu2za60MAqST1ltn7DEmPfqsTdM9TGGsRsFz5GF15QoBXbLqf1aCNb5ey2jHzpvlO2EK5fnebi@lists.infradead.org
X-Gm-Message-State: AFuF++nKvxP4nSA4AyubYfiZgOcsoFfOpzeVdRigCITyHXLaOcLTNx+J
	D/MIOSZkIhz3A/exYcGLUrjdlqTibe5prffBXAyQfQDazCJIV7v7SLddmBxCmBtqXNg7vOJu/1Q
	CRqCGdELjk0C21EHF3PgoN73OmHRpK8w=
X-Gm-Gg: AYBFou0vftUW/XX+sTb3rkDnhO2Kuid+iErO5dOzERYw9BPJNVFOX3Kcg5MrDbnbSxk
	fGlv/v4btikvIa4AsVWgz2hVPCMmZ76P9y71f0RLIwmsBUl6oJ3JLzlY+mAN7OwWX31J9xKJpxN
	Z5Oqqjw9LUa8Hfn5UaEQ4/1zo2PEk4HFJCu8GEXvLn+E4Ky2k20Np8nNjc2AVbtZY8DmqHqdZiu
	4/HZ19faPaZhnCYsmeE6BeTk4z5erkWKNWNebrBntNf0052YEwhYnJH2jJtowZHTqBhtcFHBL6D
	yYsj0gGBK0deUBmLL+zybIj7C4PMajt332fpp0iwbD31Top50OWWJ00ztRNuZ7Exk1DQ05CGnrS
	mCUj3JELFmshJo0Mz5OCjn18wjTZJVBu7PrY6dbinLhozc3KQiiyCdYNB6Uvpv1rKs3BSkH3Td4
	GC+XQkgFpbKKOkklfqCoEYOrGq7afazRjXB5RybtTUOsM9RUHuzw==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id
 ada2fe7eead31-78a4a6f61c1mr2282968137.6.1788539489982; Fri, 04 Sep 2026
 09:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
 <87se3p13jy.fsf@bootlin.com> <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
 <878q5h11gu.fsf@bootlin.com>
In-Reply-To: <878q5h11gu.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:31:19 -0400
X-Gm-Features: AcwNN1V5YDZSFNMjnzJoP1G8O-i3NIxVjKyBABCYlVfSDwIJgBSeFv9BnhDuMNw
Message-ID: <CADvTj4o4Rwcmy7ByuBcpcPkcXctvgB8Tuda2_7UV1v=vx7JwRw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_093131_424330_37AB05C5 
X-CRM114-Status: GOOD (  29.78  )
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

On Fri, Sep 4, 2026 at 9:27=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 04/09/2026 at 11:17:46 -04, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> >>
> >> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.c=
om> wrote:
> >>
> >> > The controller randomizer covers the bad block marker along with the
> >> > rest of the OOB data. The driver currently compensates the marker by=
tes
> >> > before writes and after reads so that they remain plain on flash.
> >> >
> >> > Allwinner NAND firmware instead stores the marker through the
> >> > randomizer. Media using that format appears to contain bad blocks un=
less
> >> > the randomizer is enabled while reading the marker.
> >> >
> >> > Honor the allwinner,randomized-oob property by unconditionally enabl=
ing
> >> > page scrambling and leaving the marker in the randomizer data stream=
.
> >> > Keep the existing plain marker behavior when the property is absent.
> >> > This changes marker handling on all supported controllers; the H6/H6=
16
> >> > protected user-data placement is handled separately.
> >>
> >> But I think the reason why this has never been done is because it just
> >> breaks raw accesses, including the BBT reads. I don't think this is
> >> handled, is it?
> >
> > From my understanding raw access bypasses randomization entirely.
>
> yes, so the implementation you propose is invalid, raw reads shall
> show the BBM. And also, when accessing a BBT, it is made in raw mode,
> without randomization, and hence totally fail. This cannot fly!

I may be misunderstanding which raw and BBT access paths are at issue,
so I would like to clarify the expected semantics.

The allwinner,randomized-oob property does not alter the per-operation
rule controlling the randomizer. MTD_OPS_RAW still leaves the randomizer
disabled, while normal ECC operations enable it. The property does set
NAND_NEED_SCRAMBLING, ensuring that normal accesses use the randomizer
when the NAND does not already set that flag.

The property instead selects the Allwinner firmware's physical
normal-page OOB representation. It leaves the BBM in the randomizer data
stream and, on H6/H616, selects the firmware's protected-user-data
placement. It does not change the randomizer algorithm or seeds, nor
does it enable the randomizer during raw accesses.

With NAND_NEED_SCRAMBLING set, I understand the current mainline sunxi
behavior as follows:

ops.mode   fd mode  ECC  rand  main data       OOB with -o      nanddump
---------  -------  ---  ----  --------------  ---------------  --------
PLACE_OOB  NORMAL   on   on    corrected and   de-randomized    -o
                                de-randomized   logical OOB
PLACE_OOB  RAW      on   on    corrected and   de-randomized    unavailable
                                de-randomized   logical OOB
RAW        NORMAL   off  off   physical bytes  physical OOB     unavailable
RAW        RAW      off  off   physical bytes  physical OOB     -n -o

OOB data is returned only when the caller supplies an OOB buffer. For
nanddump, this is selected by -o. For MEMREAD/MEMWRITE, ops.mode
overrides the file mode. Stock nanddump exposes only the two diagonal
cases:

nanddump --bb=3Ddumpbad -o /dev/mtdX
nanddump -n --bb=3Ddumpbad -o /dev/mtdX

The first uses the normal ECC/randomizer path and returns corrected,
de-randomized main data followed by de-randomized OOB. The second sets
MTD_FILE_MODE_RAW and reaches the raw callbacks with both ECC and the
randomizer disabled, returning the physical main and OOB bytes.

In current mainline, that physical OOB contains a plain BBM because the
normal write path compensates the marker before hardware randomization.
The normal read path reverses that compensation. With
allwinner,randomized-oob, the compensation is omitted, so a raw read
remains physical but returns the BBM in its randomized on-flash form.
A normal read returns the logical BBM with either representation.

I do not see the current BBT access paths selecting MTD_OPS_RAW:

- nand_block_bad() calls chip->ecc.read_oob();
- scan_block_fast() and scan_read_oob() use MTD_OPS_PLACE_OOB; and
- read_bbt() uses an ordinary mtd_read().

For sunxi, ecc.read_oob calls ecc.read_page, which enables both ECC and
the randomizer when NAND_NEED_SCRAMBLING is set. The internal BBM and
BBT paths therefore appear to receive the decoded marker rather than
the physical randomized bytes.

Could you clarify which BBT path performs an MTD_OPS_RAW access, or
whether I am overlooking another path?

Also, when you say that raw reads must show the BBM, does that mean the
BBM must always be stored plain on flash, or may the raw interface
normalize just the BBM while otherwise returning physical data? If raw
access must remain entirely physical and the BBM must simultaneously be
directly recognizable, does that mean the Allwinner firmware's
randomized-BBM representation cannot be supported through the existing
raw NAND interface?

>

