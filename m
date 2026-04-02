Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3E4D39410
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 11:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=134Al/W95knRgbclnuh/o+ul0rtxFJ1H52x/sjCobRs=; b=hk1vNRqcUi2PIphztm+uPSZwSs
	FAHJzyC6KnUivkc7caScu9jyAmzKpt+xwFOgAFq6D966EuM38FYDQ7Kyn8FEelHWxwREjjhWqiTvn
	svA/MLOU2SQ+XdrJuW7PUjf8Gg5uCsBIO8uzFL5pXr25Ti/NVu5+eXmCcLKJcF8zzdpgWVW+Cj375
	IWyfAKtCADYAM3QnEyPBRQtpvmaN7yk/eoP1bfMH3e2ERJjCQJkCxb5tkhPhNzwZZzj+A7sX67sXH
	V4eVACIIrxunYa5cBt+sxsKp3pK1XoboUqFkN5MGomWgm+nuVfGbTYJeBU3K0GPlTQf8rF/X0F0hn
	qqJGyMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GCj-0000000HWhf-1wvr;
	Thu, 02 Apr 2026 11:27:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GCi-0000000HWhR-0vft
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 11:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=134Al/W95knRgbclnuh/o+ul0rtxFJ1H52x/sjCobRs=; b=TP1KHTbwMT+k01V0VZnyC6XHrH
	IasDkAWQsq8eFesbp+hq0Q6570WOo1er0Uenl9RhJjd3zZBwXu8+1ch3Jq1IpNMIhIpULVXlNWmW7
	QPmtPaSVctxU+uo4S8skrBYVARNshR/cpO7RxVDGIXlcFzDYgbR8u344MeK9CJLvy4siye0LkX1CN
	Xz3NM7ABv3xqc3T4yKAxIvUwiuBr8ouzmt/6rK6cMTdmk9tqYqo9+eW9FCmMkLJWyjyOHKNr96pdX
	11JUmz9LGbQ1/gJ9/9jnCDNrWYqxjL9GjmJAtc0345Phc5O+LjSnS3QjPklJWkWWvd3PeeNCPGhV6
	gCAwnkxQ==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GCe-00000002KA0-3mnD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 11:27:15 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631K0WS7351518;
	Thu, 2 Apr 2026 11:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=134Al/
	W95knRgbclnuh/o+ul0rtxFJ1H52x/sjCobRs=; b=YgF6jzFipfEyAM6zl5a9Gx
	VzeJCcS4/lv3Djnz20DaNE7SeZZ/o4F0zBHs8qcfU8R+A4XbnHDonEorOHLKLd/Z
	kju5XBFDccNDppwQbDtzpjg7kAgvQPul7NckWK8cupN/675jwZsnZr06hwuHhkyd
	+c/gNiQsMoiK8GscB1oFx2cLrQ+1g6wSVmazTkPC9Kuh86vR9xLaSCF1X8d978n5
	EPGQfQS5goZAl2KiYAnGGvnsLXcBBV765e/zfNi40tCmWSmqg0h1nFhmDKroog04
	c1BxkHhaGfcOdL34LQ8Ngz82zCKTPKjvBfxhT8oES2RK5x6U4+NmkTzA/Vkh0ItQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d66g24jr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 11:26:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 632ArD3G021651;
	Thu, 2 Apr 2026 11:26:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4d6sassy7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 11:26:57 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 632BQscG47448446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 11:26:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CE7820043;
	Thu,  2 Apr 2026 11:26:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB71920040;
	Thu,  2 Apr 2026 11:26:53 +0000 (GMT)
Received: from [9.52.200.39] (unknown [9.52.200.39])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Apr 2026 11:26:53 +0000 (GMT)
Message-ID: <c251ca9c-6fae-4f64-8e10-792f42872582@linux.ibm.com>
Date: Thu, 2 Apr 2026 13:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/27] KVM: arm64: Provide arm64 KVM API for non-native
 architectures
To: Marc Zyngier <maz@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Andreas Grapentin <Andreas.Grapentin@ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
References: <20260402042125.3948963-1-seiden@linux.ibm.com>
 <20260402042125.3948963-8-seiden@linux.ibm.com>
 <86y0j53caf.wl-maz@kernel.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <86y0j53caf.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Fdo6BZ+6 c=1 sm=1 tr=0 ts=69ce5283 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=z1V4dRcsYzbvUw6_Kx8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HI2DK5H5wC6ad5B9YnVOxaWLprzdU9gx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwMSBTYWx0ZWRfX3nF5lxvZ6dE7
 FksS0fkJJanzuKM/mt/NzGShaEpUwNpTTBXziUvh2Pow3kPl5764MGt4zfosBudNpv24oVRUgYm
 jsbDHWcjLBJbNZk3kJ7PVY8LXySqOGWIOAm+PZn2Aovr1NWSyzfYZhTcAenA3VqwSS6JUGKKGm+
 NNEbXsLSHWEtDhn10yivwV2WYfTvDee6b/kMbb5xKbjJ2G2XTGbMVJ7bmespGf2xVMg9dfL3arj
 WDU1Iwx3DufEC6KPvPDIro2YCFANpGSJUbFflqHm3N1xR4l2AOIbXrrSQw0RaqGRaPXpuaWTt20
 JpmIB05IXepBc/StFDQ4V4HA3cDs6NT7lMbpjCaop0BAVPvKsyDeRZ33jTgElh8zGAWHLUevM0c
 kNgyp6gBYPStJwHraQ5Lte2qhmrtY7AEVjkaAgnAlRB66GpJQjJNwn1Hy7w4j+PKSfKoJPeFNX5
 1VEz6vTWPXj07uBaw7Q==
X-Proofpoint-GUID: HI2DK5H5wC6ad5B9YnVOxaWLprzdU9gx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_122713_491230_C2970567 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Am 02.04.26 um 12:08 schrieb Marc Zyngier:
>> +static inline bool kvm_supports_32bit_el0(void)
>> +{
>> +	return false;
>> +}
>> +
> 
> This looks wrong. The original file still has:
> 
> #define kvm_supports_32bit_el0()                                \
>          (system_supports_32bit_el0() &&                         \
>           !static_branch_unlikely(&arm64_mismatched_32bit_el0))
Thanks for spotting.
Yes, we will fix. Seems to be a leftover when sorting patches.

Christian

