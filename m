Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958D5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 01:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7ylmtH1h1K8CyuUFBBRJ+T9/XYWZO25bwG+O3oh1H0=; b=n2oaCwyG/YrhtgoRPW9ZXS0COb
	p6VdApAgzV5FwzHOz65HkmsIrhF5sJtTpa+cszV+NqevyeoOKaCi0WMnM+oDzDnIUl1xmHFOKAg+1
	Sprsqu+jMj7h+Ou3DlldZWTNtl6Q5izpmj411htL6gKHNe/RlObI8HH/qa0Mk4GlFJ3Kri/EvyRbJ
	BSloXQYHttUT4ICl1q6H/crNHwBpZSE+uMYQx7pFljtgNzm9wkEmgWgl4xqtK1PykjhntKYf//u9z
	ytIqRSzaXyXIOda7To34kYr9M1jLXnIvcr5krkF55rK4Bgp82ZLmPMDEHZkZVJ4AdVFN1PQdEKoYo
	J+xZ+7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnT9Q-000000061Ce-1Dgp;
	Thu, 27 Feb 2025 01:57:24 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnT7s-00000006109-45dr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 01:55:50 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6fb7d64908fso4392497b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 17:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740621347; x=1741226147; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7ylmtH1h1K8CyuUFBBRJ+T9/XYWZO25bwG+O3oh1H0=;
        b=dfZ0EroYKrEpy42T4E+JBKmEbhBxfw7TDPmiDG8rnuiNSwz/1BBK2WYtoYXh0ZMbsP
         QiS8G9Q4cOYVwVHTjSqQv4RQo4/loha5oCzqtpfVieqGWErSOeiw8I1Ge9MO+bApZkQn
         PNZvH4Hk5/+if7I+OkrmClkPqffVUdnLZuE2VIMl2QK8KEtDxR9Vmfbz5Z4yCVXPAlaT
         Wv5VXQkmEA0sullDnXmqdG0IQsxWaZkCyFoEH+c1YcKuEyokNQklgE6BNWz8mkU8/0Up
         J9MP5vFd1cp+KZUNbkDWixR0y9VI6O1DQYgciUe7hfY6uZuq7qMBR5XJPz49hMTfw1ia
         3Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740621347; x=1741226147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7ylmtH1h1K8CyuUFBBRJ+T9/XYWZO25bwG+O3oh1H0=;
        b=R/ncL/n7QGk4Y1tKVX58KhOO3hq/E812UJElz2B7euer8tzKjiFp44WMvD16m/ayFK
         QbVersKFHBtEx/3dfJqaJfQvxXFi2YqIOZ55IV1tY5DWNcilWhbTC3vPLIcoVRI1yGrC
         2ORpr/cGhk5HURK9446w3IpgS8Kf9RlILfh31Bt7taScEuNmemsNa4Wf2E4+Tb6t1ufT
         1BvMtMoOT3CL7yoxAkj2yShtaOrDpsF+8dHqmdeCM7d44E7PPoxyGRb/FuazT5o8yH5K
         gINMraosXlwLWzDEbFEjZYYIftBTT+bd/fMeMEazKkP7jIoI/hmIFma8A43v8dFWg/MM
         aMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9lVEYGYuLr1fd1G4u6GCPPWzx5+1wMirdEci3nOMPDH1iD2Q2wpZ87dBNatnFeccuoZ1b0TQ7u+uAdlgduEV4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxary1t6plGYX4K+17/tsnP5fb8coJi8ITMNVbkrg6aXKi26nu8
	piWNOU0KldpUVpIK5G2k9bHMittkMzPaeGkqU6RGanSJ0lCZCYLIOTIkPuAY4ETXe9yitV1HZ5G
	YX+dwKQm83GxBa60nQDaokEFsILHW2iPsluVlUQ==
X-Gm-Gg: ASbGncvuR5X7EmaXePV6qY7DKk4Ze3Znx37fkQL/iLOS4brkP/49Jiu8/jiEsp+4v0l
	fcBAH5wAmJeOs1EHYC18iLNvx9oI73YjqTjvQwe99FqinUDKCpZO5d8JW480BDzO3Mf15YcJt2r
	A4lA4hJrE=
X-Google-Smtp-Source: AGHT+IHzvdnR1jDhSTQ8qilflEhVDXXhrfQPEbKHX390Tv5HVxnb5kCDP/uDUeA+G1lHLQvrrevPA0tkD3CkUNLb6+w=
X-Received: by 2002:a0d:e543:0:b0:6fd:2587:cb32 with SMTP id
 00721157ae682-6fd2587ce9amr37319607b3.31.1740621347348; Wed, 26 Feb 2025
 17:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
 <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto> <92b42216-c409-4e21-a33e-54c29fa5f8a0@quicinc.com>
In-Reply-To: <92b42216-c409-4e21-a33e-54c29fa5f8a0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 03:55:36 +0200
X-Gm-Features: AQ5f1JoWpbR4msT08jh6oiWBnd9arDDGPKh6dQcrHSO5lw25XXPxGsD4vcj6_h4
Message-ID: <CAA8EJpobfKD=WjapG7Vx0mMFrGYSbadsrsakWs65Lpt43z7wVg@mail.gmail.com>
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_175549_020502_5C06496C 
X-CRM114-Status: GOOD (  31.49  )
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

On Wed, 26 Feb 2025 at 22:23, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>
>
>
> On 1/14/2025 2:34 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:11PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
> >> sequences to bring it out of reset, and to initialize the associated eUSB2
> >> repeater as well.
> >
> > What does M31 mean? What is the relationship between the eUSB and USB
> > M31 PHYs?
> >
>
> M31 is the vendor.  I'll reword this to make it a bit clearer.  There's no
> relationship between eUSB2 and USB2 PHY drivers, as the eUSB2 based driver
> would require some additional components such as a USB repeater.
>
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  drivers/phy/qualcomm/Kconfig              |  12 +-
> >>  drivers/phy/qualcomm/Makefile             |   1 +
> >>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
> >>  3 files changed, 281 insertions(+), 1 deletion(-)
> >
> > Please run the patch through checkpatch.pl --strict
> >
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
> >> --- /dev/null
> >> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> >> @@ -0,0 +1,269 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/err.h>
> >> +#include <linux/io.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/phy/phy.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/reset.h>
> >> +#include <linux/slab.h>
> >> +
> >> +#define USB_PHY_UTMI_CTRL0          (0x3c)
> >> +
> >> +#define USB_PHY_UTMI_CTRL5          (0x50)
> >> +
> >> +#define USB_PHY_HS_PHY_CTRL_COMMON0 (0x54)
> >> +#define FSEL                                (0x7 << 4)
> >
> > GENMASK()
> >
> >> +#define FSEL_38_4_MHZ_VAL           (0x6 << 4)
> >
> > FIELD_PREP
> >
> >> +
> >> +#define USB_PHY_HS_PHY_CTRL2                (0x64)
> >> +
> >> +#define USB_PHY_CFG0                        (0x94)
> >> +#define USB_PHY_CFG1                        (0x154)
> >> +
> >> +#define USB_PHY_FSEL_SEL            (0xb8)
> >> +
> >> +#define USB_PHY_XCFGI_39_32         (0x16c)
> >> +#define USB_PHY_XCFGI_71_64         (0x17c)
> >> +#define USB_PHY_XCFGI_31_24         (0x168)
> >> +#define USB_PHY_XCFGI_7_0           (0x15c)
> >> +
> >> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)      \
> >> +{                           \
> >> +    .off = o,               \
> >> +    .mask = b,              \
> >> +    .val = v,               \
> >> +}
> >> +
> >> +struct m31_phy_tbl_entry {
> >> +    u32 off;
> >> +    u32 mask;
> >> +    u32 val;
> >> +};
> >> +
> >> +struct m31_eusb2_priv_data {
> >> +    const struct m31_phy_tbl_entry  *setup_seq;
> >> +    unsigned int                    setup_seq_nregs;
> >> +    const struct m31_phy_tbl_entry  *override_seq;
> >> +    unsigned int                    override_seq_nregs;
> >> +    const struct m31_phy_tbl_entry  *reset_seq;
> >> +    unsigned int                    reset_seq_nregs;
> >> +    unsigned int                    fsel;
> >> +};
> >> +
> >> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
> >> +};
> >> +
> >> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
> >> +};
> >> +
> >> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
> >> +};
> >> +
> >> +struct m31eusb2_phy {
> >> +    struct phy                      *phy;
> >> +    void __iomem                    *base;
> >> +    const struct m31_eusb2_priv_data        *data;
> >> +
> >> +    struct regulator                *vreg;
> >> +    struct clk                      *clk;
> >> +    struct reset_control            *reset;
> >> +
> >> +    struct phy *repeater;
> >> +};
> >> +
> >> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> >> +                                    const u32 mask, u32 val)
> >> +{
> >> +    u32 write_val, tmp = readl_relaxed(base + offset);
> >> +
> >> +    tmp &= ~mask;
> >> +    write_val = tmp | val;
> >> +
> >> +    writel_relaxed(write_val, base + offset);
> >> +
> >> +    tmp = readl_relaxed(base + offset);
> >> +    tmp &= mask;
> >> +
> >> +    if (tmp != val)
> >> +            pr_err("write: %x to offset: %x FAILED\n", val, offset);
> >> +}
> >> +
> >> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> >> +                                    const struct m31_phy_tbl_entry *tbl,
> >> +                                    int num)
> >> +{
> >> +    int i;
> >> +
> >> +    for (i = 0 ; i < num; i++, tbl++) {
> >> +            dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> >> +                                    tbl->off, tbl->mask, tbl->val);
> >> +
> >> +            msm_m31_eusb2_write_readback(phy->base,
> >> +                                    tbl->off, tbl->mask,
> >> +                                    tbl->val << __ffs(tbl->mask));
> >
> > could you please check, what actually gets written? I suspect there
> > should be a -1 here.
> >
>
> The __ffs  uses the ctz/ctzl built in, which counts leading zeros, so the
> -1 should already be accounted for.  FIELD_PREP uses the ffs builtin
> directly, which would require the -1.  Confirmed that the writes are being
> done as expected from the programming tables above.

Ack, thanks.



-- 
With best wishes
Dmitry

