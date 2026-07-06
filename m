Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED047C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=; b=wReWs7zmi4z9ev3GcHVID15eQa
	GLVIf8MLMSw9OhRdIGAc3aVObnhOU6IKX4uV2swhqZoJd0DeKVLiWHST4frXXp86JJBmxMbqiI9R0
	kktupBRV+2+4rWckC1dWExxMSNoSyook86Ca1aUvlMPeQ2VQu7f7zp+pmlZ3mSB6YsI5yaUMQiX2T
	To9L3cyvFHvwHNTYSbAzjdGHzcqtzF5j2/oXxk5khTXgPPfdLhzLHq05sR1qARM9FSoo4JJyfub0J
	toIz7XrJ5mm00TRz+J0g1AAD1fG7sFhbEPI0fRfLU/hfhf+yBG01pYVP8QgUM3RlYWFzapSVNBwM4
	KxOYam4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf0U-0000000Btcr-2frJ;
	Mon, 06 Jul 2026 08:48:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf0R-0000000BtaR-13Qx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:48:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6667C1Ls3844957
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 08:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=; b=RoQsyK5f7fV1iWo4
	SyCXOG5Wkn8sUyU2MNNAjdt+XvirxwPpqH+Vl7KXVFEVxe6G13eUl2I8KVybA5Fs
	bSvo8oIfzknqPfNdnifuLyviUJ6qvjS7+XgDfmJkkkad+KCKBhPrhToiobXU1tIl
	YFdVQfN0zAjEXkvCYS/RJwZyzBnhTM0JKyMah2Xfn8xtenWxWKQbuFKggz6rMm1c
	f7N4t3sUjBejdx8EkRRKelOmwe/39PgIO+IfwWCzvdTvih77/oAKY2UL4gfGdrid
	viv5xUbpgVRpsw0bW5UH4/K4NFST7TWUs7qPFG3KyW7Gj3qOHq9VQRRK1bEMR40S
	50O6Og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrceq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:48:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so20865561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327726; x=1783932526; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=;
        b=Cle2HhhwAw+9oAwuTDJW5EBm6bjQ70ao970paNF9Wvl7gcHHBVPkwJc3iDNfSqOZg/
         H7ZekMbt9FPjrq4pzJMcyvB/2+IgZY97OuXOsCpZdrnqgiO4oQKgjEhLCNUuj8C9/6Wu
         KXzifNah7gxkMz+CNiYSkhPF1RJIviienqb/xVkwWayWCSpcYOVWhQPYrN5qeckUHpKy
         V/ygE0FandIzfyUl6UqMw1f/X3uFT466QT1W+Vd3fL1niDrOSO+9gFB/2SaQBXaparqh
         5cMnOydB6FmU6p9pzjvA4d4UnZPv+XgrChXTkEUO0JV5tDEc+HREWiuUIbKm1CNbdrG7
         bg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327726; x=1783932526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=;
        b=fDZoVg3o7EHi9ZuReNSTbZih/rGu6FuZkvATSaBJnu2UkP1x86N3IvU96aMMIkIQtr
         p89kTc3BERY3B5SIeljwx4rvBnaeKsRDfRzKggyw8dd5ZmYaXqN2nV3fgz0CKogsNehD
         Yl7a7ZruDLIFJUqvKUAnm7GM3j7FoNVsREGFMSQt5iYBS1zroQSFaYMsANZnJT3BjcAS
         JAFEn2Arbm7eTbhcUqO3xwYz8odIdTRUf5qzfECzY1bDNq+v3U4OSoOQrb3n0aakmqLY
         j5NS7i96yX845ShbtVLdkap9JSZJhyGy0ziCLgm85A0alRvcTVJYw5F8Cqgztxd9sLSW
         TKxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4JjRT7MSE1GRRi8UU9iic1Atvw1MdOobyvQAVkEAOaqHa7a9mARd5qMo1G0ExEMPTq5sb+D+tXhmhuAw7ow15@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0t9J+EfUc8Nly2UJavrS8T+NNbawl/rv01mtNVQINm8BNWIND
	Hdy/maa+FUY7zzldrSTh0fgFVZTRGTnsFf06MHb1ag+NwyqPp/0EkWkcx8DzamwAx0HPkdF/Inc
	Lkmru79qwzoKoGuRiokAygwE8oMx7YioqonYRqtccUpV080sG9CvcHHai6Ed633JPcVSuZFRy5B
	KEKQ==
X-Gm-Gg: AfdE7cm9aTaP3rj89fmplKAykfRWQAqT7tvwlNMHjiX86l2hPDlseXZ5QCjuJDi0+7z
	yVAw0T6UPKFlqct7+SO2zdZPhS/vpmCRObWQh0kKV9Fy8kH4rpVfGoYzmyN2gAP3L1X4TdviSHW
	uOACJy2+ohIfrptpJ+hpcN/rdOhNaOXB/Gdd1nk5qBltB1MmdPRIoraG7A9s8xcCWy7Z0UI11h5
	rLRVQ0KmaNFMYZ76GELsc+8Fnnzrv+arLcgCDluEPWs6g4IYFP/QidoE4oc7xsgcGuKrWOlzq9/
	WEdZiWMVeXElstJd6uERiJVCSnKPYskWRSA7GhYOeo7+/vuLMq/9gOl7mVKdC8QJxWgZqfe0MVf
	cFS2TVj/yP+zxDQl6FmEeaC8xB6Rl4tBKMGM=
X-Received: by 2002:ac8:58cd:0:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c4bf30d44mr87210701cf.10.1783327724790;
        Mon, 06 Jul 2026 01:48:44 -0700 (PDT)
X-Received: by 2002:ac8:58cd:0:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c4bf30d44mr87210471cf.10.1783327724419;
        Mon, 06 Jul 2026 01:48:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c2d37sm691730366b.42.2026.07.06.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:48:43 -0700 (PDT)
Message-ID: <3208407d-05ea-4b1f-bb65-91afbcbc858e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
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
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gvbm2cZ4DHxP1q0NNZBqN8Sjt907FqJT
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b6bee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KnFAnPMC3uCYYmJdzeAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX7yMY+RdUshC4
 YeH38v0+ggPr629f1E0jDvkvyicXu7ikhldiTSOt3AoTW/aY3oabdyckV2p2zRT8M4LdmUSjG9E
 WfmXHsCf/hPhRcPjh2XmujzyOGVOXjs=
X-Proofpoint-GUID: gvbm2cZ4DHxP1q0NNZBqN8Sjt907FqJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX3gtcGat6/WpD
 8y67nBU2i6zOLDKJbLd8dXYvCcIgofMEHPdZ+85fFSY6YfYy12YxqPRdzJc+ffPWSD2S5sZKi53
 nly2GH/3gxWar5TSStKmWjDTrWuU+k2noTosy6qnTZjPMONfrlBaBdW83BxVGWZDNVAOLL36xrV
 DKStXpXnn5ZdslxTE9o1jfUJGl1jCBbxBOmrmCap2c+yjHpLDS4WTpKKkJxanGkZSDjLBs2DI8Y
 h/Ibmo4t+ghb0o81EGFcbcJZnFVG/dN5ZIoJnYZCmHUB455AikGyft2EoB5nekeICpwvAaogJAz
 0ix2GxcFneJ1uxk8DNxLtnev6n/Y6esZJU2Huk2qJYyQ+OByMa+d+gedYhq6Wv1GjBYHaCYo14V
 mRQukO19e8U99t90qRetpp/7FMJt8nK5fKpcj0iA5UFfu43kzOFdf8HrJ8TXI5OBDdSmLu3cMRq
 YyDdp+7kNP+W6RLr53A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014847_317700_4D707BF3 
X-CRM114-Status: GOOD (  11.08  )
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

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
> (clock gating enabled for that TP0 stage). As per the latest
> recommendation, clear this nibble to disable clock gating for this
> particular stage.
> 
> Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

