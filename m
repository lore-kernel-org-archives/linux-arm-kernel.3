Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD99BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYveWjJ4hVAN65iKCtlqZBVIi/BG1r0MlKjEfqsoNak=; b=jks5XnQ1Xsa71ryBClpFVsVQOT
	khDKRooabp+MNR8yDWroq3mqSnoJlOmA2hO8RZyScyPViojXY3AWRDhRYrufAbHtt1NdvTxtPEKyF
	YsuSs4ajQ1vu+3SrNxVaHGP2V2lipfYMg8G/V8SE487GO81rNG0btYqdjDeYsndRk+qoizQctBIK5
	cr+bHLmYTJMRIVoLjSN4oyXMtw8CcVBDAkfN+a+BBTjndW2Kgwv7zLQM2ojMqo8kZrvW0L6TRjD8G
	CtHarGf/dvxVPegzTC9srJAh7RRfKD8Lfboj1LjRUuTgpTSn8E9yzr4yp2mXhx9ZVTedbhzoGbK3l
	uZOgSemA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGM4-00000004QJr-3Pz6;
	Thu, 02 Jul 2026 12:17:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGM2-00000004QJT-3W1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:17:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662BoPFE360479
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 12:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hYveWjJ4hVAN65iKCtlqZBVI
	i/BG1r0MlKjEfqsoNak=; b=Rz/7XvwaNshea5Y4k2hhMHtM4e5Y9cM4D2R3cmPb
	FfmtptdugPGus/I/vyxnCV21VWya93TlCTd6l4ws7+T/oElFTci0J6zrlnY5ZTQg
	wltlTuDmuZ/Oeg+bhSn6SrP3yrUD3gD1wnBRFduhILtZjZ/Nq29ZvVyZBDHdgRjp
	BQtypZw/F2o1na2gGd76T9ZbeIt2qmXQOsp/HuAsy79cUmdzxkOTYMZdXUilR2WP
	USGkWo2xE4oEfHAJlxn7AAMKzrb9ufCUZQzn4Ne7YW0uiQN54GMUTrZbstixPmgX
	VuorAHNqKut7WKX7cjhJBpvYnBc4lVgMNgpW6LIR5Ozv7Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc03nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:17:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so3351346a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994637; x=1783599437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYveWjJ4hVAN65iKCtlqZBVIi/BG1r0MlKjEfqsoNak=;
        b=VtQjlz4xJKRgfuMQygCo/y63vPlvNRsVIl0hWWqkxVjIhcrj4YUJHfh0N8XfgrqFv8
         2TOenn0eOvxzXUVaHC5Vse4DYrdUDqKmIJOpBjfTfJbEtx9qbbUeow6qUZPzoecDs2i/
         82Q85r6d7/9d5gHRNWZTzaCErGn/YCVwfA85R/v2ZuKebYECtwsRkIQxHsN/2Ko33spu
         iZ0lfRWCJtExTLBLzMU4v2kBIl7EeY2F//zBgLqceE/6IbdFsKCXQG3f+4HkQeaJh69j
         kOxdEebvqYSdZvyEER/y7ZywVxrS3NMiIWnWmhXthJ36uJXY6GVqt+Lz0jx8OibwSomS
         mQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994637; x=1783599437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYveWjJ4hVAN65iKCtlqZBVIi/BG1r0MlKjEfqsoNak=;
        b=Oqyulsop4SY5ICSSbpXJUc/VJn2Xfd9VzL4vVQEiLVLa5wjrMsTBnegY1bmb3i4Xx5
         TVujYRoN55RcSd4Bue4YW1S5H8IFggG9cb/Z5jCbDFtmxnurYf6iaEbStwll1+ZgGBZ7
         ZP5jUXlDyxtID7uxg4NY23O5lolOkxJYcRoEDdURm86z4LGmKZuYp4EdThEJdvSrA1GB
         vIrpg0KpO9VtlpbFMT8/40JupTjGwnlQ4K+rxN0Fbk+RSKtAoDVYzM/ESSFCpxI9EcKq
         LNjrusC5RdAry7dcvkSdUJVFewDRj5Rcvq6/N80yV0HcqOtrcAfF9Fp9aG5AP6IzRBTm
         fxGg==
X-Forwarded-Encrypted: i=1; AFNElJ90zWkWTbaVJH7fHfK+VkEW+bJ24I4QIxODA0XlxV33lxye+J+Dq94l1IBfWHge6rfCzIWFGh0z2FmtPMsiaOhQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyqmTGTtKORY9NUr6yvB/gAY4n5pX3kbyGF/oxv+Ok/9elScynP
	fHPYjS/sHEJJg9YsLgQHLq6F8IKSL5jYIJPC/n0jTlLIXV9/qFXkfIqAneMixT56R8QtkBBJe3f
	z3MDIP67Nw2Ysayirww1S2l+j1i7eCTLx/20cbEtOH2kyLzwqindyKuIEKYelr0soRDi5woDEw3
	gt7g==
X-Gm-Gg: AfdE7cnmZc77QcphkWzZ/7ZPO/0gi6gTEi2oVCgaCOUQMWKYZ+QEbxZ28RyQ6Ry9saE
	t3qkRVRSzJH7gK4Xwes9HcOVKx0vs9HkFZ5TxTltjhRIy+t+nnrY1f9pYnX9N8KaxdjUOxWT9gF
	tF+ezl/H4fO9Xvpcqvn18/KaCQKWln94sN5Cl7R1BEps5jjkfByBijWKxN3WIqBAxu/iFmz8jdl
	jYm1IXFfiXuvd8Vu+drpG0AoaZOo1rTXrD6vHfO/gZzPs+g5zD19ZnCKJFbk9e9VlNhJer/+KOL
	AvDHrFh8r6t+TkGEGwpf2c8VG3aOPsrfAUdiNWh29l59Rcd559g9dIkpwN+Fd6En69eJ5wzmvNm
	GUdkMqIA6Z7NO6IcvhkqlyL870RNe2ewPi5WawHoWnnb3z+zBmnIVkEwjOKMk
X-Received: by 2002:a05:6a00:4488:b0:847:9c99:ea4f with SMTP id d2e1a72fcca58-847c510599emr5298456b3a.30.1782994637193;
        Thu, 02 Jul 2026 05:17:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4488:b0:847:9c99:ea4f with SMTP id d2e1a72fcca58-847c510599emr5298433b3a.30.1782994636709;
        Thu, 02 Jul 2026 05:17:16 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9f4c67sm1282608b3a.59.2026.07.02.05.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:17:16 -0700 (PDT)
Date: Thu, 2 Jul 2026 05:17:13 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
        tony.luck@intel.com, guohanjun@huawei.com, mchehab@kernel.org,
        xueshuai@linux.alibaba.com, tongtiangen@huawei.com,
        james.morse@arm.com, robin.murphy@arm.com, andreyknvl@gmail.com,
        dvyukov@google.com, vincenzo.frascino@arm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, ryabinin.a.a@gmail.com, glider@google.com,
        christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
        naveen.n.rao@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH v15 0/8] arm64: add ARCH_HAS_COPY_MC support
Message-ID: <akZWyYnAdnvlkZbi@hu-ashoraj-lv.qualcomm.com>
References: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: yc-f9FlzTzgadxgxXYKtnT0MebwH-yiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX7wO06x7LBeBB
 Lrd0bI/3eEbV+oRycFe2hXefMPooeCrzt+rjyRS0g8ZJTRap7K2haddKSocTiz/6rkgTH0uSXXv
 F1CVKCg2j9STpjfXEIV0Wqp8SGpBdQhl41XN18Ude4ORj7kXY2vIaYU2ql5kXMyFhuxm0fES+7P
 ynO60cpLjJ+8XNuB+PAjZxYizrFRbDQtd5aCk7TO7JemG4nCJNwVMJ3id1PoOlx9gY0ai9Cq0LB
 TsAfNDYsJyRNvUf+Ohr8XnMjifgQ6sdV6dKJ/I7NM5Z1y/kqDl4vy1K1aJYO16taTZwrof2bnCj
 cFY8rmWVw70pLgqCpXtMsOv3NcphHlS714hzmqkv1t+OrFzXtrUPMF1DTbfJRN7UzuQngu+S8t+
 PwPloyPtEh0bzoWRP6gQUog8jWDBV0lgC71kzjUvZQycaqh0hJ8fEaDVcNmgr72hjWllWD0Bncn
 jG5g7Hv9+C9EuMDXuKA==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a4656cd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=efi387GsBp53Kk3SMt4A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: yc-f9FlzTzgadxgxXYKtnT0MebwH-yiO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX0b2gp9/5xoip
 TyX5JAtSF94ymiSnVQiVaRoYhHeKKTaZ0vcGPMONMEcio7JSDAOAnQr9lKWpoDwmMVt/oMcL0yo
 KB+opqhuLWhzk1CQPkKpJWZCDqu5Byk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_051718_885438_15C134EB 
X-CRM114-Status: GOOD (  14.09  )
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

On Thu, Jun 18, 2026 at 05:21:14PM +0800, Ruidong Tian wrote:
> This series continues Tong Tiangen's work on arm64 ARCH_HAS_COPY_MC
> support. We encounter the same problem, and from a forward-looking
> perspective, large-memory ARM machines will suffer more from this class
> of issues, which motivates us to push this feature upstream.
> 
> Problem
> =========
> With the increase of memory capacity and density, the probability of memory
> error also increases. The increasing size and density of server RAM in data
> centers and clouds have shown increased uncorrectable memory errors.
> 
> Currently, more and more scenarios that can tolerate memory errors, such as
> COW[1,2,8,9], KSM copy[3], coredump copy[4], khugepaged[5,6], uaccess copy[7],
> page migration[10,11], etc.
> 

Hi Ruidong,


just a minor editorial nit :-)

> [PATCH v15 0/8] arm64: add ARCH_HAS_COPY_MC support

the series has 9 patches, but Subject says 0/8.

Cheers,
Ashok

