Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EA6CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISDeP/qyYAEltSrqbCKLAdEkNOxIUqnGYCtw5a23CLI=; b=1iGcof3GEMgNu8uKZ3fcrxqI1n
	nuuQ9b9SBcHpTkCOlKKE38SbaszD355UV1K5pUwUbdaNEN+5QFsqAImnMZ08PMfPbiH734OV8FT05
	QO4LvjbDVcS55cQ0PeM7FJ5qK6SKrjMyoTsnVmKWPhZWFGM16R8Pjiimf0dPZX3HcviZSG6EWiOWn
	O6XmeKc7ytMS39OU/+gvntQkfBLr0Gs7KTKXmDlmrRqJjcXPh7Q/1mabaLWiW5OMdhevJ80HYFJlX
	txlokeHgsyynCNsYy+6DnTvVv6KnL4TRk1f/6KdBveg28yak71lGNu8B63oF+2ttJeGM15czFQASL
	gNvpKg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wValH-000000018wb-35QE;
	Fri, 05 Jun 2026 20:03:23 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wValE-000000018vp-43TA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:03:22 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-6c25b040555so2180112137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780689799; x=1781294599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISDeP/qyYAEltSrqbCKLAdEkNOxIUqnGYCtw5a23CLI=;
        b=ViHrSR7dkVvZTHyKm+Gc0sbhWEQQShaJerfjxaVpXqC/6d2DNxs7WjLAs3Tj72KTqY
         SPnpH35qTtrWKPazgfAp1G9EjjvQq4ShhBPjrVZigVVC73EB2NlMowDtUPKRjsuaGor+
         FiuKaEIgnKpJ5ysEg46EVM2H0fJta5UIc3DrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780689799; x=1781294599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISDeP/qyYAEltSrqbCKLAdEkNOxIUqnGYCtw5a23CLI=;
        b=syUlkEjgkgvJTnYQiW6ldRis4EmOCxnAYhUkvdgohmHt5PObGxBM2GkeKEM00WNFsM
         FMSK/oHiElAY+z+RgTu9x5e4mSigMt4F76SUJLqps3rPxJF1HiAdBs7u8L4EGW5E5C/6
         QlCUvikoN2ZZxvd0hIZQQc6QQ+lZUCGYIxOLBgFfuh6I9FgSFG3UDv3u4G6qBO+6bMCq
         jOVCOjA6qPPVuC2o5Hj03n4h8tQwi9Ki57LdrjNZ6zveyqn8f1O7hyrPRz7d3xGTD1jL
         6g5vhkewWOCenVHb1YwyqtXREHANxalS+HdPNdHARvLXpFr6X3qgrcS57UwIFqGoa8YG
         pl9A==
X-Forwarded-Encrypted: i=1; AFNElJ+7iOg1o46WhO0Sf1tNAtFsHX/AC08nv5lu50Taz36zyyxkyJbxC+YTCv9RLrH1hYIEStwRP9Ss64j+5t6cRCDg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2+iCeNtBc+11RGJU5VodnR7bzac7hFBNZGsqWGz9+yMdmuYI6
	77yopiEBoirTVJuCu7Qy3DNVB5bmTRLkDSKy/fjNMGYup7tQdEGF8b/FjPHrqZqtxRQ7SMn2Nlc
	HOJk=
X-Gm-Gg: Acq92OFHGEg/36fTmr46Q6C7VWY1ERL+Tby/dz8jtNeyCQ+mbl5eOicLj7phKsGDwfA
	a6B4lfQpCNs57u2NFNfn0ls8kP4gm/uzxVuL1qsX0bKD6qohVq8rejN/rv1prq+HVaQ40uPR9G9
	k/nPe+WhAV9D6JcGkGDHUB8y6MtxI67lJN/AFk1d4KVECvpjNUekAagvghQIcs1zPzqLDVFocIn
	jagvHn81yaoEVi911bqhnq18EZ7++1uFHCYA/zNl4UzRHhdKjG3getIHJZ67TgPlV7fV/k/wJpA
	DqYYyh/7JLmUmN1vI5DTfUiIzge5CCmMvtQ/KTYsX2N2ojfSfukvHqSWLcnplZme/XTzK9By4Iw
	8I7SuNWLhX1RkZEnVPfcnREWmqIpq1/CiojL181RzTIjzOWATHB4yCDL3qNaeTgddQBFV9/5ezZ
	33/5qJXLphTYxWxLiOeJymZWUH4cI1ukCGVvSAJAIDeNOnMYaF8jkE5SFb9jxMus6uvfrj2Got
X-Received: by 2002:a05:6102:524b:b0:606:49d:1861 with SMTP id ada2fe7eead31-6fefe2c53bcmr3101403137.27.1780689799100;
        Fri, 05 Jun 2026 13:03:19 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb551b4c56sm8367417137.2.2026.06.05.13.03.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 13:03:18 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963d7e5ffddso1402487241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:03:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96L4r3OfOW4xCdI+Ce3+nZwaG91p01R6Byx7V7Jlf2tYRxRZAMuH0X2DdIdA4/X3ldsq1fwOBX6vjhHg5eJDMA@lists.infradead.org
X-Received: by 2002:a05:6122:906:b0:56d:451b:e4dd with SMTP id
 71dfb90a1353d-5ac5792009bmr2730729e0c.12.1780689796811; Fri, 05 Jun 2026
 13:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780496779.git.kas@kernel.org> <6172eafcb9de6e626c0f1c36426d67e1e562ed32.1780496779.git.kas@kernel.org>
In-Reply-To: <6172eafcb9de6e626c0f1c36426d67e1e562ed32.1780496779.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 13:03:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4eJ__dQc1e8CGgj5sMDNrD1MgEEy9Cgj9M5n-WmYAXA@mail.gmail.com>
X-Gm-Features: AVVi8Cemd2ZnzLkxdzHldi4k5VmRnmgjGuGWN3228_wubZLNmG-MW1yRJDWJrzg
Message-ID: <CAD=FV=U4eJ__dQc1e8CGgj5sMDNrD1MgEEy9Cgj9M5n-WmYAXA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: wire SDEI NMI into the hardlockup watchdog
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_130321_207874_44E32374 
X-CRM114-Status: GOOD (  16.28  )
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

Hi,

On Wed, Jun 3, 2026 at 7:36=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov.nam=
e> wrote:
>
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> Select HAVE_HARDLOCKUP_DETECTOR_ARCH so the framework takes its backend
> from this driver. A per-CPU hrtimer checks its buddy's heartbeat and
> signals event 0 at a stalled CPU, which runs watchdog_hardlockup_check()
> NMI-like.
>
> The source is chosen at boot: SDEI if firmware provides it, otherwise a
> perf-NMI counter (pseudo-NMI) fallback -- one image covers both.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  arch/arm64/Kconfig          |   1 +
>  drivers/firmware/Kconfig    |   3 +
>  drivers/firmware/sdei_nmi.c | 247 +++++++++++++++++++++++++++++++++++-
>  3 files changed, 248 insertions(+), 3 deletions(-)

I'm a little confused about this patch. We already have a buddy
hardlockup detector using the hrtimer, and it's even been improved
recently to trigger in a smaller time bound. It looks as if you're
duplicating bits of the perf and buddy detector here?

I don't think you need this patch at all. The existing buddy detector
+ patches #1 and #2 in your series should be sufficient.

Did I misunderstand?

-Doug

