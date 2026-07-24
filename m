Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8214C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HH4wO6nyRrZiBShi9lrjkrI2flnam11wcKl2gFHmy0g=; b=okaybcUSgRg2cprZ33p35zfBGR
	ajsHPumGOTit5+hLya8Qr8VSXWo8X2ye1vv11+KpEG3P85W27c/XZX42H9ZRVOnOSld+6xGy4weX5
	o1DLEsXC72suTp7hKXbX7Fo6Js3/AUZBf5LG4rVulJcrzPRkXJM84IovVGnaH8fJHq8uIvfV2ELSx
	aapa7XIytc928QDXyt+S6INkmGLzxiLgK6lXW/2bXGx4iD/X+9GaNAkieKDJ1OZjQSode0dRXoX1m
	GjB2LGD2cdRcEW4R6p1utezkxLwjhIhtVKOZSWmmb6Uy+R6sMVeW999Km+qhCeB6o4xH83kns6lmH
	l9VYIq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHSH-0000000Gdj3-0bO3;
	Fri, 24 Jul 2026 15:04:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHSE-0000000Gdhx-15cC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:04:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNKo3196404
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HH4wO6nyRrZiBShi9lrjkrI2flnam11wcKl2gFHmy0g=; b=oRXtDmS3bz5bCRAA
	Xrtyft8XmVNUktvTsBKk6PH7dx2YwG9wHqGzfQhzzzHscbrpzGoTexLy+OaMwCcd
	Yo9lo+BHdJ/Ygy1NJrgLnqN5Vxu3P2RK4/sgS23aZAZcLn+pYMB7rMHqlSSTH2bq
	Ljo1qSBiDQH+tGcF7Qgrxstfuo55QOr3RRA0JFmJRxbOzVYvGTQeC070WaF4Vh5M
	F5LNzWhhWuG5/MbfTNpQhsoVXqhBQ+AcaP5s7oNx3vEjEsEbSjC6zTD53P0yrR57
	WYLwjpiHf4CjY/zdWIkd8B90i4/n7rlQ1uHC2BkHpW/9EHDQQbm2dgwTa/mcSMNH
	9sVGNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p52ast-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:04:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6ed4fe99so111440585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905488; cv=none;
        d=google.com; s=arc-20260327;
        b=dPjYOgKUlzdsu8qPj9PDjQET0jkQmGnsiTBoy8TJsb1EKKcEdoqP0hT4lTW7X9TRnZ
         Okfej6z5zWKzKXpgqjnuvGpqlD9ktomZcnsafhdoWpSCnJwgbSsfV5iPtNq7DdBBY9/F
         vLUO/01vHgz4iWtc4Suv8JuEiccrXlI4/9fArd+/gQLksDHrMCj8AouRYwxTk2zdfG1Z
         R19avpOLOUmh8sDIaOUdurdPTt+UiYDZtwx8d5cyFirXaQ38C62s3krDZNKfl9qn1M0I
         oFb/2AnwfA6oQQ5vkafsQKCqYiMi7An4rrBlGpuZM13ZTWeUKxuKc+VyGFy4DGuhmjvD
         iysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HH4wO6nyRrZiBShi9lrjkrI2flnam11wcKl2gFHmy0g=;
        fh=2NKNtP9KdgxBgfDs/ZzZEc3Z7vNgSIqM/YbeYy8UBGI=;
        b=Va3A4ryIFJCF4enKrIzQ2DbDJZujzL9IceNyZhdMOoxtLxuXFwjrh2U5TVCspgM18i
         HnOJR6qMJTJLZl5LtuFc5buRM8lZ+PKVl/ZlrpbnQ3N/REcaZSPUCsfD0IjRjzpkBj15
         hIeCWwY7PGwW+3TvpEjub6E0PU0msLs1huIB1Uc/7XrpRIx10MfFq4Lywk4xzwEi+II7
         zRl/FNzntqfMNEyoAQTWCwk2MksPKJCYGjmqAcdEi7kElaL5/7C5gpOWuiog27zpqr0P
         0XWWI5CsHQOItJ3v6XEMtgjMZiv3o7uYbLrMlfPhZ/a1hYtxX9TQBdYljScccpvdYnuv
         6ggA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905488; x=1785510288; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HH4wO6nyRrZiBShi9lrjkrI2flnam11wcKl2gFHmy0g=;
        b=GKRtTMPREIrZyQqqRNy3fiTKGucapd2VnTTbCTZkJeowkADd/8N8frPjLszs5uvshi
         aKP0AMYaik8sI/N2YrX68NZdLwAswwNMmGhCzAzDdSNiWTIhv1Dc3cRZWSsyIDOC704R
         Jg8vtZ66IbdCuB3c7ncYkxUAgiyiX52JY0uRgEZ+4O2RwsF0W//Wq/3ZyAC/LbGEIgy/
         2OdhZA2R57gjLmiSBmOYfHqAFkczDNtAlzbYoM+7NYnyoGKthIidpz4CCCVm+dxrp3jC
         35ZnNpUPqYZFpDl8ozLt93BBy1PGiebAp4pFXlNRj3aVqiPl4ClD3XrPE4mXuNhDsyx9
         A5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905488; x=1785510288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH4wO6nyRrZiBShi9lrjkrI2flnam11wcKl2gFHmy0g=;
        b=pkB4C56OIC/FiSKEf6+L++Q/vDpoUL6zRbuhuUvVs7scCQYf3yTh06wc1uIsZRkMp0
         ZLi7lh5gMx9vRP++8PbQuF+0pjoP7nJWQr1fFtxD3L1XxSXfDVkgVR5yZJDVZYkaxQAc
         Ua7OMVhrtXajsEy1eN9BNcBmuP9D5KVJ53GbmzJDSXHsU24zmSMubzYTv/63hLnwQeXf
         +lzHAXeKWIUOlIKddYlnGZWph9jbWbmp6BF4CRnBBm8o0WoNxUG1hp1fUutY4UTPU5Qq
         q2p+fSmovG3Z2mAymJQTtyAM0oyotWupi9eKdLxR2fxkvLqPIu5wtnX3IwdIn3FwKuDK
         Bhdw==
X-Forwarded-Encrypted: i=1; AHgh+RpiRRxO6aICyWoZObCo6BD9rCAT/NKlfib9eixTRqAzlADWvm/Zjj/Cxk5WUbAScWpS5DpF16BAS1ZukGkWDzXa@lists.infradead.org
X-Gm-Message-State: AOJu0YyYtIleurPL30yc0D3mrPbd+K7nStWRm2wZCddguA9Ii/XZ7y5V
	T0V601v3j8/hMN0ImuCdtxJp2e0IOiHd7d1v/qqM3tkYE5gAOB5PyeYP4isFvs47/ifRCEjmmXG
	8Mi860KP84YenHEpNBweCERrwSU6oBypZYpLPVR+VLcpRuGBjVId6zPUMG8VvIcUCekBEiYHuG0
	4gpRLtIi7DzOa+iMI/KV5g/PRdFc6NxSn2OLdtxn6Zh9/PaQpfG5p+
X-Gm-Gg: AR+sD10OW9Eh72Ck3ChMJMCH8/VXjtyCaa/nUx+isrDNzN33I+7KgzH/OZluS96C9RA
	+5djz5B3YmYYjGqumTdT4KDJbmOxfIVrKvbF5xGsk82kUsuuz9rsTaR3T/0s39YFiqeImojXZl2
	VxC8hiOhRj19XI5BHMVroD/cYao73jgoFAa5UQAFFcoYc4lHbAvyHEYOgm+Q==
X-Received: by 2002:a05:620a:2a15:b0:92e:46cd:72a1 with SMTP id af79cd13be357-9310391f2b5mr828736585a.5.1784905488386;
        Fri, 24 Jul 2026 08:04:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2a15:b0:92e:46cd:72a1 with SMTP id
 af79cd13be357-9310391f2b5mr828731585a.5.1784905487953; Fri, 24 Jul 2026
 08:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260715-rpi-pm-remove-v1-1-e4eed226e08a@linutronix.de>
 <CAPx+jO8EPX2br9vsuFXBDPoQTF+Ks09MFcFQzchZxZVaj7y=-w@mail.gmail.com> <ifzlb2b3rdoo3hckhga7ggmmd3j5ub4a2krb4g25sh6naoxeyj@64ownhquehue>
In-Reply-To: <ifzlb2b3rdoo3hckhga7ggmmd3j5ub4a2krb4g25sh6naoxeyj@64ownhquehue>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:04:36 +0200
X-Gm-Features: AUfX_myV3Jm-ftEp1guJqTHh984-A-3KKl2vVDttM8ic7zL9cWO2QF5T5wk0EMc
Message-ID: <CAPx+jO_eG7Eu5C_PxykYwDpQOqGzD+3Kf7OgYC_4pE68rT1D2A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: raspberrypi-power: add remove function
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a637f11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=UovKDt9gyfZwSysGnsYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vRj24yq4PR1obiiucnwqkAVpJg6EiRGn
X-Proofpoint-ORIG-GUID: vRj24yq4PR1obiiucnwqkAVpJg6EiRGn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX9+nIfyJr2Jk5
 P/7/attyObWP095138UrBrOVSQ4q/Pw7nNxvJAx5/XG1le8PFRIsj8wSLYBEyDwKaPk6obj78Z1
 oQEfNYgq7a7FEwl/qQ5ORjV8cUgLmSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX+bdmX9elqFZy
 SUQwKeWoBljKklcoumQ5N5zE+nnn70LekWBJsBAr4udYfqS0HrqsuxRVglPIBGveJTXjK/v5pAw
 EieWfM0xYZmZWIPk/V0xOKFXLbDcCdM+CYhMSajN0ooxR31y7d9FIr/lZFGNT6JD2/s5uTcMQj/
 mG3Y/XCyOHGbdgjwGdh2GkbMx4ntGyf2HjX4N1daC7LqnmJPLeAROpQlQsYOnSYRf32XwaMAwid
 eZbV2rjYLH54vJ9nKWRLLgvJrHVWy0CjD0ULXggUaZSw7vL8qu6TB+Ul3mUABgvRZDM8Byptxhb
 JAh2xWxwKouWqGyHuXeOJlqVObYooylH8BLCX4a+JBlvulNSDpIiwWqXfDihx5Z9d17jVorwA43
 +J3K92A5jDNu8jOIUGAwbsY4Z6mo15l9EBd1oZW05Xp3IMbWbVteJ4/Zaq3a4ZydQ0YHwgZ0x1s
 NZ/9PqhU4XBjbbPq64A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_080450_414783_B0A772EE 
X-CRM114-Status: GOOD (  34.72  )
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

On Mon, Jul 20, 2026 at 7:07=E2=80=AFPM Gregor Herburger
<gregor.herburger@linutronix.de> wrote:
>
> On Thu, Jul 16, 2026 at 02:28:15PM +0200, Ulf Hansson wrote:
> > On Wed, Jul 15, 2026 at 10:16=E2=80=AFAM Gregor Herburger
> > <gregor.herburger@linutronix.de> wrote:
> > >
> > > The raspberrypi-power driver registers resources with
> > > of_genpd_add_provider_onecell and pm_genpd_init but never removes the=
m.
> > > When the driver gets unbound and bound again this causes error. Add a
> > > remove function to cleanup all registered resources.
> > >
> > > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > > ---
> > >  drivers/pmdomain/bcm/raspberrypi-power.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdom=
ain/bcm/raspberrypi-power.c
> > > index b87ea7adb7bea..2c2135c17afb0 100644
> > > --- a/drivers/pmdomain/bcm/raspberrypi-power.c
> > > +++ b/drivers/pmdomain/bcm/raspberrypi-power.c
> > > @@ -232,6 +232,17 @@ static int rpi_power_probe(struct platform_devic=
e *pdev)
> > >         return 0;
> > >  }
> > >
> > > +static void rpi_power_remove(struct platform_device *pdev)
> > > +{
> > > +       struct rpi_power_domains *rpi_domains =3D platform_get_drvdat=
a(pdev);
> > > +       int nr_domains =3D RPI_POWER_DOMAIN_COUNT - 1;
> > > +
> > > +       of_genpd_del_provider(pdev->dev.of_node);
> > > +
> > > +       for (int i =3D nr_domains; i >=3D 0; i--)
> > > +               pm_genpd_remove(&rpi_domains->domains[i].base);
> > > +}
> > > +
> > >  static const struct of_device_id rpi_power_of_match[] =3D {
> > >         { .compatible =3D "raspberrypi,bcm2835-power", },
> > >         {},
> > > @@ -244,6 +255,7 @@ static struct platform_driver rpi_power_driver =
=3D {
> > >                 .of_match_table =3D rpi_power_of_match,
> > >         },
> > >         .probe          =3D rpi_power_probe,
> > > +       .remove         =3D rpi_power_remove,
> >
> > In general it's not a good idea to allow unbinding power domain
> > drivers, as it will probably break consumers and their drivers.
> > Although, I don't know whether it makes sense in this particular case.
> >
> Ok. I stumbled on this when I was trying to fix an error in the remove pa=
th of
> the raspberrypi-firmware driver. I have not checked if all the drivers st=
ill
> work so you are probably right.
>
> > Another option is to prevent user-space from unbinding by adding the be=
low here:
> > ".suppress_bind_attrs =3D true,"
>
> That would be the simpler solution. If I add this for this driver, it sho=
uld
> also be added to raspberrypi-firmware and to bcm2835-mbox. Because withou=
t those
> drivers this driver wouldn't work anyways. Should I add this to those dri=
vers?
> And remove the remove callbacks?

Yes, that seems reasonable to me.

[...]

Kind regards
Uffe

