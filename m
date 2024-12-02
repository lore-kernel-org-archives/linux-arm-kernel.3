Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F3D78326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jbIOMJhwzZujSBJo3/F7e/CHOV5fOnXM/PrRzCOyTU=; b=rG13TEOoBDmdXK5dj+mHPe9gm3
	9pIGS6ogCXO5doEvVhXTEGaGA2A407L4IsQuY3g8+ThgaX440Sehw0KLwBygDfAW+FtIOWE/bJNSP
	4rPkhK1w9cOOPTUOhgwbVjSXczZczHJkYpDvRLwvlEZxoScX5GmlfZSzszGNUdwo95Cyeh4QdnND6
	t7O4xYEFlNGEG78uZVRRR8UxG+lNM52T6OSD3wb3u2rMxOKK6zF2Uz5uYdcAkAiM+Jz6s2qQqUnGw
	SkbQHFzkDOQ6oAdWyUNK8V4+WcQknEA6Y0zxbwzuJafLUGNYB5JP3zP80QU/VnMFt2vIoJjY3UVsk
	tYVxgpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7UJ-00000006SjR-1Md0;
	Mon, 02 Dec 2024 14:33:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TD-00000006Ri0-09QX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B29fYZE011828
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Dec 2024 14:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jbIOMJhwzZujSBJo3/F7e/CHOV5fOnXM/PrRzCOyTU=; b=Q+ptKS+KNn69T76+
	UTx7JyZYQsLwwtc/Y86rh0ScKOXyyFXvPlZnep4FtAQxnkFrKrnTppAawPIbUdHD
	rR2LSV8QG0rtGrOVvsyXJkgEE1q3hNNbNR8rhXejcQ+nHQf7dUbWVqugNmqsc3Fj
	tBpGB8K57UxUNZkTBr3grUSl9+dGdgFQAkgHIKx7b5AA7wIdUn8Z3RWz3TQKYsod
	793vWz74ooHLnRYmDs4jmrNDQTmks7TYyGBTk6VOjNehRk9BICZESrfLPtdoJDdT
	BkfTr0GJZJjk9sf7uDuY/WHvzTLcllopmaLL8gdLUcYQwSVs/EI8ptgA5cpfEVeX
	TWRDlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mpa0a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 14:32:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4668cee0202so6921011cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149933; x=1733754733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jbIOMJhwzZujSBJo3/F7e/CHOV5fOnXM/PrRzCOyTU=;
        b=pYEKTzvvQGzjPJwAimNjs0rzVUCtMZyWK+fAYskYGdc1trGflxmltRQw6+MublsM7J
         s3dumfd/iENBrVvWL0SQvJdLPReJWm4cfeVDRm5Sju2AEt4UqYOn9tcqSJluIesqx0wQ
         UHVQq9MBKEBoJtrFTU0+EkXlI1RgznsR5L4HdS5HWgYilIB5Vq/qmNEZV7SdmQ7/wtc9
         rGrSgrfSHbgsDiH+0kp+djRHY2MXnp4UWx5/qMWEjmhdIhWhj/Xsb75X10Jes9lE/lxM
         fZGO0b/i4+ZufIyYAAMFPOk4q1mpOsxG0zxd+856YyKH5ldxWsvK47LoyFNiCpLgRW0W
         CD4w==
X-Forwarded-Encrypted: i=1; AJvYcCV8U/PNNHR+5Zp9SO62QBeFAD6Im34ym+HZNBgKM/IyJKTdWq7xSWYxDv/CHXKiwww0BbrF4r1gq5+C+GVG/FTG@lists.infradead.org
X-Gm-Message-State: AOJu0YxTpz53GUZfhQVSDBzwa7jjCYn4cVKsfxgh/rbkIyhdBMh8pKVj
	F0Om+EDyxwFfkzYGxuVj9praklnTiCmqVyZd4lwu4N8HuYxxeUwEMmLQ+SI3Ck4pSH+s37bHzSx
	mjcfagw5CLj3k+aW0Io+ihm8N0ET8h9zL4uqvIT6IeMspnXTJPIZNnXGv84ZgC3pY8zjxiS020Q
	==
X-Gm-Gg: ASbGncu6NCFSTAO/h0zKC+FlJF1mGGJefZh4g05CH925+UtVnlr6pKQgv2EFCN8qAgC
	h8lmrf2sehykUKGoVATWn1eYXy91VvT+BXGTK7fhmpMJK6+1dpkspdCmHvvbCGYVoAcCB72XbaW
	pnpnCzyAxeczUQ+ySrMZwGdweESTzkkBU8a0Im4dnxrMc4ez82+oMpn4iZBPHjbzKQj329zQZ/W
	tLGFFKH00DPG5xjP4nrURygYGdV4KuHdjPAGk72jzWNQrIdKi9o3KSHceT9I6bFtoOwA+mq/nu9
	uUM5VRuVXGtROzztWktCvCiGRDIwSk8=
X-Received: by 2002:ac8:5ac5:0:b0:460:9026:6861 with SMTP id d75a77b69052e-466b35709cfmr140702281cf.9.1733149932675;
        Mon, 02 Dec 2024 06:32:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf1cpJzrtskSGjo4fG1SF33+hbIJADVXKdZwRVrExj/yH5XpQNftzyNj1gO9ADrRCLD3i4rA==
X-Received: by 2002:ac8:5ac5:0:b0:460:9026:6861 with SMTP id d75a77b69052e-466b35709cfmr140702001cf.9.1733149932112;
        Mon, 02 Dec 2024 06:32:12 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996d8b7asm514983366b.48.2024.12.02.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:32:11 -0800 (PST)
Message-ID: <30985d44-a460-437d-8423-615c198e02a2@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -hRF6Tr-54pULRm3c_Qgz5GcnTquZZZI
X-Proofpoint-GUID: -hRF6Tr-54pULRm3c_Qgz5GcnTquZZZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=602
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_063215_084716_E539C7B8 
X-CRM114-Status: GOOD (  13.04  )
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

On 18.11.2024 11:34 AM, Stephan Gerhold wrote:
> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> multiport controller on eUSB6. All other ports (including USB super-speed
> pins) are unused.
> 
> Set it up in the device tree together with the NXP PTN3222 repeater.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

