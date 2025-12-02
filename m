Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A76CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9F+kG2WqkAYgELZzGbRFHTmjlUcifa4ki8f7o3ssRY8=; b=QDNmOLs15e0jAY9CZouRxNQn8j
	b3PDT6Xa3jXw177qVv8Jyv3JUjNZA2sHCSxAcMRbEN0sLFIpvNqoqgwM6o8w4Xj8gW1nLkhmSbdo1
	P1JH0qUy6JROAdki9b0Uv3oCG/3uecQpJoMYkAvyo/BY8/U5ByWI0Vzj93SyNe8+XI3UfOySIinBg
	0k/ZWc02hCyV8x/dM9UeMMWoyKnD6ZUq/EGjOL42YVEHHcbKg9+NEU03CubrBkjBZp/XNZn8+4d3j
	xlSQZAqRiIPLhvjEggQZBcHmpSHh5bdsCujz8KhGSleZnmF108C1d7FL4yP/fAFyrdUhqoHRNxi7L
	RQ0pDIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNZF-00000005FMU-35I3;
	Tue, 02 Dec 2025 10:25:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNZD-00000005FLu-0du0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:25:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so9526144a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764671105; x=1765275905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F+kG2WqkAYgELZzGbRFHTmjlUcifa4ki8f7o3ssRY8=;
        b=ZjsdHiSaiszUTN/AKh4Dt5BIKSZ2UzB3yaWuyUvteVC+JUvTZD4NIoMoDT1PBUbxKJ
         dWeq3RAQtuc8cajwVVZ7UVO87Rad88bsHLpZ6lvkju+lmgA3KIRcF874KNr0oDxcydL7
         wuPjWSPdnTPl/Q/Y6d5zr9uVB0NomMUVdil212YOSqCCyYRRzwOdJK1rkmW39tN0w2Tp
         Uwqnc2PW4bo5tUvlFnoeIowcpROfVos9+tlOrYyw39Cvj6or1a1sLIdSyF5GSPRK99Wj
         aAmr7hQ0+Gc8USXdVlLbrADTONVoVZd+0X0f6wKS3iVlPENZ9Ob8EEr9P6zSvprbrbPe
         Knsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671105; x=1765275905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F+kG2WqkAYgELZzGbRFHTmjlUcifa4ki8f7o3ssRY8=;
        b=Dw0THW2s3e40hR10RlBwk1QLbICQWuINwTTjDcW0HoBDNU8BUsok+ypwKoJ+OhKlFK
         4sCU0CbuEVqFNU1yd9iCU0bjPbBCT75WU1p2zLFnx9C2waAlulbeVMc/Opa8I6IxSArV
         1tswJAqlH4qaGVwhLyptyJHrTQQ6vM17bnXdmkR5v6YgZRz+W0C7hqbjN3ox6QGbRFK4
         tB756C4AdZXxVyO9k71JFBKId6mVQFaz6TPo96TeJDoDw4NsDuiRvXL/edazLgN8UFzt
         fNtGWwLvb38BK+VMg5kGQfypvMOMQjbbHvna7pdx4QECyRcYERomkY3qq9re6cOwdzu9
         mw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFAEh6Zc85+GHTrbLFpR6a3IouXUV+XPikcP3lcwel/Q9E7ztDnjPOzRWJINoi11mOvHmrKFrnTVMA3LjtqkVP@lists.infradead.org
X-Gm-Message-State: AOJu0YxM4w6RT6hAODm4IR78Sh3BkNz6TSJKFTwtCwP4DB99+5FUsGXJ
	g6ldCX9J4+IHUr+QEUq9m3pHa66RtKppklxPhT2TwVM/NLMMdNTwUVrw86qaQ7vnAu7jE0I1gBs
	49/7/rAxukPJYhlz3+YWzFeh3JJDrjMNk1c90N8K+WQ==
X-Gm-Gg: ASbGncv70VpFxr4DdAAvthREYgchyglhrSeu5nGbrkp3OsTngZzeh6/FQZGcdFqXT77
	GbwEaJWbeYtklA4WdgPx7yFLqmj6DDdgRA2myw9L9x+3ZtF3poAVnzVZzWQxD3tBBXFnaKBL+Fv
	FcOz+aT2mCHXOJIew+C8SjkMcu79APJzlBJ4eKoIDtY0ouoCi2dHjRllwEtReiJnm1ZyZU+xMgd
	sBVdvRWUaR0LYY+24mCINOcvoThKUIR1uepQVukQ/ftN28f1PYftXxtLAha4B600fELedOUCq0k
	a+1SSGlyorps4PdMgUkw5a/1m/C2I+JQ3Q==
X-Google-Smtp-Source: AGHT+IFeIg09WwzL5CLtleL+CNmHwhQV6vEuLIx5Fl2LU6DZGnHpNrCnyZsUrJae/DQnhwmUFLH/yStogQ2YhR3HkVY=
X-Received: by 2002:a17:906:b208:b0:b76:bb0e:5ac9 with SMTP id
 a640c23a62f3a-b76bb0e5b20mr2495117366b.40.1764671105183; Tue, 02 Dec 2025
 02:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
 <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
 <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
 <CAKfTPtCKmj_dHGU-2WPsEevf7CR-isRiyM0+oftCrMy5MswE4A@mail.gmail.com> <6ulzkdgd6j35ptu5mesgtgh2xa6fwalcmkgcxr2fdjwwfvzhrf@4dtcadsl2mvm>
In-Reply-To: <6ulzkdgd6j35ptu5mesgtgh2xa6fwalcmkgcxr2fdjwwfvzhrf@4dtcadsl2mvm>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 11:24:53 +0100
X-Gm-Features: AWmQ_blE1MXJMGsP4HVSDepyDYEV9gPAzgGeXgYsjEilqSbt5qtjWWttwjyQjSI
Message-ID: <CAKfTPtABGj6Nys8J8x8Y-PvybORQUoVN0mGLS=qZ__zXqvCWPQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251202_022507_228746_B2BB2A3C 
X-CRM114-Status: GOOD (  36.02  )
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

On Tue, 2 Dec 2025 at 11:12, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Tue, Dec 02, 2025 at 11:03:07AM +0100, Vincent Guittot wrote:
> > On Tue, 2 Dec 2025 at 10:53, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > >
> > > On Tue, Dec 02, 2025 at 09:54:24AM +0100, Vincent Guittot wrote:
> > > > On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org=
> wrote:
> > > > >
> > > > > + Vincent
> > > >
> > > > Thanks for looping me in.
> > > > >
> > > > > On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> > > > > >
> > > > > >
> > > > > > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > Changes since 20251127:
> > > > > > >
> > > > > >
> > > > > > on i386 (allmodconfig):
> > > > > >
> > > > > > WARNING: modpost: vmlinux: section mismatch in reference: s32g_=
init_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (secti=
on: .init.text)
> > > >
> > > > Are there details to reproduce the warning ? I don't have such warn=
ing
> > > > when compiling allmodconfig locally
> > > >
> > > > s32 pcie can only be built in but I may have to use
> > > > builtin_platform_driver_probe() instead of builtin_platform_driver(=
)
> > > >
> > >
> > > The is due to calling a function belonging to the __init section from=
 non-init
> > > function. Ideally, functions prefixed with __init like memblock_start=
_of_DRAM()
> > > should be called from the module init functions.
> > >
> > > One way to fix would be to call memblock_start_of_DRAM() in probe(), =
and
> > > annotate probe() with __init. Since there is no remove, you could use
> > > builtin_platform_driver_probe().
> > >
> > > This also makes me wonder if we really should be using memblock_start=
_of_DRAM()
> > > in the driver. I know that this was suggested to you during reviews, =
but I would
> > > prefer to avoid it, especially due to this being the __init function.
> >
> > yeah, I suppose I can directly define the value in the driver has
> > there is only one memory config for now anyway
> >
> > /* Boundary between peripheral space and physical memory space */
> > #define S32G_MEMORY_BOUNDARY_ADDR 0x80000000
> >
>
> Ok. I fixed it up myself with below diff:

Thanks !

The change looks good to me

>
> diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/con=
troller/dwc/pcie-nxp-s32g.c
> index eacf0229762c..70b1dc404bbe 100644
> --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> @@ -7,7 +7,6 @@
>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> -#include <linux/memblock.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_address.h>
> @@ -35,6 +34,9 @@
>  #define PCIE_S32G_PE0_INT_STS                  0xE8
>  #define HP_INT_STS                             BIT(6)
>
> +/* Boundary between peripheral space and physical memory space */
> +#define S32G_MEMORY_BOUNDARY_ADDR              0x80000000
> +
>  struct s32g_pcie_port {
>         struct list_head list;
>         struct phy *phy;
> @@ -99,10 +101,10 @@ static struct dw_pcie_ops s32g_pcie_ops =3D {
>  };
>
>  /* Configure the AMBA AXI Coherency Extensions (ACE) interface */
> -static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_base_a=
ddr)
> +static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci)
>  {
> -       u32 ddr_base_low =3D lower_32_bits(ddr_base_addr);
> -       u32 ddr_base_high =3D upper_32_bits(ddr_base_addr);
> +       u32 ddr_base_low =3D lower_32_bits(S32G_MEMORY_BOUNDARY_ADDR);
> +       u32 ddr_base_high =3D upper_32_bits(S32G_MEMORY_BOUNDARY_ADDR);
>
>         dw_pcie_dbi_ro_wr_en(pci);
>         dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, 0x0);
> @@ -149,7 +151,7 @@ static int s32g_init_pcie_controller(struct dw_pcie_r=
p *pp)
>          * Make sure we use the coherency defaults (just in case the sett=
ings
>          * have been changed from their reset values)
>          */
> -       s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> +       s32g_pcie_reset_mstr_ace(pci);
>
>         dw_pcie_dbi_ro_wr_en(pci);
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

