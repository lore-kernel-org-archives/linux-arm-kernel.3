Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63145C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwsbbABhCqD7YrBomZaCutoKKqKwzQ6UY09UG4GpRbY=; b=2z9pf5kykKIwEBH9t8rFofJpbi
	wwMHw8MxllDZHfnQUkiOrTsZMFE8pjYwf4BcZke3QZwD0nr1HGZmcqtkbgmktsc1rZCVtI99lOmSx
	W2cOin6Qs8foM1BkNtCCBifACY3QEgUpm4vSUOqneyntb3FhXNyis6HtNUKiWjdvrOV2nN3Pq5oqB
	xY8U62sON3IbjqL2+INpDzG7KliQXbZs3O0oVZ1DIT8yOQp+bGcAJTgxb21Cpad4lDSGQcCepmJiU
	eHLpeqkHvRp1Ai+zx50+qLVZGbhrCBOs9XZCzuSysFF4exs7bA8m37NqV5eJvgNWpCq0lADDNeJcW
	MxFD+hBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4a7n-0000000DjxQ-3oUb;
	Thu, 10 Sep 2026 08:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4a7k-0000000DjwL-0LHm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:27:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gv7O810424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hwsbbABhCqD7YrBomZaCutoK
	KqKwzQ6UY09UG4GpRbY=; b=crMc8DjEAyr6qLp7n/ZagT1LKa3EoT9uF60hbAxz
	PIQXQ8Yf/R9GS34mIsbENDxisrPcNXfC8Ben+LUca0uZgaz1GEy4E5yx56e3ql+r
	Z1S35xt4I0gn3GykQrQmqQIA8e1HQBNK3wLpXX/B0/zrvgxfzzkfy54aAArPAfRh
	GL1CP7YZFOV/ERMKkYfaU3vuGVPYbaxrO7Ziwx5dfK3F3zHwGZ4wuvS/VfJ3xn6T
	Ia80vRTJIkZ6I5pcm2JkJDxYItA0vNe11DCFEasUTu6M5gZTfFkeWF1vuyC32ewP
	7Sz481WZ5i8qpcCXxpKwTdxDmVDEzddpxrx2e02Xr9ATig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjuwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:27:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so11456147a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028826; x=1789633626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hwsbbABhCqD7YrBomZaCutoKKqKwzQ6UY09UG4GpRbY=;
        b=LBM4FuL9emErwmlgRE50fIRQnVjbl6sbFHAyRFQR7bQuIy0VPSty/C1ChwoNhIdWmL
         3Q2SOic7uE4dcyJ/VusPkg9em9oTv0U2VWJS0LSENUvgPDv3KF61sVk+OBfHU2BpLK4I
         RlklZD6MNHYlmLrcp3VST9a9wMYyF1OONf7pPs2Z8iKirhLeIKN+SFBaZYDscCFZ9wRs
         rhKEamh7V6cBM9p09/HieANQpWsJrDD46pI51tFfCRAFCwz6/P1b//J1/JduQ48CS4n5
         I/qfMJ4P31j8OVyNJU+h5gJSNpkJfVuSXDxj+oWLYNqi/v83RQl5qbNcc412X1istcXH
         Dvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028826; x=1789633626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwsbbABhCqD7YrBomZaCutoKKqKwzQ6UY09UG4GpRbY=;
        b=fomEi1vvkBx+4eMg6375WP8Hr27f65/v3DP2qweKW1OndPWGHH3VuRjhllckEOeekC
         1H5QbrU3Wef/NxnJIjggoSV9Dm1ImZuRjdP1LbyWtJk/BmoOVK6x9j2lVi53j3fw6vsI
         +RexY+bNZdJ5VplRaL9YaQ5Hstbl7WrIoS7/gNQS76ly33edMSWiMXQiMO2f3fq1ao9C
         kNd4tdYrbVhLJib+MmINZAwBIkhk5/HMufJKuh6ZD7UC67TOioh8ZLqoFA8kpNQK7dPo
         i9vSsIji+7DkYNCW1cOV7Ai1R3FVa4h5AoAnZK/n1X6pxGMwaBBaD/4Dyh4WiiQY7845
         a02w==
X-Forwarded-Encrypted: i=1; AKwUvBwrJRXt2UFh7RI/FXb2RFqkibZeHALXYh/tOK2InTLoqVJ6OhiP8gusEg6nN8P/F+kvYQH2BQMdGlBCmwHEDP1Q@lists.infradead.org
X-Gm-Message-State: AFuF++lBTPzLhUmS/GjdlY609qeVDtDVnVOXG+3gDj0GHSBaASkI9x4U
	ZaLcoZFZ7suHc3UKXsCVYT1z238NgSjz9tfEyUexmzCkV56VlmMnu//xrn8ppXXGf44O7MTZb+c
	DMvmctcxA8WXi/ku1dYe3v6vh8lUSvKYdaHgoZ2aFuoRwYMFt6qU95fLMOp1aCoWa566Mc8LWkw
	X5nA==
X-Gm-Gg: AYBFou3r1IV9TNSPgpk5gaVXNNt6mFmWEl17L9g84ZX16bDzaJuc2xcQXt3Icutz2si
	RJ14iymrrcVat1ccpZaqFf2FvbhV6ZJpTx8tE5bRiQXJfGNGAXzLLarWAg/qKfjmtOi8k2Ihmzz
	cqMfjd7LVjbrAjEnKm1xkS8GdlFctSEiwK8SjnX6TmWuYiPqda0nYDJD1jVfOVt/Tdh4edFC9z2
	qpoE2w7V0umFxZNsbHGdap7snNs6noBfJVyGX7ibi9KlhsTu91C4zdV0EZQTPLX8q/u5ELMunzK
	Ky5Uo8i5iX28zhT+Xe0oghH+AtdhMZMGtzo42i+Kb3isEreLxZgXSbheD166ekDnY/2vVXhWKuP
	GMh7TEsjo76ZbDrmSInKV52EVr3o=
X-Received: by 2002:a17:90b:1a86:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d709dfda5mr8554916a91.8.1789028825612;
        Thu, 10 Sep 2026 01:27:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1a86:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d709dfda5mr8554868a91.8.1789028825144;
        Thu, 10 Sep 2026 01:27:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm27957557c88.9.2026.09.10.01.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:27:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:56:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260910082657.4egpdfaaqm3jlroz@hu-mojha-hyd.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
 <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfXwMn/QMR4EGgG
 Gnpifp5DQez9XhlBBRLO+fTHpg5jFDACgWpE8C6ITpoxNuXi+Ko/P9iNWtzHPdZR3AQJENZFSCI
 MLlaVkvn/fE5yoHB/ml6cPViu2zwmmE=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa269df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=lubSgy31dtm7KxBdwZsA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: h0ollnAAmVDrIEkdx6kqeeqjU-jTF_A6
X-Proofpoint-ORIG-GUID: h0ollnAAmVDrIEkdx6kqeeqjU-jTF_A6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX1KNfPu3L5pbe
 iQjDKqS5pflLT/pJaxNT+L7YqfSckmxTgbQagZYLAwkZCFRBVODkH1pG0+6SqW09B974yXx5dq/
 zcv1G33I0yAafp5/EQXDUsE7z5QqeWLYAC7iYW9Xn5OP9lZiWNugUNrxRN1XWCwAok7jdYnZ3Dj
 oeN0urXGguBmFRx2Qm/hulu18n/xaNH8c2XRuxiHXSn5uFSdPj31Q23uWaPfqWLoSXXQm8I2VRF
 N6pObj9/6rZ+khM5WnOj6yr7s9XZSX1I1oUBHM6+TKF8hxM4WRou5DiAseRrJkHnUZUwd9LE0Be
 mH/4/DjNUBA63qFmWzPFzi0HW4XsThiqBqSjEV9bVFJBaDTAvA3RIb59GuMZTiyoRWuXIvNyMLw
 R78sLwCPmqBMcs29TCAW9p14IKVfBCErKdOUSnxUttMPHrTdmHAMzNGezz0OWb9PAjeGvtTs2eh
 8EQ+bbIyZS9rKpI/6wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_012712_127976_1D31CFAC 
X-CRM114-Status: GOOD (  17.63  )
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

On Wed, Sep 09, 2026 at 11:59:07AM +0530, Mukesh Ojha wrote:
> On Fri, May 15, 2026 at 02:11:05PM +0200, Krzysztof Kozlowski wrote:
> > Changes in v2:
> > - Patch #3: Switch to built-in for everything, with explanation in
> >   commit msg.
> > - Tags
> > - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> > 
> > Similarly to clocks and pinctrl, interconnects should not be a user
> > visible choice.
> 
> Is there a conclusion on this series? As I was depending on this series for
> Hawi interconnect config enablement.

I see this does not apply on linux-next.

@Krzysztof, would you be sending a revision of this ?

-Mukesh Ojha

