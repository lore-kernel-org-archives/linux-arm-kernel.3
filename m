Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055AFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVYdOyCWxSbmzL7wlbg+5YDo1V3ZSGq1/g/F/cp+HoA=; b=fMw3vUt9BLIR1nv2BbtzmC3ZhD
	dQVSkBmOx2dhjgZF8fSiYP1aYmZIjfcG35GV1RzqNC6fIsDSDEGlKtt80NF45znm4hFFWm0CuiuBj
	fkEqcJj3PlWiZIolPIWjcIjj0DsCQYHhnuBsPx5Kz7PPpfAvEoGZ/1B5HbJXyhxfb6IVmSVq6rgbG
	U2pVa0hfNE8JVVRh6IuhJva8d1/bzg7PiGmotrc0N6LkHC75geD7BW9lHy0IMi+6lFuKb89MZt0Mk
	51W9qkMRiqo0hbFo6uX2gBAiQv1XqebTogBawiHCdpR+MvjN+LZSnjlbJORz7w2PgB5pQGIoM/907
	bNSsIcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3WX-00000001C5s-2xNu;
	Thu, 08 May 2025 15:51:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2FS-00000000vGB-2I1e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:29:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548ENlAI016151
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 May 2025 14:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVYdOyCWxSbmzL7wlbg+5YDo1V3ZSGq1/g/F/cp+HoA=; b=hORXaO6a9SMh3pKO
	xzZhMhWFomjD0o7QZqMQglsv9KACrmwcUpNNbIBnsGE+8EbUPOb1bHuYC8xRXqWJ
	FFPGTgfdgX8IfHcDuimT5UCJNIT5trm7ajYqiaHah9Sw4timIb+qbMsDGagophDP
	fD7K71MDNX1IGFQJygINl5TtATJSoN+6sFoM5N/xXOP3NXnNJW6JbWWlGPGrMPiI
	RiFhUU7eU0+6znr4yZEiGo4XVs3q7fIYoh/t2ivqYGZRnLjBTE/bz3Hw/faz0W/k
	G46C+ZJ0F7KZ6Tw/N3N8HqFpZ7K26d6xUkRZBglvjs2rjgukFMDBYgT/SDQoGw02
	2mtCMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sk1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:29:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f543e296e8so2739656d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714557; x=1747319357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVYdOyCWxSbmzL7wlbg+5YDo1V3ZSGq1/g/F/cp+HoA=;
        b=kORWz6gQz2badHWlhdjKLub+y7pypuWWix4PuwHMa4pQkZC46g4cUDwUhFoEDmUvGB
         MgwERD47ckizKLs4ZUDSNHpKXkV4GUTr6uJLC5T+V9Ksi/Im6OVRQVkz+3l7fL4qibhL
         n7gGYojmvVSuB8V8PyAj8Q/KqVJrtQzCmVlvde9dWEGEkATjtvU9OdsjY05J59NMHDQM
         ChGTYw5BXNrjLAL3lHwCEkWyDEuVONODDsJLEfQ1rVC45EGgz8AVS5Iy73mVWvURVvh3
         9OAIHsXAiOeXqiFVhMJrC7J14j4ThPwpe3soaiyzllyJOIcDuMlCJF0FpHp4zFCQGUS3
         Azhw==
X-Forwarded-Encrypted: i=1; AJvYcCXeVKST3QmvLpGgYC1KkwzswWovU22paCO1qg36/PHFWeophuiqlhh/EOs9uu/s+8825MncHAZoi4tsS7rSwa5c@lists.infradead.org
X-Gm-Message-State: AOJu0YwyF9ZspUMW9Q9vKjZyP/Pbjck/ozIi+Qg7SFrmukvGYw5WsuY9
	nCBh9JaZzk8avKkX31si+qXXgrp16HAANvUBI4o6+M+vyo3eRJMM0+OQ5BUAMMjIT3lvpe9LtRJ
	UzgseGaPhAaZjX8YCGw96Dmk9l6GJvzDITtB+XDyNFgSViCq85tTLi6DHha5eoCEmOv//QrddpQ
	==
X-Gm-Gg: ASbGnctRC3w74ZxBLL/eK8rfouMVXMke9133W5VzSU4ZTHEmZ5I/2r+i4EHl024V2ou
	nj5ve9ogYPBUiKwJOmIfZ19SmWG3fVnUhyAVf9s13MJmcz2f89lJEB8au485rQ4NBfJuX7gq0yV
	bju3OsNp1liCuEhbyR+seqfDCMRZ3I1eg/cUJmJtVgcCZ4mkCHDsbXalS8EHXyhR11sDnzLAv/O
	3i1XKYEI+gAhba5AXr4v9zAGKu6FcOIABPSA+TtGyRRJ2+yop5uV95YxQw/KnzlzMbRoCHgRfL0
	icw9HzVkFEFErAfsBolxBBqxle94eBIqgBSEtZNFEzjwxarBRYfn5exMaB8Ur+lcLN4=
X-Received: by 2002:a05:6214:f04:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f542b90f75mr38377806d6.11.1746714556834;
        Thu, 08 May 2025 07:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz9mHXpt3+OIRXdPn95Ms+NqkqUskqTCeWS3quvvvRzqN5bTNhGiO6vHKI+hmpfTr1sFDJqQ==
X-Received: by 2002:a05:6214:f04:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f542b90f75mr38377606d6.11.1746714556447;
        Thu, 08 May 2025 07:29:16 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faa42f65dfsm10180410a12.38.2025.05.08.07.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:29:15 -0700 (PDT)
Message-ID: <ac96227d-5b03-4309-b3a4-5c7cbb40a057@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8226-motorola-falcon: specify
 vddio_disp output voltage
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 49XVjZ-RAsSyDdWj7QlNGeWlUdir_Gz3
X-Proofpoint-ORIG-GUID: 49XVjZ-RAsSyDdWj7QlNGeWlUdir_Gz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyMyBTYWx0ZWRfXz95N+4J1qXyx
 IAM3I23F6y0XLW8IMWSaj0Q7IKWJanSRZ1Q0pwb4ahgOBk7ZoCPGJDzuztdVyYSqEiAYSp9yO4U
 irTCnQQD2k278e09fvedwJbylzp/5DLOI6u8yPw42ingvpd4dVlxJhGOyWWG+8NdZmyPGYaSEcK
 uory8Vx8rUqpJgD6ryqshZjveLX4ABrJOP9YwjuaNqnjgyLav+KQHnVbMmZyoQeazoqlxqWRO3n
 toU7LrAaKg3hqiy8X7DlcXo3zFXS7rZ7Lefv17rg2VbuftXWQHwAp8P5oh7rUcNGa6qqU19s5Lj
 L+iU8tTiJlMDqjbNcrPAblUg+Xf9uY5Sy4PiomlnpPur0Ovc1/jJsGPhjQM+zQtbpHU1mPSGyAv
 sU/dvyFvlcFX9Yu2dXSzA0cYJdeDahFY4WfH52EmM0GJlV+pCgO+HQ3kVeNmIy3tzXQsxJGZ
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cbfbd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=nFJzA57K4K8usXJIcEUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=961 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_072918_705105_98CE6426 
X-CRM114-Status: GOOD (  13.28  )
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

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> After some digging in downstream sources, it was found that the vddio_disp
> regulator's output voltage is 1.8V. This is further confirmed by the
> troubleshooting guide. Specify its output voltage as such.
> While at it, add a comment specifying the IC, which according to the
> schematic is the TI TPS22902.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Not sure what the troubleshooting guide you're referring to is, but
nonetheless

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

