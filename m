Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CCBCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1JjpOE1ucuZyY8BzZRnNa5t4FVs2T8yEQ1ySGA0bgg=; b=jxLFoWh2t/S4QTKGp0mCNGS6hV
	KtPyfHnDfR10L53Bw7NcDTY0W6R8YNV4I1LBLP/ITRJTsjpf8SUnT7WjcCcqO29YQD87wNXZ2KK9C
	apsUYjRe1lT2PuH1qlD3rqD7th1qiageAHK3k8Zl1iHIXLG7As1gn5FcDwJfSjuxyCRGIz5hgp37Q
	OZOR/mVb5QYDIg7kzIWv9Dp0vx4dLr8UKgzD0QX3A00fbgN43iYvs8Yq05tNps9/XADgbpgfLPeV/
	ckmwbHkiGuoOa1pscoGWafMopG5vAbEMSYU6E6QPxCWAlhIPmhyzKKXB2sCPCZBnoQJbQvrBN47Ds
	hZf9ROvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzc9-0000000D223-0LOY;
	Tue, 26 Aug 2025 19:45:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzQr-0000000D0AH-47zJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 19:34:15 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3cbe70a7923so573325f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 12:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756236852; x=1756841652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1JjpOE1ucuZyY8BzZRnNa5t4FVs2T8yEQ1ySGA0bgg=;
        b=DGz4trGQhPZO4itky4MoQzTZE4FcdUZ4g9q7QorGOCDjROwzuCmlXIl+6fe8nnkJ7r
         mBeq6xyn+KPtBRstaTbYMJ2+n17Y6yJHpE8KSymHvd39SfCeyajJTBuruZQqB21sBczv
         x8gCjvF7XD43sgqWLhYMFU2VCzKY5WQ5U+nSVSIjyd8AFyQSmCd9EOZvQ90nLHGl02hD
         NE9zcsahgc4/g/WrQ3BGs8DtXKhHOe8ir9AAEz4KgWts01m68BwE5qIdy9QGvzEUPhDn
         QBIg5ZxJ1mxzISMO2f5yYCYSMUIf+P8r0/jF16NAO7juA9EUPkc0hMyJ5vunT/+Vmrsd
         VCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756236852; x=1756841652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1JjpOE1ucuZyY8BzZRnNa5t4FVs2T8yEQ1ySGA0bgg=;
        b=NwU+sAMSuyO44VIz6fMQ7IQKgCFaHGH9IxAmWGID8gsIWkJVwUHaVBHe+zNZpCpy/5
         QUGHNZcqJJ27M9C62yyb/lyCfMVOrRhzvJ16EPUO59MmzjZE+S2x4m3f93XLiBaF/Uap
         k9WQaaYaCgrhEmc7t1m586e+Rbbr//Aw/kwQAULta5i9sEIsXJF7kd1HExLbNjSswTaP
         S/C/I4Mo06Dfjh92UTnPzv95/enkvwuoPA0WmRwEc7WLP9sLijvVvPmy1TU6+JcqCMrk
         gS+zcnpyYpYnze3WSLvuxkw2Awoi7Qj3WCooJ6OZ97uxy1L6RjgggAkoyII+wiLwZQAm
         cLXg==
X-Forwarded-Encrypted: i=1; AJvYcCXLCfX4auHjlkEvxW67rtGF953IBaZy7RIOBoRPmqxMXWhmKeBMvWL3g8G7s9NUXAWN/Q4FPzBt02B9bxDECllD@lists.infradead.org
X-Gm-Message-State: AOJu0YxBvK5lmoFivWILqBe0bSxLg2KFXToptUw99RzTGJ03ofkTed5W
	OZqYVX7TRyrmC2j9B73vB5rk+/dKn2QQ5m8iEa7zUbbldNLcL/24jPAkwQD3dgOMUqhsAdmtQML
	bCX5AF9lOQYZSK3AXtjTN6Wikogdz5bE=
X-Gm-Gg: ASbGncsr+QeNt5x20UjySoB32gMaKHnmJAp1M1/C9vW0QbyvMhSrlidGvn105p5Wb87
	VdV0OQJ4F9JhU3OgW3wlghlG73nx6Y7GQ5gTG0OC3d3SBbvXt+fiyZGaE6HCl4rO6pKMhvsV0pr
	K26UNhIYmPp1ilm4ZF8irJ8eChlpEPWtBKQptCcHMcLvYbTiNb7oJrJVQHYD8HnsMarNWJB3smJ
	DY870hWzzR0gyVn3yrMuXXddCWOgEpluiYJWxM8T6tKFSyFmSrwCA/9l4tSWT+H6vpZnlT/M3PT
	bN/nOlNYfw9Iurjv/w==
X-Google-Smtp-Source: AGHT+IF4jA3hebq+TxqejHpsJdzVgo6yJA8tVNVCWVSES5L3g/vKgbx6IXIv9F+15JrZjVk6OmPJBOUbma5xs8mYElo=
X-Received: by 2002:a05:6000:40dc:b0:3c9:38ca:2c1e with SMTP id
 ffacd0b85a97d-3c938ca3186mr8404870f8f.63.1756236851806; Tue, 26 Aug 2025
 12:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250822041526.467434-1-CFSworks@gmail.com> <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
 <CAH5Ym4gTTLcyucnXjxFtNutVR1HQ0G2k_YBSNO-7G3-4YXUtag@mail.gmail.com>
 <aK2DV_joOnaU85Tx@J2N7QTR9R3> <CAMj1kXGWjC3_hNDUxiZWU6UVHoViU=iZuZ2VbCsaqDr-5tMK8w@mail.gmail.com>
In-Reply-To: <CAMj1kXGWjC3_hNDUxiZWU6UVHoViU=iZuZ2VbCsaqDr-5tMK8w@mail.gmail.com>
From: Sam Edwards <cfsworks@gmail.com>
Date: Tue, 26 Aug 2025 12:33:59 -0700
X-Gm-Features: Ac12FXzbn1skHkIUrxKo1DPsOGCXKj1s_SA-_l9aRPtsFagBnZChe9EDxhpfWqE
Message-ID: <CAH5Ym4jK6dHOgO10WTPrHd6w6UK7gJH-95t1Da4NooF+ORB=oA@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_123414_022816_4C36FE74 
X-CRM114-Status: GOOD (  16.23  )
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

On Tue, Aug 26, 2025 at 3:18=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> Indeed. And actually, it should still be the ELF loader's job to
> zero-initialize NOBITS sections, so ideally, we'd make these NOBITS
> rather than PROGBITS, and the bloat issue should go away.

I completely agree. NOBITS seems like the best approach:
- It doesn't meaningfully increase the size of vmlinux
- It has no runtime cost (and indeed shouldn't change the binary image at a=
ll)
- Yet it still memorializes in ELF our expectation that these tables
are pre-zeroed (and addresses some of my other "what ifs" like "What
if the user wants to use objcopy --gap-fill?")

> If the ELF loader in question relies on the executable's startup code
> to clear NOBITS sections, it needs to be fixed in any case. Clearing
> BSS like we do at startup time is really only appropriate for
> bare-metal images such as arm64's Image, but a platform that elects to
> use an ELF loader instead (even though that is not a supported
> bootable format for arm64 Linux) should at least adhere to the ELF
> spec.

Here's hoping -- I'm afraid I can't substantially change anything
about this bootloader, so I've been looking to replace it instead. But
we are in agreement that if the ELF loader isn't following the spec
and NOBITS doesn't solve my problem, then interim workarounds are
solely my responsibility.

Best,
Sam

