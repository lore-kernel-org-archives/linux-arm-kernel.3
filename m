Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B35C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cc6uhBZa+QEXX/Qb71ytouO88dLtvjhvhRyBBx7gsWs=; b=dH74LsZIN/IaNpBPcjMkJ4T/kS
	Gffehgm2zW0tNRgRDuIGRBzjkrVHGG5hE7K5GpTD+ZLG99UgKyEhfSsXXmBlALhagi66bkxEK6Bjv
	Tl6QOsEo+hHPF+PejJNePoMMV+72uPHZlk8K8A/yQ2vs4FR8xpRrWrn2WcU3T8fHw68Ng+1sxC3Xt
	UrBTjsk4Y02iu9esgNCSSd4YF4ovb2YU9D1rc6Mo60vvBv+5olSzot1kACaWXcDeWhZJZvhzb08ic
	OQ+cJUoOT879EGAnB9Ynmfv/u0sB8weZiTVFoK+YXS+G2ikwL9OAdwomIPXpX9kfBfNKjoPA/1xkk
	GHz7hV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchVE-0000000CCkI-0iJA;
	Fri, 18 Jul 2025 09:35:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uch8k-0000000C8iK-12Io
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:12:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7cZFw022401;
	Fri, 18 Jul 2025 09:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cc6uhBZa+QEXX/Qb71ytouO88dLtvjhvhRyBBx7gsWs=; b=eITdS1Wjo6OiS+PL
	qFdwJJ08m5RUcrnn3sKT+gEzNsa0IvNxUcif2/mduaLVijVQQYhmRDds36iHSbsK
	QOlao7IwzEOXQoSRlsNBvUiwmtQoVfzIfFCPU5ot7ILFpzxY/81HQ/hprvhgHNMf
	Bzbr/FXp0qnk5yT/OvtdIpEUkXMCautSRJRPSoCZ+IlqbXRjOfCdL3Ayv/T+Rf/H
	Ufxlb4vgMLTtWXLvzl7eeTYaCWELf5dWkmbt9qtaaBRh5ZDEoOlX84F86ayGRJt0
	yVYg/zg4wmHshzyNjhW/Ea5no6bq1dzORkUSnkFDaSyvKW/1Rgw+YzK1LP5MjDpQ
	7/VjwA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyavtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 09:12:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56I9CG8q013258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 09:12:16 GMT
Received: from [10.253.76.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 18 Jul
 2025 02:12:10 -0700
Message-ID: <2f37c7e7-b07b-47c7-904b-5756c4cf5887@quicinc.com>
Date: Fri, 18 Jul 2025 17:12:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: ipq9574: Rename NSS CC
 source clocks to drop rate
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
	<robh@kernel.org>
CC: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-5-f149dc461212@quicinc.com>
 <20250710225412.GA25762-robh@kernel.org>
 <93082ccd-40d2-4a6b-a526-c118c1730a45@oss.qualcomm.com>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <93082ccd-40d2-4a6b-a526-c118c1730a45@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX3JmeaI0LT5FI
 uz7mN8D8nDtHvumEG58B81P67eV3jDqu6eiC/Yo44PdVN36nakuDbvpzmZtCnx3i6e6SRBzJGaB
 r3kz3pXYqLNA9GuMZ1NUFZqtID5asWmUiF06pqtA/grTBJMzdlkhXDOk5fDyxn8GbyicRpHXctH
 zB8JqLHq05+COqiwuguKyV3L5trkjwh8OwIDTzEPsDXvemeCq5HGRVVNYznKLOHaO5XU8uVRJvu
 zkB/GuayFK2tBG426DNkg1JYZC4A+yjL3f0oyX1YrDuiJCUgcZseQ3rJzsNaWNJWsqZoY8mdZly
 /HnG9HSVA3LD3uQ9+qTdLRRbLnYgVem6hdNXtzQ+kkv9KBXQedjVGydmks1hdlHhbyfj0Vvyqj0
 hSGC0X5RHK9I6lECV6WdvfwmlgL1nwl6fElWVJKsghAxwpmOC352jTS7OK8LYmTw0Te9rMN5
X-Proofpoint-GUID: CIAh2fAIHPX-nVhQkxfBjm0Ybtf69cNn
X-Proofpoint-ORIG-GUID: CIAh2fAIHPX-nVhQkxfBjm0Ybtf69cNn
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a0ff0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=1Pu0kYrAtJ1scJCjQtgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_021226_290860_6FB7ED81 
X-CRM114-Status: GOOD (  15.71  )
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



On 7/11/2025 8:15 PM, Konrad Dybcio wrote:
> On 7/11/25 12:54 AM, Rob Herring wrote:
>> On Thu, Jul 10, 2025 at 08:28:13PM +0800, Luo Jie wrote:
>>> Drop the clock rate suffix from the NSS Clock Controller clock names for
>>> PPE and NSS clocks. A generic name allows for easier extension of support
>>> to additional SoCs that utilize same hardware design.
>>
>> This is an ABI change. You must state that here and provide a reason the
>> change is okay (assuming it is). Otherwise, you are stuck with the name
>> even if not optimal.
> 
> The reason here seems to be simplifying the YAML.. which is not a good
> reason really..
> 
> I would instead suggest keeping the clocks list as-is for ipq9574 (this
> existing case), whereas improving it for any new additions
> 
> Konrad

Thanks Rob and Konrad for the comments.

"nss_1200" and "nss" refer to the same clock pin on different SoC.
As per Krzystof's previous comment on V2, including the frequency
as a suffix in the clock name is not required, since only the
frequencies vary across different IPQ SoCs, while the source clock
pins for 'PPE' and 'NSS' clocks are the same. Hence this ABI change
was deemed necessary.

By removing the frequency suffix, the device tree bindings becomes
more flexible and easier to extend for supporting new hardware
variants in the future.

Impact due to this ABI change: The NSS clock controller node is only
enabled for the IPQ9574 DTS. In this patch series, the corresponding
DTS changes for IPQ9574 are also included to align with this ABI
change.

Please let me know if further clarification or adjustments are needed.


