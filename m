Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4945E10BA45C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=; b=zWT8wC7fY0WQXV9+6pPmAFNckA
	PW1nHanlclT0yFrerNtVhAbc6I+WRF5q5GsxIVtYoZIyGDw2bn/i8KGJlqJodG+MpIs1dvQbHYClI
	g88xzCe4ojZLvsj0HNJQkdb4IR8bKsncTH7zhVPxcnsr1fp16joDmCHngAKi0Zv+Jg6uEpd4eRYSJ
	jibEnBfC8AkxFw+vHKutnHpPovuijt0iABsNM1bneNiYb2qxiV1pJ1j+rQLhAC93HN6bcNo9swQhe
	9imY5X4BymOSjuK7Is4EACd1l4Tl22dW85FAxLHJBcuYVmlvYKyrP51ui9x0IkU5Dbxm0B7Zt4Tbl
	9bqLJ+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63d8-000000075SP-05yH;
	Fri, 27 Mar 2026 09:37:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63d4-000000075Rb-3zN2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:37:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wFHV1710589
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=; b=NtVXCx3DWCsrm8px
	sPRmCJxUAGYZrUu+aeholz+Ol3Le6y8vP+1kzrfps4Xp09hQqUNT6834YrbzWow6
	RrnEwI/SDThghV85i04+ZbNnBp3fvKvs/rFjHK7yK31wkXC5NJ74j7xBKY/NqqTx
	Nn2juPFSShbO8n+ujExFYR1Hs/hgUgxLVlkHh07mvA1ckEkMW4ghquCB9zJkv+K/
	QpYAUSEK9yfMNLwcr+RN3LN9L+zXz28mjR8G8bmdtU52cZZ7c32XQ/ApiOeUSKmq
	7H3uGVjURATxjKCAXk1XZD4E6zwg5Xl9ZjmlYirOY9PI2bWc9cfj4u4NPRI3asQS
	xVc4aA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjdnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:37:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb485c686cso64859385a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604241; x=1775209041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=;
        b=WjwN6un9faz6nW7rBOo9JZj4izrsrXJvX5ATzNBRogTJhQrNnULj+pBrb9OfJR84NU
         iYWNjXkAVCrD4ds3hNqt+5LsPzekZflmMq6eDJ+iMG2RZMwpbPykbYQIkk3mHXa2iziJ
         ObxmLvcEOmQx91cRcZvdAAmuKlT1R8X98J1f1VuCt4fZBR4Eyt2De5H22ufETeTN1c02
         sm+rTOrl7kpTnYtGE1BBNHmBZ7SozSmRCbL870lrjOWEHsFQa86JtG+u7kQEsujzxap+
         pDmzUlWjR2wSR327y3Qr/fOUnphmbcJMza2/2Qf/30MXN5DsFgcG+MXx4DRMhBF5Rjrr
         3TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604241; x=1775209041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=;
        b=aJXoU9jv00rqCHE+cWKvgtGMV/2YfxJhX84LxcB7602SW0ScwT7BGJy7lGFoaiCXU8
         jO3+3mxhzanzPhhM8RtpeQUgtorVobmLSv9QIZlO0VbuikzqxiEZ4LQk1ZW1yMOiiaxl
         QooVHP59i1gMTm7udtrkqZBCvBWDBB1mjYCc6A5Top77EpX/m+p0YDN+3y/Thc8gVReF
         N1fjnOjmhWIXoe7q4ztFs4n0SgyrtDncqu0b4RGG6EPa8O2/dhhXYu2HoVIXnDZFawSx
         uwM3Cl+5vsAC1jBeid+MonnLp1inXun0FzNJPNemnfc0PNjWx/Cxx4U9Np3dXHCxFS0G
         N2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWUX6vTfAwprlE2ljCstt/11zk1aF6cZa5Yhn+2mp4VjY95cnh2JW9d8UeJwLmKexUqdwvLzO/KrqAQx4xp4Vui@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4CinYcN+JH6RQ6oy3vUEUyNPAFpNjkO3FAVc7wHlwfzWnHtvW
	ekjqtOM8cBROLoqDzEMIiOyVhEruwOdD0+55a6njLveINYq0rFFv+un3vHQPIRD8DNLF2dy0ERE
	n1SF4mO01t1H7JyT6lXV2IyOEUjcDhZEjhti47NgrXVmbEQ/rAAGCvQPvp91kEyEl2eGuAYE5ot
	KiEQ==
X-Gm-Gg: ATEYQzz/mNGbHdtPf1ndAsG1vdqzY0c3elp9kyCMcsYbufsC14TFZs0Yi4FHtaHIUEk
	5+KEBMyzpRA4uPIL7oxeaXF1/pLakwC6+thU6E+9YwuMgd2riRvbqqNwNLQ3O/aK1i4jco7jfhM
	6ZnKotAxCI4eNTuMpscyDsyu7nmX0A7mbiQgyry8LHwpYICfabQgajFDyyrSEulD3+gg/CVq+cc
	brO5oDfZm45VLjTxQgdYlyhei6om1zMp8oSG9f+kKteT+xGTh/TIT3caLeqEQJweaE2dsydpqIY
	mFCYwZQ+X3+SvfHGcXHpoZNp8wiSY24y5g23pc9azPg2H8D28zZVIjeIgrVYrv7jSaQCNs3rGNk
	0I9udMFurr4RqWOK+lTo0ajKdoJyQ/Ff8NMGyWjT6aWpPM+HwdXpj3By0NoJ7u+EppLt0Xp9l9B
	ydZ6k=
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr16513271cf.8.1774604241575;
        Fri, 27 Mar 2026 02:37:21 -0700 (PDT)
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr16513091cf.8.1774604241126;
        Fri, 27 Mar 2026 02:37:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6048508sm2026149a12.13.2026.03.27.02.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:37:20 -0700 (PDT)
Message-ID: <8feedeb3-e244-4615-b819-dea39300fc2f@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UKaFGlseHojZJK9omaoJVJeOzvkIv3_7
X-Proofpoint-ORIG-GUID: UKaFGlseHojZJK9omaoJVJeOzvkIv3_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfX7ACDmgBL8t0R
 cZr8MHcqXkwmcULXzesQChQjWsnHFYPBgYuUwJTVG2apfAubD6JzqOExjZ/0Fz8fMuBNgssyErV
 9nrIs0GBv6JXBkuQRc2ySD2WMh6JauVXeKXzxPQNSFiEk08Mn4hJpnTv5PEDpszOIY4RKzNV0Q3
 IjYkporKh9/iY/51vA4YVo7YB7unU9wVIAB7byHjDoIM0Rqy8YlNGFt4jZ+LM5rVD7v/HHmpyxw
 Ucj9AxL5pmVT31yx+yWBQIYjLEmV9vy1m0e9DQqGyQkaRYOUyzy1in9awvLBt4qEG+Kmeu4zFHs
 WrwIWx7GAHuzCxqJ3CmjdXy5UHqscQuQVFMvLhB/5TlK/6eFHGRhFAfCT0Mk//K8N/QtiYhZ3PJ
 Ldn346cb+K4cgU0+Raw9gwc5MO1r8iIP0kab3/eQOkXKgI8ltvnxLQ93k/LoRKoHjOJP64yUtAJ
 3fT2Vo+PjX18MDQVuGg==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c64fd2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S3gobNufr5BrtecctxwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023722_999130_09FF9236 
X-CRM114-Status: GOOD (  10.53  )
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

On 3/27/26 9:31 AM, Canfeng Zhuang wrote:
> The monaco-evk mezzanine connector supports a robot expansion board that
> requires UART6, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART6 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

