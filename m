Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C7CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=; b=Yjr0mD4SyEHSvm4JhsvGGYb6yt
	VKfnPduIpNkg8/E40eMSjJMidXRJFAbzknkmebUQHjjuS5OpmyeZcT/Cq64ZEeZzwlSFbH4y0hxCi
	vw9excxQ9SVNe2yjNJZtPVxH/cynYqMYKAa5whAFIwyFpj2FRi2Qw5MRtNHd7KMJ7yEBL6T3U7xTm
	iPCYEwFaEFBJmZUSYygmnCJYv/h4hZcGFZCot0iXWC029yK8+p8jwASHgCkya+sQvm9mhidvtcqzC
	bIN8uDVDgJAZzWSRGTDitvm1R6QJSAscI6OoRFsQso1mlWhdzmnQHLhL864Cx7JD5Oz847G0bAVRu
	sMks96RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7ST-00000005yRX-22gA;
	Fri, 09 Oct 2026 10:04:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7SR-00000005yR2-3fwF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 10:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=; b=K+mAMaJsVOLBVpQGOZl30h1sBC
	/3UygOPc+iro4cdqYTo4Dc8FvouSIBxbaFO2sZmwZhi2qPXTM8tp1FvblS9lTs5Zk30FKSGYjWAGG
	/y+vRLVgCLcqNcNV2sECy6jUejKzVdcTwlG1cAGe5iDxEMhvAHQuhPKJZrXUpDXTCZyL+QA3c9tA6
	XL2C8JjDsQyTrk4/o01rqibuO2XMCNRNBfDtd9z7p8FwMhuGgXda4qd+Osp2XRwffZNr7jQgZ/s+6
	GDIIPB9pTrUCfu/gX0dWa9GUUSXsML/URlTiLqG0jjfAegqn+4fID0HMetpO5M69qB2fOR3Y70LgE
	yc92SSyg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF7SO-0000000B69v-2PZS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:04:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KBYS2256978
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 10:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=; b=WEXjmYKVBun7yiWt
	YcX80+2wv35fcTXvK0ES0ZsZU2i6UqtGQUdqQ4VwyEeUF/DSdreHDgunke9Bt6Zb
	uScCI2vzXkW/VEx2NnFgsweM1StFeweU8GOg82xUFPbMEEMB5NkDKsgUgKSkizv4
	zY5MHEbeGsyttEzp9ebcb3RpBQXkvjgKnoSv8ArUfBs/s5/Y6GOMqcgILZDcv/pS
	pEcgCWyXzVgPO46tMgTDwL6Q3MsUFTZ0c2FA0U+PYKGZBGvML8OXH3wDKGQHqrkL
	9HJuqxwi9YNtGh4mdyRvz/KF+F+jklfT+CQgBQ8hU22qEI+ihK0+Ax9tR3OQTFbk
	B8hibg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufstx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:04:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88629a452e0so5026622b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540240; cv=none;
        d=google.com; s=arc-20260327;
        b=EDWU+i8GPfFUx0UuYs3n1MCu5SWF7RdD2hqdcCeYeoLWjNT5QfExJdC+qfRnGJi9Po
         bfcgYkQp8nQEhutr0T/UNRzM6xtv8//YtPAbPECYkNqD9nFc+kcinTuFQiFjOeN7ZfHx
         a6t8o53iNxrf+f6CyTnxFW49Q/PyILncghrArE/CNS4Uz7KrAY7taW8A2oLqJjsCGkoA
         oEJUHQVDfvWmZlmgXBbRLUdCY3x5lCPy4fFJGxQc2JgihvEjUY/Vjqg/IWZeANUhSKHC
         N/dkacHMPeQ0wPcqFDUq3LtYvff58IoAXlr84j3pef/SXAJAQ5XoWaN2PVHgKG+eX2H9
         BPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        fh=8vpJVZ4uFC5ayyffvODwKzLarmFt8mdhkkaGUAPbCvQ=;
        b=A0+kiFp+ZXndLB4j7A99G/nDYoYz/MMhD//Lu3v8d5KCODdXywQElM1c5t3+RrW1Yx
         jKoT/uBS3PKCTl/mhd89VlqtiYVuRjC5OjNRXskMNiCxyhl+1pf87M7JS/imqvVunAgs
         T04dVfCTshNoheRQV3R7Mcbp711wiFFkjSQ1dGJv6+d80VviPM+15/hj++oFGswOE+M3
         1n2adwhjvJf/s6PdgEsnp7X5LbCRPR6Mu1aunjAPIgT/3twWKuTgqFkxjFoDjpm86AJE
         ne5HuFgYin9coPn1GcrcR7+mZrQmtXAUXG4hzNraRD/caSw3cHKOSuplNOxmuNUFSg4f
         COsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540240; x=1792145040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        b=AWbeub5VNEI8C87LmcxIWNoO+/P1BWkqwvwr8/roe45Ku2wgBIbkq2aovRpMMuaeNO
         L76EOqURAaKdhkagbDF1RT/yOFhnk0/YE66n6YVG0NU3SHqyXdyAQHkAsxExt8qUuXWw
         MDw/BK0NOKfvZpNbIqnyi0qwN3nrudvKEwY/J8Ng6NGSalsrVtScuEtysXsNlaBLFHFC
         Ze04mqjBpLHKE6nR+zKKQcFb7a0/7QWko05ZeoBnyplqQ0yJ5D1vg6MQ6qSu37t0OV8T
         c3N8OHZuIaUkpDCeqqcBGdpqV5QaHi/SMS88FOHBqFax08BYP2P5Kpbxyjahla/cvA71
         pyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540240; x=1792145040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGFAbqayoGzkNoR9L5GgWnoZmVxL7JzSyp3JwWFjq1k=;
        b=YX4PRljNpSvs4mrpDxrts8EE412ebAM+5CqCZCgSoopDdb+MGuVz1chPdUElqsL7IN
         8tMnrBJIelTJZ6ot4DWp9CKtdglMvB2qFzXVxvQE2mLTVbVrAA/sSIZwo9JH0jy93uCv
         kQ/EkyNoevcix79tLHBD1wruzOD4wwOs1nYMJiwB1dqdzjqucm1Dj01Pif/RyYvCgNW4
         ZHB153VFjD0AdcaWE5Wb7Shx07mjEWz5U+XuNBBP3BGWTDHwH+q/nUpndZngqOM1z8s+
         TWoZo+OiG23VnythAm3lCDAvbTgeVwapefPMmcSZm3L6GKzOpReOJRXTpW6DtjoiHNJ+
         KDUw==
X-Forwarded-Encrypted: i=1; AKwUvByLcNd2a2GfQ1Vb2s6F7NwgM6I1so6OSrP4HsI8oXozjiyfpJtuMXj0gzLZc2AT41O5+MF3KmsNGhKJ4Azc2goU@lists.infradead.org
X-Gm-Message-State: AFq9FYKoAzWOhiwAW5vER2vt0pTzDdP5eUPPKDFCAOkJ8iCdVte8hxDc
	U2blsRq7yXPxMY8Eriyr1KJWjhW4pnYdSiZvati5bS3vc646AInul3qWDajFaUswidTrZ5VRZBX
	9491a+ifCirXccaeSnirOKFu7tW42NKbfM8PFLBrygpCzcY5Tx0/AqX4GN2QvZMahCv57f8908N
	1Mst3CiZPmoHL+CAJvRGBJeMTOXWO5eMIKy0w34GD7YOHMIVhJ75oZ
X-Gm-Gg: AYBFou1oL+crQQWJ3cry/A/gUPOwqme36KeTs+WQxwo0DFdNPvKv+dLRJaK+wJA4KER
	MxcmyrdK0NNrvYcWZYni2nulawrCwJweprtEMgVkCeKNvrpCWVnXddnnGnY3s8OrmakuMlDuKv/
	qP/qnynjsC7npZn3dcfvJaDFecVkgIKAm6yDBeSyHb0kpLklDS0P8M3g+bvA==
X-Received: by 2002:a05:6a00:4f87:b0:881:1fb6:a81 with SMTP id d2e1a72fcca58-897c3ff538amr1154989b3a.3.1791540239803;
        Fri, 09 Oct 2026 03:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f87:b0:881:1fb6:a81 with SMTP id
 d2e1a72fcca58-897c3ff538amr1154954b3a.3.1791540239339; Fri, 09 Oct 2026
 03:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
In-Reply-To: <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:03:46 +0200
X-Gm-Features: AclHuK9hQAW8ziR1wvAdOw0nLveraf3a0x0LG_1OOR8LPyJDyZu5bXvxmgGRPSA
Message-ID: <CAPx+jO-wb6NLYjnn_k7xu=Wqq61+vop9o7UM=5Y47U-WiGFXBg@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] pmdomain: st: ux500: Implement ux500 power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.li@oss.nxp.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8bc10 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=MPZ65LRjT8IzFkvHGtsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfX0ulKQpI4KLub
 e656xQy4hzMV/i6hzxFXOGyB+CHdCJnf1tevh60A0WBjwtQQbiefP1CAhpvOcYU5fHKuwP9ju1j
 fmBQc2u3mBEKEkQvmXwB1T0YnHTzW0c=
X-Proofpoint-GUID: o30wwMx3zrh9UEa4x8HSOuXJNcaWhBIa
X-Proofpoint-ORIG-GUID: o30wwMx3zrh9UEa4x8HSOuXJNcaWhBIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfX8uh6j+pWQS2u
 YlIG9IMqNxH04AsqI+Flc8OIuRxN4qpNco6ixR/kr5dLmONh8LN58h5Q67aBtWo9KYOUSwAo0JL
 QMKP6EmI1ryZzM4pyW8gdXKpeSZBTG8miQrSZP5g+l7RXfkG3+SBqCUobThMdUZrAY3Ofa2Y8by
 K/xfIrlM3+A3s00QKBfFd8IwnwSpA3rfEHnaSJz3Z0k8tJqXXvhrT3OBCPH7+R+UghN1OSqpnA7
 qsfvRvbTvFO0YnmnvnR6L0VXpTjyc6Ci+t1a7u16EAALkp7g6IyhGpfdwuaQfLGT1HrzD0wnvhM
 Cjf6zZbxcdFq8OZvexJLmaJgK3EdHs9WN0Bu9wZ/+7xgEq8CbU0Xo/tUDnabivzZQOuZC/nbgcT
 ri702tjZt5i5gNnfp1yz9So0llHC26yIkWIowfT1hriQwHa6MbH4Oo9jvaAcWopVfOuAEGFH0Sc
 zTURWCzy9WBOXx2JQIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_110405_065775_10898A0E 
X-CRM114-Status: GOOD (  26.67  )
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

On Tue, Oct 6, 2026 at 12:30=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Ulf,
>
> On Mon, Sep 21, 2026 at 12:48=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
>
> > This series pays off technical debt from the beginning of the device
> > tree for ARM initiative in the early 2010s.
>
> I have so many fixes series that need to land for v7.4 that this is
> mostly targeted at v7.4 at this point.
>
> However:
>
> > Linus Walleij (18):
> >       dt-bindings: power: Convert Ux500 PM domains to schema
> >       dt-bindings: arm: ux500: Drop NR_DOMAINS
> >       dt-bindings: arm: Add the actual power domains on U8500
>
> What do you think about applying these three patches to the
> PM domain tree as a starter for v7.4 if it's not too late?

Assuming we get an rc7 on Monday, it's still okay for me.

Although, please re-submit these three separately in a v4 to address
the comment on patch1 from Krzysztof, then I can apply them.

>
> They are reviewed by binding maintainers and should be
> uncontroversial and will make it possible to avoid trouble when
> merging more stuff later.

See above, I think you missed the comment from Krzysztof.

>
> Yours,
> Linus Walleij

Kind regards
Uffe

