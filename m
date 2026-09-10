Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC09BC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=; b=gE/ueVdanF1HJzHTSUsbEwgN7h
	PGoONWBqrroZI1phHTAivX+iSDI+oF0kdBY3BRhfbY44ePI8FD+eS8P5aKB+mJSlOJC2cLyA2eQKo
	1nD9dt2I8LnWTWahJ/uRDx3mWOifFvy8TmvertyPcIuEtr1jJzX/zWoMaQ9rpsVexKacI4AVA4lYA
	AEKjPDEXpR01az1SZrnMLA+lko0sL0g7u0rSbxuKmt7xQwPMJZtFkRiE+Byywn9ckWmTQi7CjjCLh
	L/eAwNb2oMr3BpvKWUu1D4mHa/oWa7+exofrr7BEKG486IW8lxojulIfEvarm2zt4q7rmofx9vJep
	Zo+TkC/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aUp-0000000DnZW-2oo9;
	Thu, 10 Sep 2026 08:51:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aUn-0000000DnZG-3g0c
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 08:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=; b=c+jEIASySjSVX3Rc6ZQ+mn5RfS
	/brMZRgDIf+kNOaNujJ8lCN2wdwqJ9DzG3MvMMFG75gOUrT75rdvc6ATp0GrgOZgI5H3dhup0XKhf
	fhztLxtV1Qx0c1ju4dUJRjLO0b4MrRmh6QDjQwQLKD8SMJI3l6pEyGPmTfAth0Nc2isE+97UfwLl9
	fp95G/UIdlQmHPMM+yYmuao3baTQ+DCFzD4P1qT7u/SA1PrcRrkuyeq7Y5mu3TwGjszR0/DoLq3aM
	R1CNWu3jlqqlDruhBEMgSEAJdaQOx4IyL4OkZIPKK/WUGoCf4Q4SK8UALszAuWzz9qemlBRdSFO7+
	CSe3QqTw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4aUk-00000002Deu-1pR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:51:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GdSa162273
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YRdmCeGYdKolSM2/nA+SELTr
	KQJjw5qoJh5MBPg7W/A=; b=VM8ajfHfL5l18upf4TQXxZk9S9vC7wDi/ZzjRUHq
	V29wXTJeud59Q0AFU2ezSIWhFDXe1FsGxquyrQ5PMT5+fhyjAt2wRPdbYJ6rFeRT
	GTto1LbyT7uEFFJAF5dBBoPW3RCmEASnLGIxOdsZOkGc+HGParF9cPK07hgkZLhh
	ivIPN/IW9Y1F/fk26P3D/T6Yr7ERNkURvj3309DbPqTkwEqYbtvox7G1bqjvv0aS
	4OTP4XK2XesVgvSHx4VjwrISc8dt8eo/rR5WN61mfIBJxmpcvXGLnH5fqGgu8Cl4
	S4i8iu6KmHNlxX4Tx0WgIUOUdTj71mswaPVVhyiVuZ6Ujw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg31m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:50:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so10732115a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030253; x=1789635053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=;
        b=LFlJQbirV0D9CWJAAl5x+f0V6gzq82ccImhB6BiciekAdh/MJJkIFrnzeEEp6qm5AZ
         PIOIzOQTl3aTG6XhyROqyUmIcrvf4e6Cr9ptLhv4A6MfcoWfNI6/4/RTmNORCenLRjpZ
         tv+LX/xwlCk25Zeaj1ad+avlyadkiq+mdqoeZ6PbYVGyDR2wWiofOlCHq2OAYAzq8w2+
         O9PnS7ZoWsGRwcmeqn2CVCBPfhkJuAPYxqA8kG8jBKL6Z7j/8Fkx7ZvX9koGsh9DoHvj
         +MVmUzJOUVVLKRr5bhH0IYIdPysVE3SEU9VBuZ5/567/EGOB/c8U0P0e7z+3r2Gtw3RM
         kl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030253; x=1789635053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=;
        b=Sk8uwGT2mStqHLrVX1NI55srsrMdjrEEXJryH4oFFZ7mmKIgp7LBPko5rJ2yI/Z4Dy
         CuD95+Nz4qug2MK6RWqhhEwBBy6ROxgG2cyJMOlJWQle0dMCaZpxhWFCMM8Lt0gOMOh0
         Pex0J5RbLLw/Uo6e53iTIz8+ArSe37c4f7dLzRuDlSWathasDJrE3InDKi43aTvQ2pqL
         BS0Mlr+HziwZr46q/omCf9seRWnwgA0lWRf2nqJi5Cg9xN02eyxV3D3iJJ76wDKdpNsS
         TzetWUi7n4jRBL1gvuhoKus0flUNwoNqGJkF20R3WAV4m6oHAtBAYCfqeGDV2pSq2waU
         9/SQ==
X-Forwarded-Encrypted: i=1; AKwUvByECP+WjI9qGG3AUddQs+nEuC2Jhh+eOTWR424UCbctbiFaMDC1aYVqVlmxAEDfEVrVomg0p5pPdkN544H7XOjE@lists.infradead.org
X-Gm-Message-State: AFuF++m4r0aADay7zUiLyrLnLQhdekI63+pLL6ejmOS9Vrs0w/jgHdGn
	62FMsPrDQ6JffMy11N2lrOLh2WDGnrAA3WIo2/dn7exUgIjQpndNJyOPZE5efLbd98J+fYKYHjA
	TZFpXR/MVSiYxd/x+y1K6M4Vw/ML1EIHaI16w3Chl0usVeiR5oibq1iRdsMwHEz8xhrci+6FCDE
	BFrg==
X-Gm-Gg: AYBFou0aHEccO+zxg/fcDzlZ+OGCBDVi7+srGJTBKSnEcv3tmRTdOZs+iZmoag8Q8zX
	q29ig7K6jlO8qZvbjJiiaXAsCj+ytPARoe9ueouy0uqo3QJDEHJNxGCeg6l5mQ8QZuFc7U8qN6P
	i6dmP5SpZFPrKqD0zrO1r8OZ1ChXYOcc9FwAogpC4ZcFcG2kF8mmE1YvT/hgQ1G8oAkFQRkBJ9C
	zK4MJ8zgCqf82Hknlx6uhwlXc76zOixEboTUz8LhM+0ZFH26B1aadInEfWnCZ95QbV2DKEzqfyS
	p40X60K8vOjcuDj/lqtbWMsb/qrMDN7OUh959tY0pbUyj+nHEHr9vZY/D/K2ZQDLOw+AUCWQ9QA
	sJLs51w7zDLu+3oUXp9oSiY1R2tI=
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr8751286a91.24.1789030252475;
        Thu, 10 Sep 2026 01:50:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr8751196a91.24.1789030251843;
        Thu, 10 Sep 2026 01:50:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm12817627eec.22.2026.09.10.01.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:50:51 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:20:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260910085045.eargbxuwmeyhlhrw@hu-mojha-hyd.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa26f6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=OV78iIIr6_8e9roN0uYA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: w3ilr3jVDqqmR1tC4eJVJ4Kyq8lPaW7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfXx/NwZ4R4jMXw
 qhVsdUEgo3qtAMwx03XPlhgrXhd+tlkJfAjFpxMn0cHS+ICJx6UaFOMIwM05mBu5ZIvCr33iQaC
 0KMTocEyrJ6mtbJHJDB9i/B/i/Z5jaBnxjKXV7C+fPf3GJbhhLrVJG+CHjF5kwVrcPazkRIPaNM
 Or3FyftECzBV6bSEBDb9iDP+y0U2pmN+r7+3UZKmJYc+XazOASdOZyasLzn7G60Uow4ZYBUpT49
 YJu5vt6NfMWfkzk5DAFuDMcs/yf/x9PTO8/CuOGlJMO2j6dDtrOaigzntWA48RFqHF2FtJ10yq1
 Zlm3M8BO0NSzRFi9pRrCzSNPYKnNTKFYjDygrC47LbELPCsC6iSSZpShPqOtP0S1Lq+bzsCFZpm
 1JY24RMAdhaexLyITEWXIT8pISAoDFCElra/kgO2fd+Aab4bbg2mksnEdfVH1OtSrhYvBKSCJk8
 RORzpAlITeAO1Tm1B7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfXxmpKXGtFpqeO
 CBkjz7IlDdDzyzmdsGQy8SfWy5E1vNJF4B7TdYqfJy4xSIJl4/puWA0cL/z5uUDeE1HRIq1fohe
 RGxrpgQEoTRn1+FEndyEu8pSN7vmbnk=
X-Proofpoint-ORIG-GUID: w3ilr3jVDqqmR1tC4eJVJ4Kyq8lPaW7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_095058_883710_046C104C 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, Aug 14, 2026 at 01:03:34PM +0530, Mukesh Ojha wrote:
> On Mon, Jul 20, 2026 at 09:03:26PM +0200, Krzysztof Kozlowski wrote:
> > Merging:
> > 1. First two patches via interconnect tree.
> > 2. Defconfig a release later via qcom soc tree (dependency to avoid
> >    surprises).
> > 
> > Changes in v3:
> > - Update also Nord and Hawi
> > - Split defconfig to separate patch #3.
> > - Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
> > - Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Patch #3: Switch to built-in for everything, with explanation in
> >   commit msg.
> > - Tags
> > - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> > 
> > Similarly to clocks and pinctrl, interconnects should not be a user
> > visible choice.
> 
> 
> Looks like this got missed in this merge.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

All this while, I was replying on v2, this does not apply on
next.

-- 
-Mukesh Ojha

