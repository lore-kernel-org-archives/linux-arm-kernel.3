Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A01C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1UOTAeEYAiBnkyZpz44d78r5B7uBb0CODxrcfWD1kk=; b=Ds1MxAgmAXI8xE5IIlm5aIvsQQ
	OZSk2y3Kcz2EFggGYoBOrawL+QEQ08dMtsPSJI0y0oNP5m6lZRIQZsDvy+CTNcN1IN7FuWB4FIfV6
	tE3DW65eOmychVdmet5dycJ1MwbnJHSvsvqH3Om8bumd90XIUYvJIxm/siiSqLUAm2zbsxqvqhN4a
	JZ4hNE+YCsW3eHyilckR1scPMUXIaLp7K51pcCzHTVR9MXThU0h4oMydkn0Ez7fzSGdw11DKJqAZ1
	nDodlQvlN6rOVOoHZkiTUeb53SxncQS5RsP93CQq/A+juqIvSCGjC6q165LSj+p4VfLyZYA6ubgfR
	aaAVcjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLdW-00000004nce-3xNs;
	Wed, 26 Feb 2025 17:55:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLby-00000004nRR-33Vv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:54:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9VfIK017857
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 17:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1UOTAeEYAiBnkyZpz44d78r5B7uBb0CODxrcfWD1kk=; b=l8V5yw0ILAnulhx6
	Udo4ZbASizJpDYsHqtpefcgGGV54J1PtaIwrnE/BaIuM4cwhH14lPz+98KiHeV3f
	4GgWcRUDnHJKtTHFPFcqz84Hve19eaxPrkmyMWQ0CAhtEkJm1C9j44V5HuGYwZzA
	ZG8wJQqYMnfpkHN+EkAoNaGnlE98wB/xnqzWpQwoM6npvGS8E9Vd7pFetyXtTl11
	/Nr9MzXO0klRoFdEDBMgwMzgbcgMF5MQiAv/offMvUwhzsSq+x1tLRm/HLMT9bxV
	WCZcekBdaiMKCZpQwwFPFFmE9zXBFNEt1EaF5ejGKAu/0wNF8HL/467F+X6Ict6W
	FT5nCg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn2urd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 17:54:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19bfc2025so308456d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 09:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592460; x=1741197260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1UOTAeEYAiBnkyZpz44d78r5B7uBb0CODxrcfWD1kk=;
        b=t6SFKxkWxhdHqmfijXTrn597QsJxW5zKUJuRswF09zH+v67KK9Je4dOVYTdBgcP6GG
         4B21tubwvaVHA9pqdLu2mRVVtsQ3fsIvKz2+yovwINLu20bCvyTKb0TGxWORdx4Nygov
         Y/VnpcfOgdvKc6Ix5m7SIsxfgGMX8BXyn1B51lx/mhAD82bueIgcZSicQ2yXV5bAhpyE
         hzcyzZgcCJSYIPQ06V1oSCbtLsT7wd9wP5qn5FwY39yHgxBK0WuC3axK8DpMsuybblwq
         HhD/JCgMgpHycnF7T9onOtpn7JoabVfI2LbN4ZAWRSjoxxgK9fH2TxxuSKhSHzoTmKv6
         T9mg==
X-Forwarded-Encrypted: i=1; AJvYcCW63XV8pte3gk7SraTiInJSnfTp8K4p7mN/OW0xVUV1vAXZuPItKopUGbNZCmdPj5lmR3neVp7s6D2OVMVOChbD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6mXdhUzMDZKwfZWjeASBY6TekOICP04UPMlk07+WEKudaeYMb
	jjn5AN20WEORp9jEDaoN0lTCl8yUCemtmLzrU5bFCOdUXClbZK8aylqCijYI9qCSgXBcMnaFTFk
	yfIvBfAQjJEk+snqgj/DSwbrykY8YxozHw8zHvfS3Xi8KLzodGNsJfqIwVFnPhioJ/ukoqwknRQ
	==
X-Gm-Gg: ASbGncv/GRHHEekH8f8PMCpEjvSliyT2HAT08gsZvb+Xi2TuoX+MhI2Oze3CM/w72rY
	W93KhDjBEnEaU++C5Y9h3QpNFosDyL5mQ+Tm7j461cwJJREQ60wq3CTYKtLVwGak5/3WyxBxpmu
	yTjnli2oHLo2X3TaP/TsGxuG38YcpG93f3nhBVbplEnVGWLQ7fM5dmA+TTZd9unUw4otspuqrLd
	D9YCDSQ6UGbbOW1/4qf0zsEugVjWNt1ChrV2FiwfWhyjmdRzubdtZEiFAV98tyizZh0WzpP8nYT
	JDY5QAHTsNEXpC1AiPcj7wVmfOepuzCIa8Yd7Zg6cvJPknu3BdFFQJz+jH9gXLp01l3yXQ==
X-Received: by 2002:a05:6214:21ac:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6e6ae9e22a8mr111525346d6.10.1740592460293;
        Wed, 26 Feb 2025 09:54:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7syWcS42OEo1xDcdvQ08ZhO/oF+3o+Ak0wcAu1DA2U5JLIbwlLDHrfoMof7nVe568CRcIPA==
X-Received: by 2002:a05:6214:21ac:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6e6ae9e22a8mr111524966d6.10.1740592459862;
        Wed, 26 Feb 2025 09:54:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20121dcsm370471266b.100.2025.02.26.09.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:54:19 -0800 (PST)
Message-ID: <e3b2678a-9e4c-4f56-a5ea-5ae46acd5e4b@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_tdas@quicinc.com, biju.das.jz@bp.renesas.com, ebiggers@google.com,
        ross.burton@arm.com, elinor.montmasson@savoirfairelinux.com,
        quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250226075449.136544-1-quic_mmanikan@quicinc.com>
 <20250226075449.136544-6-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226075449.136544-6-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IkIcOsSWkAK4qBBslYakvmxxcQNrPaoy
X-Proofpoint-GUID: IkIcOsSWkAK4qBBslYakvmxxcQNrPaoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=672
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_095422_887553_F7377C65 
X-CRM114-Status: GOOD (  11.60  )
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

On 26.02.2025 8:54 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add a node for the nss clock controller found on ipq9574 based devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

