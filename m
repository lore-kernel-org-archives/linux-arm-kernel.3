Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31902CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 03:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WY8tQdk2Tvql40KAcE/gnoZvaJoJKO77cgfifr2cEeI=; b=pkvnSmNiXt3aNT3062opQw73e/
	A5AyUbb0WOugbNeGG6l2LP/uk1t+mqH1pxFVj1T54AonyuO8Upajk+CnYn3xkVaLklJU45krCUJP9
	UtWznK43bdUbcun2FaXL2rwp1uCyRYdwfvngUaaZpw0dy9T8hinBOx00Tfe+XXLNRFsZwV5EraV9U
	CNhip1FYMQ8PvSxAoYgdDC9NZY3NORAQ2+XwV25sLmVmwWHqWRsaoc8aTc9x+3dA/jHm0OnHe9lCE
	PKS+spyb46FIZjEezqsTbEACyh9XBjBKsI538skSUSqFwYUSXrDvFMYchM3udEkvyO2L51h0lPiLm
	uxxXRmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOSKf-0000000C0k8-1MQD;
	Sun, 17 May 2026 03:38:25 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOSKc-0000000C0jK-0P8u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 03:38:23 +0000
Received: by mail-qt1-x843.google.com with SMTP id d75a77b69052e-50d87610513so17620191cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 20:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778989101; cv=none;
        d=google.com; s=arc-20240605;
        b=QKK2UId9MupsmxBp5DU6n3ArHaAHPrdI2G2E37rD5CuJJkwcqWIVLgTcFWtdrk8O4m
         wXc9oyzdJs5YpU3p5Wb2DtbmBPOzFGKqDZZJVXYMpAKQ8T4QJwN6H6l5LReiicShep1j
         yoBLN03IgaO+TqH2Q7j8JToFoRfL0+1z5M/Q84ONoBXrNbcuhYJ6fxSNRXuU17DXqGhI
         T3sG5B6iqVnMY79Vm9x6tapjotlgtQ5n+RipXemhym02vo2ZBoakfBGfNSaw3FLjsQIH
         FAqKfL6u3Oby050ewUoL5GaksL6FdfPDjFwD20JAGwJLF33Ns3XdF8+cW7zS0buhkIpK
         Lvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WY8tQdk2Tvql40KAcE/gnoZvaJoJKO77cgfifr2cEeI=;
        fh=zI4t9nfJB36Lx6W1wIF1KOxBAd0Y9TonU2hUqc2ncqo=;
        b=i/KcvM+vRz6gmXSvC42Q4iYbfuoMecykDFDR4UN8rWb4Nt5m4t02hnIMMWBhdcurJZ
         o528M4UW54jwhU9WSaNhO4fQubiZnqOv2DCqvMkMS4VUgwlavV0UJH6qQmnJ1qcrfZYn
         IpL1DvxQdAJM10wdQhCEQ2UbWK8gp+m/eDylJWn7Ifsuapo/AaNkzfs4iCOIEIOgsdpP
         YWzjfbxmk/ZWWW29o/bBdA0+d3aLg6hKpWqMcz+0ORMoR/D9hGo0aPwRyo0kaOtuyKeu
         wCFnlq4eTAE/03SkBUuWgr53UpufQHJ06nZoVoCahTCTGthebGyyBvlLxpZqmVKtyKkQ
         jggg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778989101; x=1779593901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY8tQdk2Tvql40KAcE/gnoZvaJoJKO77cgfifr2cEeI=;
        b=c28UgZzvphrGHSQp1483SlwgdV/KGPCWR6FlOAq9c/iiE3jBGrREyvESBpTgLqaK4T
         l7s5EiOB6f1q9lMu8od4bnlnKPmdDIoFLZwQ9EpBm9agFdoQ8yXz5SsAL5nXmWUEt0y7
         6WZDZwKYgaXNxQIoNIne2B0PPbIovD0AfNr4LuPXTrtgjDfPEGJRu4Z1976kV/fIIfcL
         0D8/88YUFc7EbewTQyPtSRWEzkkmrkf3xvMymgBOTAWZXxYE7VM2RFTsNa/RYeeqGpwl
         IrTC5inUpszqOd8OV0MQ4OoiQdgWb+ecYBNO476mm0Ri2nVaWtZOgUywpOWy0tdWqNdm
         fkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778989101; x=1779593901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WY8tQdk2Tvql40KAcE/gnoZvaJoJKO77cgfifr2cEeI=;
        b=kHA/zDFlR8mBDv4MwwtvM2qg4SpBfGR6d51e038tgRoeb6eu7+AUcgPz5q3ErdD6+e
         nm12sf+vuzbPC2MXGJd0TDSqErM+iksTK+3LugEJ9HEMtz0fV8tgdcP2nYLd99jhqGLy
         WVjGf3p1G55NAHdr9VeCIFBjuABJNQ/CX1CPqoOq3YWitd/bw+eiVwvFB5YY5h7/tpWJ
         E+nnUB0tpqKFCBabQl17qjXFmzVc312EEMfsbdN7Muumy6YJEMcQhqzPZw6r8AcQELl7
         2Sn0E7xLX0lGoM6BabCYoU6PIoFUO6HW1W347FvG5l3JyI0LF4mfS5tRGhKq5Dm+uRV9
         NvRg==
X-Gm-Message-State: AOJu0YyDaaala/iseZgvWkdKHVyKcZ3gEk/nVS/TKO4e6p3PM7ForQnX
	SeAJAfkP4a5AkjQwZ7Qx2pBTJLYOd/54E5KLJhZRLA2efDYTvtEkW9/IHOBgK9igdtOU5H+2dvl
	kojGWwbVgTSCl60K8bWAS8sgrFLkURTNUxE7EtBVBjw==
X-Gm-Gg: Acq92OFjzXKzQjgNQjY0S4QEjf0vhKY6OowRLaccY450eLPuXaqbVQZ6i0xP7E+UqBp
	IjEhlKBrvlGhbp6/bwZ2Ky/bJ4yOoLJgfo4/1u8Vxaa/eTMmo950O1C0rcj1Jid2/bdLhjsHVlK
	UpuczNFwj6u45Z7S51VuDn3rdaPDITYIEO/PGj/BRwuX4oJfr3ebPiNApu9u37NoIvzeMnGxprK
	TmLyiCFny3MLrPddReDy7U8LQkIXW4ysB4PnoOpOVV7Pi/9p9Diagqo0zWmUNepWoGg3vGDiRr+
	TJpWW57PNjMf4StjI7o5cGHjkTEYOKwBd4l8DxxSaNp6icr2Oa9ztvymQEy/9RKJ22sn
X-Received: by 2002:a05:622a:a1b:b0:50d:8db0:7abb with SMTP id
 d75a77b69052e-5165a22992bmr77915441cf.42.1778989100904; Sat, 16 May 2026
 20:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260517030408.100043-1-enelsonmoore@gmail.com>
In-Reply-To: <20260517030408.100043-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 16 May 2026 20:38:10 -0700
X-Gm-Features: AVHnY4IPomr9w-HKVeIgr1J0aJ3CFgokPQhKDcItPcCmhDidhlBNrZuXgKTRPIM
Message-ID: <CADkSEUhe5JhGC=nqwMjJnGrSEk9UsmfORfOPvsWqMTm8SrNHpA@mail.gmail.com>
Subject: Re: [PATCH] ARM: remove unnecessary architecture-specific <asm/asm-offsets.h>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_203822_141359_E36AC42E 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On Sat, May 16, 2026 at 8:04=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
>
> arch/arm/include/asm/asm-offsets.h is identical to
> include/asm-generic/asm-offsets.h, and therefore the ARM-specific
> version is unnecessary. Remove it.

Please ignore this patch - I did not compile test it (because it
seemed so trivial... lesson learned!) and I didn't realize
asm-offsets.h was required to exist in each architecture.

Sorry for the noise!

Ethan

