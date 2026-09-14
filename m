Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0943FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 22:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=; b=RvN+jaKpA82YfxkiHLkJoUTnKo
	PedjAazbHjsk9G1NE+hxGROV+I0LwPF8qus87g2LwD4PwIHGI2k27jwbXQ4q5cZRsVpeXr4Nzfh3T
	NtrMTrXeRP18cYD2yN5Kwav9J+i0X0Pi671Uu9P4+p+mttJASbI+szkF+Ju3kEJcxuhHWWhCIQLEe
	fWeP5ML7KJcWBQM363vRvhE19jkk3FcyvwcW5+pLlq+5BNjid6eWKQrjMfI8mfI627i4POqrGwwCx
	meIhrNahiBuyTUVY87XJzwEd3zpoOIrBlp66WwlfcclSLkYyBR10CdoWwr2NXJS6Nh3OjAtTkfh2J
	M3aIAnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FUD-00000004ocI-2cq3;
	Mon, 14 Sep 2026 22:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FUB-00000004obw-46PF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 22:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=; b=I9tMKJZKgmke8d9/ozDSZ9He4p
	A0RnCLAmcz/togMHNuuqEc1yzY1QeHjmuvf5E3TpqyZBqlPDC/sXociPRic790IATsBmvlFOTVHRa
	cj/KjAPTyrFYH/lWfjsYoGy8sdbqjLS8kqi15TIox06IhYXvK6Su6BPAb2/LMaTzd1l/d9AwtbT6a
	uNaUGArlSGJOpGgaCZryIp3XglqNkL2k2Tcq4NrbjrTGMpuCABMPt9ToUuJjzDo/0LpQU+FzTrCAf
	nNRKIOYI20kcEAzT3fyhmvwyoUsxjR4zzz7NxaUnP4Smd/LXZmQnV8FPLdz6vjc0pjIai3j4i3d/U
	IEqJUZHA==;
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6FU8-0000000657D-1Byu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 22:49:14 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-982d6efbeadso565808241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789426150; cv=none;
        d=google.com; s=arc-20260327;
        b=RIRivoqV0HJi4vfBHVzety37K+mpXmIW1VegNvqJZ3Rw3JL2egk5P4SqVZB0Pkbh4J
         UJhGRJ4wlrHCBi9Xv0QOU8/08/4M2N34JJPGX9iExK1bs4yGCtLdI8wz6L39MYwJzWxE
         2hv4aMUGq6VJ89o7lfHGeFa1AuZ243TWCkJFaxyxkf+XMoOu0lFxovWxhI+/GsRM3kho
         spMPZvrEflli/+QebeqGYDKWHKn3o1XLVfghKM/d+hSgXnKpktZ39d/oz2o0BxuMVcng
         pFozfQBv8OZ2WZTlAYTy5TuWRvDWtfmH45DM2MijsrLI0txlDB0GzI/3LXlWIxBSAqaY
         QCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        fh=ypfPY7XZ0P/Nc+mxMvlX4HP1oSKt9YgUvScuc52lhbA=;
        b=ekFRj8Wx2JsDLZZlGG0F6u4MxxkRY/zN5TIV5McjGTqFb2BNbMEOxjaneOz8rq4K1v
         GZw07F+OS+WTEoVScHQKcnT1EslCpDW0kWBQqnFzfAHWd2lYuVjUYHv8JdBeABFHJmMq
         EuqrrnzLOozW7K5vmMmIamrtdgTQ54qrowqDi4bRir1n3DaEFvr0iMwj45G0iQ4r8bBf
         gcHonvQb4NTJkhk5/4nJWBZ7YZvge4s5UpIEtZIJO24JtxZTLOgnBdD3xPcgisowqzn5
         ZnG5scm9ow7bw87IqTwL0ihhNADbwozejhL5kg3WuSOZ5Wz/z7BGchpSHlgSHZNQkoDc
         C5pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426150; x=1790030950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=aYQbpbbO01LqYzCUorJH0/G/59xObTewJcuCpjU8CvVbMShAXv+A772KTmdZmUJIHx
         afo9W1V0PEMnkffgt8DteMSkpP+//jTru3gcTa6vlTajyXRUsjsqPwP+fOIqtTxUF//u
         +1HzQ+xkEYiMA++XKibwdLzlNBYrOdTsxJvEXNhl8oKkMgsTkjNkSM8LblUrDzwqnge0
         gvfRurEi0VQZI8NYvP709Vq9NZb+kaaK01SR5pUqFAhBQdc442MmwC/4FquO7nT7P+t5
         nQydw/A9uHtX46HoBcPq/DQM0J7Q9m7u47H/ehx5A1q7jD9bk/rQv90v3jSsSw/GkcI0
         Ue0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426150; x=1790030950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=lP3astf/MJJWFm0Wj4brUINIAeXKagYQSBk/94iI45xfUg+xa1vdnKXpUQ7uFsqafa
         7CSdZBljiIUrkh/aPwCtuKEAKiQFAhrqzlLtd68oTV0qxoU/nnWrukVWHyepLyQHyIxg
         J5l6YUKMGN8MNpeS9F3VJmXdytpz2gUwxRn4WhzifS0KjVzd60ToMFmQtT4e7Ip4KaGi
         xR5Us/fVeSAu1M5uGHBlD5H732Wdp/YurJhJrMvurS/oAHrmlm+YQElVGq+nBD9TMNkI
         0LnLgOY00tssER+pdBSr+wj7ijgx6XoNIwooEq7jj9jBqJKkz8sTzXFy1nVQL1Kgxf8f
         bIIw==
X-Forwarded-Encrypted: i=1; AKwUvByulPY3Izz3beulwB9j6bp9eq4qPCMazdvHj3o6I14lw3p5thGCHh8TvyEMJdhc9PftIWEPkf2okEweD04KwQm0@lists.infradead.org
X-Gm-Message-State: AFuF++npkReSZigC67DKXMEENnYklyO4aUzVZ1jqPHkJZikb1PSNZYO4
	fRlIjXhTqBo+j5pZh6NnvjgQl+36mFeRUSxdUlIIjD6+FxQmy/N8575gFUYrJIrT21TSKqPxGTt
	Opyo2KSsJ8+4XVtYB5K9GVXrAA7VmoBc=
X-Gm-Gg: AYBFou0maki2+57puvHwUhGrOOkQinpSx356qH+yhvG7SPhSBRnBB11D797WboQIBBF
	aNOJ0A5mxo5GpuMXsFlThq2SlGcSfH3StApvaKoMriVfNM4cbGHXmr/7SZizTdgEXYvkVZuHFX6
	2fEWxWq2R3zOf59GFjfShXoH2xivH43s7AeeMZlmCYgcOV9RzhKdS2gNKvT4zPboonInIslIltf
	uo4H9SfXbgIl4MsLtBtcVrI8eaZ/PkD7ajXLOQAwfV+OokGU4lzRTJ0S/kcxIMv59qM+Kp0u3/v
	l0TDjgRVFuOc/1ZwldSuv/l/tdOKj8qCotGfPH8CwCz2GOcaw5FFk269KTBwfN4RN9ZJJ3CunXL
	9OW7p5lnVFe5V84uD8tsKIaD9EahRJcjbTPwAp6UXWcQruJ2QX73HeyKiEjpd0uFPRXMh10h99o
	L96zXr2CmvzByWvxw/UjC7zEG9YgbeNDx9L/2C1UqHa059HvXB
X-Received: by 2002:a05:6102:4492:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-79b60973580mr409096137.12.1789426149941; Mon, 14 Sep 2026
 15:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
 <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com> <87ik4fu4fh.fsf@bootlin.com>
In-Reply-To: <87ik4fu4fh.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 16:48:58 -0600
X-Gm-Features: AcwNN1UlC9FxjgijfoClAvZzNG8RBzvUoNkXu_nF9VDV4LFTu4fZlyRKfp3tTWs
Message-ID: <CADvTj4pH8KvTmsxOXO8JQYCQmKf2OA__eqvYXrM+1=vjq0368Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
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
X-CRM114-CacheID: sfid-20260914_234912_856989_C66E998E 
X-CRM114-Status: GOOD (  28.09  )
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

On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi James,
>
> On 04/09/2026 at 15:22:12 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The controller randomizer covers the bad block marker along with the
> > rest of the OOB data. The driver currently compensates the marker bytes
> > before writes and after reads so that they remain plain on flash.
> >
> > Allwinner NAND firmware instead stores the marker through the
> > randomizer. Media using that format appears to contain bad blocks unles=
s
> > the randomizer is enabled while reading the marker.
> >
> > Honor the allwinner,randomized-oob property by marking the NAND as
> > requiring scrambling during normal hardware-ECC transfers and leaving
> > the marker in the randomizer data stream. Keep the existing plain marke=
r
> > behavior when the property is absent. Reject the property with software
> > or disabled ECC because those paths do not operate the controller
> > randomizer.
> >
> > MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC an=
d
> > randomization and expose the physical representation. The raw-NAND
> > core's bad-block and flash-BBT paths use decoded accesses and therefore
> > continue through the hardware-ECC/randomizer path.
> >
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I believe it is still not completely working. If you look at the error
> path in the read functions, in case we face a factory bad block, there
> will be no data, we will face the "page is maybe empty" case where we
> still address columns like before. Since data is randomized with these
> accesses, I believe we would return errors which will not be interpreted
> correctly by the core. The discovery of the factory bad block markers is
> thus broken during BBT scan. But a BBT read is also broken, because even
> if errors are ignored, we perform pattern matching on data which is, if
> my understanding of your implementation is correct, not de-randomized in
> this case.

The erased-page fallback could overwrite the decoded buffers with
physical randomized bytes before the core inspected the bad-block
marker or BBT signature.

In v6 [1], both PIO and DMA preserve the main data and protected OOB
from the original hardware read in randomized-OOB mode, including on
uncorrectable ECC errors.

Erased-page classification uses the controller-specific vendor
spare-byte heuristic without a raw reread. Accepted erased pages
return all-0xff data and OOB; all-zero physical pages instead retain
a bad marker and an ECC failure. Other uncorrectable reads retain
the decoded buffers and report failures through the ECC statistics,
so the core can inspect the marker and BBT pattern.

I verified this on H616 using the actual NAND-core BBM and BBT paths
through PIO, DMA and forced split-DMA reads. Signature searches
retained the decoded pattern despite ECC errors, while table loading
rejected an uncorrectable primary and successfully loaded its clean
mirror. Correctable protected-OOB cases and BBT creation/update also
passed. Hardware validation is limited to H616.

MTD_OPS_RAW remains physical, and the existing plain-marker
erased-page check is unchanged apart from the prerequisite
error-handling fixes.

The series grew because this work exposed existing bugs in the shared
PIO/DMA paths: error propagation and cleanup, IRQ/completion ordering,
OOB indexing and program-command handling. Those fixes also apply
without the new property, so they are split from the format support.
The final patches are separate optimizations.

[1] https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v=
1-v6-0-2fb084fe0751@gmail.com

>
> Thanks,
> Miqu=C3=A8l

