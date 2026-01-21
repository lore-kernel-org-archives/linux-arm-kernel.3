Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972ABC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=; b=pKt7ZZqRQ2hnVCP526z7KHhc9K
	KRrPhWsuicc4eFrsLF99CP+CoLS1ms77doHAPLBoahQO8tnliD+/2oJTw6596D3l6KZKCVB2O75Oo
	2ZLDfzUTY2tWHULwq4fU4Y7aab2NiC9tr/Yq8619Cj10UXA0rip3kc9vBgkkU/W5+Ht6L2dKLtbQ7
	fqPX2+PrFGQeuea74UaCjd1EnmcoXZvsZoPIq0ae5AJiF+Zxo9na6tYrC1P1jn175vy04g/EV1sFn
	XivZWfHIwGIdMJ+TC0SVFv5luUlqPIxj/fAt1EvqwkS0BakCBZTU+1lw1q7VZuu08RaQXI7MNOWYa
	XHbX617g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibZ2-00000005qYd-2ikj;
	Wed, 21 Jan 2026 17:00:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibZ1-00000005qYM-1B0F
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Jan 2026 17:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=; b=mhOf5V/Xj1B75Rd3Eaqycr5qCy
	W55FUDqaK/vONoDRKWoLm9Cw7AXr7jjJpUrZTahjAtZ/+4GdrOsznQhFkSk+MwZr/qIXeUombAIdU
	ss33zPs8Jsvi8Ml3SgHloSYGHBAq58oTqEXJKOiHscgXnKhVbb2tLy/ISzIk59760pLbFsjVfxZ7i
	597D6QSkpixecb2q0MMz1Z0V48Kc3O8HJTF54o0tB3JQ8W2AnsAaK6cmeEYMUWcrVaVuVLZvOa8qV
	5SQOY8raRFJSFySJ823uAN2HTvQytB5fUtfN9V5SiWoi+uLDAKKBUBICeca2vnF0FkIPcLICfOuf1
	IK8+MW9g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibYx-0000000GSEu-2gbJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 17:00:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAPnrg3229040
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 17:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=; b=RxIJUbuN5E5tMSZX
	qv64isG/bBFQzWvAci2JxYT0lrGHH4+8mRte9Tmlx97SLRJk4xCKhkRhJrc/4MLZ
	2VQT4rMqYubJL2zuDbX3u9Ksjbe/SA8pZcwuu9s2HvbSrJ824zWUgKfvGgxt176a
	1ezZk3ozn0GEIsVuQCEO/+ktUZ5ozA0V/53Fc2Gi3tXV24tY2397KoOf+T1MuNaC
	i2NqtPq3vFzAvT4KmtEDVakw5ZrKQx2TFLI7+3yc6ItVbt+8B0DfkymY/42xDpgl
	/7Vs9CBP8kD5/lwCETrEMWoBUuFrr/bbfpKfdGBdN7Za4YwEd0/ScWChFsqgtot4
	UlyvKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqvpam7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 17:00:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5265d479dso824985a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 09:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769014807; x=1769619607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=;
        b=bzwAhpVB1Hb0H4Zp4/ckjhCwQ1cAVII+A6Y4RhO4m0g/vVvnVZltOYh8A/t9YrvopN
         1gi5dAlkfWTjIv6vYDckWdlOwyNTbym6M4KvBBm6UPRIqHmxT470216iQaPinlZIi06b
         EtXoUJL1Pyuq33Tw680Xs3vgfcvSap4fzJ3YQxm/lUMYBq8DB89AzalKCh7CWHlPgx0+
         PpCcjVJ4EZ65MhWuAMLqjPLi+4FaexU1c+cqrokbVpNbPZ4+7ApGVQsG+9Z3t6LwzRCF
         7VQ+bzVYN6weY8p4E85Yiim/s0bq9AnajGYB84Dsf5CRQuEUA4bot+qE2YQ3epqPyVnK
         6hCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014807; x=1769619607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=;
        b=gG0Kx5icWTCW0UDbWnhJdPDeUaBudD3sRfwxlrkFa+F7uBckekcs30jjPwQtA/LaEa
         WEOGYAe7ADcYeXo1sWQPfF60Y0B3Ar/jxB+S1IVLuIjTHefH6La3X6wyed95Sq0w2zXt
         191tNOtJqWCZngSLaIXyD6BS0CGwiCagqr8XTPxHpXXktb8aF/ZoZtNCa6zTaFrxaxCU
         UGYaD/xg8RU3sHxtQKIEt6NCTvjqddcDHNWaZy9KEoJVPq0kRbv3V2r3eXVmCXu3QRmX
         f54oM7ERWJs5XZhb5pEHT6QkOWC7CwLoDKzxApcktWUA+3DWResU/F31XXlxUg7SFjDw
         oOqg==
X-Forwarded-Encrypted: i=1; AJvYcCVAE87Sy2eI6GSkvwP4UsthU9lZw+/tmRn5/TqFYcME0jalztkDvh7yfrWqGb9EdftOcvh8nodrP20eOYisxMLL@lists.infradead.org
X-Gm-Message-State: AOJu0YwoTfRehBj4gAVeE/v6KC4zC4LDkGdYHJup5e2B+OO3WRidlByl
	gCpqCSlHhEq+VMTLRxOfQ8EfUkwsJ9HBRNyfvG34HtuePQwF9iF61E4lywt1T44qE/Vb8Bu4eRi
	/lseNQpjZ8PyBSttk5XH/Vh2/kq95xlD2JblD/gL6Z3jfIqvxDW47wmlQCloiNGU80NSHddy4rk
	VhhQ==
X-Gm-Gg: AZuq6aI4QtczT3vGBjTXnT0MoZm4JaCvWZqMpXCq7jClH7QEnX31BsNku8Zr3f4PsPE
	4Z9OwllRJzNaE/Bu9bCRnRkV9xx2IFSsY5/cyPJ4qL/spniT0n64hk7sG3FsdNmOo2oSfapvOQT
	qeQL+YX4wD0hiV+c4xdhVN+gMJTfzbLGlwHNhUsCjcNsrtCS9Fxyxk0OP6qqcnruABn6v1kWYp6
	jiKKfqXfu0ORx+IB55Y/ywRlgrCitOBws81Lo94eg0Tk3LWiv35pUnF0eIKHPV1xFQlogIXzFmQ
	ct3vqDK+I4DQrQGnqIEkpKCb58pTapJpPHtQ5wD8O94+7TRHtBc8YxRW1sQ80/v8HG0V2lPSiGR
	JBHYuKyuLAA64r6+6oQMSTuFbCU2aLo4BIonZw1jDfnfQMbpBSfgzCJ1LO80IfEjHoiU=
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6a6799061mr1771911085a.7.1769014806055;
        Wed, 21 Jan 2026 09:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6a6799061mr1771905485a.7.1769014805404;
        Wed, 21 Jan 2026 09:00:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a192b6sm1582377366b.59.2026.01.21.09.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:00:04 -0800 (PST)
Message-ID: <be5d67d3-1909-4a05-a4b4-c9efae4ba911@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lDaQCYvs_q9FpHN3bnLDwuFZQZ7BCP87
X-Proofpoint-ORIG-GUID: lDaQCYvs_q9FpHN3bnLDwuFZQZ7BCP87
X-Authority-Analysis: v=2.4 cv=cdPfb3DM c=1 sm=1 tr=0 ts=69710617 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=I3w_ynYpeOqJdckr6GkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MyBTYWx0ZWRfX61EuR9mX0+cF
 58+BJVMc72dezsLe6motLi0jtWdakg4NYjb7Bl/Kvs0NAd60pZR71yhDRGniNxlWtcBS3gkvzk1
 yvuSZy5jIYTe4rg5vwTs+fw2X48VgB7g96FnR/U31vi4Lt6NHB6LVqgbMzkaGFtHleTfa8UUA3s
 t1JjDn3l6+sY3APFUaZ1Od/sQB5dFd8QlVpRRvUsRu7AVVvO4/DYv5JwFjp1vf8Ky8Uyb+1aoXO
 OfxZO7EMlft/s668xtYYFaPicFUSiYARWuKdgz8sAPmVMbj0Sv4Iiiuz2McxKnZK0ZJP/r+zUjR
 wbL3nDBzGaeDfY25QoAPx3WPu0Sap9ZChJKnx/dZo3hsJIiXzljlpuN6NazmuL7fB92OM6OfbBf
 6FitQngwD5cPqB1+Y1Oo3/e01qnIVRYEj8m7I5we4qM50mLIxj3l0b64lvbHOlbi7NeRCewxJQ0
 /K+9St+68oxEYqRgqyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_170011_939880_2E8A94BC 
X-CRM114-Status: GOOD (  24.19  )
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

On 1/21/26 5:01 PM, Akhil P Oommen wrote:
> Adreno 840 GPU supports UBWC v6. Add support for this.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> << Trimmed the cover letter since b4 folds it into the single patch >>
> 
> This series adds the A8xx HWL along with Adreno 840 GPU support to the
> drm-msm driver. A8x is the next generation in the Adreno family,
> featuring a significant hardware design change. A major update to the
> design is the introduction of 'Slice' architecture. Slices are sort of
> mini-GPUs within the GPU which are more independent in processing Graphics
> and compute workloads. Also, in addition to the BV and BR pipe we saw in
> A7x, CP has more concurrency with additional pipes.
> 
> The single pending patch in this series in now ready to pick up into
> the msm-next.
> ---
> Changes in v5:
> - Dropped merged patches
> - Rebased on top of msm-next tip
> - Link to v4: https://lore.kernel.org/r/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 30de078e9dfd..5a320f5bde41 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	u8 uavflagprd_inv = 2;
>  
>  	switch (ubwc_version) {
> +	case UBWC_6_0:
> +		yuvnotcomptofc = true;
> +		mode = 5;

Downstream agrees (and they do a better job of using field_xyz than
us this time around, I'm impressed)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


