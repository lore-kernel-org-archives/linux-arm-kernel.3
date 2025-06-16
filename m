Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD2AC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzEMBKQfbOth254trg1UjOoAu2N6WgvTU8AuHLIkTJ8=; b=Wd3eATUbXN+Yh3oPRre0TBrSxb
	NS4dixEuEuK0DQAOkpr3b00RUZJXW2BIq1rCEmwxUsvM2D25Ar1O8yvqLModey56nisKlJGWL/ytm
	KdwYcGMjWvWqC1y0hDBTKeU1r0tf6/iNSbBVthwwpzGWBHleJsQLC7YgEhqDrf+qjfMLFrnCQGYI5
	wK56RDnZJ1gZ3tBrRf/dQ1D+jAJCVmvQYuxDvz6IyoDXYRf5yYd1ZBsH/UGA0vHb+/RVJz102BRK7
	8CtknSN75mr3GdjqvGjQi210RTs2aeg/YyVXL0GRPbvRKgA2LO6tMjRN2fkBQaMyasLavZDoWG12f
	+8lbUkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREa9-00000005DpV-00GR;
	Mon, 16 Jun 2025 18:29:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCZ3-00000004ywX-3ENg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:20:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8mNW8028015;
	Mon, 16 Jun 2025 16:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzEMBKQfbOth254trg1UjOoAu2N6WgvTU8AuHLIkTJ8=; b=mXF0Hh812A7YU6gq
	Zww6rQY1+2RmQrsnPJkBU13qDygBkyNn2apizimiSdpFeyJd02xNVZ/2wMon2oNg
	tARhW6EOmrGnlrMDZHHs6HFss3OVqrSNWh4mbft63HFJeLvp07m9fQKIJC7uOZDE
	okHGHcMh/iN3TMINrIYKbI/1fUhWbWHqJSXnulJ8pilcDAW0mnKJJObF38NhQmtV
	8c9Ivu9zv69GK2lGkLYB8xnoYiQvNgT5gSXh8fyOmbiP3zWCnlKcMcrfBgK26e/N
	BeU1xvGABpr/aPvvn2I96MLkiO6UxDL5ZqwB8FOgNY8vFJ1+TT68zX17KgaqFXcl
	KKDYEw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f756pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 16:19:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GGJQw2007814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 16:19:26 GMT
Received: from [10.253.36.28] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 09:19:21 -0700
Message-ID: <b47977f1-e5fc-4f67-a84a-3a4f881d5bac@quicinc.com>
Date: Tue, 17 Jun 2025 00:19:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [v4 2/5] arm64: tlb: Convert the opencoded field modify
To: Markus Elfring <Markus.Elfring@web.de>, <cocci@inria.fr>
CC: LKML <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
        Andrew Lunn
	<andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Joey Gouly
	<joey.gouly@arm.com>, Julia Lawall <Julia.Lawall@inria.fr>,
        Kiran Kumar C.S.K
	<quic_kkumarcs@quicinc.com>,
        Lei Wei <quic_leiwei@quicinc.com>, Marc Zyngier
	<maz@kernel.org>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Oliver Upton
	<oliver.upton@linux.dev>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Rasmus
 Villemoes" <linux@rasmusvillemoes.dk>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Suzuki Poulose <suzuki.poulose@arm.com>,
        "Will
 Deacon" <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
        Zenghui Yu
	<yuzenghui@huawei.com>, <quic_linchen@quicinc.com>
References: <20250612-field_modify-v4-0-ae4f74da45a6@quicinc.com>
 <20250612-field_modify-v4-2-ae4f74da45a6@quicinc.com>
 <3537a4ce-b5e8-44d5-a884-70a81562068d@web.de>
 <94b40ff2-9e9e-4eea-8a66-87d8976aeb70@quicinc.com>
 <9b7e7e8a-c070-46e4-8e77-25117ec57de4@web.de>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <9b7e7e8a-c070-46e4-8e77-25117ec57de4@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNiBTYWx0ZWRfX/mIpZ9we1fKz
 wIPctTopq6ewPjc2scxgB8DtMZsfeMb6A/xR8uZnDJgrlfpu+3UyK3CBYNQUh/pi5JD08nFJSKr
 OncxWboOb/csSEVE0tKJIC9bVb5y4rQxkv/CvncpavgGmrNPd1eBhEuaqjYRYGf+8hFDqldy5q0
 Vok4Pbu4r73Ya895Pd/zdllTBGwOYHu6Gyjcs3H5JqBAYvUhTQngSgFmewSsbovlC9eFj1Cr5W1
 DdFSYNBwEu2Odl9MDJMGhn5X+mvf1+N59DlptLImBj+LAN9G7wUnlV8GIjdGWDpIkmkH123DaTG
 SDYhWJSUb3rqF8I+AsqnmKuMVrIX/ctNkQIYXyM63OFPnoavc3yPCgZbivjzgf0QNoois/bkJ8n
 3cHakbOMOUPxiHtDrotGm7CYqgiKCDssOO9WL3WBG0/OUMF1xRQPHlkTQ4SCdX3ebjX+3i+m
X-Proofpoint-GUID: 1sk1ogn38xpxhVGh1T8DbEdcesUyjhTt
X-Proofpoint-ORIG-GUID: 1sk1ogn38xpxhVGh1T8DbEdcesUyjhTt
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6850440f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=RbIoU5Ni8US5FD6EvC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_092005_933916_2E46BF38 
X-CRM114-Status: GOOD (  10.43  )
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



On 6/16/2025 9:52 PM, Markus Elfring wrote:
>>>> Replace below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
>>>> - reg &= ~MASK;
>>>> - reg |= FIELD_PREP(MASK, val);
> …
>> I will review the generated message to improve the formatting as you
>> suggested, the next time I use it.
> Would indentation be more helpful for the mentioned code excerpt
> (instead of trying to describe lines with bullet points)?
> 
> Regards,
> Markus

I agree that using indentation would make the code excerpt clearer.
Thanks.

