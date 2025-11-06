Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D3BCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 12:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/LVRGbg/R0cjzjNFLUaSneDEebgcwM8tmDj+wYNpmo=; b=xclxJEUiPjrdZOOUqc6czH6orO
	5bGgjcwGNrjviI0IFOJNvFVhk1NoOVHQGXxtAY7RdqwvVTw2SZ52Ij0ugvii2dbEmihpg5qV9JkhI
	56YqLOqebTULofPb7GqaR3wRQ37IMaGpc6KWnTLU/M2TZ33e2adu+UFMvIlXHZeil/P5VZYgV+d9X
	Q6JlE6Iv6Agl/i2c6L4BtjJ2FeASkY/k+uE7k4l4bplcZaNfv0HF+qCCUmYRks1EWiBlO1ONJeR31
	ZSFHmExbU/J3KZe42b1Z/+fym506YKY45x7E9XbsDr5vLve6oXpXHilQTyyYRBGpv6f3ZMBj+ETyP
	fcTwp/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzVK-0000000FWHF-0MHy;
	Thu, 06 Nov 2025 12:54:18 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzVG-0000000FWGN-43Om
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 12:54:16 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8b22319db92so101433085a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 04:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762433653; x=1763038453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/LVRGbg/R0cjzjNFLUaSneDEebgcwM8tmDj+wYNpmo=;
        b=VoQxV5TsBIkkU4fxM7JUuZn7PC2S659B9Okrm3CsD0Nsc9fwcFSfwzPlvSVcgNFBSn
         NdIKOTL1oDyqhoqslCr/H4zR0X8YnlIYNpjbZDGwzvRiS0ZfB4hIsjorTiH//8oyZiHw
         cJn3/v9FWQOHYmEQN7tMbW0AGwy2vAN2rFJeVz1Cik9+QV2AOEQKhNDldfR6gJeRYr+B
         G8A5lPGw8CgAAVfwTKozUWxVtcUBXGzqElBGMtENi4x9fiegIArYhzlAWCNQ9k6P3CGm
         4aUFUp3KMTdpWQHY2O+bL9zXPp58REW8DFTnksRKVhulm+5OcDpEv8GGul1Wne6gXjmS
         MnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762433653; x=1763038453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/LVRGbg/R0cjzjNFLUaSneDEebgcwM8tmDj+wYNpmo=;
        b=UGaXQfLbuE0ufErBILXKDiIjbnoBOSyus7y4ekRA527AU1+8+i5EUyQ6REE8clh+Z2
         hLvSj39uHxhoBN+W8pGXzvUQApArPkE2jSkcwhFuJhqUX2jQbybI3M8pul7cpIqvYv5t
         PJdMNNrTGgkD7++cODYBLdHyTygRyuUibMZ/g/o3jujUy1A4m/u2FLXM2s5fT9RLKtPG
         z9dFQwj0AzXnbXcOpT/T/2CZu83intDSnMZWCPVZLHcMgwupVg7NZuL8W8qKWlrRpeE3
         KK7M0JPMvme+DsRmmfSifxspWiM8F4i1OOrP41utXDNF4SXfSX2mBbSQmxh3L45FKs2/
         C29w==
X-Forwarded-Encrypted: i=1; AJvYcCVljGrq05Blur8n9Om9yUyYSjHlbivOugu7Xo+PrQ/vlobzWeUwwe5JnA77rXilAjthZAslqxNenQ9nWqFXfZfx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdu8y5mt+ZmZ+URhTqbHL34/W8QjvaDbGqZwZZaivLPKFHgPX1
	pjiM/wO/FPQYNfLX1T+mDWM00/NCDlb3M6u1aDs1HYK7pn5JhdfpdD2XC/kS5CzeXC89XFitCWw
	/i1TcYMN69b4FV5eYBfI/hrTedO2E8a+TT55J5ZzsKQ==
X-Gm-Gg: ASbGncvXVSn8zYM0uUBvWbjM7s5tWdaaOl/kGPnC1QaY7Myn8e34AgoJ0/uDBZDxN/B
	Jx4AqduLtH/4TpXbwwv6amNOxImXFmB0V4a/EXIhRv6Dn3G+PS3nOod0dTTCqbt/t95OeLPXAwd
	2XzNHeEK40Wvd6+imEeCbWdZLV58VTe/p4B4UOsesJ11KlH3uuJrU28PCjiNkN8w7fNPPtbsoXy
	ZqLx7iRTCL+QivMue0f9QNlp9SzghixwsylF71Fkm3P5TvBbQe2hZPd1ruu8mZtc7U5xC5X+i8+
	Ouxy2P5QuAgLnGR4uA==
X-Google-Smtp-Source: AGHT+IEpN34zsZ5wwP2Owr6OUUnpRIoC3kvxluiNbq9Twjvdxl3iJYLPHL5b6ByEpptX+tubFgXzvxv/TWtG9ClhlUI=
X-Received: by 2002:a05:620a:4548:b0:88e:1123:ec9 with SMTP id
 af79cd13be357-8b2353258bamr344615485a.36.1762433653176; Thu, 06 Nov 2025
 04:54:13 -0800 (PST)
MIME-Version: 1.0
References: <CAJ9a7VjTqBczkdMYXqb1WmDRUYhC--dY6Ky5R=NfUZaYkiWmVw@mail.gmail.com>
 <20251103084615.3666468-1-yingchao.deng@oss.qualcomm.com>
In-Reply-To: <20251103084615.3666468-1-yingchao.deng@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 6 Nov 2025 12:54:01 +0000
X-Gm-Features: AWmQ_bnQTEL57TvE0l2_raUBvNJd91O5zIwL8GGfWa4dYKgD0z8HrW_TTtLT6k8
Message-ID: <CAJ9a7Viir9Eows=Lphw_W9qVGDoHRd3uzMxXbwEPMcjXvPth2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org, 
	james.clark@linaro.org, jinlong.mao@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com, 
	suzuki.poulose@arm.com, tingwei.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_045415_045675_A1B0DC80 
X-CRM114-Status: GOOD (  38.88  )
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

On Mon, 3 Nov 2025 at 08:46, Yingchao Deng
<yingchao.deng@oss.qualcomm.com> wrote:
>
> >Hi,
> >
> >This set is looking good now and appears to be getting close to being re=
ady.
> >
> >There are a few minor issues in the second patch and a few items that
> >need to be confirmed.
> >1) I note that you removed the code to prevent calling claim/disclaim.
> >Does this mean that you confirm that you have tested the patch update
> >for claim tags I posted works on your system?
>
> I just tested this patch, the default value of qcom_cti's CLAIMSET regist=
er is 0xf,
> and unlike the standard CTI (write 0 is no effect), it can be written wit=
h 0.
> So, is it acceptable to write 0 to the claimset register of qcom_cti afte=
r reading the
> devarch register during the probe phase?
>
>         devarch =3D readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
>         if (CTI_DEVARCH_ARCHITECT(devarch) =3D=3D ARCHITECT_QCOM) {
>                 drvdata->subtype =3D QCOM_CTI;
>                 drvdata->offsets =3D cti_extended_offset;
>                 writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
>         } else {
>                 drvdata->subtype =3D ARM_STD_CTI;
>                 drvdata->offsets =3D cti_normal_offset;
>         }
>

OK - if you look at v2 of the cliam tag set you will see we introduce
a "claim_tag_info" attribute to the coresight_device structure. This
is initially set to CS_CLAIM_TAG_UNKNOWN, and on the first
claim/disclaim API call the claim tags validity will be tested and a
value of  CS_CLAIM_TAG_STD_PROTOCOL or  CS_CLAIM_TAG_NOT_IMPL set,
skipping the test on all subsequent claim calls.

if you set this  in the probe function i.e.  csdev->claim_tag_info =3D
CS_CLAIM_TAG_NOT_IMPL, then the claim tags will not be used.


whichever method you use, please ensure a comment appears in the code
describing why the workaround is necessary.

Regards

Mike


> >2) In patch 2 I made some comments in regard to ARCH values - please
> >confirm that these are accurate and have been tested as working on
> >your system
>
> Yes, the bits 31:20 in qcom_cti's DEVARCH register are 0x8EF.
>
> >3) As mentioned in the comments to patch 2 - you need to update the
> >docs for the new sysfs selection file you have added
>
> Will update in v6.
>
> Thanks
> Yingchao
>
> >
> >Thanks and Regards
> >
> >Mike
> >
> >On Mon, 20 Oct 2025 at 08:12, Yingchao Deng
> ><yingchao.deng@oss.qualcomm.com> wrote:
> >>
> >> The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=
=99s CSCTI.
> >> It allows a debugger to send to trigger events to a processor or to se=
nd
> >> a trigger event to one or more processors when a trigger event occurs =
on
> >> another processor on the same SoC, or even between SoCs.
> >>
> >> QCOM extended CTI supports up to 128 triggers. And some of the registe=
r
> >> offsets are changed.
> >>
> >> The commands to configure CTI triggers are the same as ARM's CTI.
> >>
> >> Changes in v5:
> >> 1. Move common part in qcom-cti.h to coresight-cti.h.
> >> 2. Convert trigger usage fields to dynamic bitmaps and arrays.
> >> 3. Fix holes in struct cti_config to save some space.
> >> 4. Revert the previous changes related to the claim tag in
> >>    cti_enable/disable_hw.
> >> Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_c=
ti-v4-1-7677de04b416@oss.qualcomm.com/
> >>
> >> Changes in v4:
> >> 1. Read the DEVARCH registers to identify Qualcomm CTI.
> >> 2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
> >> coresight_cti_reg_store() functions accordingly.
> >> 3. The register offsets specific to Qualcomm CTI are moved to qcom_cti=
.h.
> >> Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947=
294-1-quic_jinlmao@quicinc.com/
> >>
> >> Changes in v3:
> >> 1. Rename is_extended_cti() to of_is_extended_cti().
> >> 2. Add the missing 'i' when write the CTI trigger registers.
> >> 3. Convert the multi-line output in sysfs to single line.
> >> 4. Initialize offset arrays using designated initializer.
> >> Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic=
_jinlmao@quicinc.com/
> >>
> >> Changes in V2:
> >> 1. Add enum for compatible items.
> >> 2. Move offset arrays to coresight-cti-core
> >>
> >> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> >> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> >> ---
> >> Yingchao Deng (2):
> >>       coresight: cti: Convert trigger usage fields to dynamic bitmaps =
and arrays
> >>       coresight: cti: Add Qualcomm extended CTI support
> >>
> >>  drivers/hwtracing/coresight/coresight-cti-core.c   | 144 ++++++++++++=
+---
> >>  .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
> >>  drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 184 ++++++++++++=
+++------
> >>  drivers/hwtracing/coresight/coresight-cti.h        |  60 ++++++-
> >>  drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
> >>  5 files changed, 346 insertions(+), 87 deletions(-)
> >> ---
> >> base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
> >> change-id: 20251016-extended_cti-2a426c8894b1
> >>
> >> Best regards,
> >> --
> >> Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> >>



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

