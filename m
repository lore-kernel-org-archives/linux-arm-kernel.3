Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD99CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=; b=iXCYRWqQHebGt6bD237Vm8iXFm
	hDOq7505WO9qKfNR5Vy2hoL/c7zinkBCHwO5xr6T65LVcnmpcj+VxK7i6uSuiA67WZCPhESGCeBvX
	+/oSi5yXvGgcz3hF0Gl8521D0d0a7IMU+yeHvA2ZmNDP0aZ1UMPTjHxMFQtJw8FzhSVZoTVQ/SIBZ
	BxiWQ33tBX1wxFNELSBcWCAkBXQEOI7VtMIrEGqKicIGukN2W/vSkDp7rKF3Jxxxe/D8/SgJHvW81
	gk5WfE4SgNPUtGR51DE/h1dm2hAPC9v2Za5jEQNspfzHMdwcEEo0Fwfuh+7YTdyRlt0kxFu3qzBUo
	SqBSeBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnzT-0000000DL6E-1Vez;
	Mon, 06 Jul 2026 18:24:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnzP-0000000DL49-1UFA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:24:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF9le900738
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CcQRmc9BaCEAXdMMGYGlgduG
	dM0vGlhEkoGbgTNTQWU=; b=lNUbb/Ge+fiE6E3fUcv7Jw/FULk4oxkk1wkh3+Y1
	x/hKGfAgM3xzauwD1uGAU/9DjVbFIiTfu3EWo3Be3AtHEolg/IHDqmaEgMs/uO8z
	iSre4KhCH2Qyid8gtY7vz03VaPnXx4bUE4D4R8O2eWwsCfYdKJsYdv9MlzgM/YH7
	2/hFtwwscC4i/YOY6YuG6SrFlgFKOCCKALBi8TJwWjw1ViYpsqUv8u6FI5evO14v
	THkT6gWhTBU/oSiLH63A2g7h27vvFgZgUavkK30JEPuyfzwGJGIQn5cFZnp45Gqo
	4WOZLDOfUc1Df9rZpa4NJReR7OULlo06wc2b1/IvFQs4xw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jy6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:24:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5be0693d194so1346247e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362258; x=1783967058; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=Rn6cCHXuvu87pmitRvKmNfLHcTWaJFsfxWiMMS7UcmlzPdaE4kBwvMT0RmqMP8evwK
         O6HnTTrCcZFf+IVp/Jm9Eiw/asOO8xv1POZSLiEAFxl9WEy7LMioMg0SGndh7yDJyLp/
         q8hvxJ5p2eby/rPVXBVIlaWmZMi565xA6yeh2Y01YuDiskB6HoPdgkfqCah2xdiNKQTy
         wxC8j5ug8l/5zLzgPtJaR9WxlF0Xuj0OSQU4LO8xM8MriCS+dAzmi3y3Uw4zRdBdPD8b
         FTT6YKXnd9eIqopP+zynocTyJmHixpS8ddF9Kpf6CVg8ERJTpKudwon9qS6uzFz6tUj4
         TTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362258; x=1783967058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=CxplY4rgcluYM8l7vX/NvI9szr5dEFSzI1eslMAsi/E5Y8olsAIaL+R2rEZ/vLWCos
         jxr3SgOrhEQq7x6ZkGHIJvIPongTceD08WJUktpi0K5bt4qYwqDZSvdAsfHUC4xbOJ+V
         pyEZM2ScENZIq4G5vH6L7Klg8xRt23/S3dA4kDb6l6PgCDpVgd82I5iQeAb9bqi8/XWk
         T87f0iGsTP4XrtRmTpWCRw0AZyVhAUC23MHuSAdzJ8J/62jbY3e/ZebN3o6ivRqujAPz
         s+J0ET7o/iG9jFYsQqUX55Qnf3qXm3NSfPRqm9DlyaQmAm2nR5ONC7qevPYnXQpj53DI
         F4Hw==
X-Forwarded-Encrypted: i=1; AHgh+RoSfIet44+ipe5js+PFLHtMM7k1mjN4jovoVIslE9gStIyFeKL2yvB+mSBq8f9z3uwbQX+CxoWwPm6JM9rMHn6j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw82hQgPKvW+UcPoHXMNwx+Xu11XvS6ebjGmlXVeeIxfGdhhB9x
	JWQOAgQPe22TeGmFE/PVuIehxjyR1gDxqaDGB/P0QRpP+1jBFPnvZJPEQqjIwP2oZe5grnsor2i
	JpH7shABGdEKC+j0DsoSXwTr/Sfy2+2cXPRIgZlPUK2j5QvNEsuNdXlDCESpNy776EcDUE1dd1I
	lVRw==
X-Gm-Gg: AfdE7ckRQlioIbICJVbXrabMuhTVY6hHeuVDDMYMqMU0HunmkrXcbVRc/Ho8VUjZpfe
	Gk6PnAshRyAs0mkkL9dvte00K614txF4zjLAN0AzXJBO8fR1rDPa7rpfXcKcaLVRvJFI/d8urIX
	SutiKA/gV0cwLNO2xrzR0/58RVO3bAvCIfe0ByxtNTvU3cmD+TCE1F7byl0ZNaGZ0qYupYDh2/x
	urKbQr6C7U3b7jWiPKL7y85hhhgf+/951heA1UrpPNEZbZ01oqaC8XjVGeIO6t8SwnpBwSgHghj
	Xsz8C/WTZfh0Bl0cZ2iUEjxqH7Q/zKqLCfEZPZXAscGAQX5p2boN50CRfYnehGhdS+H/2EvFPl9
	cTF/5FrDYn12qyQDhqOV/KdI2xUvQC37DxY7gIPctRleUEs71DejCkgND6DlvSZWIr7SXasB68j
	7q/4sCZm/0u/LrWKA6sRsRZyxL
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028205e0c.7.1783362257736;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028192e0c.7.1783362257235;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb768sm3082495e87.52.2026.07.06.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:24:14 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfXwQjA5rRsL0W/
 ebDu7vwdx6agAMHcVibxvqx4AXFn80Fbfp7zOpAyHgpjDwK4kmlKfrDmmggWuW6ijwoPu0Uk5DD
 cQH5aUz5QUtIv38SO5BhtYuSTe1F+EBZUIpGwJ5dDkEkBx3w6/iA8dxDP+t8ZdCGgxQXHtnKjI2
 hf8NbZxc+rq4rK/ME4rMO89l0g/mrJhI5hjt0XO3QosX29yv/6Fm64PanhPz+Iu9UIa4Ic3lqo4
 Wo9GupmGN7DOyEznUHa4UidBPJesnqLoOJEGvqbGvx244925WO2k3H64Fh0f6CDJSSTej1RoQ7z
 wScy+8UIfg0/29mCBJ3M8I8ajkpqRrRV11NlRjyPrIYLnl2Yw0gdXJTcl0hxgzyU/40MLqBLZYR
 9mk0O8Yddg6+8pc2KmCydmjKeyA3uod30JyNKsRy4YwoKmZczpKQp19yVMEO5VKl0xhcTiylI2+
 XCaPnPHyvkjeUlvgUfw==
X-Proofpoint-ORIG-GUID: FTBy4_TiXRPx2xBNWO7igeLyGH0bvb61
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX/rwI54KXL0AH
 8OpAMxABcX5nKWeagV8F06ekQu3A7/1NaUII5ky1Ycafj3tK2jOoSQX1IdFDUFGlDpp/5BQqS/E
 iaxBcc8eb8RGl3ar2MvPYQsQXWvJvRo=
X-Proofpoint-GUID: FTBy4_TiXRPx2xBNWO7igeLyGH0bvb61
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bf2d2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NjmyTZ_Ky2fEOGBI-xMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_112419_527096_0595B2B5 
X-CRM114-Status: GOOD (  19.28  )
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

On Wed, Jun 24, 2026 at 01:26:06PM +0000, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
> >> This is mentioned in the memory map description, but is not part
> >> of it.
> >>
> >> I booted up a 8450 HDK and it doesn't even have MTE, so it's
> >> probably valid
> > 
> > i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
> > trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

Please verify that you can actually access those areas (boot with
memtest=1)


-- 
With best wishes
Dmitry

