Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioxIwjR0AL117kzFBXybF7cfhe6hx+h5iZJxh8s87XU=; b=Z20lm4TQnYF4YTOKRsWBUQu9pQ
	i7evEzFxX+6yY9ZH5Y6T5HwM2yTORLuVQFDyfYGQco7MyJZHgyM3qMuT74Iu8oiuB7aM+WkMU2r/R
	w30ngzF3E+m/DHc1zfX78ftDJgfKISBZa+ij0k7cdhxap5f+qwAGlQT6+xroXCmS2JiwXhAFzgHxN
	7VL2rZQrWnAKUoak0D1AFmI8VxtznOR+Lu32SNWlWLQlrqrfT3QcMMvR6S0dQyxpGyvNn1I4hbXA9
	54LY4mmbPnWLvCGxucT8MEITRQPk51PnfT4K55UoEXVBMmINfMsxRAHIqO6bFj5LqXWip0bP/CoMh
	whpEt3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wephL-00000000wy7-0eFH;
	Wed, 01 Jul 2026 07:49:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wephI-00000000wxk-0jgY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:49:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6616qZqr280056
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioxIwjR0AL117kzFBXybF7cfhe6hx+h5iZJxh8s87XU=; b=nXxgkaw2mzHJ/1IS
	1rf4VfEZDPDNc4qpaQP8bdnXeePd/fo2H05mnI25TgyeX6YBFWKYHAhIkZcTKDCC
	d8z7l8KKPmnhxxzUwNaEXJ9Ni5P1JIiI2aWruoIZMD+ZEsePMccKTIPdgDeDevFi
	yrs/DGuzA4yQhLp1OM0a6l8f2O/n6aTqDRZcXMoWxJSzzHj8gIYH5bFsGnn3QUSf
	at7oOMd7Z+9vF7IO2YV8r63ADuq3z+zUikqIeYEa7HXj/kakGmyZPINV16bfDemz
	u39XkDRnAIeOkZYiMLIiAuXKaX/w2/KYDjGdNnAu7Kcei2t1Uph3dxbbdVb4pxgh
	Dj6kfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tg9bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:49:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so35682585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892166; x=1783496966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ioxIwjR0AL117kzFBXybF7cfhe6hx+h5iZJxh8s87XU=;
        b=jKi5iJHxwsGUW9ACJxcxE7yDB/5S1qXyhtlH3y0Y/ReHMWowcdftSO3wXP2XZNFBRE
         BHWIdFHL8i6lIwLjobjjlfbY5XvmuPM8kbiTGolcKQRKBL62tZkTqs22e66xMafwmZKL
         ROuNWmio2VhrwAvWRVzJ6d/7QBl6dqQG8d+wrAHEZT+J5yB5z+gmZgxb5fPrGpYINtrq
         +e0qmew20qs8mrHEGBiadusGmueq7zTooskUUk4W3OSGo/LlE6ma9CBKaXy3S/G02fAZ
         A/c8KMAaahd4ftOoGu9GtNDx6lGoXqfnL41pZ7q/fv7Ng0GpolR7RXQxf5a1ztgAVNKc
         QdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892166; x=1783496966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioxIwjR0AL117kzFBXybF7cfhe6hx+h5iZJxh8s87XU=;
        b=FiFpAhJ4+E/bSwMeB7CoBoTlmosovjE+N0wZBotR5B/mYsAtz91H+9J5E9A9YxP/Cv
         59m4zROMOJGbY1RBOcUf0sfrTlcMthQRrH3qYw5YaPqCNiDqSAyPdbwNxzCfGKos7jSn
         9HlM706Dd5zYYZ9WBb+RsEDoarO1/3qyxlqD5c52KA9+RvKbVJg8Ze6jSo0NhQu698br
         vhM0R6+QqbrFeGlD7qKxHNXhef8Lls21vLG6PMuWVMazQnb3BNfyabLhKgReiAsz7ZIX
         vOLySWPyyhxnfODvfdp0Lvw+jI54iTYaeXIr+iDeZ8u19zizydWGo1al4FpvO4eBspEV
         xVrg==
X-Forwarded-Encrypted: i=1; AFNElJ/id1eNo3eVoJRKtGrAriKIRuCC4y5rS67zl3zn52S6EW5KRPdG1mYano+WkvxpLIVLl4lFLoVO8omVr0QQV0Gs@lists.infradead.org
X-Gm-Message-State: AOJu0YwjLj70fbNBoS+5x5aqajU1uLT9Iya04k8N3g2f2v2naJNbQDaf
	nDtFLoMIom2awS9PMyfOSuPCzlMCJk5CXNbKlhxV/3lhK9JanvwC5+L4ATE8H0P0TR0CkAdNIyH
	jClbb8C9kp9vJJb8YLLy8V68tWPHTmV0pzj8ROU/Us1jqoHjx9PCP9XQtVHRifH+A0l+qMH6YLG
	S7Lg==
X-Gm-Gg: AfdE7cnytzHi4hDmpj36EnJfW1UP9TeCxt0EDfbIFm7wogrQg6QtbQOFh0QtCMnNEgy
	9w00kpJ97AMG6QxKjfMsSvdeEK4wPPO7svzJjOo1cNdIhIGWYNtg5r5QPCSrGxAc9y8dXSF7C6Y
	PtO1akFFWzc1v2pMRr+L9T+pSS+kNPgU0zhTrk70GClB8beQ9xX4IAjxzMxD1RkJBIQRstc+/cS
	p47EfQD3Bm5GDs1fNLsEi+q5rrvOU2W5XkffYAVEhklj2r1BOgRhcxHEzNqeAKAAKvhnvWXIoBO
	TguplHItCMv5OFv6OvGVF+YVfB/QRicDsgCU+nVsGpC6+l55Lx5ELZZb8vddtQdsIakxdsMek3O
	4YJCyj90UiQIccng1JMHHF/y5Tioa9HffMDXUhEhLppKFR7Jc/AeN7EZBNE42hg==
X-Received: by 2002:a05:620a:2b42:b0:92e:600d:b9ea with SMTP id af79cd13be357-92e78224b5amr72106985a.21.1782892166355;
        Wed, 01 Jul 2026 00:49:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2b42:b0:92e:600d:b9ea with SMTP id af79cd13be357-92e78224b5amr72104585a.21.1782892165851;
        Wed, 01 Jul 2026 00:49:25 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756797a8besm15540687f8f.35.2026.07.01.00.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:49:19 -0700 (PDT)
Message-ID: <1df42f13-229e-465c-a5ce-40ea3bd93e8b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: vdso32: Respect COMPAT_32BIT_TIME
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
 <20260630-vdso-compat_32bit_time-v2-4-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-4-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JnbaeP9aG76Ki9BkWWyiFMZtvlvByn9_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX0YWzzYm/hXer
 IJk1G3nL05q1Cpc4lnAnxBCl7ZPNh789iydXB40pYpaS/rEsgjSgbQrNChKJH48C62GIWFfMQjO
 1keAhak101dBuHpCOwdWmWzqolLiDTQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX6QXr95oflcwA
 LO6ckZC0LNGzGgtdCxiF3bP1RvR7zkLMNf0922zExtQIou4nuC6NZ5roY5xTA+bKEl9z3BAq1Cg
 KluBzRlYZ+IgdpwMtyW2utzlsJX2DqHrX+FLcib6M3Akg8GsDA7Q5MLIOL5wZ03H+lH6P/Wr6sY
 YwLGnyX8n6JRxEP2Mun59aiq3D6+zG03HkXuDitbTDf6noXDXU/QTyqHL2fgs01SW26RlumyAHR
 f+V/RjpJuOjKNq9dLqertfOhusbwu6I5AVWpzA/TQa4CrPEMEZ5GY987wUwT8exy2S5l6d3bzC0
 rK8fPjQUxOYCvqYii5LAi3RREpAYwHEPPwPZho+HIjTmT4gEHFmvbgoKBr/tCupjY5qg5ywIWHa
 PJ1uKbDaSGH7HTt23bXzfYSylZslfgcgU3sLBbgmRQ+6tciV70p54QSEDc9eAUzu+AEEZReKdjY
 TSD7PdLHcPOK36l5ZLA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44c686 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JnbaeP9aG76Ki9BkWWyiFMZtvlvByn9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_004928_396123_CA7017E3 
X-CRM114-Status: GOOD (  16.79  )
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
>   arch/arm64/kernel/vdso32/vdso.lds.S      |  2 ++
>   arch/arm64/kernel/vdso32/vgettimeofday.c | 14 ++++++++------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

