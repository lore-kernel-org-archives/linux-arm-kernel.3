Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C99C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=; b=hOsWcWIsFJXPgPqvcEl9iepwoH
	w/zrErG8Ew0RizxFus0/YJ5oeVtcvWJBKTjXiIOwdq1vRH3fNujzbDcW007nVuUaaN3c7d71fe/2S
	8xEV/h0YS+oi6mfXIh3qDC0bzgiulO6OllKeqTkKtTs8+f4s1klmRywhQe+LlufXx5PHk6j1ITitC
	O/Ku8uLup/wKsn5TvNICtMy8wRyRhaazygGtwDjvm6SwkQIOu9dqgaY/3KXHy4sfEeLCpffukv9VR
	deHtmlyMPTw7vGJG37nx+aq5ykjJ5nGYC02WBOUl1Dp8SL4u0jVb+hfCwLLKcheT9k67yJ8wQqTaY
	Kex6xgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL9e-0000000ACoB-3Mc3;
	Fri, 25 Jul 2025 16:20:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL3z-0000000ABiY-1Jto
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 16:14:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P92d46024219
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 16:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=; b=VFdm9juMycnYZSHZ
	zUXA92nIOBcEnWTYEaYZVS7emlqydaCowoY21CWFScsHSDVVExvYnMTn3+dlby5s
	4hFLISQiz6TZG5bi9tOohYCb2gCWD9ar+XlLTzhbijgIX5E+1GuC37zcPa/MIpya
	Oo+QWB/wZTSCWzJFBHyT5vIqi3kLN//g/8yaVMd6jODWQHGtad5rkobIVYMVlpGi
	QLhQbu1VTEgSBYOY3iL0IqqWARLFc6G4r96pz9jb5jkIpBrByhITf5ekJy3yUGmo
	cGXUD/bTv2Rbch1TAYQSSp7JiozaHKVfDPiHii4f0OPK+8rFfOAqjLYfe6b2gPOs
	XMi8ug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2rapmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 16:14:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b115fb801bcso2854484a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460065; x=1754064865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=;
        b=aLXjGUBr+2wmg7GLF0U049e73aijlIslU5jyEKgMX/cJlhPOZ/jwZMeMTegGZC8Vwp
         MzsqE5uxovExDEPPmbV0st13owGeEf6OU1OHsQB5gQD/IypYnqxEY22lBkZry86z1I7T
         Wcp0OPJ/rfElkm3cXgSxOmFLZwmlmuyJv0KcFmd1imRFR17Dz3IK2Bmj0m7gDmWFihY3
         ZOmFyv1QnZDC6VNjFBo2gl5adBbZfiBd7AxCjPGGdIR+t5pBFdFr8LQePv4ebo8WYzPL
         6ewathHjmkVYLK5XKUNQr9tJca5wYt9ABlDRMrssJ9U+N/iPvj+A5BMtertRD8F7Sad4
         /WMg==
X-Forwarded-Encrypted: i=1; AJvYcCUyK4T7QaJbteMjd/CP08iYt/HvMpORkkJe42U1vJYfxcFIFMbaGBfo1wn/1JU5YO49pjJ1asFC73+vX9psU69K@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5DT9nYyY8lp2247GJn7loVH5ufvsYfQm3Jxulh3v+nOSehluR
	xxQHu9l+RaGRCmTGQmEs5dpRslq/AxP9NiV7V7Gbn4NRQBPbGekwwlkWt7PSn+MfrTuWb3HIkFW
	xU76dlMVFXv6+3uJWkWmJTgVLiNPExIReuapmh3XwEazWV/MsJu6nVuJZWFIka2xPMNiWg4K2EL
	Hzrw==
X-Gm-Gg: ASbGncsBTYGMWAThuv7s3MxzMh38/H1nfQ8723TpL1fDBpXm38lrw7yigM8aY2sbyAM
	9DSTD/fcBIlj7njYwbett2g3/sATPT8ZR8PLngR0EHIvkhWKEjeX/zPfLp+kTVkL4OH3z3c0d6e
	MOqP0mCEumgQXwJ7ZYIKDKfMvGvWmAn1vj+WUPfF92GoPa+ZlswIeVojocJ3nwAhDOhXAdTb9nX
	UCwt71LTrhanzT11ZcT6uz8AYxdo8j0w20qEvaEm5pPa4PuNnUq7Q9wjUHEXzfAuDlv6chmbPMU
	7+DsJL8d1/igh630yPPtAlGNU6t6RfccEhMg7OeeZwl6ZGCdNm9S0ykR7bXe4K0Ez2kooETrCLE
	eLgs8uNPdnEh2Uw==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id adf61e73a8af0-23d701eaf4cmr4483518637.40.1753460065407;
        Fri, 25 Jul 2025 09:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH45mowQM24zNVVrDWA1OAKen9/Rncat1udl96ywd3HTaGlMrzSKhS42XbAwTPbo2lmkT86g==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id adf61e73a8af0-23d701eaf4cmr4483464637.40.1753460064981;
        Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8b0c60sm71215b3a.126.2025.07.25.09.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Message-ID: <12223a91-82f0-4889-8f07-bfa5833c8ffb@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 10:14:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=6883ad62 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=XWXL-kdBtCKZFopiRrIA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: lhXrHYk17us7LItgEErDW7Dms9kfit1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzOSBTYWx0ZWRfX02ywXXD7IHo5
 Z+aelVmMlN2bgvyKYYxebm3qaLvRWv6LYF3xFsv2JMrr3bwn7dW9mXrQcsOX0w61hHaNeS4RYtt
 Cb2m5b561GzaHIY7uBcFsqYMTodYNEydsXr2Nmrqa/GC9olr9QN8cDtPK5lt2mYu/wgOfwcHC53
 Cyypuv1/GKQuOb9TRPY4yPtHipO4YUh+52hxOQezWsjDpCcBS+VC1iMq6gzI47YyyPoMtr9R6wb
 Un3xcj1Juw/PNmq+S+fU9v8qzOh7TtuF7ppjXPZztcIk7SZQX6WB6h1Et3TU+SHv6Ev6yaMfSBM
 8YkAWb8zwdJOKR4dzd/7mydqeorRvse/LxYIj6Ork4O6nGq/NkYR/hzKzC3QwL1g03ofm167wAw
 A68e3Jhc8IsLFDYZLqBmC5PvGY9yW8brqhts5Yo6qZZ3nMejDU95ggKlXZMyIz/o2H5DfnA5
X-Proofpoint-GUID: lhXrHYk17us7LItgEErDW7Dms9kfit1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=804 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_091427_370814_4175D1EE 
X-CRM114-Status: GOOD (  15.28  )
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

On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Patches 1-6 pushed to drm-misc-next.

-Jeff

