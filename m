Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCF7CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i35dGP+d/0dkL0iLpgcnTIbCn7co3QE46vuJ/cBPHB8=; b=RT3jmJN8ncOO5KMQ+O8chYn9X2
	gMOjl/xV3Scu3OkLLRTWGAYmf4+gJO09I00JQ6HPjZGQKZ6Fm1g3NuW2OVLTFxBTGf9cwtPakDXg9
	RPceByYXmwEpCdEJVFJs2Th4v7/8v8JFFDyxoxZK/alN2JNdq7Z4GJrhDzZZHuO9WV7u7BX9MxRq1
	jLegbcaZWjg3uFgA6HCxW17bkjxJo/6BWbnVu6ZU10L+wWCULQTenzmYrTX74sV+3Txo03r3VNN43
	zqKKgsYypSQ/hcndqDvEiy79n3SQlh662Q85tCpwhOhDU+y5iZQWuikyD0UIrw5Gkal33XH1Vr8jB
	Zil46YKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNOV-0000000E4Ed-2X2M;
	Mon, 27 Oct 2025 13:36:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNOU-0000000E4EC-3sXT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i35dGP+d/0dkL0iLpgcnTIbCn7co3QE46vuJ/cBPHB8=; b=AU3glfH4n0Zei2u11+tGKSnC+c
	xe9296iZgf7hXUpcrHFvvn2jiA6EN7JjaxoBZsDbASi+WcNt9TcoEvI3C6oaXe2hUS5GvpF76Y4w5
	OrCeodyP40hhqnTwazt6lJqDdrQ6XPYL0QmalLn8UALspX9Ye0k9Hdr/S3m5ORRfsZMaQ1deWvCrD
	paPLCXAxANurhy7IqGgVlK23BniXHYfh01JRDJPzveWao2qoDbqTsLhXZgXHucaVcNPgs/L0sNL0O
	M6GK1zzwyNNxG73DDp1z9V98HMujbgRCWshjI2K7iOOKsLwPR5SOl4bXwVKINLnbqqlX434RuDUBy
	7+xNVP+A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMWg-00000002CCz-2m24
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:40:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7jpDw588480
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 13:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i35dGP+d/0dkL0iLpgcnTIbC
	n7co3QE46vuJ/cBPHB8=; b=V3Wo2sjUAO8NHRkWMT81g+mImu8ocvYH1QzGV/lz
	ckcrE62YXcyWO2z0g2/MzO+mNVR2Z6rnB1oomvm0AF2Kegzo6ODpXebkoNU30kFU
	ifbDHLLzEEEVXTvKm+Un/UXNrV/dT1uQG2sduvvAxwckV/lcc6VKGYrhkxmrO3SH
	BUJboaFkKvPYEHctPdqFZm1TxPhUUdxVAPJ4YK0gwX4CddMu4EUmxvbpOUWFRq8y
	pVEaj+jaEnQhL76wxJIXf6DhKxpIkEh0JSc6QHW0uLm7iGso/nnjGiSnjaTIAEdB
	Omujr0+0p5XQoxSHEkGsb6lkJUrMVDu0Cmvc9I5+66H39g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps14pbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 13:36:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e892f776d0so222870021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 06:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572169; x=1762176969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i35dGP+d/0dkL0iLpgcnTIbCn7co3QE46vuJ/cBPHB8=;
        b=uTotMNN9QMUGzmPXFQfha46PcBMdnkmZJNZg0Is6d4Q4hx0yAHB5YKevrfm1DDQYHs
         h1/eXYoXCcou3hwmJtT/30DICDmv2i37rdvuuR1UWfKG484Tk1DvNviMzkKNNScPOwnb
         iXvrdn8IUIo9EkvHlcqEEAjBq8ghdoKgxifbSlvL94mFl6lUQiMRVIx2tR6Y/dyI+lcv
         6tJjgM7hafX0GYy8ZQiAThdtFtj6FXka2S4j9P8MdAnG4EUDbamzDW3RsGgR700QMDcj
         yUKwB0wCmgX5qOmMZzPVpvbJ22hMymPOyNKJfffnFcA2a2yj8geWznohc3ASMkCtvij/
         At2w==
X-Gm-Message-State: AOJu0Yxw4ANTW4K1GWGcSmwwUHAyWk3o2JRiScWukTAtZgfMUwuDkRdz
	xMdcqJLkr0DqkRXC41K6tv+1RosleCd0oDf/GaXOu9Cgy0LFoi/F9LmShsmTY1nS3nbZYrmHmiW
	Wz2LKIjB9ui9lZcI7ENIqxCb0rsIXOkL05Nw5nhGf8a8b33BZl/G+sCcKYO/xsi1LTvkir3KKFB
	P+Fw==
X-Gm-Gg: ASbGncuBZvVyn1HqprQv+xQzSLRz8qIpkdCeRGrClAJrXFORINOAkjvtMWr06go+b37
	OLwkWdMHzroBG9QabfLUeB5qvjEXgzwkf904m2NrPUzquQysxXfKaiSoP0xFC52sfrgkxEXsId9
	8K0mPPAUUVLIIU6DyPSgRERw8hbGdBTrIkCVXnh9Ofm594cVDT6oJT01DKE5NVDncYfK/WcRfzi
	Fecxt8Y3+UiqWBLHaAtQIQsU+YmAOTOSvbxsNituKvznXrziaFNIjqpv91dx1LdWhhqV8yaJVjX
	YAi7X/20C7hxtBDPJnauOkq0YHweVC7VwGQEWCeQ6oCf6MSzbOBIlSrCtsQtG4MsqxLXPQsCLbP
	DAiWljgYyRgaOQbK3a1UdTpo7qKfXXMM37BYi0nd5jLya+XzzAbLQhmG0KrEyzWzF8JpLTFWhCB
	ueZNdNgzqOmzf7
X-Received: by 2002:a05:622a:481a:b0:4ed:14b:a654 with SMTP id d75a77b69052e-4ed014ba734mr18171421cf.19.1761572167629;
        Mon, 27 Oct 2025 06:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSA/sQgxBWrfN3yrs9iaFXpBMGNK/JjKUCLuabLCZo3BMcmoJ0EqI8OAXaO8cxld/gWmQocA==
X-Received: by 2002:a05:622a:481a:b0:4ed:14b:a654 with SMTP id d75a77b69052e-4ed014ba734mr18170961cf.19.1761572167217;
        Mon, 27 Oct 2025 06:36:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59302a2420dsm2222513e87.72.2025.10.27.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:36:06 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:36:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Vinod Koul <vkoul@kernel.org>, Sinan Kaya <okaya@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@amd.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Abin Joseph <abin.joseph@amd.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] dmaengine: qcom: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <wl26pbhmquwuavfch2vj2s2uispcelthn3eg7umx2dboz4ntry@uqtpzhuj4gji>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
 <20251027133232.392898-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027133232.392898-3-sakari.ailus@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff754a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=QXuSEnVgnoAJZhOi9yIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -GqNWKD0mG3A1C2leirTWGPP2N_tDEnJ
X-Proofpoint-GUID: -GqNWKD0mG3A1C2leirTWGPP2N_tDEnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNiBTYWx0ZWRfX1dFnunuHCbP7
 YyDlMhJvhnD3uNs1qEfHUFlgzMvhSHhqJpJ0JP4aLCrlKWrYoyFMSB0lAwmrNWVgQzvViN0XMSn
 7fwrlsblfGdcgTJRffEJm+MGUDyqnegbfZwtFHc9etsbVH1pBq2u0MYmCdkT7eNUZj0tTXlBiYt
 1Hel2xkAYO9slKOA4AE04ZDWYlWCJjFurPT5q5w9+wer/Nbi7ebK5qtgAv6KpqKHDOGxAp8r06x
 xjTTzKVXrO9Jx1LE0SxniC2abtJ/vziwYM1Ogls5eOdFg7c+I8jjlASJjG9nMEDCmkJte5XMYr3
 susl6x4/ULX/t/tkvxFGM3I+gRInIknMZ9XMyCLsAIsdq6AmQJDVikPFg9nka5Dl21PKwUPcdEX
 FvnJLocTRJGmKuPWn63LjzH1+skmhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_124043_067330_0C30EB87 
X-CRM114-Status: GOOD (  14.53  )
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

On Mon, Oct 27, 2025 at 03:32:29PM +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/dma/qcom/bam_dma.c    |  5 -----
>  drivers/dma/qcom/hidma.c      | 12 +-----------
>  drivers/dma/qcom/hidma_dbg.c  |  1 -
>  drivers/dma/qcom/hidma_mgmt.c |  2 --
>  4 files changed, 1 insertion(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

