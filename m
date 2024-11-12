Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC1FD41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/3C5QTs7l3Bpik5RV8yY+zOUnmIc6f4W9i+LJl1HIQ=; b=n4RCFWMbxV5YnJIx/PV90tn0ar
	B+06dzBRNATMxY9EMXvU9HOWLFYcdkGfr3e2dgpoyD8ZNV2KLQARWHWyWGUMgzrVrKW3Mkn8nwIg6
	Jm9PA++cs6IvJt2PxuOukywsGcSfylTx8XqtOJwC8E5qvH++qjZOH7X/woOyiMZciuD6LUIBFX7+g
	QsxGOJOp9wYv9tVhQax4u6pgTYatOnlhm1Vwj1D7sUUDseE9g7NvsPC42pbusQyrvd6XmJO3Peo+j
	K2mMj49ZazTL2V18wDlLo+CB23B4HqgjkKU1VmuRMlY2rtJuzpTcNlTcr2i/ni1KxokP0i61iaSOf
	iGQqtPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfKm-00000001p19-1Fio;
	Tue, 12 Nov 2024 01:04:44 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAf8x-00000001myG-2Y7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:52:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e19d8c41so7767e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 16:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731372749; x=1731977549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/3C5QTs7l3Bpik5RV8yY+zOUnmIc6f4W9i+LJl1HIQ=;
        b=1uTg1Psjk07tfqiMMaPwYDj8n5c8g16RTy1IdAGc/qr9rK9YnWaLpC6S1kn/uh8Blo
         nPsm33x7FMvCzjoHTsMiY9nAC1k1eJ1smup0Vn9wxGiv2KFXihxdROSylsnsB5Lgw7Vp
         yLHl53X9yaGeK6r2FGUYCcz24fgfjqcAuscsthBy/ELda4OEMfJAlmoYdl++GZ2DTYyB
         VUjdw6SbkGaBkaXfcQ7+/Bsj0SkhAaShpJ6jgD4UPcm7xQbgJXbRdvsycHhDbB07PRUI
         xH74xK9D/Btu0xG8vRcR5O3OibPk4+59c5Zgv8EsjGb6feEe04FfwY6ngBZChcjkRdEl
         c+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731372749; x=1731977549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/3C5QTs7l3Bpik5RV8yY+zOUnmIc6f4W9i+LJl1HIQ=;
        b=Je0RbaheF+gS+35j947pFygBPSfi1LLDKXwhUKz9pptf4ZwI3yyCoKbBuIs/g+z2Z6
         w633252gH6GuXIad+Z1fSvMKaVOsoLSKYv8wETXT6O3SGvjRhNGnazf8xYaq49Ydlcnr
         ETuqkpfLXuSJSSxdEFBmZ9iJtmuRhd7f41cpk6OQ0KeYXXkAJcKFdLPtkLTNOhBJ9y2P
         W0CQ9F2FEVRDyfd8wjih0ISN79Mn9SPES/hBmnmvRmV0oV8x9fHhebdWJDEcQdfauw6z
         cOLD/kX97PUhY3U5HvFcNPkMBGeOk0spw0Fjnf7+jR/FJqHHL1hKPOaoXDIyEFQkL3wS
         RLow==
X-Forwarded-Encrypted: i=1; AJvYcCWtmIag/G62NOSjILreH5vSCoGf0fcO80R/cHbo7Rtlse2OLx+bnEg9vSuyxb/1O9tJCUjmV2w/yq48011KmIBc@lists.infradead.org
X-Gm-Message-State: AOJu0YxEcJ4m7tKn4NlALT4RrsTLyIRwq9LbSh9O+ZCPl3qrCy/c2xTv
	gdfSqYN+8u7wMYf9Wp83RiDT0toCE2+Wh/twD5cHw3O8nUn2al5TivC1ot42t+Me9DmGed606HW
	1eVFJ6qqsi76+6I0frgKPOCs2wAxCKrk5dwAQ
X-Gm-Gg: ASbGncvS4CuUL1M9RUthHtyG58FAib3QZc8kyDu3NbD4GC+LPnOirjT6QF0P2F4r8h2
	fG4jaBFjdRyWheQR+wTQ/QKHaNzN2kECjHVKyISlmM+r43G3Q6fk81BL+20Sqeg==
X-Google-Smtp-Source: AGHT+IHYsqCCOn+C3yPmQ8eRLf6BbWJJRJBSA1CffumGjbn9E9PJBhWGGAwk02oUVBhtLbBpMWoEoOGe5NySvm1wHcw=
X-Received: by 2002:ac2:4c08:0:b0:52e:8a42:f152 with SMTP id
 2adb3069b0e04-53d9b8d6dedmr23863e87.5.1731372749138; Mon, 11 Nov 2024
 16:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20241108211446.3304809-1-kaleshsingh@google.com>
 <86r07jz6uh.wl-maz@kernel.org> <CAC_TJvd=fNRx2VOcEEgjdkY53MwpR0Xa4dX1KTy=nNew7dg9Mw@mail.gmail.com>
 <86o72lzmi6.wl-maz@kernel.org>
In-Reply-To: <86o72lzmi6.wl-maz@kernel.org>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Mon, 11 Nov 2024 16:52:17 -0800
Message-ID: <CAC_TJve8tuBpoeTjwg5=PKFhFaD=M5nwxeJsHeYP1ZezMd_Wug@mail.gmail.com>
Subject: Re: [PATCH] arm64: kvm: Make nvhe stack size configurable
To: Marc Zyngier <maz@kernel.org>
Cc: will@kernel.org, qperret@google.com, broonie@kernel.org, 
	mark.rutland@arm.com, keir@google.com, vdonnefort@google.com, 
	kernel-team@android.com, android-mm@google.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Wang Jinchao <wangjinchao@xfusion.com>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_165231_676612_931D0C08 
X-CRM114-Status: GOOD (  17.40  )
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

On Mon, Nov 11, 2024 at 9:52=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Hi Kalesh,
>
> On Mon, 11 Nov 2024 17:10:18 +0000,
> Kalesh Singh <kaleshsingh@google.com> wrote:
> >
> > I tried to be conservative with the configuration only allowing only
> > up to 2 pages. Your points are fair concerns, I can see how this still
> > may not be ideal for upstream. However, I think introducing
> > NVHE_STACK_SIZE as a refactor still has value, similar to how
> > OVERFLOW_STACK_SIZE is handled. If there are no objections, I=E2=80=99l=
l
> > resend a v2 of the patch, dropping the configuration parts and
> > focusing on the refactor to introduce NVHE_STACK_SIZE.
>
> I'd be OK with the refactoring on its own, which is a nice enough
> cleanup.

Posted v2 at: https://lore.kernel.org/r/20241112003336.1375584-1-kaleshsing=
h@google.com/

Thanks,
Kalesh

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

