Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF48B10FC456
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 23:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=; b=L/2aEQV23PKg+ytwQQKYo8oqdA
	4g2PojHsQO3aa2HV5CDygHzNYuCapEn3EilsrNm08Ihi8cQItqC/ghac8k1U+1/CtqTCnGxaTX4eW
	9xozC+H7MlbxI7sxDZ7huK7MREabkWpdoEVaxKuif0TBRfOBfRf19auPFbcQtkcHWz5jegPOyKTYb
	28mAQ63RgNvUxAq75hKkhGJ59lOOy/hxfk5Jv0yaUglzOjCHtvJhx/dGwcVGVFH9xv4YA1HOaxfi5
	N1742pkzas2X+4oISV1GL0A5cOitF/2KsZRyVVLN5cMC5JCS6vdMwJIV0OMK/N6/b2mMejk3CFSnC
	9eEt8PKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAclW-00000009Wwq-1OIb;
	Wed, 08 Apr 2026 23:56:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAclT-00000009WwV-1dWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 23:56:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638Jeait1727413
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Apr 2026 23:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qmJZs1lr4C0E/fyx8Dm8giF+
	ilmdDMzXxhoS6JFYuJg=; b=T5Znmiow8aV0pLtFY3M04bO3SGd752eNVXvZpbvT
	WxNPIFVr0nzhrI2htN6XTj4qQ7LpxHVZ+hf6fexlGVBQQcS6xi5p/6z7PN0a4J3G
	VqKM7D9WNdhUQPmEU9bqj7YuiVSEH6zO4XzpPU9MTyXdHk+hHFuJWjf3m1TEHi2t
	SUXxRsOiX7FI0qmZKQMiq6w/Eb8BvOd2Th0ZoNNhaBLzSHuTorRMeHsTZeMPEu42
	YBWP2rN2SPInSEXShSDWskOk91zEfAqfLQXJKatg7PqMvnF77He9wtFalEbqaOG3
	9sV2Fl18Q3YeTLj0qJq2U3NoxnKutRb+kIFHxkLBnUD/IA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrrtqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 23:56:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso3874561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 16:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775692612; x=1776297412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
        b=U40e+dyWB512yb2UJArMYAm+eIyfvRgCuhCd0vJa+g4HF3Mph6baDMFpuI6Y2Ue2Xq
         u9ixMqy2MBSID7V1RLkKULo/ejBx3LElYArAKTRvyDG9x8LzRZBvse3F295wp37ocdrM
         L/eRZOEILCc9VSjcFr09Y1OdL7hRQuykgzm9Vq+008f5wRipJm27o1OLF+ZmFBDrSIE9
         TVX3oxE71kgTtzKqfwZkmFQMHkPxADhNfMPRv/IHA8UjiX7kHnQXcag2ioQ9iKV6fmE8
         9EvemtHoyW+vjQJzCVMd4C+JCpGe+KRMGxPlhnZb8RBERUvd8YHLcb/EDRu9BRf6AF+8
         HKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775692612; x=1776297412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
        b=axPibWKpACfrT06OCN2jUu1qpzG8dTGWrLzKknLjgyy2Xb7TMO47Jo3QM60tpSXyjl
         dKbIS4J+ijU4D6+JSRJzrL8aee+iD+HGOhN37QocQ1KwlnfdA/9YnU64iVBlmXXElY9N
         H9kNrul7DUAW96PPFTEBjOBxrhk9vpeo9LkQ/xDLVr+TU8CsZ3HhAMFltp9zVoMXv2LZ
         M2ti/E0SvcfYswtY7VwOX9QqbIJL8H/ELGA/wzUTSlFDBLQAtdIhtAtUFvY+mS+O7sVa
         Q1QX+H46rWJPS1BTk7l2ky9Z7pQDaamUjdKOpC8JU+T7MqkVkAYlacAiQXz5TY7qGu0E
         hdsw==
X-Forwarded-Encrypted: i=1; AJvYcCV//pjvhJrW+Y8zAN9p0YnIqZl9aYwWGTNZN6JO9QpNfJASKcbxRM5+DBvfdF4BaJBI0Rh08ARYIapsQL6lDp3N@lists.infradead.org
X-Gm-Message-State: AOJu0YwACFkvyULim5SYSVZFjK4Hun06Cp+6SQPVc7CJJxpCt7O2ubwz
	CSuQC1RVz+vr4Q7aTJSnFqjeAuu/4hVwu6bfvOKy2CRDe0F1QSRn4W1i1kapBcLrrvwRt4yCVb0
	IRwOWDevOvytgsJj23uj1VDFcgzc/wtFsniQbjnqAXJYSt30NAvT8vISMUaKg62TN1gPZ5Jqcy4
	4X+BznOwFL8Q==
X-Gm-Gg: AeBDiesxT1Kflis9AE8H2WBNqHFdRheDCIs/7pomKDJdkGuA4i7SCIZwLKtgwl3RxYc
	P6cM2bIBtllZ5QGvkj9aJk1t87kCyXByehuAUrYNf7Tx5VevSrZisagsGWPGN+r/cWXCVwiN7Zc
	EZeKnRWtgirkGlqww6Z5T4PpwDBKG6F2kgKvao+acvWcXv1JpS89ZYo+UeEIyyQnuvG0m2SZzHs
	+Eo6qAcr3vJ2q9WKc8LuY1baygya6Kp4wUqOQWKxkYSWSqo+yw6YuJ4XSwZmAEelqbS+kPMSMGr
	si6HaYFgoiULgEt5O15OULCJw/iVulN7UJThX7RMKcuUT9mqICg05Yc7nlVzNSL+XRX3uCoFU5W
	PlrxIFATiimkgAr7m5fkL2gtTqbNykwyF21F0QMvZJjUjTJ4Q/TbbvvgxGhnPbk2Aja0pdKKtiE
	cEZb9Q+wvYj66AYq+IkzLgRctYUAsFvvBzULM=
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id d75a77b69052e-50d80ee3b4bmr270166151cf.17.1775692612258;
        Wed, 08 Apr 2026 16:56:52 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id d75a77b69052e-50d80ee3b4bmr270165691cf.17.1775692611794;
        Wed, 08 Apr 2026 16:56:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9517bsm4981220e87.15.2026.04.08.16.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 16:56:49 -0700 (PDT)
Date: Thu, 9 Apr 2026 02:56:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Message-ID: <fkov4nsg2ezs3t354t6llprxymx5jolqce3wxewqwzre7gn26t@lu5xtuliqq4b>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIyMCBTYWx0ZWRfX2+JxE66bTzsf
 qBkbmJT2u7NYcanWn3gYjI+RSekklk0geCjHlUqBgtEFDXQHmrpjTAjxcocjdR+D9EC3MsZaI7b
 fs3Hr+zPePlAPaclmiTLxdacHwG1JnArqOi2jlkkMp5UbF1D6erk/MSCix8nnth/sfth+f0w2pW
 R/quvj4qZTHoJufVpGfpYrMo8/GeaNTqrW72ljQoXh/fyUJUj2tjG9fNZGWn9jArSxiVDZWApqn
 4QCaDeNb46bgAmBaVhmOyJe7FqBXVpEj8Y96BIBJpKud0fr3xxH+LdABMXNNjmWxkFgFpizavhQ
 xF/+TDnBhgQRpgB7hfiP3IhoU9DEE0lHdqUDcQvLK4IdxP2+uGZGtXiJSB60/ZyRTen0AoDmRUV
 mHnvKJ6wtx6A6A0P3aoQo3ZPpu0fLhhQO6MV4MBiOIeFcLw2/KLjNgJlN9yprnLxHKLjbrBg3Ux
 T+8oIi12iMiQZoey/TA==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d6eb45 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=B6YNfTnrzVbQWA5GCYUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: a9mZhRm8UH1LH4vkzcMdyXks4qbAXOEy
X-Proofpoint-ORIG-GUID: a9mZhRm8UH1LH4vkzcMdyXks4qbAXOEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_165655_584139_1824AC1D 
X-CRM114-Status: GOOD (  14.87  )
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

On Thu, Apr 09, 2026 at 12:15:54AM +0200, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

