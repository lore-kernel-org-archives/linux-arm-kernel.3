Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906A2C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLFVWaUWbDPd+G73ejj5R7gNnqQGG++cPE30muP9uhc=; b=nCvkQa0Zl+NFF5W1UdqhR2+I03
	wod5Xlg261RsfrPH7YMTvjTgLwsEid+nH1UFYvEdECuz9+oiTuFe1Z1W23IpF0bcBkIhz8K8l2kjI
	Pd4KxV6d/sv/FFZcL4F7PO1i3HtRRypVwQIIQBKeYJGOMlfn1POoaINwEHygrMq0q8dMMRUG5cl0x
	YB8X3WS7MI7CeVUYYrHZFny9jDVki0RPmq1VIIYUkK/UTISXWFGcob8Zenev5jFpMKWNelCqzdd9x
	qNXXZNSwPy84qbZXTKUyGw1dIQE+MQ5+ykj8Oso456O14kRAKxGohV1piFahmi/QIKLEQytrfwAML
	UKA15xDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvnJ-0000000Glvd-3Y7e;
	Sat, 08 Mar 2025 15:08:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvkI-0000000GlZr-1Knw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:05:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5286FMuS006095
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Mar 2025 15:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLFVWaUWbDPd+G73ejj5R7gNnqQGG++cPE30muP9uhc=; b=KGy/wWVUKlJqjl6L
	E1satjTApuiwsDPW06hbUqn1nu4dSUTFSgQqU/vi+kQn9H3cqWMjklHArAdOj039
	o5d08qFN9HrFdnc8Gp1J/CCkdNh+bUFa20y5djLBWDKN7KUie2kucNUimJg21s9I
	okgXWaPvtX5PdGcyRSAVjTRjw5eyvFOFxLihCxWDx+3SAoHjPqhVMuM/NSo7lMMk
	U+urL2S1P40FcpIC90M7FYbyaXOMqtcrHDSLuMc4kF6eOZha4oW+3rYWkdElsJVd
	rzjREZjWJSE5yOcEdbXUCZRLNRvWtr/OkW8fxEMwsMszmmbsS7zjE5dtTb5ONnsd
	hS/dQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rqv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 15:05:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so6122916d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 07:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741446344; x=1742051144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLFVWaUWbDPd+G73ejj5R7gNnqQGG++cPE30muP9uhc=;
        b=DpYGUIMaCxwHrPFRl1FpvU8yyVtkJBEOqS8bC7d4R+2yAI2CNqDkL10wOMwxGseBEG
         DbxPl9i/JNBjPVZa7TnsQV7PkjQdjU1Qn+wxVFJfFmhvykqCS+54TpQ7m/XLRjrTQT7n
         1t9VA1bqzB2mH0YgD6Z0eBajC+zKSyDSSZ3Hf70vJskWVs1wSesGSZMRrPhqFI6WJgWM
         7wws5E+XaTxJGoKsA1VxFYkhf3uo0ojf3xdge8XGz4Oh0vwQp40qFBuD10Lh/GzWcT47
         Kgq+A41T56ma2cYIWB1UshN+h539JpfMCXIwSimnlpd/Pwx2H9js2wp2MsZiXXqpSoOO
         sKyw==
X-Forwarded-Encrypted: i=1; AJvYcCV/XE4MUZqAgHUWP9Xry3/R+6tIBP4eqh5Q5DuhQqgRNMHIh9qcmapQZBIaqtr/yctAjfQpQ+5yhfVFTqXA1mIW@lists.infradead.org
X-Gm-Message-State: AOJu0YwIGOY+GCZdxgGxuqyy7vtCkjgeriSSJMoYgloMSTV7nCaKQVim
	oGtNvexmpgy9ZWsIaAwwaLeMeghRntiZ3e7VsLNGBK5pUQEBiSATnw9Cz1WWKUSBDFCcWGm9ZEF
	mqs3JUYjqjVVZpMmQ7CgTBGHQ1wAMSil9WblnzKP2K60ILCem2iyjC+R+bIl5mWgcDBme5ZMs+Q
	==
X-Gm-Gg: ASbGnctYdihHT0EkAbE12xob4JWPJ2RwutuchsF5JVdJTnoULouc0MMzCIO4+qpLnmo
	x/d6wgVRTvD1TLw03gUuezAp4mRne3q9o/6csi+RvoURo/M0OpjnNUgB4o+czP2MUOk8NNrZU9K
	7kivmfGFJXoqheZE44lpP+W3Y2Zgu3PyVelGpr9rvPw2tDRGJKZXSV4JYheIBFgrTmFFDOYldeM
	qoy+TiM2COTz7UhLhdGxFSdLh4l5QK5+H7Mye5SAv5s8wRDS46812A8eBxZJMR+IQKtn9fHJlco
	w6LGM0gXASGFX51yFdzOITH0ogmY6LyKCQMjNyc782sJ0YFrTc7NaulypUvbwM2U40eUrA==
X-Received: by 2002:a05:6214:d88:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6e908ddb55cmr15428416d6.9.1741446344556;
        Sat, 08 Mar 2025 07:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIuPcR+e7Mz7IBRdPMU7doLc5Tz3u50vlpBjwRgEiNKUDEUQn8nQE/supZQEX3XVnVqo2W4w==
X-Received: by 2002:a05:6214:d88:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6e908ddb55cmr15428086d6.9.1741446344095;
        Sat, 08 Mar 2025 07:05:44 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2390fe76csm445972966b.0.2025.03.08.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 07:05:43 -0800 (PST)
Message-ID: <687a23e2-7822-4d68-8b4c-f8816cce3cc9@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 16:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP and QRD platforms
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc5cc9 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=z_dfX9dpdT3VBrYyFBIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fhtuc2Q1zAssXQWJmYuNHf8Qj_cOEyRe
X-Proofpoint-ORIG-GUID: fhtuc2Q1zAssXQWJmYuNHf8Qj_cOEyRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_070546_379745_B321115C 
X-CRM114-Status: GOOD (  12.41  )
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

On 4.03.2025 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Enable USB support on SM8750 MTP and QRD variants.  The current definition
> will start the USB controller in peripheral mode by default until
> dependencies are added, such as USB role detection.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Please separate these two indeed. With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SM8750 QRD

(make sure the latter one only goes to the QRD commit)

Konrad

