Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=; b=Che+ZSB7at5lXMxfSFiD0K/R3/
	wO8l1n6pVw4w+oQYgC3/bUd/R3ecXbTdju5CcWdRapw4KyFei1Gz45RTld/PwcMFWuIKY+HJATKBG
	bOqbuQFq/CrZufzwr1CZ7RyA5ELpIxxZYwhKnHVQ0Im0b/JzKJAq5r/+9A4shEZRz7kwNj8i03e/S
	pwFWIJDIvyX99PHcNvnI7J1tVFkaWhb9O1+I3smmR0rHK7FLsOQZ0cKTF4y8o2NkiYJXSqm838Y02
	4gfGRnUdhh5y5x+2lmC58qQeKdhJDlDcU4PT/sGNaaHbljS2H6SECchqeySpgXR9snfQ0yX5IlqMo
	eW3N1OiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepib-00000000xK3-1xIt;
	Wed, 01 Jul 2026 07:50:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepiW-00000000xI7-1odF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:50:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lTau140763
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=; b=HMfEvFRx6nTIAtVE
	sL68tzthEIkQnLnX9Rc76Z+NLktj5+RvYSmZqPoXUEE+E5o+LkIIfuBJhwlpfY+J
	RMsiwlNHkpZV8rVnPyoGGxfPrNXNI5lgDH8tqDgvkEi0b2grHF8dSFgpODSc72rh
	0EjqgCOhK8TjyWAMMdGQRQAKFqqBtvWcjIDdgCvtjeMJc+b1syAik1phPUjpeiHT
	+mHBBG2Zs+XrFMXA0iCK41ffFLvfiku70zwRFhoOXlj4J9G7qR2SE7MvpJEhyGW6
	6kHzfxIseJu5NpodNx6tFH/VgtdgKXREk5GcvUEPZwLchVew9XyUnsRofUu/umcl
	K3tSsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99k8b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:50:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso49837885a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892243; x=1783497043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=;
        b=F+OIU6AsO/bXKCpbe+zLlpDWjg3qNBnQmo6J9U50VLUUFacufudFsg6toZh4dHFyWx
         JNeUakM1XVm2kjvp+tuExj/FkOSJCYGMpkgG/9qXUAwi7N7vMTiw9X1Hw06+6iXo1FNd
         33TnDGE06xr2YxqZjALFuwRDqo1b66GXsi8XUYkxtL+ZiKBsOI5eMeypGVTaSINqNad0
         /omJDPle3dsYRSpsxnIEHSQFm5NQNMmUE4XRCDCtzA36sCainK6EhEfDZC10AkHjMQYN
         /HmhKZEk+9HTdwOznl7adfNR4Ohmy9z4YtkUPSRKT/sfw45OXuzkMzdBh1Y0Q9CrU7wk
         8+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892243; x=1783497043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=;
        b=kJgCMrp+UYCcwO3PsVw0pwK/SIxQTg7SjHOWW5dVJxKMTdR2vRzYgTSqwRKbImG+1r
         a276uW5OUzgvc2oZAIfk9hS+SBrXvbLu6NYiTeiPu/VgLD9yzwj3Kfoos1onkhBMobrq
         Fj0d3POpntwajg1QrU4ypvJZEwiPc9Lfr51BgrUf/AZjvzCGtVuQP3033jLmjjNv89P2
         ue04Xatp0YZrFkuDjfBFJ2yeBmm1Tgx5w+j1wAPJZ7kEBZ0THcM2vwajgJzVYxusGn4J
         V6iIQDMoZk4fAEWPrD5AO7uImLJrknaOdVpRt7/PMtQGuwURw9lLT++kLXyVguygoLr6
         Q8sw==
X-Forwarded-Encrypted: i=1; AFNElJ/e1BXMDaqfVlN6oHIqTcb/fC9tSi3HPUERgbfXqf2lzvEo9sM9/H4b3asBthCJu6zl1IF5kiu8bQVuPY/7v5nK@lists.infradead.org
X-Gm-Message-State: AOJu0YyNP7fr21GJ6bk5VLqwTmqAQIckbBFJtluV6hAoDBUiW40upgfW
	qxkquzeo/mXXR8BZEpzg5aLU3l8V/wq1+/RJs3VnlLGy5MxXXcOXcxXI9HxdLamUtQy7JBzbxxW
	gE7zfK+I/cKZCtR90jLNMoYxw1TxpyH1VsweC+jiIE4MLjdMTjs0fF5dkYVQJHn3FDpYBCn8M7e
	QwaA==
X-Gm-Gg: AfdE7ckj8bt5/C3DQMZX88sTlj4syVo94++u6pmUTWPdkVKBesWGvflDtU3Nm2q/T8A
	z/VLDBd8F07ywdY/GX7ZfcKGKYhzQueph1c35JWLH42RhcvVT//UyHKurLsTKkqpJ5vMWUcDdi4
	bOc/xKzuJvqo3rEGlSbmL/VPOlWfRMwBqHNWnxG/UXGLVlGz5Q3dMsw1moJudvOPJIrhx9PeBfU
	rL2SEKW55JUqZ0eYqQN6dRo5Q/CeajPIitJKIn3gAPbn0DHHmOMeV0uXvLypBeR6sU6C9yMqnHL
	cYOAuFo/4q0cScny5tgrkblKL6e9+rGy+yTwR8XmTT2t1+nH2mSUptiv2IeQxRRw83x1uTKTOkV
	X3AymTB3V4dXaygRBk7XYC705sRubDK0vlIl7FGRb/4vLMBN2GTz6kr0nyhWU9g==
X-Received: by 2002:a05:620a:4504:b0:915:8502:f7fe with SMTP id af79cd13be357-92e781f1943mr80045985a.15.1782892242421;
        Wed, 01 Jul 2026 00:50:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:915:8502:f7fe with SMTP id af79cd13be357-92e781f1943mr80042985a.15.1782892242042;
        Wed, 01 Jul 2026 00:50:42 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be82fd71sm77836705e9.15.2026.07.01.00.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:50:40 -0700 (PDT)
Message-ID: <b7922ba1-60f0-4135-8b86-e414c058a135@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] sparc: vdso: Respect COMPAT_32BIT_TIME
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
 <20260630-vdso-compat_32bit_time-v2-8-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-8-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX71NZlg7SDL8v
 w5W6y/2SvjXhzxv4LjjIgVhiYgGaCSJtjoLF4JuGJ5se5ChaGChsVN7FHLWFYE7vucoQrI8WBDQ
 wQBfyRTw5/q7NQlQaHH9++wOgXURpiY=
X-Proofpoint-ORIG-GUID: VgS7BDH2h-KuBdj9APgnaaEicPY6KeN6
X-Proofpoint-GUID: VgS7BDH2h-KuBdj9APgnaaEicPY6KeN6
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a44c6d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX3iNDfgE/QIXc
 y7fa9RhVTGZVO3IUT9PYdYVKZTxafXBgUQa0BI7ecegG3tiWfDeFjiiqyUGsav3Cx9iqMCOu34q
 xcCS5dlqW8i71hCJ00GwI68XQq35U5JPxH/EkiLD3Hgtt+/LC9pSVPErhx0edOby4P6QsGeXtEV
 K3BWn91Fb0fXIxYutDVwERqld9rP2CxFzb3Q2/dBJagBuR52odIvV+t4d4SAZtN31cXQcBH0nqD
 IgvvnMiTGVw2eSnAhc4pSCX8BEmOPIlRM/a8LdPvvr79oHoaj0qlg1lOM0QWH3krzcxlI55LoHm
 Mfnt/enZvIFdJiiDTrtuKuRdaYcPO4x3J6dPnJJLv8u+x/XkseNoPLdi2Qk/3ZBwyGg6itgOmku
 DecbpwGuj4SopgHw8ti12CngwPm7EX/kHxDmOjFw9FFJw8Rgv291se02+QxTZ8nazdJa8Wd33JW
 9tTuDB5mK25Xdpe/ZVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_005044_477651_CE18D96F 
X-CRM114-Status: GOOD (  16.84  )
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
>   arch/sparc/vdso/vclock_gettime.c    | 4 ++++
>   arch/sparc/vdso/vdso32/vdso32.lds.S | 6 ++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

