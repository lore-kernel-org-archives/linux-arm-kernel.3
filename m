Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146A1C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=; b=mmdDUj38+TwjKPVyD8LiDIDG+6
	qPZ6EofMIqkqO39wHyQ99xpX7x31XQerRW9PNNi5HeeHbenfcCJAViBy72fozT3vdDP0b418xNQnq
	lu+l2p1QEf2y4GjIKU5jMNJax4lHi96Lk4TAmRxEhAEbuBor2KYYDOQb9WA9MhxktM/fz7R/OlX5m
	LL54yZvHPhMP9xqAL0ydzvLKL/j4BIkWTqjYAQRn271b0JfcmNNDQ2ulc2d5ARU0tAjjkOHc7dc2Z
	YUr7dd3oZqlEOuG2ohQlnlB+7K0f569ytQlXcKuFA1mkGwpm0XAxWKtNWhJdHJr/xKM3ytNnZ86lj
	KH33EQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26HP-0000000HGmV-1gWn;
	Thu, 03 Sep 2026 12:10:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26HN-0000000HGlb-1J2U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:10:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHC8R162798
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 12:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=; b=pamFi43F4zHnQ82j
	Q6+siTw2JB9UfBcuQ2veG1bJIBRnGC7e1ceJNC8IoU20lBNz8uYg88pSMxhVQFXF
	2b1RxyFpyhW1imbd6i7PbQ4BVSM5ZJX72s97o7pQ+g76rZPfoAwzblyOYeHkHnIz
	tjWD2ztCb+olcEhchgHBV9VGXyYpUZZh5BW4trpck/uqQoLSo48m8jPTdE1iGsD6
	3mfz2u6pbJOIdSnk5BIyc8VVWKpwDSTwd/rNwqh+0pBFO+MQtHwM/Yl5z/pz4AkO
	McssQdtjQ9aiWGsFMEHNwKKVekBLoi4BgTk3SB4li7puoN21AuePbfhQJKbRUra2
	QdgyPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0eer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:10:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7293f13c6so31616905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788437451; cv=none;
        d=google.com; s=arc-20260327;
        b=DJ/PehpO9r8/4tGyvf1kOkiuAN7IZcIOTCD8z0pfy1luaoT7HC+wcVq4C/aXMs5wBX
         BZIfrwAwtwdS9oLlN21Z+T9r5M9uG1BE/s7zfB6TxlqA1JdwtIiKq/tvVtkjigzqPoVc
         bd45zQGVlL7E41kbVBtEonJVflXt344MmcVCpLRW5jVqRVoEuY7t9CUx/N22MobuldCn
         uiJRuaMbmL+eNg5ftE31eGcKw14pnlT1j80tO7ph3OnCs2dasQo753qkh5Tm8Y1rXY/F
         ZKc+gXTIyjoitBA22lgBsUUBxIQjjWqg4VDiUpGr3m6D3wf6E+LIkSIGbsQ+9klxNPSf
         sCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=;
        fh=TreBvEMDvFevVgqaHENjUj/9CERnvGU7UfyWgocPbiI=;
        b=IiL10PabLAuienRLPM4c9XaTIv62AOh7D9NAsqParJ4IFzqmaQ0jq5azfNeILr/f+Q
         yZ0SBPPB9dD5bqK6YkXDwtNSOwkMbfPFYe7ttleykMk6CTN46Fyc9TFbjSbta00j622X
         Td+u9htcbZ/OsyJMckhY/RdlTkbpgsiXIKUnU7gukQZsAUbKj5QGWwyzhysvHSA3Jfpq
         BPikVnWEynjYNTfF/WBxXXtS0sEMHpw8KtL4FFD4oPCISaLY0SV25IC5uaICnLmmVBkA
         1Zik+lrJeC4FcL/1lV3gxrFqe+AlUzCZtuzAWfyGtUybVuT6NBUEzIkCbesgYrc+md3N
         6lgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437451; x=1789042251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=;
        b=VdFd/VjvCPDnak2MXAL9N+GMKob8PzQyVoxBPP2/pTcEje0V2O3OdHJHtXjcaHNKX+
         13olaGgs1IbMvQ6SlSDjI6b+qW0l1y6i6bGuuaaYFqyAqKw9Wb6ysR6MN0FT8pzzEaP0
         UxtLR13gy83d+JtnQIPb4gCtWQ/yiyNgP8HXbYlGt63LBa7wpCax+H+rqSWIcSjw6flh
         5QvLXajfq5Zb0oCYTiOLMaxuIkANzWnm33rziTY3lsCM940DyHM2vcJLyUuOiZMmT0Wd
         +z3LA9IYTI7EuX1njDOwuhImRwp2adOLAxzcbnyk/sESGm9/6uB8W3rBKMTuGsQbxa6H
         ybVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437451; x=1789042251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lh4fD+uWvDhMwH/ekLaZEqNCYIa99pFh7Tly04mKBEw=;
        b=DhGEqgZbDFhanvYz3qBQTeY35e6qsFGzLmeOPQllh4j+cDwlXCpCL/ju9JO4NoTWnl
         BoU5DDy0ekrmKrCEM2ExYNUsKZcAh12EqBvkrClTynXNXVsiyO1Yx/BX3Om9uONSkIp2
         3kUa5OTftfEZ1bq+qibojwhHhBIK86p0PRFOYHyX5rUyMSEIbIcwhf9PUqXM7mj9kGhJ
         nBIdGNr/WjxeOyXdLmDFqqrEmQDCqMeKISvGB2KeKcIdei8upiB82UaV14vuxpWqbUvj
         41ElS8AWgvjICBJB2dLqE00oouuXZZ9kLWHyNf83xhEb2N5/FOVc4ELRO9WOaYRRIRa4
         geTg==
X-Forwarded-Encrypted: i=1; AKwUvBypDvZf89d71PlwtlqIZPz+gMJuv0yOHw30e06eVN2p+dWOKX9lBy98o1DWxAmxbLfSc/2NasvN2nRvWRJt0hNu@lists.infradead.org
X-Gm-Message-State: AFuF++nzNTsf5wjD+P35PuZqaKBscWbe8c4EXNfSU4+RQryyJWGvUexU
	T3wDnn793uDTTYgIjKa3C47MCN6F0n/C7iZow02E8LYIzv4KSeeyweZN2GxBW+ZPWtHsaKiwshW
	xqiXzOAXKX8Fe1mwkWclbbhiVMx6xNFTLXfe9Bi/GuvVPVYZV3uhHu1/t6N1l0UuAW4sP5XQSqB
	rLJRYqaFPNzrk5gdAJkET4ZtWtsLJAMH3RDiIyqw8HvO13qGvwmsQ6
X-Gm-Gg: AYBFou1/REHU+p/NBTPIEl2LHSjmRMdKiXDYM6MBeQudulDK40lF4aKeJHJHdgoeC24
	XgAqJq2tJWFelBdvBuicIpB9R2hA3btxbDNEMzoZQl1PbLabIzYuCBzn6IaFbJAKj4Lr0R+ftUX
	3FWrL5h/jOS0uOxcuYwFtWUAevguaBWxNhyE2QDIxAWwwkdYuoY22CIx/TWw==
X-Received: by 2002:a17:902:e947:b0:2da:c09d:b5d2 with SMTP id d9443c01a7336-2daec5f4a05mr171421495ad.3.1788437451010;
        Thu, 03 Sep 2026 05:10:51 -0700 (PDT)
X-Received: by 2002:a17:902:e947:b0:2da:c09d:b5d2 with SMTP id
 d9443c01a7336-2daec5f4a05mr171420605ad.3.1788437450509; Thu, 03 Sep 2026
 05:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com> <c00f266d-b6c3-4988-a2b9-72c5e0389317@gmail.com>
In-Reply-To: <c00f266d-b6c3-4988-a2b9-72c5e0389317@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:10:38 +0200
X-Gm-Features: AcwNN1UpqhcrP8XuT2dq_C4AZNGB-kG49zty_zs5rwD8pwTsxOtau1KLx0kmPkA
Message-ID: <CAPx+jO_jfkRyFjB35wKGs8N-hjXtq21kuOD484F8U0TL16sWqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pmdomain: core: Rename genpd_status_on()
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _YJlwjgeAvmS13jgK78uovh7KdPLBqeq
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a9963cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=7CwLG3W57V6vwtOQApUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _YJlwjgeAvmS13jgK78uovh7KdPLBqeq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfXzPftZ2PspWCx
 wi/oeYBdqz3qxXS+LI6mL0FANPI5wj23ncgSq0R8pU1soNfJkdbJb9RJTfbY1txbn+hId6BoViF
 2gBvX9zHFrQ6r7kEG31I5XHEgG7QUhouF8MwTZU6wX7JMLmmv09z6JD0YeTaskws5rbWyREny8v
 6Ym7VS2A93f+Ln1BcS5Ay5N1v0yABTgM6cB+VQ7bngHHviFotBqBWfznsaRA2mRghvHjbuv0I4Z
 3J5/TO2hztH5yJuVBzsIhwNskksh0MOZ6uYkg6EGx3hQ+5tDr7i3iGwpGPT/301nSyJjE91qwxZ
 +Fdlr/rPtfjh/hU5ra3cBkRp/H/4mT+mFtW+8k2I8QWj8HiBll4qWG2lk8pk2JLoMKeEG2M1ya8
 7p3F+F/RZtdlpCJfsClkHnAZShamsDof2RPxWLKfmw260LXIx13GEB4PVF3Rv88OatoKYyzIatN
 iKt0Nk8pRTkx9YsUDew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfXxvfz2IzeY26m
 AswgmODZTnkPzJzNgBxV+VHVrTjoY/yBfkQOmkY069OJ/ijGs9VaJCa+QI4z8RgVy5UuuwveoNI
 gtlKiCM9swoHgob5EunFZCP2PPM+5Q0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_051053_464692_54DE5177 
X-CRM114-Status: GOOD (  24.77  )
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

On Thu, Sep 3, 2026 at 2:00=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wrot=
e:
>
> Hi Ulf,
>
> On 01-09-2026 16:44, Ulf Hansson wrote:
> > Let's rename the internal function genpd_status_on() to
> > genpd_status_on_unlocked() to clarify its use.
> >
> > Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
>
> Optional:
> An additional line explaining why this otherwise unnecessary rename exist=
s:
>
> Rename the accessor to leave genpd_status_on() available for a lock-takin=
g wrapper
> introduced in a future commit.

Yeah, good point!

>
>
> >
> > Changes in v2:
> >       - New patch.
> >
> > ---
> >  drivers/pmdomain/core.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 842c4169e290..6ac1ce18fda3 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -173,7 +173,7 @@ static const struct genpd_lock_ops genpd_raw_spin_o=
ps =3D {
> >  #define genpd_lock_interruptible(p)  p->lock_ops->lock_interruptible(p=
)
> >  #define genpd_unlock(p)                      p->lock_ops->unlock(p)
> >
> > -#define genpd_status_on(genpd)               (genpd->status =3D=3D GEN=
PD_STATE_ON)
> > +#define genpd_status_on_unlocked(genpd)      (genpd->status =3D=3D GEN=
PD_STATE_ON)
> >  #define genpd_is_irq_safe(genpd)     (genpd->flags & GENPD_FLAG_IRQ_SA=
FE)
> >  #define genpd_is_always_on(genpd)    (genpd->flags & GENPD_FLAG_ALWAYS=
_ON)
> >  #define genpd_is_active_wakeup(genpd)        (genpd->flags & GENPD_FLA=
G_ACTIVE_WAKEUP)
> > @@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
> >   * @dev: Device to get the current power status
> >   *
> >   * This function checks whether the generic power domain associated wi=
th the
> > - * given device is on or not by verifying if genpd_status_on equals
> > + * given device is on or not by verifying if genpd_status_on_unlocked =
equals
> >   * GENPD_STATE_ON.
>
> Since we're fixing this anyway, It should describe comparing genpd->statu=
s with GENPD_STATE_ON, not the macro
> which expands to that logic ;)

Of course, my search/replace logic was too lazy.

>
> Anyway, nits only, LGTM otherwise.
>
> Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
>
>

Thanks, I will send a new version to address your comments!

Kind regards
Uffe

