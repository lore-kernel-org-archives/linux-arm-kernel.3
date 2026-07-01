Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=; b=rtuefJlH79/OpNDJZI6zbG/IYC
	LHJWVQfpQth7yDQLxFEYqmRudLHBVyET3mnkvjsKfvxYjok2QxTpNrYIT8zUBT9oLOqjT/UkS8OpN
	2WvtuRrtSQ71/FUs8LSTwXiRwn8q4STkZpusuSd5gZ2igsTrC6MUrYK7FRsURUG4Y0TitBxpclTNH
	bJLXXnlvrYOeFYqBzXDQAWt1qk+BGM+q2l9g6AtKOmjU70fxkaAR3CoFZMWPJr9sR25QM5usiyR7S
	AI7hz51+jJ+de7br1MIX/2wIhHOFhwdUDAGs8vN/rdskTT5nmMCYuzGeitYe1NRGDRghbRWDATRhp
	mT0CET7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wephX-00000000x1D-1gCW;
	Wed, 01 Jul 2026 07:49:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wephU-00000000x0N-39Ll
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:49:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lY6b059325
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=; b=Cj9hPbcbpWbTK+tF
	PIcK3PBPMaXTUuCv/sDEIZo5Y0/0nqsviQe1Sa2GXh1P431Pj3fnTpSPlaXTeDwn
	TejVsKuSbEwrL/m/AnaWDqhBuceZkeHF0ZsVBuk9HfOe8gugsp87HitC4zRCFssi
	k6ElK05VWfaFfa4ppKG4OagIrOqSKu1qzdm2FACtXswaGGtn3D+wovGnFISOY7GX
	OMvVD6rpHgm0xjYIk5hYyHMTHswLl1ybVHT0kDKMfw8cMtPhTll65hQ48rMgVW19
	6WCyma+Z3Xe8amIkZHwcyG4+oRHAwiriPfz76n406OSuMECtU/mf/hi9TS+eXug3
	o6S6LA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjxc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:49:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso23247271cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892179; x=1783496979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=;
        b=YGy00K3XKusBmnqb0SNP/EzXT4Gb3iYy8F9TyezVEMNgoy+oEUGvpnVzDP+c9kti7P
         odc6pGGvzXJhfzZq5V9j9vzLAp0lxFLCJ2iAYBYpk1pgq9Z7xJW59AYhgSmX9l0EAfFr
         DimN8JZoX7iFNbXsqm8ddbFpgs6xrSBKSev+r1MjWBRyDtx+cmx1bkc34VtFir5NRaq3
         BmMYmceRJ3qIhsgvZKZMBvGL7eKS79xLNHUoKXMVqPo5eX5o24b75Ye8Ksivh4kcyfG4
         lbQFEoxKUusBm3LoTqm+esB7wPSa6WD4IJi5ieUKLsjJtZikh5Wfvjttq0s3zdDmkJRJ
         93ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892179; x=1783496979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=;
        b=nk5GNC+k6AswMhY00g5gHSzG+CUujKpIvPKop0wzA3H5o5oe44rr3SIwsQmTW9qNLG
         JK4jj4zHQqb1rKdPGJqOP58fl/z7KxXEYYjUuZnrb7GTutw9cB6zqywsL2jgVlkGEoFv
         psA3OlQnVd9/dXvc/U1veZUIzIJQ+L4SZjdbZevq9y0bXT7pn7WWcxXWo+Ajz7ETawY6
         Q+LCaUJ9oBBiJ3H1749gZpEnmT6v+41NB0XOAkjwR8fFMLKKFC2QEown5/P2W/Fp43Zx
         Qbc+SJA/n4QLAxiVTUAAYr1lXwC3TDO8DSKIdQkxkRdZ42jDRgk9eyV4sjFiwC2Q41AL
         9xOA==
X-Forwarded-Encrypted: i=1; AFNElJ+eNjJu1f/wlODv0gVPQRGh8CYJBR/Nf1RVPBdo6mZs155FaMxyEofKh008XHSjvl/e6IoIid8pFQ9zWtXwCB5u@lists.infradead.org
X-Gm-Message-State: AOJu0YzKwA5HOtKcLmw+CyjmclqNlU4lO2mqEZ37uY2sSqHJxrj7waY6
	trrvilnUre9YbUouU2JveMXIZ4asN832fXVs3DjuFYPYlBCY9JSZ+nZ9JYroN5apnkZg5OVrXH9
	vee4cTmk1QhJuCOK8VGSwM4m62hRSCEgKNNaxwR/vTCHregGeS7DwITkEo06MlswwXlQZVOnRM5
	PGyVuVvp9KBw==
X-Gm-Gg: AfdE7clSX+1lXvl3yUMI9aj+GSbDeIVoqCGG9Dn8cPFpmR7n2KWZxbhwgE/7hotzpgs
	or5D/eruiJQrWzZYKIq0sqHJ9DFp65/toQopojQv3mm/B0OCfMmTWwtTaCWROBzGgxdcZzoyppm
	NCnCRAX86BHkqfA10cK7KnDyJICkYR9QEyi7o/ZVUbKD75J40GGQjCi6cmzuVxUjxk5vKX8uzfn
	/B//vkYxdcgNr69hGhVQEHoLSVFJVnbF9TzWKxK7jevpDkYKCuws2LVLeTGlQp9/wxx1IQQoU3w
	8Gh+gL+L89EWNjGVK4leo24LNhtjDI4SJe9aCk1zGyRCrNGRpmlQejV0M01JNlonQXlwirSgtp0
	2MPt5FNKJr61J471DXZYkKfqk/hFxIWdOR2YYATucBRtdou+WEvp9KXFICoG28w==
X-Received: by 2002:a05:622a:4292:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51c17e8f1ecmr60558981cf.20.1782892179096;
        Wed, 01 Jul 2026 00:49:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4292:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51c17e8f1ecmr60558621cf.20.1782892178662;
        Wed, 01 Jul 2026 00:49:38 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194bbsm13031759f8f.3.2026.07.01.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:49:37 -0700 (PDT)
Message-ID: <4eb126f4-f9c8-471e-94f1-ff40675dbe73@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] ARM: VDSO: Respect COMPAT_32BIT_TIME
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org,
        sparclinux@vger.kernel.org
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
 <20260630-vdso-compat_32bit_time-v2-5-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-5-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 31Q0dbymeAjwvByXsXBFVYX40JyKrzpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX2CCc/o2TbIkE
 cHuHeRGnz67x1xn0slibd8AN6H50SluVN6meg5jU5EuNUaAxpJYwxNBxyD43ycXVIWfx4qnoyQ7
 62Jf/VXoSvG5ys0fbnksnHGbLRHykp22LCEmHnKAvpjGvdmh5Y09gPqBn44XiyL9/W5ODNBk9x3
 R3WAlfZT1JDfv9OMbjOOl/MvgwQP1ONxPII6Drd+6PgS3/dI0L6vD7D1cyp0QyKYq9Cwj6apzSp
 ier4is6PdgWEFq1THhVCgb6iMUnPig6VO3RhYcBWum7+EFjg5MiefLVNaVszSqDzhbiFJXonb4E
 zuEGgXkFRnczk13UhgySuiMohg8jWqmkqmMQdvlKOQlxXqYVcK6TUCCq3zcbbCqmXLCjpanhJKE
 40buQsM/4vWCDJnRyTak+hMwaZEOHlskt6f66GqFvvlNlBj/j1ItQWIWmBkKQnTnfis7XtKsyNc
 bTUJejI4Z6QHC/3GEJA==
X-Proofpoint-ORIG-GUID: 31Q0dbymeAjwvByXsXBFVYX40JyKrzpV
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44c694 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX5wsDwlP9r+bo
 J5KXI6YM6nbANzp5t9TBXbjIAbcfqfcgSUOnBHQORQRBKVVISHc0tNeAVAk0GTXErOnoDZtNwtv
 oWlXMfHiSyL0TpU6+BNntwIFax+OuS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_004940_801647_06A9CE6D 
X-CRM114-Status: GOOD (  16.78  )
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

On 30/6/26 09:38, Thomas WeiÃschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality. This is the intended
> effect of the kconfig option and also the fallback system calls would
> also not be implemented.
> 
> Currently the kconfig option does not affect the gettimeofday() syscall,
> so also keep that in the vDSO.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/arm/vdso/vdso.lds.S      |  2 ++
>   arch/arm/vdso/vgettimeofday.c | 14 ++++++++------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

