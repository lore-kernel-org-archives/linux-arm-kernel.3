Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3DAC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ypJpkmQRRV1BQV0ur1VLkim3Ln3Ci6KGz+PKJeDImg=; b=yaJfoeD9bQ5zTBh5Deouc10T3C
	6gT15nQC/s7rzIdobO+wrfIXhqE/4embHP0XIR9ek7UA1YjUAvF6UG4Y5ySy2CH455kK2c4zTrpDu
	xj1CLz6IbV3h7iWkiuSeHEXP9gJa6+zOf9cEXfl2xTEdlbZS8BDIWR3d8a00Olm4bmf6wtHZ6Pj7/
	rPlGzoWhtQWN33O2apTG7qvW7XSfKEOX/b8b7+8AKuFkExZLdzujsvjZXz61RJULOoXuFY7rWmVhN
	gQWJ1Z5N9oeQ7nZUpbM8w3rkXql/VwOwSm2jkmbGz1CAFUyJVfnpMNDo1l3BgE9QcMq4A0qCczJ3a
	tLN+lnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH3pH-0000000G9zb-26ZL;
	Wed, 14 Oct 2026 18:35:43 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH3pC-0000000G9yn-3fGW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 18:35:42 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-82503732024so2291691a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 11:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792002937; x=1792607737; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ypJpkmQRRV1BQV0ur1VLkim3Ln3Ci6KGz+PKJeDImg=;
        b=L3fKdAKh8uo4FrgrnU6SR4fltW1zGfiXNmCgEd5SLpORxoyAgCLX0MqmFmxYOxwTQe
         fKOKXuXUj+FXNF94WLts1Ou76ehyXRcAr8tvX14QhnWytxQPs4/sz7RhID76Xxj6Yd+3
         aMZ1kuG1Z+PwYPrNXFyycSMjsDJagLiEP8Ug9jYNafO7As10RBTPfH9/w1a72OyuWIuE
         799MxPpwg6+c4fk1P+Iy4XP0Q3fKaDoWpynGjvBdykwiRQlg88nSLZ+sQ8ueUbPpFnCF
         kvVFBmfTigDCddycYXDf165F7BS3ZP3DF+dLbdbRSAwU/7ZBA1ej+LqdAg9gKr9DdMEP
         Z1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002937; x=1792607737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ypJpkmQRRV1BQV0ur1VLkim3Ln3Ci6KGz+PKJeDImg=;
        b=KAXfJr7k7e05z4H3gptkvsx3V4zZ9GZafecMdWb+3rIl54KV6zhrYu2M1HWnubBu13
         ZF+oFfcmFvntOid6hdyAMH7Avihwp6TulbMyivXJ+1RDQnf8zqEhx7Q7vUklW31elDYh
         hFDMqmqDVnqh6a9LevkKonN80Qm27Pm/xze9yG8JDW0zWVyyLS2ZQZDTmEv584uPOf3A
         c0SaKZeHBzyQRvuShiPgS7ed8PHGe+kqSwsZLWogx9gTJ2+RaQFpX4mgviHPoaWgyvTw
         c/7RePSI4dXUuPOwFET0toIbb1Wmh+HNjCmOkbR857XNsUz7EUquipnkbGejrltKIyhf
         zqMg==
X-Forwarded-Encrypted: i=1; AKwUvBxxAmXItgTPseGg+if8mDAART/77y/FP7j22XcU7aqS3jElyneiDU/AhsdMra3Q4nqhy7fuT1hMGnZ3ZazapvsQ@lists.infradead.org
X-Gm-Message-State: AFq9FYIngzzGKycKeU5oM0Omyt6rkSMUggc3b4/9YRwCXnWySVkRfY1A
	jDgiDMPlxSA9+IfIodGCr9i3Xz+G8fi6//KLiuF8xrSQov1Z5WH2ObrA
X-Gm-Gg: AYBFou3zktcM5Et6/1Fbc3ePCT1amvpfpcpwVOGhtMyAopAO4aVcFMS5gERsRTNa/oJ
	Hd6XdcLC3F2OCo0mgt5ZpXaUVog3PlAMPEgmDbOXP4230SfMzqD3D1KBPtbRb7qZCdPep+32cuC
	xDcpxVAtIk3hOj6P12b8quZIDyUXT4ZykFqkJvRe4uAKhxmNG5MeWWImAifZKNAWIkTUcIEDDhN
	vSASJ2Qm9peAYwlNCO7DqUOaFcPo4ph7bri4H46YyYI2OiYhoNMsxljAAbg1pi0ikuRBJ393KZk
	1zlmZYmse9rLBQIqgvgB3SySHV0Fq1zC172SBHJDhx6/nMfD4RQPjScu4N+KjZE6zymYXi2jiCG
	W+qM410O2flHLL5NZeDbAKL+cpj47uPpZsmik4Tq/95qbroDwvPFNxyG0Jb3cYU+2qbh4v2nJPK
	PF05Zkd/i0fMoNNOJx5hj0pk2X9rx1CUEbbpHLhZIK2HTmL0vi9J8BMjHfFexfiVlgN5N+CpG8k
	zZjFtxbN7Bs9hNqyxWAccWi34uD7Bj8bTFDXArmAXQLN+SpUSQ3AFDHvDpqt6UAe67KPkvRPFJO
	Wrxdtk3t+1gqSg==
X-Received: by 2002:a05:6808:6c8e:b0:4f3:e98f:fa19 with SMTP id 5614622812f47-50c57695fe4mr15959952b6e.61.1792002937206;
        Wed, 14 Oct 2026 11:35:37 -0700 (PDT)
Received: from MaquinaLab.. ([187.14.248.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c0c5fe7d0sm17325426b6e.2.2026.10.14.11.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:35:35 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Wed, 14 Oct 2026 15:35:16 -0300
Message-ID: <20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014001334.54dcf0b5@ryzen.lan>
References: <20261013142351.771229-1-andre.przywara@arm.com> <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com> <20261014001334.54dcf0b5@ryzen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_113538_955240_EF3127BB 
X-CRM114-Status: GOOD (  17.57  )
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

Hi Andre,

On Wed, 14 Oct 2026, Andre Przywara wrote:

> So PortB has no supply of its own, instead it's always supplied by
> VCC-IO. [...] Which somewhat means that this is broken there as well?

You're right about shared VCC-IO. A523/T527 may have a similar issue:
the vendor driver maps PB/PH to the shared VCC-IO bit, while mainline
uses per-bank offsets. I haven't checked the A523 manual or observed a
failure there.

> What do you mean with "the board's SEL value"? That's not the SoC reset
> value, is it? So who programs that value, and why?

Vendor boot0 writes `0x01155550` when `0x03000024[2:0] == 1`, printing
"board gpio withstand voltage auto mode". This isn't the documented
reset value.

On my Cubie A7Z, I also measured SEL without vendor boot0 or SCP:

- Cold FEL, no SD: `0x0aaaa69a` (PC/PF in AUTO).
- Experimental SPL/TF-A/U-Boot SD boot, at the U-Boot prompt:
  `0x0aaaa6aa` (only PF in AUTO).

SID+0x210 bit 10 is set. The BootROM code uses it to select AUTO for
boot ports, although my SPL also sets PF to AUTO.

> So this means you hacked the register in the vendor kernel, for the
> sake of an experiment? [...] uses register 0x70 to switch PortF to 1.8V?

Yes, I deliberately changed SEL from U-Boot before booting vendor 5.15.
The BSP switches PF for 1.8 V UHS via `0x70` without updating SEL. The
SDR104 timeouts with fixed 3.3 V are consistent with that.

> So can you say whether you observed a real problem with either the
> current (broken) code, or with one the fixes?

No functional failure with current mainline. I found the mismatch by
chance while comparing the manual and registers. The investigation was
preventive, not prompted by a failure.

> Thanks for the confirmation, and just curious where this revB
> restriction came from, originally?

Initially, excessive caution: I only had a revB board and B-version BSP
descriptor. Further investigation shows that vendor U-Boot and Linux use
opposite `POW_VAL` polarities across silicon versions, while boot0
enables AUTO only on version B. This suggests revision-dependent
behavior, but doesn't prove SEL encoding differs.

> Did you find any recommendation? IIRC manuals for other SoCs did
> recommend one or the other method.

No explicit recommendation in the A733 manual. Its prose calls `10`
adaptive, while the encoding table identifies `01` as AUTO. Revision
differences might explain this, but that's still an inference.

Given this, I'd return to the `BIAS_VOLTAGE_NONE` approach from my
initial report for both A733 controllers, with a separate A733-R
descriptor and A523-R unchanged. This supersedes my later PB/AUTO fixups
and PL/PM programming. I wouldn't write `01` unconditionally without
evidence for other revisions.

Without vendor boot0, `GPIO_POW_VAL` indicates 1.8 V for PG/PJ/PD while
SEL remains fixed at 3.3 V. My DT doesn't use these banks, so there's no
demonstrated failure. NONE leaves that limitation in place but avoids an
unqualified write. AUTO could be version-gated if needed.

For A733-R, the separate descriptor also avoids inheriting the A523-R
`CTL_INV` path through offset `0x344`.

My mission-critical background sometimes makes me overly cautious, so
feel free to call me out when I'm complicating things.

Thanks,
Vinicius

