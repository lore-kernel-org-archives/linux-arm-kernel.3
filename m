Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9260DCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=; b=Q1W/0YLqo/4ddHxOt3aHbCSBo+
	kL3A9catAZNrwMxx9xbb/aE9JlHwdS7u9Hle3muL+zI1evHpyPfSy1NnFj6H3YirV2erHn25llH2c
	8KovhD5EsWOR8R6oBC5pBrEW12oLM2JMD9vbo3QL4NR0LNPmHtZ78nu1S9W1L6HYpniX1ASSo1dN9
	LklPBlXPPonawQGNIh6K0CcqPZFZSuiHE27/2li7ckrRt/l4FzdTL0yWnivZUht6zshVvNULLeOq2
	xAYn6NmehFlo/CH5t6E0GEm8CIagnRF1IIvzgueRCr1t2mNydah+wBui5/Oqe1YLQYqMfDaZpYgL6
	lkvS7/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNEA-00000005DTw-0bWT;
	Tue, 02 Dec 2025 10:03:22 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNE8-00000005DTW-1k29
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:03:21 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so2328578a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764669798; x=1765274598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
        b=o0GpEbW5BvADKfP7q3rhEJ2ZZ4hTJyPfB2+Krjlu5W6E/HGEgD8LQlYOFQ9JoS44tz
         klCD0eh2TRfDgaRvEgSaSqMTQLc6z/f6mebKS0OTH7u2i+PWG1+wRbiHf0ePCkeh78z7
         5VFr65TyjXuWXKVrR+1Ln+pyv1Z+/9TfrSE8q52Gi8FBj287YBi5xFYweHaO3g1Ls8xr
         iqKzgydCNspiVExoWb9tqyrZN1+6EMD/pkZcw+GOF+8PhszTESZ1itjQ2pcj5pgMOZdF
         E2HZqnjEozbVZVMqZ4EGEDGO54ThsEszHi7r3fOxzFdS8+6L0Yqx5hCcsEyG2ZzcbhFb
         hZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764669798; x=1765274598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
        b=mc/cEbK3ddlXCoCd76gZLRbKXgXxq1Iw/az2G2ACSLc2LZf5/nkAAE5+E/XoJMyWfv
         Ab9AMVubp2thAoAyL38SzSX6Hap0DaEVZ+ZVTeCgBr/qHu7qG+e/f/nVVyuBkW3fYp2C
         6u+bnhmP0t2j/7bXCINPfvVhhTjBkl26fAhLzDNbrGS3SyTRAHQicbupoQ5xZWgMpqZT
         mi1xsSz+MXyD+4DQ12ssVQFiUfEv8DnC8W4pQVVQZrGNQf/KPRzHwupIjXGnzvnCTZ+4
         0OY3/QwmoGkwDdL+W1ovynWTCmcAa/QxUd7XVRbfiBlI+qrJCOVfU360ndUup0GagLtI
         yeJg==
X-Forwarded-Encrypted: i=1; AJvYcCX2FmNHGZCfanZpedDVgLKHByhkHUsaO93vREmwA81Ss1XtyNthq6jB1PrtqcT/n5HA4nPXQvEb7vQU5lXRZC5j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1delxSHLPzpbXAPeHsmry/YQutxRSSsHbVFxVtVVle8tlywng
	HRI6xjjlM967js1v3bj9NKipBt9mzHhm5uH/sKOO/y/NhW97THtUZ7dt+eWkbiqLb2ltFtmf5nH
	2TUxSJF2Nb0tA5JtPg9rsD/SM98+pEbmbszFB4g38tA==
X-Gm-Gg: ASbGncvlNaxOH5k/I/DIPXFiU+TJ9N8PGNszUrdA2KjLPFJadG7yUP5G50EkHnE8IWk
	/Es4+UwHjCaUjLoSsm0ROK8KtU1BMY4NuI8AboRn1MJZih2DZMIHNxi3qypbrC154D/NOW0HO5S
	qHYssbvA2bZdA37w66z9Yxor5E9GhEfo+zbCOMja0cJs9odcoNqfOmi3FUduQOZufr5w7KwUT8B
	e6uXD+rI1iyMYKYUSWBTdpHq5RKuMEVWrxmhbtaRckek64CiEmSyVJbbtHAad5arzz9AWorMVbn
	/v71MSTTVZ+87e+fCs5F/XU=
X-Google-Smtp-Source: AGHT+IEzBZUvVe8v+NU3LgQcNDFZ1ywLGlvr4nq6P74LNME9ZQgiTo5FgVQnVsGl1RzS2H+nuAAtY4Diulatz7/9lxo=
X-Received: by 2002:a05:6402:1ed5:b0:641:3651:7107 with SMTP id
 4fb4d7f45d1cf-645eb23bc16mr27607615a12.12.1764669798505; Tue, 02 Dec 2025
 02:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
 <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com> <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
In-Reply-To: <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 11:03:07 +0100
X-Gm-Features: AWmQ_bnvt_8myvimspzAlsv7ON2LSirITDuqDAMojw-oVlxKenWaOKPgLgNEaRI
Message-ID: <CAKfTPtCKmj_dHGU-2WPsEevf7CR-isRiyM0+oftCrMy5MswE4A@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 28 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-pci@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_020320_471513_A40D1311 
X-CRM114-Status: GOOD (  22.76  )
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

On Tue, 2 Dec 2025 at 10:53, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Tue, Dec 02, 2025 at 09:54:24AM +0100, Vincent Guittot wrote:
> > On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > >
> > > + Vincent
> >
> > Thanks for looping me in.
> > >
> > > On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> > > >
> > > >
> > > > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20251127:
> > > > >
> > > >
> > > > on i386 (allmodconfig):
> > > >
> > > > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init=
_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: =
.init.text)
> >
> > Are there details to reproduce the warning ? I don't have such warning
> > when compiling allmodconfig locally
> >
> > s32 pcie can only be built in but I may have to use
> > builtin_platform_driver_probe() instead of builtin_platform_driver()
> >
>
> The is due to calling a function belonging to the __init section from non=
-init
> function. Ideally, functions prefixed with __init like memblock_start_of_=
DRAM()
> should be called from the module init functions.
>
> One way to fix would be to call memblock_start_of_DRAM() in probe(), and
> annotate probe() with __init. Since there is no remove, you could use
> builtin_platform_driver_probe().
>
> This also makes me wonder if we really should be using memblock_start_of_=
DRAM()
> in the driver. I know that this was suggested to you during reviews, but =
I would
> prefer to avoid it, especially due to this being the __init function.

yeah, I suppose I can directly define the value in the driver has
there is only one memory config for now anyway

/* Boundary between peripheral space and physical memory space */
#define S32G_MEMORY_BOUNDARY_ADDR 0x80000000

>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

