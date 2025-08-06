Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 11:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCmVre5gjeM4nS/wqXusx4xVtaJFxkhLqF5sa87a9kc=; b=rLwBXqxj46Ge8QihghymzvSOYe
	FXqxf7e7DnFnMS/CH+8J2VlkblCuBaqCCZCsJOkvU/1S9PkA6n6R7IKKUDi9695WUOySKQQb2hzEQ
	qqzca1TLZ9+P6hVEN5y6Q3N4WlKa0c3/+gqMl+SWb6a9X/wd6ruCmx7klIN/XMpr1wlQEWu5r7Qbb
	DgWXZGsL1XalBdIb5JZrmr6YLlhJ6DvgvHNoX5INQayxdvS9gesVRJexJbI/kcdHVuzyZ95jt4BbB
	ZhqPfktWPSys/CF7OpDijaMEStVoFyhQRetSqkHxSQgWCPK2QStu4x832yIybXvT/J0eM+yp+PEhK
	5HG+cudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbux-0000000EyTf-046k;
	Wed, 06 Aug 2025 11:02:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbsO-0000000Ey9B-3GkV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 11:00:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b7961cf660so5391384f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754478006; x=1755082806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCmVre5gjeM4nS/wqXusx4xVtaJFxkhLqF5sa87a9kc=;
        b=CS4YSng+g6OQUedhCJUMJZKtQ6fl50svuKD3Dmu41em3VCDdmaZ4vkTGb/YHG3qwU6
         MBMo695yWZ6VRTH29sxUrWjiXHCMp52FdiQhM+wCAoH9baDbyFZI7HjnJjGUtr8OURkb
         gNdW5DeDfbBkA7H5k1hXWH5m7n+f2gqWnKcSqxiYXsJ47z8PTkO6lYLdNCg/eWcSOu4x
         76y+x+BY1tXik7xBVt/+PmNMKNfNFsnm2/axgsqi1u/ejqSxckVVx8jHVhvIVeXi+F9C
         bG4wD+3ZDYfXRloVERW2vMNifFTbNQcTBzal++PEj4PIM8V/CQ3PmZXhZkE1NmSv3TsF
         rnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754478006; x=1755082806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCmVre5gjeM4nS/wqXusx4xVtaJFxkhLqF5sa87a9kc=;
        b=rDY1Ppvaxx3i6gTvMeNhTy9sRlNVNFojeIAuoJLfUU5ItDFlz+uvswtAdYC4zZpNIM
         MmbYr8XwbUUI/4gbQREZ1C0dodzdXPz9r3gNHOz2n8JkVuvdKDnCgm9AfTMaSj7OCZwZ
         0FHXjl2JOxBtxkEuCmmUs/wdNDALj9bP/7Oby8agOF+ApWxLrb3KoL4LbMDnCmdnKSLF
         yJ/hFGmhYHWLRca8mzHg0xsPv9X6F+rnSeA1OUT/6zLcN34YdxfAAC/YOFFhQKpSx5Yq
         dg2KOXYrjRbzVe/OI3xBIRwPFOajtyjnp1HgNBsB5EwfdGILH5tOBbQCQvCHSc2icvad
         Un+g==
X-Forwarded-Encrypted: i=1; AJvYcCX4mnWv0+TldZLYmxSRJkojpZqRFHv0oIACZUPDNZoyXcpopGZgWLTZ0VgtintUsm6oXhMpBRdsKiYkAGoS3I5j@lists.infradead.org
X-Gm-Message-State: AOJu0YxBAw/8NW0nL61Et0Tp0nHVASOXPlHeZSiNRDzzGU63S84xCJ+M
	MFgexkFdjHqj7OLI4orUxv+lc8qPGDifrn4q4AEdgxotXBQSv/G9tLJBNMipmn0UhQ8=
X-Gm-Gg: ASbGncut2EKoE2ohYVqX6PE+JP8kBWn4fh+QKQI7L5r4sWgOq6iijXeA+1IV53h+uf9
	7dnWqPczYZ0ra6oGPUaYEFDrv6tXKY+b2B++qRxB8hxSDz7enbTa732kT7+MNWVpSH14ZvzWFn9
	FVhilms+W21VOX0hQson4zbLcIlD8F7/ecpkZBvhvpCb1IxDO/7DhNmzyFPVHqgFvW07aOURyzE
	BSwTIJQeqP1e170KtH2npUBw3/dsd2dAI2lJO3eXx4+hzMspfZxwlKfHPPBN11UQmpXBbaN3CKa
	o0hFoDLJQ9h9lQpEJ7w1joIPNPadAAELbQLabOksIspYXzqb/Eb6c9I76YrPU5W8rriP8DG2YHh
	RBAL3KvRdfG/41z8j6ipfDUbOo48=
X-Google-Smtp-Source: AGHT+IED1ObJfhfJTF9IANk5X4B6IPDP0k6oF3FpmB8DzDbBAJ47RdFvv8Mlx8ZmKpcul2JbAtAwiA==
X-Received: by 2002:a05:6000:2001:b0:3b7:8d70:dac5 with SMTP id ffacd0b85a97d-3b8f48de435mr1517659f8f.2.1754478006344;
        Wed, 06 Aug 2025 04:00:06 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e585430csm43379465e9.11.2025.08.06.04.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 04:00:05 -0700 (PDT)
Message-ID: <e08322f9-3bce-468f-b951-21eff63cde4d@linaro.org>
Date: Wed, 6 Aug 2025 12:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_040008_832211_FD169A19 
X-CRM114-Status: GOOD (  18.91  )
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



On 06/08/2025 9:09 am, Jie Gan wrote:
> Some TPDM devices support both CMB and DSB datasets, requiring
> the system to enable the port with both corresponding element sizes.
> 
> Currently, the logic treats tpdm_read_element_size as successful if
> the CMB element size is retrieved correctly, regardless of whether
> the DSB element size is obtained. This behavior causes issues
> when parsing data from TPDM devices that depend on both element sizes.
> 
> To address this, the function should explicitly fail if the DSB
> element size cannot be read correctly.
> 
> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 0633f04beb24..333b3cb23685 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
> +		if (rc)
> +			goto out;
>   	}
>   
>   	if (tpdm_data->cmb) {
> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
>   
> +out:
>   	if (rc)
>   		dev_warn_once(&csdev->dev,
>   			"Failed to read TPDM Element size: %d\n", rc);

Reviewed-by: James Clark <james.clark@linaro.org>


