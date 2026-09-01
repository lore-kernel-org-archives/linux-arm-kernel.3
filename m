Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B122C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWc0GQHv3zwAcvIhcs8TteAqLnwKxLN4AMKmaD+lWNk=; b=1G5Z1zZ+hlVaO0wl8l3aiBeYcv
	HcYzIcKiSd5WusF3WnWS78XgPZt+vlHelmNKAM3MX5pq9pfzIC/uG5peE84VSXq92cCt7sR/6wK6S
	T+8VDhPPOjv8gJiePtEWzU5YI2i1TeLdPWL9UXzhMReJcscC4coHwB+QT9Xtl7Ky5HkLvKMFwoxHG
	hKdVinvw+bmpEzxlkChQPLDLO49ET5mm0X3LDrEzruolqA3qB235OVid90dSvsYafX9Wy/R90ZbC5
	5Rxdk2QjZzY66PMlo540KGMAVXmI+S0Zwk2tOhlRd0ehD3QKHgMAbM+5oj2OvAGvMa6ihKjT2AWmK
	BLRgi8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J6H-0000000B9BW-0QG9;
	Tue, 01 Sep 2026 07:40:09 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J6E-0000000B9At-2FMY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:40:07 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6817Vhjd579474;
	Tue, 1 Sep 2026 07:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=XWc0GQHv3zwAcvIhcs8TteAqLnwKxL
	N4AMKmaD+lWNk=; b=qMwY5wUr/YnNsxL/1ISSbD8q+hTp/p/4QHq16L1qBUfFKd
	7Ewtz5ru40dNnQffis0PD2FYYSLO0SbnWgSGkf/VSKny8XEN1eyfrw9gKmg0Jx9n
	k43VJWNl2MzgTmJL6/teK5HZ3urFr1tsUQmlrWjh0znM8bM1/m4foblW6qA7+Hjv
	CcaFSQ977exlZJcLxMXuoNvTCJs6DbIORJ1m2X7sb9e9t1Say0Hc1nyNWtuS2PIu
	UzuJHYQrR7Fv6cTxrixlQcH31Hb7koumGZMaXr1PSWjraZuFr2e1jc6tHLrnKSoY
	ZIxiTn+Bu7K2nou6QV+YBIm2ifNoJWyCxSTTxDTg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbpx5edhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 07:39:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6817CoUv027397;
	Tue, 1 Sep 2026 07:39:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcb8had04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 07:39:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6817dk0G17367378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2026 07:39:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DAC620043;
	Tue,  1 Sep 2026 07:39:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ECEE20040;
	Tue,  1 Sep 2026 07:39:46 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Sep 2026 07:39:46 +0000 (GMT)
Date: Tue, 1 Sep 2026 09:39:51 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        kvmarm@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: selftests: Test empty SMCCC filter range
 at base 0
Message-ID: <20260901073951.185345-B-seiden@linux.ibm.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
 <20260829054856.70549-3-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829054856.70549-3-kmehltretter@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=PPc/P/qC c=1 sm=1 tr=0 ts=6a968146 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=W70r8alv7qqp-a3mEecA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 2P8aUw_CV8LlRSgc_Pvmp2vlQptgIYHY
X-Proofpoint-ORIG-GUID: 8n_R40p4sl9uWDxLGMXuorUWRYv-2vV7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX4IJxqnbD2UC/
 4OdTcIEwLrXHZ/8kOb/6c/al6fG9oZb9sYtHsZwo1t7xLtHg4VACP5XRyw02oPN1hGt0TzjZMuz
 7sjK9w1JvfELuaKBvYiY7tAOITf00lI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXwBSbsjy9Vipb
 w+GWMUtZxBCB2N693nCfcFTsNjNX8S5fosfGbJLaJ6jf6UWDiv6u1120qkzHS7Vg2JabJuTAmeq
 dOdCLk9HRkpiQBl7tu+7PplXEoeKETix4BDMIpPjqHnDkmxiaGXuK/ckz7CSw/z3f3qu36rbGKH
 BSdLLIluBOtelM2m2SxwX8VlAYdU43dpvnR9gQq5QVkWTmB50wzxuKDsorybrmI+SzteB7fypA4
 lm1/Zt20b89DsUGol6x8S9KpTiL21+0WALOgkNXDoZm6g19NkEBo5yOCtViUbhSWNwWZII49cOX
 wIqJ34x+D0un3lmQ/yg8N6gLFhO+8QrVLuX8a8c3IZEeJqz07pL3/aQ0nCankunjUbRuGUYYuGG
 SFlSvOozATgfDhM4Wcr7AROd3SvHambAni7LIX/P3WTs5iIotCB2HcSxYzwZ/WU5tgOloyeGPQ2
 TsgtVE1ScHalUzEKLNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_004006_580135_38C9521E 
X-CRM114-Status: GOOD (  13.61  )
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

On Sat, Aug 29, 2026 at 07:48:56AM +0200, Karl Mehltretter wrote:
> test_invalid_nr_functions() only checks an empty range at
> PSCI_0_2_FN64_CPU_ON, which KVM's end < start check happens to catch.
> It never exercised base 0, where the inclusive end wraps to U32_MAX
> instead.
> 
> Add the base 0 case. Without the preceding fix it fails with EEXIST.
> 
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>


