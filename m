Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49EACC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=; b=wm56IO5wlxizYDwNM0pg0HDpxT
	tcHGDkESd6gpRF8yuAMVqkl561qWN4PpobtYdVwOJvJ9t4xNd2mBAcf3ngV0rDLsBn6bGm4jUT07n
	mRchqtY6wBmrOmQnrIAYknlwI7cBhJR+HkdMg2JppbGzo9Nu1OcXUHn5oiOKhwIwAxBZuacwNgHyc
	54OKpynCO7UgWHFtMJ3XYInkslrbgrnPGL7lDXgphmf0I0wZsz0E4VMDXWvl/IzVGMKFNVYSQWUDb
	y5fFv9y/NAvzA+04X2TPRpCs0nGGcd8D9Pad/H9OmHZDgPA/EyuVH5gA0XzxCXsASLKd6ypefzimB
	B4oMImlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHICP-0000000HMd9-2zRO;
	Thu, 15 Oct 2026 09:56:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHICG-0000000HMVN-2l4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:56:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHZi1507238
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=; b=HoW3znptfsV8eKyQ
	3QCkwfF61sW0FHl7f8719XRyRCCQMyDnDSouGTBTJTSlO/jEEu3kQ2lqrbM/ZCSB
	3REObE5HTyZQpdzN7M6KoP81quM7ZXGOYNLxGhEybkUC6PCPIz1ARwzD//TrNx31
	YivnFTrWdxSksODz2YkzxqwsE40aqpB0zJODVKaPhFfRCUW7zvfiYGl93niQtNFp
	OJIpfqvTGBb6K3zNPINGzfwTL7NWbGN5pvxUQ3msev8COPW60pq0esQsAIB2ylOi
	bOVyYq6KzXzov8lHmPEQ0m0EpUVApah+XkB05S10QXQ/6V2C5SAuhuY5YwM7y/Qb
	aeb37g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bpma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2843011eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058183; x=1792662983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=;
        b=GHlrrOLemhOENU66gIMsq2upSO+d4czVCOZq8oX6sFpBE9eN3xEcNxV6kvlkvFXyzJ
         P1fQdj2fFv/cjhhUjihUJ87C3vWF5jxDDRg22buqXVogEAFt1W2z8i89CywtRuDXpoRd
         9FVyPoSMxRv61Q0wOslM7oBaLlGrjLcoLNbtl/bg4/LdX281XBTl8zGJD5AbUvltyq10
         6I/a9trSeIILOS5M7iz6d9f6ulmb62lzf1VP1AGmyfQ8eztTd3B71FZxbAhu/dDAJ74m
         e9jk2YBEsDQKXuK1lUx4slmvj6LLN3R088TgX4/Fl1cQg/z79dKgGDkdIxXnpgYgN62M
         Xu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058183; x=1792662983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=;
        b=cJ7v7vYqNzfzVpK8lUNGPgqGm5vD/jKNIbxgdH8nqKqRYffnocBaMTUJS1MUHHOadi
         zqriAdv+iOqFP6PSC84B16rEMe11/BZGoO3xP1RCB9QrSBB9+UDhu+pKEvcpp528L6q5
         GTmbTUvx0959JF4Lxn60NzQPqQ/NE01WY+oe8TW2tClr/y5uDJpazvJCfK0eTuZEd5O+
         L/0kpDXrXxpUghCSoBXQ0vzM1ac/yJcSIGBCsOOX7lVCj8nWF07MaeeVlvYaGN83kjFa
         kv89f9n5i5B/4GxWgZ/fLVqlr4PEB8QNP0moAMsJ92Su2sYYgRu1XkB6kJUvgbTV32cO
         Ldyg==
X-Forwarded-Encrypted: i=1; AKwUvBxaKXLBEGbMu/BFC7tV8L8n47UBU7lQ11yQ79gIBGePut5nLwaAXNj4CFE52r0M7cskhyAER/hJBjLW5sdT0sH2@lists.infradead.org
X-Gm-Message-State: AFq9FYJSjRz9oTeSIW+99mtiGNRllTz3cPu+hzH0fGUyMjxqH/B305XG
	9XnWQs1lh/KcjWWy3xP1WYS+sIxidsa4D7JTxS8a0ExU3pQBLv8wdXIKvBzG28IQ+rF3osjWckl
	onbrLqipxblWyYCrftgWxd6OaDXiPjt7sw5+nR8a1VkgytvpVHXWznDTUJi5nlvJhSqQmuzQBCr
	eEKA==
X-Gm-Gg: AYBFou0b/hw2lKm+MFKqT9YRNFjNE2QpQgdDOy3+H3hAmLZg5GO+hhfDL43Uyw0KPD6
	KMpPkfMyCTBGFLiEF4BWp6Kl/fT8UdFhfD03hoaUwjYoMbvcAyENfX7vKxWO6QDwxXQ6cV6o8bS
	wUtlPnp8JsQAAMvmbYBa9nNsia2tS2yvmxDV2tJMSla13rFOUmBFRdaHiP9uCKcpw9XqBrHCmsX
	8eZSTc0Wyf3Ehohet4x6fkDaELdiuxf/gywL+zSBj8/xpSMaq2kCuuViVeQ6KqvVOFaBsQqAp4/
	hkPQFAmVB+ft1uIDwLf6Oy0s0rJA+kdKaTm4SBaz2WEZU3Xk39I9v6m0l0dzIV6Cii8kSLlg5UR
	G/o9RkbP2yMRmnWr1/80ARDS54wCH
X-Received: by 2002:a05:701b:230c:b0:136:c443:80e5 with SMTP id a92af1059eb24-16a586a31b5mr23126179c88.6.1792058183407;
        Thu, 15 Oct 2026 02:56:23 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:136:c443:80e5 with SMTP id a92af1059eb24-16a586a31b5mr23126148c88.6.1792058182858;
        Thu, 15 Oct 2026 02:56:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:25 +0530
Subject: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1137;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=xzu473Y7V24ggj3le/TfoZWNsp/SkGbTiLRw8aI+628=;
 b=ObOaLXXfjGaKBaGzk5dvoHlmZEcF7kbr+L5I8bDEc+YKLttWH9KjHTmjJ9jEEInESNrKqR7u8
 zHBiWoG8WH4B3JMd+PazXFt2w88qQYlhWJK5ibhNPVGoUMWrxdw15/G
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad0a348 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5xU5tZsdfkseTblZoQMA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nVosYAWbvqxbPfh6XavxGEvUJ8PPhzHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXxdjttSqiaHdW
 DLgCTAuQRMjzM2XEs8YGBWvpxYlKPB3VaaeCFD+4ddM9rIKUnAFOrbFH4BYSvb0yiK4XfMfGRxv
 KVICEIYi1HgCWHgGyYwiKnWUVdFhHti6Ah9X670TijKizV3msyhdQL7W5tvELx6doun9fJwwRar
 tJEmTVC2XYBPVx/hEQfo+Iw9VuUVWgvOy7HaT52tKf0rTNmfmC+ZaX1RmC2KAxTjmM3lGQ+Y/i4
 RmwRgHcVJlRbTVGmdxXTQXMZIb5N0fIszAIdBuGXH1AfadNnqsixoe3g+nWMrhzqMF6Yb2teKSL
 oqMEsiUe3ezxdU25heFvqCb8qCYJrUHo5dD+le28E7YSLxXzYVo8dDQn8ejjQBvwjMEEXMQ2SWj
 57t6yAbazRgL0DKoce4RefRjC4OUcKH7pH7cEpDBSaw9fpQH4ufPb2ymQ6yYcHOPDzNUzXzpcvr
 ik2PzkYAebGVc8HLKkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX+h4DhompUvQ4
 mRC8M/IqDKMdJ3ALqJR79muOc9WX4zlgsr54EYzHku2S+Xi+nBpZJ0oZSrBC/6WeJcDxzJfgD69
 c5F8UWLTBTJlAhekBqgflfkkNO9GlCU=
X-Proofpoint-ORIG-GUID: nVosYAWbvqxbPfh6XavxGEvUJ8PPhzHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025624_815206_86C0AEA9 
X-CRM114-Status: GOOD (  13.02  )
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

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index df4a7181ff80da0b75287bf4b96f82facb152b46..bb30bab28c24c02f4619a4dffd7132973356236c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -234,7 +234,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep_apss_off>;
 		};
 	};
@@ -310,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1


