Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60214103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=; b=z7Yk1IErtBLTVqh8i2Lr1/JQFH
	PbfXyekYz5Ejhbazs+k3t4ETG1Cn0c+ZzgW71AuNilKcSLC4FDMqTLvl98ZWvGZ5Ne6qTfmCS4WqO
	o/4mjC8ncRWCpEMzEOulhBIophKA2cHpPDfcvaZCckmHZYvcAlFkOctVu4tyhiEz/F8bffvSxH1Oc
	jWYyTL9inef4T9ms74k7wgiSf80e8sGWmwY5BKTPtpY3QuqWE2EuQeIHP+FhGgh/77t0SHC+ftB6B
	ggAqTPEsTYECdlKyysc69XcylNOuobxpZp2ctBmmtPVKeL0nGO/9Er1rz8rjC5FpwCXr8tH0aar04
	W9MmCNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oly-00000008Hbg-1Tj5;
	Wed, 18 Mar 2026 11:09:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olq-00000008HXc-1uE0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 11:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=; b=jhiPGR+lKMRrQk0PseaKjVZpFG
	CfmxT2IpKrjxEck/z+X/6nB4/ts8WyI3tTU/ueZeXyhTadLvCN4kNMFa8MmYXtCcGCq5JzR7keSUU
	kyyJuxrO4lebUCL6IvIDsph9acgvI17GHVeod7szUcsW6KJiOL213kxXdCV1Pi1kKY3VbWWEkvKNn
	TWrnPc7QSd612r8pjVsAae51F0PbHit2H7KyLN2am01Km1VU1iTXCyRDfhtUWWtj76gMu/k2AkgS/
	1S/166M083j/qW9IQgGOjo4yS7P7G2Z82Ut3Icz2A5ltdnJy0j6PBiJaITI8CAtrY9Zz66xvbrS1Y
	4p8zNTFg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oln-0000000B2OT-0miX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:09:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9DZ2I2730128
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=; b=TdW5sT7azmyOXmDa
	YF7IKYmMUXhW1FA/DfvlvKTEiYyKWmsmL7+EUHq2UZQY11wc0wYjwB7Jq8NSmA8y
	Q2eIuEtCbpAjWxMgdAmfO5B1YVbaJN8MB/TRujfEa1TLuvF5WrrTz0CO1zQYDb2Z
	747OGpGQkuBSFGTkWhO9t+DNnoRtOnCe6TPpgZBf6A2GOmY4+ELxOxxgOKR9iosL
	xBYfyWcch1uOykkY66OQFLPJe/i8dS4LpPlreMCQ12W3L1ccgWS9aJwMC+b5EmsP
	8mKuckiOj0reACKzC1hHcQKKJ05CGg4aVBnks4L0PwGaukV/8dpZ9w6mG0ktm5nn
	Y0uZ9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvhbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509007aea22so306946911cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832137; x=1774436937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
        b=X2WLXYcWRzQevP2INTgmq6Zn0m1EVhdAXitvE6uf4NyygxxTz6tSKLINLKK9htirnD
         5t1ZZVdnfyvn+RACBWazP0B57WgCkeUPR49nghHL8q4BsZjCHl8d6YzeypJSlOge8HME
         2z4h2wWAdvPjYJOCHxYgxeaWo60sq6/lWnNeo/R9UiMI9xkENc/iyV07OAWAVTBOG/Sg
         pa9mtQByNa3ISj9oKdMrQe9Z9PDMGAdSgsscCljGWVZ0h6gDKiAY2ok/el+bNUyDN3U+
         TdElMVKHo1YBA8wnlmlCPIeXsYFZdTEBtjZIV9DnXXPKmNbwbBnjQBuKZggyIiMVtCPG
         DH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832137; x=1774436937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
        b=nuhBdGYhMe/QCvmuVK/GM37MF4txbU/p2Z2pwmM2lJFW0IVQ/un/NoQ3Vg3pjaXjTH
         p1Ip5qlHPKS746DJZlH9OtQFT6yFWrnyVlVCPcVMCk4Ar9y1noEk5ocUYgqgsy+YJWji
         tKX8fq72BUSlo9aC/78prrbo+Kyo8LRVEsO9wU5jTN0S+7AiFxK0CrnHmtFbm0Oec3UI
         zj6yw1My/p9jyf6B7Q1q2jNOGjvMQ6sotU5nUh35c4uP+bYJ6wt2eEjxMAeul8pXaR/4
         zShIfEeJDqohUC3bvB8cHcB+MIGgy5OQz99SzMLXuvE8BeK8g27DAqNb3nhqLhiu6WBk
         PJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCULiEE9C4DrTULYMRODi4A7w/CdsQzPTNX4Gx/9LEVQJhi2QALewZ5bXwx3Ms8vWmOyNrzVyUE0IiONQlLMV1fr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9xLuZBMNWfOQYbjIyXSo1TlFTyRLNsXX9K1dvVvaLy+7ObQ89
	pkj6D+At/cYZDYMQS8yNap8OBP0s+NSthE9m8Fq2ZxfRpFiOvlPGKdbjf/jXjGipK8AcZtvbBhV
	r1zggZvPbWoku4fR+2j7M75mBT0mDKA5KWal7zpWO0P068hYYCqjsIc2zE+kfu4p0Iek3ihUVHS
	INcg==
X-Gm-Gg: ATEYQzyJN7EDWgdQr6YUPEpcY+v5Pa83ZDH7zONRoIVpTmijbGD0tb+rNXvrfzAfh93
	WavYmPhrx/XbHoR9RUVeOBb9NI4A70LgOFWhC5KZ9u1yyy8XezD3qdnbtWpUXQyp1MCdA1MHegq
	dfGpC1p6P/9ftHkBAJqRIhmBt4fX58UphhgwFkHLIlLw5pZYfhdR09KqVMAwyPkwUWXAhwfNhZY
	M3eFwcVUzgAViIMBF3K2WBPVTK6KZojdihz3QkLCCpKhiiPAIiW3TeKwhBcTwEg1OG0lqDw95k3
	P/Xw9uqhV+nEkZHhxEePBHuOQTkd8yOiScXvXcPvcS+nFWrQ9IyEuvrQq3A4LUwAp29PQtfjw6b
	E/GmBYjMYdzL7yq7ydChVc+cxaXR+UWu0bDMt8sHoATJ9
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id d75a77b69052e-50b1479780bmr35543891cf.19.1773832137231;
        Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id d75a77b69052e-50b1479780bmr35543471cf.19.1773832136760;
        Wed, 18 Mar 2026 04:08:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:43 +0100
Subject: [PATCH 4/5] clk: qcom: milos: Cleanup redundant header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-4-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1ljK/bO9o6mZ4HLRc+18Ogbkuf5uNqqxM034sgMWf2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe93mjmetZrRPgAsC5Qc+kQAHIvszCOM8P/L
 6mnrmwA8J2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvQAKCRDBN2bmhouD
 12fMD/9bLyR+bZvWFZSQ/S6LHSPwdk4KMMNlO1F1BzFb+oOME9LshAEoe/gSJ4B4XvSPdXpw3Uk
 oeEiaBPOmOTdkEWzIECpYhuqlLLOaMXqITAG82xydt10Xn+MXTjTZAHVHYy9V7EbE6D6FhYYDha
 hxCV8dGGd3PFoDoY4qZAAqSerC2OmXSQi6pqmaiIirIPLdRerTUUNkf/J11lUp5G/aQVdoNf4/I
 BEyKc2gP7d8Ga+zysmNcKbRNcvmirv+NS9brtDzv6zja5QGrF5PTNmzcjPc6UTOuJOPPiEuNboi
 lxmjQPQkECLjLyaxR5YNrOXzK6CAOTFBaO30OZc1nGVj7f4pGvb3jbGtgjej8pheq7SZzXiOJl6
 lwN3+61POKTFMqFcyu6JDUa5Tz2NEnuw2JsqwjRTqCh4bbXmhl9tT5V9gm0zklhqO7wAIpSYBS4
 9D6R9RG3lQzzhiT4ZyKobMQ++xFUalF6hkkXDyInCJJ7A/Uqu+KU36SDwk4XY0htlAX5E+4+RYe
 +BxGiO+mQl+M8eM+wcSMx2CXEoZj5XDiJm7Y6VXqXCrs1pdy24DO+pA4sXEF020o+YvLmIhqaWp
 xExTZWN5d8fkx7ouLveJpWU1nCA4z6ncvsMMloVwME+tUt947bVeYZsRif6mbniZer5qfN4Fuwq
 0DIUVdrEZ0Z2biQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX3ugcxkjV/Vyw
 mgmHONhSUfvsjh06NtIYTD7NTsLwukzL3UD5v0Fv9aPdQxbbAsEwgMXlagJcP6rgwKG3sa3meWQ
 7+CTXrPesnAKjwuvubhnELqtO5jP4H4fRABFMSXMPuwukFOlIzatMGkeU0OIvbSU+vDlAsjWTNw
 yCB0SyZakwTf0/Hf5t8PMqGRiTBhlmevzZhiGjloBwmktwT7PixhXfExrmSXzTsjec/6ed+qTY5
 7zg8xxKippz2Pd4/TXIk0lZGIOsOxwtIMbYURfiatDAIT96ypo5XVlVmuwJA5FbSsk2//mjqfcI
 72PQnlfr60IOdfExKpWn4h3uXQHLFOTKvWTAolFeZW1HnCC0pBp/IP/j6/EB7p6E+v9I9lBuU75
 UKSBtjLnK/9CfFHKzKMoFii19X5aXJq36fY+/XDxE7gAUjDRLpO2VlfgThgYema/QSWPtjanF/s
 pe31T6dekGVdIYb4hmw==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba87c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=7lwp6ARP5289FNF9c8EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: kekDinJ3gFwRHWuZyyOndk7vmkRlqofE
X-Proofpoint-GUID: kekDinJ3gFwRHWuZyyOndk7vmkRlqofE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_110859_554729_A34CE92E 
X-CRM114-Status: GOOD (  12.44  )
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

Remove unused header includes - drivers do not use any clk, OF or
PTR_ERR API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-milos.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 339cb1c63ba7..0a483fb6683a 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


