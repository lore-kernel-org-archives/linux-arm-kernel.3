Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E67AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 00:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=; b=iJmk4U9WQn4MOOraW2rJxiD8wx
	H19asNTtQBLGBG4CONk/zHTIjqLSmzLhZYsj2klyY3vzFDHvaWUNVQTTENDhdE3e1Rna/npCpvwma
	pLUbIGUkLYZyk3ZGRt3pqp4JVJYFxWrOVfiZufxIYUj8U1dzqFnBp3W/nTHBexSXPae+oPwkZf7bD
	8AqDumOqECPMNecq7s0tjOOZG2LqcnAQpdEWX1gbUhMw5zQLtkNp8LRKXmFeqzp+rQvbjf2ptvBF1
	anf5EOLLTmDJPOgYv+MZHUrSpRenGjzTRYH/VtcplQtaZcg3iQTSA7KUoVIHmaJH2VhsTZT2NZGYf
	6V/kSSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgu1L-0000000DqgZ-3cWe;
	Tue, 07 Jul 2026 00:50:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgu1J-0000000Dqfg-1bWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 00:50:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDuWt1566451
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 00:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbaBHhic6gIIK0cxoTZmQQiR
	L9kgLJaSC+bKDRff9ZM=; b=eJTRIo88ZURLWQ5Lyl9WzJI/vCIsL6m0r6me8kbU
	E6GGdQxMA9C2sXJtRQxlLfHdSaxhVMho6axkjBVn/D/ok6EG1VXKL2iuAtAk5hdT
	8rVUBU7dMOL7PMyJCqzDhdveUpN3UDz1Jx6fVCpQo4AK77kQy1vhNGPuUkhS6oxR
	c1ijkLM58/VN0muS1ZQhuxyqEXvwudTJ6PJB0y+xIRGzR9YzCVwyNlQcntYYXr0X
	An0I1a372TVuEtU/Gw87JbHDk/YN6Xx4iW+amI+o3Lzox1waLgHqJYMvF2P0ZTyQ
	wOQ+jJQdcf0xOVOA1PJBnEbT6MepevICsboXtqDd0oLIdw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7m42j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:50:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738105fa48fso157580137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 17:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783385440; x=1783990240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=iYuDLGeXpYhq8nqMPgSiQAa9wdZVC0to1gFH3wbd2sMt9ATMwV5IuoB+mJ3AVF0lEm
         vydPjM6BiZmELSyXPj/nlakxA8Ry2V3zhqP7gsuYS5O8XUtzOrcc3EbV718cNPB3xXlf
         zBB9WBWnmomlD9ON9+7tf9g9H5xF32d8W0S2xQGyYESO8Vu8oz6T+QNjzNzIkjZKjNIB
         YDJnxWxxEAowYLZQDyDFypxT6i6bsJRYpa4uQ8YZK+MxtUB5rectXnf3LieP/xNbVWuv
         OUiYh5h0AlULE5zemTTFmn1t1ih3HgCfnBwoQKl2CxzWfpu2H1LeZtA2IHGhJWw8RJoZ
         FNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385440; x=1783990240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=m4Ebc7bETWAsuEqGXfjVs8yplTjCYHop/aovaJxslD0vxJhabk+5HOjPyn94Cf++PZ
         UW/Q7QgugKfFXczwb6xhO7SmeHUcFHBP/bo8CEJ2IZioL+PNRRdYfbmalt0XOlea6y6d
         VA7gHFbsYxfQwgqywiMXNdRUmoEJdWc9BRMiVjd8E8ywcpB4ssgPsyC0g0vEYpp4CsW7
         TMqGMgusLoHfFRg3rzQZVVpsl/QjWKjdJLK0EM8tFP5q7apYcqwU9mN5evMFEGKjeITL
         Bfj23dPOrxvkKS9h0V2CIzp5BiqSuxJE0tZBrSaQ3UHs61znDlD8W0Q9ihJG/naNpGtv
         uUuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9GsyvjVWBof9BBrdpi50aQnm02V8vgtZ7qcVrxVU2xTyN+8pOXqaJwaemKxD/nhEjhe7dN0tZ7HrL31NmyGq4@lists.infradead.org
X-Gm-Message-State: AOJu0YxYuvHcnPrCRiXN6cagjNcLKwxXT3IyePNmVn0aes45F89PdPf9
	AdE6UpTPqyDGvBvIRJwF13esB0HZdfjpjlh6YCqIB8IY9HqNnxWgSYMc3cshmPMC0H5UBBgbIAF
	0vj5wGiwY3qD88cmfObLtSShjhQ5XaAKlYtZkLZ4glP7hbo3oSwk9E1GkCTrZ1GUHcwxZf02LYA
	txEQ==
X-Gm-Gg: AfdE7ckYrhykHgPRS7rrKrSWHqOv8pMNyiomxlkZRBQV/G8x8tDpJa4iD0qvNr4GSOw
	RNjioLU17DFzOEgoIGXc8tOaMGIPQGjZVAY/D/kISN71zrNlYu2Vrq2Qio+4Sh1FnkFFxBPAx50
	6XZu7L7gtO3L4hSqThW7sUP/lJ3sVcGgR+LR5RF8Tu4piKKCDqXsv6vW/mPmD3mePFjRo2GTOlo
	JuTaV15MdHAbe8TLDBob0Im2t6Syztr6g8oEynek7yD1NMiPwD5K8Xq4QZrfX0kws62Qxt6O1Zq
	vHXztRlYfHNiKOReLYefB7+dJ5mvY++bt5M28cgN2sgmPaQ1rnvfpzRAFFZAh3zJeAuEVbhplOv
	7YLa4TZ5/GviDp+nnqeAtDypysS9k+7DeApE48SXeji8KdDYaGUbrD024HKLgM26HCPvjVBaFF9
	0VNj04I+mbVQuMpuHaYJLWTN8N
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307054137.12.1783385439691;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307026137.12.1783385439176;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13770a1sm3261848e87.20.2026.07.06.17.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 17:50:36 -0700 (PDT)
Date: Tue, 7 Jul 2026 03:50:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Subject: Re: [PATCH 6/8] phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
Message-ID: <jnfko7lrdlda6qqc3453c4kjmmh62e5vd5pcj2icbnvu737wi5@qttiawd4vjrc>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfX9+vYrYyc2D/b
 q6BY3JKpTlgGEHksJdEzCwaRWdHUnnQi1K/NdjhMbwV2f4WEcIxQWLhtZI83RzfI4urEfGkxCzl
 hisUVcNpnSB5ixLDv7gfhZTaukiO0oOQB+nlAPxcQ5BCsFAzNCz92VlhovytTeuoqBmhm5kvntK
 mNyPqTFxO3YyESG9ZhRW3MbzIoj/nTPU0gsik5fxoLCJJ4205+MLcAO3MZPsHbmj5W9DgXKH+xs
 A4+yeBuioezVqdZDKS4ngaHzpq9Z25gPi4LmK8TB7lM1hax+iL/Hvb72cMrpMpJXZ2V+lI75t8H
 25eSyc/4Qo9hYkoy1E13hUopI6pmE3+/zqMFthuMlCSUsEwGjLxOE+KQeTYTzGa8gsWls5NrsGA
 ANTAbToqEmdjiI/hUDfcM3aPANJxrn1ck8fRTW5sd5V58lI6agx7JwaceYqcvc/Tq6GjQU38vUV
 eEyvUNhDhWgkVLZDecg==
X-Proofpoint-ORIG-GUID: ig4kWwm7hkhV2W575eZ0rHGIlDBZTkDl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfXwCUg/hyDZDE7
 vawQb3aNyMqE/ewUC5dfQ6cfhi59WblAVRzHml+o2punF2V36RZ9ufNr9SjO2QLR8wdiKYDw/BQ
 0nvGCoVkKMcpbTY0saxxk/1fWCopS3E=
X-Proofpoint-GUID: ig4kWwm7hkhV2W575eZ0rHGIlDBZTkDl
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c4d60 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0gM5omY_zckdEeGsnHYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_175041_565880_06AA229E 
X-CRM114-Status: GOOD (  17.38  )
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

On Mon, Jun 22, 2026 at 08:54:27PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> There are no downstream device trees that specify five values in the
> qcom,aux-cfg1-settings array.
> Plus, after cross referencing both downstream device trees and entries
> which refer this function, only 0x13 is specified.
> Since 0x13 is written at initialization time, drop this function as a
> whole, and remove now unused variable assignations.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
> 

Indeed, 10nm and 14nm PHYs used several AUX CFG1 values for calibration.
PHYs starting from 7nm don't use this calibration.

Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

