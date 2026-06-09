Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B01ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=; b=3zoE9bS0RcnILBL16OECbikTbm
	iecvSjFafOp/KazazpEfYloJKOoF8LR+Q32khqGMutq3u4MYzZYkVFChlaXa6KINR25xNcedPdCHq
	oGP8QTZr7upviY4N1pGuPcU8UfzkyZnkLH0hyu6WEnfGcpkDnPW0MuW21PInsVH5/u3ag0Id1gB3S
	YcFHEgXjmGExwCQ/Xaz3YF+S5J3h+NrFX/Ewei7fP5ebgkEn6CdiwYTMSv9r3uq6wRlBQuG4Hl8Vg
	vUyH+hYnPYsXdpJaWiNJ6DD+SFi56CcH2doBKxsPmtoaP2MZ8Kcp+/xgoxfmVosQRhsQZJbfV1v74
	zn2c47gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRu-00000005vLr-1uO5;
	Tue, 09 Jun 2026 15:33:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRq-00000005vI8-2ESs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:33:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnKud2668476
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=; b=USq5plSFL/AkikjM
	A+Dg3xKEjy77GqiTwyuM3icTtyNpiJfjysy3J+ZAGTv9P0bVZI9EjaSrYjf79TbN
	7e7PiNcqBL+aRzQ6q0f6iqxTkfdf4jUofs4yMv3vcTHLD9gm1202+yZKGZuwFpoM
	Kp0mAIgG03eZjJwtSFW6ZhTw5stXNn4kTZmnCduvxxYYBj7cLWcJkfdG3goHuasf
	MD/zxwjKdPP5jBanIk0n9T++H+XDVi3GLV0tA/9Qb+j0HuznRPf7EWmDQA+suK7w
	jELQZfGHv86epryj14rXwCx8PDDSoc5t48RtcEIe3+A+nUJbdk9ieu1aCrA8XDL8
	ytBQ+A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25tb5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:33:01 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6f01486a0so10987418a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019181; x=1781623981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=;
        b=H9ucUMap8wsyTBKrwJlSlCs72zxzm1BrLP46a5AI44nJe3DwUaUzlxeslDlQvswbjd
         zc2Dlem5BvXQ7gZOeIPD1ZSuHBkySQZblMNfR2GmYSZ+nGK8L+gulTiT3WnjlXBTLY21
         LCs0dWwhhUf5/5NmzAmVAqd2unnTmYq+XnyrfBW7y40spEnkFvRrXSqcq21Ks/mfWP4K
         Gi0VHmJH8QPi8DORqbMcAWC1OcFGYPkdARcLEkrVa9FJh1I48lefy0uTs3v0ES1OI/Vt
         c86e7CxQwGsFu1E5b/jhdDadhBer4AqxrUxUFL73iUus5PTs3zuSkdioJMCVqJDw1sUj
         /kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019181; x=1781623981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=;
        b=Lh7fZgv7he9mT532Kxl7XidFHcaRTaKHdW1iEs36CcH6XlZ2E6+BZxi9/3IggUwe08
         MlR03ORBxNaxMTa5DwE39M7Ce9cptTqhZe61k39vKqSIYLaD1Wj2l8vfdPIj28Mzk7lW
         Amh014+6q2weu4Is1tFCl3Z/3zz3c+j/278353Si/4hK2FbxNJG0r8h99+xhCVrfM7cV
         vkW2nMW3N+Xg2+PUNKJarXkM2qAL5NqFIPiHDdTh4hJtNurzCgSIQkTZITOiJSry6e1f
         WznVqT0okXfjTYrMNfqoVSNwdu/ZztowHls1IGBszrPhG2zJ519iIIG7z2EMfG/+Objd
         dJgw==
X-Forwarded-Encrypted: i=1; AFNElJ8YmiyTYsoodgxYSxWtvKohGyW7huXTliHbez9TemJDiGmRApbUCNqvsP1Ly5IUJT0H2tZP3mKO+eBsYURNwJGg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwq4TYsuuVIpLAnuRq8N94qMK+mnzsH3kpk4v+B2uv2UhN/vRD
	boXIhzX/ZIxE40dqByJy3qHII3F8KCfGXakTSu7vQPKkcxZiQJd8qCBGFQK89EheigFEpJFZ9K0
	oVpiUpxsSD2P1I0tzF/phEy+ztnE3zBql89975iDv04U6UNPb2PKh7qtWDo7g8kM63vVnbegUxl
	p+Sw==
X-Gm-Gg: Acq92OHVB/uZ85HFDyj8TKVp5qfN2CiRdkOpEbD/RvsuqiQa4j/Mrp+fFHs7Igr+GYF
	/s2N86Cx28J1IVy6yNrczWfXrN+jvTPsjX/v1pOVIK8TxtW1W647WEK7mXON7tg5b8awgOKX1gg
	zI+2UBV785xgiVEtlUv6xmmGN4r34JP4qSHxxEBpV0fJ+blJ+VHPW+YLimMvbk8y5KK7HWMw8j2
	S5URD7lGQFWa84nZh/lwysl6JYagydM4CZsK9Psk//8Hx2q3MspkhYso8bm/bnigc77NxkzIT2N
	pIed7wG2r5roKo8Tezt7ckDQNojlFl7mlGBgZCheBJgjVjWQ/YzP7jLcD4JxUcQ8HN4QOZOzqnT
	2pyae0E32DANR3lgHsmOYPUExoBoOKvAVoQvu+gt+KGZNlTdqeusqGUaj
X-Received: by 2002:a05:6830:314e:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e7516c9182mr2225994a34.2.1781019180953;
        Tue, 09 Jun 2026 08:33:00 -0700 (PDT)
X-Received: by 2002:a05:6830:314e:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e7516c9182mr2225966a34.2.1781019180525;
        Tue, 09 Jun 2026 08:33:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:41 +0200
Subject: [PATCH v2 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TsASqrfqbK0Ps3uvYuUtqGTp6RdNEPy2IAP416/PQBM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIbxw51CymIPshnJtl+jqcnyY1YLMgo1IVsQ
 z73JtMk7rOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGwAKCRDBN2bmhouD
 1x+RD/0bpM00k+so0N5oxtFjPrS7HNV5jtV44ex3SVyHoTMfdmLQ7+G1llSaeQc+pFydUAK1neI
 bbYUm0I2S4spbDPtWCMRQ0/+ZrsQ9vcSfpOweNwHaJLbnaXzcbQAqMD/0vZiSyMmFp1xImlUOFv
 QyenkWbloWNj3dV88vtGG09dF0+buRnrzs32ISiPnyHTaXGA0DqdvqfOjd4cOU9MTyXpK7wWSU8
 B9zDJZ4dDRLWxYyjIJB8nQAM22kkUpxprsEGf39YmbBzPVgrYWCXyEsr3FHw5T//MygKPof538t
 FeUD16G0KHGl9aiFLYXfd1YiI6+kq0Xyd2J5QuPbxzbhexI2Slor2t84rEqBkI2jRWZ04yFkMdr
 9/mrgCqWRxfdiWc9OFbc4xNPCGo8MBio14DkM7a+4TC/1U+c/29qt6ZNabB0FE4M2E8QMCvf71f
 G07oXUTq+npp8NThEpSfji0H1BOOFmqbUNudWu7SZc2Gu+sppYEmLUo0YNz8V0od2a1vx4aepDe
 ir6n0XspwYqNoc97rJdT3VPjuKMGWrpEUMklDte4BsQ11uA8zXxo3HlDLe7RL7TP/+osA5329RR
 vUifkOTrzccaTxO/E4wh+TkZmQT4WfugicEh/DXwDg0fuvXN2EHEJSnywHrm+w+QoGhgWIcn/2y
 1fTnGcK8aTeRD+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2OOWJ3QEyUIsjZKabN5eDSc2ar1NRleO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfXzshBAKqR0f1x
 pYyq62jUERQYEYsGOKagzrLIy9wVxvXhyQRkgQH8ijaCg09FPOQBlweNH0PjhWhHBF284rR6JTV
 IjDHdvBVk7fQ3mjbPhH0OKiLijgncYO19u8Y8ab3qYmILQtpQzVBaOWwr6SBV/IHfqP1/wY3t1g
 /Zs8K1M28/pajEo1D8Ugg09nPRc7t9F0Bdmw6l8SGpG0BqSg3iHn0l1T3b7tvm6CyWYLuCkOg/V
 7bkRjZz8eBhQbfYM7KhOqUETk3P8VXaVkWlYNGM5cmhYF4UA2DlHZ3ZXOyVk92GhI9KVCyQv3E1
 habA7Avivrbxa6Z+r1WsOhT0DmqDzqQanDS/MJmktSdmQ1n3k7rr1+y7vpDHOkd1SodGfEfohab
 TzBcfbPJkC/vum0azlG18F4Vi2ddm34TDhFCbUPu/zY12gM2mMN6f9ZD9o2tJABpdrOgUODg2hl
 InKezxvAyxwH+N//3HQ==
X-Proofpoint-GUID: 2OOWJ3QEyUIsjZKabN5eDSc2ar1NRleO
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a28322d cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Qd1XWP2DvpO_7if9oiIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_083302_700829_1DA790AC 
X-CRM114-Status: GOOD (  12.10  )
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

Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bring-up to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.

Changes in v2:
1. Rebase
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91c8e9435dd6..766915f8a050 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,13 +1458,6 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.53.0


