Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9502EC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=; b=JX/wtNPUfTQReoEvYv0SKfw19q
	ZxEa+8T8riNlCSbX5sIOdm4OrthO8G1uzvf5BTW0y37BtykMGLe1avQbHnx6ZCBonXVybWSSRETMR
	92gBTxI2UokpmJhAjdjc4qk9YdgSlY2NY/zCqM7fGaA84Y904oJs2LP+J22a+z0p6kJNdvBHTE+NT
	NcxdhwPtU9uzl1aMcqOmxyxQr6QQzbJBO0bHz5u+vIuO8FzSiVyyYYRGBzkl8dpSsZV/mOIPYFHvu
	+Ybahif7D5S609WbNVkxc624re1cExYn76UaY07Z7S3gP3YAraA57BRlVfG92+xhnhNYkjrUVkhgW
	BFsEJ1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bvC-0000000F7a9-3fE4;
	Fri, 18 Sep 2026 16:58:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bvA-0000000F7Z1-2Vga
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:58:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGoFCO4103558
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 16:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=; b=F862iJklfTEspXfc
	UjvRsNylWUiwop35P1muhLn10HTOL/M7stdoCV5Frgx1dJJyqJCtb9FvturdV8sv
	z3alBIEzMWiVlVthfKBVozYtF7rTFVwi4etMJQaCL3Xb1OMzWcr3mo94SqS0NKef
	R2spGU2cf3Z4YDgyNC0YvETba6iLNRQtX+MmCmDbez6Y2pZzcL6/1A49LPfbZR3+
	EwSgfygJ0q8qQ9GphKHYvddiZI3X3ZqEQSOuyLKfi60D+5Gm3ZpMKc/Bkp7QtCxC
	19jlA5mLGS4eEQmM2YLhernOpYqFKGMWVlTYHqEyqO4snc1SdLMMuu7ckn2KAGe8
	b6XcSg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dhnc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 16:58:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-855315ccb64so1018683b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789750723; x=1790355523; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=eh2YgXjtJJHmp9G9s0n5hviL4/U3uStGrwU3d+NftvPuFnBB/2E+M16Ko18OtoFT8P
         NL8L5wEt6pSWj+GXJE+pvo/L0/rjePYIKZAR4ANQ8csfQxfpwrNAFQ7FtsAhJSjB+ZlP
         Xr0N5svyaMJ4luzGf3VYDoUoIKw+0k6jrSNL66BssFB96FXywjB7uQoWsvmA5BDKDvPR
         hltz0zYzjKlWMMl86USTDWX83t+3AtEekMpHpK///5bBHLQf9O6WHiBvpmuIrcKFytiA
         uB1yx+++IQh4HLnCdLs2vnn/Vky1UtSN0UOPmic04iOD+ZNtniirnVTefWHslHhovY3k
         Q74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750723; x=1790355523;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=xRe18UmDIvUDiiO4nPXFx37s37AQdBVM34TLjjmYH6lpJnZt23m98u0VOchHpGRVLp
         Va6hMTLfSlLlbpcofOMq6Dl6gKp4XVlZLw87on2tMtwZpjeXkdfMSQiqA04KiRKu55zd
         9tOQVGxqi8BMEF6s6qiNofqVhRBW7BgnaKbLf5/UsLjbkUuiO0uVolUKsnfWuVY9HCC8
         Ga5VD4sFk9yx1roA8WJQqWf1ELIpeeOZWgPMYzv60jeSb2FgQ1sa58vnLpu1RY+xV9jx
         ZpkHb1oypC7vGWzKId4sS0qUfi5tu8w8QDDzfsPvFeL9Y48rH0C9Sg8gnElm6roMCS2e
         tsKg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ2LUnJgaTmCNkfPOwvXBJ6WLQUXxDLkGB/Gckw629DBSpwin4+evkqFkO3evvRyMI37GQoYNELgxsskgaDo/5@lists.infradead.org
X-Gm-Message-State: AFuF++mpNNY/Rd9THNteOAD2T71v3zLli2qvWjN2bg1kyP1RMrAiHmYT
	ow2Y6sHk7MpqVTnNY1U7+jEB78qtTK9AJp6E0+LwVJ8WKW62g6AwrJNytouY3TbohB1p2gPuZbs
	/ArRUI6pLiqNPIYANvfUMxM45lkXdkG+Byss3d3kHUIjHV0dyWrIxZL9JdWWM/xZzxLo4UlecOR
	dOvw==
X-Gm-Gg: AYBFou3pqcJEC8HwO4WG7K0tboq4mis7VcCP2KCLZlHPKdfzIXAguT2g5+9Hs3gVjSn
	SnmgRqQLHN/+Mewi0sOOuN/I17NRFI3K5K1SSiIk0BptBrh/02pwpseouicXhNqrrENEc2JWS3T
	wuU5YY3KqnZc00r3wZeWfL9J63N4rcqLdedJdYIVOjM6bsuRrTkGALrIQVFXnVhU0maRzxmKcHD
	jdi+K/W3eKEOVq7eRBTf9zevJHwahIB/KpJH36yMsJuP7Ud7hsRJkRqYYlZxBw0fTGT2bwCE5EZ
	FHGmqATo5Nnh/eh2uMmXTUn0IqRZ8LvZ/i7eaSe9KphgoOGG+k9GDWixUJQilFbPvTedVVln0aZ
	1gORWmw==
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361298637.51.1789750723369;
        Fri, 18 Sep 2026 09:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361267637.51.1789750722830;
        Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e7433sm1426162a12.28.2026.09.18.09.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 00:58:17 +0800
Message-Id: <DLILO7Y6WWXC.ON1PAKLWJM1Y@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com> <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
In-Reply-To: <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfXwEBPRYBwRspK
 rSoihOwQuhD+kqxOyu/6S6l+uo5xH5U6+McruMtJ6qPn7WV57wlzJHVsWdwr0u3mLXd1CroR2zG
 mIxDFSN1tATtbrmvpO7+MSy5h9w7jss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfXzV6sKjOwqX86
 jqHMcunJAkMattVFvf1zZPooGY4IqyUv53THooSXo5pibel3a+v6Pe/+NTF4NV5Xl5OH2CohuL8
 qOiRrdLdcpcRyE+F2gY1NcjLFi0Ifxt0jJB2nrdoeSoVYICFZWdOZNGK884mMyJd+C87D5yzoCQ
 UbROBjrg59sZ3ggwhK0IfoWdKnecRgXFS8WuLnpW4bOGIeV0pAdrJvyX9L/ju7/hInFBslEIEal
 mb85IKOQFtsZYa3CeF5myotz2tpK9zQHGF5yuc7JA5EfKqWNTu35aocbsQ6eqTXihZlcerNiPAz
 Jg00TrL9v5XvFUraQJ+uGB4sf+sygKq+6zxHBzKvI32aHCkfY1VSS3R623ay4OZJexN0415dnj3
 8CiNbgzz7R7BLyDvqMFHI5Prn1hLBHosvZX84zy0NUjCH3uQqlASKnWMkeHERSnvcny55e/+SZJ
 QtPMgPDyhNcZ0bfYNGw==
X-Proofpoint-GUID: 6FEi-a10IlJENQt6Q3BJKa_7Yi7fuW07
X-Proofpoint-ORIG-GUID: 6FEi-a10IlJENQt6Q3BJKa_7Yi7fuW07
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad6dc4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gNeoJdBQTLUQTwsD9V0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180242
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095844_645273_84AA8B0E 
X-CRM114-Status: GOOD (  22.93  )
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

On Wed Sep 16, 2026 at 2:24 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> The simple-KMS helper calls the pipe update after enabling the CRTC.
>> On an enable commit, imx_lcdc_pipe_enable() already programs the
>> mode and enables clk_per. The following pipe update sees the plane move
>> from no CRTC to the active CRTC, treats it as a mode update, and calls
>> imx_lcdc_update_hw_registers() again.
>>
>> That second call has no old CRTC state to disable clk_per first, but it
>> enables clk_per again at the end. The disable path only drops one
>> reference, leaving clk_per enabled after each on/off cycle.
>>
>> Skip the register update from the pipe update path when the CRTC already
>> needs a modeset. The enable path has already programmed the hardware for
>> that commit; keep the event handling in pipe update unchanged.
>

Thanks for your review.

> That seems reasonable. Once the driver uses regular DRM helpers instead=
=20
> of simple_kms,=20

> it can all be untangled and this test won't be necessary any longer.

Yes, that's the goal.

IMO it's better to spilt the operations in imx_lcdc_update_hw_registers()
or distinguish the caller.

However, it might be risky to make big changes without hardware validation,
I think it accpetable for now.

>
>>
>> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>> ---
>>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index f52832b43aca..81024f7d9e96 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> @@ -311,7 +311,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_d=
isplay_pipe *pipe,
>>   	else if (old_crtc !=3D crtc)
>>   		mode_changed =3D true;
>>  =20
>> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>> +		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>>  =20
>>   	if (event) {
>>   		crtc->state->event =3D NULL;
>>



