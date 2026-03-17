Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F63FED9E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=; b=FcFTNb92Eq8BcWcixxRffcnKJN
	RNE5rdkS4UHurlH8ufHC1VPaBhXJ+BdYEBmq/3hSm5hdI6fR3gOI2l0suzYZ+jNWBYfemAFvFSHZQ
	7udtQCfJkVjN1gL5m0AEesMgCb3NzE7K57pdz2g16jQERW3h3qT2w7ML551ysMUNaRnvOhIKABXXU
	itytJICZRf76ltKHXcNU99xqUieMn4WksSzsj1Yg07IS4DtBmYbv3RRrPAX8xGUoR2kuqejWlvjo1
	cbx4uJt07XLGVsrwd56Fq+1cchEQCnSmSQWcUGB9zB0a88yMmLc4ansLwGXNp1brdmhY50P2HbZyW
	bTomJz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0w-00000006uOC-0hm1;
	Tue, 17 Mar 2026 17:15:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0r-00000006uHk-17E7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:15:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HAjvqe254219
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=; b=TSMFtdtBFWgzeSKS
	1cKS8GEVIQyDG1o5fFU5aWplzQq/1dbs9Q1jHGILgAcVLV9qrGnzXB8zX/aBrXQF
	sP4Gycyznoy/tGiF4Y1PbE/FuOm7dhd7RMuL2kIaj/AvQMFbnU5J4skS+rJ4oNYj
	z38u6Es5pGOp+X6gdjCFejGhP53adF8pIZygfu9g2S5E6TQVwb9Bb77ThqJC0KnW
	azDUDJtoD57gGKryigqdw8TiTv5Wb/F/WFQbXd/ZIHnPs/5j4M53tQXcXN4+pBki
	JONdSTw/7Ae6S7WM6JT5mdjgH1tUs3UsTL/J7oZBvk9l356bEj8Y+Ykx8muNvRWy
	3oVHqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8hf7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:15:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a0998a441so36966077a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767724; x=1774372524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=;
        b=LXE1BHjPFbwkS47MPFJpcIdwW2xVIm7PiTQaOrEu/5pMmzrmCBXYbbQz6XpI8Q5gqf
         dT54VrG5tBoqIyM5UFBF7uFbms8y8ioknsz7kG+UhxG1OyGkCLwtCUYokGz7rb7csrtH
         v0GMhb89FGLpDSxHogqyyUEa0yuRqRFxFheCxeYJJ3MqnfPYyXbDEZWMiNKCgrNS/En4
         gP8+/xK7jcykxskCcHSeUXqSf0wmMlntAqEvMCj5Xi39hSO1eu0skseAqWEEz2Hmr+vm
         KuV5KFeVyAbZeDfRUZUh7Wl5ZMVaiTM8ZX6NwnxcEm46uIYKjTi4OeGO4R89c+1If2Dw
         bvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767724; x=1774372524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=;
        b=aEBSxm0I1vT+K5YqgVgAZarKBTFEBk2RFuN3Bq2Z8rsRocpNWg/kShHTMx8LfyrZ0P
         /b1oh4z8PYYK+1HsZCfCKv2qKYynrEKsodfMyoIjJ8w98gDThXcvtPg+9I9NlE9ErSnh
         hceLIpZgOiZC7DFiSTE19XpI9tihIpC1E7oexb1qBLbinVLAhyx3TqikhJHHyou4n3Lq
         ZwcydvBQO/GBf2WzpjyY9ceBUjws3sfHZTIA5oZcXEXCGj5JGVch7sDUzBRPQOyuzmlu
         scW2/fm5QrBKXpFC21e86/n+XHvhHOB39LOmkXMFU/i7xNfmB3QfVKzx5sGa3Fl4hF9S
         VbKw==
X-Forwarded-Encrypted: i=1; AJvYcCU/A562IHuOqAqoG9X18aTgOEao/fMGck2E12NlCJT92gsNaLbNVxTOwtXYYjWNqW+bAFKQKWyezXxqyTjuZM+D@lists.infradead.org
X-Gm-Message-State: AOJu0YzXfN+jGycX+jL9qLbYK67vIUxGO0MtnLAS/IbXgX5+UleFTNEV
	4awb2goy59I3bAnVY11b9YJ+N402aHOb7Ab+j8tXJIZXlVRSP31ftqbDbbCzYbNS0sdvXJOWzMh
	9e5iycXrqV2wavoL2lFAUKH7vglyn0IVptsCK99ZULLnLs3SM9MLpVu+WO2BjM38/ymJqkMuz+C
	sknA==
X-Gm-Gg: ATEYQzwdT2LcFRCanRRthKQz6CXLic6EO+EGVlUWWWEGC3jPY8jVSPFt9q4RRtfWUD7
	DF6oqRxLLqj9i04qN4r030unxdcmCn3LvDf8Sq8hGlYDeXCOMY8rmohl7OJjyvSriLzDhtTt1Cj
	ZxDBWVSE2lolTXfkwSP6j2k2L8HE5ZhCaVNegqjqi0GZE724AnSoAWqx1+nwcH/fDzi1WZhv6kD
	9HMfk8Yam/hTam6VJcsMdUJMEaLym0Y1mJHR3MEK84Ci3784VnbGf149jS+ZcQxpw/oTWvMWMS2
	Wk7j724ZbJ8a+h98MqY7oSBo1CoOWPqgTfMh/i38YaatFB/CNTi83c8GbTn6toSrB3c4+IyOoXX
	4kVmMZLaXdsQ/vs8kGbGw4mQpjW+M7YLld0WCVnKhNMp6ZQ==
X-Received: by 2002:a17:90a:ec88:b0:35b:9894:f6e2 with SMTP id 98e67ed59e1d1-35bb9f65b32mr160857a91.33.1773767723910;
        Tue, 17 Mar 2026 10:15:23 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:35b:9894:f6e2 with SMTP id 98e67ed59e1d1-35bb9f65b32mr160810a91.33.1773767723206;
        Tue, 17 Mar 2026 10:15:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:15:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:28 +0530
Subject: [PATCH 7/7] arm64: defconfig: Enable clock controllers on Qualcomm
 Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-7-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: pp2wcmp5MmDPiOMG2X5fOBxLF8-Wp5QG
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b98c2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sHU3hrrlAqMI5U2SAHQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: pp2wcmp5MmDPiOMG2X5fOBxLF8-Wp5QG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX21sm+WQV2sBm
 jlaQuyBM9nxiGJk0hEb+LerUbxEo876d6UJyzoig1WfzDp98zmvbdyni5TY7jcucdudIhRQARKu
 j4Rf1ejCe3AKLfvl9f45BYQemezf6qsGWmV0ue4JRXbV+juFpb5GEy63dCMGIc1NL+D+1PIP0p/
 WHFkVovVOnHJChIX/61+OyGCk797/aPmxRJZq8GCv2b+ObjXOvOxSo8WlGmGGIUUSy6Ym6YU1fD
 ekIwhoDCgN+5JSFi4QW2gjyBhsl2ISiV3JhhcyD+KjLpjv+3Crm3kmQRtIPds9+j1IQzBQhbyGW
 F2JT9lJyXUylXAkgOYOmRhDHr8NSmhYZOUNrrlw4rbDTSYhha/Rq6tQdc5DexcpZ7tvpp1tuDtz
 RMiifzgzK5u/DOAyQfN4mhlpR0KSXcaG5ftjvfct79vOeJe+1E4YvrLpT/js8VlcnAN5THl3Zx6
 cFC5N/cpJVQfNdyng6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101525_317936_87A9E1F5 
X-CRM114-Status: GOOD (  11.63  )
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

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9c53e74ad5caa492bace394e4fde7..dd45d275d30a32fd567432b5c324896518aa4ad8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,11 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
+CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
+CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1


