Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F34C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rks7RgU8lnN1tl1OcZKY8fr3t/XyAMQZ/mP+r7NDPTc=; b=XAPfKqi6ASNDf7hhU21p1sYAMu
	02WzmotiJeJNiQMZnA41bzmE40uHSymEv2vZWQLPRmnpiYG+7FBwYuH7kM574P4+ajBAe1j1YM+RV
	mw5G97vebnONqQbWjY9YhFxOlcbRfobvgEo2PEfYuJbNT8cNgnCTt/a0kr+VmvtgOK8ux83Igc9ru
	zU17DmBKscLFSzZ5k0lr3bDYm2ousPPsWwsBKm4WvvG1MceNQkVrfj5TuB8PnvPOwwavY1ZQ0mylG
	PToA+ml0JX6CLWA4EYHn/5wyerxtxQ7JAS/rnbbOvmTQRCb9u6hPVeA7drGfLU43dbC3HihTa8iNA
	WuZB+hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKt3-0000000Cbc6-3vkh;
	Tue, 02 Jun 2026 08:54:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKt1-0000000CbbG-00Dv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:54:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so3573212a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 01:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780390449; cv=none;
        d=google.com; s=arc-20240605;
        b=cKHkDSxTlkco4entOSO/A4Y3gxCAVwBKzAbzOK1UQeJ8KClYhW6gNpoZIWquwRr7jb
         ADPyKnGVnwUCZAgvliWyzPRaiIem/QMLAks0krtD+Y42UMBjcmazVpXQCKVDjUMazYbw
         yP1iJcr39Ymzev2n5TMLNZuRixBqY9j/T7bBCfGleREIAU/G009OZN3wJG2OWTy2dcYt
         ffa3PtRyHgAsFvKA5Cx9MeQA4iREeM+UgAr64cfdfWKwQljv+zsv0bXt3yHxOIlifGfu
         mZ7/AXRxqjHORTEqxmgxw/xL9HczgGQGr76bEK5cwFCRVdbu8X5023I/IlSVROMYzaLA
         NyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rks7RgU8lnN1tl1OcZKY8fr3t/XyAMQZ/mP+r7NDPTc=;
        fh=Ipk2j40+RdMv4SFeZIOD2gMpjjCR7rmCZZrneMzlXYg=;
        b=AXP+MaV1lbVudOBBINd5I+PgXQKt1wAUyDau85bO6oUuQ9FvdJh+zo2vSLIdNcNQWA
         cxTEIHcxXR0Q+Jjkp0TO2sxoJQI6QxiuFfLKlhc8uuUSKRSycuIKdNfZdDsnDyoCiIg6
         AOus73SapcTxTLK2QQTOWBxGceiE+0TVfJ0xWpnjwYYVuMu6fuglmua7awU2njTAOpqO
         ZqGtKELfZFERBYdRhis1TkQhUZ392iGN+VANC+pmXK4CzErNeYTaSFKREe3DW+2uZB0D
         aM+sbKiyPwMs/NhqTfF7utM5s1dqjC6ZwGiINR3xQwXY/zsE9IRq/MkkYidmAzqRChfI
         ODcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780390449; x=1780995249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rks7RgU8lnN1tl1OcZKY8fr3t/XyAMQZ/mP+r7NDPTc=;
        b=GWvTW9FdPkQl51XHx/V5Gl+jNeVmthBKHuyrM51wf9ydKGEYgT58/EiSiWEf9KQZsu
         XLU8pigKOEkrG9nGcPKdlMVBW9CYEvRpAnuPJ5mafFyKY26WIIVeaC7yU7AiU84bytW1
         Yk/zRjrgBAU5MBPc5/zRnnDPp7AxTLhJ+0WNYQChhKXTlxBMWL8dJM34sc2BKds0umqJ
         4V67OIL4dy8Ym5i8SG0YCNo/Q9/lrDoWnsHmG0MmSQVEKWG5ZC4JMye3Lx5SJRuFZWUJ
         gbMt2zc06rKFmqCdUeenZTsU3HkmX/u7m4jXe57UqwoT+txH5Aac/gwLH7UPqrs+vnH6
         s5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780390449; x=1780995249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rks7RgU8lnN1tl1OcZKY8fr3t/XyAMQZ/mP+r7NDPTc=;
        b=hZrl9UHv9GDJ4AhRT9dMRYL68CakfzUnKfcVfwQVCa0PyzvoIp4sQNeFppQ/tlD5dn
         DLzyozui1m5Lrr7YUbI+3uAeVr/XY6cJKXGLnhfGEEDwOwppF29D1AF0kUZRgADcDQGP
         niC0JiUEVL+nwFRlEoroQuqh+MqyWejxFYqBN3qSVYx1ictHpDHlGiBq78dXinqfFsYc
         EDNUTGDmgPES4oWlqy3dmPBk7qs9XtWblv12SCSMk2fIfHtQHAdfVIk3bRIAEQEjG6w8
         cWbsPpFonrk2Gow9s3ChpUcAEyYyc1wliA42UCdx1vW0nxLz/hi/TmUiaNTGEU5z6ktB
         7aLA==
X-Forwarded-Encrypted: i=1; AFNElJ/B4d4SFPv6Iz2NvP1EIC5psqrX0mTzgPffnR+0b0NQi5L4uVq8JT0D1E0NL3JRzUQgt+6Lr+Inc92fXADc/d+p@lists.infradead.org
X-Gm-Message-State: AOJu0YxpE5Ej5sX8I2Dd+YiHF33Xhwx9jzqGxdjNZ34ZgEsI1FKNcxE7
	UdabfK3I0r8Lx0XSmVLzv3Hnp+zBfa5Gh541aQ8gvMkpO1dJ53P9vqiYAdiwKe4QCriTbJTDsBs
	sQyFqC4rDg3wj+bGhcWwbDG+c0gEF+2Y=
X-Gm-Gg: Acq92OF4FMvbPUUzjEN0+GnqRzyY3/fZ36wtQLz8wSRpFpknbhDPiW3qU6J/pEbual4
	EAMUkGdz8mBgsRyMrh1SPUOzRUhXsATlcZfhjJDP2kPuKg2sG65QuUPhRc2KrF074eRmnjDHPeb
	ocHxtW6s9uphbin+HNw8mJMcL8dM/71YJDsOfOsMbYY7qRS4oycW5EQusWawWn9bNZt+XnhJn33
	O1qDz5fP7kmazNlYSU1nd+xMLR73jCbl+iby79iDgbKbTkYJFQqB09mZMqMNgfHPC8NFTKCVhdV
	0G+cKb7gOUGGlg9LkbTPiNwRWMu5/aUP9KVwApztL+S/3fHzje43yda1c9yfb7AbEfVz+OzPWQ8
	in8dukoloqtxpgSyZb9qSCkmdxWl57+lnRwG7GYGle1LJmxWgBVc89IATA0PHu6lF7nj9
X-Received: by 2002:a05:6402:3554:b0:68b:f026:f381 with SMTP id
 4fb4d7f45d1cf-68c8ab2e567mr7105442a12.8.1780390448854; Tue, 02 Jun 2026
 01:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260531210747.11401-1-rosenp@gmail.com> <CAD++jLk3HmmTBfjLaVKBcRi87EmAdzs9BGy6teerJ-rN92MtCg@mail.gmail.com>
In-Reply-To: <CAD++jLk3HmmTBfjLaVKBcRi87EmAdzs9BGy6teerJ-rN92MtCg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 2 Jun 2026 01:53:57 -0700
X-Gm-Features: AVHnY4KscwoQmk_hWxdvXdiz9lrBDSO5kvhYw84zUg0Fx_ut4kbOFRTKcKnGsdY
Message-ID: <CAKxU2N9BKyz-8y2Jyrv9xFpCWL4euv3uCZXBrQdT7mWn3q6eMQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: fix out-of-bounds access from D40_MEMCPY_MAX_CHANS
To: Linus Walleij <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_015411_062154_FC77B99B 
X-CRM114-Status: GOOD (  12.92  )
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

On Tue, Jun 2, 2026 at 1:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Sun, May 31, 2026 at 11:08=E2=80=AFPM Rosen Penev <rosenp@gmail.com> w=
rote:
>
> > D40_MEMCPY_MAX_CHANS is defined as 8, but the dma40_memcpy_channels[]
> > array only has 6 elements. This mismatch causes an out-of-bounds
> > issue:
> >
> > 1. d40_of_probe() accepts up to 8 memcpy channels from DT
> >    (num_memcpy > D40_MEMCPY_MAX_CHANS allows 7-8), then writes them
> >    into the 6-element dma40_memcpy_channels[], corrupting adjacent
> >    stack memory.
> >
> > Fix by defining D40_MEMCPY_MAX_CHANS as 6 to match the array size.
> >
> > Fixes: a7dacb68b35a ("dmaengine: ste_dma40: Allow memcpy channels to be=
 configured from DT")
> > Assisted-by: Opencode:Big-Pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Excellent find Rosen!
All credit is to our robot overl-i mean sashiko. I'm under the
impression nothing can get merged unless it's happy.
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij

