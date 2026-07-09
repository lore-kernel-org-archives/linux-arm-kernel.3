Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=3BqDej6J1OmAGM/8vcbF4v0xnV
	rGixFiJQtDLJrictHJn8zgHDzyDESDjwoNNbr2L8txRyLf6Skcyecq1Xnbz7BHwLy+n4PS+43thR5
	9vhY2Ycv70v30UKCcuwKoZ72U9yEYpMpFpL9si2nZCzlBzmC24G0JbWhqM6d8qgf5fM8iOfWq7GpU
	pFJCG3dwx0PqKQMDdx9+JOee5zeKi+kOhO0pEn11LboraUDj5SKqW18oHMn8AXnN6r+IW9OahQBrZ
	aZSt6J7sQ9EUlyNGRFwGRkR60hx18/Kc2L06WdqwYux0v11pM/B3eRznTN4wbxH7PLUyfhHNo/QwR
	dITtC69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtho-00000003Hff-39BM;
	Thu, 09 Jul 2026 18:42:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthk-00000003HbQ-25Am
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:42:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXAG52503948
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 18:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=dAwLOPUCN4+fS3FY
	zSMbQj1VkLrgSvjf90D5Pv66M0wHcSeFsoCjPd3BuNGPPzjo4gq69Zr2EPuf87+q
	xY51GcMBq1NbBDYfLCy2PY4fi7BdQ3iwUiBqA+zJyxKyW6zXIdNu3zj2XEwihOg+
	NUfgX5QVOrcv7xIlGsEMRuE0LbXPRUnZsMCDlCmaLy087f16esmgAvpimQ6i4KYM
	aLgvtof5MdJeIJHSaljSMpo1NHxzwWTcs59aQA1+pGWqIlktr0y3wh/2TuYVzq+a
	tceDmYbcefwf6gkuY2BkT3dlAXVR6+gUlj9iqSR3Z0x4Q5Rrl7ZsY+R3sksmOxGk
	JoWkhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3ucqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:42:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so177791a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622555; x=1784227355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=I81hJj7A2sVoI7YZ9FH+FqaNl48H/sH0/s4uJ+QJhmbKv3+eTvgM6ydoAO+ptA9PQd
         Gdn6jln+wvi5/mhldsQTTxTo6VnKf5YqMZC+znl0BRZRjoFKwwxHBHZRG0wJpPqAyK33
         HvDYv8Ja5tz8pyJifqr2w//bpPEbzqL7P3CD+y0ZjQZ/eRGmoTqXWOFDCnTQKHc63J/d
         HD8L0L/ndRuiePFP7A6LroQhSlFGh/Vh9w0ObfFzK+6uD2FPnqjbzcPyAB3EoseQsVs5
         hDVwUfEl3jp25maJv7Mc1nQMgy28A+dGqGB3oaVR4l7GnRKDbXHhtMfc1c6FK2HowRr1
         UQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622555; x=1784227355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=G9P/9KfQnfIptR357KIqS/tVbpBomhoGiwOX1rpZUY2L+MStgCIq9dOnqSEoKW9rGo
         fEBhiWUp87yApekV2MYZxIVtozoX9QGjcYraFiYLucB9We1UDRPW3S7A0+WpRJfG1dIh
         EZ39uShoPilAnCVx+mwKgYxd8Cb5LtoC1WIzDLY9ob0BgLFGQsMmdzYv0bhzR2GHbPRF
         5zG5Urn49C7OBFBLGY/IQ8UvzbS1Fb5SQCYLHHhhez1Bvz91VHR1xxf5H9e0/NwUgTU/
         FkmAMg5zqzKOc6GUcIOnvPCuFT8oJjZkTLSNWE+P2iakDQkrSeCU5eSRP3tttiEfSuzM
         Kwfw==
X-Forwarded-Encrypted: i=1; AHgh+Rrwmgvf24MhC5CYgtIJTwsmOleMknIcQznTB90fFD3pBlHFsuUrcoRkXri7Edu7qOIST2RU2dT+iFC6bn0jO1nG@lists.infradead.org
X-Gm-Message-State: AOJu0YwfmS+1CBEJuHcBaciF2Duts9VylG11slJCBXxy5+/MVuA9kyaQ
	te8pbeACgqvTdXU/6LXvvO48d3HRrG5JjvpQwYx60qdxDJFkB2blEJCGGXWeFXKoLUkLfaSX4du
	pw5Ak1v7dHOYTtd0wM3y6RbZoptXq1/5IOiUitrZHJ50K2V6zCGXKfRCaitw3nK4SawPVxInOXc
	bdFg==
X-Gm-Gg: AfdE7clYYBdmw6QUFKTZEFbBMRdF084S3VVvFX9D78E1cgqWCDZ4T+bHONLM1kfNJPR
	1U7CCNtT4VmQEcXsmUaN5v5FIeslu02a9b2lWaPNGjjVClBbaDg0WmxyHTYKym+M3x1+yhmF/i4
	4myoQBW9gbw/0U5U93zH9xWwIzkPAibGtleHAzc/sU4T4nhXdPJ3LW7Q1yFi+2uTzfJriFFgX7Y
	lFvqnfIwdIi/XEfCpmfMVlVPjwcPN/6eOWLh9iXZEbUUrVBcS8AO07Kk9aKmm5pEP+ieaIowGZb
	47on3YpkLTpcyOApZHV9HC8zNxR7qbcvyF+VIpTbqiKg8nlHbiY/vjHg+VXiBqPcrTCmiRdREKG
	ZSdr55wGzlZtKa0RDBrGyafd8ApWilUf2f1E=
X-Received: by 2002:a17:90b:554e:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3893fe5d587mr9351771a91.14.1783622555151;
        Thu, 09 Jul 2026 11:42:35 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3893fe5d587mr9351738a91.14.1783622554713;
        Thu, 09 Jul 2026 11:42:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:00 +0530
Subject: [PATCH v6 1/7] drm/msm/adreno: Add support for A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-1-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=nxXrfXueHCc8y0f+NSNb9djpV2+XQhcnHRgE6tAiSlaz/KzrkKd70ZDgPVMGFyhqmn/+r/2aH
 qjx5RZWOQQCDnIJSYqVVjc9IR1xwlOARTfmr7T/GKNDW7jB80rJlUhx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 9Av2wAkdmvjAgA5EgUDuCg5NBEdRrZQq
X-Proofpoint-GUID: 9Av2wAkdmvjAgA5EgUDuCg5NBEdRrZQq
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4feb9b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX8w31fVSpubDQ
 JtP8YedD1ej/SM9xivnlwAlAspbiR3/SM3bbq13EoP7uPPawvcsKJ4/ApolODd9+nyUZ9YBYt53
 FX20ID1T5Tr/wFJ+c2Xfla90wv6XpYc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX/ymxQh+IkeLC
 t50D2e6HJVwIw9TBKfQw/EdK3YTg0n/cbAwGNl1LztEcmKZCFDFxUJyz7dt+PeqQW6FJnbMvIYk
 RgbxzffEQuAdaedF8q/10Dd+BFN1n9n8RTzlrqL+VlagPLHefLcStfRgSGWXuzoFvKmwx8cJOlG
 eZhUMzWGmsaB+OWylNnPy2omFvN84PSxkZqwndy1T+Mcni3cDkTDXeQeXFh+ZhXsmhxIcNl2RPT
 w70gs5vqZOIUBtloYBiveKAr/QnxNv/yoL4oS20HxX2vzigfNEMYsElPBv8eCddWl6QdYJeT1w3
 5GBx/pKNISxcVsKv5RENHd2bH7q0TSFV++fZ7zHcNwDbsagRxq6X5lt3NKii2ylJkA0qUZyN1q3
 mzaLLphS0glgcU05RE7+hQImcgluE2HpjmsXDfdSijzxahrFNTT5Fs8N3iBGHxVW011IVnW5tq0
 1u+mfx+3LbgV2FOLGRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114236_584896_22B392AA 
X-CRM114-Status: GOOD (  16.45  )
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


