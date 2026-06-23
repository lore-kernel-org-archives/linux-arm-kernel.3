Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857D8CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfMUMzU1RF+WDR1ZaUyRVDL9zp3SnqsjfGf7c+h7ADg=; b=bNOHA1/CJB/oLoPRsHLRpIGUse
	r+ctU++zckj/ezxyPZD4xot6TPh0rE08isov/mav6Twzp/NUEhhn2f/5atAeT7GwP/6g6YTZOfek4
	F9+e1noI4Tcy0HlnOVKKejwMEvXXE/zCNVNdIxhoz7StRzxKYjekigAo6+Cb2p6fI2GlUXawa7ju1
	wgYflMHZ4a65gSSu51khQeEKQASdxUltOtEzB4AIOcW5r/GlYvb/lImmPdMuhnVmNaSbJdaCPXeIN
	9fnq2Ul5dKsMsh2NXxYeDdcH532rAOANzU2ON2AxL/SdbNZIPaS5LEzLrDGZPCVgC3FUh79wrK8Rc
	5liEM8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwrS-00000005wEJ-2PvH;
	Tue, 23 Jun 2026 08:52:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwrO-00000005wDZ-2Tli
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:52:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7kn8u3228424
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfMUMzU1RF+WDR1ZaUyRVDL9
	zp3SnqsjfGf7c+h7ADg=; b=asT6MglxIIq0cO6EQ0OLdb0VTdZMJllLKn72jxy5
	5p4wE5k3xs0FcNi3TtlH3UMCV+zEaEK0/0wN4TMbz7+96y1xiYQ0ceokAWMc2efx
	ovbH5y4LvnBoHYQmwud/X2vSRPHWmAv0xFmNJN4hmifnJ2j3OMZxnGAsNcjCcfpB
	NgI1EsIoXkSi+qFN3nikBxo+NYSQ12fkGVL5Wf3F1OLtLxYj5EtO2xOo7N8rCa7V
	sFuSPrGPCySm/ciYUCPX67GdLEwszssOJEgir8HM0awGaNub6hlkGW23ixJ3krGR
	/7JohAZgsj6semAAKGYjyJbQioZ+xeI12SyIqoXRqv+GVg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29g7tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:51:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b9d265308so3573704a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204717; x=1782809517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfMUMzU1RF+WDR1ZaUyRVDL9zp3SnqsjfGf7c+h7ADg=;
        b=TudEmlk8nZlQXCLzp1Cvhahn0YMdBBvnnxiQZQHbHulWau96fWKABotENMQPz10yFB
         tx2cxyovi90mru0SaCepwqVoBmTVBvNlnmi6FquiJuRmi1NjpZIKETccuJytYIzdrnac
         unhNvjM/zvd9S0VQ17b3ZmrvR9l9+Uet4Xcq1enBghq3ixOCQ1fuUSfZP+qFLclESAJO
         xwQybQr1aMvQOsNn48RVZ3nnKI8ypa6esMxl623yeo0hP0hRyqtvgqtibI0EAB26soSQ
         NFd9eSEvFW4ePdiyAbvfdTu3WyOGPy9ryVZL5VUyFU29cW/uxMCMRO8oele2APDYao+b
         fG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204717; x=1782809517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfMUMzU1RF+WDR1ZaUyRVDL9zp3SnqsjfGf7c+h7ADg=;
        b=HHOfCqxq2gCD37qvlEYwBPJPJqEwXrlWxiASCG/zT5TRusIS9ayW2arD0ImZ/FIgWz
         onQv/AmUieMgPsG9Jz2fJSz0+YFJCc+5fUwSTMRh3ePzPfoGvug11mKzB/nV/mSKnHd4
         XvG1sNg6673qWIs/Nx6adT+tKzHX9OEBxasF2wy35BZS8FFDVvCgGIFnNmh6W2fMgLDY
         anXVAJ1VwK3ZejSlENr5rE8SVuTHCq6puvaoh86jklvnxoxMKT/8/SNDTFph31p9AIdb
         lIwqdlEhsyPMz3dhHCnqzDZJJ60B+1GBxQHAd0xz1HqFhigJGoPCEIazxbm8HCxpeznn
         VDrw==
X-Forwarded-Encrypted: i=1; AHgh+RoWcI22Grt0FMs7uUxRyDenGX3/Lc4VuFOm5nYObAsL/kmhX2XUf7nDy9PjPJBnGtBRmXMiTA4/4R3OhZ0aoYDT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0fYoN+o5BWiBjtrSoAnX9aJpNq/hFP6J6IspT+lzLRwLCL/eK
	c3QZw4hVGdfp5NIgsZf4T8L9Jf3zp96RPqY5GjOMkPCTw9E0VaJMH9V5bbURucGJ0ZGK4Hqr/0j
	Ex5HJ72MHh+RJHVrQKk9PkbFucPa21q8CNonYrf2pDFOwniH198lyYIlixQPHob4Q5i+gTti73K
	wLtA==
X-Gm-Gg: AfdE7ckQEz0HrcDXxXylipIycB0xe5QCc5CKRb/90HpqhB40SGDOieDZP+MzVonV75i
	EsaDSCUc+fXIjZb7cF2Lv3BGVCTnYhR4Kbn6NDkiyNAwN3Dc65I2/UWXwDlsNVDlRrjLIMbX9T9
	uYsGSJPnsLrHqUqf7rNJDr3aHMwguG2MobC2Z5cGwx0XBp5n2I+30XPDFgI9h2ITkMIyekWed86
	HxXns2FZ0OE5Hr9p8pK9FIsZaiz1tIPKMyrVfuQgHsKjPNNz16gyZc7ySPmwfrdvzR0jD3XV9Dy
	aJTVq2EYZQA9HzTjqrhJdh0H/ytt13OZbG8JAlPiaWbnIm3yYNqX+TICQyH+ItlYoqelRPVcAKL
	Ibq3DhfI2H+H6lo5t03RkblLpbgYZ++i464JsxA==
X-Received: by 2002:a17:90b:3d43:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-37dd16b5af1mr1870938a91.2.1782204717206;
        Tue, 23 Jun 2026 01:51:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d43:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-37dd16b5af1mr1870920a91.2.1782204716687;
        Tue, 23 Jun 2026 01:51:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15f92d5bsm3246843a91.0.2026.06.23.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:51:56 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:21:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jroedel@suse.de, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Remove sysfs device on probe failure path
Message-ID: <20260623085150.nr45mbu4225lpaom@hu-mojha-hyd.qualcomm.com>
References: <20260623071245.1985938-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623071245.1985938-1-haoxiang_li2024@163.com>
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a492d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=pQidVZ3N1npoo1zWM9kA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 181PrFwmj3ASu48vKYDTFYCGlSIwEW8F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfXx/IWvaVKyyiV
 KiaXo9Ygk5Uyb4nQkPs58JgiK8CJA1YV+hwIINJGvfBJR8jmAWzO8QU4IQomqa7sC1xzVH18emp
 b09rf6uk76g7LE/QX9/VNn0IfBKSVPw=
X-Proofpoint-ORIG-GUID: 181PrFwmj3ASu48vKYDTFYCGlSIwEW8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX+ZQ0Ste+NUfm
 kU1cWP7ndTLwU/4S1CkAarcD7IEVzOiWYDagT6n6u/tgpvoLkids4XjLtA6s/ZEQA1grND+uFQM
 hZgaXHWnDocGuWBNMHDXFBtQIslun7QgrcILDZmf9U2oLyzKmJLwLlDlET7YmjVJPqpga5I2FC2
 SdtJ8LVvQjuN94NegnNdya/prM/2rkEakHlmBKxDujWsfRyDYW2xkUozx6OGw7uu2pSJEABolTr
 Em0qhdZgUS5a0LtoQ0/mYRBFSQBOgNWfXpquctVslCDNT9K1noxKjUugGcvlq4shGUH2SL8vs+E
 Y5EEQGri9q8Rt3UauGB4seecRappmFe810Qsp7Mv9tlrkjI4CcAYk8cbCR8gD3TXr13LFecqp/U
 Vb8u06YU/CShJHu5gkJy+lc/zGfft5HP5ImJ4t+nHokKfpNrfCtimAj4E0BRjwzdB2mKejbXv2c
 Qe1+0wXpszLgJiyms1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_015158_638062_1A2560CF 
X-CRM114-Status: GOOD (  23.66  )
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

On Tue, Jun 23, 2026 at 03:12:45PM +0800, Haoxiang Li wrote:
> In qcom_iommu_device_probe(), if iommu_device_register()

You can take space till col 65..

> fails, the sysfs device created by iommu_device_sysfs_add()
> is not released. Add a goto label to do the cleanup.
> 
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Not related to this change,  but there are some more issue in this
driver..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index a1e8cf29f594..32efef69e72d 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -855,7 +855,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to register iommu\n");
> -		goto err_pm_disable;
> +		goto err_sysfs_remove;
>  	}
>  
>  	if (qcom_iommu->local_base) {
> @@ -866,6 +866,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +err_sysfs_remove:
> +	iommu_device_sysfs_remove(&qcom_iommu->iommu);
>  err_pm_disable:
>  	pm_runtime_disable(dev);
>  	return ret;
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha

