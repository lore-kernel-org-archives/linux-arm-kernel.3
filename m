Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AEBC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrVdlXQhwAviji/junUKUi6SBanWhUpShBjAwIaBg80=; b=fPYpk8jxZu6VPj71QjHyZUuyvx
	aw8PoFC6+W0z4U5mTAR2sEHVpCsdYyYQ/TSyJdxIoZyT8Ify3OKdOv1ZlKyH7yB2MonQjtABnvm/i
	pWrm1FpHOMcVL92MH5Apwlgq3kxiq8kyMYEx8KLqk4+GMjtNhwffvW1Hrpw0frAWlScBhTToQzkw0
	NDdxHBN52emNzDx0Jgez7ZrCgdrbtfUn1jISf9EqzkZTFchA4HLq51ctETqDY6q9GCq5H3+6Fhmhb
	pFh6C5zdcuERAS90tJ5Lbl/xjyGTq3jlL/SQ3VdzdETHDVClrp/HaqLbNYl92od86p2w/VrDjDjUN
	TSX9a9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84G6-0000000FQOU-3QvN;
	Thu, 24 Apr 2025 21:37:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83Dk-0000000FLQq-2PJp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 20:30:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmfXa011525
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrVdlXQhwAviji/junUKUi6SBanWhUpShBjAwIaBg80=; b=Z7+mfPAGnR09NHFV
	KLkeeJm3ChXIVqJ8GC/yJbRe990eCzUB1qJpd9v8c+nWi/1FsHZ4wOfPfqhy26Op
	uCOj/giDN/qRtDNuO4KZt0RMAu+JwCuHxGRpOAfMXi5vSYZEtyO4Pjrtg9y05FaG
	FjvX6OAc9Irx9xhguvLbAuxcIFPNo5XS1DVtmklYE1xg29kgwLa54Nhrfv9wJ6ly
	QZpOMSL1m5P4/Ad1eQ4hCLTPeone40T3t4hiVCnSwccx2oHZPfC+/VfCH4+x/Ss6
	ZkYswBq+ntvtLu3Sw/kMFBAzUc0F6LwmxCN32qto3ZWyGDJlISQpYyUYbULX6MAu
	zRPxyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0eyfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:30:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c545ac340aso19958285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 13:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526653; x=1746131453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrVdlXQhwAviji/junUKUi6SBanWhUpShBjAwIaBg80=;
        b=pDnbM4Jx/wjYxZkaayZgiPzRYGRjXHqVxyCkaUrPa6s8aiVwUm8m2OLRQrbHap7Snk
         Cou45RC2oP1hyVD0GSaClEwHKA5iYEBoP9HZ5+H1tRzJ37U/Rv2nqamSZ3H+Fd8l+udv
         IZRaBwM1Y9gVM36QN14YMAyAHd6pROTAugbmcAiUrov42Q8C1XQLLGF0TDSCySVxaf24
         TPtqUVXYETWjPK+xUlhLXKVcNr1THzBVVuuPqFx2xZUOp9J+vspHzqepJr40dObUKW5w
         OGm1iL07RJKk/Wdg+tW63b467/ZIc7S18jC6KFUo4Jse1xTIyBIgwceRMTCN7YXKL/aa
         0s8g==
X-Forwarded-Encrypted: i=1; AJvYcCXRm/8CdePh697JZapUmQg5eZ/jETV4xJuEpplfTMAcqec1dM9QJKf19UP7rzgjWaJyZcBuV6e0wthycWVfw6t4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwkk7ytHg70zAPTWBoHoQbIygQv+4X+bg6j/D8KtDjk3cK8ZFM
	1H1rgL116Pjjl29G4eA2yyXwsSC+zetABDdUwX5EuSMshNRo8hfrDShFRoG21jETwj08Xf2Af8W
	kwCEis1bjdRpWnQMhuzg060ImcP5GNo8Nzbmf55NzHdcauCaJY/IkcZJudTEuBAsTQyjn9aFnUg
	==
X-Gm-Gg: ASbGnctYT568f6mYNsaDoX8Mr/koyYIbiuTkimejqLng3uqW0s4gF+dpn8/odhSVdi5
	b1nX0LKh42FZ+F6dYBwquiqKW2BxafFFZQwD9Q3Je3PoD2dCzWSVKsNYx547WbaGD9kU/smJjGK
	H38fxIy/iU/lnAC6zeFPNn95fRGd2O9VnSTTgvDasopiwsCr5aEw4vRTcznjZCfKvUfGm735ZJj
	nmAX0WA0PWVaEVKvrhIH9tyUD8Cog0JzsQSBArMGLSZj4da9Q+hbG2ZkPNcL8jF1CQJCSb87xRc
	Tkzh3GSHzt8oAuqj1oD+ZbwEllGCG2V/ijAoTp2ohjlJVkWKgZaZylqHuaLu2AhWtl4=
X-Received: by 2002:a05:620a:258d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7c956e829b0mr246689585a.2.1745526653222;
        Thu, 24 Apr 2025 13:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRa8MtoW+3I01aUlFs+8CuH59Beo6wFJpbOz4qs/fVt4IP/6FFeT/Y8XMq6k6m3P0kyt9hcQ==
X-Received: by 2002:a05:620a:258d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7c956e829b0mr246688085a.2.1745526652896;
        Thu, 24 Apr 2025 13:30:52 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a47sm14437366b.104.2025.04.24.13.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:30:52 -0700 (PDT)
Message-ID: <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8WtbxyhxICx4PodGrXkJtvqWfNLYsv2i
X-Proofpoint-ORIG-GUID: 8WtbxyhxICx4PodGrXkJtvqWfNLYsv2i
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a9f7e cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=7qhtKZ1Szi6igWG7shAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0NCBTYWx0ZWRfXwDYSsu2ZUJYN OX+qwGfNGO59pmD5wthpdBkdiY+Bb+uyqMRVVlFzRbzEYq4i74QpeHU7D5nNLWqpSRjQn6+MIaa QEwv663W2j9fy+5IN3B2SdXWFg1JhK5+GCoYZqlMt0SqCPpFFeIK6Ly2M+kdg+C3pCT1mXouPAM
 0NY3gdhxUWcCNua5TfP2tCGETaKrf11OVTIhvuolaZJtwYV/CRBET0XGCykJGWmR3wYREjHxNKh Yi/gcY5UZo2NcT606fcfbhnP8R2gjFdOEh16iKZUV4GfrC0t9WONIiMob1NFbF+iQksQEte2g4t u6vAeV2oDiJUiAIOEmUJT2MFZyxgJrvQO17KAS3APHWo5Cp8UV+nnj9UQlIHc76iqZ9RbikE92a
 mAduN/r19otCKzEVY+oie6IlWoKhqLHB78bGylCe1tyZ1toxH0uli6SOMo5e39mQuMjf9a9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=858 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_133056_619114_8BFB4C65 
X-CRM114-Status: GOOD (  10.30  )
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

On 4/24/25 1:58 PM, Mao Jinlong wrote:
> Add new coresight-qmi.yaml file describing the bindings required
> to define qmi node in the device trees.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---

Is the service-id hardcoded/well-known? If so, we can drop
this devicetree node and create a new platform device (& probe the
related driver) based on the presence of qcom,qmi-id that you add
in patch 3

Konrad


