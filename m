Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A0C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=; b=RdDCJ2fpmG9jHQLQPbBH9xXKim
	NRg97dhlGzAbkuDaZMEkUbzQ3b5e1kq5MqeqYH7ojtbHMYIMnr36mjxcqXRHYUbkfKandTtIJtaaC
	hNddlLQBNUg9uV4pRWKPOSPcNtuHp7hZQ6F1RqizQ5e+XZnsA4Wz/zTPV2Q5Ro4PGZjmAT1Dy5bGP
	y8NDg7gvBgbKnA/Sbyy1RiUUeOPofKjQxD8S6TWotsTIFK/qi4L4yMakuYylHQ72Mco1Ps19Gvz+H
	iKG6mzQLF0/vbqJIflXdpwCK4pzADk7j2ztu3oCcaHZc5CIQhS3iGcWfyHKkawIuB/I671/Gntve7
	n07vFjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Id-00000008QS4-2Od6;
	Wed, 29 Jul 2026 15:34:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6IZ-00000008QR1-1IUX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 15:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=; b=SL1RB8GWb18nFjzyzXtvq1xK6x
	6TMKnLabCDfjbnc5wyeMY8QYFBojNlgEJmtpU2PKesX1xl9I5XvMf9IrQsDdmbAf1Uco9eXPjB3id
	Nt5yTOnxXbgrNMxVAZxRupvPmpz6jTpIUHmq7O45GsIgOABoisTZSSiEsHTGEO90vIHoade+3sWSL
	rudlXyGZQUzEU0z76kd7CnWyGKqlxmnO2fljxcseq+wCWAnNrk2UKvNwaKkbHNPjdF6hFtImTloI/
	uh/ya0qfptBTjZnWRvR/whE1dhPR+VBwk1M6P1fnjNdtJSYnWNwib6lVgXWPp+Tq+wyilaQAfPnRZ
	cYKLfPwA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp6IV-00000005xib-2OzU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:34:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3HHl2108280
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QUnH+rERyXcOOevFVTmjG9tv
	hkhekENrGxjVVTyR66s=; b=kwCMMNCNfZnAf8pOQmuZW8mEiYknC552j6RhMaKD
	QXbtrnsTBy7EJkGrp4cS3030eX0kyMc2YW166MHlRYIC1mAUmvq0XDJ06OHyOp7I
	CYMDK4gZXqTeIUAuOEdwc5/eNP2UBCRsPkM8OIKcMMP5ffkc4YZLeZcosdHyuZae
	86elXKl2WFhpzbKu2A6A86zZ8V3csxh0usCmIot+Iv2MdGu0Ew1fQZQT2gqN1EQD
	lR4ZvTPWqoWFWH0u7kJqX2xe0DPwjzXxnuaWENzg6/xXjHZe5bKcaYt6rSykmnaf
	dQDd6YLy1lotbwrf1iTiN7QfniDWmdOvFlpw6GgwyIzMOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8bpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:34:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso13181301cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339242; x=1785944042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=;
        b=D54y3kEYQMGjzp92p7XxYn6aBrAp09xxeSl0LjN2s1nxGDydu7uk9QuK+ZhC7RIi2B
         XHRJ+70CmiZkjg380e4VWWrzLJrs28NIwvzpM/U9jl8KASgeuC4KdOjAhCm2Z2D6KBYS
         diC7pRxC7i05Mm20o0C8nf6Qq2L0PBYUxV8o7tb5ZlL48HIvcybjJoSlVyvqqy3qpBPK
         DS1sHo04rKZmLnf90/FyACsjZVYEXrBq13aqI1tsXwHSuiDvL/KsRWdlsmW0KevfYnE1
         VlZeJYTAR/HlnlJC9AhF00Wzb6cIfHukhLpMm20icIFPMPyZaaUQe5llEh3et0J/+2Fj
         s4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339242; x=1785944042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=;
        b=WPLRX4m9wRGz9q7JzcYRvkrQePITQu6kafD2a7r9qVsCtLYjCtLtpDUHZXRchXRdcC
         S6LT+g6jGlyWUn6HibcFMoK4NaCtMCTHtlWAYnd2run1FAzpwoOmQ3UPGAxhWKxO/9YQ
         2xx8mJndMjI5C8tn8euRqKoiKwkfGGLKlpVsXOzTouHDAGYh995dOcbUDGidnkfM9H/v
         g+qkCQOja2XiN5RtNVm+DE3YTgyDoro0TwfQYJxEPJd6YdkWM+f+Mj9JlsiDiho6dfWi
         tJ953BRD9HBQ1RGUUPEc79JYyYc/I3e901QQ38+fcduVDXRLynWfgCxLXO69dYqASHXE
         uIvw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/yexAE8YeqsJLF7OOYbYkENmLMnX2uTEpa3fg4CUVHgsstBR5Mn+TVDgE6jOyraIjTHsOywQQB1PkapIpK1IC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw03Sry/frrIA1snB1193DgYpWx/FxdPqRG/ox3H4aFAFNJMBQr
	um11liRzGK+aEJJ0iUmR9WfeylDQzLgI5Jw6Bbs/ObnId4SZi2Hqme4xYmL9ajJyanwWiaUFpM9
	/91MJTinL1DOTGMGgC8iNFwpMDc8p3wR1OZuHnQX/+gUJIkehvLAOutT7uBLgRJem/tzv22+e2u
	YKCw==
X-Gm-Gg: AR+sD12fwR87DJW5z31JSOPBDJoqf3D/nqH52f1X2udupDwnU51SXAcXTVMn0g9SjEE
	Ew1JxHmk/J49k8xz2PwQNfjDB95ziKTS2m3LI7jlET2pJKbONdFsN96j/qLAo9nCjjNajT0dETe
	GQtmDr13Ghj6yE0WQoSs2+Vxj4E1d17aF6aARCenNtc5Kyb93Hmu7rUrwedCTGPl3yQ+tWWx8xg
	Xvv22wdEN4JcFU5wo6XFtZs6pD98ktz7S0jEtmhVXtLgoN6rqctN4pSSxaccKwAtgUMHgsTbHIg
	62OPnwztnNRYGCz3oFQq0GdIxF4UwLrfcX+O47kZuigjvaCCK722MPygMKZYe7FyxxIQgSERJLT
	WZUXuBvbQxr5maW0=
X-Received: by 2002:ac8:5885:0:b0:51c:640:231f with SMTP id d75a77b69052e-529d70d6591mr71296551cf.45.1785339241911;
        Wed, 29 Jul 2026 08:34:01 -0700 (PDT)
X-Received: by 2002:ac8:5885:0:b0:51c:640:231f with SMTP id d75a77b69052e-529d70d6591mr71295911cf.45.1785339241231;
        Wed, 29 Jul 2026 08:34:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3b1csm9218589f8f.1.2026.07.29.08.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:34:00 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:33:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: eliza: Add GPU nodes
Message-ID: <gpqulnkjhpp3oqin3xouxcyytfpnaw6bckmmutbzdebfmnrdvv@ylnrzbznwwcn>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX7ZTYidY1fNZk
 9A0ala5R/apJf9IUEpPQ8oFY98Nml34YiMn+IfO4rdl4lyOYgRRDq59s+3DJwdpS57ikWvQIydL
 /ytzeT19/BMVbJBfohTOzBSpJiA235g=
X-Proofpoint-ORIG-GUID: KAHVNb9quezmYfinv4kbnacW0MwIqpNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX/myYZQltipuB
 vd8paFCTfPxYsMVZ9e2KF34wcP820XzHDZTT9vXC2MmP7bvFqkX2EPW+iVir76Cg9u4f4pl2dP+
 ECO8h6PuiSZXXj4RjsnnuUSpkinP7sRbRp+lTsOosC0qzR0zU2EQYXDJ4F+1L4F2PPF1kxVPWxN
 6YoJDZGE1573bUI+6wCE3WXVFDsRWxxI14BT+867Ovm33zS++TgzdxGEAs8phjmtXsVAqyqpFqU
 pstzHPtpBfEEwC7IPa47VkWoyxg4cVemoWYG/F/XDMpFJLPpQVeNPfiXmZ5esV5vZeljo+uHpQ9
 QaumViPDnJ/uZdYj0dhw0lwOJxC1N5B1CD9p/seuXJMqB9e4GmVVI8rJjQsV7R8WWT15EQvpVLo
 8SttlWD3vM8jk2KTOig76Oj4dUWn2T0+U4JzqwNtZ7B3g0uwRz6NtFUl0thUtuMt7sD+k0yphBf
 8QQZ32V0jwwX39Guluw==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a1d6a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LzKdWfoJb4QxxMUDPeAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KAHVNb9quezmYfinv4kbnacW0MwIqpNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_163419_997743_00A1B712 
X-CRM114-Status: GOOD (  11.40  )
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

On 26-07-18 02:11:32, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add the necessary devicetree nodes to describe this GPU.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

