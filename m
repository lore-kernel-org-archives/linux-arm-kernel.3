Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A1EC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=; b=jlIorvuvdzw9H2ev/Gjk8F02OK
	aN55ws7huW0qzipIlzS3nsQOOqrAQN5v/kSr5qTa1HRT3Gy2VDX7FUu6+8kJibEqP80dnYmh1Ud46
	jvROVcjL3bIA9gv7RhWkw8BIUMyMGhEifIawqQ9FnzrypKtSLJkNtgmZvN6+OcsgDmu/S089jWlNK
	G45NPnj3/IVqBzKw8w5I7uyp7UM9eQdZ0K9tRepytPFPfnZrl0sJYA592lOkVxShTjYLE+L2K6CO2
	RztLGNGptMx2HgDi8zsMVxAahJ/nHvA/BN9pXH2ApLQWuuIh+K0S6jflQBHSwiBcSRMCwqLb38Ivr
	8suHZU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKgg-0000000HBk2-3Juc;
	Thu, 16 Jul 2026 11:55:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKge-0000000HBjc-2HWI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:55:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiWw02475163
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=; b=YiudG+I2F1ZQxgZx
	4N6qfruU4OF2hA2wyVxhqfkKGvoLahO1KV2unqq18ca4FbN3VGsj3H26W7oPmV/r
	ntAgChfzQk8iH5qx5Il3dsmmMpD7n8bfyUw+XS/wCDAG7+xex4m6iVcoswaK3G1w
	gfaxppW5UM9uxEM0IMir5GZjLaH6hyYlrbspV/+fBLCzZtGqhlXJY1eG54nDCY7m
	AXCPgby3moriOiMOcF7ijZIKXpMMhEmPnSKlBNIfku2dWVJJKnvjTJPp4ijQ7f+n
	r/RnCcHfZY/MWXhgHHO8pkBzZ2qYiliIZFbaMBgfbIjmVkP9uBas28d//K25ES5l
	PFavxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7s7rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:55:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e4ba1cfabso41719251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 04:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784202930; cv=none;
        d=google.com; s=arc-20260327;
        b=aPZMHNU2sgG4T80+0e6ks/Se8ft+cRMNDuSYlyGkdEimkIjgx5Jba4WidTIC92bong
         PmkBffJnOp5oLUxtIae9jIgjVWS/ZW3S8E7pv1nJ3yExIQwiLlPnoN2mQciTCYSmed2H
         z0yCLwbyGq6IV9iLsXc035IV0bqETSqDwWnsPrf20TsVpTu7eXpUfPyb3HdoXlU2EwrI
         FNGtrz0h5w7z1jLQL9p71gvDu4S83Jza7cbAeNH/TVfmXXuxAtD0Wr+pLvMu1ARmcKZZ
         MLmh7xmj8/9c8VdceG99/idw3QL99E2ARZBBFU62Daa1qrP0U/AydDQrsbyXUkeZ8ETG
         T+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        fh=bWVs+ZpcXTqIYgrF+Q+uwq9YLY6fbw2cLc3pMHv1dAk=;
        b=JY9vHJJxopgq/8Tqzb20RBgciAEkp0JUj1SYGpOA/k0+UJ6URah+nG2NcXf/cXfoUl
         ancl0MVypCj4SHougrYe2djIoV5W/rCSiMZ75OujVS8SjO8R/68idxyNXC2uDYH8d2kp
         AfUYv6fwRhDGXNHAVuBpPySzOW/meVXz6Dj9mHacZKjYlTzcq4ZUdZhztatiQbLS++i+
         gciyK3h3OIyYBLSODnc3rhW2DlNdsQ4zFoAW3m1ntrUU5r21kp7H/ZE65S34dtR9g9ub
         VNFplkBsqc42a4w9rT5cymgxvTeP+5bdymagr5yQtroB53RfnvQEbA3LsItMp5y0J3oH
         6TTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784202930; x=1784807730; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=XDI7dRCNZHtvYJteo8/NbqyZVA/49BMeQlJPiqJqqTUXeFj/S2Ect7n/6YgsIXX0kw
         iFB3nk0HnC5W2M30t+3P9jPHJwbVPvkb3HnBHQD9axBETjvZaZ/uDz2hE7xIqu0RRtO9
         qcwophStDEFAzjDep1bn8RyZGElDkzMfjNz0N1Tx6ukP4uuL1nCrVaO+RTS5eASKiJTT
         uprN2JjUInKiRlx1F9ivaY4yVEJb0RIJio5rAHE4S4MTQaYfZlw9tQetjj6qavlk8v1c
         x/3DYuYrvGRoGcXs+oGjuS/0StgHFdnNTxfCKbgSyWkZUvCF3IN/fvIJlkpaUEZN1U86
         8x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784202930; x=1784807730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=niqAiYCpPmQQNuEjY25mPjLxG0QZzzzTnTATDroJKY4SL5h6k3/gWLGQpyGQaUx5/0
         xDTsZCsNhn48MeSbXNdav5upXtDWlPH3KPlpL28ebZYWNdlCcSNeD5h3MaY4H/tdZ6bh
         Z4y4ph4JBY9f6A1xVI3/aBUmxR7b1bAQhzBT/5ifykxCLpWE8NvCe1gY5W6hPt2gq2JB
         vNfPnvhvlpZ8F+MQUN0UjYMdlpfq+1OJcaeiYk5U370QQSsO+blbJe4EOTUTpvI/Tcdg
         Qa6WnBRsbUgXldqa3dsr9GyG6DWgWz3qI2HaevB1igcyy5WNkHpG+3+EwDPKsBAb/kIa
         fYjA==
X-Forwarded-Encrypted: i=1; AHgh+RpvmdIfeF8q3FmY8JcKXstVtvNBV/wjxg7zRWlpr2F0s38U8Sk/UVm3UIgTb9QubXJ0DbuaFz7+g/2ZR842VEBp@lists.infradead.org
X-Gm-Message-State: AOJu0YyNlHmDaQrNl8ATBXyJDMo3Ojm7aZFU+f8EcyTAEAHXfpjlOfRP
	NjU93Feyc8OgrT7kYS6iy9oDZrfUIoenkMOkCpzbkeVD5MQ+uO7AU2EYDild4BEnsX+fU9gbenD
	QCYzs5rJl0EV0C5/yo47rg/3B10NsB2RCzS3JZ6UAMr7hzhRg1i217jaAOx/qzVH1Ub7z+FnY5k
	oMXEbLANxv5izk9dLQtKXDc6ycL3yy7s6gViZPrPHvaTPH6P6UVCDs
X-Gm-Gg: AfdE7cn3EpklMxpnWBBoR2uzc4D9M9o0fZkqx1Ey56RLFItuF3CCkHY3IN0/rKYc0zE
	5CtOLbqSszzHlUnobdVMpi+jAQuSntCWXrYUkFlBsoZwDqwDPlRVCXtjCxN065G1jrPTvAyV+ly
	4q7WTr9DbCxi9/HMuFcB6R0+f4/wQ6huVfq/LJDXpUO69OC5rXo75qo9saGg==
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-51e4ecca047mr71644451cf.0.1784202930470;
        Thu, 16 Jul 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id
 d75a77b69052e-51e4ecca047mr71644011cf.0.1784202929904; Thu, 16 Jul 2026
 04:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com> <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
In-Reply-To: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:55:18 +0200
X-Gm-Features: AUfX_mwNMY8bmSOOoE3tn-LA0Fojd6Jz_KE9ZsYKsw02nHYdKrjLLMH4z5Iwnas
Message-ID: <CAPx+jO9aajD9eFTEUdAFOO-wC5NduaYhbDmYw5DHeFj92Fmd9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfX5+DAOAveLOsu
 zaXfXETl4gGZ37dy7hWFLEnyzSjW1V0KYgizs3njpebOhKFO0xwRBBbLc7dpTUrD1KkEj7yE9y/
 7Hbv2RacK1E8n5lInGB7QJl4KPiM5F4=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58c6b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8
 a=AEl4uQJCqG-skdcfchQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfX7nzKy1Ok+qIa
 96xNp9RjbZpubwVgPGA+204JPKqrzNJaclECMtGj+vYSVrlVQpDbhQbwZVMn/Ogx0zp2ISRdSZT
 OI5KzdtjdB/CL+EaWqsEiMHv2TXaCm97HGQToNgOEdxAn2pX2l3oY2jzKgT+yhJMIJj/6LG562A
 tUDQkADYLuEfhWcoC3+8DG6d7QYCDYWV2r0v3RgD14HnirI0S3VdB+ASJq8y5/L5lHXQBe1hR7q
 P67NW52Mp5q3+iKmUW+w9Kb4uxMo7fM4yGxMcsSubzAXAROhA5azir9DGqYGKGjlrWbbupcJr14
 DL2ZGsswyHKPhNHXPb+NQOs+WmBWCgf9fmD7wdaEFSdUBMSJN63OgvbdGjV+LfYuPmU6E5QYCqw
 +snkfQSc0eZH6URIxmjwN7Lg+tcHCPPq20Xro/a4rOV/y6YBmImHsodHE4/jLfXYhPvHYkpCAfI
 2Caag/7hPhVKLr1Obzg==
X-Proofpoint-ORIG-GUID: h1vIacgmzFjTw9zqSJ14c0wUWArgAlT-
X-Proofpoint-GUID: h1vIacgmzFjTw9zqSJ14c0wUWArgAlT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_045532_596912_1F5FC940 
X-CRM114-Status: GOOD (  38.85  )
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

On Wed, Jul 15, 2026 at 11:11=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 14 Jul 2026 at 14:04, Ulf Hansson <ulf.hansson@oss.qualcomm.com> =
wrote:
> > On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > >
> > > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) S=
oC.
> > > For now this just supports the always-on power domains, and dummy clo=
cks
> > > and resets for the serial console (which is enabled by the boot loade=
r).
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > --- /dev/null
> > > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> > > +static struct generic_pm_domain *r8a78000_genpd_xlate(
> > > +                       const struct of_phandle_args *spec, void *dat=
a)
> > > +{
> > > +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> > > +                                       struct r8a78000_mdlc_priv, ge=
npd_data);
> > > +       struct device *dev =3D priv->dev;
> > > +       u32 id;
> > > +
> > > +       if (spec->args_count !=3D 2)
> > > +               return ERR_PTR(-EINVAL);
> > > +
> > > +       id =3D spec->args[0];
> > > +
> > > +       if (id >=3D R8A78000_MDLC_PD_AON) {
> > > +               dev_dbg(dev,
> > > +                       "Mapping HW power domain 0x%x to always-on do=
main\n",
> > > +                       id);
> > > +               return r8a78000_genpd_always_on;
> >
> > This looks odd, but perhaps it's just a temporary mapping that you
> > intend to change later, no?
>
> The hardware has multiple always-on domains, but on the software side,
> using only one is sufficient.  When needed, it can be changed later.
> Other domains will be added later, in the else branch.

I see, perhaps add a comment about this in the code, to make this more clea=
r?

>
> > > +       }
> > > +
> > > +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> > > +       return ERR_PTR(-ENOENT);
> > > +}
>
> > > +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> > > +{
> > > +       struct generic_pm_domain *genpd;
> > > +       int ret;
> > > +
> > > +       guard(mutex)(&r8a78000_mdlc_lock);
> > > +
> > > +       if (r8a78000_genpd_always_on)
> > > +               return 0;
> > > +
> >
> > I guess the mutex is used to protect the global
> > r8a78000_genpd_always_on, but it looks like that isn't really needed
> > based upon how things are being called during the probe.
>
> Why would it not be needed? There are multiple instances of the MDLC
> device, but only one instance of the always-on domain.

Aha, I see. Thanks for clarifying!

>
> > > +       genpd =3D kzalloc_obj(*genpd);
> > > +       if (!genpd)
> > > +               return -ENOMEM;
> > > +
> > > +       genpd->name =3D "always-on";
> > > +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> > > +
> > > +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false)=
;
> > > +       if (ret) {
> > > +               kfree(genpd);
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to create always-on doma=
in\n");
> > > +       }
> > > +
> > > +       r8a78000_genpd_always_on =3D genpd;
> > > +       return 0;
> > > +}
> > > +
> > > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct device_node *np =3D dev->of_node;
> > > +       struct r8a78000_mdlc_priv *priv;
> > > +       const struct mdlc_info *info;
> > > +       struct resource *res;
> > > +       int ret;
> > > +
> > > +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       info =3D of_device_get_match_data(dev);
> > > +       if (!info)
> > > +               return -ENODEV;
> > > +
> > > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       priv->dev =3D dev;
> > > +       priv->np =3D np;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       if (!res)
> > > +               return -ENODEV;
> > > +
> > > +       for (; info->base; info++) {
> > > +               if (info->base =3D=3D res->start)
> > > +                       break;
> > > +       }
> > > +
> > > +       if (!info->base) {
> > > +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &re=
s->start);
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       priv->mod_map =3D info->mod_map;
> > > +
> > > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > > +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> > > +       }
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, p=
riv);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "failed to add action\=
n");
> > > +
> > > +       /* Note that no actual domains are registered, just need tran=
slation */
> > > +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> > > +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register genpd provid=
er\n");
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_prov=
ider, np);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "failed to add unregister action=
\n");
> > > +
> > > +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> > > +       priv->rcdev.of_node =3D np;
> > > +       priv->rcdev.of_reset_n_cells =3D 1;
> > > +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> > > +
> > > +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register reset contro=
ller\n");
> > > +
> >
> > In some of the error paths above it looks like we end up leaking the
> > data allocated for r8a78000_genpd_always_on. Perhaps clean up that
> > somewhere here.
>
> That is intentional: the always-on domain is shared by all MDLC
> instances.  If one MDLC fails to probe, the MDLC instances that did
> succeed still need the always-on domain.

Okay, so perhaps we should add a reference counting of it, to make
sure we don't leak the data?

>
> >
> > > +       return 0;
> > > +}
> >
> > [...]
> >
> > In regards to the merge strategy, I intend to pick patch 2 (shared via
> > the immutable dt branch) and $subject patch. Please let me know if
> > there are any issues with that.
>
> That is fine, thanks!

Great, thanks!

Kind regards
Uffe

