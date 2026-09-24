Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7389CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=; b=Dr4juC5Kv75heERGsoQ3crPdJ9
	1hZZyWNw2NbqbAW95usANdsElmSduulqLdxqEyiJeuX5ytQ/NPZJsF5MbFmNJxl9e50hNMiT6p1ZA
	t6gLyjGPq1QDmp2hnnzCf7Em7y069CcBR8dwD2XoQUCA2oasA9yCvpSQ1vodlIydHSi6WXyObr0Jv
	BdTpvR6mtX0ukRVzv3jPctqErTX8TpaRRg5L2bntcBcc4GEXssutmzji80A2knlhPDNMjDv8s/K/Y
	ar5iERRkYrJcie9SruIJzjB6pnzNi0Vir/58rGQ5slaUC5OCwMOu4WG++/Ua27xdk1CwXONBvwIw/
	Dg/sue3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hT5-0000000Aq69-1P4m;
	Thu, 24 Sep 2026 11:18:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hT2-0000000Aq5f-1HO1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:18:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3QvP2483782
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=; b=TbTUhYObl5ybPmO7
	9By5S/eHO/yhPRBHy4RpBD5l0jePTuqcfJleu600nLB2HYF4p8cDTvqbcteqy9kq
	P7oWDRAVMzp04OTB2tPZlNhwqGYKXlKBy5kjOlz3kchPs3WuxTB78OKYltLh+Nds
	3h1YksK3QiT6+G+GdFwVrRGTL+lHXG+A8ZTJH7X8WsfCmNaA+jsajQpHKQKZZsdc
	Zv1hlM9Xtvd7gaXLeeAtKDCzcxXTX/d5Qjs+smijCvm6b0Nd6QdYjXQffGVF1pxz
	KKl9xZszA0NvJ/yAfgrq2KQcqSzMOgOo7x9TJHlLEHLSI+8On8nHFKUmvuy6CKJO
	1XLGHA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90903-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:18:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8696b921ac0so1556652b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790248698; cv=none;
        d=google.com; s=arc-20260327;
        b=FkDJPPc8Qh5qhBZ+Ifa9SCflPxhk88ztXBmoHNUJkx4uM5SIPvNc7CrhxxrcuGllN6
         JOA4tkNi+52JcoPMGDXzX7hl+bd0auYjd929QwPTrNakdiRk9sKwUCGjySKfoo8iRwHQ
         uLAc3zszTT+lxBJaXAYYmDbOJzkzTzX1BvIjfTWHvSWDPm4B9gISDI1tUYYstRLnV3Vy
         6BE/ILy7Crxnm3jahAuZBlO8dzddct6reuX6WRP2tV1Ptey5stZ3nRHK5Kk+4YTrjH7K
         rb8txGTSa2rR/lDSShzmIW7LLrnuT2LqZaNe1Mvisi14PTwgPk5Y3Z65GceYBSIrg/z+
         1DIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=;
        fh=/WfIqOeeADsAt0m1CpZOJLIOjAXNIERYvmeva6WzEyY=;
        b=nOr4FNndkpLgM9UItaG6TbYMBRJ8IrThSfMHy01m/jYvmYLLKweSos1nD4YHLo+4zJ
         CD9kgzR2piS1CRZIMyT8jaMWzCX/isHlv7PqthDvHUPhmTLoF7ifhxWBulExm9pNZF26
         LNrc17OwdOpoLgrNDTc25ucLP31HIoS1YRvvnJXEdvWMq6SE4fFFRpPpT7Smd5E+B0cj
         k7nhzQupma5FwwdVuCDZ3a3VVtw/x1bDDgY5xH3M84ywXW9ZRIXyLzxspnStiGFJtbMN
         L5lbBcSQ8TWltICLCDf939dYFAfyyxqT7IoLkqheGkNKAjiemZCewqzLpdOjO/skuVQl
         sn3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790248698; x=1790853498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=;
        b=RHCzHRd80bQ/TUJmaOKccIFhxbObNvIETzxew5tztyuEheeb3ER0GlkSgsLWtXiq56
         A1X0hW6Oy+wIhH+bFvlMaVto6WRwdS5nb7QpaqcU8AlJgRJCaIBH6U3NJwhuK4h9BAdV
         sgw+xyxfa+DuQT49e74k/J+kICYOkHpGuc3JN9oExPIbr/nV8WI1gZPnyoKEGKrm9InV
         b1zIKpuBYA92MXcq7UdrRtY/5NKxeNTuRiOoMlcFhlBx4TLxlK+oBRaG1Eu7Ob0bEq+z
         9b4qRKDwPfQBxE2OOQ75nU8nZpKcJvF6PKox9b6+XtHfkNtqGtz8jgTxkd7T08HUqjkP
         Zc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248698; x=1790853498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoGEOFWfy6+z3llqYdSXWY/bWsrgXF1kF020We0iW0M=;
        b=gGXxdIIQxDVTMr9L4Qbapsx5IEQFfVH2JuCbf1Kw3iochnGUBbTlfk7Y0c5VsAbSHB
         uvLkOpSul9niNnPo8bbfpqllttjGdEHiJKkkbZSa/UxHvAaLF0BmFfVr9BZ9OgkZDHKD
         O45MmKNccnEOlZct3XzD1OG83Zx+HAx/U3JVVFNMPX81DEioFGLDuO/VZsnw48JFrXoa
         6WnjiHu8ivCBhfdsE1HEqy7664GepnhmGJlbkNPsxfzYq8dSWIYJ4VQRwXZwYDHd2bOu
         tCMWZir7RtQz8qOVHi/qFBGI2MJEmoxgHwoLYxDEZoHe1DMvaY2PQUBqIkwUvMYDess9
         7U4A==
X-Forwarded-Encrypted: i=1; AKwUvBybDvjcA7nmtFauQkEW+bAJcdYe85ZlBT9APHmRYYzP5Anau3fgjL9+/SknVILDfG9xnPw5Mx7Lq4HXTzbihmgW@lists.infradead.org
X-Gm-Message-State: AFuF++lroVXRHR6vnOSwEi72GepyF1wPZ2u5T+Ea0oVLPOuiaz8Q5K7G
	4MNHda74uDxo5zakxeivh+FZa2m+wmaZpHsjppZQL1E2i3Hy6McLzvyAuU3QWSe+U3Xykkh/NXJ
	HWoSfl/baJPTIPU+jWF2tMrsLpCqZ6VcHlGjETXFyOvm1I7wcg3IrGXQBGHQ66L2Nthf5UxmKiW
	jn6F6ks8aSpCDQD2FXlI8qBoigAaora9a3CPJspgkzK32xrkfyR7i2
X-Gm-Gg: AYBFou02iUDADqRNV0hPAzlu051ZY3bHzcOaGqCk9y8zTTDuYGxmaLyrB40gD7PSDJs
	4BqwZIeWXmCLG6byu6lDuey4hxqWnfp3iokmBa3rzab9oOL3LHcHWRXw4vY4TL3+z08EhvecRFP
	0ejEaHapV+4rLNWomgL4ZbUiyOJUuJX82bfZ0p7Yg08xZpxzAyeLVpjlbOKw==
X-Received: by 2002:a05:6a00:23c9:b0:878:3830:a489 with SMTP id d2e1a72fcca58-87e9fd15ad3mr1979690b3a.57.1790248697923;
        Thu, 24 Sep 2026 04:18:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c9:b0:878:3830:a489 with SMTP id
 d2e1a72fcca58-87e9fd15ad3mr1979654b3a.57.1790248697236; Thu, 24 Sep 2026
 04:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com> <aa9f1765-ca8c-445e-96bb-4c768ad55623@lunn.ch>
In-Reply-To: <aa9f1765-ca8c-445e-96bb-4c768ad55623@lunn.ch>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 19:18:04 +0800
X-Gm-Features: AclHuK-44EH4bNDTkJMwrnDWVzEi_hMaghscBr7mHEKsm2sHbLj2Ihaq7X1e6I8
Message-ID: <CAFkd8huag=oW=jz6qPeu9JfqAWc24b8DeT5veRVvS_nqMuFjNw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Nord ethernet followup
To: Andrew Lunn <andrew@lunn.ch>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfX8KihO8/gS9AM
 eO1dU0idjkbavwkhr5S29bZXlvsxg0Wk3SreFUDzWcIqPoNoZZrtJsS+0ZgJwjKYQOAFuA+LvzW
 YpUMtRmAG4rHsvORcnFxo3R26n6Xu5vQnNSdyYcUZDheqK7ZrxZGbwAFieV3vVcmZM+PVb+gESf
 DegOoa2Xj690io1uQpayroROr6Q147J5B4JwToWK+/dQkZg1KFRkY4OH5PRHVejGhy5674N/w/Z
 cHXKN0NIobccMt2Gv6TVeGJOQrSep636RJOVkHkYLns5Q59cp4YE+kQMLNDs1hZjqowQhS4FiP0
 OPCw+bVM5NrgQkycOBlo3LE3fpwc7rJusjpTl1mROKytZV/2lNDD/EzB2nqf8ini5+Vhp8tnxRC
 CAE9AqGEKxB/OSYn6hnAhU7/dIgnFdYh1QeFVKzYsUijjyBdWsEFFBdOnMy18mZMpToN2GBy62k
 sqSW0h8APYU3bwEtwAg==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab506fa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=DPsbyGdE-c6e5f9Z3pwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfX5lQz5eB7twE6
 yelkoCCjuw2hJvQexPkbRN6E4hEPiOPMPEfh6CpbXGUXDmGyhkVekDk4we2kb5uy42km4uqBClb
 047LQfJ3Y3JYgKp6mXuOxfderrvSn9w=
X-Proofpoint-ORIG-GUID: SdMu5gHGTCP3lgbFNOp8rMq9X9F1x5WD
X-Proofpoint-GUID: SdMu5gHGTCP3lgbFNOp8rMq9X9F1x5WD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_041820_460862_D89554CF 
X-CRM114-Status: GOOD (  17.92  )
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

On Wed, Sep 23, 2026 at 8:50=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Sep 23, 2026 at 04:49:18PM +0800, Zhangfei Gao wrote:
> > This series verifies Mohd Ayaan Anwar's patch set:
> >
> >   net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing [=
1]
> >
> > Tested on both IQ10 RRD and Ride
> >
> > The full test branch is available at:
> >
> >   https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
> >
> >
> > [1] https://lore.kernel.org/linux-arm-msm/?q=3Dqcom_xpcs_nord_emac
>
> Please don't submit two overlapping patches for the same driver. Wait
> for the first patchset to get merged, and then submit a follow up
> series.

Thanks Andrew

Understood, my apologies.

  I will not submit an overlapping series. Hopefully, some of the fixes
  identified while reviewing and testing the RFC can be incorporated
  into the existing series.

>
> Qualcomm has a number of Mainline Linux mentors. Please talk with
> them, because these two patch series are not great.

OK, Thanks

>
>     Andrew
>
> ---
> pw-bot: cr

