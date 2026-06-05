Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D193ACD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpMyQdGHbfPgaCwyp8J3+AmKMFsrwRFq/0ejDCYeplI=; b=zcY96cDAONvpceCdo75/oE19op
	4a7TDvjyjNFvjhmaHuRI096Y3DrTk0cU2B1bntD3RpIyCJlC5hgGQcI7I6KkHfmSBGKmHmzRFHlnH
	IMuP+X4NTykYUIYv7YsLPuSNM5+bIJCiDNJ4aTFad1VguRG4Gwt6F65qz+xSDYhRiiAxZJs17RPML
	s+ON/M4Gr8QLAIFgQa0GKxCOkhpcvEzo2+Ejd89ovDw07SIyCiWCsM5TsA6dLmfauUAZnVwDb/CSM
	6URYmHBdaQlVWExVADaiMrZ4G0CiJjH+WGPgwfUcRQ70i44BwRh3PtPxMCWEQbjpHZoKY9nFAXYNN
	8CtNcIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbQr-00000001AiD-2dnh;
	Fri, 05 Jun 2026 20:46:21 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbQp-00000001Ahd-1fw2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:46:20 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-963b70c2678so1738544241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780692378; x=1781297178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpMyQdGHbfPgaCwyp8J3+AmKMFsrwRFq/0ejDCYeplI=;
        b=iNNfFBGCu/Mwu9vf+x2Z0Z6cllgKjnvIcNvHuOBuans7LqiCvzpF1054ptE47REuPE
         Ej1UXScV+WI5i0EE9NJSrRF6cIZydcYnID0reGSsO8DNl96GS/Zz/0pgOgiltidralJf
         WzqGZvk+I7NYiw4t26YiGvO5WJQ6K9b0ssz2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780692378; x=1781297178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LpMyQdGHbfPgaCwyp8J3+AmKMFsrwRFq/0ejDCYeplI=;
        b=RKVxxfP7EOJjZJ1ry2MpYI/FkimhTB4YHAcXtNkftTYXCGv1js2tK/6JQDUA7YC+dj
         1lghARTcZgD9e2YmNqk7CQ8NRyX2DCJesiKwTyQG4cXaQ/1cRecDgF2NMuoHwztY8K5e
         MmW4ncUA4I4mohIZyzgQip/JHDs57WZfY9CL5X66uuyvPyRMbY1bQwp4CItdg6tI8dME
         g4S9NoTkwgr4Vpw9V/Le0c5b0D1QI6X71YrDvEs4eIvQZwIo8cen7iIMFM2Dwc5qpNgJ
         XzGUCtaivG7BB4Uc2/GpvCWSK4NhMANr1nftvUOazoGHvrKW8ofcTx2IvPqNDg3wvqnX
         ix/w==
X-Forwarded-Encrypted: i=1; AFNElJ99lAHnVmofIfPEvV3gznBLxjn334WiPD1w5PFkZynx3t51ql4FGRK9BH3zVQLLP686Ob6QuNixocZARc4whWq3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5cDs622kCtvnhKwbcpOh296SU1S9JzmmWu7vyr7X7QoXhhJ4J
	wPQD6MXJNyf/HqDoQEaRIjrlvRzKBp4IIGdZ8rhCGKbMvt9hqq6S7e8lAo4FogNpswqVZccQ4M/
	jCVA=
X-Gm-Gg: Acq92OFhrKURcbMuG2IW4pG1cIXrfgV/tA+EPpg0cN08/nh2NBFd0OjK5Ru14PHZ3xJ
	MSvwHilAQouxFGJrlAg47hJ4PGjfea9ZB4yur9FNalTphIkqJSl5K1o7d8CFH357OZ5Y44UpnJC
	m1zv1WRg4ZmjLJTd5WraMSUmYZZIeWYrpXrf5+hZKi/QFNoaVTMiVjvkI9Mj9vsae6u2zUePoQp
	9KnAc2csCAN3NrOMCo2qoBY4cdMCaUohc6eTdG1pxQx6FWc5GArTgHzIxMchq8vfSMB4jQgBTwQ
	7tZmNuuq0W9oM2DYQkJi80J5X3mVMVkrxcMZmYq03WAW1K5FLXKvtuQszQMhN3WgdJ08+/Ik3dt
	QlMwtz6XN9PuHrANR9+SgJz1kqxsgeCri5qfFjnQqPdRxHsBOWgzqzOfWPgjpzP4xT+MoWo06bt
	FL15/AkKhliljsW4RVLRdDxbCTIsEnaYamjFF+ubtVzQ+j5hyxn7BCp1T4QZV2nFGsp4lygtff
X-Received: by 2002:a05:6102:2c01:b0:643:80f1:33d1 with SMTP id ada2fe7eead31-6fef1848cdcmr3874495137.13.1780692378114;
        Fri, 05 Jun 2026 13:46:18 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413d48caesm8322763241.0.2026.06.05.13.46.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 13:46:17 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-963d7e5ffddso1424618241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:46:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/raCLILtLgE/RVw8M1339YeVNHXhxu+riBNvxxQ+Q/ogxz6O+VaeOudk0y+J85fuRlvTj7Smur6ZX33hppAHFQ@lists.infradead.org
X-Received: by 2002:a05:6102:3ec8:b0:604:f029:224c with SMTP id
 ada2fe7eead31-6feef48708dmr3598198137.8.1780692376913; Fri, 05 Jun 2026
 13:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780496779.git.kas@kernel.org> <ba8074cdb9ca5a471162cbc15f775c1567a3992a.1780496779.git.kas@kernel.org>
In-Reply-To: <ba8074cdb9ca5a471162cbc15f775c1567a3992a.1780496779.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 13:46:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7djCgmvAarNpoQ=dVvvTv+Dvgk0mByuRWJz_M__XX3Q@mail.gmail.com>
X-Gm-Features: AVVi8CcJohAazTgATqoOWT25fbewiKs82OyaXxEYgtfEgQ1yrJLlQjsJTpbaU1I
Message-ID: <CAD=FV=X7djCgmvAarNpoQ=dVvvTv+Dvgk0mByuRWJz_M__XX3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] firmware: arm_sdei: add SDEI_EVENT_SIGNAL support
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
X-CRM114-CacheID: sfid-20260605_134619_449202_F50A4295 
X-CRM114-Status: GOOD (  13.72  )
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
> Add sdei_event_signal(), a thin wrapper over the SDEI_EVENT_SIGNAL call
> (DEN0054) that makes the software-signalled event (event 0) pending on a
> target PE -- delivered NMI-like even when that PE has interrupts masked.
> It takes no locks, so it is safe to call from NMI / crash context.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  drivers/firmware/arm_sdei.c   | 12 ++++++++++++
>  include/linux/arm_sdei.h      |  6 ++++++
>  include/uapi/linux/arm_sdei.h |  1 +
>  3 files changed, 19 insertions(+)

I'd never looked at SDEI before this (so my review is probably not
terribly strong), but this looks reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

