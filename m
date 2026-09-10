Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA4AC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=; b=w6lTTnmfjaGpKH98tFBOh29bjJ
	VC/MXax8+HDOf+z+37a9Yyj6uCTxfOUD0B1WSottPK3z65K+BUCkNOb9ck1dFN7v3x8+cziKDGMwx
	crLtnvgqFyg8TBaZtqHvAXgcpzs7FDPFjb+lO5rSziUnPK0o+vLXDjIqAA5OHvP0kD9zZhYljunFQ
	p7pMK9x/LrTETmhqOU/pHPl7vY5EtwiW8mr1OgNP4HoYDVSYU2/YnHsuBZLpsuZEpyav2FOFeNxwY
	8F3DkplKy7BhG8FxmPrP93LNTnmCWlt1ZQGv6Krh+7yTv9coGukSTWWrw5s1h7iVcHif+3MfrkNMu
	+fkmCTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fdj-0000000Ec3B-456X;
	Thu, 10 Sep 2026 14:20:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fdh-0000000Ec1G-2Fni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:20:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7Zma216016
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LzPgv+JUw7blI/3j2Lv9Lk9a
	WSnQjmSVlk9jgF9EUWw=; b=TEl+QYBjvKr7HpD3M/E1C0inzzxT3wPzMBXyaxhQ
	JS/k2+jCEgSrZI5BXgXVlsRw8NSb9S6vwE+BV6TNPQgVtJ1i/VGUYRW8xvArJpBb
	/FExhwovNJjR603crm8ThBG4bbHouAHtaZpkFVtj6BKT+ii/rzl6nGDYwhdmj4Ps
	/vIW9HOv7ifG3YpVyTiyfvPIMG12n812GMt2C72XhR4SfIJeR1BK0QjC2mRH9q8H
	CX8pRnTA46axH3If96TmEpgPN2r7k4NWxWdZR3TEf1+tKv/S3/XwAl62V2FMl6ZU
	XGM1IaoqCeU7iFyUzmBIrAeE5yMqXRYPbUS/inILFhZTrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn9jet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:20:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso98777265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 07:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050031; cv=none;
        d=google.com; s=arc-20260327;
        b=MjqCvrvKYa81tTnYtFrc1bSLklHyZCm0TwpbVthgVXjoM+Yyx4GjecTDk8JqoEA06U
         KRxrO2pe/Q9in9V2bAn0aWS8qCjMKovTu/pt/K6l+dsgN/6201yIcJfleoAncW4SLJCB
         iCEhj7I3km7KaPXnpeC3JWjTgzu+01Ha+H4NCydsSD2beOME4A2Uz+ILOaINWYRH81Nf
         9pftOj+XatXwlMbbebGp4ULUkerWzHJ6ArJKvjoNCcwK79w0QKfBUA7PT8vi7PxL3UCV
         ucCrHT6/aFPbbGb/qJMIn4Fe1OmXceDDN+SDotc5P9PhRQZdt5tHHLPGvaWtbzWoQ4iT
         O45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        fh=g7uj3kcm6mY//zoKSoxcuPHMN/V2jswbgbxELYcfwdU=;
        b=R6LuIKnJ3ylJFmMCNRVGdCQYLXEP+rN5Sfx6+vuyjJH2z2jIjTjPoDmpL6kaFskJp0
         su/BGlxWKCg02cn965ebLqW0C2dh+cdOZQ4DbZYazwpwtxkaE+Nb9oZLdaVVq1qETSTX
         aNABBoPiIjN0jEcaoh3CaE8rXtxwhmXqtxUX/RM3cKTKZv0wSLPl3ODa69aW/H9BGg3o
         OfB7ePuLayCpxSbkYOuArT7CbEHzinNsbfhzI/S7Pvlwry/rD3ZaEjVAdW3xYBJUCVhg
         DJ4HyK103UFTF8atM/KZyvcmnzqzsWW983DIKhv9yVNyhyfVcHxlXo9ZAFU4XC5N5WY8
         J34g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050031; x=1789654831; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=gmwHH7nsbw1p1OvpOENAPd+EjKvd4L/kMyvHAYecj3WFgzopFty2Jr5G2AUQYXDe4u
         4xZZBcPkeVWtvh9H+owjv+/XpmWGXuaTGaALls5xsB+j/ZjiLmigHQ9onBWEl6OA1c8q
         ul82P7zUhuoBgizV4zu1TCts/OTn+suFpA/wzFr/xIOOJkSKsYOoO96lLok4nVCz8Wv4
         AFI8PFFKaACAvABwhTTqdQ+/SvA9sPntKqnYZSIVQdrvmNuHPlGjG7+5X5b2ogW273sm
         B/RHGau3Pxze4JoTBUAiPx+lk2KY0xVeUXsuMNQ5iT8ddgW8oswifQdAKiksoFe5VJ8Y
         J7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050031; x=1789654831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=KFCv9IarWiVk+ueQbx/OWeS7vYsAHtGLZO09IyJcoebKau+8JaBZCIT/B40rjivKfi
         0dN6rRw1edDg7sS+JY5RHWvunZoDuNFZZdGXcoaEpLOxFsI90Yqa/qvoCJHHP8+1F7qN
         F++Ici7lQezmrPcBtxxSHXxgazbB42Gp6YoXvPrnWIUJ8W4fW6kMUcU0H1ALG+BLd0Uf
         ttlnDiTeBfzdkKzgR+VivV7ExwGodApQa05tg3W1jdkHvXgp4L0kZqhhOGcoeP+wefb3
         uBqps/ricN76R5sfi/zNR2+EgueZWWCI4GP2i2jC8bxfwahc4VpMm/zHAGY/H80sKakK
         qjmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyhHoGO+btbElaW76u5F6jj1unwEkbPSLDy2vshC/R2YnkgFyoWd4VlHd4bPm8OH5l/1rHb/R9HWXcQCCMyfQF@lists.infradead.org
X-Gm-Message-State: AFuF++nQUz9wlNqkGurRIaSz32NolAAqd/lyGNFZjYJbppFJ2ohEOTfA
	YpeiQNzu7hk6bgrctKLNP+pjZcP+nSOf/csH04afwwcCud0LxwH113rfO9XTLtQtK88wVV8+2hZ
	MBfI4i+NgPasQXvY2Esaor128C6eWVWpAtPFqy+Tbp6NpkQamV44kIN/FRbgnVC6vaWq4UQoLyM
	2SiyR+OFNNeo4W2MA+V5NyI1CcS9N2e5EpUW2RA6zcKs57i+MXIIc7
X-Gm-Gg: AYBFou0s4nJsfd0zeqaMuOiHPIDprywrTqrT6kf+nEFWeKIv09n0wsk7Z/FSkn5l4SL
	kIFGRBc4a4h/5FoR6mN64E9Nz3489mO3F4s7Nqo305iLd1jCiDJYfar4vY3VdxQzrsjl3VLh9nv
	zHBKtCXfQ2WzkLEkxaFNuEiHqxnhVARud4X/WF2HKKCv/VRui+JnsZG6fGEPQlp6aafnhUUKs=
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db8dc82407mr200794685ad.12.1789050030900;
        Thu, 10 Sep 2026 07:20:30 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id
 d9443c01a7336-2db8dc82407mr200793205ad.12.1789050030094; Thu, 10 Sep 2026
 07:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
 <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com> <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
 <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
In-Reply-To: <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 17:20:18 +0300
X-Gm-Features: AcwNN1VVA4SntoL5ZvQXqShw0ZuVR288fdr4bQQ_lWLwdYYaNA3KoOK8hgJ80N8
Message-ID: <CAO9ioeUEQ+kzBLj3KTv+uayaE-5aw-aL49-0pJ-x_Vwq4nu9JA@mail.gmail.com>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfXzVYOG0NYvUu+
 9srXCNAoHBhz9Pf8XsFGkP0MvTMVOAeZAfacUg0P2+k4Lp2canFE1yKo0/jcPXhc2cB1RK3vZTs
 pxbdAMb8f2c3bC1T6HNILYsciipZXB0ZMOh+HPYkhttHWMCgMpuSo58o/uWGfwlE+8ajSdVsXN4
 Dsrmd2z3zHUtWElezJtiSe9CcXMhOqs4OUjepmJKTYooPnDQJ1dzCP60RmP0dqrN9/VJV78ufOZ
 qlSAtlxbrQmc+zwAM8u8s1XRTWmUepIUOusDRcJ4a48gCIwduoTTSfF4N1wHHrvA9jY6uxFeRSg
 NJN4hERCzKRY/pHKMVxTnmdw8U5cVffvcl94T4WIQGuKGgRqFrsDpsxg2JnmOxAwJjQywIxTsWy
 00ucWT/KhDIptsjS0HfKBuKOaq+PjhMtQ0HFTpDI3FxNcGHwwu2fobtM6BJe0jeqjfM3fO00Fzl
 kt+5lfJUjY8YZUSmS7w==
X-Proofpoint-GUID: 3FRkWvOLGpQbRnBH34NI0kQ5cByRABQ6
X-Proofpoint-ORIG-GUID: 3FRkWvOLGpQbRnBH34NI0kQ5cByRABQ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfXwZLiIZ0AG0tK
 z9Bn7BCsksIAAsRZWuRSE50ARkxk/TkiCT8pZaYKZfvM7DapZ6LP9YtDpmlNieiTyzokKyp2A6r
 F3VzOivuu4Khr8sTtPEeciWUDWnVoog=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2bcaf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dlmhaOwlAAAA:8
 a=6H0WHjuAAAAA:8 a=YxQatw1j_ZWosVD_vr4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_072033_583048_B5C13750 
X-CRM114-Status: GOOD (  39.61  )
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

On Thu, 10 Sept 2026 at 13:38, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Hi Dmitry,
>
> On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
> > On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
> >> Hi Dmitry,
> >>
> >> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> >> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> >> >> Hi Dmitry,
> >> >>
> >> >> Many thanks for working on this and sending this patch series!
> >> >>
> >> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> >> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> >> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> >> >> > spec, however they differ from other Qualcomm platforms in the
> >> >> > implementation-specific registers and also in interaction with TZ.
> >> >> > Venus, MDP and VFE SMMUs are secured and require programming only of
> >> >> > CBs, while GPU and JPEG require full programming.
> >> >> >
> >> >> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> >> >> > and adds only MDP, GPU and Venus (although untested, it is required for
> >> >> > display to work) SMMU instances.
> >> >>
> >> >> I do have a patch series (sent years ago to the mailing lists as well)
> >> >> for CAMSS so I can definitely test this in the future.
> >> >
> >> > Ok, let's land these first, unless VFE IOMMU blocks display on your
> >> > platform (Venus was blocking display on APQ8074 DragonBoard).
> >> >
> >> >> > Note, to get display to work properly one fix is necessary, [1]
> >> >> >
> >> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> >> >>
> >> >> I've applied this series on v7.2-rc7, with the extra commits between
> >> >> that and linux-next for qcom_iommu.c backported so that your series
> >> >> applies without conflicts.
> >> >>
> >> >> So far I'm stuck with the GPU not being able to probe, adding some
> >> >> printk's shows that in msm_iommu_new() the call for
> >> >> iommu_attach_device() is failing.
> >> >>
> >> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> >> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> >> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> >> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> >> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16
> >> >
> >> > See the patch [1], it's picked up for 7.3
> >>
> >> I missed replying to you, with this patch the display lights up again!
> >>
> >> Unfortunately the GPU still seems to have issues, I don't have a log
> >> right now (I think even SSH was dropping then with a bunch of log lines
> >> appearing in kernel log on screen). I assume kmscube + more complex
> >> workloads worked fine for you?
> >
> > I was mostly using kmscube, but I can try running the CTS once I get
> > back to it, sorry for the delays.
>
> Yeah, kmscube doesn't even work for me.
>
> Bootup works to a tty with screen on (mdss doesn't seem to have any
> problems for me), but then as soon as I run kmscube the device shows a
> few errors on the tty0 on the screen (USB stops working apparently since
> my "dmesg -w" doesn't show anything) and a few seconds later the device
> reboots.

Interesting. I wonder if it's TZ tripping on the VFE IOMMU.

>
> dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt
>
> The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).
>
> I know there are some differences for some bits between MSM8974
> (Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
> have? Maybe that's relevant, also since downstream splits devicetree
> based on 8974 and 8974pro.

Mine is APQ8074, not sure if there were revisions.

-- 
With best wishes
Dmitry

