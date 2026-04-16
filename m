Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BFCF8A16F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 12:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNf09G54e9ValPOEcaOYfq4n8BkeieF1+CIG1xQv1hw=; b=3s1+8cBiyxInn/B7Ds9dPcKYjq
	b955dyf7xUdFwAJLFnPUb1cWJDcUs0hpwAMueX+rlxuFFIiN94uGq2Iagqc0zGpjMhA2kaeV6gemI
	Yuhd/I11CQS4bGD7Xbj4ndL82g+wDg3N9yE1heVL0raO2vnYjP49gYPOPm8eKtWhK5e3waT34SqV1
	r9Z66Ciim6Zgl8spzsbkjksthC81b/qfLX6SoziD5dEu+/NBndQ6ZDn07b5IGRcFrWD0QNqEsGyBu
	DerSzJaVxuFDVGv2rvYL7OUtc2e8/igzb4rLqJOk8IUzFRFKPFkANx9epUV+ymeITacniiv/9Ks41
	rQ1JQI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDM3E-00000002RsG-03Es;
	Thu, 16 Apr 2026 12:42:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDM39-00000002Rrr-2uxS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 12:42:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G7IiId3733636
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 12:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yNf09G54e9ValPOEcaOYfq4n
	8BkeieF1+CIG1xQv1hw=; b=ovaUI+Zc00Mtw8ph0OGEqzRKBgHeZS0/wZXvp2ej
	Kelyi/NS+yOywPqEFy+nmd2LxCvMvi54rt4bVfCnzOwgFqRDIMrcVUavVsPBx2Io
	2ZBhQyRDy8HYU0xMPIjSDltdjaH67fWKRasS5IIKePgAt4zY8XpbpNHxiqJagz0A
	8fi3vRCF4Ui+8qm/0Dc9IIFw9qIh6XSpGytSPgUe1fHgtgwh1JwIz0D4tNliBFGT
	DvVcX6Tzz1NzIA4cBJHyrMDYb3l0nWupvVOhNmyh5T0ELGBKb9+WE78XbSXwNEHZ
	hcixJLb/0dkXFwlCW65+d6R4rE7+sTF+nr54yL0XsrmWgw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwm162-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 12:42:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e06219cbso60886875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776343346; x=1776948146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNf09G54e9ValPOEcaOYfq4n8BkeieF1+CIG1xQv1hw=;
        b=cKHuWbZIJ3ObhuLh1YaATceo6H22ya9l9rCladzpwOn1jxnRvP6kWLthdw91qoRL5a
         H6jH0alZqb6rmo9LEpZbUTug7FHS6n6fGPBo0tipDJ0jjWzpDX9RsaO+PAxHk8wVR5yg
         o+2v1lNEf2x23sJ1qsbRwbJIVDSm1ELtc3Uwrp53gFJ6vB3tCl7kclnV3NKzyA4U0536
         OM3CuN9K6b7kvh8LJPmXxFM4As72RkHIcdl3vFQ2G0TWQis6dDoRPcpDDigHKs6yn6Zc
         GB1cToLYZmuV/4YroHPrcOEZm0vi+9bov7gmixSQ+dN0N1GRlDo9J+VEc5k5KXLogkph
         NG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343346; x=1776948146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNf09G54e9ValPOEcaOYfq4n8BkeieF1+CIG1xQv1hw=;
        b=La6tySQOSz23f3uaoA3ybZBVM/qeIY3meKjWfgBhYnQm2YZBbE4qymlaF5QDFo8r+D
         OUfLP2yL8G5dardCecQjgQyr7oHbymFTedjpTHlmMcKZXQU56Oec2WpELjaidP9dKr3k
         v+LxgmOthPS0Y4HeafZzlHiYBjCaUmtHj7WWmep2qkdSQqxl+C4eJslos0zLtRheanlZ
         d3B3EOWXL7m7Q9oTNDsZVY8f9/vYnmiLA7qRz5q1lqu4SPPiOG0TPg6iixk0eJw1t05r
         8QpJXmUYY6YMPtK8EC6dEZFDXB4Ml2NirRs+5f1FctSYSVE+gvtW7gfA+tHxiL53mqKI
         n2aA==
X-Forwarded-Encrypted: i=1; AFNElJ8Hb2mXtPSx4L5I0GKv1tDd6miXNXIp1oJOgZtYoANi60GBaqWOAyBjk9trSvHlMkVqc9iklXIA4PXP3gKUiySn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1uaeuc6KvClKAkonVZv4YDcrOphiW3G10HC+KPX1MXWx6iHkI
	6CabZABl6wwP7ha4bW/b80g/tmWgybfarWQCs1iwy4aJTLM+L9J3oKVMJDHlniT6Wt54l+n7OOU
	B6SgMcYv+4YvxVDD2TLodxpp5Dzq9UP8WZjrtoQBOwpe2vx9nzcllAjuT7pdzlCkXGIqJoDN/OW
	iJWJ5GkZZYNA==
X-Gm-Gg: AeBDietjftKX17Tul+2LowPTrr4JwsbPqeJKb/I9YfZjxHaCkWCovR4ahvQHXkCI9Ao
	RfZKQCzXy+UwYM2o7sQ9fisXMgRkQMuwURGgelKnTKb9GM1j/cI1Dar+sbnVBVBemSjV+PNM83e
	WKgEpdHfiFczB9nz41s3v8Juq6urLF8lMaReTaWZdimLgadZY7Jg5N1enXiAVT8eEApu7Br7Mca
	aOTaQPihWue3puGggk6ptS/efXwbzJByIl96FOq1+m/MiDFh7VawYq1aNLDQ5Dw8yCCIs/GffxN
	yQeExn9vIFXqhaJZju1E3+swEttVVkuLyaNpVze+d2RFm8R9H0UEAzqvxgshrBUtxUOBUxCq0VL
	QpgzSK3gkRfJaBtYjKZa0JESZwCnKBc/K3Y4VW5BKNPtXc0O7
X-Received: by 2002:a17:903:acf:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b2d5940e59mr265748075ad.8.1776343345678;
        Thu, 16 Apr 2026 05:42:25 -0700 (PDT)
X-Received: by 2002:a17:903:acf:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b2d5940e59mr265747565ad.8.1776343344952;
        Thu, 16 Apr 2026 05:42:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47810ae96sm71237925ad.21.2026.04.16.05.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:42:24 -0700 (PDT)
Date: Thu, 16 Apr 2026 18:12:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cpufeature: Fix GCIE field ordering in
 ftr_id_aa64pfr2
Message-ID: <20260416124219.mxpuh5saxsphzxpi@hu-mojha-hyd.qualcomm.com>
References: <20260415200031.1885440-1-mukesh.ojha@oss.qualcomm.com>
 <868qan2ypl.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qan2ypl.wl-maz@kernel.org>
X-Proofpoint-ORIG-GUID: zTn98L45V2SmuvgclpGwo9Q1C4dJr-Nh
X-Proofpoint-GUID: zTn98L45V2SmuvgclpGwo9Q1C4dJr-Nh
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e0d932 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bQMiDylAtxGVbSI6-P0A:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX6/c1LZJiGKOA
 0dmJmZGAHuHJYbg7P24BdiKxcmhpdRsZ21D41V4CdGhPaHVZ9gUj8WGZ2ztm9wF789ZYn7jCyWq
 Xe9/PvSrK9CWcAik3771h0ocUSoH7kkPKUcSt7k8q8Tbxn5orcTYiNEOvHhJzBkmO5iK3z0urA3
 vR0WBiK9xe68WVqSHKGrLkTuZ6Cv8SI2cOz5Uz/Nr0mSBjGh0AH49UcHRxJNeAWQhcqM4lbVnd0
 E2qdETttu9oW2w/3Qtcl/hbEEY9x/W2i5HjTdie3c1qr67j1mbGyF3qT2CkIdnahENRklGDdTw3
 E4suiJV7VeQX98qV1vy7RW5Ie89eG6G0D7AL+rQTEeflApEbt1kaIzWArct6/5y7PkbkqNd+1ds
 e2FppdwleKukIobtzjNquF2SOFLsFwz2qpRjI7pN0hwyVzlthWrwK1XzN1ET+xokbQSi8F3YTE4
 TDORMAUzxckAQUgyrhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_054227_739032_7AF7CCD3 
X-CRM114-Status: GOOD (  22.33  )
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

On Thu, Apr 16, 2026 at 07:42:14AM +0100, Marc Zyngier wrote:
> On Wed, 15 Apr 2026 21:00:31 +0100,
> Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> > 
> > The ftr_id_aa64pfr2[] array must be sorted in descending order of
> > shift value so that the overlap validation in init_cpu_features()
> > works correctly. The GCIE field (bits 15:12, shift=12) was placed
> > last in the array, after MTEFAR (bits 11:8, shift=8) and
> > MTESTOREONLY (bits 7:4, shift=4), causing a spurious warning at
> > boot:
> > 
> > [    0.000000] SYS_ID_AA64PFR2_EL1 has feature overlap at shift 12
> > [    0.000000] WARNING: arch/arm64/kernel/cpufeature.c:989 at init_cpu_features+0x144/0x3d0, CPU#0:
> > swapper/0
> > ..
> > 
> > [    0.000000] pc : init_cpu_features+0x144/0x3d0
> > [    0.000000] lr : init_cpu_features+0x144/0x3d0
> > [    0.000000] sp : ffffc08678f03dc0
> > 
> > ...
> >     0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffc08678f14000
> > [    0.000000] Call trace:
> > [    0.000000]  init_cpu_features+0x144/0x3d0 (P)
> > [    0.000000]  cpuinfo_store_boot_cpu+0x4c/0x5c
> > [    0.000000]  smp_prepare_boot_cpu+0x28/0x38
> > [    0.000000]  start_kernel+0x1d4/0x848
> > [    0.000000]  __primary_switched+0x88/0x90
> > 
> > This is because the overlap check computes (shift + width) > prev_shift,
> > i.e. (12 + 4) > 8, which triggers since GCIE occupies bits above MTEFAR
> > but was listed after it.
> > 
> > Fix the ordering to match the register layout: FPMR(35:32), GCIE(15:12),
> > MTEFAR(11:8), MTESTOREONLY(7:4).
> > 
> > Fixes: 899ff451fcee ("KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> This was present in next-20260403, identified the following day, a fix
> proposed in [1], and the fixed commit appeared in next-20260407 (which
> was the subsequent -next build) as 7e629348df81b.
> 
> May I humbly suggest that you check with the latest -next branch
> before spending time on this sort of things? Two weeks is a pretty
> long time...

Sure, Thank you.

> 
> Thanks,
> 
> 	M.
> 
> [1] https://lore.kernel.org/all/874ilqcu3c.wl-maz@kernel.org/
> 
> -- 
> Without deviation from the norm, progress is not possible.

-- 
-Mukesh Ojha

