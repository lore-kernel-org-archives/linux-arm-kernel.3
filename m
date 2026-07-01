Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5Hajlt0GSOifEEgLYuCorRENs6/gAytzHqsua8a2iM=; b=2kbz5YhBu2zwHN2Vsd1AR6T5EV
	bSuVqNH4bBPjt8qdvwelQ+SIIqVd03ZAREBnKLPhMtN2CSR6uRkhE69iGkF/vvptt5AWhJsqaazuC
	3zj9i1uZDt50zIciIb+vHDCJF3tOYkDZqaTa6iJRq6+MvH7vbubEHn/mj1S6/GJlemnhwX6txmVVL
	lZCYRVJcIFrJcjLGC5q+cc3k3aa6GYByQp5DxxlHNxH+hIZWSip42uR/LewXLOCobRJ6bHwF1weEK
	5V7xaGjTftWkrxHkyZK0BQR7i/HeFn8c6E4LdMdtTcihpKZF5xkuoGTItF6xpwdi/bLTyqPyZzrs7
	nC6ow3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepjR-00000000xZO-2aLq;
	Wed, 01 Jul 2026 07:51:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepjP-00000000xYR-07yw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:51:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZvm154302
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5Hajlt0GSOifEEgLYuCorRENs6/gAytzHqsua8a2iM=; b=CHrmkNT/8n82uDku
	5W/oxi04FrcTejUH736a5SP/Dy+IdwMaKBBx4VlX/kzWSVybP0ERM9fwN3EW28be
	nxp8N4flgNS8xHjUTYPB0hTXFaFH0K3VbYIjfdwVSGYa/kU2s/6l6B4vn/4eD77n
	8CN7VAuJMdRMXbZ1MI2Ql1w4vPnltoAe7CUmD/W7PdPwfFcnNFXzV9SXm2tbEaRU
	9U6CncWN1oDCGNXO3xt8q4o/xS5QJ3DTPoUXCms7wc9lreP4eMDOBSVgUt+BUGSN
	FY9IflqNWjSL0RY00wl2hBKCFMky8dE0xbgHmdI2nti6WFzd0HvmcwxhMCHOFHDv
	DFT4ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j9136aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:51:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so48338585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892297; x=1783497097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5Hajlt0GSOifEEgLYuCorRENs6/gAytzHqsua8a2iM=;
        b=Q2HfisfbAe9u2uHCTd9nZI1dDqA5Fs0I45AyPZlDyFuX9ue8wX4RZ0P23HGv6+r3fq
         xhRVzxPhA/ffq7mR1HhdQ8XSg7sszFbkpaUFadoMnavWX4GoazBpRsvpmIIpjAVlwvj3
         ov56rYTLp/ku1FEK/OCY0Ks7KvdLresXAw2tYNtcrltpMOkSpV4LN9SM4AEmNtXzQwrW
         SuME3yKcuk0WcQkyZWOQvwfxsJBg5LXz9VHn4nIYkF36gR8JsnZiHTjICYG0VBPJCY1P
         cNJhVVCXUICgBFKW2zTHh9KgbJ/ZQ51pu/V9sIiBznJyLtPv5Xnr+R/wPtuTfKawvwEd
         xiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892297; x=1783497097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5Hajlt0GSOifEEgLYuCorRENs6/gAytzHqsua8a2iM=;
        b=sdAH30jyTUSiRzu1UFDxph9iQnYHNG0YCswxUjBZKpJEpp09UgyfkmuPo2yCZ4WihS
         xtTGj/oAJ5KiJRnwoPFg0TCxmxg/6LH0/fFR6PqTtfmxF95OUC6zp4/Dowi3sFKprUY6
         emnK0FcGv33gyJFLHPr3zxM2GUPFheXTYX/8xwFmzq5jrHGrHNdVqysjAZO8YQHSo/2H
         PcoEo1iTvWssKvz314KQL7oCyMixr0dtnT8wBLlcgsYtzKVyn+XcPa1ElzoUYXCfzEG1
         eiRQnrU4F1jeTybx6f2+Ct3T9SG/VSoi8OtOYwGWHCkGl7f1419f/g9pYFVZrHaz6dr4
         7n+A==
X-Forwarded-Encrypted: i=1; AFNElJ8YMDU4BnluuhIX1GOL6g8EeKRjmL4cpgbr4R+EJLdeSmuFbGAritgP3wkF+yYxSFwUYYWGLrTlAUGeW4aqB4dC@lists.infradead.org
X-Gm-Message-State: AOJu0YyPiQdug4okFKuyUdLt8B6AIMs2el1r+hQRobioYIoaW+AnQF7e
	lDg0wP694+mvhKst6n7U1RI+8+UJoe8fUxDMYaDucGeORB2bNyjcZs+M5jM3GtlYgojOOrvXfwI
	c1RMlzkIyN/UGOnVXYizVFJRiZt84ck5EEKxoLYVNezi7yrYbtTYpYfxc095hEJlH7vqH3LGXWS
	Qdww==
X-Gm-Gg: AfdE7cl7VodNTob9BbmMzzGXeQVuNbj5k3F3izefshAniuxzDGoA+RO9gz+nyeB/Lv1
	YnNWLBGQYdziirj6Yg/2D2NkCXjBuhwC2m08xtd1evABW5MEaDbUA/RbpE2doJ1zb6XpFHEW5g9
	CVOeme+/mjHYFFt4rywk1CsM0b87JH1oZI+5et9afRPzqmXK879/lgxYZLo7xiSCbMeRezetGIX
	9gvCbzRPQY9QFLC2tlg0WPf5B2GkIRMee9MeEc18ODOutR0utawYjCerzlzQVaeVPRlFiveFQN0
	1aU0fP0u9Fmn1V9fiYrHre5BXhRM4lGdOujPnIg5g6jN9NfTfe55jBJXdKlCX8NfLS2DHzGMQJR
	ltQJ2wtAtdREGm/f9fSMtrfYN4q+2SEM4G1ds0qkHuxGG+5lKyhnHykp6LgetqA==
X-Received: by 2002:a05:620a:2a08:b0:92b:6805:eaed with SMTP id af79cd13be357-92e785233cfmr72403585a.74.1782892297504;
        Wed, 01 Jul 2026 00:51:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:92b:6805:eaed with SMTP id af79cd13be357-92e785233cfmr72401385a.74.1782892297051;
        Wed, 01 Jul 2026 00:51:37 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6a3e8sm228444966b.19.2026.07.01.00.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:51:36 -0700 (PDT)
Message-ID: <7b5b211d-bbf1-42ea-9b1d-f8dfe744841c@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] vdso/gettimeofday: Verify COMPAT_32BIT_TIME
 interactions
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
 <20260630-vdso-compat_32bit_time-v2-9-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-9-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 47YYJRtViNcRs2W2fv7HTN9_a-dcznE5
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44c70a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 47YYJRtViNcRs2W2fv7HTN9_a-dcznE5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX6ujV8Tb3846U
 sDItybEwlZ/LriJYEQAcgh8TrLeAZEuXzlDnls/sBq8ATxU2QqCEBakiUWzJpDWTGbgONyeddsh
 HU95sE+QhDit5Brg+ypZDcPYP5Ut5+tR02CQnemuinIgnOLews2etPGG2/cAq42AQaz3VQaX/pu
 QClBcIC8T1SPNBOMkcEKR3he70ZjmnOU6VxuIHydVLXODZcV7yjLvR3alisUrP2YUKp6bHM82jf
 AaYgMcoLHrPOlG5G0egrSJ2ldrLlSL6OImaoleB3OGgNLDNxZWCnNMvTF7TLo42YOX4xWnTF6jT
 iGxBOggkw9NwEYszYwBZR7LskVguGCzVUaW0+8qifTGGXH9EeiuKtPmcDesRbPI17sWjFO8KlX2
 6//3UnXj09BhZxmrck1lJ9VbC/OEI14OmUyWWDQ9rMT8TKIbeu1Tuxgps9gNhwv1CTXi/ttV1lw
 2CX4PTNetbUu+BVY55g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX+SG9X/rgWtyJ
 /qBJPwOv/H+6OVGdhDEwT5SF4J3DeBRtiwLgVPt1XEqBKqOwcR8jW8gckrWAzbfJrEZpjR2nuyg
 lO4gS6Xlbk+LUAYddF0gcwQVeiAZyTQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_005139_070962_085411BC 
X-CRM114-Status: GOOD (  14.52  )
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
> provide any 32-bit time related functionality.
> 
> Add some build-time validations to make sure the architecture-specific
> glue satisfies this requirement.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   lib/vdso/gettimeofday.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

