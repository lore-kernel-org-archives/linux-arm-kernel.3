Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E65DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 04:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCbQYqZeLaUUzlcfiFVUrktZlR6kWo7lMTcRNRi7q2k=; b=dIdcJw3b3vxJV0c5yR1xVZ9PyD
	Ed6swXyKA1snJNmtwgwAf13ZWaxEqSpYxryB0hBeWfxPUJVNr0rwbo6j371HVGaNir1y/81SIDKmP
	4DduvcCdRjwFlUru466EegM5WjiGuQblnyojbdM20HBRaMQSOg8iW6JnftIbQdL3pQtEDmoSG5KVc
	bwDA5xI/X6nsSepEFKsLntMu+E7HJsgMi0hw5gco+jMqkVGuRgUBFCaTVt9f1JHbEAEOjFsvo5vOI
	s68CsInBA2jCL63+thu91cuc16XVdtoPdwmIDbFxjOSKKlSwIrUoL/x4Qp0EBd63j/iOu2avmhW83
	VhRpIyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3G7-0000000Df1O-2os3;
	Mon, 29 Jun 2026 04:06:11 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3G4-0000000Df0z-0G4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 04:06:09 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T3J2TT1992909;
	Mon, 29 Jun 2026 04:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PCbQYq
	ZeLaUUzlcfiFVUrktZlR6kWo7lMTcRNRi7q2k=; b=KrbqZAVGv5B6uDns16vHR5
	jHYCcGKpedVH4h9WJ2KInnslH6uucCZjIKVoh8j365rOmy8oFj3g3aAKLWFjEiwH
	nSWf3pk/A9F1x0GPNUOsFbHQpsgPWZTUKgcGO2U5E26qFdtsvQCmNx9uMF0sxtpq
	qw2ki567kVaHOHPEcuPVvrxa9d/JDXPLCV/S3DtS4Q7KvMFnUoKmKHRnhTeyQ4yx
	DOoRusfsX/PbmvCXLn285Soghgo7e5v9YYQnvF4P+SsMSAdlJP+zHSIY/5lFGrJC
	TMrehriqGAndb5oPZYWWoJooBYnC6dLVM3vonE1SLKGA2F/2CVI9iaSwcCBhRf5Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26req76p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 04:04:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65T3nk2h000729;
	Mon, 29 Jun 2026 04:04:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhy3ged-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 04:04:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65T44gtw49021186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jun 2026 04:04:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B036B20043;
	Mon, 29 Jun 2026 04:04:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D08520040;
	Mon, 29 Jun 2026 04:04:32 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jun 2026 04:04:32 +0000 (GMT)
Message-ID: <e0607dbe-4d55-4aee-8368-25110848bc09@linux.ibm.com>
Date: Mon, 29 Jun 2026 09:34:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
        will@kernel.org, tsbogend@alpha.franken.de, tglx@kernel.org,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
        nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
        david.kaplan@amd.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com,
        maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org,
        thuth@redhat.com, menglong8.dong@gmail.com, oupton@kernel.org,
        yeoreum.yun@arm.com, miko.lenczewski@arm.com, broonie@kernel.org,
        kevin.brodsky@arm.com, james.clark@linaro.org,
        yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
        arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
        akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
        yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
        kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
        thorsten.blum@linux.dev, chang.seok.bae@intel.com,
        tim.c.chen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a41eede cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=UTcEnaM7yftER99u_cAA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: brKsWx2Mn5cq22CSo7JfDcXigXZ8mboI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAyOSBTYWx0ZWRfX4wuecVrq54Iy
 09MuLAjOrz4oMF0mdeWXs+yPEw2RHZ5MEGeCZZQ7PFIZ2Q8tULLjM1jh2pAcB5A1x/txgTR5z2H
 QSarFRBtoBx1X2qhnmIT+ORW4AiRaEuNDfc0b5Ms7QwRNXFNSOs5xOZCLmsrFtQlCOJSsAoX0Es
 g3pLBjXT9zh22aSvrbk5nRCiXnLAyJEH3tq/6+hLw/6I6v4mNVjma2epz7cuMgHeoS8KcYkxA2t
 ju97JqZHRkjH1cHpkOUumvZ3ktTgUyRWdrxxvz9qrzkNX9TeQVS+liYC+4JvYJHv2OD/tqOR4iU
 +pnviHtig/I4k8R+j7b+rY1gPdjNP7incw4E2f6UxpQodqFJd16k4/OC0Tn/1+4UEbqkZdSO+1U
 rD6UQ6VzaLh4e3NICIJyfuiE9em7wPlXa/nDZkdlYqSQtkOXAZFGJyK8eoXXC173ga82W2waYLx
 N24t8mv2YzipMjc8t3g==
X-Proofpoint-GUID: r39Yr-mCbX02DwkQlbof5NCflo21fNWH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAyOSBTYWx0ZWRfX0dtp8M6P3xSX
 Km3HXGHO8viEhGwrt2g/J/kRq7WP4XqsyDiGB+S0dVDp2rKp8y4yYwpRenpX7AIhH324AS+c2+J
 ZvjCVjjjFhuPZCJJeyTNN2qdy6LcCWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_210608_253569_32D29C41 
X-CRM114-Status: GOOD (  13.44  )
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



On 6/24/26 2:55 PM, Jinjie Ruan wrote:
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS, and RISC-V. This patch brings this capability to the arm64
> architecture.
> 
> Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
> to boot first constraint.
> 
> And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
> the boot status at a per-CPU granularity during parallel bringup.
> 
> Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
> during early boot into per-CPU arrays to allow secondary CPUs to boot
> in parallel.
> 

Shouldn't this be called CONFIG_BRINGUP_PARALLEL instead?
Hotplug usually means disable/enable CPU at runtime.

