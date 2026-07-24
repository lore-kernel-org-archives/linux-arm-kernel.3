Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42255C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=; b=E50UVmzTGFXGjjJhvGbxWYNIrz
	oFtyhP30amRdnshkHVvwEk7xzzgOOByL4Mjlppkwb5/RhgipLbhguOk/FfZCV79hRqrnyqbwF6Eh4
	edkO+njKBSSjWbQtufPQSzAGfUdo6imtZoSvnYU4yQsOdaaHp/zsuXe3sIZOpnE2g+I8Yc3RMcXkL
	N5jRT4doL9s5iFLtQTOyhJeTrShT54bqWgcYUat8ZWvPoVsRKIatKZhDAFfnJ7/t5+pOZURAJpczB
	s3dlkcOKog29VjsSNAbJcPHqWccSIyhz1JwF5S9QlIB0R/QMQBE65fampO8yTnT3+teblh+z7yGdG
	ZgFNwp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmv-0000000GhZp-0gFi;
	Fri, 24 Jul 2026 15:26:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmX-0000000GhUS-220K
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=; b=K4uhMFOPzfaAZtnauBgESM2oD3
	2s3PfmS25UWAifBZZsqVbPVSNwqlOp1LOcnF5Qa0x6RZfed9c9MDLdRic6gg7vPKsLBEF2Ecdl8pF
	ttkcLE2A+gYhvDbijtIulee0iHugPCOeObFqoF1nCqt/soWvOXPlQzRxjTVdPkJcNmKp4N4qb/pCX
	A4IPtpmLbGXO6ZOPcMd8dxe9b3iNESw39x6SAdES+gA4Zd1rivelI+GTN0txo/lwDKUiUpAZFriV7
	iMLz8IGaTSn6ApF7pEDxR/b4pHcaGGbLu9utZUjz4uZE/bQuA9R5gTfsx/8m+ZOH1WbkJNZkeshZX
	LnKihiKA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnHmU-00000002hpv-0gu1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:25:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbDXD3487371
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=; b=lUQ69t8r3RQ0hcwP
	F3p3KZcjvfYHlLOc9loUKm351F5eve2wv3d4XMk+XrsMxRN7RlNpFYWE+yjRBWCO
	q+6aOOoQX4zuDIoN4r4Xq65hVaMKtAN1iS8EE0uALs1dS/zO+b+qptb3kY+AGD9L
	iEeHPlz880faD+3qbfF6MXEUko4W/KzCS/irSMbceWx1sGxIRO2sxzfNkhvxRqnu
	FUKnBfB3UkLRGnNJRkm+bvOpHYxTW075adGj6sd51Y1m1QJRj2u1CTMmHGdFGKLx
	PH0wHKNebbZgmaQDL3OiUq8Md+iAS5iGtjFrDWSqlLnnUVqKcYwRr+uWBrXqfcep
	C18zWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0ccmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso8951281cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906743; cv=none;
        d=google.com; s=arc-20260327;
        b=N6Fw8e5ojT1gbNfUbsguFM+yaz5DEdvI4VdomZno+HfKPoEJFp703jO8K6uh8ephU3
         DSjvdhzRZ3H6y8/5Ydmrm22AXRaFiO6NijzCACmlHIXmIalT8vkv78hXpdmL2H2vD99s
         csUOEgGB31Beyl/nEjyuVcYiAT5r8M96GlhDx3z6Dloq91dA+hxZaga4WKX/lOMq21V7
         Sp/F+L0vpY3471T1DHpRpdEdUbgz+zdxqKRKuBDN8Ft41tUZn6DFOqL1qKwzVC2yIEIA
         uGpiWdOKxanN+d7ujbNrEnJaS11FeUxUWbxT1S6GA/LF3uJ5E9eKf+Aggr78w+svcvtG
         BpWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        fh=Dz4PIccN0vW9dy9vCsCcr9LyDUZ1GvP7T3GzF6BBfo0=;
        b=CjGCTiCrGSReJTnEq0QyEmtd13jc8ucd68DG/ePlImixtXLTNjT6LFMm1ahkiW2uKX
         ZkhiDuJfCNOYptXmswYJtDONJg+iM3H6/l7a8GSNa2U245Y3x8rCrCn9w3bpaE4UhW1G
         99LK4VEQgg33NOruwXQHWtpcXd0XKDj1P1nQcAbJrHF9X8xJAuZSQ5btEjqaDXm/vhSf
         pNHjX4EZyuqL/W9i/OGRwQuCEx6BL6NGoIdUkdaAX1DVvcM0TvTHsQjb5i6tcNrku99K
         7p/X4PviZFQYgSKUH3V0TgPcRAENdLPqs+N72CbakjiFpsJJTaCGDwAxQsaMo+heEeBh
         yMUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906743; x=1785511543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        b=HAag0UG1vfIiB6B+DwbfQxjcrt3S9NQQfq5xxk8No1iSnVQiPxum89gaBWzxnj+Tpo
         AMPvFypr+PHqIfVJuWF+GqpIXfDOGErKTNnyT82jFZzPstNjkjCYIGjLQf5rZrKnIi47
         JaurP3KC9j7ZWKfjcUsyPGkZ0qAq2tdQ4LkIq4KYyYkRMwf2w8jVwsoijtqz2gIvf6Mk
         ztSLs85P6tDyVIiquc60sSEst8yqNNysFfg/dWg/pgMLofkCTZSGk2uikdoBDWCvsuCy
         EwCIgzpZbVHiGWD/6QI5qdsPCuuUeD63qyaPiqsjCaXyz+7cN2wdD0NAVWV8U9tPrdLr
         GDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906743; x=1785511543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        b=tAqrFiLPCFhllz6NL4Yvt1+A0KMihuSxOHdC0secD7d5UhUHz/aWU707Vqsfy0SN3W
         gTL2PPVGzOeibypT6U3f8nUXfZCBDSBD2DEbG+ymyrdZOLR9vMbcbnEUyOHooSYTPVCJ
         f85PejSgeMP7fqhOWdAwx/KmBRL92ecDYNdEAyr7me00wWBEx7lWDkmQpsjaPmemporB
         nOqoeNtS7lWTla+PPImcN9jiASmo+raGea4q1zMKRy5/w+cF2qdcBY9dP58OYrJ3t413
         9pjJhaD7GC4V6UruL3D9MV1d1O1qWLmINgtnZiKJoV92HhK3JqTVo6ARQMLWmrppecI1
         9Ogw==
X-Forwarded-Encrypted: i=1; AHgh+RpShUiphU+vbrEb4Kf3ofNKBsK0TcMXOry6mgcXcxIq1+hqwvQrPKvodYIj5GOU2oaYAAysnS37Jr63OIEzuBYZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1cGoOOq7D5DPuHjurTU7t85SyfxBBlGgZB01h0hSvQOiUzFMI
	MPULwPBcK1T7YvS0umhd6rkrtLfOMnuqDITvT31yBbjxcjlRKvmo03vwcaWpEr9+ayoC0tuL9eB
	Idj+Zb1a01uqvw9eOkfvtLxY9O1I2izJqJB5tNMIFa51OUigdm84YTrHgKy4nUwmc5OOLIl/OfD
	9nCggjRv5OblUTRcJJ/E2VrqsQOFuXXw/rJ83Mcb6FQxefdQz1yHGa
X-Gm-Gg: AR+sD13kY4pYAt+qx1ADM+Fg540pJVQDCph6xObJu5+NSmKsSTJ3j9qYw8vTi0TDNLN
	Kz0H264UqLNpWJdO9F3dkD1u4cb38v+mfYM1Wpook5GB7/UuryChvr+CvX6Hmmol7OKorHpv0Px
	PBVqgMIbjo+O6scTd+8P/kBUFSlTsgUCp7xHzEPBKorB4eXBsIYHL57i24fA==
X-Received: by 2002:a05:622a:22c3:10b0:529:a2ed:bcd4 with SMTP id d75a77b69052e-529a2edced5mr2053241cf.50.1784906743032;
        Fri, 24 Jul 2026 08:25:43 -0700 (PDT)
X-Received: by 2002:a05:622a:22c3:10b0:529:a2ed:bcd4 with SMTP id
 d75a77b69052e-529a2edced5mr2052841cf.50.1784906742426; Fri, 24 Jul 2026
 08:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
In-Reply-To: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:31 +0200
X-Gm-Features: AUfX_mz33HxJNiHzlKKDq7YYI97h7l3wukc4IVOHOz1B7cIf_lHzlGi_RyWl1W8
Message-ID: <CAPx+jO8gRxfM=pxMjHrJNcexOzDRiHjauVVDbpGutPKaApghdQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        Nikolai Burov <nikolai.burov+review@abscue.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: U6NcPnj9ZwYZxc2trD1Zb5iQpRtQeo6N
X-Proofpoint-GUID: U6NcPnj9ZwYZxc2trD1Zb5iQpRtQeo6N
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a6383f8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8 a=R3Y5_zZgAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=iox4zFpeAAAA:8 a=JfrnYn6hAAAA:8
 a=m8CDPgaNMIpP4pNAotQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=chadc-dSXXc7PrnZVOv-:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXxQ0z50jXGFjm
 zjzYE+gwUEm/j67yzotWNltAI2ospvD9k+cmFCwQKbQdnIdQLxTnwmDAMltDMzNx2emTV1Ho0JP
 hvmSeAMH1YgoWzcMAzXJYIqm80i+XrLp6blhflB7GmuL7LHvHkGuVMd8rSKbcD5r9wQcIUejKv1
 KuOVP10WhuRVNbYbZLLKUDRMLgc8uv1o12urGlJEROIGMCmyplIOSBDOHSeO176Nf2YDyAdhVMj
 bTf9CwvObCpWz3USKPIF38plKHAO50uJd755ag9mAWZ0vV5dY6LkfYNRdnkQlC+ddiqUCo5Fear
 mQiAuECeaX4pGv8ZyyYXrmoUuQgLaJX6js97bt37mPgl8yHbz42j0L/NCTfnUshfvsWA42LgkBE
 LVHzegXC6ZCKZPe42XZw5Z22YrAyO6gPAPOoFWzgfBGnUtDBPpvkWn3If4ng5lgGAyB3KlKxHVw
 VKkZi7+w8WbeQiA5Ykg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX+V4tCNaanCPF
 94KBEyvIgwh520hoFSF3U+WQkwwTZbpvDMC/z4AaSkgZoSYauR2XnwvzDdK8p7/R1urI3MS9q5+
 OIKPXQnQZB2V9Wy0csBGKZtn84FMeYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_162546_556028_730BC187 
X-CRM114-Status: GOOD (  23.90  )
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

On Mon, Jul 20, 2026 at 10:46=E2=80=AFPM Nikolai Burov via B4 Relay
<devnull+nikolai.burov.jolla.com@kernel.org> wrote:
>
> Add power domain driver support for the MediaTek Dimensity 7100 (MT6858)
> SoC. On this SoC, there are some new subsystem-specific bus protection
> blocks, which are listed here in ascending address order:
>
> - IMG_SUB0 at 0x1502f000
> - CAM_SUB1 at 0x1a00c000
> - CAM_SUB0 at 0x1a00d000
> - IPE_SUB0 at 0x1b00e000
>
> The VLPCFG bus configuration registers at 0x1c00c000 are also new.
>
> Additionally, implement the SMC-based power sequence required for
> enabling the modem power domain on this SoC.
>
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
> Changes in v3:
> - Fix error path to also skip sram_pdn for MODEM_SECURE_PWRSEQ
>   (discovered in Sashiko report)
> - Link to v2: https://patch.msgid.link/20260715-mt6858-pmdomain-v2-0-6293=
e87fc093@jolla.com
>
> Changes in v2:
> - Rebase
> - MTK_SCPD_MODEM_SECURE -> MTK_SCPD_MODEM_SECURE_PWRSEQ
> - Convert SMC command enum to defines
> - Based on the new SIMPLE_PWRSEQ changes, skip the sram_pdn stage for
>   MODEM_SECURE_PWRSEQ too since it wasn't intended to have an effect
> - Clarify that the SMC call also handles bus protection
> - Simply if/else code based on the assumption *_PWRSEQ are mutually
>   exclusive
> - Add comment explaining that PWR_STA_2ND is skipped for modem
>   (mentioned in Sashiko report)
> - Link to v1: https://patch.msgid.link/20260714-mt6858-pmdomain-v1-0-4f09=
bbb822e0@jolla.com
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Ulf Hansson <ulfh@kernel.org>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-pm@vger.kernel.org
>
> ---
> Nikolai Burov (3):
>       dt-bindings: power: Add MediaTek MT6858 power domain controller
>       pmdomain: mediatek: Add support for secure modem power domain contr=
ol
>       pmdomain: mediatek: Add support for MT6858 SoC
>
>  .../bindings/power/mediatek,power-controller.yaml  |  21 +-
>  drivers/pmdomain/mediatek/mt6858-pm-domains.h      | 466 +++++++++++++++=
++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c         |  55 ++-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h         |   6 +
>  include/dt-bindings/power/mediatek,mt6858-power.h  |  23 +
>  include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
>  6 files changed, 568 insertions(+), 6 deletions(-)
> ---
> base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
> change-id: 20260712-mt6858-pmdomain-b1b456c96675
>
> Best regards,
> --
> Nikolai Burov <nikolai.burov@jolla.com>
>
>

The v3 series applied for next, thanks!

Kind regards
Uffe

