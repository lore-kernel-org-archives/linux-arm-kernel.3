Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BFFD26D7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=; b=Zjx/OSB144f6RgDfMQofGYHdqp
	wvgL35EcOy5EVnjOWEG6ck0zOFUzngBnkzt0lwuTBE3RgEPBtQCXcfrob6/U5c0coOz1GajgWgTxM
	owCEns9un/A1NfJLo1HAZZO8JQPkDg4ZvqyGi2EiPwjzN8HrB7A3y9ZFDmYqM9I/7f7TiVPphxn+I
	CMLKYSrGBkTwt9oAtt021JwNW8sNcH6qnq9peLWw1txsqb2kNj/ngBqz48iZW3iUWFlte9w3cpG65
	72RKdGxwxc4TO2wUJCJt1LiNQBT9P1YhdKmsQajGZdcBxixA3+zGEVql0sxADQQMwgM4z5xJNhyhi
	IMsg+ImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoe-00000002fXZ-26Q7;
	Fri, 09 Jan 2026 16:58:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoZ-00000002fTS-2fJ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CkLST3542328
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=; b=TrKzJhB0BPjVRZA5
	9HXeD+qqFANtO5FgzcPUflJJjsJPmL+iJaZopRqfyCmZ0dq0S/5iw14XtqHrOVgM
	4MO4vkkaBoarumcKSw5Se5ySi39PhjzujAkIjNf6M4uC/iH2NeGQWYZBPqgu5Axj
	6Jzyu6+djq56Q6do6Igt7/aNaLpBSvENldQireaPsTCDbDt4T+H0hHoB6jJt4Ucs
	CUn9EDyjfO7I0WpuJ3hezEvLPhB3lNfAGjRLsPX+bRz6/MoDRCWK3PYnff+6X4/s
	NZhrDeHnw4NdZhSkx595XpdxqPSfHy+/9h+vc0cnmB9eoTjX5fy12uMpe0V5g6o8
	wreOxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b210h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9ff555d2dso1195364685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977898; x=1768582698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=Qd+trpatG2q9HCGUJtSXD8jVAOcPZc6iqAsIQN8/5aKzisNk02Kxisrb2hWoELS16C
         trPtWAO2Y221GU1rD3/sy+mFNrz2OGlsWarI8c5riAAJoD2BCEneA+6Mk42kh3fFMDKd
         shem9v6jQdixihqK+3cAvtT6tK22M1gr4Y3o8XicE5OTqN+0Cke5PVc/3iw7ZMNlh2Nf
         Fg+yLZlgJe9iZnRNjEFp+9fISMwy1M5nswO1CABhgp6uWU9suIgSbY6jE/9bwxSMPzGb
         L2lZN6iv1a0ow7gsm7ltalebWddqpSy2VvKXaj+X2PNJqxyrH5k/6fF80eYyQGJWciIo
         1hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977898; x=1768582698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=IVUyqHWqKKqMfpF6nuNUlvQYo2Zld9yNwLYZcrEc3KxjiYEmB3r829R/ntTaD1J/Z+
         g2Zlk3MQAqBW+hNVvMyuLdSISgvfllumlBGQEqU+k2DGvrS9773lj3Avw8qxUpp8KOfY
         jF1PgflwdTleX3JRkVu8qeRYFfjSS+JsMkBEL9zgu+rp8a8uRKCQhqpGi0r8PJ+MAUH0
         vKW4uMxWmbqEwN5v/+C4QLOELXYRRzsucXrLjLlXON1nVZfPNOihLiGuCRzxjWGYmpSh
         vlyXvdQX3mrwY/b8msQOImzXaO9HH2GYATpO2Uns/Rhnm9Rjpl8XuAg8/SHoIa/fg7Wf
         4wgA==
X-Forwarded-Encrypted: i=1; AJvYcCXKCU8pB+LyKizsWPfHxgoNEDtiXh2RPqjGE8QDqDMomcjBfrT6zYaVpIJfuTCwg9UAVztjZ443Y1BlNOpW5ipW@lists.infradead.org
X-Gm-Message-State: AOJu0YybS0b9QMk+TOiX28eVCtHN1Sq9tD8gdr5Mfw+PZfKluLCUKs/H
	Hzj/tOm84sbnu+fmwOaAp+Ec9p4ftaIh+7i+kTseiVuMDt7zFdNZsfu594F1J0L9yNcxIdidPez
	yxA37QqhSmbsmASTBVkXeY+miO8U1BAMpP0aPDSAFVCOvJNqoD/P62JhmV+2g69BzrCN6jJgw5y
	f0NQ==
X-Gm-Gg: AY/fxX7mv5KDFhNc6DXDVh2sgLku2SIbZgXsMCz27RDKXekLONcdZ6fMxs73ujpSmKg
	x8hVoUvoorILp1hsD8TURAERY7/ev6rvwXoMiYf3SadvGVbSR/1pUGqX/In8yfFFNaLXMgHO0lQ
	a2kbd1wQk8v0pFLbV0kz32y7gMGtjz9aFvue8sNOISfk2r4ohqohtzyRxeTcvO06O3761DnmLuH
	BjVXR2vFksas7ji7wzBXoskeE1izkV83EHUfrNbd6xHlHk7gqHIOmbcePvMSGy69fmrW3xAkpss
	wOc0+lkchRzEG/r22TYV+wVEFXnuaV3FWaoyeYD9YgPZN8nswCAM6HIRYIE1QBoI5zdVZ+mTSna
	yOnw/g5JPlNdWYj3S8BZg20yBC4OiDZyLgA==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435773385a.40.1767977897606;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWFg16z7KscX7Y9jM28Hrz2EGd5LC+7ZiK/jAqogZOUQ1S1l+udCeLhRKjK2FRyHwECsbjsA==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435769085a.40.1767977897126;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:48 +0100
Subject: [PATCH v3 04/12] powerpc/fsp2: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0iguywPlMIlSsxDnFb4fp3zFOJO07SWV8Pm8YIMsCU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOTq4JLeP1qeYnJbbJLJHoPa3XUUF+q1l3Qm
 yHiiBECvReJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkwAKCRDBN2bmhouD
 15CdD/9iKcwGZWr1TPTh1N8VgCg7pZ1MqIHopwRh10bIppgFfKknY9qqEgNJPMZtoa7VsQyBmMv
 oKYS4n2YHL3iPteJQF23gA4VqXj3G9RMN534g7OIvdOY1VJGEBQSl+S/zcv9CHL3/AM+Wgmr+GL
 SXGJvW8MORgp/6Fa4q/5EmRaJC7kuOFxfahl8sPf7WPKy8mPBpKzNEjyl6rH5IE3q8LDjHRMKie
 9pr788DrA4sTL3SEHINAg/agHf6qEM/IdmpIdrnGJMPbgQ/K48mKbcUFljA90vB9RbjDVdnQ+CB
 y4A+2bS9CVv/G8PivbgPctgYy7jtlcVbrNDTl9i9dKYHRchMdVRI7WiEIKPkbvC+v/9T32y9Yy4
 kYCl8DoUvqCJnfzIpCLnSy5EjuSlwV0LaR2d3KpFeQ6GcsUbpXWB4IeXGck635nvlBKutve/vVl
 Me/ZHK20+Or5+fP7foZ0RyVore8ucmE2QIScRBzh4+NBll1cn0luUyCMBl6u4UpbPf+EhK/D5nh
 y/wYpkFV76Bk1oPhj3d0HC5KQ5DX8TKVBFNz3PV5wq1PP2+qTXHFWjv0g3pn8lno5WN0520upkd
 vo0VjbpyCbLmimtcJE8uP+nLHpKnR5WjDlttXt/x0SfIUhk4GEeaUAgHStwNI/UeGDcgWnbYFF0
 L0NEdtwx5ztHplw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXx2YzzxJMvBvl
 IzcN+EWFkjJdddHWYE4McVfYIBrFIrY1NvHcC0OK6VWtYElI2cwVIJZGSUtTdLRPn4R2pNafkJP
 aXC5lTqj229BtOyKVDAPssIy8OeGGF430iqM/Z+N3R1xvWniyvgxaXXJeIk4dePyvqlHFfjN0JV
 b/RECTLsHDARmGMAFm9xtjP/uzctQNsNHd8WT8UCQMfIgLaLHNjOqWh7qU/qqW/XlI8tAMwqCbM
 pwYVzQFZmCAfOyu61oJdxNEy/PcJ02jvI9D6zsIAmc5HnTlguSArr8v0iSxpLB0Z8teu0pmNF/P
 i6LnKHZxrelLs1aghFdYV5YG2omJZRpx6/0mjKILvBRIbPvmuZ92pY2ypxDKk/5X33pf7lyv1Yj
 vwWxtzs8XRLnNT4Pb/sXHyexG/myyZ2ErFlUN/BZdfxHMW67Gwyj/KM8NcsIlC88vsvb4hTXla8
 Ae3PzbeXcP6eX/iSgsg==
X-Proofpoint-ORIG-GUID: zfyvjcx2HQ1yix9tye77LVlYtmUY2tQn
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=696133aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=bRA1xQHzFO3ZoMUYUbgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zfyvjcx2HQ1yix9tye77LVlYtmUY2tQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085819_799533_D5DE474D 
X-CRM114-Status: GOOD (  16.49  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/powerpc/platforms/44x/fsp2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index f6b8d02e08b0..b06d9220844c 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 
 static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
-	struct device_node *np;
 	unsigned int irq;
 	int32_t rc;
 
-	for_each_compatible_node(np, NULL, compat) {
+	for_each_compatible_node_scoped(np, NULL, compat) {
 		irq = irq_of_parse_and_map(np, 0);
 		if (!irq) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
-			of_node_put(np);
 			return;
 		}
 
@@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
 		if (rc) {
 			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
 			      np, rc);
-			of_node_put(np);
 			return;
 		}
 	}

-- 
2.51.0


