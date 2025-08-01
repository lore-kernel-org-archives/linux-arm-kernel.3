Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49BDC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkA8li2kiIN2vGtrkJIcUMV8KNRLWYgYSUF6Y5Cmtu8=; b=qbwkmoTs7MeUcp4jobCiDl1UAB
	TY3sRgdzaZUeFT7SDvQyg+EcB/QLXcru1g52x9OioyImxhwzoSn/j3pYwYKVqARw0ngs3iIb9fJL0
	ecVL/lHZ7Uxz0KdmfkB00/m8ez+pX531vqEVxvJwPLnwZlY1fh7nhAvvx5b76vehQjm5KCti5kNVE
	JXSFQqMeCfPeCsMwOqrZEmUdj1xIPbWUSkfGIT9M9iBF63I/iFNosgFKNiUPTemnuLeLIeAYbM2X+
	kvHbfT8qjGCTvVrEiFYpEyufI0WiD4IJXHSXdzTXuZwMokYT+9Z2rVU4hkCU9fvD66pbx96HVFJrN
	MrSsl24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrMK-00000006JD1-1dFr;
	Fri, 01 Aug 2025 15:07:48 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrEW-00000006IIC-3WrE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:59:46 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5716IvQl015303;
	Fri, 1 Aug 2025 14:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rkA8li
	2kiIN2vGtrkJIcUMV8KNRLWYgYSUF6Y5Cmtu8=; b=Noh9TXzFBThGLqjh7D3rQ8
	N/jbdii9fp0Gp9bqHuilImpyPNQshICSIJut/QRgSJ/Ry49MNM/kmL1mx9pKWBzi
	GWf+hPehVoiKNKa8YBh8hGbbRFN1tPavLeux+Tke1LBDSur4xc/Kc4+/wNxOT4yh
	seSAZZsCkNRf8s5RgQolnm8CrdAtYTLLGwKBI6W2mSRbccMf4Zik0dmBxp3O4sJ/
	qHtgPnh7+uZzXEvTypJnAW3mJ3zAQeVa6dtBlzsfRNWrYOG3SHfkUcAG7kaEU6PP
	5VYgXjrhLrPlX6ejJ05v8/D+yZxXL1Ik8tizaEIzYJoPoDMKchtzm2X18LV3/WuA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qfr9bb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:59:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571B1JDA028782;
	Fri, 1 Aug 2025 14:59:22 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 485c231hdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:59:22 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 571ExLvo25297568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Aug 2025 14:59:21 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C97E5805F;
	Fri,  1 Aug 2025 14:59:21 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E2775805C;
	Fri,  1 Aug 2025 14:59:21 +0000 (GMT)
Received: from [9.61.163.64] (unknown [9.61.163.64])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Aug 2025 14:59:21 +0000 (GMT)
Message-ID: <51c32617-5283-4bb5-b881-2f95d0132a58@linux.ibm.com>
Date: Fri, 1 Aug 2025 09:59:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] MAINTAINERS: Add FSI bindings to FSI subsystem entry
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
 <20250731-dt-fsi-cleanups-v1-4-e7b695a29fc3@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-4-e7b695a29fc3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDExMyBTYWx0ZWRfX8kHrqhF4COX2
 7UnZts6lvi4Nz3aqeSA/kZPY9Te7UnLFP0Noq9OmOjNsecMVewyybNXoXgjFBU2cJ/LBqmOanJr
 qS7aoQeg3z9o58f/diWXzvcWdCl88V/V5spw/13A9rL/sjQTg0LJExGkpvm8WoGUHio7LqO+Hhi
 bkPbu7A1aUptWUP204YyjegXcuTOvtb8bd5bMhNRIWT2n94RREmb8hjZMGaoOhgZmbtyk32z2Qa
 LJJKRKoJX3bp28U5YKNqvKHPSpCQqFgdCitquDuvaeJBN1U8fROQr0lAo4EsyFEh3oBPOeUHAWY
 O88rYEWJ79O5S8bcGKmXsu0NhF/I2MdfIbbwJIqIL+bcbJ4ZyJUDiuK9PiXqw4JsqmDNkIYeA9m
 BpOEQ+JluRhYQr5t5Idx73xyLvsdcS40/xOVVNu+6vUOBBFy3ixfjITcBauchxCbjEPGAkTg
X-Authority-Analysis: v=2.4 cv=Je28rVKV c=1 sm=1 tr=0 ts=688cd64b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=voM4FWlXAAAA:8 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=cTLu4zB1kE6kTx7l-YIA:9 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: aTpJEyPSXWlFWEvVEbyq6mm8MZ2nW6Ei
X-Proofpoint-ORIG-GUID: aTpJEyPSXWlFWEvVEbyq6mm8MZ2nW6Ei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_075944_888943_A7FEDDDE 
X-CRM114-Status: GOOD (  15.89  )
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


On 7/31/25 17:12, Rob Herring (Arm) wrote:
> Maintainers of a subsystem should also be the maintainer for
> corresponding DT bindings. Add the FSI bindings to the FSI subsystem
> entry.


Acked-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..4a7b4656822c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9810,6 +9810,7 @@ R:	Ninad Palsule <ninad@linux.ibm.com>
>   L:	linux-fsi@lists.ozlabs.org
>   S:	Supported
>   Q:	http://patchwork.ozlabs.org/project/linux-fsi/list/
> +F:	Documentation/devicetree/bindings/fsi/
>   F:	drivers/fsi/
>   F:	include/linux/fsi*.h
>   F:	include/trace/events/fsi*.h
>

