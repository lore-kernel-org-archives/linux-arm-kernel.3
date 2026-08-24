Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0175C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 20:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eV+1RCKn+9EGaZT0SNQ5VzJ6PPe347P8gHCzbGdu6Q=; b=12dVRHQhsjOXzlV/PuuBJYWZOA
	2zR0IfP7yuf1n2kVL/3k6ikpgW2it45AvKVH6o3yHqgMDCOrdfWP36mM3meMWWQ7Owb2M8gl4wB2v
	kry1p7wXJ8WxkW/s8k2sPiOHNLlOGocm9lhJ3aqXGXWCu82rVDfzivHi8147NV+fB+Vp5cuAeMjEV
	00j4uq9X6jwQUU1+Md9UlgAwK4PKBsrB7ZDA9C355r/a5rqKFYrzmsul6+tqsAswtNc8ix3ZhqJui
	6u1FciLZYA/iCwuitt4z5GrTB1mDgrdvRT/Jho2XlkGDAJYuAyEmxBszJmvj6f2oWUEixqGdzS/jL
	yQ/Ocz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybE2-0000000HMWS-3uh8;
	Mon, 24 Aug 2026 20:24:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybDz-0000000HMVt-2Hkp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 20:24:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJGm76266562
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eV+1RCKn+9EGaZT0SNQ5VzJ6PPe347P8gHCzbGdu6Q=; b=FDCaMHoqKfZ3f0nY
	KT4NecyfEqk7qLhd9kyi67KXkCdc/gI+A7/WVLhmKIFoQIkM66PCqxgOnyEzHlr8
	UPnWFfgVkEMW9bUzbnqrXTplMemPmHj/tW0kj0gY3F2w0tcMvAZU8ub57fzGDrKF
	5q9KDtV2sEHPlRvFbK+VZQlr7mS0oYqCQclI8Vnanw6B4qSlqgsrLGAHRgrvB09c
	l80f4wQ0zOzHg1qMMEp6W2ptRIvq9TTJ9hY1usQehAGos2eYxZJ2iyjEhNPApSex
	vwC9GbpFTncWxqiCaTp+q3TneJ8K/QBTnPMXloJvL5CuHRcfCOsTOhcLJnDMTnDf
	n+fAbg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk36gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:24:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbee57593baso2817121a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787603094; x=1788207894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4eV+1RCKn+9EGaZT0SNQ5VzJ6PPe347P8gHCzbGdu6Q=;
        b=cHDCOlfOZnN/hw3EDEEbJKTwUtCmrRcmiLk+sfpSFLfLa+R+k4zauX6r4M2HhNbql6
         BLp3F54Wp/CTiVawTLn3kmHodpA+hzT2E1vZ0e8yR1QnK5490jdvMOVpyPqQm1k+rLV5
         YSszvWd/hQ7Q5lYX4Yu2MIUxqkoH7v2cALJcyshLl6K8pgElC1SzeXxhtBdH7wnnv/lo
         9fuFwHSe9efX4iKjbo2b7c5SOrKwDGycASCIlmTK+iBAu8NF7r0K1BoAFSAM2yG5xjlr
         nlJ3/EkR4+9X3UZtbOYgzeAw/p4rvuOOAnWZXy56p7LEeA7er0/95PRlcDFggdBTpVl0
         OR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603094; x=1788207894;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eV+1RCKn+9EGaZT0SNQ5VzJ6PPe347P8gHCzbGdu6Q=;
        b=X9uukH0qjAl4OQCJD4VqM6HFJBh4FFgjsClPxZccyGVUEmKA7nfhPPQNLEzAHcwam/
         2Q+Lg0N5NrYR9W0lSjP3iMhJRmPxkZvjt+IqXG3ZpJWJdZfZ0P7ZXXs2uSoCbrQZiWyB
         y+/EBDl/oOcR7PoMW1pf5JyXFEsAavJN1kFM1N1l0k1Ch2Df/YWdWrSNg/ppRinhObCE
         V9zJyD19CoFg//clSPVCSjIRx2P81KNzp49S5KupwUOtwgzJ1ltmbTsdXoYzGxLcZ0CD
         WGKj4Xtse8CTyBO1wIEReOO1D2jFH8BcZBgy1RlaSCpN+FhVvJK3rG6h6BrO6NWDP+jS
         ooZg==
X-Forwarded-Encrypted: i=1; AHgh+RrjTEFkv1evOnJwUM8U2nGnXQjIAYeydPGnUfyTDnP6RUrdPTLToB+UuJmLDvS2A5+WWI6RaAfVPA1QwOB5yNk7@lists.infradead.org
X-Gm-Message-State: AFuF++nlPASFxN85GSMkQj/QVIJvRAlUflTAoR/+cUC1+YQq1W8Prpuk
	GclsX/Duy6xcJFi4PnO0QNX4njmbB7uLe8L+2iCoTxCg8jvVV7CA1Di+eAcSX6TNhig0kfIuTBE
	UG6N0f9ThTb4yd+Q0Ww/Ny6v701M7Lx2c9z5tir97CvXneYhZvY2cTzf7zrE5EH2FS3b/868PxH
	DVlQ==
X-Gm-Gg: AR+sD110a0P/SOiftJPWkQ1jWmns55r/5j6rPHPff3XfUV0c1WTIuVFRMyD+7kN5PcM
	5Ox5umC/KYovHn1wi9H+TLzYF89pRxRbii67MSukYaHSdtKAHj+njoRYUwuDl198MYfDkidIE9O
	93K2WqcPBvXTNvPFDzhO9SGcuBdUrOOPIV/0Ngo1kRMfnoiOm8Do1mYU2brRik05bxjPUGevZPX
	AGy253nZsPQv+OqsrBrB6fIoObxzICJTciAN5cyxsksD4i576hE8uYFvMkOOfakU3eks6SH5ckb
	FiNbIryMyCSZxWxB8O++PTCqQCjmmfmt1xnDeqPxAkuNq+GKhBR5MRCyj8IGuQJ1O//1Chn152M
	uBqIv9o0f+P3jXKXRuGY2IXMmEA==
X-Received: by 2002:a05:6a20:ce4f:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cd90fbd2admr2743246637.3.1787603093918;
        Mon, 24 Aug 2026 13:24:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce4f:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cd90fbd2admr2743167637.3.1787603093506;
        Mon, 24 Aug 2026 13:24:53 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm31902753eec.19.2026.08.24.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:24:53 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:24:50 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260824132450.000045ca@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hbQQHvKjdus6M-jGYZ10Xe28RVCaQMue
X-Proofpoint-GUID: hbQQHvKjdus6M-jGYZ10Xe28RVCaQMue
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MiBTYWx0ZWRfX4d8kqA9FLAmp
 bdQEw9y9vThFIoTcRw1RbtWwGYUMIhXFz3z+BGyGmJHIf4Dh0E9xdOGiKNONDNNyKxLfLO7aL0U
 CIgO7bpp1HhC9TerQoPaWQo5xF1av7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MiBTYWx0ZWRfXwX24Nd6ta3Ci
 LWQX5vIg/V7ncnpLSrUQ0dnIorho1wK0mWuQi4r6uK+4wMnmyUGtOU3n2PjOLCfpZXLWjoKnm+w
 SO+LpmnuVmDGoldS4et0CeOHMAxmqUzZSAIe+/HUHfg4OBOvBpVo5E6/cqCyW5Prb6R694N1zQr
 xYNNT5k511HhVCC5/xIOkcxVnfrKbuBB0AGOXd3q3u8xbpdqidKKqSQk+dcF56AIqu/oM3hC2X+
 9Tg88jYzsMtgnWQ2hi8skGAccs6neB+urFZ+6khsCDOq1IewzF4/NPL/jX8Jq7+gsYwkhAd0Z5f
 eYzhqhJcKwM37ooh7/p3Txd86JFHjpt9Y1zXMQ+KM9lVy0jwEE3u4ymK3D/EUQyU1NL/MtY+kwM
 4UyHeaebY7jHRnEmQ0fweRX7cxygO+875fUh7yiCNmyS/qL1JrglKCzhHddTTCv7vJ9pq26KuWY
 PXNynHyS3NJsjol09XA==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8ca896 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xy_CICi7n2P0mFM9eQgA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_132455_605500_0BC54BE8 
X-CRM114-Status: GOOD (  21.91  )
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

On Thu, 13 Aug 2026 12:33:04 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Validate the PCC shared memory signature when setting up an SCMI PCC
> channel.
> 
> Reject channels whose shared memory signature does not encode
> PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> firmware is caught before the transport starts using the shared memory
> region.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Interesting there aren't more checks on this in the various PCC users.
Question for another day perhaps.

Seems correct to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/transports/pcc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
> index 337d551e3ad8..0ead0ec77162 100644
> --- a/drivers/firmware/arm_scmi/transports/pcc.c
> +++ b/drivers/firmware/arm_scmi/transports/pcc.c
> @@ -623,8 +623,11 @@ static void rx_callback(struct mbox_client *cl, void *m)
>  }
>  
>  static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
> -				   struct scmi_pcc *smbox)
> +				   struct scmi_pcc *smbox, int ss_id)
>  {
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +	u32 valid_signature = ss_id + PCC_SIGNATURE;
> +
>  	if (smbox->pchan->shmem_size < SCMI_PCC_SHMEM_OVERHEAD ||
>  	    smbox->pchan->shmem_size - SCMI_PCC_SHMEM_OVERHEAD <
>  	    cinfo->max_msg_size) {
> @@ -632,6 +635,11 @@ static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
>  		return -ENOSPC;
>  	}
>  
> +	if (ioread32(&shmem->header.signature) != valid_signature) {
> +		dev_err(cinfo->dev, "invalid PCC shared memory signature\n");
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -667,7 +675,7 @@ static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
>  		return ret;
>  	}
>  
> -	ret = pcc_chan_validate_shmem(cinfo, smbox);
> +	ret = pcc_chan_validate_shmem(cinfo, smbox, ss_id);
>  	if (ret) {
>  		pcc_mbox_free_channel(smbox->pchan);
>  		return ret;
> 


