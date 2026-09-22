Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6988CC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMbJHWaOZ8N0DGS4btDo8Qd33M/+POi18Q0KPwlERwk=; b=tGsy32DO3CHo3WvAecJ+OvTEPN
	fjMH63aeTh6WcgewftPWGO/AOamBd4F8guC9yAFFAdWOfXINrfUFcSCLsk55UhQKUfk0W5KPba8vw
	o7yrCFY7A7eHPyGwxOgb87YppkFmYxLq8oMYsDegtnqDULGQeOreRozqgZ6eFmkHvTrgPKpuoxiCx
	+88PBHKQwhayTFN2ZhS0YnVPGvKCOe5IbbIEyFZAQx8v5Qjf7zvZjrZnwuCpvn9qkipnSeHZmPnSp
	O5prVwySvoYd1Lpcv7EAGISai3s/m4u4YADkYUQWt96/vuLPGEyndR4OauT+NCtR6vDb3WdecoN+c
	VeTw/x+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tqS-00000004KRf-0ONM;
	Tue, 22 Sep 2026 06:19:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tqO-00000004KQk-34mW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 06:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OMbJHWaOZ8N0DGS4btDo8Qd33M/+POi18Q0KPwlERwk=; b=clR/4GjF0/G/9w+uJVVAxv40Hi
	JpqJl99vp34VX6ROJOB+wmYK9yJ9uMSRrznX1x8NfRMdvEQsIAqS+SR89CsvU/tPqSnZXhOkr8qU3
	S/r2IbAMQ9iUZMVDU/CAJLEouXAaXXepbkGPqOvf3DILIfEK0EBb49sRq0HlyIC87l5x1yVAHz/O+
	qQu9mWQqDjrGUu4s1U6Z9N/0KSscjag/05zJjShJcPjq8g1QUe9ZpXbb3YadN5BOchgISwuQm5PU0
	SRMBx9INDxJfWYrl3gWzJpO1g9/tbSOO8aUNLK8h6ylfCvZ5n6yJFTdd1pcV/z7k4w7Ul/YPiQqEm
	QeUq0Qcg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8tq1-0000000D9W3-3OmD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:19:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Jf72578883
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OMbJHWaOZ8N0DGS4btDo8Qd3
	3M/+POi18Q0KPwlERwk=; b=YINz0niC/fjn/a8BnR3sreQWry/Yl+RnOtpPNcSA
	BhdSRN3oWOrqFnkjgFugKU5RTxUPvOPTMN/ahBo3hC4tfJsJMvmS9ssO/8UqjXpI
	PRfjxqpyAk43Bs9LASJsH1ZxEnlXgZ8IefLsfeNT0VhZ0P2rJR1I3garLNffYSl5
	S35+JtpksHu1E6v3HI7DrzwTb8d5TEwwIFSCULrlkaGle4ALcO0mAgJdU8T1SGTG
	PfO+c9Srmv3JfEnfSV45weS+pPgIVtprQIDxyiYWOnbAN+Dpq9MtA7hfO2ZQCI9U
	SdYd6h3+i4vMWY/M0DR1WE4GId8t4idGh10mj1V2SeNiHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub329ws2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:18:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso6539044a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 23:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057922; x=1790662722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OMbJHWaOZ8N0DGS4btDo8Qd33M/+POi18Q0KPwlERwk=;
        b=gVB1z4eTMC69ZLDDgD9tRf9WnPcPob0iefgg02rgGLOl/+CYQE9t5tZDgMhqCbL4Gh
         2EuOfPo3c3adO0zKL23dsaxwSdFHwMK8EsnlxFwkuqYPw+H8EbAIWzbZxl02lYIqJmIK
         lyP0PQgomarwHL/y2lEEAbPbXjFSbbo4mK11vuMAKAeuT1cBD9QAioYmtL3sn1cQl896
         M4x8O1Px4KzkaNYE/l0u0QNe2yizcSq30QsHOvs0wR+h85Lq/rEBYCub2WH8GMQNh1Q3
         tZqdpYvvZxm55jAS6Vh5C5HKy2ENbLcxLfy4+EnY0r8O6jEN1nKcxfz8jqRA8kZHgJBG
         +Shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057922; x=1790662722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMbJHWaOZ8N0DGS4btDo8Qd33M/+POi18Q0KPwlERwk=;
        b=NWNfLdSl+LghJbtE1btyRt2koHR02Vk5FtZyGuFpzPiHzo4EOExQKmlIw6sEc5e1Rt
         /HE68lTz3nTJrqJmWSyc4wueE/kcwkuunBlNiVQkxo6xam3rukF8V96pijYwGPoH5vfg
         UqDhDwqdKJkd+UxZV3PEegTadKLS9mwpXxFr+34ZVzGmkFE0lwmdKGx8FodA3B7imR84
         Os3hwxiPbwq7447SrQeWtHDLSJ4BkYenYoMospqhX6cjFiwmZZn/OJkeQS4jPQ4ov8HE
         Kk/OkdQsuRKW3jFsE2GmtoJZRq9bjPeEYlC2o25T4/x+linzuuVcIu2YDCy/b3233eKw
         gRaQ==
X-Forwarded-Encrypted: i=1; AKwUvBywLpymisinw0rzfHvwbzbwAOJTGzNOV3fJmDFjUz4trteoeWoNTt0c97PCgD688sJJq2HxL3DmPlfWxOJ29L0u@lists.infradead.org
X-Gm-Message-State: AFuF++ngO9WnCGyb8ECyalQ3sN9Ma5vwDDP1J7lINe4iTrV/HtLQiS0S
	f8SdMTlEDA1qJWDIKjfxPYQpCrIibnRmVh9Pss3Vz8jE8PcAw9A4DMG7tDA3aaSrMt2WxhOE6FE
	bE/f40N+d1ho4v1qbSHST/7DrxMm+940pBSn5GHDzbS65+QOBzAt2DH7PJ/kWFqK/i7wthJ3W6X
	Ujpw==
X-Gm-Gg: AYBFou18t8RyouN2CJTEXcMZvRRxbKbqnyZyf0KTlHs3iC1lBzNVXFhrjB7sBUYopMj
	Z7JYhc1fBVnr20YHdoWNW8aXSuyV+p9IZE3Vdf+83K3HkMxmk5/qrYBOQ6qGabO0nQWd1hEgnHF
	H3na3PZtuotUZp4b3Hsmo9UYWBE4Q03JHnIjJ2kmx/n01OCCmWerpy2InZ6wCMG3mm8opgqm4VE
	P3Kfz+XUMf1EFePZHa7v5yGB880fxYInyAb+NUxWGmnOS0YujbtBE/35wl5mKA23W7ZoULwywZt
	ANmwtJdZZXUSRZNCB8unmoxzSC0WTAdoQrzdGWDSwn2gAUCrgd5Ydn3gsugKZ0dvDr9j8Srz46U
	o7Vv6/1Wl8uql1eEC5VxlbGDIMYEjTpxPxe8=
X-Received: by 2002:a17:90a:c2cc:b0:39e:6a7f:eeed with SMTP id 98e67ed59e1d1-3a0731ee972mr133597a91.18.1790057922052;
        Mon, 21 Sep 2026 23:18:42 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cc:b0:39e:6a7f:eeed with SMTP id 98e67ed59e1d1-3a0731ee972mr133570a91.18.1790057921573;
        Mon, 21 Sep 2026 23:18:41 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29dc903sm2383833c88.3.2026.09.21.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:18:41 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:48:34 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <arIduhGIo8OlOVI9@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <c2f3ae91-4f0f-40ad-b03a-6d6340ec6244@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2f3ae91-4f0f-40ad-b03a-6d6340ec6244@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab21dc3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sxflmpJIHql8OXV1FfcA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: n8oO6DEBMLGLQpYFkeC8ztkld6GRXVDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXxJUhU2RR+z37
 LbUasKLC1OdSLce16FcryE6+XCd8kZfG+YL0L4SplbEPGLfUbM/n3IjmmIRuMd0LV33lQRFakXX
 m5CgaH/PoMe2ghU1f03cnIk0ERU0cyGnBQZPnkbYeZfZmc52d8Fsr1x37ceVpJZM5mcSUhEh7uh
 WvkoVT36e6/45SA2BLe8muY9ZbHd+5ArdMZctOANW8Uc4CKWGe7Dux4azzCxfK+P0SbkybfnfmM
 qejSZS0KiLjQpxVgr6NNNzGmxB8gZe0PnBEt3wFTRKuQg9hgdHIm+/mgQnogUH+VTLWEd0zK+85
 J5xqN8daaapHnRtWAe22byanBYr5UBWjmQKIsWlGnTnwCghTOAbzYErz0pbCBWc9HpEn9lMcfak
 ol8wAUy1YbEoJzqLaRAEwdnTfHzoeAPQLqTFpAfT7agwsdWdV/pdNOoBK/M/Bo2ZWUxA9EG9dRj
 w6+iYZ7r31VZVdfC8rQ==
X-Proofpoint-GUID: n8oO6DEBMLGLQpYFkeC8ztkld6GRXVDt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX3MPqsvzafxA+
 mSjII1YvWo3YHMDf8lEEA2iVu8H+cTVlE2m1uOgFpaqPZ8tdrFoSdpdYc881HIOklS0fBgT3gJj
 VNLJL01ugKEiWNYgQ882cGKrGBKNjOY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_071859_875189_08FEBAA3 
X-CRM114-Status: GOOD (  16.52  )
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

On Wed, Sep 09, 2026 at 04:50:40PM +0200, Konrad Dybcio wrote:
> On 9/7/26 8:33 AM, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&i2c8 {
> > +	qcom,load-firmware;
> > +	qcom,xfer-mode = <1>;
> 
> This property is undocumented and unconsumed
> 
> Konrad

We will remove this in next revision.

