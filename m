Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D536F44855
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=; b=cvMH9AdCG9Rnr0s2K1z82RqpUl
	U0hxvvBrUNo0DuDeQ0c1y9yZ5lEqfQCEaoIytYTIsx+Iv5guH3U1fPOrPSfXm+WT9XFxCNNcBTR8s
	cizK1GJfB8ErAu0yLm5a+FxudlMkcgzIAjGSiHyMkPMyl+qneS0JF09VamWJMD1vbfWWwETMfcsVs
	DtJ33KsXzZgbgfG6OtE84PKSBqcc6nePXCWW3+LjvwyarPMnllMcvLNzXbgy66NpKhIHoveugTWxO
	ubr/JewzupxISWf3rWe0NxoLBxOZkdp5FaxS+O0jKXbYSu8y+MbWLwws+BSQSBddGRhem07JvJiCQ
	HRndI7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXv-0000000CHdK-3Gcx;
	Fri, 10 Apr 2026 13:05:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXu-0000000CHcH-2irU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 13:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=; b=Ufi6FR6PzcYMjnuQyoCX0rZ2yX
	RgeC3y37CtH7ZXvX7urjt2FZgGswtAIhvC6tJZImUgXFHeAz+1ZWR4emK7tWnumKoq+RqVRNLriNG
	AgSsBdRzoCdyvYsM18jBu15H+6MQhlDHwF/i/PmUGJq3ab6DtvC1/vMIIV93BlH3gRnkRgJH7oK4p
	UrjYZb4RSpfqtCu+mJmaRGhJzJmaWXDNZhXAiYHCg1FhrETjyz/r87jZjtFQwVDyRfGzjOpz4hXHq
	gQN4IggKOdKLyeMjrUsuaQjA01dIM+/A4eOijxgRSyPJyiI24U3o+31R7b9FhFjBWX1taq4isEWOh
	Juke3bTQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXp-0000000DXGW-2v1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:05:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAgr4G1925126
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=; b=AUFdD9cW86OQdh94
	7OBGt4yDg/qFObzLKy+SR5bZL2l2QSLYO7XxeCMZpKcrFaBHIlCxLivn3TvriIw7
	kJwN0dRNbG7n9VuIZ+9dR8VSt3a8uNiTQow2eSDYi0U6yLignMOqz+HQ9lQCwoj4
	ju5yp4P0/i0iEY/2BbUReRiqCwPxAvCY7Fga5+mFbl3Ju8L2uD6bHTxszMfQalUu
	Kv5KvsEooy3iLqkpg5Agi8B4TvFJkS8FfkViMJXSBl2kENsrMrPUsI8NOrmAUCnZ
	Htwb3v+loRoQ8O4yAYJyQ/d0wEddBTBSX8S64sLTLfiWD/H7vyeTF5Gw/kx+iGIX
	ek8yCw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjsexq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:08 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-68cfc614246so51139eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826307; x=1776431107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=;
        b=hpbMHfpgyYAN2Vy7B9GnxzcrFxbq/LfiR1RnRn+fdRHtPepiwsJNalM1ac6gttkGx4
         +LSpPfj+6wWYrAY4DZmoknZLYUv90FvcbCMb1IAR2G0UZAHz9PgqLfFbYHNC4nC4yat7
         875oYyD7WN8lbInnRV72I7z5ZYJm5EAdErmc0O+uhgkzLJqvz84BS0m6wvJo6mdDhB4C
         XQRK2KFrYY5PQ+I1aKxWn8m60MI31xpcF/MnNvMh9/Oeq7IOEOghPARfUl/O/UdtfI3x
         ez2pT5wj4Ukz9S+zHVV0ZCS7jGpJPfwxCvsWVir3DtSV/qOXRPMf8nzoSA/3wyGSud74
         Vosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826307; x=1776431107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=;
        b=C4vuM1tSsejfx+zdWMPFgI3lD3dwROYwXCcuil7gMew8o8xPTfX9KMK+gc64k4IBkA
         LBPXcK7mp91tsUoZxwMAmS/LcjVEhZj0LaIyrTi+YZxACLj5Lda92MAHrOuyz4uxxOVo
         zP1W9LaSRbJW3E52mETaaD3y0Vdo0cfK2d28/4KAVuE5/XdJTgnj+457VxFck28n444K
         T3RQKKe/AyaSfCF4a3i2lQSocQzuBWLTip/9nBmnssDrwlGHJ+UJE6jVH8EVC09sW30l
         vG/g2B4rViobE43WR3d0Id/VYk79kMwKF+qp0EWmG254IvZkmhqJQfI/luf8j97LK07N
         aTYw==
X-Forwarded-Encrypted: i=1; AJvYcCXyq1TnjHY620SHnr6Mlqy9Pn/ay1N/SvneaxJ7necUnEoy5ASlWIBX2+Sl8ihz2xfEZHl78lcL6WeYycyCasLg@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzr2lhkCkY/DoPBZ03dSeXNhh5HpU+36e55X+j679Xp3FeNlAg
	5+mrWx5BqotSPAssYAKe2nCL5M8sBpCPsyY5FKUaAZDlq58pHfDbFS9PUBSiD3njVTG4VNQRrcq
	bqHqYOxYf7LhxyAO3zCth2Y84zeY0DhrMKONAAd5HsYMJlNrbIurJsXVN4z3DP+xM5RnAfITl8A
	P6hw==
X-Gm-Gg: AeBDiesLoYj42qdb3+LaHZJNiFGgUe2yIdP/Mw6Ww9PvgmHgUvPNJZjHXUBl+zJ3vy0
	e944OAc4nuakXOI7ljzBjdKa0KATZVbaaMu9nM63GUwwOUFHBDFnJwuMX21y2BiE6NQiDsyv6CP
	+8nrCqel64+RpiNN+IGgRdN58crcT3IebKHEBuXJc4mrm1qB0BytKxc6lDpDZiP/j0YjawdCq7v
	eEIFV5CQ+ra952x0oE9UmfLAEDAmQuPg0alF9rFBwfC9JE5Or8PnDHtQo3ALjy6sUbkU6cjOWEP
	VeOwkAcRI23c6l+OWbmDEAvNtC1dfG1Q7s+6m0PqhXCvbtmi4f4pMtcl/550obrb733rjafKBsB
	Mp4Fg6Zau1GGkKtpjE4G7K1GqWbrgRFhDztqFiLRE2Hqm
X-Received: by 2002:a05:6820:987:b0:685:f11f:edba with SMTP id 006d021491bc7-68be604a40fmr1442399eaf.20.1775826307088;
        Fri, 10 Apr 2026 06:05:07 -0700 (PDT)
X-Received: by 2002:a05:6820:987:b0:685:f11f:edba with SMTP id 006d021491bc7-68be604a40fmr1442333eaf.20.1775826306490;
        Fri, 10 Apr 2026 06:05:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:56 +0200
Subject: [PATCH 1/4] pinctrl: realtek: Enable compile testing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-1-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EvA7w829n8mfXKvoaEE6kQ0QFggTU+hJ+TQqAlBd+d0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV5fURTv69ctIJObouydnGfin2qlcPP7k+Jz
 x4cFHxLp8iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1eQAKCRDBN2bmhouD
 1wzwD/99QhlA+5EozhSFiPpos/E8vIiz3LaiJBgNVAsipLyqXnfxXpkr+HGaE85fbl7IbeyQDzC
 9JgbCq4S288BgK5gKMnwxpaMLaPFWZqqoxC7r3CDwyx0QBD18Z7QxzZthXJH7btlnWYMCMiSdNc
 bS4IUmzsU/neeqaMi0pakxgWRf3iN1NRW0JBx74RFxa7w7PvHfwMuei/ENvGgkmfSgtI+2AATZi
 SX2dHL55y1Y1VT9wEJ3CX4os9kBOtHTsdXUOPnY+/FpolynFHMZ1ZJ+YLY/PHDNilVYxtd5t2h3
 1PtVdHHTy/HqetoAsmVH9Pm79ld4RSS1rw349IKF4CjqnLyUnyv+xjItYjW42SBerN93LoOWIRS
 M7nrOHnJgGlIfVkoPxBS7/eGNgls2vDogY6R3pA9yncikato+ONlrkwivCrVhHRGx1EJvbL/nT/
 guxKjxhfsGNjpwgl9bgmzN536jwl5PL4Q0l9XfPVoZq7Owibj3iL1S9b+1lBHTL2B0PwoLc1Jf1
 HgQIlbkFmfboCrOKvXa+oMQGJP1TX4S1dL3pRmeuH9lU4p/vBS6WuXSHEAlolurGqeiCpaVjZyz
 vpmu1Kc59HzyiLLVSSiXD9xfVzbFuJeSR0qKZOkaRd/zTVjrA2H2IKs+NOajRoJB/QOfjXm8oh0
 qHiKBZcbERs5xkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8f584 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JDIqfKjBPsxaAJzGQCsA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: uH_AUEsT1WiKmOSzr0Q-KrxG6gHkuJKd
X-Proofpoint-ORIG-GUID: uH_AUEsT1WiKmOSzr0Q-KrxG6gHkuJKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfXwUHT+PG/Wv/s
 UBnriOHXoUOuIVKv+Yu/9H8IOhgOO4z9ri3lDyUcUNBsuHtr0FfRi1txAGuObdnKavCKUbQDktr
 aLoEbdx2tyoF4H0sxpWTTvXaKKz9oKkdBVdacONa0oBUxkrnX8RpwtaSrkaS/Ke8wfacKwpSIn+
 TkEDZJRbc5HJfpc+QEkSnPefusd32xbY0SAoxIwd4O3tKk58OCR81nugBNY21kqJC/r2BgOOuwY
 cI75hkb8cfSsID7ccSEY+GCnSPYSzmlHjFd1RqPnaJ/nW4g6I9ixRANohlmzWVGremG95X6nxtM
 V8UwqBQC3/Fd9JOgoAJ340DONwhOGzw7jMErk3xpLdzixs0dGMmnhdZ0tr4hGRer+Yn3W1TpTFN
 IwAYp/2gP2h3+SJrQVod7PUF1K3+zXDanl3HeYONrbIbwKmb66hEhsoGTsM6FY162KV8yu/jQEi
 OK2HWEEHiQg3zJeS93Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_140510_113443_98FC5CD3 
X-CRM114-Status: GOOD (  13.44  )
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

Enable compile testing for Realtek pin controller drivers for increased
build and static checkers coverage.  PINCTRL_RTD uses
pinconf_generic_dt_node_to_map(), thus needs OF.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile        |  2 +-
 drivers/pinctrl/realtek/Kconfig | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 9d33fa28a096..b054cfb99348 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -82,7 +82,7 @@ obj-y				+= nuvoton/
 obj-y				+= nxp/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-y				+= qcom/
-obj-$(CONFIG_ARCH_REALTEK)      += realtek/
+obj-$(CONFIG_PINCTRL_RTD)	+= realtek/
 obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
diff --git a/drivers/pinctrl/realtek/Kconfig b/drivers/pinctrl/realtek/Kconfig
index 054e85db99e7..a156c4ef556e 100644
--- a/drivers/pinctrl/realtek/Kconfig
+++ b/drivers/pinctrl/realtek/Kconfig
@@ -2,8 +2,8 @@
 
 config PINCTRL_RTD
 	tristate "Realtek DHC core pin controller driver"
-	depends on ARCH_REALTEK
-	default y
+	depends on ARCH_REALTEK || (COMPILE_TEST && OF)
+	default ARCH_REALTEK
 	select PINMUX
 	select GENERIC_PINCONF
 	select REGMAP_MMIO
@@ -11,22 +11,22 @@ config PINCTRL_RTD
 config PINCTRL_RTD1619B
 	tristate "Realtek DHC 1619B pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1319D
 	tristate "Realtek DHC 1319D pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1315E
 	tristate "Realtek DHC 1315E pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1625
 	tristate "Realtek DHC 1625 pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 	help
 	  This driver enables support for the pin controller on the Realtek
 	  RTD1625 SoCs.

-- 
2.51.0


