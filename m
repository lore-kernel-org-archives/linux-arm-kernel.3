Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D9FCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAWiO8jyWxuHFA9LI2PneskTKm60NIuJWI+rTsOF0sM=; b=q6Ax/eSqKEGFNBrZRKISJzSi6O
	Calhz7rlg4AxSGqqSbIq10sXBB7EXO8+Y+8YcXIAfoDMyyvYOSJxLlf+1wWOteagRb8v8Y+ujcHHg
	IkXInWRaEt2BqZac+J/fEKTZhi/9oX0EbIiTQ487oXjPLg4I+357MF63CrJbtbm+crsbgY3zOx55y
	YEvqVhcavK7WjoO/NhyH9QFOSyEMLT8EdDbohXnAjVwCa1KhK2yBPySLKGYhJUsI/HWD/Lkt16FtA
	XyIWIH4/JuM7F5cBTY/qx38DrZRIHJOkx0V438jr/2yVqU4fhI1nbl4CkyN4wZRMyLzBIiYp2Lx2i
	5/tw5nXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeRK-00000001NxW-0S8T;
	Wed, 06 May 2026 15:45:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeRI-00000001Nwb-3Vfb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:45:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646DJhq9529231
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 May 2026 15:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAWiO8jyWxuHFA9LI2PneskTKm60NIuJWI+rTsOF0sM=; b=C3z4/vfsDyjTFiHD
	ZsGZY1tqAs6+zstnqi8VPB3L0comfh/8AmhhCk2hf8cdMH5ckJrKVAOE+PABkYou
	eKgDJ5Ac/fH9LriqF9eIge99JjYckYv5eqC77CbD9hxotOytvOb10MvyKZYnCfyE
	LhcEziYQcyVRB8yLHEtooq8QJi6nI2zs5UoLwbaB9QAqU28V6MTIAtm91jnUARAI
	wbwVhpIXidol08Jyrh5tqkZpNZeo93RMwJM3nAAzyt4jISLYwReVAzKo+QvPtR6a
	L/oJ2LfNVvBbjr2bm3v6b6+h3PCK37imXCUoYILowiO2aBX/8dhZZn90vjoJLebz
	3V1Vww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015xa0r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 15:45:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so25337941cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778082331; x=1778687131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAWiO8jyWxuHFA9LI2PneskTKm60NIuJWI+rTsOF0sM=;
        b=CFXx6zhIHNirO7aONpsfi1850FL3aXxaZWwpBB69IizNYwEa+cWQjrM8orw689w3XP
         SFAKEnV/fxyPc1HCowjKfybpugEOiaIvB0j4nY9Rj7da0nmS7xJ9owe+FWyFi6n8gd6f
         xb2yzmtEtJO3X2GtO/k9jKEdCg8HM0+tqlDyF2dfqPeSnknBoh++OLW9BTsHjhivQuD1
         10cah/5OtkRtR3t5UWAuQ8HeCJ8S3cUmkm5nEI2wM2LqW6FmaPxCqzSYiGxK/dCghSCV
         FzzeQCiz7/AS6TBAxgT3IwOguGTro84Pdwmheg4nvRtrSQBAZ3jSCEObxtzXKfUz2GXe
         7QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082331; x=1778687131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAWiO8jyWxuHFA9LI2PneskTKm60NIuJWI+rTsOF0sM=;
        b=aaId1urkwPC2wx1yLm0QelCzxLOHNwrF3Ci/5UzafAQRwcnOmdC9K89UG83+x5n+ie
         VE/i+eTTp0oZr9zyKBQI6xm2nxyHF6baCn0X5PohuY8KomQCOLQnZxgf7TfHmH9mZ+Xf
         8puZt4Yo2GiQsuhrBcBaTEzAJm2Dus07jPBoIHdAJHOmK/8IHZhAjs4ocq/jkwcRe+dX
         xeKh8XzWRuPzAfVBbxeaa3dIkra+80WguKbnUNXvO7Xv3ioMg1Byoedae0ynU8unyNP6
         QQvZDiZIsBOniUV8fKyVFfyL/vt79qc+mHu39r9gkIPChTqg0jVb//m6Gqrrxhm+xrIP
         PuXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OlKOsAmUoYPoQTJwAdmG1dGnV7bfiqogHDeR92/35ZeFS+jpoh3p9ogI63bXHor1dZMOWE7Ur+VLviDUy+4+C@lists.infradead.org
X-Gm-Message-State: AOJu0Yybj5STL4JGP3TTu70VD5KVSlJRQC0Zl5uXn268kDWqo9MTca7L
	ftGLJNaeV7GF1ezOqVVx/ILu9EpnEREvGXN1d4d5HL1nZz3AKqtY3XnqdqA95pa5hszteo3CHKX
	oC/XIe1B3o5bxiFAmO7jWCC9DBb270yrZrRsVoLSqwLWEia6az0YlCHu2y3xAKoP1I+xqvrzaDX
	q5wg==
X-Gm-Gg: AeBDievIWI1lo6yPBIO1wWRr8yhvoBtspqEDgIpiuNPkNjhpJnQxN77U0qY8HxCsiuE
	4lisEkngdnPlizdj/V2xX2sXQCIQrKeZX+xcR3k6YQ33DTuLjg03WfMXae2QL4cyNIFciYw+k/O
	o/DY+l6yUHiXVNVHHvb4qB2uNSq8om+3TaEKsddTOudbUzXMqdSYL1arZcsZ+xSDsMEhCBze5ec
	w2MrjVRrS5IuMihrdwPWR8kjpnDyqZQNsb4M2iOFzbz+/vUUE411UAU+MtiNaYNREtgxoj4wvpU
	nEel7S9RFISh4pylU6wB8mm0SCT/L4PvDKNgxgg/IoA8Phyb8j4zVWP6gqGqV/2XGdS2wSEzvxz
	VFTzDtSzv0YKDVu2ho5IZLpFyCCNX681Gg2SVLzapAfLgcRQ0s0YUNvK9VmW4gFj97PlqkZumhY
	PYPVPkfdSDhHqpAMffaIw=
X-Received: by 2002:ac8:5a11:0:b0:50d:815e:7977 with SMTP id d75a77b69052e-513053313e4mr105266841cf.34.1778082331312;
        Wed, 06 May 2026 08:45:31 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:50d:815e:7977 with SMTP id d75a77b69052e-513053313e4mr105266011cf.34.1778082330603;
        Wed, 06 May 2026 08:45:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895cb5sm51330525e9.1.2026.05.06.08.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:45:29 -0700 (PDT)
Message-ID: <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
Date: Wed, 6 May 2026 17:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
 <20260424-add-thermal-t7-vim4-v5-4-9040ca36afe2@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260424-add-thermal-t7-vim4-v5-4-9040ca36afe2@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69fb621c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Gq1lbteDWWDUjDXoEKoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VuTyxFkupZXQFJlCYiq4T2UibYvcJt7D
X-Proofpoint-ORIG-GUID: VuTyxFkupZXQFJlCYiq4T2UibYvcJt7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NSBTYWx0ZWRfX0WZjJfzUBEl9
 SICKFiIFphEPw1+7jgWHqnthgo9qT/mxWNcHtR7CMeKIB2yakjYqBeonZt2XXJRifZJUcFidvYN
 5/tGP9r/ZZUOGLa5FztuaKwKgoNNBXYHVaMp0NyE5c9QvVB9jboTQ9jU5a2+KKHd+JeOYNfeixg
 etvP0xNaKbARwetksS+AzXeZTT2IO2lSLbTlqPqKvpUgNu+0QEq6wtYrLYuiWQ9CmyEKPk+t9ZC
 xb5TaGuffYhd0bXe8GtP95OaBhxq9MuzvTd2u24r3+6acKN8Aph48Ztt+Q+XxqKUBWNRlB1E8S/
 Dg7np1y1rY+Da/X2baaA37nGGXQBA7bgexvlWt4ae0OTpSQqdvnarw5/D3krhLIMhckp2aXZ6Nk
 9TJbOp6HXgYvjsOw03ZXN+zzTGjGGIOM6Ok8535kgs8tJJV5IVOai9483aBZPDxKieU/TbL/v9V
 oVbxpo9ZdVwNwEVn/9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_084532_881722_9430D4E4 
X-CRM114-Status: GOOD (  14.23  )
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

On 4/24/26 17:45, Ronald Claveau via B4 Relay wrote:

[ ... ]

> +static int amlogic_thermal_probe_sm(struct platform_device *pdev,
> +				    struct amlogic_thermal *pdata)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args ph_args;
> +	int ret;
> +
> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +					       "amlogic,secure-monitor",
> +					       1, 0, &ph_args);
> +	if (ret)
> +		return ret;
> +
> +	if (!ph_args.np) {
> +		dev_err(dev, "Failed to parse secure monitor phandle\n");
> +		return -ENODEV;
> +	}
> +
> +	pdata->sm_fw = meson_sm_get(ph_args.np);
> +	of_node_put(ph_args.np);
> +	if (!pdata->sm_fw) {
> +		dev_err(dev, "Failed to get secure monitor firmware\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	pdata->tsensor_id = ph_args.args[0];
> +
> +	return meson_sm_get_thermal_calib(pdata->sm_fw,
> +					  &pdata->trim_info,
> +					  pdata->tsensor_id);

This driver has a dependency on patch 2 and 3. Shall those being merged 
through the thermal tree ?


> +}


[ ... ]


