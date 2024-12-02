Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D8D78332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZqfzFnoinYb8hXvyVjaGDwr8pEj/sloniKe/f3uz+A=; b=moetsdPuNyBmtS2i4hJQL6jGfY
	D4J0n5PND67KFfn6JvpzJgn7Gy4xMc166KZJiAvLnYNKqBnJiByKuSNTcpP/LqEXMYLns5/feiJO6
	pkI50VJVmoGgHmGCcjk3ugX3QgZq7GGOw6mf9q0renOBMIUsX93rQL6UwGr8qM5+QGQyUErtDONDS
	QpKFEgTtyfVyZaa076MgJe6j+0MR2yL1+ImqAzbhbGE8huyzH6JTAtg7jsd8ljyDI2BrCc+tGtw5A
	fjPVXQ6eC7uzVWZr8+B4VbO8gpNQhvNI5c34TUliiPm4cMlTbO1Oc+zPi6BIkeMI0V8egDEPnd0Zh
	0lb70e6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8fT-00000006il3-00YT;
	Mon, 02 Dec 2024 15:48:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ct-00000006i2i-17YD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:46:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28lSlB028149;
	Mon, 2 Dec 2024 15:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZqfzFnoinYb8hXvyVjaGDwr8pEj/sloniKe/f3uz+A=; b=C4TYS1Ustp1jxs60
	Wtgd9JIg1qGQJ7DehkReoJC65U4n8EpfxICVbODI2QT1lSzYwKSJQ5Qg2FQY1xnR
	W9pR5H4Y+2wYiTnelH/OyJ5tPLxaMM22ObQCGHVI8aOHYXxPsVScWVolPC/PweBd
	x7VNV1+Kvq4V6agMNJWwUVxEHNfevriJkiDGBjHAwGZN8/zeivADnBLJ4HKK4Q/L
	2kHE2XxH+29cvU2tHrd6U5KgmPF1QpOm5yDdHyfzMf43A72M2UiFMTdYIyDo1T6U
	7+Mi85ZjzNoi6dvjGqqSQRtK/ZLSMCqIviQJirzmnk8w9GU/llobpIA96/PYiRP0
	Ua75vQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mwgtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 15:46:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2Fk8K0029779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 15:46:08 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 07:46:07 -0800
Message-ID: <626c3135-9d8a-4e22-a3ad-6b637cbbd463@quicinc.com>
Date: Mon, 2 Dec 2024 07:46:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
To: <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>,
        Sven Peter
	<sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Dmitry
 Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>
CC: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Janne Grunau <j@jannau.net>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-2-76cc59bbf117@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241128-z2-v2-2-76cc59bbf117@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fkhK5wsaq_hXSjnF0-8oIRRhsx6pzl93
X-Proofpoint-GUID: fkhK5wsaq_hXSjnF0-8oIRRhsx6pzl93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=870 clxscore=1011 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074619_431385_C68C9B74 
X-CRM114-Status: GOOD (  10.19  )
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

On 11/28/24 14:29, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
...
> +MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("apple/dfrmtfw-*.bin");


Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning when built with make W=1.

Please add the missing MODULE_DESCRIPTION()


