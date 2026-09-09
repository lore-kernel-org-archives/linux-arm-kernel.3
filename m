Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACBCC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuVzlSB31qLhxRy93vlak5xkhcEfOZHHWWOiuFWT7KI=; b=2m/shbE4giqxP0Xl3r1Xy/OJix
	d0/JxaOTrC+MgRC5v5EeTutv+8aOyjUY+RjSxVy4cIAwCL4S70pCK6r8r18q/ob/dSxowZwryGCYJ
	MYxPwRCJl1StTpZautdGKNkxWjuIX7iT5AZ/d0JvDV5ZNz37YY9iFsbPuIS1P46W8oOFJpxlgMtMu
	ErvsWAaICNUxPWWKktZux0MR+L2qsuIU1eGz/hEOfWBvyKqQVwTVvmcPAosYDRv3nP1ypDe3MerBP
	KM4nH/2ioC5ARlB0OI2L0O4I/e1SeR1ngtx0iJSyqKWfygCyLDQfbRnvqzpKBwvT62MjPxuYEMhsf
	r1u2X+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BoB-0000000AsTo-3ddg;
	Wed, 09 Sep 2026 06:29:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Bo6-0000000AsSo-2i8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 06:29:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896PpU6130682
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 06:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UuVzlSB31qLhxRy93vlak5xk
	hcEfOZHHWWOiuFWT7KI=; b=LNkndGI+F2sVu3y5Jk29Y6qr8RzZHDbUDldUWiet
	jDNwQBuB1w53SE5u7S6smxLJvGwsbmuQizXPBfXnrHsCJMLMzvmSs1Z8V5d+Ex2q
	QYYjDQps+IxT4+nUEawE6bDduSv+xQrhJF5ccgaQ84bjKaz786cGcUOYA8y1YED8
	InVhv7bYQnLFb4v36zcGVO9EOLrmPRUZ1z8XCGHuFrToVlGpcg4tpUnRhJA75NbV
	G4Tpge1Axdb1PhY5KFtXcJYoUi6Zbgw1uVVAdnxYAOj9yB8+lQiDzlJ/5SN0oqou
	8IOwNIEBYCNoYFRKYzTR2OlIEAiBOXaFQfyLtkEWEP+A6Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpk2pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:29:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8627258ef12so4065295b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935356; x=1789540156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuVzlSB31qLhxRy93vlak5xkhcEfOZHHWWOiuFWT7KI=;
        b=Q6DQcQpg2TkjysdXXF/sB/UYppnUNC73h8YhTCjRj5aOVnu6UDFVTYX7gQrw6GxPKK
         gby8jY/LAptVEK8XbK5vH/oW2J+3vy+eO7zE+or/zQVcmljyhyDy99AGEoI/JnGFWPin
         iSV9/EGNAUVsJSAWjyyeBfr8DJnXO9klaJDxJqyUOVSrw7moz4IBDb1zaglnAuDFSrD9
         zlFV8DbVOf7/+FpWP1rUWKU4NwIr+THgTSiuLxp0j8fm8d884BIa5MpQwUGzS0P2uL/c
         ddxWa8jbi/VxRZMehk0+3+3bmKz98LuBpHS+rRXWC/udje7fZuOGcnqlzC+jBNIybL6Y
         qK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935356; x=1789540156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuVzlSB31qLhxRy93vlak5xkhcEfOZHHWWOiuFWT7KI=;
        b=ifln/zxy0Vc18PRLMCqRa/sMi3d6xERUCKcBRXCaehQGOVwfU9byc+MeO2rGpKUmpB
         V8uNwe9KTD8ZzzEu3/UPbspzSOHOGBWBLdRzT0U5+4G/KSwjFBJMjcOL6wZwhiC3k9LV
         2CL2fYcQZ3MScIYIMeXdbrXd4F39WzFQLoYob1Duq3Ziz5WG4tj/BN9+iAEIN/TVzrxH
         BHMJnqZV8MX6X4DSY6Wfn8eh9/8Yi63yw+/AHNL+nO7bd4ER67b+MzwxF/FKxWGYrKq5
         dZV4djWQmyETBe02pR12fl6zXfqZEnqiZPw/Gw+9N8vL4qM2ju3hgZyrC6JPJ/Xgoo+8
         ROyg==
X-Forwarded-Encrypted: i=1; AKwUvBxuyUOx/Wk+WXXdj5fIuM41CQmeyqYzjulUBIXBFmUDbD0K2AGn9txZtmF/Bb2HJV7lBK0oR4vx2SLX3pzIFvdf@lists.infradead.org
X-Gm-Message-State: AFuF++myccuug/Jpol8pXFIMm3Epb6MuzBpBiZIGHKZlQ5M7BFkxNlFc
	H0hajnZ+1bHWHfLG8m4qil5Eip9q55rySFfwvegiZj8E4/JW6aGWMkLzQ4Jf9kBJz0Z2l6bzy+r
	ImFakxkU4nXunb6A0QsoQsEzveet+07PiNH7V5GBMWrj7RLM3E9ZxsR15KVw0BfSQKNLSCju2jG
	CXSQ==
X-Gm-Gg: AYBFou0VLVpZL2zb6sdhWJS9e3j7nrW9WCAa5KPDJuQ6ebz5OQn+KImCTBKomsrRh+x
	h+MW03c7QokfSm5vJsxJsaSqjdef3NFoONceOSZkVbhPKQt+dA/BxwTxjTOFlAKNYetNDjwGp9i
	fq6Z0q+VA8RoagCnvw6w6pd35s399R5RcjzNdgoq5TbiTRlsa3HUTU/MDwXxiMOTmhh45BtG5Xv
	jY4z0oTyT/yTR1/5e00E5puwONB1wRXnlalttuXU62ngZRMyM+tgZ3vLCcfk7JAYjkwKo9MIfPs
	mzcdskGI4z9Hpj15LTaViXepP5uG4K6l6HypNf8suYQRU83cBdb5hq21un1OMMVbGi/JS4HvKP6
	UhLvlyvSrgiIspLUmI0SvttYr94U=
X-Received: by 2002:a05:6a20:9630:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3da39ee18ecmr51556882637.9.1788935355838;
        Tue, 08 Sep 2026 23:29:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:9630:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3da39ee18ecmr51556828637.9.1788935355402;
        Tue, 08 Sep 2026 23:29:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm47823081eec.7.2026.09.08.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:29:14 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:59:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX/a/Eh4hjNqSW
 X6LUI5+UnyBbN8LdItMGG+6ojfIuIJpS3W3LnpS1U7dnhR8Unu06GOS9BdcExHHhU/4MuyIzrr1
 W1EuvcI+dVzTlJLv0RmZH70nsYPj82pwHFQVrQvnrsIpIKgkx2VkB1aY7//zkOWfw0NxH0CaY+r
 bccIUiJhS1N5wmUZZYSzpK8zbQLtDL5n+wTmrxHrAz62YtCpK6xIfZiLifN5hPH0uHZwR871z89
 UHuz4QJmpzoByXaFhaO/8/KQTp6Hn9eR1CF4TYIXnGBNIMx0VUsbcCwOq0ThXH7JwKY9XENjm0r
 F4yxc9sjUB+4H1USXg24JTrcjxkoGaBaWokpEm3GYZqsMOxHb91L6YvPmWHq3FdSLqM0pqUi0Ow
 PXqIc6WkHVxr/HLu1v1UG/jUMZinlFFY+AzKneAjq3x/xsrp5pA5EqBbzpij9CU5/zXByBx9eO9
 lkRwc+0qADrdOBGWAZg==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0fcbc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=K9csx1bNu7bmPCVkKm4A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: o9ZpemvMdAk7ywI-dzb4epvRXcfReVvu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX0sdS231pTUdi
 e6z5kA4bc+feWASXNrQfvUOco6+8zLLR424U1NK6lxyrBeu5Y/rrh33kd0ll3kGTaYGeC1xS+H6
 h/0BGkpVmme3HcmLw1A55di+iPtEnas=
X-Proofpoint-GUID: o9ZpemvMdAk7ywI-dzb4epvRXcfReVvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_232918_822261_BBA41350 
X-CRM114-Status: GOOD (  14.48  )
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

On Fri, May 15, 2026 at 02:11:05PM +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #3: Switch to built-in for everything, with explanation in
>   commit msg.
> - Tags
> - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> 
> Similarly to clocks and pinctrl, interconnects should not be a user
> visible choice.

Is there a conclusion on this series? As I was depending on this series for
Hawi interconnect config enablement.

-- 
-Mukesh Ojha

