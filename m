Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F82CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDBaC1eXq5Juv4WWLDTwG9RBd5emtPKDg9brhkdKs00=; b=xcuyzSyQUEjPYsYy0RI3YzEVnH
	vLghM4BhfjXD0bShdSpR57ZKodaHlZaOwqkRWQZH2tgEtCIIge+J4tZ6GbXvjjwh5R7Po1bvaEpLp
	ccFNkmgayJJerlagGniG3jvtk8ptfqYAFOjlT/Jnx/mInWR4OQxwMdoWlg2YEz2kWozBqz4+2eBFI
	IcU21DmWuHvLlNbZ+XaDkZsx6xNw815D/qZNxMaRezAwdQWskfBpKJZ+Ogf/YdbJwxlLL3HjtK1cn
	b5/GpEkEKucyjBEb33603k3L6kptrfY6bgs+Lny9rBM86/MvWIaOHodNzbLuVvUPqlWTlSlamBThg
	HTiZmrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3aW-00000006b3U-1C8l;
	Tue, 23 Jun 2026 16:03:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3aU-00000006b36-2qBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:02:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZD5d031276
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDBaC1eXq5Juv4WWLDTwG9RBd5emtPKDg9brhkdKs00=; b=jwk1pkc+AGsWUUK9
	dieU2WZWUbpVICpERalDXpEDuZLM9VJPIyIbpY0nLZUanFazpPhCGmj8jpYYRVqe
	rlymjFByyNLcA+jtd4O991Z/3dPPGxCoZl7Hrk+Y4vkJ8y9CscF3LvftTPYNV+Mt
	vt0LP5FUzvxIF+mRMYf+na/pMtrI0u6rD31yka+ieA1WC5LK7OCaQxDExGdDdvnz
	wmjf3uG2m97NlpftWNbzJnAQxD2C5zFAOgW5K7RDs+gYd0GsJXt3NUIE4KKxSvos
	x0emNgfvhqQL1V0O8F858JhFm5y9SUmWvWAND4k7k5dh3xqZnv332eJEW+/FPUS+
	TeP0rQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe69paq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:02:57 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e937d38a5cso9369a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230577; x=1782835377; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDBaC1eXq5Juv4WWLDTwG9RBd5emtPKDg9brhkdKs00=;
        b=Y1ChLECetSZoCAYb+n4JTMjaMa2GlECEF9tuNgU7/P0o3PufXB4fJmbFntNNOADf/y
         1Y5U6GskPwqPWDO/M5vFwMHmFpjmFX5z/+ic821eW9WYdsoe39ey9rAcy1gLPKu0u37J
         0lEspkRq9uixsX7Evmi3tuIkYxsxIS4/6ZLN1CE4bTbW0pmLXDxOGCZRGmXgiuTNXf7E
         M6EfiDIvcqA8cDbzQ7LGbG86HXZXeNWqvD8bdORI+3Owfc2LYPMyvWJ4R2tFPVGhuJu0
         yT7zmrTHSnSuu/58etfos4CLxNPy7ceuUnVfaSGwq8wYD4P6s0Q+8/BRNTFDauKE+dzz
         NbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230577; x=1782835377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDBaC1eXq5Juv4WWLDTwG9RBd5emtPKDg9brhkdKs00=;
        b=enGp7kaLeEK7jQ7ZQEGf30/0jwpPdWdIp2pz/DwhJ9A739G4EtaKmRmYBXYB6XcEc/
         DxGftP13ZnP6AXL5yIHX2m8XdC2vK6G5vboY2NHj7oRCHf9zoKk/sHNVPrdxLMsBe7W+
         V8YL30kRu1bBbJOcXTQgGKxF8iFMPrDWKojB6+mEq2JSSW3ppI0VFfJNWVJtKZLFKYED
         fWsM/QdxQkhKCP9gnAlep/HmswsSK8DBWdcNxwcdXC20VNI2DUIUd/I2ltqfNX7BoW7G
         lgwuwY3GwArj8s9p1QumDgr9YemfrpJZZ2syv1sCrHg6ESbRTAjxMwcIU0PwomIZnTsO
         V56Q==
X-Forwarded-Encrypted: i=1; AFNElJ+UlA7aGh7VFtJIqj7AlHb74oGpckZRPSnVfOcuk1vUoPf6S2MACfyKkAKsXkO9rYTWnwDx4BrE9hzaK7G6wsXB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ouIp8FnOixnGaGAmKvyKfqQk775rMEcks2aFWmJERRFz0YPB
	pBi9YzrKDFWCOpbU46siPmwFZqDqPyNFabbGCRghmGYLqn/BlYnPD6ZZKiDY/M/QsPcxfyhhELs
	k1ax8nGVBZBt5sKe7LMb+LpJrTJvS8W+pMnjOmkNp3ssvva+z1A9tBV9P5QXtRiuI8M774zI5md
	9m3g==
X-Gm-Gg: AfdE7cl4WSw4l2GeK83RBn2lWE+uuVoTiYSHVg/OFcge2c5dGQsuXHGFnZdB+h5pvi0
	nUc4T2vPPiEpNoAMtQsI3q8vfq9LhtGoxNZNPzr7hZwsKQmp9RhumQty2j62s9mJiC2MQOzAKgD
	t7D3BW9FQD3758u50/IUpFPa11tLFGCbb4iKksYETrryye5yYLH4IHgRmV0S2kpYTEa3RfHsFrJ
	bKUFx6IacpSais80V5PuIZmYcyk0pKmpW74CVOq1iyjMiX6ZYUTYc1xDBMtgezPDUgvzqHRODwU
	VKWhq9NAN6+8d8kHNOCS53+kQQ/klIwNSOxxrsBI+n/nM8Rdh1uAoPdSaoVtCXS5OO8oDmRAjM8
	NpVSmbnqe61TBwtYl25YbJVm6R9A98/qj0AU=
X-Received: by 2002:a05:6830:82b4:b0:7e3:f809:7984 with SMTP id 46e09a7af769-7e93c26c950mr8027516a34.1.1782230576857;
        Tue, 23 Jun 2026 09:02:56 -0700 (PDT)
X-Received: by 2002:a05:6830:82b4:b0:7e3:f809:7984 with SMTP id 46e09a7af769-7e93c26c950mr8027473a34.1.1782230576359;
        Tue, 23 Jun 2026 09:02:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86de31sm4777390a12.12.2026.06.23.09.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:02:55 -0700 (PDT)
Message-ID: <f636b144-807f-4a10-bf44-d06b169fce21@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] iommu/qcom: Check pm_runtime_resume_and_get() return
 in probe
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -9XbZ-8J-dH7lKGSRMYImBx-VBUJU1wV
X-Proofpoint-ORIG-GUID: -9XbZ-8J-dH7lKGSRMYImBx-VBUJU1wV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX+VAcCKMNXSNz
 N75SQ9w3oy/SnT10jPRhrtXMsDjCGX6f/uIX1/oMcw8bsL1IHN3xOzIhajHkVB4Vh4cPimlKLML
 GV9MPzWTBYLFeEA+7se5As01Sm0vA3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX13x4O7eH0PzO
 xCWexv9bQtEGxB9pFFY4N+vhTKuLFZm/mOnRDHAOkDCMy4W3lLhexWyu4RQBVL7xrN76w5m+eX3
 4CB0c8EmVX6j1JBvLogd/rT/CfTwjPQmL5ojenMyzYwaIyDs5b/fpaaLgot4XpSqYpSGoGAL6ql
 Bjv+6/BWpeGMMU4JA9m3AQWTlnYB1V06pNMstzfEaIIcyAT8xguE4B4O+VANh7JiqYzNJjvP/ky
 XvoTzhTS5aW0N5JOySy/jkYxwHhLr90MXFuXXPkMoeGCdFE5dFYG8P7tXv2FShhkQQeMX7jlHbQ
 cxYGOVmzDjRC7/eQ2rLA6KwMhlCSpqGaAsdzOeQ62ygCSYN2pZ+1hxKZjTz36VcRG+n+HTIfppf
 +3XNiaSVpa2hTViNx8hLYwFl3JA4V66XEsRkQyKEDs0ponW96+Iz4V6hruh1dJYF4Wxg93cwgFq
 uMcHnhTSNTWO/02GPyA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3aae31 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v1Fw_KadxetzZ5l6LqkA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_090258_859120_991FC8F2 
X-CRM114-Status: GOOD (  11.80  )
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

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> The SMMU_INTR_SEL_NS register write in qcom_iommu_device_probe() uses
> pm_runtime_get_sync() without checking the return value. If runtime
> resume fails the subsequent writel_relaxed() would access hardware with
> clocks potentially disabled.
> 
> Switch to pm_runtime_resume_and_get() which handles the usage-count
> cleanup on failure, check the return value, and unwind the already
> registered iommu device on error.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

