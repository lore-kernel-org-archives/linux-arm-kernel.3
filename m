Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA756C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=; b=b9JgM5T6Q2fTJf5DoEVCiK4I34
	tPCknG0erOyI+7G5xJHltaAMlXJKRi6M71Iw2kSXHxh5elXleotj7IEOWdl6Y7/B2/654ObGAJMhU
	jVR47YySaT3wdUjTKeOrhE8bT8ZR++ODttiYRCYj36iWVGuCBAFB5uQ9hza4F7HShvx/Lt7F7wcCX
	01jn5yAtgDpnRVFCkIujZpF8d44aJLLEOUWILBGnUVcxkQeU3KMU3HZa6LDGRs/JIQEXqOlKJguHE
	k2+xWBow6M6VjX0pPa4MNJ2vXzFF2WdcMSsEl83oAhYLaZjFB1TbIZtI4cCcXWIy81FeyfMRI4+dd
	W2cx59zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jdp-0000000C3RR-3gMA;
	Wed, 09 Sep 2026 14:51:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jdo-0000000C3Ph-05yx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:51:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCoNw1401021
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=; b=VB6w3mjUHata70mq
	zzqgp30JtxapAP7Ax3glTlIsVT4xa4wNLV3UvA2ZDJEzihZE0jJP9smVBj2Wxs+A
	tYHIFt1uhA41APAsazF5Hmp5iZzPq9c93P8B+A8b32xp10w1RpfMh7c2HAbVyD5i
	ukPgGbABheRyLnett8Gm6Ph5xOFXMB3kEKTrwxLkmuH7DnSqD1XVU2qtL3Eq73Az
	yjxfhF2iAr42vs2Eh+UCO3QnOQpNvCG4rYRiSuBsNI005WTCoj/LW9puav1fhuU3
	ayfgbFPOyvSaeRJ8yAWbb3bZ1vmF5qGOnJCJGwlrC+54/cg92QaSCy/eYjPPF7BX
	hvIe5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x0q54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:51:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cd9fe6336so15094036d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965470; x=1789570270; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=gLJkS3M1TezQeNiDLuc04Kx+Gb54dt1/gH4ryx4nKHNHHTniyowghlIhz+PkhJf+9Q
         IFv+01t9Sb8yHXgDhlNagL2Y2k6GESe8P9yPdAi6V0/2dNhGv7fSpoy5QerniSX3Doo5
         I9XLtAT+VikbCCdgwPW2VvkKp+YQMHHnX+hwXLmfoPfG0cm/6DEXOT2GeaZqujgp2ZCy
         TyHjmTFPzJ4xuccpd/lo/3fvW9TTkSYUTOucU7KEM/D6PHZMThZWr66ybMDREnJx1lbM
         bRHVPE2L/Ok4ApqKc0KQgU+cxSU5IQ6rokBNX/8YgmJMnnu56YEUPfkgTldy2w2xwHq9
         pW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965470; x=1789570270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=ZMx90Xkk1J8yt8iKnG0S1t9fqFwTwU1gUtxLcHXtnQ93ho4ej8WDfeFTtSS65Ou0Fm
         2G69DFEhNmKuLLWtmbJzJyuubN602fUkPHVfkYL5t9K7sCXa20iuBzhLNm0xC5ZT5naO
         fd92nApf7seAkw4QuFajNUMS4x86TA+Nt1gvaT13qITibXqjtX4VzcFcPsXteQXrBtXl
         32FbgO/uD9xgs5ODwi6IHu6wK9TvTi6kEUIBl0YqHK5qsDmUmH79xsy6zqNlXuo1BXfQ
         0FshHbICJnFfMjCVnd8sGCJrC3ssLkCmxzXxJS0AdQsvZTesh8WQjsovgBiHBc1Fy0Jj
         vyYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTuUpBTQGbEj+a+NpLnD/18t6ErqEljrWfyVErg98IKVcVFW1eLYrnAnSZkAplGEtTFteveiK2RUAnAtcDPSqw@lists.infradead.org
X-Gm-Message-State: AFuF++nX8ymQrSNoDnPrSZaWILzZMESG5/4STforDCJh/FYaNgZtO0nw
	8cu9CWOzkwQL6b2bJD49xx/5sS7xlDkX6jR5yDsKVgOzqzrUd9Mf/RKncl0xO1TndcodWkZaxvM
	pE/bLBVSVRlHZ7SGeaM+/k0nKn/2T6NTujmCZ2YVwk1xwSWUJbpxzgTuEDb6FtIt5xI6y1SrhWD
	+Qiw==
X-Gm-Gg: AYBFou0yKIgHB3a/AgxlNOgACA6sOaLxhmokbVTURVeJezbUMGx944sDOkMmqmn3p6x
	IZ7KBwwoslHO8uvTxsxCOlt+mGUEN5WCUqJi4QCuazf8TdpsBRAKPxjmSu77b3x66schi0qURcW
	Xd0ibtPS/1LQrqV5q4VYTnxCKQKPyqH7QpKbHcqRLfuVyxOEf7DAPsMp7CuMijt6M/tMag/Dhos
	ot9P7dREfvG9LtmxT8STfYk2WFquKKtOgLu8YVNzClvI0NvSorFI49XQPl9V50GO4YwjpYr8ddq
	MkkVVfwEOe7mnjxTKUh7Epe1z8LRoGnbpmfAHFub/NLa9dO+Ha0+h2372MoiPnbetRHCgVhcJlT
	mg3nOvup/toFTGne8/TkmOA==
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74582686d6.3.1788965470294;
        Wed, 09 Sep 2026 07:51:10 -0700 (PDT)
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74579016d6.3.1788965465810;
        Wed, 09 Sep 2026 07:51:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm630980566b.18.2026.09.09.07.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:51:04 -0700 (PDT)
Message-ID: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TCWOy-of_G2KOda75_dG7zS3dUZgbUHh
X-Proofpoint-GUID: TCWOy-of_G2KOda75_dG7zS3dUZgbUHh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX1eB8UONZKQBz
 msIWwb35KVn7YFVUIxYVc3TSm5PGuiucXZU2vHZXmurg2b4RAOYIqW0/zZz7L/cENg7FAL21z6A
 qx63Xp4FeKSxqtohNFsyI99yDXQJg1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXyYnBi1hT8AG2
 vK3iUWGvYxEOJZxIPb9Knvnse9QzpY9YRpu9NWlAOi30KybHppiVbJE/0WbRO9LDn162zjkmNvq
 DRxynYAOfUDnRquSLeZaghr4OvPImYaxAvx6xtY1IrH2NlTPDrkiHOliJg3znUTo3M80JkKIQnr
 elXuaOHJny8L4BS6TPe3rT8X4qXHMpnaeGDkwndh5gdijiTblySFv3YPuc6wuPW2fMxv2zYj3AR
 3T/Bo2RoH5ReJwgaaDvU4PUjBhlLmZkdy3kHDujwCDYDE21PROm8RFm9MzFgsXr6Qyz+j6HJphN
 aoeEvWPrbgMLLqWmP7++6IjsTMNMk4GZJGdjkcBGNXY6Q0zubU/499HkBSXONJj030WehB1nb++
 zM9c7G5xY8DHj9DNaM5/0AhnnuSYnEagScP4juQcKBYFi7gdqhYu3JIkKTGHztiw7GJeCKpjN0G
 K0pYP3SLZuPcfO63iBg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa1725f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hExI_PBlCTJWeLBofxcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_075112_082677_DBD9D362 
X-CRM114-Status: GOOD (  12.39  )
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

On 9/7/26 8:33 AM, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---

[...]

> +	reg_dsi_touch: regulator-touch {
> +		compatible = "regulator-fixed";
> +		regulator-name = "rpi-touch";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;
> +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Does this need to be always-on? There's clearly a consumer for it

Konrad

