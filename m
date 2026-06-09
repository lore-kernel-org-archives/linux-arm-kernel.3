Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A00CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 02:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io9Bu+BgbdT43NIRh87cvznlulXphMYmxcSQSNbnnFc=; b=zIn8YuQ2X9ZxC5BJU/88XTeJh4
	gBUHGjaWW2DQlUvzYok/T2mlF1MmT45jCMUV5i8pAyiQqFwUiRCfOUOAYmxxrGxpgJWaXBIMBDODr
	3eNmkFfyu7X1fLatoUM1nO2phO3r3c5fKjYPpySdrl4gY0zhd5RPh/llmsBatwNlIZOQxxxcLhNVp
	zcMjaMDnxiMDD+00VovhrLgaEo41jtz/Iag+7C6okZzK1A4cqnz1ao1VJyIBPO3Mq1YBMrCVkH5fF
	7JJnAApn2Z+Y5FKWXlnpRUi81qmftHgz9FNp59LeX+8Wqo2K2Y4+Eft5Kc0ekwmmozbHIXxENLTsj
	9Nwt731w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlnf-00000004c2A-1nYR;
	Tue, 09 Jun 2026 02:02:44 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlnc-00000004c1o-322B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 02:02:42 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-51790c0a692so50382991cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 19:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780970559; cv=none;
        d=google.com; s=arc-20240605;
        b=TscGwtSQoRF0WMldQrBYnWJPEex9xuKiV62vh9Cm8VB7h7q+s3ExWh742fzOARjRaT
         bUpsOQa/7eDcMg8H1eyk5RboJxVFvGgQNZ5vZ6un29PI3+hDH7ChAzE5IA2ynJ0sPc/A
         EgM0F6vs4emtLjAQCbFZ+a76ixS2pAmz/cDmy6m1CI4kSDVs92OoXsECzYX5LOSl0zud
         gOnq9WEiXrt0STKNNhRMTaq2/YVWNVl6ZcvQzsejPSII/cYdyGRMjB4ZM7YNHis4IZXL
         oN1XBY6pMtnLiX+Y2bh72edeoZhHwtHUVXrou8PFN3om57i3sjBgycLWfOvm3r7x2EBZ
         Xqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Io9Bu+BgbdT43NIRh87cvznlulXphMYmxcSQSNbnnFc=;
        fh=VxTD6YmBtPKeA86vMNdw/mt8EBy9/wisaQofV77Hj1I=;
        b=chqqF/LrnT3sGn+fPPYpqs9UMVC57Y99W3S2fSsZYlMkBc2lHvN19unBVeUu9f3J/0
         8MvRBP5wXFK4URhxfNanVenEkjrRweowiLFU6MFIfQ5g7eNI6qHGdYwiA1BT2uAJrfmx
         d56yiP15GQTlSEQ9Qtx1nmoMKvT8sdeejjbNLlGbbwyqpqj1EQUw31lu/u81b+tGeJ9D
         eBVxfusM82L8lvGMAF70ZkXN3QuLEEtXbUFrbgzxXx6gBZzWJqe+kI4wzgH6xFTHSzl9
         sRs5GbhUvqR9e3c6CAS/yUV84uNELx8VgmNEYdYITx6Nn3FqIXQw9fgWPMocfwPayzRB
         564w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780970559; x=1781575359; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io9Bu+BgbdT43NIRh87cvznlulXphMYmxcSQSNbnnFc=;
        b=lFsLyAC1ABaskxwNCe2SAxRTgU3k4bA+DBv/iienUuZoo+y/5B581W9SdpP5aXuCoE
         934QWsqiDuWKa3Euet01fhBoWXvbG0IJH9NQJGAuB8IFMD9yowTvNJSkKBPIYLqOfvbM
         JZiuL4ntm81hKo7hOcHhfHX7sUfXIHtBHldgiyerPqYr9/iogU3DrSwxllJubGjUBM7c
         8LTxjtN+suimCuNE/Ft0lqkjcOdq6rNKeTB7y7JpqodLxMLKGhYAXJB/XnWwPIVf0wa5
         qEiVyYEDqUfWXlGrUsVWBFO/qaDeZkPTKSNKWW10YcyABG9ZFQc0cBbQuwopaDBUhTY5
         Ap/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780970559; x=1781575359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Io9Bu+BgbdT43NIRh87cvznlulXphMYmxcSQSNbnnFc=;
        b=MZFX39rYDVJV3RKDKPJc93YtEeK7HZHLepjQJVFNv5Eovdl4x9FdzT5NJ+wl5y9sQY
         n62xUgWGzDBiwG+NtY+v3xWGkoM0adiHLv9fXVAoBwX9CSO6TkLFeml1AATnbVtICnkB
         n95r46J5b0MMxFVCsnTIKP3GJEAbYG2i4GwRa2HS+iYLt+HcGsWLX1ztjiN4ojEpspTf
         H53pjju91vij8PtSL/MAtYjiZY6TF8aGqtUQr5iG3N06qVTDNtm6F/S1H6OXqKzrG4gn
         7IsnuK10tZ6U96SM7ht3zqSPNdDY60ibR9ZwJd/N2qHrHzk0SnwWL/ezWgA3y6pJTmtR
         RJxQ==
X-Gm-Message-State: AOJu0Yye00F2vIw3wOm68bI6+zc+AvyaCJlieFzLJqUQlZgg+HJWQpF6
	+mn2VP3pnNLOp2s4iohLho8jScoyxA1kp1H+LdHjC/1PkbAJpk4805AnIy4rLhTEvrpFZW6ehO1
	uWGe1wUd6OdTCnEFQG09CVb0P1xWkYNg=
X-Gm-Gg: Acq92OFyseCMhLzCO9qlYk/ytjTR8ZCh1SHlDLocdINYrr0HnffpmMR2SkGfYKT4rSy
	GzRcGxWNncP1+9yV4fj80PFH83DGHVxkz81aKyScrsBH0+AoEScorXre3MSp8Tr1TeJ2w0l4LVd
	12C2JOabkXg/HdHaqWGBfPV2ToedRDsgjjkot1caLrtz0ETc2FSuptkJr8AqGqCX4XaJ3eWP2rW
	N1DoaNuisaY+bSb0wHVhniThl60qG277rnr7xYgNSAkzzZFSX53MQyXp6NqxqrKhZhH8HzqqQyg
	d3nhdaLVAGyP8+9X9bLZGyNLiON0Bz25uytlweUO2//ykdc8SehnIQBlTOlmM9E4f8ekJ0bbCC6
	m3zE=
X-Received: by 2002:ac8:41cc:0:b0:517:9648:f71f with SMTP id
 d75a77b69052e-5179648fc59mr191128511cf.45.1780970558941; Mon, 08 Jun 2026
 19:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260608050926.88446-1-enelsonmoore@gmail.com> <87tsrd8ug1.fsf@tarshish>
In-Reply-To: <87tsrd8ug1.fsf@tarshish>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 8 Jun 2026 19:02:28 -0700
X-Gm-Features: AVVi8Ceakh3P-TJ8VEGRGlUBvyp6WdPyO6DyATP50ZgpUNZpy0Qn-Z-pybotL78
Message-ID: <CADkSEUhubB37uR4ZeCdK80m9-FydXmBoxc7RoZqEWZD2CKtubg@mail.gmail.com>
Subject: Re: [PATCH] ARM: arch/arm/kernel/signal.c: resolve set-but-not-used warning
To: Baruch Siach <baruch@tkos.co.il>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_190240_791814_43A2F2A9 
X-CRM114-Status: GOOD (  10.31  )
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

Hi, Baruch,

On Sun, Jun 7, 2026 at 10:36=E2=80=AFPM Baruch Siach <baruch@tkos.co.il> wr=
ote:
> __maybe_unused is a common attribute marking local variables that are not
> always used. I find it nicer than another layer of #ifdef.
That's a good point. The compiler will just optimize it out in this
case. I'll send a new version of the patch using this attribute.

Ethan

