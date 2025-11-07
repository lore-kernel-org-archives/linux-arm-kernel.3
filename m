Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C52FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=No6GwKzJfCCDDPKQIQxrIKzPon7QFA7coiXs9eLOLXY=; b=1LpiWzqh+YJE+ovIJzycPxFzvc
	f6DK4LdMZkNbmgISnWVPLT2sBXLlL1gV5GBEEXR1fI9TXwYDhzzD3+UHDGgCrwLtQlRauibrB4iZO
	mY5Mfn1FWkhmkHnqzpOlHD90mupih1TsnCG/dgyIlG5/Nmii2ZOgxvLifgqM3FOuB2UTp7DqkFZgq
	hJvkLgcr619rMEFnudr23cw9ndTKnJZv7goO4xFWeOnF756sDYy6wPC/U3/y4RRyUZ2Nff9Zy6dE/
	iFOtq/0dKDWpmpyX/tQQVBvM1ET1d61KVnDyZSwlRLUR8jhh13NTpfMTVHhePg05LKFZYsKIJQuOM
	9saUrHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjY-0000000H5An-1qLe;
	Fri, 07 Nov 2025 10:30:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjR-0000000H54m-3VpB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:30:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b7277324204so97106466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 02:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762511412; x=1763116212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No6GwKzJfCCDDPKQIQxrIKzPon7QFA7coiXs9eLOLXY=;
        b=UFzWxWj55mwVFZru2sxnMskUsAD4CacYFLmaNW3a2eJIMtaXpYkzEAaqIWcH1CmueN
         9hLW0SpKDg2JYzkcKxAhqFNOMP+0kVv9DaT0t5n34zjG5+mj9eamJON9O4cpSCTENeQR
         0ABNwsBJO3qThBidPnmQxU9schF95tif+RmQx4oMZUqHTdYF2/fd9fjgVCRs1+wS+Cma
         jdz6CxqbuZ1TS346NdTtnD2SIqKK8RsPZcn/zVLAwumYM9txCc2mgEKH/60JstyaXayj
         ZX5zmTZ1H/X45XihLfaPj9L7qQ7eKv1LSaRKHlJip/oRofOQgF6SGdpYhxQRB5pxvzjG
         zsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511412; x=1763116212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=No6GwKzJfCCDDPKQIQxrIKzPon7QFA7coiXs9eLOLXY=;
        b=sFzzMXaIwpT7f17u59tYuVQVvx6XlH8Xk7vpIm/AmcSC57zkexIf/ctFbRRvu1MlBU
         OCiJeqL4kB7fC5zo9xhr8vxSazUnJ3OJYE01QiKSzDEMLRJWi5GiuRtDe7WNGjSiHlhH
         AIp3hycPzgTyXwikM0IiEFUdFirJExbRSmER4VH4rGa9M4llWfL3BLQu+oUfCEz4Ox8f
         7Zz+bMpUR4rjj4vnTX2xVzeeL0hJysfxwZqdiL25qX4T4vbUX4jk9QLxmQ+STihuRjlc
         +wwDtELv449Cvsw9BYAQkDvG48BYRaR2pS94s79VCnSz3VKyxh3LsH2xheqgtyJXtTdm
         uhxw==
X-Forwarded-Encrypted: i=1; AJvYcCW4VDYcmGFn0isAl0YlrAVfkIrBsaK9W2YkWq0DExLwVTKVnEUaNMNaQPuKvJtPjDfXuYlbBLVt/mwrUlN0V0F/@lists.infradead.org
X-Gm-Message-State: AOJu0YwRghoJZFRVp+owuBuBvOw6GthB00HaMGAj0Dez62AlEIXDr3Jl
	ouqENCYL4SKjMt1nn9lff7BDO8fvLmjwkY9A9oW1Qs8w96jkDQIVBDkShpdo1FXwHYO5u6TbJWS
	7yKoGbKmlp0QiARtHRCata+H1MmlUkPckjciUYSuf
X-Gm-Gg: ASbGncs9myfrh79teFVvArdA9f/02ARrBnVfrfya7YMIj+iJEImHcNgUs/ymfHmZg/g
	k8gHFAtJ9Y0IyOho7abeiP3tRlkA9I1+fT3ITWjEOvUCLpwOV5kavBvXw9c7g8+m6u7SshFYK9t
	n09Lf1757ZFpEThl6nZN7TWJc8egDSvFEJxRjwX5Z7F9upoAc9QHkifiFLxOgyBQoj+tm/OE49T
	QMz6f+kxQrCccZYDNBe0Qe236yoOeHrAw2jO1lQZSZt2uVNIWrZ5fUfotXjMfaRdQpUsOAkdnnH
	yRCIxi7UfpgbuDZv0Xt/OrtIqw==
X-Google-Smtp-Source: AGHT+IG30tRXexX+8frHnHjuclcK9+qrxNelFybJrdVL6a5BhtuhdUQJ6TpMRhSTiHHcagf2YAhFzsm/Fo0hqvK7D9E=
X-Received: by 2002:a17:907:60cc:b0:b72:5f93:2959 with SMTP id
 a640c23a62f3a-b72c0ad3420mr268316166b.17.1762511411448; Fri, 07 Nov 2025
 02:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20251017185645.26604-1-james.morse@arm.com> <20251017185645.26604-27-james.morse@arm.com>
 <CALPaoCjJXHD+HgFizzvNEvBorbUcJLTngLb7UJy-uMdybhCfrg@mail.gmail.com> <9e2f912d-2a2e-49ed-b0ab-4286fe94e145@arm.com>
In-Reply-To: <9e2f912d-2a2e-49ed-b0ab-4286fe94e145@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 7 Nov 2025 11:30:00 +0100
X-Gm-Features: AWmQ_bmT_xoyb-k1HQ7hjOxxQERbHJYcErtYbLBLJOgCOM__r3wTvrdClo_rpzo
Message-ID: <CALPaoCg7ZeQOgkeaPQ6ERKtaJqQ_n3xQUrK=qxi01CnuTjL4PA@mail.gmail.com>
Subject: Re: [PATCH v3 26/29] arm_mpam: Use long MBWU counters if supported
To: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	D Scott Phillips OS <scott@os.amperecomputing.com>, carl@os.amperecomputing.com, 
	lcherian@marvell.com, bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com, 
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>, 
	Xin Hao <xhao@linux.alibaba.com>, dfustini@baylibre.com, amitsinght@marvell.com, 
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com, baisheng.gao@unisoc.com, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, 
	Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_023013_944603_C5222105 
X-CRM114-Status: GOOD (  41.63  )
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

Hi Ben

On Thu, Nov 6, 2025 at 5:41=E2=80=AFPM Ben Horgan <ben.horgan@arm.com> wrot=
e:
>
> Hi Peter,
>
> On 11/6/25 16:15, Peter Newman wrote:
> > Hi Ben (and James),
> >
> > On Fri, Oct 17, 2025 at 8:59=E2=80=AFPM James Morse <james.morse@arm.co=
m> wrote:
> >>
> >> From: Rohit Mathew <rohit.mathew@arm.com>
> >>
> >> Now that the larger counter sizes are probed, make use of them.
> >>
> >> Callers of mpam_msmon_read() may not know (or care!) about the differe=
nt
> >> counter sizes. Allow them to specify mpam_feat_msmon_mbwu and have the
> >> driver pick the counter to use.
> >>
> >> Only 32bit accesses to the MSC are required to be supported by the
> >> spec, but these registers are 64bits. The lower half may overflow
> >> into the higher half between two 32bit reads. To avoid this, use
> >> a helper that reads the top half multiple times to check for overflow.
> >>
> >> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
> >> [morse: merged multiple patches from Rohit, added explicit counter sel=
ection ]
> >> Signed-off-by: James Morse <james.morse@arm.com>
> >> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> >> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> >> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> >> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> >> ---
> >> Changes since v2:
> >>  * Removed mpam_feat_msmon_mbwu as a top-level bit for explicit 31bit =
counter
> >>    selection.
> >>  * Allow callers of mpam_msmon_read() to specify mpam_feat_msmon_mbwu =
and have
> >>    the driver pick a supported counter size.
> >>  * Rephrased commit message.
> >>
> >> Changes since v1:
> >>  * Only clear OFLOW_STATUS_L on MBWU counters.
> >>
> >> Changes since RFC:
> >>  * Commit message wrangling.
> >>  * Refer to 31 bit counters as opposed to 32 bit (registers).
> >> ---
> >>  drivers/resctrl/mpam_devices.c | 134 ++++++++++++++++++++++++++++----=
-
> >>  1 file changed, 116 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_dev=
ices.c
> >> index f4d07234ce10..c207a6d2832c 100644
> >> --- a/drivers/resctrl/mpam_devices.c
> >> +++ b/drivers/resctrl/mpam_devices.c
> >> @@ -897,6 +897,48 @@ struct mon_read {
> >>         int                             err;
> >>  };
> >>
> >> +static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
> >> +{
> >> +       return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris-=
>props) ||
> >> +               mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris-=
>props));
> >> +}
> >> +
> >> +static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
> >> +{
> >> +       int retry =3D 3;
> >> +       u32 mbwu_l_low;
> >> +       u64 mbwu_l_high1, mbwu_l_high2;
> >> +
> >> +       mpam_mon_sel_lock_held(msc);
> >> +
> >> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage=
_sz);
> >> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->acces=
sibility));
> >> +
> >> +       mbwu_l_high2 =3D __mpam_read_reg(msc, MSMON_MBWU_L + 4);
> >> +       do {
> >> +               mbwu_l_high1 =3D mbwu_l_high2;
> >> +               mbwu_l_low =3D __mpam_read_reg(msc, MSMON_MBWU_L);
> >> +               mbwu_l_high2 =3D __mpam_read_reg(msc, MSMON_MBWU_L + 4=
);
> >> +
> >> +               retry--;
> >> +       } while (mbwu_l_high1 !=3D mbwu_l_high2 && retry > 0);
> >> +
> >> +       if (mbwu_l_high1 =3D=3D mbwu_l_high2)
> >> +               return (mbwu_l_high1 << 32) | mbwu_l_low;
> >> +       return MSMON___NRDY_L;
> >> +}
> >> +
> >> +static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
> >> +{
> >> +       mpam_mon_sel_lock_held(msc);
> >> +
> >> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage=
_sz);
> >> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->acces=
sibility));
> >> +
> >> +       __mpam_write_reg(msc, MSMON_MBWU_L, 0);
> >> +       __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
> >> +}
> >> +
> >>  static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
> >>                                    u32 *flt_val)
> >>  {
> >> @@ -924,7 +966,9 @@ static void gen_msmon_ctl_flt_vals(struct mon_read=
 *m, u32 *ctl_val,
> >>                                                ctx->csu_exclude_clean)=
;
> >>
> >>                 break;
> >> -       case mpam_feat_msmon_mbwu:
> >> +       case mpam_feat_msmon_mbwu_31counter:
> >> +       case mpam_feat_msmon_mbwu_44counter:
> >> +       case mpam_feat_msmon_mbwu_63counter:
> >>                 *ctl_val |=3D MSMON_CFG_MBWU_CTL_TYPE_MBWU;
> >>
> >>                 if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ri=
s->props))
> >> @@ -946,7 +990,9 @@ static void read_msmon_ctl_flt_vals(struct mon_rea=
d *m, u32 *ctl_val,
> >>                 *ctl_val =3D mpam_read_monsel_reg(msc, CFG_CSU_CTL);
> >>                 *flt_val =3D mpam_read_monsel_reg(msc, CFG_CSU_FLT);
> >>                 return;
> >> -       case mpam_feat_msmon_mbwu:
> >> +       case mpam_feat_msmon_mbwu_31counter:
> >> +       case mpam_feat_msmon_mbwu_44counter:
> >> +       case mpam_feat_msmon_mbwu_63counter:
> >>                 *ctl_val =3D mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
> >>                 *flt_val =3D mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
> >>                 return;
> >> @@ -959,6 +1005,9 @@ static void read_msmon_ctl_flt_vals(struct mon_re=
ad *m, u32 *ctl_val,
> >>  static void clean_msmon_ctl_val(u32 *cur_ctl)
> >>  {
> >>         *cur_ctl &=3D ~MSMON_CFG_x_CTL_OFLOW_STATUS;
> >> +
> >> +       if (FIELD_GET(MSMON_CFG_x_CTL_TYPE, *cur_ctl) =3D=3D MSMON_CFG=
_MBWU_CTL_TYPE_MBWU)
> >> +               *cur_ctl &=3D ~MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;
> >>  }
> >>
> >>  static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
> >> @@ -978,10 +1027,15 @@ static void write_msmon_ctl_flt_vals(struct mon=
_read *m, u32 ctl_val,
> >>                 mpam_write_monsel_reg(msc, CSU, 0);
> >>                 mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMO=
N_CFG_x_CTL_EN);
> >>                 break;
> >> -       case mpam_feat_msmon_mbwu:
> >> +       case mpam_feat_msmon_mbwu_44counter:
> >> +       case mpam_feat_msmon_mbwu_63counter:
> >> +               mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
> >> +               fallthrough;
> >> +       case mpam_feat_msmon_mbwu_31counter:
> >>                 mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
> >>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
> >>                 mpam_write_monsel_reg(msc, MBWU, 0);
> >
> > The fallthrough above seems to be problematic, assuming the MBWU=3D0
> > being last for 31-bit was intentional. For long counters, this is
> > zeroing the counter before updating the filter/control registers, but
> > then clearing the 32-bit version of the counter. This fails to clear
> > the NRDY bit on the long counter, which isn't cleared by software
> > anywhere else.
> >
> > From section 10.3.2 from the MPAM spec shared:
> >
> >  "On a counting monitor, the NRDY bit remains set until it is reset by
> > software writing it as 0 in the monitor register, or automatically
> > after the monitor is captured in the capture register by a capture
> > event"
> >
> > If I update the 63-bit case to call
> > mpam_msc_zero_mbwu_l(m->ris->vmsc->msc) after updating the
> > control/filter registers (in addition to the other items I pointed in
> > my last reply), I'm able to read MBWU counts from my hardware through
> > mbm_total_bytes.
> >
> > Thanks,
> > -Peter
>
> Thanks for the testing and flagging the problem. We should do the
> configuration in the same order for all the monitors.
>
> I'll change the case to:
>
>         case mpam_feat_msmon_mbwu_31counter:
>         case mpam_feat_msmon_mbwu_44counter:
>         case mpam_feat_msmon_mbwu_63counter:
>                 mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>
>                 if (m->type =3D=3D mpam_feat_msmon_mbwu_31counter)
>                         mpam_write_monsel_reg(msc, MBWU, 0);
>                 else
>                         mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
>
>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_=
CFG_x_CTL_EN);
>                 break;

I tried this out but wasn't able to read the counters. I needed to
move the MBWU[_L] write to the end. Writing the registers directly on
the hardware I'm testing with, I confirmed that just flipping
MBWU_CTL.EN sets NRDY:

MBWU_L=3D0x880
MBWU_CTL=3D0x828

 / # mmio_read32 $((msc + MBWU_CTL))
0x80030042
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x03ecb2c0
0x00000000
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x03f70580
0x00000000

Clear MBWU_CTL.EN:

 / # mmio_write32 $((msc + MBWU_CTL)) 0x00030042
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x05004680
0x80000000
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x05004680
0x80000000

Clear NRDY and reenable MBWU_CTL.EN:

 / # mmio_write32 $((msc + MBWU_L)) 0; mmio_write32 $((msc + MBWU_L + 4)) 0
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x00000000
0x00000000
 / # mmio_write32 $((msc + MBWU_CTL)) 0x80030042
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x001dee80
0x80000000

In fact, re-writing the same value back into MBWU_CTL.EN also sets NRDY:

 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x00253e00
0x00000000
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x00b1a6c0
0x00000000
 / # mmio_write32 $((msc + MBWU_CTL)) 0x80030042
 / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
0x018d1d40
0x80000000

Thanks,
-Peter

