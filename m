Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C385CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzM2GkkjkDV3mB8NN84hl8NQXlztP2ZGMhnWG4sC68A=; b=W09l3bqWDwiYv3uJKaAi+eW0uf
	rQLbZEY7SJ/SH4Ck4oJQjVvKxVXfOAKhsiz6XKEtE56ucZWnQvE16SOg8EPnSKbPNOhrFiyfYb9HW
	1Cclu2InNlwuKL6rm55rQKHYq9TfV7SrNBbRfQEmjK9S2jQbqFsjMeGgx1+aA79qe5OHFrVzdAfuk
	OAm5zzH7vnR7aPN9NM+zMR5xiwPizqoMqaocbpkO9IpWkC5di+7k93iwTmyl4mOnJB8U4LmrxdkgS
	NdY8Atii0kfC07TUBcMhGFNsBYpzSMdI8jDxXQ0DhIdrJZmrbsYUjWRPNr9gR0ZMjA+IV4/051u15
	DuPCms8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEGm-0000000Gqy3-2lii;
	Wed, 12 Aug 2026 19:05:44 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEGj-0000000GqxG-44Yb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:05:43 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CH1uXe4120774;
	Wed, 12 Aug 2026 19:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lzM2Gk
	kjkDV3mB8NN84hl8NQXlztP2ZGMhnWG4sC68A=; b=HKVU7yMURi/9DPks1a8V1g
	Sw2yMXIUKUNNBSwmPPTo7lPjG3MBtNt2wC0ze4+G1/YLvmfalJdrZm1Wo1XACGOO
	XiMcWC0AUTp/VEnrAa0JCoQIUgkYE5x6jX6FwMQBMfZdgsvc2WCLQc/j7WzTNomP
	IVkVq/cb9G1GsiO35YN27A+Gx7YspvY8U/IyBjuPNBUozrvbC0tBtk8uVS13FAd8
	+xHFTY39yf9rjoD3qCqQNh5MsUYVaKM5XaPNsEqiqx7IvwPCTqQZ/LNer5l1ITcw
	PV2dsJIxC+HF8e68MhE2DHr2q7WQqkHCpBdQJOkmMsulBWdaDYOW8CGfF2gb3msg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvnwbb9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 19:05:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CIuKXV028626;
	Wed, 12 Aug 2026 19:05:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxfsjyjgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 19:05:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CJ5OTw47907160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 19:05:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 511B42004B;
	Wed, 12 Aug 2026 19:05:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4C0F20040;
	Wed, 12 Aug 2026 19:05:22 +0000 (GMT)
Received: from [9.87.128.143] (unknown [9.87.128.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 19:05:22 +0000 (GMT)
Message-ID: <88b37690-93a1-45d3-9a99-56b6afe26f3d@linux.ibm.com>
Date: Wed, 12 Aug 2026 21:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/33] KVM: s390: Prepare gmap for a second KVM
 implementation
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter
 <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik
 <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
 <20260812153631.3376090-19-seiden@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260812153631.3376090-19-seiden@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RsP16imK c=1 sm=1 tr=0 ts=6a7cc3f9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=S8B2aoqd-71-jbo-BzsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SjOFYKtYmoHRoJk8pdZmGV9gjCEuQ_ph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE1MyBTYWx0ZWRfX4G3s7tpKfv5X
 rNG9qs6KD/V/wVHia/Ez3p0xPVKBxHqfNxl7Cw5z4Ers8CdnGVnzX53z029VCiHvgD/chytC7e1
 f4glF6A/Mf7hFi+90j8H518HakGpMPaZFOATGgytrluYY6eq4NNHYqT0rYSR2Pt1P5bYNN5YAE8
 UHIQbL78bYm31e5+pCTuai6G7c0bzXSUW2o7kvAmJF+0tQUHPI2V1YpAGfJMKfri9yJ/CBeNDrt
 ZVDoiZmHfyJ4QuyMhcj2Z7x5vlVpJqd6cb0U8U0UbPDU24tejiNRJn59aFIIoJxgH4M9tPBQOla
 Q6R9oKT56uor0VUR4+8WRBfFhMwRwIK3GAzKIwpKCO4OKFmgqfWZuKjidzuPWfe0FHuI5668YA+
 r4t+lihE/BNqtMAPQYrB4wIKANeKgkVWxAGOjvCEcoU/22E82kuYRcfzLnSAYoUngEnzlsnKD5n
 OnOF5c4MJUV5nQ1A+aA==
X-Proofpoint-ORIG-GUID: PolOHNE7T5dYAZKAW2nEM3hE577JQxo8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE1MyBTYWx0ZWRfX0RMVrCU0oKfC
 Jatas2TCnsT4jh9Pb7EQEcLEs78xtX1pHVmmFfsLOdvu/OyqpnM0OFLaF7b8wcL8H129Tq08D07
 BgwEpgY6nMwktgC26gA5punlD6aSOJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_120542_881127_17B76CA4 
X-CRM114-Status: GOOD (  11.18  )
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

Am 12.08.26 um 17:36 schrieb Steffen Eiden:
> Refactor gmap code such that a second s390 (host) KVM implementation can
> use the gmap code as well. Move mmu code from s390 to gmap so the other
> KVM implementation can use it as well.
> 
> No functional change.
> 
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>


