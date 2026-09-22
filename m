Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224ABC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=; b=Mk7bnWr9BAqOuqq/i1SFXIedBl
	vJHrPqomUadt7lcyN7zkOXEqfPQe7X8GXZepxV8iFPsaUUhafLsR7nlECzyhvlfVf9IC0pbogo39I
	m9DKJ2zPWZTCDKC3gQMxfF4/poXVS1qGz+y4JlS/TprShdUqqRlQeSICGMsC0UGYKZWpJxg2aTEq9
	cLCEvqjrs0C5HcSTGuWK4kdCBIjhlLH9KcOTfMyBv6A1YhBtcRLYW64joYDBkcVnTBsybewlIo/JK
	KaGRhpHtLlJei/Xg61NB6UHumQt4s1FnlY7CMaxAzMx3fngR72DEWTMWI0/0d4TkFF40HxyP2V8bM
	oSQ/OZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99DI-00000006hV4-07R2;
	Tue, 22 Sep 2026 22:43:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99DE-00000006hUU-3yR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:43:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Skl900488
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=; b=OFNcuMXmh7AGmV10
	knsoRaEgW1DOXMPkqE6axrjTXY+QI16SKZIKboXNKJD8Kc15XTfM8fMpkusI3SQB
	8CH7dzkYILyelxqMjsuIlmXORALfUutonB2Fbs6VKMtVs1roC1vztFKrlov1xzw2
	hXKWqyb3DTdebH1ZTrkH0nzOrORjvr5ikINWS/yib7JiWlHVvjaEGc3nXzWM5Xy5
	MPolplbsyrok+Nnjgow46lGAHmXPvPsy2UkBo7NfGyx9oUoPoIZ1eu4ABfNTyhhl
	IyfCoyKZUh9NeeQ3Wn3tS4pPdM9L3MNv/m2vfUeCK5Npev/TGbIV+aKk4UUutna9
	Mqk5rw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyv5ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:43:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3286d2bac04so292982eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117022; x=1790721822; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=;
        b=hgQP65CK4xB9qjgzIwl6w4zF+U4SnD6XhN0vbK2tXzRnSJ9/BAkB1dwkViwKp0v0v1
         gSMWIopKrzuBdWAN8fwE7egfLzRbbFvRxC4oS+irMWeWhLSSLRr+gBP0b0zuuqyFyQkN
         HNGW9v6OGrlnLFZ3UKDiLlggnixysajLJf9g22jSb0dSUkF4hqc+fzamcVBRkFUUrLR2
         YAk7dxInAwU1f9n6TSb9lM/ldh1IEEXQnQaTxgdyrzmr3kuLKoGWMTV7dsXuwDV/ZTlu
         toBZD7brenzSKDrVQ6fjHaD2rDZrj7RUPKxlu1r+mpgbmBHMAK1feqfoneTGLB+41DW2
         7BGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117022; x=1790721822;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=;
        b=inIL96IpyOCCJNtb/+luTFtzAb0j6k1CcNG1kKsVFamoJt2+oZHtv8hHArLsfheIet
         gENggfurVly+djsn3yPF/oRUVZpiGn3oxxS96zZOmWB94J6OUJRW4TAFXgJP7M89m5Hw
         hIvVOoLecYNU+9wPQbI+6aFi6AqVYN4FDYcvVWmAE/Rm6hFcMkaNC0RGbultFk0NnIIj
         5DwWBzwU4P09y7xgrClXk5NsmXaUac/1NHbjjU8/BPUadAyrLotaNxR8SPxQiELAbx1J
         YJh6a4HCt1tjsxc2QrSzVW0tbRP+7PMdmFYbsDvg2nfQqjlkixCaK1Swrl1Uhugk9yaf
         ogyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvEYJ1CI/Lcb5Z+vcEzfvmCsspnBOqNM6QTFT3jtIR47wHeK01VwB94auLnX+yO2M6evCqYCboSWc4ah+pwfit@lists.infradead.org
X-Gm-Message-State: AFuF++k4OyaJ1KzNwm2amyP3EMtNg56Ek3mP+3QHW5i2zreK5EtouYWA
	L8AVZX88yar/cM5o/P2+RdQm8NKeKo4CblV4a6Q66cEMzyxmZXNLf89RyYuz+w6L2P3iZ0LZDL/
	HeRXMOJNShmXrI0un+N84JPHr+UthGXb6LvJhiCpP0jzCT+PZXDjxbG2Ox9MJnoWx0v2DybXtea
	4mKg==
X-Gm-Gg: AYBFou0bLbjmkaSbeBosoUP6jZAoW9g00sOO8fmKs2Y0h+rqZ1eEc+UAFIQU9RLVcmJ
	Q0TW+r9qS87TsFFGnh7k+VKb53GGKu9gk2D6CSTw0X8RUhfm9G2qF0I5fKaOYAuy8ceG8vUdYqK
	dmJKrPd05SUDQQL5bfcYavnzmpKADXP8bQ74ezmGJdGKcBIAWr3NsUBcyR5UtPBBACb3guvorBW
	s0ArK+GbkgN+QMcKWJo1CwRILO9gQVoMqVnTWCGi6WUYoRZdvKpugtjDj5qXSe3OQ70wHhzENk5
	wkX2g65hyt88vj2Vk/FWLXGA7HxkdczCOXXSZ5GfUgSIo+Q9Zhr1xllyTBWhjX+nKhxEzi6KWC2
	A+AnCEQIR6UNJQ9sVbjSegZSfj3DGW/gjfnNiCscTzN8jl3JwtygJkA==
X-Received: by 2002:a05:693c:638c:20b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-33e8ca260d7mr785967eec.18.1790117021798;
        Tue, 22 Sep 2026 15:43:41 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:20b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-33e8ca260d7mr785932eec.18.1790117021259;
        Tue, 22 Sep 2026 15:43:41 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258978sm1124102eec.14.2026.09.22.15.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:43:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:43:37 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 12/20] KVM: arm64: CCA: Add a new mode for
 supporting Realm guests
Message-ID: <20260922154337.0000762f@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-13-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-13-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -iOXgzfkdTlVLiAbZLwXqozHOyu4zmpj
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab3049f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=btJ7bRNyUFryZYO5LPIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX/MJcfrPd7s//
 6AuTjSScQUGc/Q/Uw4/EP8lS4X9vU8AV0RZTdQuD/ztw1t3sc7XNC5Ix0pJ9s0QTcbW4xY+zPQH
 wZP9tKb21Mrsz3ZqLObuq/BvefdtI707eV+grHlNfKV5mvPpUHmhwPPhc64s1MZilDfvBR8pJf4
 Zy0E5EzqDn7nKbbqi9lPrA5nCEQEnJYHhzitvlgl3+65y+8w00HTq0Vqo1/0tTVbPe0BdDLmZqe
 Z4f/WgvAjNHQib9uPjQlFUJDs/lM84I96yoKiigfu1SiOIkIEPlpX5u/MIGcpwCg+e4RgCNRny9
 9+62ALDZ5Bfi9dsJVcLiYZUbp6k4Rd/jR3+HJ+1m1rzXM/ydUKsGNWrhdMz7Ft7xjZKUfL34Axn
 P7LIkkw2aDRgMoxSJaC3Gf5a+gx3Sz59y+YZrp2KA1YiKJLq90l3dA5VazUpjL/y2Ex/XhqpG6o
 /roTJP6KbHEhWRnJfTA==
X-Proofpoint-ORIG-GUID: -iOXgzfkdTlVLiAbZLwXqozHOyu4zmpj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX1WT/SPi/lyne
 MsW4vMXXOTV+YQR2VXCIQQ4mKqopQSRP3JtX/sC+YVvGx8LJkI1sTdZfysTfU4Ac5c5UbXRKMH6
 NuLAWilAVxHPO+X7qMobtZvONWxzoLY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_154345_105780_1AEDFC7F 
X-CRM114-Status: GOOD (  11.99  )
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

On Sun, 20 Sep 2026 22:28:37 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add an explicit mode to support Arm CCA guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
FWIW given how simple this is
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Mostly given so I don't read it in v20 :)

Jonathan

