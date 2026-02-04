Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73C1E8B38A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=; b=HId5gG6G6nrrYIPswL1G1IlhV+
	hOc7Nxlk1mITFXhN3M5ACZBgHGZQ9tLyZ3KXg6hY9tFV9iQKNV/fMJKagvx0yglRog5A5Tgm4GBcN
	MqtfteO4/vatY+5ConNCn7pKTS+hxiF/DrGKNRXkKjBwhrMHNNUer+q4wC4mQBpDpqO2PgoHz5v2M
	K2KJLOIPBmpAru5tq6qsqIXZLL4HgpwVnxtNPJMoa+OG1/5cm/3Z4uolmsl6OhN5dYfziEvNFq+4Y
	qtPQRMG4pgtqGHENfT8oYrhY7RDj/1Py1GccAwHJKv31VOTv3eYD6srL+8aFNVE13P4Z01J4FBs/V
	vFHkYFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSLo-00000007kkj-0DRd;
	Wed, 04 Feb 2026 02:10:40 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSLg-00000007kjp-18RA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:10:34 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5032e951106so49324371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 18:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770171029; cv=none;
        d=google.com; s=arc-20240605;
        b=SKghybhXsnJt2uZuSjZCC3CeZz1YlNhh7C2pZg7WBJrj1pfMkhda/BhvQ7NC34QfHu
         pwjzPiGf+o/lGDktq1+6BnhVjZhA2PMYke8xI118Q7hosG3lDbUn4pjFQ02y3bRF2k5f
         uTRppsGaARNsKnPDpMkCVZEeGxbdkVrpsuTWvYG/uXqj0/XgdBZNqeB0OeHI4wpoD7JX
         69C5yGIj8mwQVWI2RL6COx9a2ksuvu09sEpzlCh3d1x+fS3idVZqngfce1dbHusW6S2L
         +xG3QqNwhMdaAvAHwfe0boFWWuZAM4GHVnXN03vSnZN3878Rkn/01MgqgGQuCjp03Qnr
         I1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        fh=fOq1wOe2y/Nbl3B7ArQwz0Bdt7KvzLcxhMwFC/bC1/4=;
        b=M4Z1A0EJPz4klf8nKuSW+CuWqI/hhy0fSDs+d7WtBTLvD3rObc/CUb8Cv+tt97nn7/
         u4RZsFKRgI9FzMs/EhFAX3ook/v8cyeXuxdsV4ipEeU09Ep9NpWVjqXywIIC0u3cXmOb
         KUk2vhcnv9XCdCbimx7SWfy8QJRrxBpYxyhP2BsTbOUffV8Tf+YOVrToBfq+1426jiTF
         CTdhHZIVPVpLWSeBqd6QSXEMLmJlKWDpRjTnos8/KFF5cBNZ5XoLySdwYmezmjeivEM/
         M6Uxxm85+Q3VVAgqNKMC09fA8fKVZb3RCUdgaem7+ob2w8THc5lsBsYA/IOV2aaTQv25
         w3Mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770171029; x=1770775829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        b=a2rntmM5+I3TM8GbknJXOnQ1XdYXLJFMKIXJ2lrD3Q6m/APmgyOWOCFUhTpd5lrnju
         xwA5e2q5TMXOz7nPgaeG3HfSsLCouN73XMVxkItqwfFZszq1Bj7PQh3vpXMy2VFvgzRu
         UuCu/r9R+p4lPOKSfOovn1fZXf6xB26CvgucOhPrNV2sWMzRETOWv8/qpBZ8+NCX15Et
         mZWFABtewa9cAtSXcnBgaSumutZgFailHH1f1pel1BZa7Q/fL9SIgFDJcX/ZEKlobDFm
         1P5XfaGHeMxAk4ReSdwoZwisEatAOu13bTNSOngDioju2Y0wsIhcFcXPid91ToysvMOZ
         lggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171029; x=1770775829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        b=F+VEJ4vf8Q7m46509s5aElve+4woP8Vt94xnjfj4ayTbPxgLRzxvuSc0mn4qsMPEu6
         nPGcJfvXZGMCoMh/TDRW6IOjJopfmAiawEob1/0+PkvWkL7YH+d2PdYA3vH4pYfWzqvV
         oNkQa3mIORNP2KTyNKgLvhtlYsh2GfVqwEVCehAyjNu7aFjH1UZEWKkcRiDPC4yJLadr
         GZgv1zFgbbggdayKrdGt2TzJcwFara+4+R3azyG59q3Ny+WP69b52lO49DUQPyx5NWdl
         xkfq+KxkD4/bDHPNbXbl4lzjkKuzWZPjS0Ka5SFvDpUPAGh0F7bb4UI7QQCxZgbtTQZg
         Lo/A==
X-Forwarded-Encrypted: i=1; AJvYcCXZjpNdaWGs/UB71EsvXylg4iLynZzh5q8vNNpfUgN1NWPk/PagBw0lRKYj8A5e6qzbx6ptLmOXG5gu3Ov2V78I@lists.infradead.org
X-Gm-Message-State: AOJu0Yw91yu/HM+pFY5/cIGEv2tGvTWnZ9RJTekTp8KhGoMzgVSwgD38
	ziigwZijhGgVsT0EZs440sVNBaAtI7tMi4+AMB/HwMYv/Oj8v7jFI3sXjERFWKT/50u/rvS4r1x
	2RnxZugZpzQMK7WT5FyZU6m4T3YE/ERg=
X-Gm-Gg: AZuq6aJN839AZtOVlI1pA2MNgdhGSozL+g5/P61d+sSWcRvNGiGP1+4mLBFnlcbXgA1
	/IbwD+q5xF64XfX7RpslTclYNMySZwacHm1trGtZ702PDYCTOnblizpAyHE2gGQi3uc+hAP8gHH
	XqaivGzKLtI9YlhahTcvLrqxAR4a/0oDuFkm2/mJLuBCc8cjbhLYXet1e5/jCNU8CY08OQAqKIz
	GrhaOKhlM8cv3G0CsutdJTIBrwgwoA5hNbGsZC+vaNPYlbRyQOYR8l35Ucbaa2Ou7Pt8t/N
X-Received: by 2002:ac8:584a:0:b0:4e7:2dac:95b7 with SMTP id
 d75a77b69052e-5061c17fcabmr19066391cf.37.1770171029420; Tue, 03 Feb 2026
 18:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20260111053025.251983-1-akkun11.open@gmail.com> <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
In-Reply-To: <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Wed, 4 Feb 2026 11:10:17 +0900
X-Gm-Features: AZwV_QgfvhSnRe6BSdFh2YHo7w__KWTzGBs-jRKflpMXQ7zpmGAbD_Bihr_xlBA
Message-ID: <CAKr_iV4jBCWepn+ve2tYXncUocsnLyqS2DSebW2Wu4=pkRs=Lw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: remove unused drv_offset field
To: Linus Walleij <linusw@kernel.org>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_181032_626559_68711020 
X-CRM114-Status: GOOD (  14.03  )
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

Hi Linus,

Thank you for picking this up and applying it!

Best regards,
Akari Tsuyukusa


On Tue, Feb 3, 2026 at 9:34=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Sun, Jan 11, 2026 at 6:30=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gma=
il.com> wrote:
>
> > The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
> > since the driver's inception. Drive strength control for MediaTek
> > pinctrl drivers is actually configured via 'pin_drv_grp',
> > making this specific offset field redundant.
> >
> > Remove the unused field from the common 'mtk_pinctrl_devdata' structure
> > and its corresponding initialization in the mt8365 driver to clean up
> > the code and avoid confusion.
> >
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>
> No word from maintainers so patch applied.
>
> Yours,
> Linus Walleij

