Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1DCCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPoQivoj0bwUpJuAKFBN3YZX3F888EB0gmOCY9Z/+Io=; b=W6uqEMKD1g24VXkqe6eomTAli9
	uA+XFfwLlTkv8lUY2y1yGUD+3dt5TyCC539LCYXvWPw8Gdr3jNrtntjCwRszNr18Ki+vbVRH/feRj
	ouioQAXQmwaAa9RPSbQIIkleb0MlV7qyKGpsNjEG1PVEBWDg24KH1TRmQJ8FZFFeeWGWGS4iCZAuf
	7betOaE6V4ObauGhYPSD0wXFEDCzPA2nfPHBgF7ggGpK5L+Xe0mkVWXa5jKCTNmP5k/Jfnz0HFO7O
	cgQ/ZhfMebteYCAH81edvFz1TXKQu6NKI31s5F7m+UrrjjCZeRF7Gp5EGgIQSd5M1eT8uBqQxHnbf
	qnxzy74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2eD-0000000Ftot-1yNx;
	Thu, 06 Nov 2025 16:15:41 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2eA-0000000FtoO-1mfZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:15:39 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640f4b6836bso2017361a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762445736; x=1763050536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPoQivoj0bwUpJuAKFBN3YZX3F888EB0gmOCY9Z/+Io=;
        b=QlkAcso0OnhcBs5kqcBm9DyT4/6ZMf1jR7aMZFeNtvfPdCuVo4HUnAO6Wc2Ey63wMU
         oM07SrrcKXWk/b1sMTiUnSwITWlugCS8BHpjVilcqt6uAWut/gscc8AyxH+xbFKwIqwW
         B866jqRtBeLEmlgv0WKuHlMl1J1845YCZ5smKWhoLGcYyGn7LMnEx6ub3HUJBk9Lqg5a
         4302h0+cWUO+0JwpkByvWw314kToO9WI48yWV2c/ysuLiRjqm103T2Wu9wx8+Pz0xYeJ
         xGRW70xJ9dVPL/5gr2YEm9smhx9+kglOWfLijAM0SHMc6/jYUua4mcf0k6qYQNlCPn75
         0NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445736; x=1763050536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPoQivoj0bwUpJuAKFBN3YZX3F888EB0gmOCY9Z/+Io=;
        b=bklTXuiRtE0M2bezpkElOLEZjfYobByDjDSTbCzQtcY2BA7SXndd4KkkjAy3+qP9y+
         EZag4DTxw52jDsr3vlfJXxPnXFGP5z4w2RzVzopXTNAgiigNXkGyswvoe48POnqhasJO
         G0bBCZwPUWiuY3yg3G8LSgtIbSvoYkl+JntnsOgfXId8NQxYIvW25YhbDqY5185Bppgw
         QAuPdRbyXn2maMr6xn+VQvgqH8KeTkUM+CiSnQeLsg5ynmn73E24ckG+eyltipdbR1Vg
         VdW0Bhw91NdI5ofxUQlyOUKU6F7XEuJlRzM7i4oIdUi4mC/+C5w+AvUPo6KOK+OILSGr
         RRZg==
X-Forwarded-Encrypted: i=1; AJvYcCU3wDYOuF1MO4EaZvabLzhsco1B8X8XNfC43M4AVeyeQsBv+B+7Xe9aQRu+CB6k2Ofj6KRqYiYLcVftaxrsRN6L@lists.infradead.org
X-Gm-Message-State: AOJu0YxlsUCNi7eNK/or8Hr5nuXWEXUrrE1lovLzUh+McqsJUTT4vc1x
	eGshSVE2d5oUa0JzaBzL0ebmH6OMajO03bCjGN4qU2/3kGQHx/DDyBpEf4Ow5/F6DOixI9UIC45
	m3ZFdkcT5+mLtx2BIu7/HgRcdjcDXAg7TdPaxRWg4
X-Gm-Gg: ASbGncu7tYqfTmA17KtSn40kiqD1U//9545J0gCPFsP8Y+G2uzJBYtY43IoGciqPMiO
	Cp+yNib6RKtGPQB8ssNSZ4xmtqhgk5oKk9A3bt6NpW0+YdiW7ZX461nRsChXfyIQqSnSwNDoHQh
	4dNY3GxhqAgpC5SDSFP51hGYC7D0NnA4wQtEDoGNnSqYRdt6ZeyiFJHGuxviIW0BsImOBz5QCHf
	MeWsGUjAqwATo1NNXUs6cUpCU3Wtv++lfcH29WpyGXytavNM9FTi6m4fYBIOxvTSkbyfTJBUnMD
	4gqsvJFj34P2HhY/YpCityndRatPKkJPfLbW5fjmWfct2Yo=
X-Google-Smtp-Source: AGHT+IG1Ov7pFXZaXVB28owjtebImD4qpmyq8jDV9Ajg9ePMC3Z2ezu3r4M3Fi3zUR5W25bem+LibNeSUkoSsiLYH1I=
X-Received: by 2002:a17:907:c89a:b0:b72:ad95:c1c2 with SMTP id
 a640c23a62f3a-b72ad95e38bmr159947966b.11.1762445736030; Thu, 06 Nov 2025
 08:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20251017185645.26604-1-james.morse@arm.com> <20251017185645.26604-27-james.morse@arm.com>
In-Reply-To: <20251017185645.26604-27-james.morse@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 6 Nov 2025 17:15:25 +0100
X-Gm-Features: AWmQ_bk1VJkZkQ5a_WKDE9YukLtljH9rcbobFcoQ7adNDshEM1jjBJbj5ZmMVU0
Message-ID: <CALPaoCjJXHD+HgFizzvNEvBorbUcJLTngLb7UJy-uMdybhCfrg@mail.gmail.com>
Subject: Re: [PATCH v3 26/29] arm_mpam: Use long MBWU counters if supported
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-acpi@vger.kernel.org, 
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
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Gavin Shan <gshan@redhat.com>, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081538_511428_09CFE9EF 
X-CRM114-Status: GOOD (  30.99  )
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

Hi Ben (and James),

On Fri, Oct 17, 2025 at 8:59=E2=80=AFPM James Morse <james.morse@arm.com> w=
rote:
>
> From: Rohit Mathew <rohit.mathew@arm.com>
>
> Now that the larger counter sizes are probed, make use of them.
>
> Callers of mpam_msmon_read() may not know (or care!) about the different
> counter sizes. Allow them to specify mpam_feat_msmon_mbwu and have the
> driver pick the counter to use.
>
> Only 32bit accesses to the MSC are required to be supported by the
> spec, but these registers are 64bits. The lower half may overflow
> into the higher half between two 32bit reads. To avoid this, use
> a helper that reads the top half multiple times to check for overflow.
>
> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
> [morse: merged multiple patches from Rohit, added explicit counter select=
ion ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since v2:
>  * Removed mpam_feat_msmon_mbwu as a top-level bit for explicit 31bit cou=
nter
>    selection.
>  * Allow callers of mpam_msmon_read() to specify mpam_feat_msmon_mbwu and=
 have
>    the driver pick a supported counter size.
>  * Rephrased commit message.
>
> Changes since v1:
>  * Only clear OFLOW_STATUS_L on MBWU counters.
>
> Changes since RFC:
>  * Commit message wrangling.
>  * Refer to 31 bit counters as opposed to 32 bit (registers).
> ---
>  drivers/resctrl/mpam_devices.c | 134 ++++++++++++++++++++++++++++-----
>  1 file changed, 116 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index f4d07234ce10..c207a6d2832c 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -897,6 +897,48 @@ struct mon_read {
>         int                             err;
>  };
>
> +static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
> +{
> +       return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->pr=
ops) ||
> +               mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->pr=
ops));
> +}
> +
> +static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
> +{
> +       int retry =3D 3;
> +       u32 mbwu_l_low;
> +       u64 mbwu_l_high1, mbwu_l_high2;
> +
> +       mpam_mon_sel_lock_held(msc);
> +
> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz=
);
> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessib=
ility));
> +
> +       mbwu_l_high2 =3D __mpam_read_reg(msc, MSMON_MBWU_L + 4);
> +       do {
> +               mbwu_l_high1 =3D mbwu_l_high2;
> +               mbwu_l_low =3D __mpam_read_reg(msc, MSMON_MBWU_L);
> +               mbwu_l_high2 =3D __mpam_read_reg(msc, MSMON_MBWU_L + 4);
> +
> +               retry--;
> +       } while (mbwu_l_high1 !=3D mbwu_l_high2 && retry > 0);
> +
> +       if (mbwu_l_high1 =3D=3D mbwu_l_high2)
> +               return (mbwu_l_high1 << 32) | mbwu_l_low;
> +       return MSMON___NRDY_L;
> +}
> +
> +static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
> +{
> +       mpam_mon_sel_lock_held(msc);
> +
> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz=
);
> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessib=
ility));
> +
> +       __mpam_write_reg(msc, MSMON_MBWU_L, 0);
> +       __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
> +}
> +
>  static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>                                    u32 *flt_val)
>  {
> @@ -924,7 +966,9 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m=
, u32 *ctl_val,
>                                                ctx->csu_exclude_clean);
>
>                 break;
> -       case mpam_feat_msmon_mbwu:
> +       case mpam_feat_msmon_mbwu_31counter:
> +       case mpam_feat_msmon_mbwu_44counter:
> +       case mpam_feat_msmon_mbwu_63counter:
>                 *ctl_val |=3D MSMON_CFG_MBWU_CTL_TYPE_MBWU;
>
>                 if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ris->=
props))
> @@ -946,7 +990,9 @@ static void read_msmon_ctl_flt_vals(struct mon_read *=
m, u32 *ctl_val,
>                 *ctl_val =3D mpam_read_monsel_reg(msc, CFG_CSU_CTL);
>                 *flt_val =3D mpam_read_monsel_reg(msc, CFG_CSU_FLT);
>                 return;
> -       case mpam_feat_msmon_mbwu:
> +       case mpam_feat_msmon_mbwu_31counter:
> +       case mpam_feat_msmon_mbwu_44counter:
> +       case mpam_feat_msmon_mbwu_63counter:
>                 *ctl_val =3D mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
>                 *flt_val =3D mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>                 return;
> @@ -959,6 +1005,9 @@ static void read_msmon_ctl_flt_vals(struct mon_read =
*m, u32 *ctl_val,
>  static void clean_msmon_ctl_val(u32 *cur_ctl)
>  {
>         *cur_ctl &=3D ~MSMON_CFG_x_CTL_OFLOW_STATUS;
> +
> +       if (FIELD_GET(MSMON_CFG_x_CTL_TYPE, *cur_ctl) =3D=3D MSMON_CFG_MB=
WU_CTL_TYPE_MBWU)
> +               *cur_ctl &=3D ~MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;
>  }
>
>  static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
> @@ -978,10 +1027,15 @@ static void write_msmon_ctl_flt_vals(struct mon_re=
ad *m, u32 ctl_val,
>                 mpam_write_monsel_reg(msc, CSU, 0);
>                 mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_C=
FG_x_CTL_EN);
>                 break;
> -       case mpam_feat_msmon_mbwu:
> +       case mpam_feat_msmon_mbwu_44counter:
> +       case mpam_feat_msmon_mbwu_63counter:
> +               mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
> +               fallthrough;
> +       case mpam_feat_msmon_mbwu_31counter:
>                 mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>                 mpam_write_monsel_reg(msc, MBWU, 0);

The fallthrough above seems to be problematic, assuming the MBWU=3D0
being last for 31-bit was intentional. For long counters, this is
zeroing the counter before updating the filter/control registers, but
then clearing the 32-bit version of the counter. This fails to clear
the NRDY bit on the long counter, which isn't cleared by software
anywhere else.

From section 10.3.2 from the MPAM spec shared:

 "On a counting monitor, the NRDY bit remains set until it is reset by
software writing it as 0 in the monitor register, or automatically
after the monitor is captured in the capture register by a capture
event"

If I update the 63-bit case to call
mpam_msc_zero_mbwu_l(m->ris->vmsc->msc) after updating the
control/filter registers (in addition to the other items I pointed in
my last reply), I'm able to read MBWU counts from my hardware through
mbm_total_bytes.

Thanks,
-Peter

