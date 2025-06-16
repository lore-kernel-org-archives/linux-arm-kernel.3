Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490A4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ISiqlgdeklg0xXzY7P5H11qqfuhoLzTN1XNx0iDv88=; b=MjjLiXaOomZVKGSMcU7pKQaSTZ
	VzJHzgBDUmVsGG8IhTjtb3J+iaIClWXPNfX2jqxXOgA7fSJ5XPJA5SB5w+8ZbpBfTFPTE5PhAlo5d
	KT8WCXX+G4WBGTMa9LjHyv6KtYHpEqdFR42hqDCiJHbnvoGJVeNTso93iGA/sIrbpmKABRj0IsYkZ
	wLnhuCd0lsv3A02Cb7wyIpI766i2JE4lAH37EoU5B+7UnopmTqNHHndLGk9eRS06q5bS0ALOAeo3Y
	ehsUir8vWXAakIpUlK3R2fNzjU6ki+ZicTaVjuVZv8J3+QWz82YJOxjC/6j98KFcUBSHwW4F6xbGk
	KHM8/AjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Ku-00000004Fc9-1pMH;
	Mon, 16 Jun 2025 11:49:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7EL-000000045eC-20tg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:38:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8RcXP025023;
	Mon, 16 Jun 2025 10:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ISiqlgdeklg0xXzY7P5H11qqfuhoLzTN1XNx0iDv88=; b=SLaYQj5FwcUd7Fkz
	nVcDL4oy7JsNIk8h4D4ljzLxsZeqaGlKMyWIRvgaUgIbaIv9ms7RUw7iJ90t9AEs
	nSyDP9zqEsUX1FsXKYQv3yDfziMvz+AY1F6QgqNXnH0d2aEQhDoEv9XYcD+DFer8
	oeGoF/eX96okIzWFF1oXmIO6yaTXVAelFLcOUnVuuny4XaK+GPNVIftYlEMcJCfd
	eNJM/1Te4p7V00LmEQV0VWkKuEPFKR+eVYCjN4ublb5u2sp99HVWZdlBtkPRilAw
	MVqzDXiePL6+j1TRF7NjE+GdNlW2Jx9aU60jSz2ncxrPRmgnK47nMhsf/b/60io1
	Viq74w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f745ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 10:37:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GAboPm025787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 10:37:50 GMT
Received: from [10.253.8.97] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 03:37:44 -0700
Message-ID: <94b40ff2-9e9e-4eea-8a66-87d8976aeb70@quicinc.com>
Date: Mon, 16 Jun 2025 18:37:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH v4 2/5] arm64: tlb: Convert the opencoded field
 modify
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
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <3537a4ce-b5e8-44d5-a884-70a81562068d@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2NiBTYWx0ZWRfXxL04GAagHQk/
 iEBZ6i5zu1j3cfjMK3KLHbVCqeDrf9/G3eQRUWTa19X7cTJXtW8z2nJIt9FPHw4MpLCdb+ZNbj6
 0xvZY710scyODKuCUU7fg166gB922eWjk2Ja904dbfhGzZnQfq9LpC9XH14esfAa6NQTLH0NSGg
 aP7qk4r6+3Npd7hld/6BaK7Sg9PGsqGAgnp5J9jyObQZgaK3vd2KwnLsEQ+HgRs2HKXJ8Ejrcwp
 c9/QC24nqe8dMQnkFnSOp3luLJsaU1zIaAaE9InlzlhUif9cwGyamJEBghnotr1/ExSEHnkgV0b
 ETz/4V2QaCtZSiflKcBnn69YZR61zRrj6Ape/lHYj7Z9sQFOvI/ur7TH5z7/tF26Nl4xJyqYVw+
 V9UCAFEgOjl0Ucmg25eMosVMn2Xs3tCGrymwDYob3i7SrT79VzWhKK2oZbpYoUZuqkHCllv/
X-Proofpoint-GUID: yVUHwgEeVxAwRXZvEU52f2yZasbGvHsw
X-Proofpoint-ORIG-GUID: yVUHwgEeVxAwRXZvEU52f2yZasbGvHsw
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684ff3ff cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=YgwN3AOMAAAA:8
 a=wkcNY_LD72BEM5X7UyUA:9 a=QEXdDO2ut3YA:10 a=ztR1XV6QG-NWxUt1dNgd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_033821_643631_7ED29349 
X-CRM114-Status: GOOD (  14.35  )
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



On 6/13/2025 4:15 AM, Markus Elfring wrote:
> I see further refinement possibilities for such a change description.
> 
> 
>> Replace below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
>> - reg &= ~MASK;
>> - reg |= FIELD_PREP(MASK, val);
> 
> * How do you think about to omit leading minus characters?
> 
> * Subsequent blank line?
> 
> 
>> More information about semantic patching is available at
>> http://coccinelle.lip6.fr/
> 
> I suggest to omit this information here (and in similar patches).
> 
> Regards,
> Markus

Thank you for your suggestions. The current commit message was generated
by the following patch mode command:
```
make coccicheck MODE=patch 
COCCI=scripts/coccinelle/misc/field_modify.cocci V=1
```
However, as I understand, the discussion on the ARM patches (between
Russel/Marc/Yury) has concluded that the ARM arch changes may not be
adding value over the current code, so I will drop the ARM patches
in the next version.

I will review the generated message to improve the formatting as you
suggested, the next time I use it.


