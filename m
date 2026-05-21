Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA019CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LCV+/nbCUttCbjBGWjXzYqpie33j30l0mLU2tG8d+NI=; b=VcnY2eVs5jBY5KKmQ+5wFdaVXI
	v7m41C38ugJz9cGDx72AtPHiCVZ66MCVe3CJ8Cky/fjO1KGb9/SyGIuQ3Z6SBZ7vZ9WmXhk0sdYT1
	E+p0aIPFQ8cuPOkH+FAJLTe+ZgjwI5xAk0INfRLE7DcLm1DHYZOSZL/bzvK8Zmep2RxrATnHXiDjm
	v1KF61tW+xHWzVXk0gAACFKZ2PxX5l+efTWQiIFqEEw5ni9L1MBTHbX4xNsrhcNl/oi2D2tcCG/LC
	vrUyCXmiDUUg6ldvmb87xKxnhnDzCA+qyT/N7jqoV70M+h3UReG1hHDnDGIgsutk1d3yRbrQSN5Rx
	BG+vamKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Li-00000008JLk-3oTY;
	Thu, 21 May 2026 15:30:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Le-00000008JKl-38K7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:30:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LERjPm2446921
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LCV+/nbCUttCbjBGWjXzYqpie33j30l0mLU
	2tG8d+NI=; b=AfCLrCfsFE+yf52R8oo0NZHi3/HDwzMzVE1F5wb0reYPLMTZLEp
	UoDUEFjSxLhi5M8/d1RrfOD1J86+5iQ2rxtDeFagE4dHJS7Bfbvjw3qcFqvmpJFl
	zZR6Wi7JR88JOG86kmoaWhLepC22QpU91j96AojwEXblpEd9S1cdCqYz+YD54Wyo
	9Ubnnb3mYa7OqYbESUdPDPTNBZjFGVsao54Ut9Bbz2CYrjxjxtNzZ/rO1ribgj/Z
	S5xRqklujUrYSoqglsyGm9dlpA+EQ8MvYOlOb3zKXiDlsU4eRvv56cQKJclPK6ns
	fs0gPGDhLy3CVmgJPFmKGwjz0erbmENzmzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7r9er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:30:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso174140841cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779377409; x=1779982209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCV+/nbCUttCbjBGWjXzYqpie33j30l0mLU2tG8d+NI=;
        b=J5F2cp/26Lr9W02WoT6cFxbveXzrZUNANGkUR9vwohAotu+Yr/UrumclzpCp5aCPA9
         yjNUcFWP2GJL6EYJQQpY9tsZxv5ioeYsOdJmznIC6PQUpMxDVkI9hwWCm6bzDWPXKU9r
         R6PEDpwIdRXFTzs/2/JQHS/RBJm8WJUW7CMa0xGay40yhsK4kGkwEItwnlPEsJIsC1WA
         zRUhtkGYOTvgZYIPaVIOdAdhCVfEwCKQU6gR6efLxkoQspTjNraKNGDU+SY7WcJzayGK
         S62oJBk82gHRrcTtJog3tdxEsdNAj6+/FgO2xJQZYx4CPuStioB/P+SePkyQZcXrZ3Df
         BHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377409; x=1779982209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCV+/nbCUttCbjBGWjXzYqpie33j30l0mLU2tG8d+NI=;
        b=h1BsCW8prfDkQXatuDlXvc/c9Ypq0KXCrSyDC396xBbSqwDrd7+XyX5rO2RWRFprKq
         XwaUuKMMFW3uiXinjHIaf5CJM236ciViXWNzkzjxrw9aMPdnrX3IIj7dxLHbVlkbYEGz
         1v3jmXdvN+VfKL6UzZ5YojIMy/qew8AMhtJS5plbbsys8/H3vMjRfp/86IHDuHS478+V
         qm26NneZsgb4TshNe+mBFf8xS8Y4dQDqUULzRZJVdehuPqQh+oAW+T1owpZ+RTdhMmFA
         Idt/CHCqCFhsuxtjvjmiMMNbkILJ6UrHg+vwhNtibcoQGGi/UaYvs7I/GPx3T38cBYOt
         ZRRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gAb35jsrFJf8inpKZYzhoaTlII7oNiXTCQJMt5xM+rSlRmuPjoLlcWG6pa3BsAURhqmPT02vr0CHm4QT3Ieso@lists.infradead.org
X-Gm-Message-State: AOJu0YyYZVODmRrG9LI5GUByZ0EP1eOJJF+IGjVUtzGcnUTYREOum6Mc
	sFv8kFrdyY4I26y/wOenG+rQGVwQ1XB2w4HiVNES463ZCtwKCAGQZg6X0cd0XsDF1Gfu2WVUhR9
	lsmCL1hI3Jd1lAbn2PopIuPdGWysOqDV9ElKoAx/OGEkdUL8Xzxn0Ni0qJOKOkRZG5wEFW+bnTw
	W0OQ==
X-Gm-Gg: Acq92OGlTYSkztJvhjdAAzVFaKU2jO0/wz/m0J53H9bbKgGyWRxHNMq9a5yx23H3xwb
	Z/VYRjq14qkqdEHEst9AO0okqDnqo5OaoAoMpQDcTEYhzLezMcXAr2M9VA/YL7NOcPoNXKHvBa3
	XNn85UR8lFOKJEJU0/TZYP7AyKwx2pv3oS6Y70bPZmxAJbx4X62/JnZOehykFJ7lo95nOgvBt7O
	WQesizPIhiNkpJIR6tarLjtflnER4jX9QQlmPoQsrFKi4mq6R3H/z6O1wnGts7nz5zW450/qmyy
	kfI87d6r2q4zFvvWnD3tNrLfffjT721/GCcS4b6BkX9Wkoqp+7xPEQKGKmF+dfQr1DAuvRKv1yv
	5GfKTT2TSllnOWa7ibBtKN28QtEUdH0oxklvB
X-Received: by 2002:a05:622a:d0c:b0:50d:a8bd:dc07 with SMTP id d75a77b69052e-516c5652942mr33616751cf.35.1779377409025;
        Thu, 21 May 2026 08:30:09 -0700 (PDT)
X-Received: by 2002:a05:622a:d0c:b0:50d:a8bd:dc07 with SMTP id d75a77b69052e-516c5652942mr33616211cf.35.1779377408545;
        Thu, 21 May 2026 08:30:08 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c595e6sm33093265e9.1.2026.05.21.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:30:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH] arm64: defconfig: Fixup duplicated PCI_SKY1_HOST
Date: Thu, 21 May 2026 17:30:04 +0200
Message-ID: <20260521153003.429610-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RbEm7iffJzFH6G/uVH3VQxbK73TMWZ6jXJahOI7XdEY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDyT7CLESfELHRA5uncrrgJwb4H1UbNUhSju2q
 LonqyMs1XiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag8k+wAKCRDBN2bmhouD
 12vYEACSD4Jk6gviekRhjQ+o+3EySUK2+s+jNhQsnCWpvvGvLMzbyYDPoFOfOIUHj12EkBYq+lR
 Lmpcc9vKOF2LSeoV7IhTQGPdSs8rUOnvbVjdNyHEdjc9SCyW+S50TaZcCzQ/PqNlnQDFNcwq6YB
 ogSuBneo1NlxFz/+kMqeTvHtodHeegcPdshS8F7vEzAR96RzG13sKuGwx0MZnqbsQQZfqsHtDD6
 +aY2/HDgQUs1st7J3vT4DuabeWZoxjYHpTnTTe+HcuOcNjJsUOYjsW4KkwplXIFvixs+gaeXhlz
 Wwmcrv351uGMd2oFms2d+n/ZLlNiGnyqNfvn5oK5PjT5/QgzvI/oi+LEcCv3seaEop76fO2G2yO
 s6xbm53+E5Bq9N1Xx7che9EnLw4eY+SLwd/GUwuK8u8Khtje5+YLCQqHIJHjJ1cnNmQ1un98A1G
 0HMUtF1QPy4y4+m7rrbwdTMzwAKQ+uuJmCHm9tHcvvSEHikq/eXvH5e9St4WRjzk9vl+9cwiC8j
 0DWkG5Y7vlCuHeW17X+vzid14PI+e1oHfyqPhC/tz//BeDZvhCUSWJCCxXFFDl8X/GSIwMkdYA7
 uYtDcmGNu4NQ3yw0ZsK+cGC6DHkfJFm9J+bAIy4ROg0RUchEyCOWUqokDr5242ERa3piJoFYyEE xAY0NozMoiigGoA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a0f2501 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Qe6B47XUAAAA:8
 a=TAThrSAKAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nLu_DpVRrlUwSt4cFjoA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=a_PwQJl-kcHnX1M80qC6:22
 a=QWPKR-PWjQKaio0naagv:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: D8I_bpgQOkCEm_yJULowl4oMjX8bTVvb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NSBTYWx0ZWRfX6l0pYvNpsgh4
 B7bP1HaauDZM15PHOLstIRi4eOcdovcFGim/ee6nyd6TkfVSv0wkohGMlrRwIJNoCAur+n4NZdv
 DFG1W291InepTFijGdi5mrXg2y6m79edEYN6Ihdi6xK2/8j3N2YAJE/dtetkqAf5NwlnlUB1yus
 PvEobF3tvH8XScCBqgY7YwyPq09D3/KDXu192vOIFybXjcg+RNUlufXcgEJxpUFCP4t/rUZZG5I
 9Ir9aSjRY72iMbqaF8SaXuV4OgomzOux2+vK6k/UDArSUBpwAay+KNbFFWz1vEBjjwPSliMMjYs
 7rsr7xdsLs+mEdiCeWZ4+18Qz8rucVdp+TPLotVDZpGLbFtzWV1xE8nj82U2uOzFNGRR8Z2FVTE
 gynMruVlfiQUoO8FzOHImINAjcsxAbDngsiV/Bt8nqI/8PJPylLiMKL7WRz+AbjiQXuLr4B4squ
 iM2oKhvlWF1n0zz7zQw==
X-Proofpoint-ORIG-GUID: D8I_bpgQOkCEm_yJULowl4oMjX8bTVvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_083010_906017_E22AC11A 
X-CRM114-Status: GOOD (  12.41  )
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

Commit 246e37739f24 ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe
host, and Cadence GPIO") placed PCI_SKY1_HOST in wrong spot, thus it got
duplicated when merging with  commit f54f7979ff88 ("arm64: defconfig:
Move entries to match savedefconfig").

Cc: Peter Chen <peter.chen@cixtech.com>
Fixes: 1440d446ad5d ("Merge tag 'cix-defconfig-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into soc/defconfig")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://krzk.eu/#/builders/102/builds/72/steps/10/logs/warnings__1_
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 340313d48e0f..03a057f90527 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -234,7 +234,6 @@ CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_J721E_HOST=m
-CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
-- 
2.53.0


