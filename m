Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 04:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvAs2OQ0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WHSA6vnM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VybLXE7U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=; b=vvAs2OQ0ECi/gDEkaVhk77PgXc
	mITEHeBTSJjXsXmjCTd3HVsIPYWhXaQ2SBmB73Jp9NDvpLaIfKAU3hbg6ShED4fMSnIOUx5iV8Cxz
	1VYu5zOVMUgwExAtRusfYH2zDI+BgA8/9wmbYV8p0BIDQuyRpebzfdUq2bn5lgua6JXXC0yvOS5AJ
	kSwf7zI55EsLyn3j9BRssCsb4wVsAAoNOzB4pbHi0omRQdxZrPgwn0qyJVaYDosArzaiStqpnKD8o
	AqNxL91CzQcvS89d1290CbqXSMcy3ILGOVddnmbimFh2KfJFH2uzhLEjm3n09l+qZ5S5IL9CSjmlD
	NJQPeKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCfm-00000001iTE-1Wfg;
	Mon, 26 Oct 2026 04:51:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCfk-00000001iSt-18ZJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 04:51:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1tW2206175
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 04:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=; b=WH
	SA6vnMeCiMR8EvqgM6oo6Jm+PcVod2kyYd0RTXrstfPX7B3R32jVXL1XESsGVPsR
	Nkmn2wkJ48nfu23C9n0UmaxhrHE0i0AIfVnDx4mXh2dlc/AevMLhtenFLnhfnCXJ
	1TiVRaew67e+KU/JDhT/p6+Z3BBl2vcVMBwq/5PmECq1ixQzOmijMjthIx4XuAaF
	A1SksU9VR02CqrAST/cSBURfou8lIdHAcOwBzTFoUsbvlBX0+a7yc+eov9YN56bu
	YSeHmU2N0FCEAPsWFdvvUNuiRGdZV0QWqoJqDr7fmEWqsU1C7ZKCWdJTtJjjIpj0
	9Qn0pINW4udquARjtmuw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrumsh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 04:50:58 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-677c2db10b1so5045161d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 21:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792990258; cv=none;
        d=google.com; s=arc-20260327;
        b=b5w4SxFawWhf/ZB+8t7r/+YngiAmYd4k4U8dNUW4m7yDmWaPQZQC3+3aiClrawGJMa
         9be7a7vHw8oHR4mD0uHm6i8zxnSg59CLn8uWOzJzOC6lHtWbQp6BJmf4Qo1ssMnX+bvb
         ntIUajD8dpvgkugHYIdTFVy0QUnerT3Ics9iNFvs0girzUcqGCunhZ6i2cvW2Ah6E/fx
         R9dZVWX8pcgDXU6dj8iACKURK4LFqEx05cVYTzZzyLb2G/kIPka8iNg31cGlJRnSHoVk
         QM2DBN2YQZk0SXidaXJcJ5VA4UdlStZFjjgdt3Rb/Pmg5yIGmvTbPgJD/ORdq3efKnMZ
         Hjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=;
        fh=BIoUV4q4VJRmu+cncDW1QrLq9GJA4neg+w/j4hAbE2k=;
        b=dhhY1FAoXCS9OhPNMVQWONtMJOBNVWu1WkFLFwwkZh/CBpEoeQUE1/i/qfUPhpXorU
         6FXx+y0+mtbMkwHFiWwzQyij/nlQMpNJ1xarbTo4XTRCVcnSZ4XJD+sDVFikdN5Ud+Nu
         N/Pi38T3LjseRHKIYD2mlTAebsO77oTG9vXy8tLTusALd635WLzlD5Q0whwmd/0aOfo3
         eH4mTgvZgglJP+McuSAfeNtOGCG/xbHdPJUMoacDzkp5lK11fZPmAb271RDz+tfkuPI+
         gIj7dH+Aw8hjvBw+UwA8etD55G9vTOBcapdS4x7Y9pcjXyUqg69hEwNNP9f9suv/IE+5
         vP7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792990258; x=1793595058; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=;
        b=VybLXE7UV07EKrPg47Mf+lMilwa/sja6L9KbhChXc6upscCIqVpuzKEywZNmK1BgIb
         2M/Stgh3+/xtXKMvznc8hPYKqoG/T8gizFjv/2UiEZXQ6mbQtjT6J8iGC6Yjn5x9l9X0
         NfmNMnVbnUHZEaFYXV6zTDT8SiOl6qtJwSVplAk3iXKbmxlDvcSCiJBW8Vmyxc9anS+8
         K9np+o+L+3w4mb3OVZG4d/3ymUQK7s2lp4GaHWe/D5MGAgfdBqIRPH2H5UfBV4Qc5d7k
         04X71iQPfB5kNST5jh6nk3zLQm5nCVSy7mQMWEaiOlKVjvMueYhb+c6c5IJq1O36Ains
         chIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792990258; x=1793595058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=;
        b=uUCwfQMNpggjVrKATWKEvfHr2IGW1veVbJ5Rc/oUdQGlNl3kQvJ7bfpeRogzvtrNwX
         t7Z8i8xg8EENlhLgzUycN3s/rniDY1PS1CobnWpWKBj0VfVvr0KP7r0XSm5EZkwCRnOW
         HHgf8QdfM1AmRa4DneSd9PU/UEhPTR9tae3WVrG3M1U2C+v4yutEE5LxQB6tJbMUHm+4
         Gr8OOD+4sbgLpvtxe6D4hItrShwnYfayuda4G3tJNZhZ8v7xefk2kqFr7W5erezwN9bA
         LrwrDiodEAXaE7Ys6gXwEMH9EQktBs3zw8s2Kem26NsjaTtgH7yvveG3pl63matj0Blf
         mXPg==
X-Forwarded-Encrypted: i=1; AKwUvBz5d1dfwNdlu5JGweE6TEuqe0vsHj6aDKFGYqnowfc6cxxJeZXQfLyTQwOiJA/68IYVxa3OBXoHbRrljw1dSxtU@lists.infradead.org
X-Gm-Message-State: AFq9FYKxrRdLl6w6xWholnIgXYtI/mhA/2+40EBZ8+yUaEey5L0S0Qkg
	yvVs6QvCRoMe4t80Tye77lWeZ6szQzkocKsUyidemS81wa08sJW6RlyE1+/fSS4+G7TY9g9lKr1
	CwPE+ROXEerSM0sk9A+7fiDGf8NTQ4V5EnqJVBuY1mt3q5aPjTFlUxOdNAjmpoPRWVwUXuXH5Cw
	JMIAaZxCnZ47DQY+IgufcDAsZnH4GbA5u5KJdFdY3TmCocTX52021q
X-Gm-Gg: AYBFou2rTwBZef8uK2URfyO23VL71eJKiSjZ/WSvW193TFyXkAuR2BlUh75YovcQvyu
	BbvLtc6Ob1YaKgOcISLGAigZkayq77vhzu/ZnzmHrOezMiyqXhcRI1jVRuZkQN6s+Ht95rxLrjU
	0FAhMI/qMLV6tPu4BXcjU2uLJg+oV0WQFOuLi6WEbmVVG0KjN+qpH6Zlv88Wo=
X-Received: by 2002:a05:690e:1182:b0:66f:d560:32f1 with SMTP id 956f58d0204a3-67a45498ae7mr3358065d50.39.1792990257610;
        Sun, 25 Oct 2026 21:50:57 -0700 (PDT)
X-Received: by 2002:a05:690e:1182:b0:66f:d560:32f1 with SMTP id
 956f58d0204a3-67a45498ae7mr3357961d50.39.1792990251177; Sun, 25 Oct 2026
 21:50:51 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <arqSqcoWAkhy-8do@red-moon> <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
 <asieTvinZ7c2QpQm@red-moon> <CAJZ5v0hVLSJs1j8J1TV3yJ8Psyaf=B_0UfHsYSMtM5xTup0B_Q@mail.gmail.com>
 <atXyIadz1TEKSodg@red-moon> <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
 <ateI-JcExDyfXKrs@red-moon> <athimRqtDvQu1ZzA@ashevche-desk.local>
 <atiAmZSPiRNBAO5O@red-moon> <7f077fd3-9c67-409a-b46f-7f28a55c180b@arm.com>
 <atmwo3Bpi62kB8_n@red-moon> <CAJZ5v0g56LP+EQc6MQ1H_5XnQALEn3CV9Q9HGCoiuMvpkK+N+A@mail.gmail.com>
In-Reply-To: <CAJZ5v0g56LP+EQc6MQ1H_5XnQALEn3CV9Q9HGCoiuMvpkK+N+A@mail.gmail.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:20:37 +0530
X-Gm-Features: AclHuK-1DHAybX8n_MVkQPFIAt-ZTZyBKU1HsuPQ4k0q0v0UpqTvAKQZTHvj7-E
Message-ID: <CAB19ukGr39DrSXdR9Gy=YxVSXfPgYB0oqqjggQNBfedMjVtAwA@mail.gmail.com>
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org, Grant Likely <grant.likely@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxOSBTYWx0ZWRfX8yzjrHYOvNPw
 mEtQqwmbqRVx1I4ZuwZDAFmpuBA1kdoFBOjSmg885JMGB02GZ2PlDB55ipnmQRv98zHC88LxVJ5
 u+ft9KbLgaK7jJk9Z264h3qu4USKqRM+wgh37dNqLo4tF1IA6On/diuvhdgB1aCTAEiWrIZBkO+
 dcA8TRd3hbOH7GddoY74R5I8lEoBYdmz6b7b327eFV5cjpSSDbHskRqIS3LjNIwO7WFzkRaTYsf
 kis94dFY9h72pRSIBKrfO2hG+uXcWhaG6am6iFOe4AY9v35nvJchW9Cvg+0qHr+UzEpfKSALqIA
 POF2SN56g8LHf3UMi900b3L165/72tldZN3xYxbliZHpRKeSROyP6uEEQN6noszLMk11P1gugFB
 nG+BVu4C+aGvqnqT5CgVk590KCWCM79QbaoJ1SPfLqG0MuMD+WcOmEqmBWaOUpRMgTPZvwkMy0y
 6Q8Po3h9t5TkYCEUAgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxOSBTYWx0ZWRfX96pnqcvX5zn8
 rqzyNk8X2EFnX8j0bysA9p+uZysAC4Sn0sdo5vS4JPRlMz8677M7P5adIP/j4K2xYKOhbPsg5zZ
 44/SeRiVd16Ap3ycvGcOxmudQJ/p6aU=
X-Proofpoint-ORIG-GUID: z8b1ZA7H_hhWrHINVqZ3OV0OHqLEHDKn
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adedc32 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=67Uejn7MJG7rg031VH0A:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: z8b1ZA7H_hhWrHINVqZ3OV0OHqLEHDKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_215100_454154_34FEF999 
X-CRM114-Status: GOOD (  59.17  )
X-Spam-Score: -1.5 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: sunilvl@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 4:18=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Thu, Oct 22, 2026 at 8:43=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@ker=
nel.org> wrote:
> >
> > On Wed, Oct 21, 2026 at 12:18:39PM +0100, Robin Murphy wrote:
> > > On 2026-10-21 10:06 am, Lorenzo Pieralisi wrote:
> > > > On Wed, Oct 21, 2026 at 09:58:33AM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 20, 2026 at 05:30:00PM +0200, Lorenzo Pieralisi wrote=
:
> > > > > > On Mon, Oct 19, 2026 at 08:05:50PM +0200, Rafael J. Wysocki (In=
tel) wrote:
> > > > > > > On Mon, Oct 19, 2026 at 12:34=E2=80=AFPM Lorenzo Pieralisi
> > > > > > > <lpieralisi@kernel.org> wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > > > > Basically, yes, the idea is to defer the creation of the plat=
form
> > > > > > > device until the dependency is met.
> > > > > > >
> > > > > > > > till the dependencies are cleared but then, without a _CRS,=
 where will
> > > > > > > > the consumer driver find the platform device resources ?
> > > > > > >
> > > > > > > Well, good question.
> > > > > > >
> > > > > > > > There are multiple facets in this issue and possibly some o=
f them have
> > > > > > > > been already solved but I need to pull them together.
> > > > > > > >
> > > > > > > > > Note that the dependencies can be added to acpi_dep_list =
after
> > > > > > > > > creating a struct acpi_device with acpi_add_single_object=
() and
> > > > > > > > > acpi_scan_add_dep() is not really suitable for that, but =
it should be
> > > > > > > > > doable if the dependencies can be found.
> > > > > > > > >
> > > > > > > > > > I need to have a deeper look into this next week but I =
wanted to ask first
> > > > > > > > > > whether there was something I missed - most likely.
> > > > > > > > >
> > > > > > > > > Well, it is not really straightforward.
> > > > > > > >
> > > > > > > > Yes it is getting messy. This RFC, with all its flaws, does=
 not transparently
> > > > > > > > prevents enumeration but rather relies on -EPROBE_DEFER to =
sort out
> > > > > > > > dependencies - though it does so by adding more stuff into =
ACPI static fwnode
> > > > > > > > that to be honest I'd rather see gone.
> > > > > > >
> > > > > > > I think what you need is a notification mechanism that will t=
rigger
> > > > > > > when a specific device (enumerated via the ACPI Namespace) be=
comes
> > > > > > > operational.  It doesn't look like any of the existing ones (=
platform
> > > > > > > device probe deferral or ACPI device dependencies tracking) i=
s really
> > > > > > > suitable for your use case.
> > > > > >
> > > > > > Yes. It might just be a notification from ACPI core to say "the=
 driver for
> > > > > > this ACPI device probed, go create platform devices that depend=
s on it".
> > > > > >
> > > > > > We can check and track the dependency in code that does create =
those
> > > > > > devices today.
> > > > > >
> > > > > > I will think about this to see how bad this might look like.
> > > > >
> > > > > Don't we do something similar in drivers/acpi/x86/lpss.c?
> > > >
> > > > I suppose I can add a notifier that checks whether the device whose
> > > > companion represents the ACPI device a given platform device IRQ de=
pends
> > > > on was bound to its driver and then map the IRQ and add the platfor=
m device
> > > > _then_ - after all that's what acpi_dev_clear_dependencies() does (=
similar
> > > > at least).
> > > >
> > > > There is still the question - where the GSI number, flags should be
> > > > stashed so that the notifier can grab them in a uniform way. We
> > > > could simply attach platform data storing those values to a pdev, e=
ither on
> > > > a per static table basis or generalize the data so that a single no=
tifier
> > > > would be able to deal with it.
> > > >
> > > > That or I can just piggyback on acpi_dev_clear_dependencies() and a=
dd
> > > > a separate dep mechanism to acpi_dep_data that instead of being acp=
i_handle
> > > > based the consumer is fwnode based (something Rafael mentioned befo=
re).
> > > >
> > > > I will have a stab at this and see what's the least bad solution I =
can
> > > > come up with.
> > > >
> > > > I suppose we are scrapping the -EPROBE_DEFER solution (ie this set)=
,
> > > > what we are talking about above won't need to defer anything other
> > > > than the time when platform devices are added.
> > >
> > > I dunno, that seems pretty drastic for some use-cases - the fact that=
 a GSI
> > > is described in a table doesn't necessarily mean it is critical to de=
vice
> > > operation. If we don't even create the device until all possible reso=
urces
> > > are available, then its driver never has any chance to decide whether=
 it's
> > > happy to ignore the deferral and just use MSIs or polling instead...
> >
> > I agree with you (but that's what we do for ACPI autodep and AFAICS OF
> > devlinks - though there there might be opt-outs).
> >
> > To make -EPROBE_DEFER work I have to pursue the approach undertaken in =
this
> > set and apply requested changes - I don't see any other way.
> >
> > Are we willing to accept the approach taken in this patchset (I can rem=
ove
> > software nodes and make the whole thing ACPI static nodes self-containe=
d) ?
> >
> > One way or another this ought to be sorted, please all let me know your
> > take on this.
>
> Please make it as simple as reasonably possible. :-)
>
For this use case, where platform devices are created from static ACPI
tables, I think adding fw_devlink support to ACPI is a much simpler
approach. I proposed this in [1] as a generic solution, but we later
realized that it doesn't work well for cases where dependencies need
to be established very early (_DEP/autodep worked better for such use
cases). That limitation should not apply to this particular use case,
though. So I wonder if a combination of autodep and fw_devlink will be
a better solution?

[1] - https://lists.infradead.org/pipermail/linux-riscv/2023-December/04614=
6.html

Thanks,
Sunil

