Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F62CCCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=; b=T78ckeK8ReSXZozuuNWTmGKNvX
	O/dhWejf1RXTMfwjWxPzLJe0Rm9n1vBKaECjdODsPzVAGKMlRNFre5+psGJY3xkbSf8qvqyfSAmPX
	FnKdmMSkeRiulNXb6b+KmmCDj/BfjN9xemwDMvlyyXcffgHkirbTDXwMwKc2Ks5MRXxmgVVoe0pfr
	cT6MUoZOPwhdNV6tF3qy7DikPA3BPJ5rZFLiS+eYv7e5sg+jltmL7NzIlgHxTNKtEdv7sT7HXfZr1
	VLIZTfO1MlcEnoYGW0tob/dOh1UI2evS5AGRr0Sy7qPJFK7TzH7k21L6MZ/hwsjuuTqtuxlB7Xtjh
	0E3z/9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlTh-00000007I2M-1K6W;
	Mon, 19 Oct 2026 11:24:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlTf-00000007I1w-0iCl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:24:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrE91665571
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=; b=ARLEYZjT8erF5qXs
	saU47ZpIVBTPaXlIliggk5y6VKbsiP3CRIKRK6OcBcmpF4Xo/4xEvJmBgp62Sa2j
	JnxqcsQt6I+kg5DhY2Cg3ztSSq68P2bBd//7ladzsxtmnZ8b//woAzdvqCLcu8ep
	c+2kJk1/P0LZl2lPv+cgGsJ2OD9YjfeTvrUU3yvfKMzb0sVysT+fYHkB7VuBEgGk
	IZwt/mNz75T8IJuSHdiu3etBQlRHXEMvBZrvToXcTS57Bj51G83nT1C00YRe5wUJ
	xYoeh8VftuyVGp1Yz3wOWRPvY9reLHQFsTqv48jmcHbz4jghOPEQd9fXgD81gjF5
	A595Og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0tba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:24:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso6781851cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409066; x=1793013866; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=;
        b=MElsMXKXpKtpOZmV90kaB3U9zSauVICIYbJ3EMNwFGpui0w+X118q+xnbD2UHTRr2I
         63rQgF68U0/pC1GM/7jRy0GspsCyth1jzr4o9FHC0apuGBf6Z9VRQHzKb/rW9RrUOT4H
         e/CO296EklAJ4Pdmx4y9UG9kpelSp/sdsxpwco4tRixWiwSfYK9GiVSJqmuXYoEcVsW1
         v2TSiCqhgiayjmLPa7oNbZycwmXZevvRViMbMDjNZ+AmfWm0W/lyxE6wbm+r9FIpjKq4
         xNLei+VxR3KFjZYX4OJAvHn7wDb8s7McF4phaDIxJ1xkTnsP70mJi5XUfGyq0VQueAa8
         rnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409066; x=1793013866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPbYmOFTxQ3oigY+n6Y8ylBgN3Z5CJMDE67sAzsv19g=;
        b=nfkETETAaySr5llrweA/ZjmvYttNf0frI8SRF47FgLLlOxC3BxBIpus4aHII5zhUvf
         NcsS4hrKSD2FMMB6736hk+Kq3Gs8fcEzkuuDLzKk71NlPQ8jla7mbm8W7JRgh3/YKX5L
         Gj2LaccC315r5COc2e6yFj/0Ck1j4/xKL0NoRsKV7mpVWqdwn4v5we+Fgdf+hlvH27PD
         vtLohMaHHqiOaO3VhqFZAQQcW0pmaKMxDgpczaTcyiyqbdLCbpXcTSLIUTcNVVU9FE+r
         48wV2gtreRtwJsCrU4ZkWyz8ME/k5RBknkwwMPxPUZk4pmNtGr6lz0C2MXzqUdH6Krhs
         /qEw==
X-Forwarded-Encrypted: i=1; AKwUvBwFgaSDKNkjkXc+5MGV041buVmGYHbAUsrCLcxx4rrEagG1NFGoaYyZznBZDSc938Z8cD8CUccte+9K0G6nY56O@lists.infradead.org
X-Gm-Message-State: AFq9FYJufrcEaI1geYWM7qGGu/xWrGDaaPsp/U+iT5wUXa6jZiHc0GjM
	WP63pqvb+RTUfD5hD1VpvylIja964iPTb/4a2OTTAhe/k+p8YDS/Cuz/GN1TsG8TK8rD8ngxV82
	YSHrdxMegUB54x6NpgzotBrUjNwW6bFflkArdMbSXOnjIztmPJ50naYTKY3fotWOScQuOsOvCFr
	KIhndpfLYQXw==
X-Gm-Gg: AYBFou3N5Hx4jPX/zDWv+PJ/bcwRUPKyBhpuNDfdWGZ7gyH7Jxy3E25qF24Kl5voHkN
	J+S5nccUTsWgq9gsGFQLbchYIGr7J7D4EVqWCu53Xh+Upab9x9aPtG59JDS+/q1t2wxiSvbLlcd
	HdwnWXA+oCqWYkRPzaLNC3rrfunQHcN2NLf/Auj8O9UuTU7IhEc8wLclg1AcUDp/3FOPXtVPDpp
	W3HA+eXIamHRz6oRaqEro6TJ6SI+UoW6JLsD+CqV34sNdJ8NoW455HCRhuj/OHbEmv0lfi1sDku
	EN1SdcB6Ndc2x55URnlwYTUPCFlg3QNPj226ME+5R/NF5FX0/YuE75RQgOvm8BID2JIeMf5Lrvb
	uh+wtWi3EatgyIUUoBKOhWQ==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr129062951cf.5.1792409065487;
        Mon, 19 Oct 2026 04:24:25 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr129062381cf.5.1792409065011;
        Mon, 19 Oct 2026 04:24:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf100sm338414066b.15.2026.10.19.04.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:24:24 -0700 (PDT)
Message-ID: <c75046e2-5d33-41c1-b032-3c16e630030d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXyCY0FaAmJrpH
 zuwK5lMMk5BsC1VtF7xVMnZChZ3r6fkzcNpwqNnc3RiUkd+Sf8RxPh6WxYNvtdd+4Cr/w1bgcDE
 MZQI8LZxqxYGGyPdERZBErsZ5PBUfzg=
X-Proofpoint-ORIG-GUID: kkp6gP_7ZIzolFh3wpuvsCrRQAVA8Mqp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX6AKfzfbjyk91
 xoREL1q3vjQyUEiL4hAbEEc4EiCGjRuAZRcvBJxkgP9cZswXuJhbUAzo69ItPIvoDCkCamQg8Fj
 ZZBl+FYAQvq9b8n4jf+ScatznwBVgQdtx/jBFPNP1DMe+ol21Ybm9zFRdErGEW9HjUshe2VDYIj
 vZ91mHZ7IIiTl8bEcRHY13ayO5OmpC7wF5gmTl2ckzhLx3Sd3+aUIisTnS1KxF81ASMwB5oQafn
 Kdf1atf4JOOjSxtRsaWzXWS8vM+mSn306cc6iwX+SkTYfXxNUy2upV8ezLkibU5T90R1VHKTcIb
 c320xXQKemppRPUnXos14xEUAgnf7ROgH/LPXKS/hYyRlbH1Hj6f60YPOVyzPJNBxA3D6+lBgZU
 qVdWgHTN/qzwD2k6QqXBfCd19p9P3qpcnEmpzQMkG/MaXieqTKKXDDuKEnj/5dfGDKlfl+5dmED
 9hiBGChDrWwOsRlYoeQ==
X-Proofpoint-GUID: kkp6gP_7ZIzolFh3wpuvsCrRQAVA8Mqp
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5fdea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OE6UjuR3gYnAVEq_z8YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_042427_227483_86A83744 
X-CRM114-Status: GOOD (  21.90  )
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

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.
> 
> Such implementation earlier introduced a hard probe dependency between MPM
> irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
> probe before PSCI power domains are probed.
> 
> The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
> psci: Fix support for probe deferral by dropping the faux device") / [1].
> However, it makes sense to remodel the RPM notification in MPM irqchip due
> to general consistency.
> 
> MPM is not really a power domain provider, all it needs is a notification
> when CPU cluster is going to power collapse to carry out the RPM
> notification. We can register for CPU_PM notifications for that purpose.
> This way we can avoid such unrelated dependencies.
> 
> We cannot register MPM under CPU cluster power domain and rely on
> GENPD notifications here, since that way cluster low power modes will be
> blocked whenever some consumer of MPM, and in turn MPM itself, are
> runtime active. This will add another unnecessary dependency for CPU
> cluster low power modes.
> 
> For now as first step, register with cpu_pm as a fallback to manage RPM
> notification. Trigger the RPM notification when the last CPU in CPU cluster
> goes to power collapse.

IIUC since we no longer need a dt-bindings addition, after this series
lands, we'll be able to strip out the powerdomain provider path, right?

Konrad

