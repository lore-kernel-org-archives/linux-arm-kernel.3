Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813DDC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iqoOFkOMxkEavyQAIIyueELJpmJHfQksJO2ArqPxus=; b=NcbnrEmwl87gzPq8sMcVhQMwZH
	ckAdWNX3PgwsDhIgjMF+elktGoJJOrwtkve6oOJeyjZ13Y9tmqXwn5IlONm5U/lw9dTiW9thDZJ27
	3hmIYJLurFGtpW2RSlCrkp7n+8qYwqJpH8+82kbPD1OG0F6Bwh9qhnje/MuF/3Cjbkv2l4UjQduKS
	cnscW48jyN2iU9vqW14ee5PofP3rH6HcEFpRXSmUbQEjqMPZHf6EDIScoVnVHk+yb6c5XzXuMEAAW
	7sIOI4TMBfFsZuexQl1zg40qr8TqtBjjYpIhBEaisL7cC7jYlA53f5342ioaiF698J21zfhj2QzF9
	0tcPr5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG5l-0000000D917-2qwf;
	Wed, 28 May 2025 12:41:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG1c-0000000D8Gq-0igW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:36:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S79Nt1000710
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iqoOFkOMxkEavyQAIIyueEL
	JpmJHfQksJO2ArqPxus=; b=Rk8R8F3Lq2mtJAmhJRQBtrdU0JLCp4axi2aLgC+I
	pYOVcYfwRVTlgWlBmsVE14GqMqLi0QPjXuurSztCbJ8l+MU6AqDkuLtyWceH1aFM
	4v/e2HuVvv4KybkMOpREmsRksz9mc8M40fqpjmEk95KGSu6nPmkWYzs6Vf3jsZp5
	bwlERrY3LH0hsfewE2KQ0azk3M2PEzQkRdAu2wgUeMTAPyG9dE9FcXToOIVsC+sn
	216W9qqxk2OzUEYTsVmHujXf5TYZRBhyLnj2+e3S8NDA2shMiTms1nPMF8/9bLcq
	tvMRIQL781CG387gzCGkiPh5jmi3OfRCa2GhvJoK7R1z1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g926ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:36:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so485002585a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 05:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435810; x=1749040610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iqoOFkOMxkEavyQAIIyueELJpmJHfQksJO2ArqPxus=;
        b=IMjjQIBtV54zcPX1eMzLdGDCGlUycf4gis/6F/5/UpbSf33GIDc414NHw7OyuJZlRI
         W9bLpiE4DMzv1r8GTttShnQbw5JivMoJnvRx6KkXvpfAHdDu9RGc09oBw0mjujmWcNrz
         P0Pa0h2tNuqOzs902kNsgp+KM3RbPnU1kaHhhfJ8a5Q/5gv0T5Dec5g7NKrGYL+miOmY
         KEDayMLabinHlWIigWrt1rbciWZuPoZzflB57i0K+LMLLn4h0y9PzERLqMotSzvlMQVd
         2O8NhwudCuAxq5VEdTdW78S+U5IOSpGAHZ6mHXbQyQUwH6HxJroxUIGi4Xw2UwE+s6Wo
         WsCA==
X-Forwarded-Encrypted: i=1; AJvYcCVVCQPFfNaIPPXVW6d+JvcEDt3tGW4sYqBuOwh7Yzo/3U8pnDrxhIjVrx8ldn0Hrq9RLEIladGGTpfpWEJ85JGt@lists.infradead.org
X-Gm-Message-State: AOJu0YwKPdWtGcbi4CrV/wrEl+BCEeN5WEvfkW0ugU6xqYyFa7EWhvmA
	oQjjvQXOeUiBWCU4eTUHtvaoSiH9srfei5nhVHh2+zPBs5JOkDGwATkDIeNS3xOfsKqnSvcZ+4s
	nCm/Hux7oOhUKUPDDKWNkiYcjv39s5HrIlJ74PKBUy6sslaQ7gNuHsUV8SoLsY0MEzn4YXa0WdI
	ofdA==
X-Gm-Gg: ASbGncuoIfpFwyIHJQ0QwlbibRYO971HNZTgo07rGNT/vvbV3nouubSdZzBv8kjPmug
	+XQDelrnU0UAtH8Xvd9LjWOt+snLHEmn7ZWMFHABbxy6MleHi+DkX6JtmeVlx+poQLMJ4qobAQu
	1Ta2mrkbNAfdGq6N3SW/RNqCTTMyNuDwFK6OUU1avV/itkE81rvlcmYEeOq9Jzco+KUiUyN8dqn
	oVndZVI+ZWRu8Qpks7B/WoZJx9NiT/N6piZjC2FIxz+0/pTvuylEXk9hmitTOYh8MufPZuWBhR2
	LxVtp4rLBtcVvqgvEwrju0v6yUyjHIYdw/Vv1DIMDJFifFQ1soTeEQxxoWM3Kh0xwGBxNxk/Pwc
	=
X-Received: by 2002:a05:620a:3194:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7ceecbe06b6mr2326086685a.38.1748435810292;
        Wed, 28 May 2025 05:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmzZ3O9RWYNfqsDI1F+HWtAjiLwMglKlUfuv0dBseFqNB1H4SfpNa0Y/qcbFGi1IyFZlepfA==
X-Received: by 2002:a05:620a:3194:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7ceecbe06b6mr2326082685a.38.1748435809851;
        Wed, 28 May 2025 05:36:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb954dsm2287631fa.42.2025.05.28.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:36:48 -0700 (PDT)
Date: Wed, 28 May 2025 15:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <dnvjpirgqahdlt3kxcpyhooaovpqnoobetnt3b6q6fzsrsnewr@p4smaofzf4qp>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-4-d58de3b41d34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-4-d58de3b41d34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68370363 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9yGODh8E-QI5J-fucZYA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ilhPXarfoXrNuiv8qvWTJ_jeW5UDhU-F
X-Proofpoint-GUID: ilhPXarfoXrNuiv8qvWTJ_jeW5UDhU-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExMCBTYWx0ZWRfX5s3dkYb5nlNP
 F4gE42xGAZQR3pStGcI2QkKoaRoat4poumjqiLCggWHqaJG7BEKcpUut7BdZIPYm57JCQjHipdV
 ojZbp1nQmh7TTa7IRK+OgqVZqLJaltdVtR+ytb6ewSRilZQuTo1ZJv4D+3bZ53ryu4es7SEMbY4
 ocRdvdqFZR254dtAqISg/+WE9IcO6U6m3b/qtRjY5jFMrQ1MKA8whWzqADET8GngBzAWH9D3A+a
 +51qs1BJH9MOZcKlnTQQPafxyyiU/VwBYqqQgL1w6y9/O58RhJ9Ujfjgu0l4zzNTTkiim3mW4SB
 R24E0D3x4UR4LGN+N8rWzZeJASnULbIJw+SFfUj1x8Ldtya1pHy43dfrUFhd3qElg4+D/I6SAuy
 qn1VIeDYIuHj7p3vZCxyYASiwIJQrzCYHjBCDrZmnmNNGT1cgJdvWhU7dU0wPi5c0NU26lHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=883
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_053652_333111_96F76122 
X-CRM114-Status: GOOD (  17.42  )
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

On Tue, May 27, 2025 at 02:04:40PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also adds the required PHY sequence that
> is recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

