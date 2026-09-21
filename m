Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06489C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr7NjoMI1iAMhi71+eGjCtTauKtots8MRIQ3wqCQYTU=; b=eWtHJN8tO+l3lz+GEKBhyf7iNb
	SF/A07NCY/zPLy4DtR21B/6E6vAZTN6zlHyDkGwWH4YToACI7D9IhvLCoWGTJ2YanrrmUXuowxykn
	ghWRAxTf7e9Sk8AOn8d05X7xtfHx7AktstkvVziVenwWapMUjkijJDX4+16uySn8yEVaVJe7dQqXN
	8Xyuvtpy2cO5eqeukGl4/nBPF/BOwU/wmdFqZsuL9djYSlsGesnHFsq1esIctXzOX+b4kOQGHbrAd
	Go+EbVT4RgKaMI/jRYWKssE7+Ss2fUvmPP0fbUGp5Jz/L2EhwkyLsIUmzkLYDL4XUAsZ95U1TxSga
	zmaqHNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcL-00000002Afq-2ViO;
	Mon, 21 Sep 2026 12:59:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dc2-00000002ATi-3buM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdsnP1217803
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fr7NjoMI1iAMhi71+eGjCtTauKtots8MRIQ3wqCQYTU=; b=YIlCNTc9ZHZ6JPEw
	7WVp4mNAxf6tkdMuXBiq1ybVwORfnzkRrWCYQN1fC2Z+JTe0fzTcW/CWlOryoRT0
	SFmt2s1xF1pUuK6KuOJtVlPs9IAwE1ESS8QrpUzBpvLVjAlemKQNWd5rC0JemLSo
	akv342/WG963XfiZnWxDvaTzMRJCd48Wv5IdOc1W4TNHIOHvyx1zv5giRIQg1oGG
	xis28DH0bx6HVGP8uP4WWBOF5KA0UAyFsHAjUXbYZxc2GcC8tdEh1buKfGVca5H1
	/FYq5Xar32WW6l6gXq7BLe6WpYrfgrbgkCOdvduMTRoi57NCmu4BRJThrvxSvtt1
	LxLhIw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0119bcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fb21aaad9so2849210137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995553; x=1790600353; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr7NjoMI1iAMhi71+eGjCtTauKtots8MRIQ3wqCQYTU=;
        b=g7Ia2EOa38lAIgNnzrQBN//RsZ2RqrDHkdWN/Iq/5PbhLgQU0KDhmy0qTH4G1Mn+/S
         5wJAbWDEHwdNObLOSIiFWNUhb9CoCe2IDzlUY1qkX8UftQUz2XYjgqfYPbPJafSU+9Ob
         /VN+Vy+s5Q0TnR2OVL1pifG/jysVRK4ZeppbBUCUee25Hi6YpApyMPC5C9az4679EYhn
         tkxJWTm18x2u50/m+ivaqIgRPlfQXMlv3Hnsil6D7r+3/ilE98p+HX+njnKGXIseRpeE
         Ke4eITo3wdccsQzpKqxsBOUW/a6CqLoneV5IiMJVaUXeTDT8myK1YCE6Y1r2IXOTiKQN
         w7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995553; x=1790600353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr7NjoMI1iAMhi71+eGjCtTauKtots8MRIQ3wqCQYTU=;
        b=nNwGUpxSoTCFxZY5MjpK0o/vt3JjBkg039tGj/xkDfOK3xPuqJPFLlz8Ia/en5JnJz
         oJxZfZxzUiNb+Xj5e4sSPl+RKuyy8av1TfXi0Vt9zqocCWuLyiWVAnEB8+dhC0UARzKu
         mhb7beKac3YPTamCofiA76JwGlIM00t9uE3kMJsgUvpAz2Pf6XX7lw7HoRGU2ugoRLw2
         EooeZi7rG7emfEAzvZWI0zMyOPeErfdSEBj8qYyo18r4LGnRtIkg6k17xl2akqGMra6G
         A+zLATudhXtaFG7XDmVNbBHNiQwdx7xuZSRRaA14sDpjz3pE5gjgo7QVSN1wOrXvPc0w
         V+Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxbg0BfKNY5BVhlMFgwYymL7TJMPGSDNore79o6b9DradKnc5dc8Js6s2Bf8vxbIVSKrM9DjC8EI/FS48DrIxF4@lists.infradead.org
X-Gm-Message-State: AFuF++kfKnqiOepZ5DujyLxUDBcp0yDpGk7WApPFRIiURU7FvkRuwVHx
	nYSOp23bHGtqyIFEFRPJPZr1UOhTBPxgyjzNn8IUz2P7UCMRCHrv/ACsoxVJrgv3EuDd0MEJevM
	ZISlW7EdSuGyW2ZbBu7nvo9ovOFBvGIZSARQl54+ZeuZWhYc5NQ65fF1d7t2+uzOjoTn4T+6zax
	bZFg==
X-Gm-Gg: AYBFou2RB3bi83p4vjpCVrEShPUSlaNF0dAzbYqvFWwFfbVz8YoyAW7D+j6zloTyrI0
	0rUN73/s1B0lBG0lIma6izyx+/SIKpiIu3LKMNRnPegnKOEWtMDFtNZUBo2kpxirvTJjj/nrIcM
	kaM6Vd373uUv9qaUvL8Vta1y5Ahm0xZoudX9b/xzZqt6D55sIZPcoy0ky4QzRiWn6o1nDsQP60a
	Xc6y2+AInJNuOwhFcDb2B9pQpPFe/rgoWsWO3I9IcjDDSpwqH5qqjveOfzTIXse6P991KYCvqx7
	6WxMqU7j617ZKu7jLR0AwBEbI6vVZbs/MMI9ncAigYyR963qUtQj3Tuz+J6Fhibk2772NPTPprS
	LBnEwWYT9nvD7V/mOULg8hHr6qBQ=
X-Received: by 2002:a05:6102:5089:b0:7a9:3b76:61ff with SMTP id ada2fe7eead31-7a93b766357mr830006137.1.1789995553218;
        Mon, 21 Sep 2026 05:59:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5089:b0:7a9:3b76:61ff with SMTP id ada2fe7eead31-7a93b766357mr829989137.1.1789995552881;
        Mon, 21 Sep 2026 05:59:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:22 +0200
Subject: [PATCH v8 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-13-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bCktZJO/8gfDzHepvow51xjIR0hEa32X9sN/sjtpGu4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSn07cNNi8xasmcFS8fkVlOEvKupnwcDN7voH
 2lwurq97d2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp9AAKCRAFnS7L/zaE
 w9BeEACwNMbLajj2JtvYEF8mbMU1mEIIcPSFF+0/wUMsW/0tRO661SvDjdjed7qGZWxuAV7X47l
 ExsQ8lo3YsGYrmVSORxshTz+LPppkAaeFJRedUrZxGXnnzlPr+ZKOnKXH2vkdzDbgUQPTzAldO0
 oJG/P/1LUpLofDDeBWGN1ZiwiEOwnpvB6c3Nrt5XGM0tiq8STJHWL4HxCDQsjOJlP7Fhn0JH7Dw
 5pZ9G/GTnSe+o4fmzsyfFk1WKQgNapClgDv8kefAIRJXDGHriTsiVxsXt171955S5agxjx6kbAY
 2oKGSltyMKOkItJPKnHWkW5qrt5sqAtNg2kRFiD8HEcmBqbWNGz8BZhKpgXy3ML8jLdQy2yphBY
 iiGC+Vqfk+SXVifz7WJOT65up4oJ6f17o7wtO5/eUDsZar5de8+ZoxO3X0y5yVGAe16rekitTQH
 khIOXnud93SABrJapqTwahU25PamwkQhG1iFTDD0UrEyV1AW+a/aZb8/9tj8GCsTEr94xULOQoV
 tSLu+VrG5e7BJE27X0tiBVzH6HxuSaXam03/89m0Nb57ZPXCBS6bzJDEC4Nqjd0wISIpA+pFnkc
 ZREkzh7gayZ77pqlubs+dPG8d5Q+/f4oV2j/01hv0PqpDlhxSS34gVgvZ/PRm5I/ITjWcxe1bmq
 BzkHeGc4I6mTrtg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: YkeZJvYX7Zw5W-Pgoz9s3Rary9lebTeR
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab12a21 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX8J3vpJderF3s
 i8cb9gqNynYuF6ftBbr1FCJSjFf8n2RJWpcNw46BZ9bMdP2dBXNUHsgbRd/Nfc1VmSJP/fh4NtO
 PHTQBnpdwYWNiKqChIecHnnFb7bvxWTV5cxrAmDKHUb4dkwdLEeiNbDLKTCVoLHikueBNxdWXge
 07ps61pfjtgK1cykCNpqT9x1uKOrXVzNpalB/Q5L0Fe0R34l2x6ZI+mnqCUyGjCBIcI62WdhKYt
 on2zgK/IAUQ8QFIYKwVaet8yZcnn5xABvCqqJkLhHD+Eu1JnR4PMkq1LC3dLknOmevEpzztjv89
 EJAa0arWLZKK3JLYMRS1OOdhPdtibGl1Yz+VgBbUMBr+KY86sBjZyDHECjMhLj2H2IHg+XMH8pR
 5Vqoqx5kbxqpFB1hg7+KRQ14nscgrKUtdOrsrFBvr25lFojYQhe/VZ7v6qKnXwsL+8b+Cue+wtQ
 5by6e3W9GsB7k/DXtRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX9JFPFu4a55Mk
 CnvtFYOB0qf51FUEtb/DGmzUGCrW1+hRacg1Jnn/eN/5TAt72kSXbALkxZ9g7Ig8cYcubh+j6Z+
 hnFQiqiVsAEVMiX+lN0ruXdpadLnzW0=
X-Proofpoint-ORIG-GUID: YkeZJvYX7Zw5W-Pgoz9s3Rary9lebTeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055915_023252_97662BD7 
X-CRM114-Status: GOOD (  16.31  )
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

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 55a2e8c3ae3522630df8c31cb2b7c7663e973aed..360d07bfa39a824d13e463912aec15f6fc58e5f2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1671,6 +1671,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1957,7 +1958,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3


