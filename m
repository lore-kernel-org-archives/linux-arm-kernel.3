Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4687E937E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntKgyxNIlu3rkXLqjuFBa10IXFJtw+6Kzq1RD4vbKe0=; b=cGijz9wXwS4gYsAndPbTrfJpQu
	y0SuRCx2O3AU0/ejcQ5EYSCDIgN8IDwcBZ8ecCfwWcBzY8mg6CERy08IBR2AvjSz5nK2k1R+YLVw2
	ybYlnliO7j1YOZe2xrUvH8iEXbJUG+csRVTZ6vHYITcuaYgl7JVIQ3SZGgmOcYkTs1OdRjd9bQOAH
	sYVl/QhUpsNXrB/WCBrWesBs4v87bRbYhblB9qxnGJMZgV4iorseGmRQUoBaQixRbejDED3E29VPx
	gd4j1aueFJVUTdXrd5jz+3XlV+FWIHkRXwT5did1dJMhBpbEewltI47U6j+0uYUgkbkEphByz5bSt
	C5qW9nyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxZ5-0000000ETjr-1rAc;
	Sun, 12 Apr 2026 16:21:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxZ2-0000000ETho-0cGA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 16:21:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4t2l542922
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntKgyxNIlu3rkXLqjuFBa10IXFJtw+6Kzq1RD4vbKe0=; b=mWindp96Z8Tffgus
	PDCVP2RxsLNLDKQcb2FWChWacO331vyDEi1ILY5HoPWQZSgkfjKmkAYUJnZpmsbE
	ehi8RKfqEuWLJ2rlQKh6EXIxGR/+djpfvm5meiePhfABrML8umj8aACyWnY7s/Eq
	opBYytE6XntL55j+RUMzUiVnDcrWohx29stcRLGUd2QK8pfSbWNovyx5d7HWGI0z
	zLKt8zc9W18JUdk4eDA/XfVxoGTdzuv3s4MNQ1IUGuIcBgJRMrhST05KjdAyLG9A
	hbDqNNIQU6Lgx5hiUkAjmDzYOT7iYJC8Pgaohb0ar1FJqH73rQbKVHWFXpHrhjRs
	T1wA2g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexftn58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so43493941cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010895; x=1776615695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntKgyxNIlu3rkXLqjuFBa10IXFJtw+6Kzq1RD4vbKe0=;
        b=dJ7CMn6A/EuNvNMn5HIsuMNViwMAeKwZzuhdubXeln3Q1V9L0n0DKW7PdKTwXIA6YE
         AgxoqYBVfqkZ1VpN/HtPjumh3rk63T8BsBh03lkD8e4oSnvseGephOvhKps9sAPPPN9R
         H3Orxx6hKS0pL7UL7kuTtwvRnUkDZG388BTauOHNE0CAWm9wqvl1YJUExe5U18Hygicn
         Z0P7YmyXQOfV//WKOgi9olNPM5i4oZwwcBStH7iuBezYyaNTBPvHW1C+ypgHruMDdYRk
         leiNXM3xRDmCKK5mv4flMiKMdQa3SSmjndBkCYIzGkXYLo1Gj+0J/MnQU+f5cHSVkJF6
         09qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010895; x=1776615695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ntKgyxNIlu3rkXLqjuFBa10IXFJtw+6Kzq1RD4vbKe0=;
        b=sl5j0hNOzLyzSpM3ZpH4IAJ3GwCEX+Sx9F5FP6Jess9e3NScjtAJIERfOmV+n5Eosi
         3v/nhn+qkv9vH+keejMtZ412OFAuGArjyMJsFlvrsquJ+LAE/R+VSqMc1Zk98e7XieUG
         TLlQfS60EDfo8hUAqZs70DmetPGbJaGW049y5XRV2gHbV5SzBb4IfMiejps7CGJg0GpR
         tsN66XZoDXkAV/12Tvi3eET0vvKErz8Kjt6YE+dRh0Kyf68IfxSB0oZnbqM8l7EKQMnY
         /bgVrEbTTg5U5RXVsB70iOVJcHz7d5JCuNg70jS1iuBN9nFLJxW9bpHW8hV7Uwk9HE3G
         uA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCViCWYxIkputKXBnqzp9nrVPdkDLAtyFLhG0af1YewjjNV9/+j6w96Kdh14rzbKHL+eJXWggtQiWgKl/XV53uai@lists.infradead.org
X-Gm-Message-State: AOJu0YxejBiNkXDG3joB5hPZxLGPsbSQ6x42DMWRVAw5obW6R546UcIp
	dGRI8lpTE77PGP4sPYB0Jvhwe6Y28WuyW0hDE4JkDD7tNoYPAOnqJaCcy75svNiu4p/iYyK48+V
	8ixl0Ci6tI0CmGdwZfhlVyIv/2C1ZEq3NXQ5GqFAbI/6muyR6UB9jfUfgg7ozUplY4yYUiwNWti
	LUFg==
X-Gm-Gg: AeBDiesU8YmqMo63zL0LFNFa4r6tjvpk/eIzyTQOZ+Bj+TzD+qrwA2Ybqk68RHxJ1LG
	x/+697RS5dDlGjC6PX3CtURh6Cx6G4KK9HHl6abZdFLJRBDbqEw5L79IdunU7wlsjCSrsyPNNwQ
	7+6hQN0lQCQWTI9fSJDVLDf1mxK0S7ndaXBX1gUdlZrYbVJ35qbWAt0rJAGBeEJofbuaWrX3SSH
	vw7LposGf19IHK+tPjRg1HNmCZep5kqJpmjQ93lSSsrqbxHGsq7gA3vjdsZRUjnjt8oGQvl+p8k
	FdRY5mJw8cgbaRUi+6k7+Q6czwkx16lnO4W4rfF/dy0aHOnpB5By982eDf+bf3wU+iMTuszgrXq
	MWisLye8me9qqW0p+ztd1aJA7lsy1moQgQNxTG7X3Sfmt
X-Received: by 2002:a05:622a:1189:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50dd5bcf32emr148401851cf.31.1776010894677;
        Sun, 12 Apr 2026 09:21:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50dd5bcf32emr148401491cf.31.1776010894221;
        Sun, 12 Apr 2026 09:21:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:07 +0200
Subject: [PATCH 5/6] arm64: defconfig: Drop AMD XGBE Ethernet driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-5-a46918286451@oss.qualcomm.com>
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CiY1VdwgHFoYRnk7MGs2AOg05GfC6PjF0P2dUeJrGJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z6VbiMRFDVvstKd+grSdX05GB7agnMyL7Fl
 GqYpt/76hSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGegAKCRDBN2bmhouD
 1/e4D/93OGJVZ+xs83xfyx8SWt/ni/1hg/nI3F4jlyvsS/kqnA/P9KtIhUo3JGZRbK4dxBmdZ/y
 6GsOwTP0/h1hS1+u2BDs9CF6FlM3qBxHy9nflJ9eY88Mkull+cpgp2L8/cUrmlGQOS27o2duZ6y
 GJkIjGV0sffkwKF3WW/XyoSj9ggagT2fPh0Iq3LrryW5tun/eZH1HhedQJYEs72kTBXSRcNDRQ1
 WkMuu4lpyVSlzJQLG0/QcOsqhhIwYRrroKAGoHJpwLAeK+Agtjn4AHlkPl/LF3jXKFCvCT3y8J+
 Rwmpyp1IUQwaIRTqn+nEHmgLplu+4WXDRGllSjvYi9+cy2y/Vq7J+17V5nqKTXbyvkV0mrvk2kP
 mbI8jAJjlx6rvWJJpggnhBY+GjXUrx1AvZ+7sHU3/lCXQ2tq7GvUATCDE+r0v9yOyny3jSP65J9
 nI74w647xlN+qzM+WmfXafWKvv9yLI3KtqQiV8fIqC6Ria7tzrcfzlHLL2u3TuLvvqFcYjsUism
 Jk+QEKQAaBXxhFWgnmmWOGRacoAoGq5gjGESPEIU1ixcqR2NXRlKKFXWQGaqBNKF8qrQe1cn86u
 SOqU31E19WvrXwk6OBpZ7Rdrw/rFvauCp24UurWvBBd9JG1ZVggnCWy0+zHUpsVIFa2vU+9CNm6
 pLyEsq9sz6I8aqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: FHuvz6rhwEHK6mK9V2XN7jwZE4jAGGSt
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dbc68f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4yfb2UTZCF5Zq5gxaBYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FHuvz6rhwEHK6mK9V2XN7jwZE4jAGGSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX/l6+etvm+FDN
 NmhfalR8Aq+xEmUq0Bzvir/Y5ZnU60lY6MXPDLEfJBHJOfnaHg6dkxW0etwk4e45GN0GQhdggir
 bIGoMwq3BA9DejDxRs7/cMMycY/B9Hzj2YUmh/vK+W2Hfvds7VJeqhXBrjvCUb1GQmgJwEi0gIw
 bE7hlpoQWyLUgRcKEZ0eEVr78xuR7xts7qsTxn2MRsKoGfOMBoh2Je6HPUyQqSsuf7QFIXPz1dP
 c7IcTne4HwzjdZkJD2g6sZzFT/Tkf37BKJ7qZm/6JVj3VQFzm5S7NWEroAoUN1r01lPYfsyVZrW
 dGbvXEjDl8ciuus3otA5weF1JX2iBc1R/gjqB2C1W5pBy6iR9Y551/ZT+kwSx8BOkFXsCKSRH1R
 NDR+05M1WqkyPj5TET4hi6z9VSMwpgeAQv78YfEscyxFVh4Zhnh1WzCvxNIffFnpRm3mJIKJwbL
 +DcMN3X9bDeduGYTDqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_092136_556828_59FA0D1C 
X-CRM114-Status: GOOD (  16.02  )
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

AMD XGBE Ethernet driver was enabled for KVM/QEMU, but QEMU dropped
support for it in v10.2.  Driver probably is not used on any other
arm64 platforms, at least ones not being used for development with
defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 79f6294fffdf..63d4a0f2e388 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -356,7 +356,7 @@ CONFIG_NET_DSA_MSCC_FELIX=m
 # CONFIG_NET_VENDOR_ALACRITECH is not set
 # CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
-CONFIG_AMD_XGBE=y
+# CONFIG_NET_VENDOR_AMD is not set
 CONFIG_NET_XGENE=y
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set

-- 
2.51.0


