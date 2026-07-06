Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B947C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=; b=JLPGhoI4RaZe0sSAJLPgQ7r9kn
	BBjUirqYp2OAty4zSY8sGjK7OJKKp8azCqiDPj2QIN4KdzOZhdWkn8nOcY56T8CUnhXQeAEvnfhlW
	9OB6NL1p64gfRlwy1p4vgRpflNyrWtHhFm6tl7DrwJs1jqtKgpKPjAbWx0xOA4cea2xdJfA29I+HM
	8rTEqak3OSAl4kYgcxmGEVr6TQw0PI2cGsEYevVFsznYGeUUv4SdjlVzSClP/q6+lLGiQASw7GRzF
	JZXrMF5GU5qc0UeqXkeMwGVWlTdPyxxJHP3dB3xgLks209yleZ0+f+TNkVnRtzOWukhK2ySyMVH2Q
	TrCihcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQ1-0000000CBVM-33x2;
	Mon, 06 Jul 2026 10:19:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPv-0000000CBP5-3KgB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693nQL4172286
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H7tRVQ6U4JB
	i6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=; b=iOUwL9dyhYhLrn3fMSaXUxxJmIz
	wE/SCo7oyOTiV5hdNVBbAF22kVODnPcQ59b9k44//hwzsRwdp+8c//ZjpreMSH0n
	sQ9U/PpBSIrGnjkmbcI3BmYDmAOUMdQMydHvcCwInHE3IZaT16L7bssmZtltESzJ
	yr02W+rxGqYUYlH2LTCWm6sEZmUgLPHU9l0Zt5XTI7S0JQ+cmRsdmRPkYjfSnkI4
	c2dKxqzo2UU0ciqdH6KpeZ8zVQwGQoKZv8VCE33OCvGr2ep4SHPA9tjuWpVfwNfq
	JP4kQ4InLl6moTOB9JpFq05Ln0Yd9tCAtR6D9N2IyJ2TKOzctlnLERTy6kw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88f8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:19:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6ed4fe99so485429385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333150; x=1783937950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=HaAVa7Vbbo/jP8cXF5UGNnHutRW9Ymz2OBrVVJbdYz5UYjZCtqQLQbspBj6sqgVjso
         umyWLnL0bZ8CWrFOdIU1KXw1BYN6r76kEZC4aUmjZa39v9xcjq0GCcrzlclOzqIUbp6B
         n8Vgp4XuTkh7ddl47YNf4+znTG9rcik4CHMrISTJJ/Hb0bV8R3pszraK2UMOh1GkwFKq
         c20sKoMtzgHuuYfrmxh/jK+itLyHac205++Hj3zFNUlu6ejkq5H+3NnLxbOb0FZek8Mv
         BgWweq0l6AJ8gwU2y4z6IJC3ggpZHtCyIcI7aLyl/++X2tXKPC0Df52S2fFjwxrOrRm/
         GKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333150; x=1783937950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=fLl1EVU+XLDGX3IFvC/nXF0gPqeA/L1Lxm8Dkx4GTxkLlf4Bb3ce6TNHcrqbEHU1BG
         9MRk8o7MkZ2Cvg9vAXetjdbTJhWtwqsrGvtqL970NYiElqrjpAlR7OwCr0R4X6DkXaJb
         w0uV0x8fk2wcF+fIsS9KaiyrF5+ELIJu2l9/jVEjoevN4b/tuzGGmo9ETVXaxc/1VobY
         YAqZXoJ2rg0GvU01O2U6L/RibXySzKCSvoRBVFuES6N6FGDA+H8MUjSAcIXVI5igtdHD
         7QvxPa42F02Kw3CWR4U6myPIA4F1E3YJPWmZgAbC1W6CLFbOwii/oilwt6oIZ2WmiOYH
         kQvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCiwv3rBBLJtqzxfqf8qUcwvLQKrB+rpEP0eVpWq0nPdBZzyOEzfBigswn+PABMKklN4Gb979sVR3zyaHPEMEG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0qpPwZ/TlOlZRZlJClVkxVTkA/P5A2fYJqg4sC19bRMIaIuQ1
	eLDVSwa7HQPMIkln7uaF4FPBmlk+AE9KJ4UEnjEe8ZBv3UJebN9tCfYvV5mNUnu3m/aBgfsnE0y
	GRbksImMDLDqqTdsfXxM4FSnABkLDYvvuG1L3ackkM4drkWSC7wWLwZoLKXzI+OXQNJnXUWIclD
	CL8w==
X-Gm-Gg: AfdE7cl5dl4hlabrB4skyOdbPzX0XgePOadLeNVwz6tJHrOn1G7yDywepV0y+CsS9to
	Wfs6oLyZIckEiMyqDzSeD9ICGL3GwzokKY1YO7j0P9JcPtSLCHv/3REosI6m2pEqHDdQX52JtGd
	CLwxeKd8AVXwVXrXftirQPoWfgscjAq9KuIMiyYzMk8agDJ6FQpVGFefSwLdtBd3mvtYmm0n/oI
	vg98G/xhVDMV5WaczwlfLEdMBHxL+QwMgeh4ujcNeJpb6Ratn5gnn9xIiIMXqdRJTbXSaYwRi4p
	BBsCwsV5cSfObtyQzCZpsPMRfFInuGUj4bjXWpHqBwDZ2P4HTYYzORKmi7f/CeldeQSEh++acYy
	IRS2KjGsZ+EA0E5mRXNt+K0Gyw7Y=
X-Received: by 2002:a05:620a:470f:b0:92e:5d19:bf84 with SMTP id af79cd13be357-92e9a4cb125mr1231704885a.69.1783333150422;
        Mon, 06 Jul 2026 03:19:10 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:92e:5d19:bf84 with SMTP id af79cd13be357-92e9a4cb125mr1231701485a.69.1783333149893;
        Mon, 06 Jul 2026 03:19:09 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24506340f8f.37.2026.07.06.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] ARM: dts: marvell: orion5x: Correct indentation
Date: Mon,  6 Jul 2026 12:19:02 +0200
Message-ID: <20260706101859.341467-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WwRVC0oPS1PRdnnUiiR/+KmfMwCzKdfktBxDYpwwZ98=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EVEko+YabAY8cF5x1SHykX45oWZnWLZieeL
 Tu6BxyJ18WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBFQAKCRDBN2bmhouD
 1/t1D/wJ/mqVmArwtHr3ontZz2iv0oCxGYvz4vi+PG2sQBZXLecn3Emy+upKnGfqtqKQC0jDCpo
 0PD4/jMmqbJB3bU10qFGZHjzJ3LjRlWsSxqJlf4eHKdwEOzAp3gnNPNEUgYNYNAuKeouweJ75vv
 Rut2bPAT7OTuvr8NhL90ZClHSPwXo/EQvW4X2R6I7FD7g2o8sQaTrL7AQyv7c0OwhMToEjj80r5
 UFIhiopyZ3rClrAXiPf0QPzZvMWWjoF8ijtqv9PWXRajnsThhs7G2QIAFuLx2MxdL52ufGpcXAU
 +6XeBPh7TanxNCdGOZc+adimxLrQGWh99LGpza60uwIoOx+kYWa9AnFUmt6gSYZCqxfpXiB0wgA
 /bYxVgMiwrU0gs9Bjrr62JP9OlOs2ZnYAv2gTjwZT7HihxcDvCDe6ku5/ShxrOYovb9S+2C86fN
 eheWuqWcMDKqufe/xtpP17XNUKYEzudHOnAYYOcqZY9/IYTUHZAJBhJw3hyV0AxD893OAnIgHSY
 5V2dU8eBZVnlcvOVowBkUSCbJkmx2czdMvEeMkk+rU7RRNq7IeTO+Szxdm7UsiEN2QtF1cGGP5a
 pB2CmqIHhmjc6fLbAigxDaMGzpP2n5tne8dNMVjoTjLDHKL/08YVL6WaL7omfCaFsQNcHZLoi2U N23OVBZTd2+K8IA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX6zNb1n6fdq4y
 Xbcg+iTsKeQd70uWo5d2RsvVUWV2EfcF9tIdoAIdklddAYRc3s3T7jB5ZVYSjdj156H8yWpHARA
 X+1wC4F368GQakI68zNjpUAY4GLJ0Vo=
X-Proofpoint-GUID: kKcG1PJNOtRHeZxwMLnpfCGk1SdxdXJw
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b811f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kKcG1PJNOtRHeZxwMLnpfCGk1SdxdXJw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXx6M0Q2HgqwfN
 y99eSCNKjxZNR/aGQ2VarxJDICLimOy8O1wQZtogyNsdMzE0WWnJWSC48cYoCYm7Ej0jLOjbZVb
 XKUsMXLBzOp5OZ6KEZU5lsa7RuCVC51A0yGuR11YvfIrzqiFGkPOFsyG6j8ximF3Vt5Xqlq4OyE
 koyubqw5yYxlz8Xb503IxbEGPzF6cSmHi+xJevssBFYrAtNlejm6hzZEr6ZkRl8D7anNEQYtKdC
 zu61N+8L5tZI/kafzR1UzYE4Q5yIfNWpVUiexjQflW3p7UCoZnq/M1FPEhzGLg3YeVV6eThAOV8
 foUAaeq3sPJXjJPGdA0xmX7945qpo7wKLTGTeFiS7gup/LPFjuCMwkIDLFPyeTf9C6ByiLFU7wV
 BRB0AgwsdiVyf7na2Fpqs5q2o6MlBjC2q536JAFjAE7MAwkzz6saIf4jCiPttvr86M9PMl+bh2X
 4nMhFZYCStkoHi+DdWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031912_632413_22A7E270 
X-CRM114-Status: GOOD (  15.27  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts        | 2 +-
 arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
index 12a4aac2633e..9757c3b57de6 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
@@ -109,7 +109,7 @@ flash@0 {
 		compatible = "cfi-flash";
 		reg = <0 0x80000>;
 		bank-width = <1>;
-                #address-cells = <1>;
+		#address-cells = <1>;
 		#size-cells = <1>;
 
 		partition@0 {
diff --git a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
index cb1bd24b7ae3..b2b3309ed1df 100644
--- a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
@@ -69,7 +69,7 @@ flash@0 {
 		compatible = "cfi-flash";
 		reg = <0 0x40000>;
 		bank-width = <1>;
-                #address-cells = <1>;
+		#address-cells = <1>;
 		#size-cells = <1>;
 	};
 };
-- 
2.53.0


