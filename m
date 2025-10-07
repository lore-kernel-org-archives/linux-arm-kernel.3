Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E716CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llIeV7D3qZ9EMXJGYTsCRVvmxarIGOFyzxq3f1h8DLw=; b=ZZqz1Q25700bKSJI0fz8QX9pBU
	WC3VSYkKKGjssQeomsbajTWaJxD9wYK/MKGdNDcKJ4JRvIDOUNZHm3CEMnL/b9UpgdaJoStExGE4k
	zZOo5qW62fORQh+3b/7FZXtDhpw3cnGH8C+YCE34ykU719XZ0afzWz/yn430dqfdbMlHHSRPNDLlC
	ImjOHa6LO4PZbjp9qtum1fjtpVqSlieFhu2FZkphbC4HYc18i5Gqh0lnkTexAz7ku1JFlk7iYXshq
	EB3Ez+OvSmx0mWVppvHkKOsZwAoN7pMIjEtEr1hTZoDoe0HgQFYO3RhwDaA85xWqOUE4ob0DC0sko
	ZRAaQNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Xh-00000001lJb-2Fp9;
	Tue, 07 Oct 2025 10:03:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Xe-00000001lIq-1bNX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:03:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5974V5bI016331
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Oct 2025 10:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llIeV7D3qZ9EMXJGYTsCRVvmxarIGOFyzxq3f1h8DLw=; b=psgWcGo79wVpASXP
	74n0WlpHkbJBz84+WKHWz+uGBu2O8olBlalaS/p1XxgI1WmGdocD7He953nWCP0P
	HvCg0dTv1+W8S19QZ4cq1KO01D2R1kUAYkbHm4RryWf1emoXLBfIXcnITM9zuxtb
	Vb4fDKbKJ+JbK/1hhyLryTh0BljHq7xdtVUTSt6m8KYqhamzLTkmElvSYJvIp4qp
	0tsmnPKELwAZdU7KfBDH+JBaqbXiYk6knrY9qhVClmMBV9a4MXpo8kw5Eeb+WMHj
	uF19CZ4oCJJrZceg4uGmo5dDfak8Pbi+SKObWq+mNA+o84jy0nlHjQ6ErUj76DbW
	shIkBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6xwjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 10:03:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e56b12ea56so11791071cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 03:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831412; x=1760436212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llIeV7D3qZ9EMXJGYTsCRVvmxarIGOFyzxq3f1h8DLw=;
        b=Yhw1oJdKaKgTBmaMgRVoW7g493GNewoFWShKLxRkEKpGQTvMx/3zo6VlR2fmRd6eBG
         yBSTJFir7GV27uXGxhkkxKOHvNfRNEc1nIG/YExMhCy8uAB6pE4Kf3oWAA7TSRPZp6e/
         NB53Klg6XEINazNYMiMalA+QsTcWa/es5RbXZS+SU4g7iHuwTsYmEEwoLzieD7IJySEJ
         iPbzZcBIPXlxWIkf5dL0cBfmb9QmKJDfJpZqDyXNr/Y5/eNbvM3Bh9zc2IdjarXc5WEL
         zkdjkoe7FyEK+CaiRjdBmDLjBP8PpuBeiu2LO6QvfboKQ+rdA0AGuRLmcrn6TfY1ZqjZ
         WTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0BSSrbUQiBwnWjsnXimmbJ53AZC8a6itpsDV0QKADzzAKZsKcDAYx2ejRhOb3mWRGc5MZf4SyoJNYpT/DCIea@lists.infradead.org
X-Gm-Message-State: AOJu0YwgB/JkJjTPqXde6XGUxy18ucPd+4+vt2Y6ae5qyX3nk71lMBjq
	eWclD28VonGxPeVzsc9UpP3l6FRHkTZrgih6SlcQShA0H1S8RTTx3Hrrtemp4+YHL7MqAZFbYWh
	XqIqtoCXhXQTtuRqaLEAi//yaqlA1Wq12v9fc/aqZunrU8Bs0SND7iohwFS4oXkwglEjTrYgQ1b
	p1Cg==
X-Gm-Gg: ASbGncvGQ7Ys1JGSTnfTFAtaGHmXUQyXFSKoXUleEbG5MvCh6mwe/pNHXfxZythcNhj
	msVDMYOIdEzF4BgyuJQJyDiB1iNPWHl7bDtYWHVOq3w3STZVobHXVZ4BB893TkABgwGdjDbF40S
	5b80VNrtIofNsTn5xteS+4dMUr5JYyYdWQTxT2DS+jpv0MuB7foBZBQud9kkgz6VqfEXoay/pbg
	jWPayHSJOMY4Wrcc64PkV6aQv3KFW1LyHWxvBAAGsYXMwso8THQfkupENJJ8n0OW5xhVn9MhcvY
	QiGPcqp8uFa/DL1iIPdGxNVX0yry3VxbRuRAR2YFjtvlfEpxc2iAODkHHlPPpJB1lL7Mld/2YEr
	uVoCmjRZJC9k7x7soDQcjteSPooE=
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr120455961cf.11.1759831412054;
        Tue, 07 Oct 2025 03:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH595GqzjdhPhPl+ER5dVZJGuod+xlkaWX0Q5/bGA/gl6UrOFg8YE+AYMFgUODCYAkuO8cjhA==
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr120455621cf.11.1759831411403;
        Tue, 07 Oct 2025 03:03:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4c1f6sm1383798466b.78.2025.10.07.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:03:30 -0700 (PDT)
Message-ID: <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX0Jod5QCNVBv1
 Pef3uDKmolHPTiQW+giFtMLliliZSv4iZWmnSHMqeYvoKj0dUs+cNjYNERz1ZUbLkSuD4vcN43D
 X5pz1Q5uFGI91NUm5TTPVnWbxCY3v/fF6QpaSpMdOv+u5Q470vt12ISRLDcuWmT5NZQo7NF1Xat
 ok2WwYjXGRaOY9sTH/6UiYVwcSKC4/Cvqz49OEQTUJrM2qJrxY9HezYeccnCCQwb8KsmBAkRh6q
 5Im6qqMeSRhnSF64h3U5YledR0EY/XwKbuUeP4DqI24TVIitFdqrfa+141+0AGL9QPDY+MVHmaq
 MvI1FK8jO88iM05JIK/YBqu+mjFJ2Z3/9AdJ8YQaub6ztsMAn3TA8LOk0YXXfStNwTQQP6aSY7c
 /4SG4BcPuCpKYuigzerK4C2dDR8INw==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e4e574 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=e3cHK1UYxX7VBDkIoy0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: _GB5giHrhBdtf4o7ntOtlkU_Vb05-PeW
X-Proofpoint-ORIG-GUID: _GB5giHrhBdtf4o7ntOtlkU_Vb05-PeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_030334_544143_B9A6397B 
X-CRM114-Status: GOOD (  11.07  )
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

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one amber and one green.

Do they form a single notification led, or are they supposed
to act separately?

Konrad


