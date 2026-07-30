Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E0C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78jIpweogggj3Aq7tOc4mdHL+B0zSDtMeNzq8YDRKzI=; b=BAx/EAlCaVqXkoi+VmjKGPTWef
	uURX25iSDFG9JU6XquNcuS+AfWOWpSfDiDHNN8zUOU5t7kDEQSdeC28kwEPrEPsfwvQm1mN5OXWWI
	rMRIgDEr5SGBGQ/N2pnvlgLxyll6tgU2W/KR/Zd4DvDpvxiBQhA4rJi48BdUuZoZmeUIIzVs8nL2N
	zwcv60xO5tDva1/R+4WU4F3aDGlvxew3xFgeAKt8t0v+jGat5tKmzYwJYz/ULqIB66HTCEcLfLHB1
	aw/NZY0ZK1Sm0eZW5a/qwIvx6ADXE5XhbOpz/KbLDoqbfNfL7tbsXkc8MkvveW5reX0M6KVHBZfiK
	iBahKFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVdU-0000000BATY-0xnC;
	Thu, 30 Jul 2026 18:37:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVdS-0000000BATC-0wYn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 18:37:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWoc51643388
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 18:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78jIpweogggj3Aq7tOc4mdHL+B0zSDtMeNzq8YDRKzI=; b=lELf3GV3BxWu/+3N
	Vl4lSK41Q9zAwa3qLphuVLSsTi68bydyyyYqsXybLc7B2S6FjCMWud8BFcgcQ4Rd
	d3zH9fCRxbzRT7Seku25BfrOac3im7us/NK1emau1BLuNNLFE6OCmXLjQ3HOznE1
	HKiMjkDsShIaEiMWmgbmGOnJDCSu+QEKlks/2oL/jOru3slGSBE2CC5/Z5mkRYTI
	qyqcA6GdY6A6YeQM6jdFwzj/ePZ+GpYVsMCO2uPfREVbFiSr+cc9yKDi8+YZgdbP
	p7G4gM/DOmT2+6LHZ+k3uUzYLEou4nWMSTXFbI4Iwqg9hSIdbW/1oYpNeQrNpCKz
	u+mFDA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md17r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 18:37:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so221100a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785436655; x=1786041455; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=78jIpweogggj3Aq7tOc4mdHL+B0zSDtMeNzq8YDRKzI=;
        b=Ix7oLoR+WA5KLVQeqVRCmDe1dPMFJcMXlfsMgkjKznufeMY2+mktgFgr6alT/ow8Mu
         E3BhoT9aiuAWG+mZYBlH4at0m1LnCtQnhkGdHH01UOMGm31/qB60YI1iYUkfGRgIyY2V
         tOHEqP0tczkMgd+GV5H/N0rvXc0TrjJljNWE7SzFgZS0WL+MH9+DWSIbJMAki7If77aP
         cIIEF8/uSaa5XEI5mXA1sHD/BsBaZPJ9MNb1cO1pU0/T94Mq1SQR7NABwsRZWcYnmOxz
         vDHE8BOOsTqtNheVnHKarJ8Q73MRuNU4QtrRNPbAsxJkjhvEX7xylBFgFNWF+dWMbLdV
         fa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785436655; x=1786041455;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78jIpweogggj3Aq7tOc4mdHL+B0zSDtMeNzq8YDRKzI=;
        b=N/nhVCBEbysDbnw3BtHO19i3ZZPgZJrcFjguLhCmuymmsHWMvWunGUdvK37juKhmEL
         OCY/QGOQXE+ZTFfku2CwNrhVI2Fo2z+FscWmMieOMzZTyQAQjgxKy+BJmUFqjpQPIL1h
         IN4ti1ri5e+zoOHZMEPiEKB1YJWIykATRQlPNCzToIp0BbNY+TXWR2O/A9z9JVqjX/pN
         e6BVbZOo1sGb9k1GWxvauywKmv9s1ERd2T/vww/dg6ii063AttIsA8YdckVMBIKPQZN8
         lnY0hNqF32S14R1RzHYHMNtQ2/gKFt7K1Vn+WSujNddhnLOKOPzHV/7trb/bbP4niKxp
         oCPg==
X-Forwarded-Encrypted: i=1; AHgh+RrK8VYthEkEKkL9zgBtAPjejkh90omINDkt5qZ1ZEwemjzXBehAgYXRSGd4s7C6QM3LbX0Kys0wxH4vqTvWI0MR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0fFv/4DM6J9QjReAlvI5Yaf8TZjc5JcBoAZxJV0HW8T8m6Gu1
	fyaHCurZ+0I+DRkB+tSiCUKM2ARoOnCNpyzP2An06eoZSZzgZC1JMmHmThbF4dZXHW586HFgdgc
	ZGseuHDEGXkYo7s8My2lgE97dLceOnvzHPxWiiJdVYxlVdcMD3VS5YNdzT3L1+mWmQu7IAcdlzt
	QihA==
X-Gm-Gg: AR+sD12KMuI9QR1tbqo+oxUrK7VZNcD1XY7TOLM2Xlg1qRyn7cO7eWp61JaIAsxx+Yj
	wpkHvs2mWD3gjPzxidIWt2JAv2docaMpfM724CAe94nxXrpZCp/XjJ8ZPzqB59Sqg7gwo3RFQtC
	Kub4qnb5diNlx74gzw3yl/b1wlGOUPtNzwfvew8qDff0ywUlHYxNhv4HArsX4rShNkhVVPfIqjU
	+D+fIuinRBCmcTG7+Nlj3wl5BXRJEbQQBCi8S2r3u4UuF6vmkCmGX3uYm9NrwlcHTWZpkutU3pw
	PISHxAx+OKeAShomMpjPw1X1RNM15aZvQViBtt0wNH2xgL3/d1sVICbVXFIV7bcbGL4Lnt8oU2T
	Wf7sEiFXAeZyC54jEGwYG1eDLng==
X-Received: by 2002:a17:90a:dfcf:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-38f9bda5a9cmr3056977a91.7.1785436655267;
        Thu, 30 Jul 2026 11:37:35 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcf:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-38f9bda5a9cmr3056939a91.7.1785436654806;
        Thu, 30 Jul 2026 11:37:34 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b10cdcsm24287056eec.3.2026.07.30.11.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:37:34 -0700 (PDT)
Date: Thu, 30 Jul 2026 11:37:29 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/10] arm_mpam: prepare mon_sel locking for MPAM-Fb
Message-ID: <20260730113729.000046c0@oss.qualcomm.com>
In-Reply-To: <20260730152539.2712312-8-andre.przywara@arm.com>
References: <20260730152539.2712312-1-andre.przywara@arm.com>
	<20260730152539.2712312-8-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b99f0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=TWr3UOjz1xACnXJDHjEA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YlB6zagC87_yAf7Wz509lL3TNOlna-OM
X-Proofpoint-GUID: YlB6zagC87_yAf7Wz509lL3TNOlna-OM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzNyBTYWx0ZWRfXwwhfE2nOz9Le
 iDa5K/qc0tRfte1Qi6Im8iwt+Snqo7ot3EF5OwgquFgiJj2g74ppOBjdMgRbewhC7FgBgtvUqoV
 KAAbMvggxiIGPmeNEG2a45Sjy3+Adm8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzNyBTYWx0ZWRfX5LVtd3dnbNf6
 cdhdguHzmw8VIhtOAov8kkElmbmzb0FaLwGcyyOnUNtlAL5p3HdbHlQtErYSwbelm9wKlGL79gX
 L8BM16NA3tRmddbFkHOzaC0f+HCOT7P0qQY0O+Jvzcc9rtLCciDnc8hBgfYy4zEEAIT3ySfWveN
 DUKNyjg9OOwSiI16g8DFJLjgt3jlradV/LHI+q3aNBqVG0B39OOVyO4S7k5Ed3hh0vqbMkTmvPA
 n2K630DrrFv2VV4sJzlCaU8sLs33kpGDDLxaUG0gedeAfYf6ZwwfDtS/VFvoy0VhsJkQlnHJ8L6
 91ahaq/dKTAr/0fw6xaD3Zf7IS0gO7JA7e0lD20HFKsV3bZAF9pFHX8G2sc2WlbP6v60k1W8Lki
 dB+vYOBvNnZqvUdH2uleoCyDKgGVfFJuVTVyuHThUcJxFN5cCZrGWBsmfO4ULdzlh63Hy4D2xTB
 AbNYOwKHy8hppfX+6tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_113738_404789_23EF38D7 
X-CRM114-Status: GOOD (  19.42  )
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

On Thu, 30 Jul 2026 17:25:36 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSCs are not accesible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with
> MPAM-Fb mailbox MSC access it must be able to sleep, meaning a mutex must
> be used. So MPAM-Fb platforms cannot support an overflow interrupt easily.
> Clearly these two methods can't exist for one MSC at the same time.
> 
> Change the mon_sel locking wrapper function to only use a spinlock when
> the MSC is accessed directly via MMIO. In case of MPAM-Fb, we use a
> mutex, but only if we are in a sleepable context. If that's not the
> case, we return an error. This should not happen, as MPAM-Fb by design
> does not require an MSC access to happen from a specific CPU, so there
> is no need for any IPIs or preemption disabling to satisfy CPU
> constraints. And since overflow interrupts are not supported at the moment
> anyway, we also wouldn't meet the other case.
> Bailing out early is already happening in rare occasions today.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Not sure why I didn't tag this one before.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

