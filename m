Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEWtdTAHqA8hd6AGc7LBd9M+QPf+f5oKuJGFwhYdbIM=; b=fMvoQ6R9OCLGgHd3PxfqJXAUrX
	K/P+8QzznRjD6xUlsPYloke+Lmn2gfHstbDr1lfUNNw93O1AjpDR9K5FEPlk/CkYZU+6ujfM/SK6P
	FpQGR5XTZNx6B49ZH54No1fYFc5YFnuX6wk3tnQoFDFB8Rmq0R+TvXngOmElgk/5orhZ9C2b06k6Y
	lPXN8ffAuALv9nro5SYe98bvuGq9tqHW3er58shNSIeQVJDGqYptuum+1EFLY8NK5GNNWb/fYOEAS
	/3O3oMAw42j5v8fSJfgM7i2lLbH6JOuX7Kvq3/ZKet1YsAYIt5KwSvyCRAKTJR7rexzS0qidExt/+
	LBVELYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepfi-00000000wlt-3yLa;
	Wed, 01 Jul 2026 07:47:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepfg-00000000wku-0FPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:47:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYls025790
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEWtdTAHqA8hd6AGc7LBd9M+QPf+f5oKuJGFwhYdbIM=; b=WY2RJu67VLHvQJ32
	1OKJlZNJIXAJByudwZGbrQA9uRqrVfY/ixF77iI5yzwHe+hZBxp6KvNFcezUD24P
	PEvh54vbLG4Hegu9YXgz9DwuBxjAfz/Gpesnd2/UgmZc3kG768ZU+xyK5wjti5e9
	qavcXa6+3jBA+ZWUmFO0GxjlSfnl+HzYPgSFfdECy/A/P2KbtTdOCDL1LhPDVVeB
	rnf82+KAtN/ztk0Db+esChQG0Pm0WJX5o+dYEexsbZCYm+6RsySEC/W3NsrDz/Ux
	JFNknuOMWBn4e+0SebBjqK9NxtbhImI8oCFmyZMHA4q+lvbyykjW9gNB685Ddrh4
	VkCH8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd3hsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:47:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so46082485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892066; x=1783496866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEWtdTAHqA8hd6AGc7LBd9M+QPf+f5oKuJGFwhYdbIM=;
        b=JFgYFNcbAdabxIdNYDeuz0i13mt8iux9t+ctA+XLnvOHnaaCzFi0k/k3ZmIWUcpVYd
         QfadF5a51PKrWlW2Pt+p0nC4w7PYCQs7lPoMazMgZq71IHWViQl84XDQcEbJwbzABzi0
         RFLL94vMeC7Ft7lARcNKoerQhZ83rA90sHO1Y79cjFtOlsr77TMsvMjy+jK5b8sWourC
         QNKB5gotTz9t48z1Q/Uk/q+Tb704pGrcCo+WOX70hNzNWAVwVRStsLdLFFYvvgYoL7Y+
         /KPW92+TK1PSyAVrTI2S6mIiN2enNRAIORf2yiXVJDITwTDEBqOYjZT316StA1rJBDQ1
         KLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892066; x=1783496866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEWtdTAHqA8hd6AGc7LBd9M+QPf+f5oKuJGFwhYdbIM=;
        b=gBfiKghi3zysZMsDfY/z9e0E1j5yZV2tXL07akMP7s7TN6SyTtdzK3F4WBoScNeaB8
         pEuPzuqeJ/5ld/MxBho13KqE4nvP2HigY6FVElwxfu5+LKYZuTRAaKnGfJePxAM4Rg17
         9766pSA5iqLZMlfbGxPSGzRy87cgxIlOCmbeQ/Opq1fOBtYJFev3Z65W/WfV/fYTxPZB
         Rp9HjL6U3r/MiKswr9CpR+6ZOkRFf4ywLyXc603+iYEkXZbvWKr4mmfs6BskuzYJa8e/
         IdHjdn0DnDFwXKwggD92Gx3aA6AaRrPdFPBM5PjK9FkCCxxq8Ic8UHdMhj/2aesg+qOh
         R1kg==
X-Forwarded-Encrypted: i=1; AFNElJ94lwStDIqeOWb9YIUHc2f+ydF+JcFGj8l46zfxA99nHEAQUD6C8mk+gzUN8nF1w1Qr8xeOd2EUYvLnhCjminjK@lists.infradead.org
X-Gm-Message-State: AOJu0YwLeyLt0c/w6X+VOy29zFYDiIdQT2vqOgISDmdSucUAjmrH0WF9
	H7YemfyR6FMyK4bt6Eu6vHqWH0xfOYMUwX683Rig4svB0tlYtaJq37X17MJv1pyPRAZfBUqpF8t
	Cje0pzvkYF+NeLK2XzY5Xgzs/vtyafkHNel27oxrImCvOdpLelOp5OEH/NqOvi5BDw8jlolaZoX
	+peg==
X-Gm-Gg: AfdE7ck7D3LKpTipOwTlPfvUD7wiFkygrZ9Ln8A83J7lcZ/OG9z5OQsSXhQq7fvdypc
	ckAPYeYqZefPH7h0/UjCB/Y9DnRlISL02vTxx85Rjyh5ce3+iYuLqX27PSrePKdNw/7XN8vvUr+
	/wduTikMi53yLIbD3JI5I+DLUWPO8JXZp8RDNNzMxjwY4g2FSy7Z6wEVC+t9LHU0mMsesha0h+k
	DZX1vRViVQ/Nx96fAUAN5QJEJinINQVvVvwY7N8S/MFHUABY1tSVqwub+SdBI3HX4Fif2CobzDc
	1JZjCj5mLMNEx6C88C5O1VaYRctX/YJY5yDulBSUpfAMGuOvKzp8aINOHEboH1ZS1anlPMUEC3r
	g1jLTmL3iHjxQ8YFepC4pF829HlBvY664Ab6jCaPtDHrKknA9F/o1lMOirDyPaQ==
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr78274785a.9.1782892066299;
        Wed, 01 Jul 2026 00:47:46 -0700 (PDT)
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr78272185a.9.1782892065821;
        Wed, 01 Jul 2026 00:47:45 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be82fd71sm77510895e9.15.2026.07.01.00.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:47:42 -0700 (PDT)
Message-ID: <0d210cc9-5565-47e9-904f-3e8dbd910d6f@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] vdso/gettimeofday: Validate system call existence
 for time() and gettimeofday()
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
 <20260630-vdso-compat_32bit_time-v2-2-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-2-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX+gRk1nojOxbk
 o3SjcJAx2hIBed4dNynXwxJc9T54M3oUG9NNJVpfBxcBGmyKbMHeiR6CDVxe64uYie3CtWZHGrC
 Bz97sEotkkpwwOm9oUwLJpuVQC0wVyA=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44c623 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nV7M3V7dV4ZlPVs255YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4Q8PydBSAFzDsfvs14Jebgkf2LDEOlEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX01zHVPPfWj2b
 0UGyRFr4rNYPpwpIlFdSsNGVudIFVP5ndRxwmCWDPo1yjP37nzcA7eAMls6yKWTrB0Hp866oFcA
 pVNNDG4j6uFqWHht3WWpBdnXkCRdmWpuJYYih5z2cCu88ljXGIU4qmkkgcy3uKoEpmQIRZgLrRj
 CGVbN7tOwT7b3a4ygFOl4tIAM/2bQmBPSvW960eK/nw8r+hKvam74AUoPMklnZ8iDezuQim2df9
 PCrc5P6V+DXfCtQ2eqRwGf9Sk6gPJ7OmJNGLefMhzTARbn7NzaUNmbF7lxHsh/mvzac+wSI5R4B
 p2zujO1eslKXB3ji+vqc2mrdO8R6/Mhf/k365VOmx6x4+/ghKtGy2mQ68cZXm2SyG4wnMwje4Ln
 KwfYxVgRcVdDHZHDh9F0u/zLcxJitZOqTUumAZIp1A8/f2FYzMvN/J+sTMNiyZJpwaxCQ0kcVzd
 fCvzdPHneQtyfnZl/pQ==
X-Proofpoint-GUID: 4Q8PydBSAFzDsfvs14Jebgkf2LDEOlEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_004748_140424_C7048F0A 
X-CRM114-Status: GOOD (  14.88  )
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
> Not all architectures have the system calls for time() and
> gettimeofday(). When the system call is missing, the vDSO function
> should also not be present.
> 
> Validate that.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   lib/vdso/gettimeofday.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

