Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185A7C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=; b=whBSSeca4QbYuXJ4f3P62IJDOf
	zvStk60+YMNvxwL8nE9fTxeX+5vEb8O/9YxkABMa2y+15znE1G3Y4WK6yeSWW9G54f6dJKUmkfJVX
	1sCTz3N8Zwvo7hQ9D0LMdR7fjDEL6IJt0IE/0zXH9TejynRv3pUwAl0QlTIAtHz0NEQCgGtwjsysG
	Klff1Bm3kiMYRmhiOc/c9F4zvsHf+GGtOkSwuLehgJv319SS4b2vbLHR5AlPSOna+chWBEj29FiHH
	hUSFUITRYc3XRAmIR33hiSRUo6NsrT1B0IJap8HuIAurI0uKuVg2qbceQBZK2RazYnp4Au8S/YVOQ
	cacG7SSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3CE-00000007rhp-0HVS;
	Wed, 29 Jul 2026 12:15:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3CB-00000007rh7-3XY2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:15:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBX9hb1846867
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=; b=NtcstcyblUs8obhs
	ysvKMRRidoHCETaaiqeNG1BgfTAhsrZ7tn6uONKNJ2R5iOTNYTgKyATa4JiuzdvS
	25JBLvKw21O3BtL//eNybZzx4/q50Bw5zvanJ6/qxe8ojF04mTT/V8R4iQ0IfGY/
	sw7K7ob3WaSYIZEInzq5qhpIgYcJzl0GQAn21rXnGEO0GlQ1Bijcnqu9065Z9qxW
	EZr8Hy9HHJtDjamdro3PTTyG/ZorrLNnSv45UU1gj85PXfuzEmACEv67nsYMun76
	2k6+xJmzM38uktQDtjGCqlHRPgssO3LCQliLQClRB50coXs4bMD7zMfnqYWVT8Ln
	5MSOKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcg5j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:15:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so1306271cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327334; x=1785932134; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=;
        b=iGR6VfAqe8451Zwfw5/sEDzYoL3kaq/JLzTx+9jCOYPSoeK90WhVG9p1jTjnB+DOqy
         egl0YUKcsv+nllryY/ePdJDFu7E2zdpuqKFhw0+sP4ceaIcQNAP1Vfu3rVuFc/8KoqRT
         ZhxrovJbOxKOoir+59ER3r3f4pnEHnxY9prDShkYU374v7GUomH42dUFpEu/8/AmfT8a
         mSLjR68Fx5jpj+OfMfYA19n62CIVeqrCdSI4SHLTQwaQ1CUePrPaoqR2UigdACZ2kc6f
         niwbrEJucogOF4KDwPcfiuyutmJcoDZG6GAV6A1FIlegEbfvsXxvnv/V1ZsQKdFa9GeK
         RNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327334; x=1785932134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=;
        b=Df6Rw2a0krkz6k9II0a9o0Tkosk7eY+T/aznRoyhZx5s+BMWmTKJSH8a/Tb+BGjPjx
         IuiNnMnerP1PquQQBfGriqlhrT5xSqenlfOzNHdfEH+HC9Zq7C3yxKTYahf4sKa/WnIL
         qzF57jHGbDtUVbN5AfKXPfk/R22EFOxCnWmriiRNveGx0GmiVVHe2LGC6BXBDmoWGi7S
         gy6LDKAMltL18+hNl4imUzrAATCkgTnPqy1akBnKogfsGJ6n0Htr8rZyds5Lg/0kSTSf
         0knD74MpOcnXASrU2y331Eb+AW7oLDIcEX5Fu5cWDg6eFs9owOZklRTq/wP5aKHXaCfm
         p3Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rq/IS4/pyAWDtipg45hJB8sa3fPRLnKHataFCr/AbFuogS7IR0QqC5SdA/wFMo0GT326pHnUbEso8tpg9p+BECE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy821EsR9QtMDiTjyZTKHruXG3k7YpoKVOFljp6vI7nYb/68vHM
	pB2KrarFSumm5BrAeHB6Qc0HNg0WggAS4NKOX6KzofSMwBYywJxjjtX8XwrDXDPfTDbyxlpZt9U
	BqRLs/ghPTa1VIVV6BRYL20jlWuWdcbUEj8YYb1pRVxIV403j7D56gB4hTuV9XuFPqtspdM3vzX
	GoZg==
X-Gm-Gg: AR+sD13L6A7FPLtog5KPzp1CaTG6Qdqmysg83As18oaumiaGYoDGPFmDEMyAiuEIFBJ
	F3dPE0EnrvwnrfWlWdhA6fR3H0Q7UurYQKZ//LRyjmpL6HEW/llUwIOBjA/g2Xi9C+9+Q5XINzk
	WDqgqbG187VyeRS/v2GvReBTBjE2YgcHjA3nyMd0Zt3R8aLWuQZYtiedHRAPAy1IyyfuvMl/H4b
	xlVN4CYPjgoSZZYI4QyIT13Q+xjv3+JPfzJ0IAQlx+Amc3ADCbWTfaYpY+ETeaWYGAS4SdnlrYG
	Y3Fg8n2ZMLBxne8zVE3xSBnlKhOPkrPl1ZLoowJFufn5pL+99N4JxqF09WnWp0uspWwDlaTzn0B
	BfTsfeOhCHJPNvVzoc0rL+vcc
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr56395421cf.4.1785327331953;
        Wed, 29 Jul 2026 05:15:31 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr56389371cf.4.1785327328171;
        Wed, 29 Jul 2026 05:15:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4e079sm104234966b.30.2026.07.29.05.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:15:27 -0700 (PDT)
Message-ID: <207866a8-bb1d-412f-9cef-3a597762a949@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Bk6zEe_bL5Z_pOhXPwaY-jPp8huw9NM
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a69eee6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8Bk6zEe_bL5Z_pOhXPwaY-jPp8huw9NM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX13DlGYxeKeBP
 oYXpprFH1mp7inFZ8nDezkTXxlDrO6d2nFtjdgWoJqgUTSivRAtbUHid9F8TXBYs77O4HTds8uo
 RUTVZtqpXuTLF6DkXOwiQTtyorLPnmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX8qgsR79d+Qdz
 O8G+F9UOBlI4IZOJXDuUtGirCPNoaH14Id438yTLCb1z2Aw6dWRN1kT5B1gE16xXR4zYJn0wlE5
 faHHn/V6BhF4jC5Vc+V6xqQpaURM9Gxhyktj02cFRjTHBTs+aWkgwzwOwNkTjAfgVE+TkFhC1Yr
 AjHJbcY06kHC3BVC9wWxvf/TLfa30jsRiYitHNxWtT1n9/xJSkbX0fUyVf3E042sxC+FB3oMK+2
 XyXnkIw+HYwyuS26S+JHWAzVfrcfP9YNz4/kH6NC1qzSIyoBNLfEFT4ytIx/xFtjP8cOSD/PCsh
 /zVNuTCMDxYSuCqBzxZVDjp3ZfzvCHHAoc4cOq56k0JKbBnoFEogpyf1mS9eA7mxn4o+w6T1EDv
 R2dk+Vnz/rQyX4bzSryCf1nfx9Lp10XiXIEY8NQY22RTY/blAu5LHv/UwoOCQrz9DZg1j3kqIyg
 9IJho2w6AE5sXOgfTsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_051536_022550_B2C80BA5 
X-CRM114-Status: GOOD (  10.64  )
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

On 7/17/26 10:41 PM, Akhil P Oommen wrote:
> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Add the nodes to describe the GPU SMMU.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

