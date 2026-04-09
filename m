Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C8910FC456
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 01:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMVy6z35ZLJhTi82Sl8QaK6YUF4LfLQ2EPx4PMUuZ6w=; b=lJsm3yFFafdMU8iD2kbhJMQnW5
	Hphz7GtrhwCJYUn4Q3U20chB/E4rfalYidWw7DoQqm7wjjSr72qUnL7lG5HDE5061BSRNCg9CTJXO
	SA4QzJqVPi+U7ALpx5xTW2gcLPPe32lJrX2Y3oDhpk7VUAPgzvhGu4e3QciXoNafZq85vi3t9OIVC
	52J4oks6zVHQaIW6sD4d8Ldo9ZUH6MiyHayM/fiKdFF9qvgDHzD9B+xKXdcCFiJY4uT1zLIlTiwtk
	ZUOJ/2N+BSM0SaLK4J4QQuKolW7c1V9zduYmpV/qq6N62ylo8zKzIP9J1acVicXp+2SMKYstnSsL6
	udwU4JLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeVL-00000009aar-47ck;
	Thu, 09 Apr 2026 01:48:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeVI-00000009aaW-3Afz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 01:48:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L1War469930
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 01:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMVy6z35ZLJhTi82Sl8QaK6YUF4LfLQ2EPx4PMUuZ6w=; b=HN6dFC1OsTG9YN8K
	yt19jf0A0AOyT/MnpEHNnWQc5WjjmzsoRs2Eulnj73Zx2EXQiXLncqExanNwQ6KD
	da7dckIQA089LbKqe5u6MgsArFFg/Z6rwJjLqUprfmMYoACltzIvQLAOJNWXTNQt
	/X5XQEKSLG8uhhklJN4g5S5StNbr9dgm+wrjyDqCS1cTi0AIzofC/loEXXik8rem
	OaumlHwlO3bE68qpPWUbchcC3AXRNUIeFdFeBEGydv82YJ9pJle8g0K1CKWXK6oN
	EBQviGacDr1Yk/t0ZdKXhKahGHfdhLVsla+uVIxLhAs8a+DVdwrY9J0XFrzplagl
	7ffR1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dduvv1f3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 01:48:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8dac6233so10867771cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 18:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699299; x=1776304099; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMVy6z35ZLJhTi82Sl8QaK6YUF4LfLQ2EPx4PMUuZ6w=;
        b=h/EaSOzz6I58XJaLCblWirZPXf6oXdTSMlCwmxrjLPv4IYZR+rcR/vgqkoHngMQsY4
         S4dfBeO4cdiSTTdYYeuRUg/GrVbl8IuVJqnmgShCz32YSHknO4spAAWnYp1kMU5Y6hXC
         hUdMqwcEelXh5/6SV8CfLdkM0T7IFAmDe612m0jmjhWPM8hPX6JOa+W81CcwbWVavGs2
         DOAdEy5gSrkbaYi2wW0MdErgKWJFZKtbwaKqkSAJmcxkgkSM9s0U+3PDRTlrfAmAJ6Ha
         FcEFFg5Z5or4ZzmAPpnzuKRYVt6+U77Sq54Kpc2jN7T+sdPoNiloHfCCAVA5VbJl+rRL
         KqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699299; x=1776304099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMVy6z35ZLJhTi82Sl8QaK6YUF4LfLQ2EPx4PMUuZ6w=;
        b=X0HFxf/EQ5AvVEn0kmbfU33fO+zcVO8fbhVniGoekBwvo6o0NUJuOA/eubywB2aDk5
         O6pl+Rwh5+4ZXjCcxXakP2sLMjH1LNUTHJC7x7piXqAvqulHM1r9FZSHohSdLBPEHEZ0
         iSBOQlHKUh/c4BUULhsLf6zFpJr9Ax10VPeCfkPQ+NcAao39Dr76pI7jHjOJpWUaBBqs
         hYpRjsgejy4J5xUXWJML6Du+khQuRLWGEXpO7jXbzwR7YBXwYvVwBn45YWCKM99JlFh1
         wg5k3bjR61bOkUR2pITi/dpBVzCevZd6r/pO2HAdqDqQ106H7TkTF4LobOAonDoK92Gf
         zmoA==
X-Forwarded-Encrypted: i=1; AJvYcCVqLgAuuBgmii8ol5fmPwya61IWeZweaY3sxuVTW4U32Pt/fJt+wVYU3Nl9YAMUV1rN/1vx1/o2gE5Lksl+mKbA@lists.infradead.org
X-Gm-Message-State: AOJu0YxslHeEBeYb3KXNIefAO1q9PStSHJitm5O5gTdBX5G+iEZp1FTd
	lHqAimrzDcgVDAW+nJj8335qn0uLmyFrX0RaeONHooneWEdeSvynpMd/EHdc0NJ8K+CXkkebCrI
	YvH/B8ZmCcEsx84QE0nkeQgrZEk+sQX7ijwvHMsXz5j0DRKsGDQJWgud+Vgh0bngnruTc6hdO2/
	8HaA==
X-Gm-Gg: AeBDievLby2qfUauoM3O1sGPl+DiZ2+ltaCEM8exvEVLWDw3NM9qaH5b90gj/r2Wkdi
	do/+sEP1VoIJwePzsVKKQDIc1mqMymP+Ok6hwxHwxSax0IBvIGjN+F5tVI38wJhWFxpmx+4U/98
	c+LqSGfkykZHO9q3OSa+FxcME750eeRUvig6IzKMeFQbq5H7meHbAW9JClDYMkE/W7GCHEuRaFb
	hrOyvHCmqu4tISkNOvQHKfeTMe82OSBIzPGeRDKV0un9OjyDOZHP0BTTE/ordubDYvltxAnTqDT
	aYRkyfOeDEyTrMlvJowHHrEzQlDpyiQA5iasu4ShUDSkx/hL132gkKW0uQK/TMLjTmRX+ZJxMNc
	vYzeseL785Xjh2dgbNpywotuhko9kyQPJN63fdYNJJzPSup9GVkdm+r0kKZnAX6YVk1eYJmVLBO
	pRgCW6SLVHVtRqrutpeDAnogGEhQtyfS3/DQ4=
X-Received: by 2002:a05:622a:4a86:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50dc2222918mr25894591cf.34.1775699298703;
        Wed, 08 Apr 2026 18:48:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4a86:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50dc2222918mr25894331cf.34.1775699298204;
        Wed, 08 Apr 2026 18:48:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc9bcsm5055295e87.57.2026.04.08.18.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:48:16 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:48:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
Message-ID: <5npqhtczzsxxgxbs5mxjk3bvtypcd6cytec2wlsvykjbmg3zkh@cx6axr72b6uw>
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNCBTYWx0ZWRfXznQdkinGE0Jn
 xpFwvG/ua3EwuqnBdrVqi14dFAKkJqCk10mNxeeuItgNh/GfhKSIKmP5xeJdLe2J75L9E11OMlE
 v4s/5ws9rnAx7UvzMwFP85GXO2EuJmVutYTDq7MLsC/VKr6S72CRUHLGvc8m3LmGXjH5swxL142
 gaFz6k8IF8xdagb6Rj/NlPPsNhn4VwRkQ/ti3aMv9Zl14X6Z/vDNHlQlbwmwLY/tk2NFhiJoIYY
 oN1lu8nK63ufLXRVLSw76VetPII/LxZvizcdnWcOUxHMR9A+/O8ZdhxUoATDQ1uMlS6JCVI5xC5
 ZQfdFvfAYy/GpHjm8m3u0jL9KKJ1zmheS/4F+B06MCoK10UTIFmv3IX/SJxLLG1N7alTv5MS4CP
 K6OKDJCHpdvhMVK8o6OZVztk79S5vlDAM4E3/GoG4PLBmQCzNxt1oMFOw5WwC3sVeKL3QOInoZ9
 jvzDGTb6x4gNQaj547g==
X-Authority-Analysis: v=2.4 cv=DrxmPm/+ c=1 sm=1 tr=0 ts=69d70563 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3yG1jlHAEcHsLBmebVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: BsO96zBCw6at5__42EulnlXsagg-L9fy
X-Proofpoint-GUID: BsO96zBCw6at5__42EulnlXsagg-L9fy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_184820_804175_0CE42575 
X-CRM114-Status: GOOD (  25.66  )
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

On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
> the compatible string for applying ACTLR prefetch settings to FastRPC
> devices. However, "qcom,fastrpc" is the compatible string for the parent
> rpmsg channel node, which is not an IOMMU client — it carries no
> "iommus" property in the device tree and is never attached to an SMMU
> context bank.
> 
> The actual IOMMU clients are the compute context bank (CB) child nodes,
> which use the compatible string "qcom,fastrpc-compute-cb". These nodes
> carry the "iommus" property and are probed by fastrpc_cb_driver via
> fastrpc_cb_probe(), which sets up the DMA mask and IOMMU mappings for
> each FastRPC session. The device tree structure is:
> 
>   fastrpc {
>       compatible = "qcom,fastrpc";        /* rpmsg channel, no iommus */
>       ...
>       compute-cb@3 {
>           compatible = "qcom,fastrpc-compute-cb";
>           iommus = <&apps_smmu 0x1823 0x0>;  /* actual IOMMU client */
>       };
>   };
> 
> Since qcom_smmu_set_actlr_dev() calls of_match_device() against the
> device being attached to the SMMU context bank, the "qcom,fastrpc"
> entry was never matching any device. As a result, the ACTLR prefetch
> settings (PREFETCH_DEEP | CPRE | CMTLB) were silently never applied
> for FastRPC compute context banks.
> 
> Fix this by replacing "qcom,fastrpc" with "qcom,fastrpc-compute-cb"
> in the match table so that the ACTLR settings are correctly applied
> to the compute CB devices that are the true IOMMU clients.
> 
> Assisted-by: Anthropic:claude-4-6-sonnet
> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
> 
> While there is an ongoing discussion [1] on how to differentiate ACTLR
> prefetch settings between compute DSP and audio DSP fastrpc devices, it
> is necessary to first fix the compatible string to "qcom,fastrpc-compute-cb".
> Both compute DSP and audio DSP fastrpc nodes use this compatible string,
> so both will receive the ACTLR settings after this fix. However, for
> audio DSP devices the effect remains the same as the current
> state since they do not actively use prefetch — the write is effectively
> a NOP for them. The fix is meaningful for compute DSP devices, which
> actively use prefetch and were previously being silently skipped.
> 
> [1]: https://lore.kernel.org/all/9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com/
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

