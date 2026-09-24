Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDA4C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=; b=rlMUas4/ejaUOrAHG0l2mNWwx9
	stQ3SHO2fktc0k77/aKLcOsGeo6nFX4LYgEn+AfusPNLESrqnZoS00/jHBvttRwCw9xqdaLTc7z26
	WoRc5hPuy2+TS5/wVTcaWuvbdOR9LiPyxT0kUYaT81KZ/hcxIVWyEzKC7Y4KquDdMMMhI96rIQ2dq
	dys2JuXzeppS+Fu0YHdmeJdWaQczTwfJnHN8VlSUQvdvDwQYUJ1Ji/QAzwQAdWymw08tqnuog0S9p
	gj+ilpL9WBIsrtiCW2hAYwR6xyMouG0gN8fPF3d5ESSXQ4PSFzixQ93vTR6DmvKbGo8LoMWrSrTT4
	EIvwvBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jAN-0000000B39L-3sTZ;
	Thu, 24 Sep 2026 13:07:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jAM-0000000B39C-2KBX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 13:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=; b=B2TZnW6s4WmaItlHJy5e1/r0Jz
	3CvFt4V+lnLr5k00510xwf02UWrhiRZ+lBurtgakWprOYbBwUUVz5qiewKLJzc9ei28FnL048ha6k
	VQw5DeyHMLt0lVIztXarM4fWVG8iTg3toqAhC3UQfbn4XzkqnvvoZbMT0PPIMI0Z8iwiI2nH3Thfe
	1nyJRfio1CmjchRqljak/VJol0BiXd+t2XDOknx3IyUSuIHPy3Jhtuyjd1tfnV7LfxB0Dy6qx39AK
	X1t5SUE0BLnqvOGbADMrF/5t6GGbGPufCzCL8YEeAypBVrie/yEh/q6GfoskotznYtMFbfgjSVxrj
	cgBvdcTw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9jAJ-0000000G0U4-2oGN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:07:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC58kK805072
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PY
	ROxvB9FE=; b=Xnr7yV6AD1phOC0SnsxCeiGxyz0unlkMvwxG4RiRbpoJI3Srphj
	JFH4eWURz/rok6f00Ds97FW07vDZ0yW8NaAfEllk6un0KXc5iaec+wiRFuk4gGTr
	nh+1GPb5/D7+wcLHUnCuh/kLgxU3RoKOykYC2AcNeBFgQEDUIqIb7VfKPRrSr6wg
	ybYGezoKTxjWSw+f0w7OjF88NLa/h8OVv7v0My3BqunoCCDGdLI5Vl3oaK6UVqQc
	WNoLQ8f8NyiaaKGutuxaoeuFpOXn0xgn8PDitlWy7iP4NxGnJevk19SRFrTQxbHj
	+Jp6nDXrqVmQYCo7mq+mURvqZmgtsL0aKEw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8ptm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:07:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980c3b71002so1582183241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790255222; x=1790860022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=;
        b=R447ApwIQr6aVnDE508l/Dvv5G9IQaMIuUbB8Kwm6TWwh2gVPUTAb69QHEfSpHTT56
         5cTrJPlVcKZOwVAwTp/045JOjuLVBS0fSyUnD61XFE5rF8Y15wJQ+3jo9KVs4gkKqLjB
         JNvEwgvjOuJK8rwWbzRdKJDgJLFedS+Qptoqlrwj+RIAMPuEC9sBbr4cUMLgZmdKrfsU
         UlmzE6LZhQXymKA0ejhTD+KbgqK3N6hcZnUvpiDVAbjqvvhNv374hmODbx/rIdQxP3hF
         XvruhfbTlapZ3V6w4Lp03aEPlqZEy1IJIwfgJKp4hcuw7/ai0JAK6UuwCoQf6V2+7aft
         1z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255222; x=1790860022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=;
        b=GEruTPiZOot8ycoYIKjVvBc/iUvYzzRCbdm84NaexAmpvDJZo6rNIPyYITyVRaKWlf
         rB+fHKk5l1zRKmyddoW+/uFjInjNWiIXrmu+7xcTPwCTl5/2NuuCbZBgUgq7UJ10Lded
         vskEznk8o8SPFMWJwf21ukiu2SUtBBNFn23c5Byu3oDEZJ5x+e0xp3oZmPsejUSzT9H3
         7a3j0M9TB/RuY/a+n0mCBFRZvTJGkRw6QkCcCg3VKaFbImGirTiVjGxx4q8lwe+O8Cmc
         ihP4anPuXr3bNBfOVvv1hWJYZ9ZpGzSpnf1RtEJnXJfNtikwrg9OmXIOuVBTXypLlr2v
         VSdA==
X-Forwarded-Encrypted: i=1; AKwUvBxUz1VQpJIEH6X9NK3z0+lOlsDBTdiu8qC4271uRLhFmUKn1RX70ObGnt68ryV/ZPoSiuMTam7QzkGSMrfj925r@lists.infradead.org
X-Gm-Message-State: AFuF++knIKHNXlR/7XXTj4DQvO2c2p4EG9/Pm3mdQDtElV9RqBb0hL1g
	ZZgX/C/sXBJ0kMDQ92JawAyKT9uuXDtgYdP5oZqDOn23an5Sybernlisz24DLJ/AqdZuukZSdxr
	YdxPxKL1xJ/VbLFeJYPU84MbOuC8UGPjktEtuvLpL6PwvMVekntUGd+ecq002KblgnfX3cqfJFT
	ONPQ==
X-Gm-Gg: AYBFou19JsDZ91CJ7iRlgHwh9atV6Hoclm5lI9aKSUtBIkjQSvtvG/4i2WigzU2wvfu
	QMbCHl5GS7Hj6ZVAPWlWKGzn2X6A6oF5ruMh1xvBP9F13diL4qn2Yj2350CiLlCCOMMtn6xMHzb
	VxMR6X7ga54KP/ugsBlOqyljF4aVuj4dKs0Wvje/TuwEslMEicEZ1G41CFqQ1RwW0Arq0kpc5cU
	GF374XGqsJpA2ZKWTSQeUJZ5lEyjVHzLFzJLTaGOV5EVe17s1SHCktR2/mXzape5v34gHJ8i3oI
	Wb5929j2yUUfDfcxqFWtgZbQb9UvM38+6wXjzlFvyzOoSHDOYJMfLfn1+trFJJ7V98HDrASxPtj
	4xqjia+qmCI1mSYQYxQz5XJYY7uZmWjkBSz6MdxFQWiQeSEk1+3x7NUt7R9dVamOcuEqD780o8a
	UUIyqJOWJwTn8+g5+1voRW2U8JqxNHwDu4T824
X-Received: by 2002:a05:6102:3f87:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7af1c691fddmr1410266137.8.1790255221916;
        Thu, 24 Sep 2026 06:07:01 -0700 (PDT)
X-Received: by 2002:a05:6102:3f87:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7af1c691fddmr1410256137.8.1790255221451;
        Thu, 24 Sep 2026 06:07:01 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bc04esm3665913a12.29.2026.09.24.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:07:00 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen
Date: Thu, 24 Sep 2026 15:06:59 +0200
Message-ID: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hCSxpeyBydf7R7lG68f2DzXhDSUpl-oO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfX1JIowxjSClw9
 gBW2zt/mwsMecDl4EP6K6/3Rk1thC1JSAcg30ti6xBUyKiR6IlW7OxU8/Fj99Fz8vEO8/JDiJaz
 8H45L0jaJHraIMoix12hUSUB9KV73fjS3qcShHd44lzkFJlV9hP0aBDMwry72XAiSP05nten7Ed
 AN+SV63d1tMMIjFgXkl6vUmeTDW+xm9J0Y94dBpFiQMu47l9OC5xUtXv9/p5+erY5VOTyaVd42m
 GtLSG7uF4UBj+NuMRlMGVOtZqxx6hdXL15/yt5B2nWB7HmhbyHNhuey6I4sK7VpyOUQhc6Wo1VP
 l8yHJQO2nQwC2q4YvkEtxI6gFVpZP+4JnbBKsktMBoBIS8Dz3A/HcUrxE88BDbzxv76yl//isZT
 EzWgTKp2tNU+iOYxutSqe+2kBnmO6CNMvGhTObDP3e5y8MVtzzCBVnO8ZD8fhEeXBxaTAB/vVEi
 Z74hOEArFN7OpbQIgcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfXxN851nimj14q
 +lfypLVE1cKOkJZLFjvjExRYW/e4dHVts8LBZAsqxoUDnA7Cka5s3SzEcMPW2Fshbxx8h9H5wBl
 gXTt5olIzbX7DctwoTt2kC4CFCx18hM=
X-Proofpoint-ORIG-GUID: hCSxpeyBydf7R7lG68f2DzXhDSUpl-oO
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab52077 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=kHo-VL0827TqqIXx3KMA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_140708_107708_A3CA2EED 
X-CRM114-Status: GOOD (  11.32  )
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

Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen driver, this is
necessary for thermal management on Hamoa laptops.

Suggested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1c42ac043aee..37a0f4702e71 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -800,6 +800,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_ADC_TM5=m
+CONFIG_QCOM_SPMI_ADC_TM5_GEN3=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
-- 
2.55.0


