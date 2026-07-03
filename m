Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7975BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=hDgHAAOFhRWL6+QCOtypnmd+Iq
	t9hptZ5qVuaxWdvAk6Q9XWFxO7WUJhRqzqUMGthAfSbcRggO59eVEpr/mwWt0XZMLfBopcv1167L/
	ElvcS0QfEYJlm8mPqn7E9mQ0lB5eRPVnO2avmHwAyzz8fTuR4IUYwISicrzMB/+5gyJ/6N5HJXroX
	Qm0L4wsTNaRID3ZZf2KpCm6zlVbrRjsRo9EqPYNBUDOUVJ5taEc1PzvQ+TK9NHxOp5/XPwt2j6eb6
	rLJcFQxUroz/kE0s4GdePDLkHlvO+rA/CmmAU4p6tBDbJpMkOmHl81dsfilUHo4qoZvZUYO3hcXUZ
	mn4QjpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkbq-00000007rwE-416y;
	Fri, 03 Jul 2026 20:35:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkbo-00000007rva-3Mqz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:35:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPJMm1039324
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=QK0bT6acctMmVRcC
	2/da5Pd4TXGhQi4kOuWThCPpHrSeU90ccV7oPPbEG/ts6Xwajo54zSQS7shMXiVf
	z90g5tuSbTLKlK0r+3Bpt+Woe9V5rm0OQMqW1zbBFCpaTITAsTBeFZKUTBRXc3gp
	Aw1lsRCA1j+A0wJ2aPqhSjkvjzJMR15gBUCHJhR+RE+axWX3+lmfVbNZqPEIqOgp
	H+Tns85ndROt4nEsfLIYKbPGq5wDmrxdCygCHlpmYqMJLkN11fX2/PAiTyptGVyH
	jjLA5cauqLhul+JvsmQQ9I/SwdbX4KhLdw+fMl+mkNOZ1lGTxKMb0xKH3N9PiM7R
	5p2wPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a9be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:35:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so1541488a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110935; x=1783715735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=jwR88fq4e8FmiRGGj4hUszTNBq9yBoASim2/MeR8snC5YF1eSLillHcGjo+lZR1Y8/
         tzB0fphvBKSPzlnMWkQjJE/ZiaWOTM64y51dStgxLjnGPq076bfLMNjUm4j9hEoQxUko
         m7dsqNbL4uhKy3bQLMZa5Q3uCPkWa0GdCEd5xAwLVwmUtUth5g2ea3fm4xVv+hiEYuv9
         w2W37ptxhXLGTSdAcAeyYZrfeqJH6Gg/PL9ij60SLvDU08eBmmSPKGuQqUEfPLr+tUAZ
         LRMTSus0WYAI5IiXMn5zPa0nrFEZh5f78/hPcCVEm4YwW0OmhN2QNLCY82BvPWIndzmo
         0Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110935; x=1783715735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=fFwblKC376fuYUhSFV8jWX9s83ScYFcSeBNiiU3ueGC9wsxkMwpRmJ2uCEWJ9/eskU
         cnYwLUjDis+iwlf8MbNbgIrMY7zsKiMHoA4mbh+cgbQIOdV2b1BvKRwPHl1ywPdzzLXy
         jKrdewTWDmVQqGPf+YPpT8g3z+/oKieshHVFyPYbf84yVSc3LVdzQLYuJQcUiQzNCqvw
         dSYMC1MZCTVi9ygflNRTQaZDjnLDQczbq1io6YXoU217cU9qaNppFY9auUTCFzufF+GY
         ZakpSGzQb0Nj89cSwqb0WZnC9cndHEM/mX9RD9icQPjJBFfU2uR7Jlg+InAuzfoOZnIh
         8StQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtiVUe1S+mha1MatmKlxNLYt9Ksei0ptCEAs6WuyxmAqxkR3vYWdgy+6yyYAegdR3TxYsz6rqoQECJLl1JhGOh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7LZYpYblU35rh1h3EVHQNZCzYX5G69ajM0TRxkvHwGPJrvuOW
	DgkeRKHxbhBSHW2VTcXRJ5nQng25fD6ks10Iqw3TxWJuCwdftUUYrFMkxxHyR/3V9mkZAiL56EH
	O58CfxaavybXOa+LNENFxekYk/ULhWwT0VnscYeGr+Y4YMPfYdjeNr95wfXrcMEFUTCqZbP5Hc5
	fqeg==
X-Gm-Gg: AfdE7cmedO5kK0siIkhOY8yeqwGyZoFRa4akUGHenj7O1ZAayh3zfRUlyX0BTsqW5Wy
	GvdhzWCvmV7SJHRDdO9/tyIulRCBMN6JmUBYsZl5k77eETBt7h07LDw1F0HqzssRt4qu1J9hmv9
	+D8y73UPW00nOxNS/YZ0FN35FpO0vak1RmkRZEhoZYUm7mws18TADSkSDWA6LKsPjVk1cfRTYan
	cM4sW/SlKWMwpHhprbzngctCZL7lZmPXcbqgW0t2ZUoqMAWlNR1ESQraxr8eOBraSC5debzZJtT
	BlKoFqnd9OaaAa16AqsrvNvKr3SkW92TfsxDAlrTr6gkatdU9INoCB6tGUvVE+NATWCtzMSvYM+
	HR+9GJUDp1ArajK9KPuDTHmvSo718ReFqVjE=
X-Received: by 2002:a17:90b:3c0f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-3829fbd7827mr851937a91.31.1783110935543;
        Fri, 03 Jul 2026 13:35:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-3829fbd7827mr851893a91.31.1783110935077;
        Fri, 03 Jul 2026 13:35:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:28 +0530
Subject: [PATCH v4 2/9] drm/msm/adreno: Add support for A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-2-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=cN7pn2+JEuwNoT9wv704PT5FWDf0yxNfWzcSdWVP2z7Sjet4xiZVOgeM2KvXBFueaSmGt4kuy
 CcHPa+9lH75CVOuJgzKjvkpem+q3xyNaj1NqF1nIpvU+/j/iI6FWZIZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 3cw5Cpzao5HgCeh9rZ31fghxr0okndC2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXx9eQK2iDDT4W
 A/9+OVjdrL57JqACjCp8YakriYHeb9H4GJ3ctsF0V51SzxQhnpJRLDfjK+Lajkr9b/ugGEu6+4x
 pXq21FlR/iyZ/OoYWSy1J8/BAiyj+5Y=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a481d18 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXwOBGnFvAMQdc
 DpNilb65a+ESapem7wGi099lhIolRfNQYeFfESsAjp/KZZMqSC7zm38MvBIU3DzT7KlcfbvAV0M
 oUSrjHU5kGDTxrtW+VDVJsv5mjsgHZKog2FQ7lsGHrShIYtNJ2yduL6R97e/nTLiT/xKfNAQE35
 cy7fZkPTpaX/40t8t+dGEA10rFTCICqB21+lVD0jSF+VUmKrAUdXyvWeMrGMhu5hqwdE0DSU28E
 b0z5FtQuU6LvKtKeQ6zPOcoen9TD0wVV0HwE/48PbGKgNi4IfUSckGN5qE4NpfZGkTJaaUtjoPx
 labdYmQGOrzq7XInxdw//wQnj9H64icwO4hJU6U1VVYIMI7o4zITbUL8Hxce9MMER7ss44zQ4B/
 arqAyS+fu6KDLJ3xhid7FNpvYO8JD4K5OUTDz2hr/XyQitnmsRQ3JRBdrXsvRWlvDCBHxCVIsOo
 stxS4nBOg4CE8pB9Syw==
X-Proofpoint-ORIG-GUID: 3cw5Cpzao5HgCeh9rZ31fghxr0okndC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133536_856969_B0D0F01E 
X-CRM114-Status: GOOD (  15.84  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.54.0


