Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA47C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8QKagrcFhKv9KYvsAXHi4oyalQy8U3D+I/qLNKwZTE=; b=YPkvSXTkyNgCAcQeqsuvLoHLCU
	VVa4Xqk1va7zJrFLnjW2/HtAasQ1huTYyXOOJvL/ahmx5XHau990T1Pyaij6v+wDdquZaz+0TdEgh
	b1B1SkRXRSxrnFUveqA/pnbg73jqXiYgemR6LAvb3FXBroeW8b+0nX2tthyWvC3EbztXpWHY5NAZ3
	aLRbO0ufAcnHD/oQWlfm4bp2kBcJc2LdBtw9/twM6DySgfEynI7mp/WoaQXqfngkByrYUpPimOsBc
	tRn+C/sAczJSLSxbSz9+cMnJMF+14gGd8QFjA6K2hlBTPBL5TyZ2J0tRDDYajKdQnKW47uZFTtdKF
	k5E5qeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HBb-0000000GxKT-3YtY;
	Fri, 25 Apr 2025 11:25:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fto-0000000GeMn-4Afl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:03:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TCS3008729
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8QKagrcFhKv9KYvsAXHi4oyalQy8U3D+I/qLNKwZTE=; b=WHr6CR02/5TJ081u
	ikBTbROJtBYz3qiKeh/3BKqGKrhzLDKuyhWwSXhcxhVHbI+5tHttz4xAtFVYob2G
	5o7UyRySkqgLtEBC0v+Gjr5s/HwHfL1K3/6L96TMB7wzT/MIq5Eb3Xd7ZPPjeYMw
	NxgtMRx//TkB153VudTacJPaABRj4K6Tfbf61csNEKGkHzQ75h+VdFdQE4YIVky+
	lnArkawa2LTL9H6Y2IOwSdEk760Yv7HUW5IWsYWx1D+2IfUdsBjquXUdGNjvnF4p
	WV/Wq1mrBVl+6tZwYbUVelXjR9YhkwJETh2+6Ak9AJHtYfqg8pW9vWO8sPmCewOj
	LJBUUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8j5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:03:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476786e50d9so3473821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 03:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575391; x=1746180191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8QKagrcFhKv9KYvsAXHi4oyalQy8U3D+I/qLNKwZTE=;
        b=DXJXZEj6IDu3UHP6xNTQlXf5G0TZucgBUiIsNc+4uIMK9BXvV8xvzHMzUCwaQayNJw
         ifJAq0Tddke/PYO6/8661o2J4BDossUaVK9IIBeijkVqAz5wp0R+P/wlY5W+LhUldmsk
         u9jSvc+bhIGOPgoMIL+vDa9hICqxy3Lt5rhOS0/vbZ3lBLd827xmBrOXBTkFpxT96PQG
         D293b1XUKP5RkuVkcn4vrgjxS0D+onjCpLIKtnGp/2pjQ1PT48aLRoC/YrwnR+7hSC71
         oAxcqNxc33rkPcEosInaTFyznt2Ja/hzhRNIMiLUb1AVpaw/JkiH5Ewx1nnbqFrDwmpr
         JoCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW58i9xbDj158vgivvsU6HHsu3oDTDj9Usnrxu0jrAjXkf9qCQKDifblywpn0ClZxAfvw6uvqvRBWTMbl6cXu42@lists.infradead.org
X-Gm-Message-State: AOJu0YxDcdb3Vh43U6sDVllNG7Xp87wTV485+f55LtRNRwJIM8xW6uip
	A3WrzV/OtYTD1Q9cEAwjOhewv2PUHzcqm3G4Ti0JOHDzlahHZ7MG/F6UvHbbeXvEMCrH/UVg6P/
	/BAHD6JofVoOIJZ7SDIJ02k17ejQ9vYvRUNlbW0Yln9bYhbcM4GXp7zl8kkQ5vwUKXA9/Rw2jCg
	==
X-Gm-Gg: ASbGnct27jh7KBTMRkRWaVEEeZCCFhx4odRejjzRy1bv5/Dgf24AnKuu6yI/8McB9UX
	xOiznIv6mwB95M0qfk66KzjR50ky+E1wGQVQSVufHws4CuiKCCcIK53MeIV6/ZG4nmV7IFxTpbP
	NI6k8a9+IZjJb0bcraFMevDGiuQs4vjz4A2kKaUJSkpaUOS7hvoRJOqdqdFnxryVawfBODiPbVI
	mJHzADe/J2QMuwGqkvOCdAkeOaQiyrBD65K8mNZ5tf0el72rcY+/whl5s5JunfjTQOnFvdfNMd1
	7rdqgqy/tJRNYS0ef3Ls8E1P75pUmIEgKeIwRJmgsCe+QrYOD6aOmTfSaghgmF6/
X-Received: by 2002:a05:622a:14c:b0:475:1c59:1748 with SMTP id d75a77b69052e-4801e4ef65bmr9252541cf.11.1745575390670;
        Fri, 25 Apr 2025 03:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGym4C8wwZXnGdD0USz55aLh0SXbKBJJtzFo8Orhuhz+NevN4tmg5LbGw7KIIl83OOjojsuOQ==
X-Received: by 2002:a05:622a:14c:b0:475:1c59:1748 with SMTP id d75a77b69052e-4801e4ef65bmr9252401cf.11.1745575390337;
        Fri, 25 Apr 2025 03:03:10 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e69efsm111315166b.46.2025.04.25.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:03:09 -0700 (PDT)
Message-ID: <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Johan Hovold <johan@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MyBTYWx0ZWRfX286tZHEyh6B4 X7oKUmag2f2Vj0SEKyvRbUopl2kOPMjng5RY6PGKF9J5rbDQopXmMW+2UEc9ZS9/RGjHdyFZn2y 2CHjZqZiz5BLLp0yBpZX/WEWl0uDFeIVqN+THOVxq/kFjqGBcTx7J8aZqD8Mj6iYdDsqM7oNhIk
 Ka/5vpB18bFewtBT6GPpPhwqXVpcE61yLEpt8kTJSmbgbFGWcuH/IsM+v81N31rnF4Y0/MIqg0d vwkV59Xd0JReB2OOmqphfGB3GXkiCoGcGqGPN80DYUe5uro5A0aWTS1CEseJxEDOzpIQRN54JZx wPbJStB8/QC6o4Wnf+mls0DEqPhlOCAJ5cttx78Z1Q09C90Ekb8eb6aKCkdk2i6ilmBBMCiC/yl
 5AHWWqE4FR/kZ9L1BbtbyVokLxjSTlxIB80/zHkBd5aAgA5nqS3lTJ2pFjswlGJCMex9H9tZ
X-Proofpoint-GUID: GprqinWYLP0CIP-CKKoziCO-4lsVvaUO
X-Proofpoint-ORIG-GUID: GprqinWYLP0CIP-CKKoziCO-4lsVvaUO
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b5ddf cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YoAw9hKFp1W1AvAWU5AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_030313_165208_84906F08 
X-CRM114-Status: GOOD (  14.97  )
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

On 4/25/25 11:51 AM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>> missing in the current PHY device tree node. The PCIe port can still
>> function because the regulator L3J, which vdda-qref consumes, is voted by
>> other components.
>>
>> Since the device tree should accurately describe the hardware, add the
>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
> 
> AFAIU the PHYs do not use this qref supply directly so it does not
> belong in the PHY node (but possibly in the tcsr node that provides the
> refclk).
> 
> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> qref supplies") it also won't have any effect for pcie4 and pcie6.

QREF is a separate hw block distributing the reference clocks across
certain on-SoC peripherals

If its power goes out, I don't think much of the platform would be
functional anyway, so it's redundant here..

It doesn't have its own single register region and it's frankly
one-shot-configured way before Linux starts up, so there should be
no need of describing it at all.

Konrad

