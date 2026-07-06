Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE851C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzc0UyfTLrZB1zWo/aKngVCr9fX2cKPgrJwdh7m6pAE=; b=4jXHL1IuvTJg3P3pboUdB+/gyJ
	siMVBtrYcpyepW6G0t8ycDAk8xUdCQIQ/khW6zyL3DCVXCzG7JIAFrYnTY5+Ld5z/vyXsoLvZNLTd
	M9b77Diuz7ZzaciIUBHiCuLsKHy6dVPOPbDoN49QjlShkAwqBomkhKgTr3sjfM9orcwUdtwrL/bxs
	tAHYlUS6UB88CeutxhRBp1F9H9Em+PtKVZiM5dKNVNWmxBuPXF7TpXMliuecYTexfqARVoIZHZd2C
	3KlelZas7Nn/GJZtwHb8Kwo2luP4Md8qEIF+ChrYptN74RUXY7b+kTOkNWYtHEAO9tvE4dr7Opz26
	mJjsmIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgquO-0000000DdbN-2UEH;
	Mon, 06 Jul 2026 21:31:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgquL-0000000Ddb2-2kCM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:31:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE3kh1478201
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzc0UyfTLrZB1zWo/aKngVCr
	9fX2cKPgrJwdh7m6pAE=; b=EM4BFVw1U6C44bzQw34O8jRKusvwreqOly1nZt1U
	oUhDEvwvB84iMe50TpYtYotIRmv6LnsjGV0QrJlnDBBMdEGm8fJuwvUR2G7hXQDw
	sh5GgBKavN6YTF4EHHthKno/Sbckz2rDTTyEtWtmYfUfuudttKmfTfXp4H2BeP+3
	QlFwddHyHWpvXpQr6bE8Jp57G4SbtS40GCN3Qy5/04f1pSHm+4PkBsUmQAjwpwW5
	j/FTha4md5OulfNuShjkXnVoz+PBxXkxtV8Fy89xQAUilimimyGvgJp1W21383Cb
	q39IfzkWdNNWJRfy8bbOZqXLtMps+PbzZhm8Q0IYgKzADQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsbe3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:31:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso44552341cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373476; x=1783978276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzc0UyfTLrZB1zWo/aKngVCr9fX2cKPgrJwdh7m6pAE=;
        b=juriiMNfBx8q0X6Mi89mi8Zslip44XwWQkoPGnsxnA6U0++jH39IHPXolO5p7JT5KO
         fIdD0X0GkdoDG5+LJ7mdz7cDu/AjvflfRI/BGuISFAeRXpjoMgGOXoWvHiDAl8faXKhp
         DofdVjUGExISBoXHn66I6zvWnywh1xa+0QEEJZxpDRB7XbGKTyA0ePKanTFLH7qhgr8l
         3GkxWRbQhw9imF6KFCllVlmXNRpKjU5bGxKWdZ57YhsNEgcVCwM3J1/DMVRabXVJO0vi
         l4VWOeunHJB4ZIqBgwX+sRDdkvGjNj9sOnRZBRZNIraVDgwBm3hoCBITftqMjJh8sn52
         i9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373476; x=1783978276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzc0UyfTLrZB1zWo/aKngVCr9fX2cKPgrJwdh7m6pAE=;
        b=X4PR8WejYRECDUOpFZMJia0pRo4KtUHTzcta9kcWNHv37xgZLzsvL4nbGHelKHJgZM
         5FDXH07xnt/XZ91WS1kxeISgrkqlRTE5uWj5GLZY/VHt5PtQNr1ouOj+G95s9XZR4MKZ
         0AaSvHDgFhN0lFi1s1rMf7KeaGEvRB/6SB5Ujxxcq27QVcPRNrwTA0pJ41jSnlyF+r1n
         wSkCJSV09jn43baEHqBu+cRH+TxtcMSY7XGFDGsSyGhbAUGx3afGulMw51LI5qSJNTBy
         X0ETIk+DpfNXBf0LbLZn8otCwzgaWNK6X/Qf20OQJRC22gdw+VQUqEtjYe3wGzIObJ20
         pkJA==
X-Forwarded-Encrypted: i=1; AHgh+Rod7q2izlqRkdDg5u10KU8aHaRq1suDsCX8xnDpQMKpz5f+m/BBbMydNP1uam+wXQ4/jrVx+bP3prWTr3zf6JU3@lists.infradead.org
X-Gm-Message-State: AOJu0YwaKW26Ewt3FqEZXk3yfYnvUekTOTWb1UULJ8juxLkHfaZGuhVv
	b91Ojodwa3UGckQVvoYk6hRL57QnbDyqoQVowgKiXHfQFJRevERWCFfinqZNlB8i6EFQyjM2KA0
	DnlgjMyYulL0sRgfbyC+eE5nFlCBb0xOUZKpNqLAbmK2m7uA0+27AmdClRHkRkIpZIuOUszjqnp
	CoOQ==
X-Gm-Gg: AfdE7ckbViHN5gVs8LDczCK/qqbcNypTOCUXD3+wk4KALiAupDseiVMjdGHzbHWigMs
	C61ehQsi/gHpF+MQDx7wN6ZCPBJqy5ukoGxMxrIZZgL07SI+qShQW633RwhyJ0/83Jm6iI+nBID
	uMi9EgKAXmqSYxSVq76XCIu/nFYP3QOHrsj04PButt5vSfBtRHBG4agE9kfN1scRgo9KPZ0kNiR
	lu/8EU5kQDhqYFKvKbhbrvT+IVizKEgtDWd3/J8F8bhfmTEHEDDthL7Vl76TpoE/9SJcrL/BWCn
	UoraYArI5KZHfWh1y5czAsbHrZSaSCIJ1j6+3LG6VRixnvePZbW0aXg13NqVuiO96wqZ+5TK2Li
	OSVSo8j42TQDPQILC06HKwgOmYyXnaO0c7lVyg6n6oSDVlVLYQobCn2sieihOW+Gd5mbrzBKmGl
	trKNjgcUJzAfPYpMGRUCQ4rpzR
X-Received: by 2002:a05:622a:248:b0:517:8011:3a4b with SMTP id d75a77b69052e-51c747be066mr29060351cf.21.1783373475654;
        Mon, 06 Jul 2026 14:31:15 -0700 (PDT)
X-Received: by 2002:a05:622a:248:b0:517:8011:3a4b with SMTP id d75a77b69052e-51c747be066mr29059761cf.21.1783373475081;
        Mon, 06 Jul 2026 14:31:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb417sm3124713e87.50.2026.07.06.14.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:31:13 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:31:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Message-ID: <u5jvkfixrm23gugwlnpwq3ov26gf2yqf3pjntcl3k5t5wormet@powdt4jkmqmo>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LM4TjgRVFZTDkFZtGhCK2Mu2hOG7NpY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX4wtqMMha8Mue
 vDuY2SnIedOn5gCBg19irV1tnxZIlf6CJILZi41ptvBbjth/9YGrhSgsTOkh9eTb/yOlsIXzNKn
 dAjenD/zKvtT01lRCMhqb7ISFjYaWEosvKADYp05ySXoRvZ/EyojBZQcYq/FWMk81Buutc2TIA0
 7Pr5H9o02aGFIwM33jAnQXlG9ycsB5zvO+Et/FqVLVnSE+ZjL1n2qo/GWE16C3xvDd6p30td3+O
 4bify5UQ4MlgWW6T1TVReCD2r/ZbMipZv3gssWNRZ+3nZ4IJkLpCuX7IQLXmicWIrM2ob4HEWjf
 3gWEL034IoUVq/EMgqilOH/koXBNNUWhpMyWa9o5b17bOOhtZYdztiOWbS4EtegKqLktrkK5V8s
 jNQUNJTODK7cx3JMXH1JwCico4wBlbeyvPzdckjWQmQmW9t05lAtsOurZM1YCuEJjTgxL/5gviC
 txdMSZD3vBYpolYKduw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX6Me9xUr5qVG2
 uH29m0wXQED10dxW8dKV9YfQzDyU3g9Bjb5mucnxVYq2xlzraUNBHyxVbQWwbBEPt+m3Z+67b9E
 Akojwt15zgI77kMuGP0JlUQXYuVsbF0=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c1ea4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LM4TjgRVFZTDkFZtGhCK2Mu2hOG7NpY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143117_831313_304C7603 
X-CRM114-Status: GOOD (  14.20  )
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

On Sun, Jul 05, 2026 at 01:30:07PM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

