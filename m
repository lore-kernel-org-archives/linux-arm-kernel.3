Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D86CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=; b=m21PBOfS5dI5JkNLe7iJ6uhW8o
	LTqZ+A947rmpZeDZMIgSriLd/Tu6uub/NfPbQhV9yLdDbJ1B0nTTRVgQdJcX1kWXFpoVTvg+Mwgay
	s35YCRBuLQj4iuk5DWcwC4ZZj9I+LHe08uQks+DzCD45s+2kDD390jGSL2uDDTcY4mbsKbYAFPm4k
	NhcNjy1SUUlClRyXJBn85YRGr4+Hn117jlIOz3w5Cf8RM/ByIE7xRS/zmz8SFyXp8LdPa/tBUBL9J
	aLsfTZdUBZVKgp0AtYtbrkayBadI1Kfa89sIUUJzAZcr9SmKjH7fUwxF9albf30ypt9Luba1DFUYU
	LvZrkKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL31V-00000001H0D-27PT;
	Fri, 30 May 2025 16:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2i9-00000001CPb-2aVp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:36:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBbCaT025196
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=; b=hS1NY1XCWJaI/L0a
	dJatO4IlRpSEMzQwwY6c+SNFZcYQnB/2uVSktsWPY/evcTwsqeyAoC8RlpC3jRT5
	PwBJxfWcS17aLFb3MyLV2CuDAdNs1tTCeaxyyHtzHnyQLmbFeJdD9x5lNa50Q63o
	tK5NWCrkoAz3Vd+a0iuaQBZe/GiJczyWL5VGp56jwk5No9co1fSOJzDRGdkezfD3
	Fmua1tTrWJBWsx97/dseKpjIUR4Egok5O8OUgpIBEPv+Zyzv0KGRUXjXIuwejRjs
	D13y+FQ5Tm0r0DiJGB+WMLhkIhJWdzZ69i6suJJNMWJ6ViZ9ISgdlRQMbWenOjmT
	+ru2/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7eegv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:36:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so2297217a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622959; x=1749227759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=;
        b=YH4aEJ1jLFZv/9iBo6I1wybnctrEKllCCXDaQpB1gJv0P6FNB8Ps4aDDXp1DYfQycS
         lS3NktYU76HTyHF+eeNpwDUEnUTprxLcE42PJuWPb5LcVthHV9teyf/gn7teYl9JRDdA
         7TYdxwmth2+H8f7jMD/n2YXbG5G51HeGd8sCrFOvohPj/NQEK/HPdYcd3ySm+zSI590X
         nW/Owyj5oR/UHJAV0l2WVkjHWffRf27ZDkMZsH8BvmY7ZP6jxSaXvSO4PIBq3eaVYYxz
         pWAmPeKwmZhH9+gRdSmB+f+EbZF2Vhu3TrO9Ki7cJBfRWIhJB3fHUhwSUXodIeVmL/O5
         CCzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX08BFFgzt8SZACF8fP31Y9kZHLY4F78unfLmss08jFJQ+qSR1j/fjllk0jBjkjre5ax5hbo1C3TSqkHJw/iCxR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc8VUmXYTKPQjTxjJJGrh6exO+ME9H6ar0PQaVlK4PzgSVHWOi
	Hs4ugepXhCY7L3sDgVpriCwuCZootMhMA4sOpEw09MkdJCT0p4QV0X8PPpVTvQ4AlAfn6lWcoGE
	LB3cqRnK0qM2IFlYCMiaWJ4nVvwyXAcMlIysJ3HM2VWjm60KYaPcKd1ocnFyJxAgOLXG1HDnXfc
	kB8w==
X-Gm-Gg: ASbGncuy1QWK4R1cwjSQDSqnf1dH+ot2+fTAJIws83fzaGy8WvQCVpy19Rd07LqAMw2
	zp+qhTMKf2Yb4loFBlXvG6srGhpVMOObDcKTbaobxZd/ZAGOWkOHgpd1DKpmP/1mmFjBHhwSAea
	gRe57fvKOh/gJdI0V+sy7TDLsHJBg9hhavrvJeYM97G8Wa2UNx0eZ1V5n8VwV+eEqikuIDY1dS4
	Xh5F1cs9kpipa4xBnNbg6jDP32e5XsJUoxL0kXBPpMrPsct3X2YcXELVGrtdulZFIqC5MMtVEs/
	NogDOAM58vXeXCGXhPhPA2NPh1shlgOjfLHSm4RX+IbnJy1/xVMcM76Hh3r+1Q==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr6395390a91.24.1748622959267;
        Fri, 30 May 2025 09:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7gZlETTzuM/nB9i8V58eslnhzSbt76+bQeUPi+dwYMc6LXYsmcqrpPQXpymgaj7IkyAYV1Q==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr6395344a91.24.1748622958819;
        Fri, 30 May 2025 09:35:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c1358sm1544883a91.37.2025.05.30.09.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:35:58 -0700 (PDT)
Message-ID: <bf24ba20-dad5-410a-934c-f5963a2769ec@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:35:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] accel/rocket: Add IOCTLs for synchronizing
 memory accesses
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
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gTwCjM_gl5n9dOz7kilhjZSPicGrdICR
X-Proofpoint-ORIG-GUID: gTwCjM_gl5n9dOz7kilhjZSPicGrdICR
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=6839de70 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=CskBsiFdeBhsZAe0Fc8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfX669ohN7Y/dQG
 8KGuKqCfyVTDB4YLhxvfUwQqTK62ZAInJB4mNaEzIuW1dPGh8o47DUdWgRFoUwpPoiqrrAYoEOT
 rVUmYew5BaTEzSHGRBU94Y0fZV2iIRjk5xtRJU537qOpOp+5xgqMLDgX+9SsCT0BKJpKf0KpTSQ
 7SO/b80/Kcsgo1wBihb1KIQnl4TMyFPECC73GdxZQw1AyYzreqS9sPP/eRWqRwgVRWRl6Hz4jBu
 93zRO2W7frTwlVA+Hx1BIlRra1puWVLzbnRDne6cJD3qFd3o9F+D3sSfjAXdba9dWfBpjXaFR4g
 PBGunq90r3BCuQDYr+oQRRXcVbNuR+ZZtPPqGDaSPgpJd3fT1IlSdxVfBGyc4k/6mFrJ6zowQCU
 QoRVO24G1cjSPfbeMsK8qxdFGLMLAj3oHNbjKdYohRPdEuTNee0+wTm9SQzIeMdL1NZXtK6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_093601_773695_5CE3920B 
X-CRM114-Status: GOOD (  15.95  )
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

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> The NPU cores have their own access to the memory bus, and this isn't
> cache coherent with the CPUs.
> 
> Add IOCTLs so userspace can mark when the caches need to be flushed, and
> also when a writer job needs to be waited for before the buffer can be
> accessed from the CPU.
> 
> Initially based on the same IOCTLs from the Etnaviv driver.
> 
> v2:
> - Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)
> 
> v3:
> - Check that padding fields in IOCTLs are zero (Jeff Hugo)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Assuming what Lucas pointed out is addressed,

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

