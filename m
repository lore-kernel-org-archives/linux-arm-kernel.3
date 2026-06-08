Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DA5CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8EnpuCzcUuvRBN9723uAbPSzr4hbEhiIjtXLvgbe0Y=; b=aPboEJDj2SdSGI5EsA1cuK+oma
	qgObiTWOhAnlcpmuovH1CCz5JwK50UvOp2qyhLzpMVBFoIpgGfHwiHu9HYiiKX1L2FJau6olMAuol
	D0IME9fmgsfUZMXewx5ZhHU9vvRPcnZL5KsESWQtlRIZnxSeqM3FKoG6JAzxNXhSwEsOw+xM8C0ys
	wVMO8NEAT6R475xy6WETFFo/oRsG1NeGtDIEwA0fiy5ynm3YEvsptM72BNhdHPiav42tD9XrGvz5h
	lqbJceaiUUTIfDwbaKdzG7qY2ZyfniTR0s85kHVYq1gpfWw9EDFv3LlIycrxv0jdpLr2CpOygkCYg
	MALI9rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbJn-00000003rvN-1VrY;
	Mon, 08 Jun 2026 14:51:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbJl-00000003ruM-2cDD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:51:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY2r63909744
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j8EnpuCzcUuvRBN9723uAbPS
	zr4hbEhiIjtXLvgbe0Y=; b=lOADQZXd/+BGi1qsjoi1RLvtcZfOEV8NeFRqV9T1
	uokej1B/s3PGI3pJNElvDNacgSVtBmBzgtGF8pticzbcr75c1/VSjN97Hn8dPtlL
	tJVC+atuqJPLXCXyR5eHedCfXdqC/V+Q7JGtbYZprcTFVr2k2/Rr9+VQzIc6B0pK
	9AeSLTF/2sQFZ5M8UA0caAW6O2ozyQEbMKYUU1kAYsqV1iDBMmPypNC2fkcr2SH/
	nJrUZdhK+KTOJdppu9QUyo8XWKWecZyVc0o6vhibWlI0nM2n+xm9AUESi0sUBue4
	/NmRyG9Z3znpVtPcHE26Td4sPwKMRPLLccewmrG4EVPHFw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0hjth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:51:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7c11611so1770408241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930267; x=1781535067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8EnpuCzcUuvRBN9723uAbPSzr4hbEhiIjtXLvgbe0Y=;
        b=b/P6LPYWlB05JpiR2tOYV7wD4/u0pMpVrD4hsiQgXRlSrmUAVcxu+PUgQ5zmfTB2qn
         KzmvFUVJWgc5lUsvDCmZOW3HdNYAGTveTVxA0M4WK45qZB++jmxZ9j4S4ObVWHclXxQs
         RexyGXMy8+h0d3x61ZDR+HSdW3tqTE9lOWFr6BDf6m2JivPlmW5Z1IYGFRDcnr0x7iFj
         4bOTTESJsRtOPUcwdSAbpDxkEcfSKSHnb3f+FPa1jyGns7l+laoqRoiUfsflE7E803Sq
         Hx1daqQ0fiW9OohPYmkWaJ6d2/T/vhb2yHdt4DPgxbybb9tT1KewEAvGng8E4hNX92Ba
         +q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930267; x=1781535067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8EnpuCzcUuvRBN9723uAbPSzr4hbEhiIjtXLvgbe0Y=;
        b=mfoIVVVG0Rh7Het+PoLpIx71o9qk2SLDYbWsfUC/OTb7GOfLWw4ilXsFW6Y6IPI1Bs
         XC7d9xCk66g92r1fRKCT4WPgsWSlzZUrD7kWGhTLwaC5grABtgScEyybwgZimCUZ2IKT
         LOlzFUdRcDhRAEzYBUhK0olLAbvwix3zt8Gwthpvrsdt6yZ6ONGIAcCNsQllFHungRZL
         x4fYr5redhmPeS6QR5xHr1+Q1vzxLYz9gCypejR82+xHbYL5mujPA0PYD6txtIFoakFK
         gApA85bAiMPeQZNjiAi9L7Uq8xejTeqG+ISNC6tIDgtKm9pgZwvIJ6VwzJ026SbOP586
         HzNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AM7S8j+r+wgpZONwVQRztzZ528rnJWtKpJMIo66NB/dotUC4IzvXocem7pFurtW8xH5YwHo0xr0iun1u/ro8u@lists.infradead.org
X-Gm-Message-State: AOJu0YzXCRskTaPMLSgraUNFhwIVOTGRoC0u1A3JINqXIwk2vq00Fmzt
	MRIxfvjmtfD3Ke9s1wiefISn2tg5lFDZLErEurFW7VPzzwwNltN0kvcYQ6sRLi6qq/FYD6k08Tt
	fx74qrYU82xTJZrH/vSgilUGoAiIy8nRSVo0PhgUe4wHHHTx3c/7onHanV/EixgOfWHQhTO5j5G
	gUQg==
X-Gm-Gg: Acq92OEBg1T6zz8xZFKhENmWl/k1S9d9O1gXvn4KW+wiv+IXSEu4JQWfU84BiNAjXn2
	GaDPsbhBa6rqwKoWJufL5MiO8usAk8UoF0ryxwmh8peAqiy23KuDHNwg4DXkKoxaFbPpSDZZeDV
	AYBnKNIiLMa9iv4zYv5wDVOdqsNEE/yE/Om26smgZ+e6mdodr/Ii2qrYlDcI2fyUeUjvDuJi4Lj
	0cy37vq0L3ZDttLGU3GcZWSxHR/YYG9BZk9yy+/4MnJOoVzcthg8I0hbLt5+gVidFQxht53Axui
	HvNw8D5Spx2y7b1pGe5NZiEakpoT/l/lXl4PrPNcU5RYRgA1dbz2O7BJWPsWeLJcOBhL3tu77pn
	FaYA2cxkgGXzSBm3Aaz3b5QpD9qwPn3sT6TBxIWEqS51iOYtn9uNfXg==
X-Received: by 2002:a05:6122:3d49:b0:588:33d2:9249 with SMTP id 71dfb90a1353d-5ac4fc3c59bmr7051103e0c.8.1780930267173;
        Mon, 08 Jun 2026 07:51:07 -0700 (PDT)
X-Received: by 2002:a05:6122:3d49:b0:588:33d2:9249 with SMTP id 71dfb90a1353d-5ac4fc3c59bmr7051053e0c.8.1780930266712;
        Mon, 08 Jun 2026 07:51:06 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:2c9a:9b81:ddb8:1d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm385684105e9.13.2026.06.08.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:51:06 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:51:03 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com, sudeep.holla@arm.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <aibW10NMmzw3QnZ5@mai.linaro.org>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203100154.140877-2-cristian.marussi@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MSBTYWx0ZWRfX06YL0WTDEJ81
 UbXVZGz+iaXtqUNT3AeLviTqZnv5S46j0xH/ZZHkM14+/TFpk9tPGG6Nl3s1eQNfwKcfkH7oVpj
 afGZH6LYK72Xl6EUT5rSvV1vfTYM7U+hp7ZV4n9jTOcqC50kTXs+j+lhsRwJCCBHNaRnENw98Br
 hos/JARDFMl9MkAf0A4O4s307JIxSTdehUNpB2VKfe0uZQCiN5LlB5QWTFZrGrnE+qr1kVIrF5U
 hgQgnaHCQcEum9eLz/Cx9qMuQSoCq8/0DrNkCk7dxX2jGCrMQP9+p0S0ED70R9+wD7rpVFvmcdD
 AbPBs9DcLOulor0k4lBgnSzOlNZjlnrlyGdzIHKMTmNwGnZ2mW70bdGXSjaAZDDvcCk4NiluR8W
 99qw/wL3ZPYJmLC3nHuKXyFTHgzFW2m5g60OTIngrcRJvMt6lDbt1Qg1Z/+r2OZxJGSgg9CUdlm
 XE4UOtwXluDghO7zYAw==
X-Proofpoint-ORIG-GUID: B1Y10hotptZTnJkVVK8fLj42uYD5aV0k
X-Proofpoint-GUID: B1Y10hotptZTnJkVVK8fLj42uYD5aV0k
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26d6db cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8
 a=RjQnVeMJaLWvdfoecCEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_075109_777984_77629036 
X-CRM114-Status: GOOD (  14.05  )
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

On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
> Emit proper MODALIAS uevents when SCMI devices are created and make sure
> all the standard protocol devices are requested when the bus is
> initialized.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

Hi Cristian,

what is the status of this patch ?

