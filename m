Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A269CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=; b=Ep8bRe3MZ0AEzbRDM9zIlnxafk
	bsnUh8ACfZ993ODdqiE2boLiQB0o23md6J5e7XEt1nLwTJiMnoeO7GtnP0l96g0frhf9vkNCwnYWi
	Bee/jxGC1mq1TWIh2qM86YzHtj06YROvPETSK8IHMYYnft2Cz9rhqxjaPjia3LPaKJp/+JP5hJvEO
	WuFtz21HaatJGGBO03uxFsIXlB0UgjRxSC2LoglD9U+qHQ5eucgOt8anwYlYjwZzE0vMc0v57EHOB
	v5zMuZdRotoHorYag0WffalAE2od0FSHF2VIo1j6Seg4jB/FrXS13axkTEbGezmRHins2UQfzaLJH
	7yB8/JTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRf-00000003fWz-1Qon;
	Mon, 08 Jun 2026 13:55:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRc-00000003fRD-0V9A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR3wG3720879
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=; b=ftPFlvSwQeIcmroA
	XDd5yCj6CRUGTJPJc43DA7o1mB4Zt8RDsQD+8Y0JoueSjgyQCVwp/bTWe9cfhS0U
	UFGfSW2Qsac9po1OC8IxVaJ/Ptan1zu8thyCM2ZI6wwg9XlCB9jXg1TDsF+RCwWO
	HpnYLXsyv4w2wI3VOM84pAeojBnYwGDYnadIf8i+GFgTMzEBDhzhwKstIIuNfAUc
	i95hLNmdb4f87rZKTYgluUOT0y48Wy7Oeh0/9XhXx8qrnkZLF32sjLE4BTUbfSsF
	KX8+eSDG4EyPUXYScpeSNFxPPzRc2gX0ddG+y4ofLlgg6Q3gGkK5Ulak96FyMUPO
	NEmznw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enupth0s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:55:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so83897051cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926910; x=1781531710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=;
        b=KJWMWeRB8eXB6/UrJVXHn7ne1OlLxuOL1Aio21wmUmhZJR1LG/vqJdvQbFSOPMmzlq
         Dcn44mYi5WCfwG+/mq5r1egKwMakmM4LAz0YzE6B0lBiYVs+QigrF+btLuWUMIfEMvV3
         bOVCk1s10TJjSBOTEcGHzhSQ06z/oNOwSen0ISsdKOblAcqDZu/LI7+RaKG/mt2biW+4
         eEulTyTf+yWRUdumhtScJn5Y49CgR49J5QbBpf7QJuGpz5hF2YEaVnXmtJ3Mo9q20ZIH
         sXD9UB3FxO9rg87SzGCR0pGwHszUD/+RDHrq2uGsZpGUs5gI/MSEEK0tWPwK5FSCLgJk
         wBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926910; x=1781531710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=;
        b=XIXeRXPQBcbssKRsjDVpZzHERXApJUK9J/yJYJOMm+kZVUFhaRx4Q1tpMsqcI5/d/S
         TdMJCe3dsE9mzrhe/lj4pC1qjsbC0UjhCf4cdt6I0C9VyQ3MrL5DSjmoGaBYeeuzObhV
         slTf8DvDP2zv7Zmk6ay2Ze6up9HvXEobamkvoiGZuJ7P2cw+UqfmGCA3iZJmQAySCVqe
         v/LWu/m50oEFYVpFNh97lcTShc1aY9PWxfT0pqL9EK6/NtqQOLI4FvQWNcMf7AU7g+xS
         S1l5OQ9ZCQLFnCw4wM6Hz1HgLz1clOWk4j9jZzJcBcGxwaETqIzo4cAqK1aQQtrE13HK
         fqsA==
X-Forwarded-Encrypted: i=1; AFNElJ/fnVhWYiduzDGVxKnZM4EnaYt3HMPWMS6x75f40u75uP9Qoq0qjVeooR/7L+064HrnZZUOjfx+p/ni8CYeGmr/@lists.infradead.org
X-Gm-Message-State: AOJu0YyJTgxNCaMgI5uv3UqrZhDOHaJAXaDQCxDoa6Oe9qzP/SBiNn+f
	MgTF4iK5fFyrkKeX9N7ecyf3bFJoiTFqBeMxJ7hi2jN/X8papYjh8AXNG4ASqN06valI76COd/V
	0zdrbMTjJ2q5vL2Y7UUTLPCJqzQkF2xEFVYUrvW33WDs4s9IXmxmLy/Bs9mIwWo085KMM6zWwnV
	OONQ==
X-Gm-Gg: Acq92OESAPNtobkwhS+7LH522Z5Q3LjB/1kkbRcNyEhCDUPnT0i5d0Z+UupI6ySPrYo
	ylIUYHCjF7BwvNwz3eQ6Y7hUTzcrg2hFIGtSJ5RsRC5Tt/dXRMMEKWW82Lvq/ImBwAJMS83H6IE
	IKYs6/xKOdfmYbaJAgK1LGbokRdSNaiBkgTrvVO+Ld9mJDixuLU4GEcX43BreXDOQJ87qRb1mui
	ST+LZu0G7llpxA39274pz6nJM7MYk+z0y6FSkG+nEgmClSCrak97EmBSM1u5ROgMHh6iKb2vHy2
	hWVzdqn4GE2MQNsGafGtA/tZkrJflzZH5cNixbaKQrpZ1eOx3caQ59ZzDc4A0QDipJ3jnNVKM0V
	SeX89LWTWZhu/XqdXaebTimvJHXp7Q79vA21CA82RwL6dCHIKJOSlEwc=
X-Received: by 2002:a05:622a:4c0a:b0:517:6fb4:5796 with SMTP id d75a77b69052e-51795bcbd6dmr233491991cf.30.1780926910308;
        Mon, 08 Jun 2026 06:55:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:517:6fb4:5796 with SMTP id d75a77b69052e-51795bcbd6dmr233491291cf.30.1780926909757;
        Mon, 08 Jun 2026 06:55:09 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:17 +0200
Subject: [PATCH v2 4/4] ARM: dts: ti: Add specific compatibles for SCM conf
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-4-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1TEC0glULkibN4KdgZrT/r3Q3YTk2QahVA/FaQ9NL6E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmr1TFF2JsnFS66lCU+8F+0p5qJHQWm/zbvh
 UkJEZ5dWPuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqwAKCRDBN2bmhouD
 1w57D/9Om0+Ap30Qz61CKEnvch9Did/wqToFGxnJQ2JdOkEcVRs+TGjLUVktj/NMHJduyiKdC3H
 lvRaXHDPMR8luF/OqbQTvidsT53QwUYNkShjaM+gS55P4+JqH0KxtUBolOmJkWqwSNRgHdAY+Kx
 skRFzWFXkRZyyxp38XHyZA1dgD4TmF3I133R5s53OEpnCLOumMbl9i6/w6MC5YUj0LjMXDAFja8
 Z4wE6RVLg1vXq0aLT9VtDKIHjVc7DqzNSTxGKCJnYTyL3wxT5RrS8072zPpikKv597dy6XSf5r7
 vhWE8W31x92IsGmgSi/o8RyoLO1xxoigfrASyHElWB2FagqUhvjZvBGqfPuk6+W+3ReFqXIGh4D
 FzO4zxE7w9RXGsGUgLwZr5/0sPPogfOny6q/8tOFN2F5cex7JgkZIUFUyS+81GzbWoAez745GlC
 GBE+vXK/J4EH/gkdp4MvIepziyvEU1lWuxX9tqVl1e2vFzoV6BdJc/P1ZTFzlD0BgO481VMEs8I
 5YTZEc9Z3Lk3ifSt7azZoc7d9HMxorm+6PrdYBLX5YWEh2vAG1KgvI3e5HkcreiBj4pZgI7K2HI
 ilHvb9PY9Vgic3JVKyzxkr7EHYTu5J1B5Ey2SVC6mbf4FLetntazJNiFS8U1KUWGKCKo1/l+Mqq
 As+xdcBo5ObiP2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: PNDoJC6BNaJ9ImG7Tz1rdkY1m91vqY8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX8SDzJk66hOME
 tXMy0e6sMD+ge6lBhfzahLa90bUuahqVVgYKbXr899ISFDFs6qAIFjPSzUdEUCutmTWG8GlIwrT
 bRGIqrdl4Kv4R3iQ8wDDMQUXxGQzAab6w8pRQpS3WQJEvblxl3NRgB9GVuq7RoCvQ5v0UagKHjC
 9WBbS/olyFii+Qyc4sigAWVQM5/b5FGm1J7JXDoZJyOB8SS+yGSFguPVp3Z5j4m1usD3FSAOiIH
 8ZT75X6WsUHnlO2N6ErcpBDxtdZFrgwfsbhXFMV/mSa1pUwPdHrHgawfUEjlaYOkJNijsccHrs1
 SeIz0u9LvxwFH+OZPWYNYPPB+ju14wJGVbcBYJ6pYmpQeLK+huoT/yl/AuXCxBulIXzaOJR2xSc
 KzrukQx3CPeMe+dp670GxIbfjckv6sI10yE39FhY1cT37pflo869bw2xMyau51wrq0Bembe/Q2h
 Nd7Qk/tJqRSvg/S+jQw==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26c9bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=50gAi1W1AAAA:8 a=EUspDBNiAAAA:8 a=h0HYIqCiEIHQYu1o55gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bIAsa0K8HJLRn3BBPJ--:22
X-Proofpoint-GUID: PNDoJC6BNaJ9ImG7Tz1rdkY1m91vqY8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065512_302291_83A06B1E 
X-CRM114-Status: GOOD (  19.13  )
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

writing-bindings.rst rules dictate that "syscon" must come with a
specific compatible identifying the register layout.  Add specific
compatibles for these devices.

This also allows to solve a different problem: "syscon" is contradictory
to "simple-bus".  A system controller with registers having their own
functions is not really a trivial MMIO simple bus.  These two cannot be
used together, unless listed as an exception.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi    | 2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi    | 2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi   | 2 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi  | 2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi     | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi  | 2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi  | 6 +++---
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 89d16fcc773e..1e09d2b48925 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -308,7 +308,7 @@ am33xx_pinmux: pinmux@800 {
 				};
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,am3352-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
index e08f356e71cb..30fcce33f4b7 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
@@ -301,7 +301,7 @@ am43xx_pinmux: pinmux@800 {
 				};
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,am4372-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dm814x.dtsi b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
index 27d1f35a31fd..9e02bfa5c3a2 100644
--- a/arch/arm/boot/dts/ti/omap/dm814x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
@@ -432,7 +432,7 @@ control: control@140000 {
 				ranges = <0 0x140000 0x20000>;
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,dm814-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index a1e0e904e0f0..ee0090f7aa64 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -100,7 +100,7 @@ dm816x_pinmux: pinmux@800 {
 
 			/* Device Configuration Registers */
 			scm_conf: syscon@600 {
-				compatible = "syscon", "simple-bus";
+				compatible = "ti,dm8168-scm-conf", "syscon", "simple-bus";
 				reg = <0x600 0x110>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index c8d325b0f57b..9df7648c4b79 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -64,7 +64,7 @@ scm: scm@0 {
 				ranges = <0 0 0x2000>;
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,dra7-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x1400>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap2430.dtsi b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
index 222613d2a4d1..01bd471f9223 100644
--- a/arch/arm/boot/dts/ti/omap/omap2430.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
@@ -50,7 +50,7 @@ omap2430_pmx: pinmux@30 {
 				};
 
 				scm_conf: scm_conf@270 {
-					compatible = "syscon",
+					compatible = "ti,omap2-scm-conf", "syscon",
 						     "simple-bus";
 					reg = <0x270 0x240>;
 					#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/omap/omap3.dtsi
index 959069e24730..447736d2e53c 100644
--- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
@@ -116,7 +116,7 @@ omap3_pmx_core: pinmux@30 {
 				};
 
 				scm_conf: scm_conf@270 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,omap3-scm-conf", "syscon", "simple-bus";
 					reg = <0x270 0x330>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 4c78a0b28fab..c1afc49f456c 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -681,7 +681,7 @@ omap4_pmx_core: pinmux@40 {
 			};
 
 			omap4_padconf_global: omap4_padconf_global@5a0 {
-				compatible = "syscon",
+				compatible = "ti,omap4-sysc-padconf-global", "syscon",
 					     "simple-bus";
 				reg = <0x5a0 0x170>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 915870eb5c99..3350128db22d 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -96,8 +96,7 @@ omap5_pmx_core: pinmux@40 {
 				};
 
 				omap5_padconf_global: omap5_padconf_global@5a0 {
-					compatible = "syscon",
-						     "simple-bus";
+					compatible = "ti,omap5-scm-conf", "syscon", "simple-bus";
 					reg = <0x5a0 0xec>;
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -2311,7 +2310,8 @@ omap5_scm_wkup_pad_conf: omap5_scm_wkup_pad_conf@da0 {
 				ranges = <0 0 0x60>;
 
 				scm_wkup_pad_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,omap5-scm-wkup-conf",
+						     "syscon", "simple-bus";
 					reg = <0x0 0x60>;
 					#address-cells = <1>;
 					#size-cells = <1>;

-- 
2.53.0


