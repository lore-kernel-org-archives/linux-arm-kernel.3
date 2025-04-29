Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D7DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YC2LGGpE70kiPFeCCi72EkYRfCk+pYT/yGe+VdlkBmI=; b=t/+ImzXlrsI5Q9S6d3awGbKvhJ
	vYFST6FExPPSIypMz8Sv8FKGbh12HxAAGtNOkuOKlghrWhkw4972KFgDHidkDCRy68HBIw+1bWXo7
	PKNntzEsrduKG30HVmhfITUBl0WiihL8eA0htQi6CR1cuPlpjf8TRKUNnDY/E3YrBOnMCC5DDbk4b
	VMwDlTUOcuqsJ7+6s1aWp8dzaRG1fjBK9TX3PElcUaRsm+2jAHWCip25rfPGm8leI2de3D2V3tt2s
	eISAuDK9D+TtIw8wknxlUpnCkGK589oeovmgbGCQOqm/QbskVMXh4PeQE9rvu8v5R0OrAuY0R+MK3
	cmY7Cfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jdO-00000009aaV-22Ew;
	Tue, 29 Apr 2025 12:00:22 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jbP-00000009aIq-0NE7;
	Tue, 29 Apr 2025 11:58:20 +0000
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e6e2971f79fso4564281276.0;
        Tue, 29 Apr 2025 04:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927897; x=1746532697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YC2LGGpE70kiPFeCCi72EkYRfCk+pYT/yGe+VdlkBmI=;
        b=BCcw++fGJudhrYs7H0oY4t/SPNNhk+mKuEzOY5QnM6UnwPVPWC/CvvuBktontzFxz7
         apXnTy5yx6Jc6+BZ78j5YFpJXdJGmecqnOIRHzkg7lPEk9klHgLYfRvuZhGcL84HtXeR
         i5jQyqv/5vAYNG8yyd988gktebpzPTajy3dKc3z3jVvmUdoNLEL35LAxfMBVr33UHTkG
         lQP7HGj/tMq0XuB8iDtDiaJrPrNzt/hVZlzZ9jA6N61HlG1yltPqpzXasSANBXKWlCkN
         fbKsn+hSaMYUTEKT/x8489nDyVfkDridPeUoEdF/Fwt7nlpV5zdp5Y7+mSJtI2rD74Pr
         aIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927897; x=1746532697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YC2LGGpE70kiPFeCCi72EkYRfCk+pYT/yGe+VdlkBmI=;
        b=FD6FOWUpSnz3x7oNyxsKVXz2XTvWS5qySWVVmk26bQM5wtMRYIC7Bt/VeNDBv43Bdj
         FjPQ3r6gu2bUiqBvdGCQJXeNwypOrAhIr3W2goZ5wT9u3DILK1PMmaimDAq1GiDkDjff
         89zQ88lmp0KzNqDQdp27sXyduY5h84ZyvA+dEyEoLZV7iPIk4oa3JYsSSoOjDGQYtDNa
         KFhKGC19UUgUXxRm5EiBbiuawKbzoY3CWQYpNWm999U3dUna+EONlWAttu3MZQ2wOEr7
         uXq4+c6LCJqnsM/Msaqow8j09Xf9zgV4bnuhN1saXoT04oSCsqwaSDbHRlanBf6Md+0o
         7/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5BMhbVntJKYxZRZcDEU/hw8e31EUQzJGcxg6OYfWvfRq0e0EmI0H/P93KggUDSE7KISn6pN4ireEz@lists.infradead.org, AJvYcCWCX+2NI4tp4jdFXVFnoLLkNZeCUpvMigR4ZX520cCvTsLfhMMZoCF3T+2+kNuu3PXqRjBO/nNj1rvWYpdE9Ld+@lists.infradead.org, AJvYcCX11qCEBPmlJbd427DJNWLaw6e1OoMjd+8uITFlxfWhs+NTArt94bauGKtcMGRHEt+C1R+cYdqvTvYYzxYe2iI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzL0iz3F4eFClS2by28btPoYwL/oidRwXyPdD1/nzGQbk5Xafel
	idlERKItvWC1zBpmlvR+saG0ZVLuc089Y7SGUy98mpzvAhI7O7crD+NHSBIBksEWfmLkrMGKSbm
	DYX56G4C58tKpwRb7eq4TWl2VQTA=
X-Gm-Gg: ASbGncthGey3N0JGet+8ekA+GkIC0n5BAmLy8CcXvOw23XgZMYvBVOEqWphNnAF4K1R
	XyeI/3jmhTtrrKam6MKFbDHOoz8I3X7A1tB6xBYncd8IE3V1s19u+MgFfoG2oh4DFDSusUfirSr
	joVp8v9QLcPh12NcaqACp/fg==
X-Google-Smtp-Source: AGHT+IFZuUpUcT0FpWh/xFcN7YV8mTmhhmd1TfDP2Xpd6GzqIj7t/GP6ENv//lBM+JolYrLZVqHMwRl7cIw868ZvG+I=
X-Received: by 2002:a05:6902:2085:b0:e73:9d0:1823 with SMTP id
 3f1490d57ef6-e7323472933mr17628295276.47.1745927897185; Tue, 29 Apr 2025
 04:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
 <871pymtab3.fsf@bootlin.com> <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com> <87bjsfv0x1.fsf@bootlin.com>
In-Reply-To: <87bjsfv0x1.fsf@bootlin.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 29 Apr 2025 19:58:05 +0800
X-Gm-Features: ATxdqUFw156jElhjP-eZDXnKLbf_YdyLPXPeNQmy3SBNzsMbmjDF-l2toZGqZGM
Message-ID: <CAJsYDVKiMeYY2rw_BxuW4BAxvMcq5hDwzhiPoAR=tkXzZpRYiw@mail.gmail.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and then
 update_cache in write operation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>, 
	Chia-Lin Kao <acelan.kao@canonical.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Steven Liu <Steven.Liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_045819_133153_A6093AA5 
X-CRM114-Status: GOOD (  34.63  )
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

Hello, Miquel!

On Tue, Apr 29, 2025 at 4:15=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hello,
>
> On 22/04/2025 at 09:38:26 +08, Chuanhong Guo <gch981213@gmail.com> wrote:
>
> > Hello!
> > =E5=9C=A8 2024/12/5 23:32, Miquel Raynal =E5=86=99=E9=81=93:
> >> Hello,
> >> On 19/11/2024 at 17:39:49 +08, Sky Huang <SkyLake.Huang@mediatek.com>
> >> wrote:
> >>
> >>> From: Sky Huang <skylake.huang@mediatek.com>
> >>>
> >>> According to discussion with Miquel Raynal <miquel.raynal@bootlin.com=
>
> >>> and Chuanhong Guo <gch981213@gmail.com> on FORESEE F35SQA002G patch,
> >>> Chuanhong recommmends that we can use the following sequence in
> >>> spinand_write_to_cache_op():
> >>>
> >>> x1 mode:
> >>> 02H(program data load) -> 84H(random program data load) -> 84H ...
> >>>
> >>> x4 mode:
> >>> 32H(program data load x4) -> 34H(random program data load x4) -> 34H =
...
> >>>
> >>> 02H or 32H commands will clear cache buffer on SPI-NAND and load
> >>> data to it. For those SPI controllers which can't finish transmission
> >>> in single step, 84H or 34H will be triggered for the rest data.
> >>>
> >>> We observe that some current SPI-NANDs, including FORESEE F35SQA001G =
and
> >>> F35SQA002G, must use 02H or 32H to reset cache buffer in flash before
> >>> using 84H or 34H. Or users may encounter program failure issue. This =
issue
> >>> is not always reproducible, but it may occur and cause system instabi=
lity.
> >>>
> >>> This sequence should work on all SPI-NANDs nowadays. I also check wit=
h
> >>> Foresee that the sequence can solve the above program failure issue.
> >>>
> >>> On my test platform (MT7988), SPI driver is drivers/spi/spi-mt65xx.c.
> >>> And I limit MTK_SPI_IPM_PACKET_SIZE to SZ_1K to simulate lightweight =
SPI
> >>> controller which can only transmit 1024 bytes.
> >>>
> >>> The test step is the following:
> >>> - mtd erase /dev/mtd2
> >>> - dd if=3D/dev/zero bs=3D2048 count=3D1 | tr '\0' '\xA5' > output.bin
> >>> - mtd write output.bin /dev/mtd2
> >>>
> >>> Before applying this patch, write operation uses only 34H(update_cach=
e):
> >>> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st=
 byte: 0xa5
> >>> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1=
st byte: 0xa5
> >>> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st=
 byte: 0xa5
> >>> [78.962966] OP code: 0x10, addr val: 0x300
> >>> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st=
 byte: 0xff
> >>> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1=
st byte: 0xff
> >>> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st=
 byte: 0xff
> >>> [78.992527] OP code: 0x10, addr val: 0x301
> >>> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st=
 byte: 0xff
> >>> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1=
st byte: 0xff
> >>> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st=
 byte: 0xff
> >>> [79.019435] OP code: 0x10, addr val: 0x302
> >> I am sorry but above you said that we should not perform:
> >>      0x32, 0x32, 0x32...
> >> because the second time it would clear the cache again. And here
> >> you tell us that actually the core already handles that by performing
> >> instead:
> >>      0x34, 0x34, 0x34...
> >> So what is the problem?
> >> Or maybe I misunderstood the issue, but I think Chuanhong raised an
> >> issue that is already solved? Isn't it?
> >>
> >
> > The issue is that the FORESEE NANDs require the first cache writing
> > instruction to be WRITE_CACHE instead of UPDATE_CACHE. i.e. it needs a
> > command sequence of:
> >     0x32, 0x34, 0x34, 0x34...
>
> So Foresee NANDs do not support update_cache, why are they advertised in
> the first place? Could you we have a less impacting solution for the
> other NANDs?
>
> > This patch does exactly that, making the first instruction issued 0x32.
> > It should be applied to fix the issue above.
>
> My understanding is that this is very specific to FORESEE NANDs and you
> are changing this for all NANDs. I have fears that it will break
> everywhere else.

I just checked a few datasheets of SPI-NANDs from
Toshiba/Winbond/Etron/ESMT/GigaDevice/Macronix.
All of them specify the programming sequence to be:
write_enable->write_cache->update_cache if needed->
program_execute->poll status.
Some of them mentions that the only difference between write_cache
and update_cache is whether the page cache is cleared before
writing (Winbond), while others don't specifically say that.

The original sequence doesn't seem to be following any manufacturers'
instructions. We just haven't run into any problems until this FORESEE
one.

>
> Overall I understand the problem, but I disagree with the fix. Could you
> propose something less impacting as hinted above?
>
> Thanks and sorry for the delay.
> Miqu=C3=A8l

--=20
Regards,
Chuanhong Guo

