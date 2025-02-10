Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07326C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULiUDIHrPVxs/sIa64WDRw1W1vqL9P74tM+t3ydYJvs=; b=32BemZF1GXrm17G7FH9bgBWeAF
	KaNFvWSsIhhmWjQQb+pS1ufZVDLauMR7Q2YxOV+HgJWuKCt9wwT5cwluCX5Wd8vj7dVDEeCFEs4t6
	Fgf6VtxNXniMEOi2ouVZX+OrNLLCuhwwQQOYqkNJ+QVLDG5vB+1TIXwCZ58viVQAAbtuekdaEZpW9
	Hx+/6FCbngj1v+NqKs28ayDnzArt0picXdMbH92TV7dev2ut0AuJyVc1fJ5AjAy1fvmO5g1OWRSXb
	O66YfW7LZ5YnkLAH1wjTS+4pLYoTIolOEW9YIJNQWIHp7OIBcf3iqpvqbrJrCvnt2QRddZ5TJs9L7
	sWOuFDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYu-000000017Tm-37iX;
	Mon, 10 Feb 2025 19:35:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZ4w-000000012LL-3lRZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:04:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AJ2Vog001435
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 19:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULiUDIHrPVxs/sIa64WDRw1W1vqL9P74tM+t3ydYJvs=; b=GgDvTwgDxWNsu2rH
	Hb7+ppoKmNQV+PMGK711RL3iWVEnMkAPLbcD8VidYD25wPg1E7Er5PC05t1IWB/N
	s1C6t7rOphU5X2HJBRDYxSr7dggPiiv0PRsjG+mxC9u6cB/gH2LC5VsGx9LgJ1I2
	lphtRJs2cHe80ErUkKIbIR3+4osVRQiVXvlHFTKrcWP9pGfD16SChkfnITMInntl
	uDtr6b2UAOmLtK/UaPdByM8XRu9cuV5EssNGXOal9ffxbaxO4Uxh7QQydWZEEbiJ
	nW6Fj4WjLY8uAaZwgi0g6nf3ZddOQHxDkG5ConjpjaKk2HB6dKKInEchPtI1Bxwz
	BlcolQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxhj33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 19:04:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4718a18521fso2513161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 11:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214261; x=1739819061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULiUDIHrPVxs/sIa64WDRw1W1vqL9P74tM+t3ydYJvs=;
        b=ITk4Zg39ntzaSJzwJ+UU/JvvntapKrh4a7h3ZxoXBhDugcsk0peQ12k0Sdw5ah68IF
         jFSBaUbyuLU3L30zx2YMZA3o+NgI1Kf3R5NmkrGEr1QMOx2CL82qZg2mFmBVzYF9MqHU
         yx+s+xbcUOgqcSLjqj0OWwRsgvrQzZT1BQZ9te0NF6WGP+spaW1Y41qAeuVl4iEcLlzW
         Qkw4nNcjUqaJcRclr6ZxqehknrO5PhyY2GN4Z+TZTBZ8Zy+ipM6zYdblefPajp+WoJYo
         WecoCCaYS1UJILOcmlYD8QhhdLm86lech1jpH0Fk7Zm/MEGZleN006F3KimQ4FS3MPoO
         UQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgFM2RiSvqBxLyERVM9R0Icnu7WpJqXhkvqpIllf77nCcobaESA83achxnmCjepBqktcImNyYoVOJGiJa432ta@lists.infradead.org
X-Gm-Message-State: AOJu0YwfXGVkOrGNWtfN0F5hauWIa1EDlkskneQz8yrqWmIQl0LnBG5j
	noZERLUBTXyQUozviUUxID5z7Gzl8KcIogdBr6j7WkkRYQScVSiJIXFwGxMchilW9FH7iKioHx0
	7FvVdY6i7+xyGN08nWRudZJSewAES4IKH8ekDzw+HgDn7Ed/pRHz4TyUD9XIhJ3ZPU6xcibTD0w
	==
X-Gm-Gg: ASbGncsCxvppJi2Lmw1zLapFxD2ikJwic3TpQJ7s58v1Q3t8RBhG+m0MA5G1ltRQCpN
	LIXJ8XkPLR3MPKCmyBJUPL5k+6i67PD/EpTSrlZIfktym7l1tBwOz7pnIFjoE98xH4MP133FwFz
	MXpI+Vxj+5U0GkC0Aq2RR09CTck6OSVqYX5FgHgGYYQLbik095JDqkIJzcoR+lSYgZWsiaGO2C4
	qsOTNMO2hr9pgUqbCsfRYwKlccWwgtjupRXcLPIBcVER73vXvLzGqLPDmJ2MVK9lC02EYTsF9DV
	DpcxVf2s7SZTDFzyWJ/YaDGGz3Jnztwcp0ZWB15Plrb56Io1ckMZGl5Wszo=
X-Received: by 2002:a05:622a:81:b0:467:6283:3c99 with SMTP id d75a77b69052e-471679defe2mr85720171cf.4.1739214261068;
        Mon, 10 Feb 2025 11:04:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVfYtHXfdFSMk2gWT+jb40I/JkWq1xYtRWJ1JXxoyZm338bTGOoDaw3URdqS8zs1Y2u7qz+A==
X-Received: by 2002:a05:622a:81:b0:467:6283:3c99 with SMTP id d75a77b69052e-471679defe2mr85720061cf.4.1739214260647;
        Mon, 10 Feb 2025 11:04:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cf46bf57sm132470566b.165.2025.02.10.11.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:04:19 -0800 (PST)
Message-ID: <d0ea6c3e-ca5a-48ce-bc67-0622b0d891b2@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 20:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] arm64: dts: qcom: sc7280: Add support for camss
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-2-quic_vikramsa@quicinc.com>
 <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NGuE-c_yc_sOC-wyeZ6EOygeEZ_4jIFT
X-Proofpoint-ORIG-GUID: NGuE-c_yc_sOC-wyeZ6EOygeEZ_4jIFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_110423_257212_52087B26 
X-CRM114-Status: GOOD (  14.55  )
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

On 8.02.2025 11:16 PM, Dmitry Baryshkov wrote:
> On Sat, Feb 08, 2025 at 10:22:31PM +0530, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SC7280.
>>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> It was impossible to get these tags in this way. I'm not sure what
> happened, but please review them and drop incorrect tags.

It was my mistake. I used the wrong copypasta.

Konrad

