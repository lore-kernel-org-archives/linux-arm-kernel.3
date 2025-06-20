Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8E7C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 07:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=; b=hKhTKAll2cROpgsnoKiD4fcwlp
	h5zdBQc6b8h2zgYz5RFf28jUDbClE8DkvdxM+/TYvXVzLnCJcsez43eNMEfBCFQccgRkH6QYEMeMd
	U5ZiNIOQaqkKJxISfJpOAMqsyKSpmgUjweneTHf7dLJ6/BxOaVMQB5BcicsD/TbldIcYy+iWhA5nx
	weUL5orfO+99+gBWsv6OXMxWeLwzmg9FXLlwUWQsau8nwGRvim4Eg2P+kcShug749Nrl0lZef7RZt
	jmm4iPHjO4YEExNALkXTHQHfvbQl6FSD9PiIyiYggt2/xDbROeANQa+wSgUb0aeGJdcRNgc2Bfo+K
	Z/6lLAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVky-0000000EuY7-3yj5;
	Fri, 20 Jun 2025 07:01:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVeh-0000000Etuk-483N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 06:55:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4VRYK017883
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=; b=SeR6SXb1TsEqQHdC
	p4UluYnmYhsk4gwBJmQfy4n+8j4Cz+An4psweTNeUyZJjCsMFcolWfWiW+v6sFgV
	USDgaX5x7wWUCQnz05F8cgU2NwqCz1AhQTX6/arHEx4E9wVFYy5gwiuODz7I7+lz
	piH2xfuojK08ZNCR2N/pkz6AQ0zKJ8MUTNKfVMLSy6RuvNFZbkifc+SYUF9tzkqm
	r+6V+kioif4KO8eNavxIWQtehgMaePypIL4YyHQO8ce3XGB8PH1IlOi8wws1RdBc
	1injVwtI4E9WRE7s7Hm6MaEsO9g7Q+ckCZYVxs/YRLbUe9lmKZPXQ54XH4rjCIIX
	JoEHBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d0pcga9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:55:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234f1acc707so14820085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 23:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402507; x=1751007307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=;
        b=DAb9VpQv6+RXa4SeZh7a2gPloOWlNC7OoBV0msDhknlnyypDF6BLgTaBpI337nIVRx
         ikFN9RJA/hK+JFk5AlH+yUEC/rXSgMvvvaB1zmU51u432yzBTu+j35EZLSN2lJWV6Ot2
         Rl1d7hdSqqs9/xFhZ/WKZv4ae3yTyVgF2BHx0VcZOBFdyvwIgnDf2lGMvl81Ur8XnGHb
         AkQ6kyw0+NWBrM4cVQkVZvXpbx6bDLa1ei3feqodXRnHK6eEC3gWofxd0mQ8jE28XMkZ
         uJgm7GGY2M63tc0yah+cBNMqXnT3CGoNJWtSyi1LnNiqzM3XNNL3bfMlKXzK6IUC/YSR
         Z9uQ==
X-Gm-Message-State: AOJu0YwMeJ0PDot9LIhkQhlVj16KKSwHR6yli4O+1T70Ap3ZIu+m/wNZ
	kWHcGZYW7qiHRYFdXOQu/vBgfHteQQka+bPbJ5QnsHT1S5uRC1lX3h7O7bBbu/2zEcLKUATZiAW
	eYS1bS9V7M35nxieA797/SdJUSueZVhL2eARB64NYZ/5CYyzEJb70W/wSlcMzuWt6167fgBjVc/
	7bdA==
X-Gm-Gg: ASbGncvRn++rRsBUvyp0cAUWrSHigZkDZROpCSyQLSz9wP+ZovYp6lBP15zuXELacwO
	dHtewH8ZKMYp9kMtm5g6NB7tGqI8+7vIrusp0gdUV3i9h8rtfhvFuZ4yujiuN7MIUkLOA8xqIBL
	KEJAl9tZYC7Jcxtfdpv1ZNxs+CkApUNrPblq4RZbJI9MJJRTfDt0rznZz0wO3xpIgYkRlTxnWpr
	R6XdjMCGARxyb7TfbGBFgcNQTVkqMDbEUhdmEA+zfH7Pge5TMdduZrAGiqmwDZ+4r4rx1aUAhP/
	vy/kIiDUupKi/DmG4TJ4MyDbKHW07wRk
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id d9443c01a7336-237d9906e40mr27772685ad.17.1750402507471;
        Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ5LpDJJHEcZBAtNAGjCwyfD1eLqoPaVU68U54gQ31anHAn9sWvOPT8dxNj9uXQ8vEOHStmw==
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id d9443c01a7336-237d9906e40mr27772265ad.17.1750402507104;
        Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:55:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:29 +0530
Subject: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=857;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1oxyf68EFFylCmMjwV5jb0pfG0MEgVawKDcLqM/rxmo=;
 b=8PF3//AD3gGPG03AcLC4ONVS69EyuqXu0pNc26VvETNgzRpHlRintCMdeMBUfPaRptrZsJlyV
 vJLwgH/Zyh0BgDMciHJYI0hdt2oscEXRCGJBuuNwMM8XQ99xTylLnso
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: o88ZfsDo8SKXP_c8UCVyXMzmqN5z9fGt
X-Authority-Analysis: v=2.4 cv=YKyfyQGx c=1 sm=1 tr=0 ts=685505d7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=GAw9eemyJ_aXAIuB88AA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: o88ZfsDo8SKXP_c8UCVyXMzmqN5z9fGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfX4dEzrxVCMrb9
 EBDkzh/hWyoX2nYl9XIZDAisgmURrbV970H0ylCcEs+NB4nhBKuPp73pY0scwHas0LQwk7l2qc0
 Ywpd3Qvf+L3JZ30KRopyeFzLCSoILP/EbHZGMhLhna1YDHJorhLGHKzNdmnrTnXenOUbK/xeGJa
 9fDvV9rCp4c9BG2nIHBRiEQwvzEXPa+Th0WvUx/oYGUzADXk1HVPlwCKjE6iJ+R+Kws3gmZBhUE
 qHM2zCh7vE9cB6RdEe/UDxGEC9RxqyemLnbY9sO0J3xXaY0M4l0nUTdTtqvMiBb8HP/c1mcnN3q
 Kln9tGoF1SAmBTV/BO2pBO2RkAnZNkn/vKyoI1FHKyJNEzBRhAiObyl8FheGwlCzet+SOHhQIbw
 7QgHdZFz5EUc/T9nN+MKduo1E2rHVZx2Cj2wyrXSkZGqquKTKaHh25tbU6J/+g931jHI40yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=541 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_235520_018181_AE40E916 
X-CRM114-Status: GOOD (  11.93  )
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

In order to enable GPU support in X1P42100-CRD and other similar
laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
as a module.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1


