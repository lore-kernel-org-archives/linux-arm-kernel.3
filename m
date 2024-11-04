Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA985D111B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 21:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdewSeTalDhtOcLJsoqnljsUr3/ztd7Lz3JXE3vL+X0=; b=fryXWs+i6HfTW9IZQIbfX8tSTR
	ui83ohfTiRq/mRXznepidyjYj7QVn36YRlkFjT6miAwIf8Yq2oleCs9kRUEyQgEEFT63ob5KBSK2U
	hpl3YzS+QEq/wgS1IZbsg4GVfq1IlxFTnqBZPO1465EkLOtz7SnY5NG3YVNP2TTEjvt9GQKOVYI8r
	bGpEQ1DGa0m0enJ3QZ4NEikr7ypWyker0ctea+WhiiJg1qj2YdlGqVmMY2LKcqcfErzFkCrZeRprM
	p7p1p7Z9McUVjzB65VvJ0QUus/WWHPy2qZxEKKt+EVQpTsdQUlgWl0rA1G9Lk/w/+LuIPfcZryG6B
	0STF8moA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84yt-0000000FE6S-2u4T;
	Mon, 04 Nov 2024 21:51:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84x2-0000000FDnH-3Scm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 04 Nov 2024 21:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hdewSeTalDhtOcLJsoqnljsUr3/ztd7Lz3JXE3vL+X0=; b=NdSZZ6gAoYM+FWfIoOSsH59x2n
	jaGMMDKmmE0p1/pScyDBbbqXn7w36umK1J1Bmhwnfg3l3MsTbQpz8tD9VT6gGSPfsw0rsYDgTv3Q6
	ppkPJDnJ4KRQpkZsoma+5RGt6ffAWJQVfBiLXp+7zjwh0yJWPKLZaKkoUB/x068zdD2HNrJbWE/Xd
	ENyg3d+mCIqRdT9BQEW4kBRoKYl63o1tMPYRaubLgo11mF2ODvF9+n32M++Ytn4xTPO7cqaAc+P/T
	ZaHZabjjkeFDIXuDqQD74sQIHqr7CNEipsceKhlZwmsGXNHWXI3aKYP3bq2ljp1NlLgPJLw3hMsyi
	vyo7f9pg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84wz-0000000BaXL-0Ytb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 21:49:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIoAM021589;
	Mon, 4 Nov 2024 21:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hdewSeTalDhtOcLJsoqnljsUr3/ztd7Lz3JXE3vL+X0=; b=QgU7/hbyqCQQYFxZ
	4JVW0m6daLV78oA0mqQJJ1Lsf5t+p7xLsOcoQlFwf6gPlex5kBH4ZIXMm2yJlO/o
	UF06dKN983NsXXM0y9ievvPGdNfBXPqU5uKIOBZLOAo+coVCvxeXt2eihf81zW/y
	j8dI45HYfB9Pt67gFRfHF67gy0YJE+fMKgN9VJqdN+ud6YLztE/jzOUkB1jtuA6e
	11cbOEeBInHd4u54muW1kOLfbCtjysIHc0Q0mRy/bTg9tYMy6IXG1ZbNexjaTEpc
	OciLrN1ZJamKIr8SapJtSg0fL0HzgDx6FyDIQD4eW6A52UHvHcD9iiyx1KbpLBSp
	5ZOE9Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxwgyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 21:49:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4LnB35000548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 21:49:11 GMT
Received: from [10.110.8.191] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 13:49:07 -0800
Message-ID: <f2de77a4-d457-40d6-9651-66c2b24af378@quicinc.com>
Date: Mon, 4 Nov 2024 13:49:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1] net: stmmac: Disable PCS Link and AN interrupt
 when PCS AN is disabled
To: Andrew Lunn <andrew@lunn.ch>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Serge Semin
	<fancer.lancer@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Simon Horman <horms@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>,
        <kernel@quicinc.com>
References: <20241018222407.1139697-1-quic_abchauha@quicinc.com>
 <60119fa1-e7b1-4074-94ee-7e6100390444@lunn.ch>
 <ZxYc2I9vgVL8i4Dz@shell.armlinux.org.uk>
 <ZxYfmtPYd0yL51C5@shell.armlinux.org.uk>
 <89f188d2-2d4e-43bf-98f3-aae7e9d68cab@quicinc.com>
 <5e5783f0-6949-4d04-a887-e6b873ae42ff@quicinc.com>
 <bc891f4e-4a3a-4664-b52c-871d173b7607@lunn.ch>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <bc891f4e-4a3a-4664-b52c-871d173b7607@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xi3iw7wjqsh69AY8gTh4haDt0C0NFoyi
X-Proofpoint-GUID: Xi3iw7wjqsh69AY8gTh4haDt0C0NFoyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=535
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_214929_717904_D9632B4E 
X-CRM114-Status: GOOD (  11.13  )
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



On 10/25/2024 5:44 AM, Andrew Lunn wrote:
>> Serge can you please respond on the PCS support in stmmac ?
> 
> Unfortunately, Serge has been removed as Maintainer of stmmac as part
> of the Russian  sanctions.
> 
> stmmac currently has no active Maintainer.
> 
> 	Andrew
That's very unfortunate that Serge is removed as Maintainers. 

Andrew, I am not sure if you are the right person to ask this question
How can i proceed with this problem ? I am kind of stuck now. :) 

Please guide me through this.





