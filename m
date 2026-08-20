Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60746C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOB3vfe9M72AxiFEqL/rufgOK2tqAmA5k5ziqB7Jwgk=; b=XIvS911UfN7XNZkbSS5ronph4R
	Zm/WfywbUYKXL6eKgjRrFS4g7TWNuhLD8CaCA4gsyFPBo+jc2tslCadCKh/kivMqmArS2noITlVkP
	kNAf7B9Z6waKgJFYpC+RtZol6F8sZYWTP51llbNrmdIhw2QmUUzVUuxXuCZa9/uH9zhatkQ6mzjX/
	fn8/kd6ehEUwDfOkLuTVYt48l+6vQ8IvUpcQom0ewiBwQ10Bc1jrCdaqXQbUJwyUk5TeVdHLGCRja
	DPJq1z6JN7aRDBMSnVbTDAXlFqrfngUGu1587pXnvAVNEUccQ0ljL2nK0R5TVWGQ87ZndTO1ySSoK
	cToq5q1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzW4-0000000BJ1r-1UEt;
	Thu, 20 Aug 2026 09:56:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzW1-0000000BJ17-3DZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:56:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K65mt91258546
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GOB3vfe9M72AxiFEqL/rufgOK2tqAmA5k5ziqB7Jwgk=; b=WR9DXaGsl00Xj5kk
	d7wS6IRTRl2yXerTBzULxKBkyXjZSshYYCJRV14aSnmEr1HZksx1ZdiaJkT6xvXb
	7W+8V9suSqbVLBWH31b92fhxWqlwWGlm9UzR9csB87Kxaq8YfMGNS3HfoeLMf6oU
	3GELlc48wDWeVPwp7Tbm+a2+WVwu8UaGVSrvCcWZNIPJm/eMLRjefl1G4zFsLYxz
	xOV2zb2J4O71qiiCGVwGyn9PRQyxHr5kwFH1qLt0j/KA8YuxIDEtu/ME2PheBDWT
	Q3sh/5XOI6x/MKlS7TFy1xL/8Ww+i1jzZHr9eAbWAy7ihOqF2wDHUE3hSefMonrV
	HuI8cA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es64708-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:56:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfca8558d2so26773175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787219811; cv=none;
        d=google.com; s=arc-20260327;
        b=GmP7ZYcj4RQaQ5jVzFzJ3cHY+p3BEogNuuZ/d8Earzb4M78xfPwMqpqoXOf1Xm9dI4
         AGCQvYvjoj/1uAXCoBvkuNullyeXBu8GFPi2Nxa1PTu6CD6+2AMKA9EOtpuirg2UzWds
         DXY+K7gjY6ItUl0KaFoYSlT56O+bRR19/yqk8X2rihzMbpq65nyxYRJPqg46t7GVGOTr
         j79fsLVLucNZgK06MZ7nbCwYqX2QpsQtna+1Y88e5kO67jur44mDsFpmBCzx+BWoSzhz
         ZTcn/q6I5Ni60GKlTf3H7UEF8TgIdaKge9p0qeCRdTR4I5wezEHr391iRdltZkHvVyDq
         3pyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOB3vfe9M72AxiFEqL/rufgOK2tqAmA5k5ziqB7Jwgk=;
        fh=ndtB6CrHiL8pSa7WmAy3obT0if5tehdBcd0my0LfpxA=;
        b=Eh69UD2BM0uyRmTlUPnQPWzoanUGnGIkIutcy9JgsMRXKJ/bnevnethNpDIl5TDZQV
         hECCtENeeH/IQ2QrgBnaSER/EEXOq6ZO+n3Rj7MHM4YPe4Aw7XAa4uP0Zm127n0Yp5K+
         +o3HtJmufJ0Sr8JZsFH5qgwPP+L6iAWPCcis6rmuFhILtisS5ti1YMxBBPbs3OAbv2D+
         RvlrOR3elq3ljSa83qVUpDuDpDfHjZjLljGxHNvisciru/ItilHYiruGNAb2yo13EMTr
         cF/hiblbzSlqyAqbKVgfdyXEeeGZBhLAeQJaJ0VqGT/bEccmjF7Dc0dfbgGkG3h765Ls
         EGIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787219811; x=1787824611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOB3vfe9M72AxiFEqL/rufgOK2tqAmA5k5ziqB7Jwgk=;
        b=W5HuSQJ0pFuI9LZX053jHiYaqE/i/UdL+WsbfbplvlszoX5TcQpZM4M9dOCcwDs4vI
         /vZ737PhY1yZ/zQWW2za4owVP0D+kjdtXVCiGyzzhiqcJNMnpSwqFiXiROLpXArofFnR
         lME9fSu3H8ijygR1VSu/mHQ9mtl4NklPANBGZMnlb94SgkAfwV9U5vT2t9SYRs9XHQgv
         Ihzp7AA3seLAi16TR0bxaOWfrulC01qN1hxwuYzabkx+MKwpTVNkkPLCo6TBXwP2IX8J
         xY/fEnRt5Szlb5boFtDMZxjS/5WtEw31SuFsoQFKtoSgiDqXdqfCPmqZki+Ptwh7j8tf
         9FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219811; x=1787824611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOB3vfe9M72AxiFEqL/rufgOK2tqAmA5k5ziqB7Jwgk=;
        b=bAJ3VvUz3uHE9/IysSPufbonfDTP2NK+Ev6zZIsCHIs/aLiI7KjUjGahmtX85dfger
         5vQ+i+hqeRPBk289lZSF9HUqzQTanFMJdQ1aEKmWNKUCGr+JNCQoNBEuvsSo8uQ/9HbF
         eEoBgX2lN0NBhz7nAoOP5DLsvw8jAxAh4q5dkSqXUU32l7ed+D1VFJchCc1dmc969SYv
         1pi+gVmb6M7W7PSaUEG7SIeGXuCBSgtc8zc9IHvWII/7z0gk58TudBQjq1X0vaLZNAho
         lqOoo9/rfvF6zWYlu0CX8KlfEY4WfpqEQ9QwpUHrzZtc9VBhLJk7VobWN6RD9jaI2iQx
         Eq/g==
X-Forwarded-Encrypted: i=1; AHgh+RpGPJAWUDoP1dpR225r4nsj+FhnPdodBU4GA8jRSf6Hr/GrgjrEYSXhWGLYWkAM4+aM3gD87sRhqEfruzBKFg2K@lists.infradead.org
X-Gm-Message-State: AFuF++msdYQB7DI68oQ5X6eaczq3Kou0nUHv5voLuR89XjQZwHvyOkv0
	egXNSlJJQZ+P2CXv90s1aQb1tXvJHSz6a4yfIPEp7WbWffiaIB5TS3w0bAa6q1U0CNqbdoLMZ6K
	FHoLPIMLrkPILIhLKyfYJGYZo0gAioHfaS08zuBWdzAlyJGf2K98+8/x+WrKttTbMs/RFo4mLXP
	Ac7SDY2v7elwyHBsmVBTr1b3vAAHTzpL1sNymRseMUlxKC39JdOrw6
X-Gm-Gg: AR+sD13Miqt6NuJVCTu6PGgSGRR306ZY236zmF7ZqzLkxwFSpphfgFIbtw6S9Fa5VoF
	96joDkzxZNRhEWyHV9/3hyc6fpILBlKNFcqVWc9Adc8ZVgpmPm4XyXOwmvhm+aMeKAW8ZE9SUZI
	UXWzoUW/8k5eV8vEfXNUWikbMZQa2M/q31IIsfL7+Dug9R9nFBNNb9Bemt7A==
X-Received: by 2002:a17:903:28c:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d5fd5b087fmr208298775ad.1.1787219811421;
        Thu, 20 Aug 2026 02:56:51 -0700 (PDT)
X-Received: by 2002:a17:903:28c:b0:2cc:aa36:c04c with SMTP id
 d9443c01a7336-2d5fd5b087fmr208298025ad.1.1787219810878; Thu, 20 Aug 2026
 02:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
 <20260819151457.256959-3-ulf.hansson@oss.qualcomm.com> <yuowf7hfnhcizjgxglfypsqbf7oavh3jywbls5mdbuyc5rglmn@ejp2tahonk6r>
In-Reply-To: <yuowf7hfnhcizjgxglfypsqbf7oavh3jywbls5mdbuyc5rglmn@ejp2tahonk6r>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 11:56:40 +0200
X-Gm-Features: AcwNN1XwxKgaQ4nlmVlWsFlz-TFCrFjNsKCp3_ASPsoM9q7iXmpsxnM_c1Jkpjg
Message-ID: <CAPx+jO8MXQwDh2Bvws4ngO=9LeE3YvFkiv=KDgYupWxS6VePjw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] pmdomain: core: Add a genpd config to support
 unknown initial status
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a86cf64 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FEbHA5cY-midHvKCsEIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VfrGkp1ZGa_pJ2lbAE2w5exJplIBNIDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MyBTYWx0ZWRfX1E8b2x+mD0lM
 byr+N1x8illuHXx1AdjK+8azMu1x8517c0woUiBwBxDYYkEULuWibhkUZDPLnXWVBsS4tNXb7bK
 sD2ORg1k4QREkWW0720BROqSY4ysWrpZi0mr9wWn7E10ZhOZjdQFE47cvpdJ0PDEptFjkybz6bW
 Yhl8B54i6Yx3cV6DXvSNerwCbnvGnU6XRA9hyOCc4u14jJ/3YJt2TggrL/2DKdhoS29qDiUabF7
 +SI5b8bdR5ya0F+mB1Ie7+MSzyhv0iBbsaB6Sslhs8KeRutbvllwzJDx/qimitI2/8jL0PQPAo+
 LVAEp4RgBcEzaHJt7EaT49cHI3mllyBPnSe6yrpxf4r3GaelYOTPOXoxFF4nl38FM4H2I7hUWGK
 tS5xEMOivY39N8Z3PXT3uqPNkcYhTcDuZLBYe1G/cgkBTIvEafd36tseSsi27uFHeFSn/SX/bdy
 vpC7Mkx2F0itvJcgt1g==
X-Proofpoint-ORIG-GUID: VfrGkp1ZGa_pJ2lbAE2w5exJplIBNIDz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MyBTYWx0ZWRfXz1VWDhUDUGW4
 fPbCdpCTsxo14bcoTWem5sh6i7VXk9WxqQtOOV95XqAEuzCaUbAmhSXUlkVvgcGpyuIuZLlkT7B
 VrWKVxdzh9O0vaip7jUCWSrlxelzFxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_025653_921583_75FE7D2D 
X-CRM114-Status: GOOD (  37.55  )
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

On Wed, Aug 19, 2026 at 7:40=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-08-19 17:14:52, Ulf Hansson wrote:
> > From: Ulf Hansson <ulfh@kernel.org>
> >
> > It's not always possible for a genpd provider to know the initial statu=
s
> > for its corresponding PM domain(s). To register the PM domain in a safe
> > state, the genpd provider driver may therefore have to initialize the
> > genpd's status to be powered off, as a way to prevent the PM domain fro=
m
> > being used when it actually could be powered off.
> >
> > In these cases we may end up to power on a PM domain through the genpd
> > subsystem, while from the HW point of view it may already be powered on=
.
> > Under these circumstances, it may also be required to keep the PM domai=
n
> > powered on until all the consumer devices have been probed. In other wo=
rds,
> > until the ->sync_state() callback for the genpd provider in question ha=
ve
> > been called.
> >
> > To support this behaviour for a genpd provider, let's introduce a new g=
enpd
> > configuration, GENPD_FLAG_OFF_STAY_ON.
> >
> > Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc0=
23f5@oss.qualcomm.com/
> > Signed-off-by: Ulf Hansson <ulfh@kernel.org>
> > ---
> >  drivers/pmdomain/core.c   | 6 +++++-
> >  include/linux/pm_domain.h | 9 +++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 7345c06f1d55..be4fff2f4664 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_o=
ps =3D {
> >  #define genpd_is_dev_name_fw(genpd)  (genpd->flags & GENPD_FLAG_DEV_NA=
ME_FW)
> >  #define genpd_is_no_sync_state(genpd)        (genpd->flags & GENPD_FLA=
G_NO_SYNC_STATE)
> >  #define genpd_is_no_stay_on(genpd)   (genpd->flags & GENPD_FLAG_NO_STA=
Y_ON)
> > +#define genpd_is_off_stay_on(genpd)  (genpd->flags & GENPD_FLAG_OFF_ST=
AY_ON)
>
> Maybe genpd_is_state_unknown ?
>
> >
> >  static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
> >               const struct generic_pm_domain *genpd)
> > @@ -2445,7 +2446,10 @@ static void genpd_lock_init(struct generic_pm_do=
main *genpd)
> >  #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
> >  static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is=
_off)
> >  {
> > -     genpd->stay_on =3D !genpd_is_no_stay_on(genpd) && !is_off;
> > +     if (genpd_is_off_stay_on(genpd))
> > +             genpd->stay_on =3D is_off;
> > +     else
> > +             genpd->stay_on =3D !genpd_is_no_stay_on(genpd) && !is_off=
;
> >  }
> >  #else
> >  static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is=
_off)
> > diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> > index f925614aebdb..9929347e1d7f 100644
> > --- a/include/linux/pm_domain.h
> > +++ b/include/linux/pm_domain.h
> > @@ -121,6 +121,14 @@ struct dev_pm_domain_list {
> >   *                           powered-off until the ->sync_state() call=
back is
> >   *                           invoked. This flag informs genpd to allow=
 a
> >   *                           power-off without waiting for ->sync_stat=
e().
> > + *
> > + * GENPD_FLAG_OFF_STAY_ON:   Use this flag to inform genpd that its in=
itial
> > + *                           status for the PM domain is set to powere=
d off,
> > + *                           which may not correctly reflect the state=
 of the
> > + *                           HW, as it's unknown. If the PM domain bec=
omes
> > + *                           powered on during boot, genpd will preven=
t it
> > + *                           from being powered off until the ->sync_s=
tate
> > + *                           callback is invoked for it.
>
> Maybe GENPD_FLAG_STATE_UNKNOWN ?

Hmm, I understand your idea to clarify this and it sounds reasonable to me.

However, "STATE" sounds a bit vague, what do you think of
"GENPD_FLAG_POWER_UNKNOWN"?

>
> Or probably it would be better to just add a new state to the gpd_status
> enum, like GENPD_STATE_UNKNOWN.

Well, the problem with that is how it should be treated by genpd
internals, when there are child/parent domains. Having an in-between
status sounds unnecessarily complicated to me, at least for the
purpose of $subject patch.

>
> >   */
> >  #define GENPD_FLAG_PM_CLK     (1U << 0)
> >  #define GENPD_FLAG_IRQ_SAFE   (1U << 1)
> > @@ -133,6 +141,7 @@ struct dev_pm_domain_list {
> >  #define GENPD_FLAG_DEV_NAME_FW        (1U << 8)
> >  #define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
> >  #define GENPD_FLAG_NO_STAY_ON         (1U << 10)
> > +#define GENPD_FLAG_OFF_STAY_ON        (1U << 11)
> >
> >  enum gpd_status {
> >       GENPD_STATE_ON =3D 0,     /* PM domain is on */
> > --
> > 2.43.0
> >

Kind regards
Uffe

