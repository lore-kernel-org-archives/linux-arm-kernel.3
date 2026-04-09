Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDADEA3C5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARYmkRPpKFMxzpNWiTfhAHXwTL85m+s74YxRm411o+E=; b=rI8aNfLmdKqLSDL5qWwjxIRqLa
	8erf8HnmpaepKt+hf4+1Hn9LAZwX48lJF8LJPIVIxvCog0ofPTqgI24rztSxzoo6xa+KLiIKudAMq
	2fqAm2GSSLzEOlAWUJ5DnEdrR+/Sbg+fxtSHPWHYjN2aPseAbOXQI5+3cgofQZb8WHZojxRUosOMn
	QH066S8R2HX171wAXIjHE0DUXnqw6zv7/lUAQvOt5lKTq74Qil4AsKbsHl5aKhCv5k8kQ0stIFd+I
	34AM4aR5VPF4rtfIqJbLfP0U90Dca+Oc0GC9/pwvprgMfTrMwdmMtIvXHXcvgJ4F9tClKXVUdqrld
	Ynx0k28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApq9-0000000AbYn-1jge;
	Thu, 09 Apr 2026 13:54:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAppl-0000000AbGO-3c97
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:54:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdLsG2812087
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 13:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ARYmkRPpKFMxzpNWiTfhAHXw
	TL85m+s74YxRm411o+E=; b=LeCjkdQFSY1SNeRMTUnMZDE0TIRyJTE+U4B4jhNy
	BMSDfqKyxelqxXjDWYGL344yhGx96le0BqUVUVyex6OCqvs2nCaVJ/X7oaSSvJCS
	r97lGvIZ0OaiO62hOkCJDPFG/0NYFjE4RHzpO2/RF0wRpiWw1i1XKqVYfraFTb0x
	VsAFJfbBQxJdG4hzz2ayrqD0si5wU8bNYX7gQRs1jOsyeUTFWY9cM4EbEmn7BuDW
	P9iumCIN5BFebWyYr7Y2bgbNBDcyD5cNd9TSfDzRd6xpNckomtIEcxOVpVAezsX/
	jB8cixACnUNtMuIbzSxOfnt4z4edigxusBGcieiarTYHpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h81q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 13:54:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso27730041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775742850; x=1776347650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARYmkRPpKFMxzpNWiTfhAHXwTL85m+s74YxRm411o+E=;
        b=CPZjB/xAIHP18IbvXaPwfWP6K+XOsWE0Masmp3rNdUuctpTKAW4kL/6m23sW8L5jnf
         fy3UqY4LSFoihgfePR5w+XR5cHnPeLHkTa/Rtfan/JRYlfJXEtjLWP1gqo8jOwDTXkci
         h1FRfdIjYVi/brzIGwnshF+tUbDXaBvHUbOSes1ZAjdfvPx1UOP5MCjhgnvEBwNEvUzr
         Y7f0+7jBjKyGsvxAMMzKUUd4K+lVLcdAojX8Nqv/Bvnp4RksCYwBjwI9mM9UXnpifR78
         0P5M8M7fg8Byz1KxNLBnEXiWvGFPERXRLu+9KfalY+8Rp7PidA+qAc6hvS1uuw+U4XHR
         2vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742850; x=1776347650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARYmkRPpKFMxzpNWiTfhAHXwTL85m+s74YxRm411o+E=;
        b=o2/B0fGtPr759lilHng5SCLriGjiUhU6Hzvpxcq7kZWJOvsnyNIwdiKZJ57Aj5Dt0B
         ia31ijS9+utIVzutWjFS9zwNxI8LOCJcw0T+UuqszO6+MLyn6qmGLPoqGk1ibDfUXLmT
         VyTyFhqJnhL40Pslr/ROCi13Y3xFbjb+I1/8+c+aR+zJfUZ5KQpvFLFRZSn0AYrLV78J
         ewP006caB0+PPNTGzSu8OXh8rUgNCm3ksVrMhOUlN7Xuu4Yi3D2gPop1RNnqVDM44JgQ
         /vGQ8Z9QxUe8z2xDi7pvvXUdnYUuaDasECU124cRHNCp/0JgkCvkYWUPJr9ZRCsUg1Xb
         KLlw==
X-Forwarded-Encrypted: i=1; AJvYcCXy6MuH3b9E/uwtoBLG8JafdfJT4tINbWqOpdfvpqfTR3Jl/TKOshxz2fa/q5Gu6ZroNkN5dGI8r6ksObsfk2uj@lists.infradead.org
X-Gm-Message-State: AOJu0YycC/y6kYN3RqIf/Z++QGHEJntuJVUNdowDDTfSssbM5ztAK5ID
	CWVDZ8beHNPy1KTlP2qFPInKPu+9UAxbtTDnaY93j7aul8xrw3/fnY47rYuuwMiyNCj0ZwGQkYg
	Th+sh9kLrUZauntqbykh3Wu4kVCS68E9mY6Hvf8vFBwr77YlzbXC1gcHHxQbb/Na09wgu9+WjuZ
	H+rg==
X-Gm-Gg: AeBDiev7TYB3BnqCqtWAYvtcelUlecn7kUtKVo2BYrWBde6gtMSs6akFvYxr4KVIocj
	ryFInZfaQsR/QqqvYkl4oZWgq9Rrnq+/lGMk5M8vlmBC2smKBwNKeq0n+guQGv1OhRIyEaMp5A3
	B8kMiga74waTPJwzIRYQzBh0pHysuYz8ot3kGcA0ATj/iUNESxEkRN0s4VqG4RLbEP+zVVjrJaj
	FYfPx6rNgCry0Y1UhCvAOONH1lzDb0K0lTuoMdhSV9iBVlhQrIUDoZyDb0mNENIYdT+CaQvjMWl
	uhDlFL0YruYqRKd1gO6KO08Qn0I0bx45FYYIBQ71GbUJI3DxyeomFanUMk3pdTaogqo87FeGWh0
	XNLxA/i4RlUPRaTBtZhSHUPAJv14UBlM=
X-Received: by 2002:ac8:5d8f:0:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50d80493031mr282329011cf.3.1775742850504;
        Thu, 09 Apr 2026 06:54:10 -0700 (PDT)
X-Received: by 2002:ac8:5d8f:0:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50d80493031mr282328401cf.3.1775742849909;
        Thu, 09 Apr 2026 06:54:09 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm71965374f8f.8.2026.04.09.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:54:08 -0700 (PDT)
Date: Thu, 9 Apr 2026 16:54:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        martijn.de.gouw@prodrive-technologies.com
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d7af83 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=926zIK9uAAAA:8 a=G5Tf7o8FmGmUZZTT9RsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=LlT7wNnaD8DP1V76ktP_:22
X-Proofpoint-GUID: FiXW3lsThpr9tZppJ4qZcS5zc7w9bqr7
X-Proofpoint-ORIG-GUID: FiXW3lsThpr9tZppJ4qZcS5zc7w9bqr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyNiBTYWx0ZWRfX80u+paRTVAbP
 g81yr3zZFbhYQTodCrFNbTwLhqplhfBy5EkkxwcThIHFtNze2UFf1pDoNtu9N6nJ/J8cDPiz7ZM
 oeKtnQ8IplAMDFe7jVPUal+LbEZrEuukb2V0aSag6P8SNBHtyriCubNbtVS3a8Hbr0Xsl3sYiFy
 RD/Qz+ouIGgp5DFSRtJkW2ngqBfDjX9wxa1LbdMq5Ee1djCwPzzt/N+Ef/8hSilnzCFHFKrDqnI
 pPlOJaBtQGbky+3BeIOCw/w2JX7t7kS2QovoqRUer62rno/4G0+NoEy2d2siIoJz6Y2vJYE2yXF
 9y3W9EUVGllWQ6wWIoZASvts+jOYUXxctRBwH9olyzppFvuQAn7zNjKku1oDcDudnCzjTA88NiA
 /mI5gWA1YXC2kPXQkz3DpQWuInyl3M2T5ezv96zi1dprS60oenAK8DJryiFPCBK0S7/FNESUHlk
 rgBqK67yREvyWRQh1+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_065413_988965_7D35D421 
X-CRM114-Status: GOOD (  16.44  )
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

On 26-04-08 12:13:13, Paul Geurts wrote:
> The i.MX8MM clock driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> 
> Explicitly initialize the clock driver in arch_initcall(), to make sure
> the clock driver is ready when the rest of the drivers are probed.
> 
> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>

Nack.

Nothing wrong with probe deferring. It is there to ensure the order
the drivers probe in is correct.

Plus, moving it to arch_initcall won't solve anything.

fw_devlink will not stop the driver from probing if there is no provider
that this driver is waiting for. And if there is a provider that is
needed by this clock controller, moving it to arch_initcall won't
magically skip waiting for the provider anyway.

