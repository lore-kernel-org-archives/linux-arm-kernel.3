Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4ADC79F8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=; b=R8ZgpPdu7pVnsr2oLvybp6ArsZ
	roSsiETXuTGWQh26X0/SsqvRg3uqy4cV8wPL8/1AY6Mq+Yenqv7tonSnLHHgzS13DxqOg0Ovsvihw
	Xp0SksG8wzU23iC/tQXhAVxxmAkVQn+xSpoDIrZozjGY8JE0WI8NcogP8mLLsLAFdyiuVm2YE26W1
	kstKyxn1lD48yppxFzTaHabzqzOBA5BX2UqHzdLeTMxOLxaGlVS2jHkXkMdseP6hWjt2amMXx+J0t
	EmLp2qE9e9TMRvt5PxcbUZNap88K0LGb7GJqIO7mA6N+cgkT17RQYXoxyXnw7HQaK/RdgBY6m9nAC
	k+nCBirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckiv-0000000BTAg-1oRU;
	Mon, 05 Jan 2026 13:34:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckis-0000000BT7l-2YBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:34:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058LFR13622804
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=; b=D3GqdzVh+P8lxKak
	xY2E7ZQ7eyOZAywZB0ey8BU9stHjORNWbthxMrjWcamgAjxRHkm5TTsw2VczZXjW
	ep0idd8VLSlcOj5bIKJU+53zQ0N0ejTMiwQB4Crz+9/eAyrdtBhr975FGV5XM1W0
	EcurEwtrtt850S67vxxojPCWY19oepsMGQTG6XTGQIHdKGlE+qRmLxQNKN0csOuM
	bGNlcvunqwF/IaB6cgeO38Q+hpugBLYAZrFDpjBPbY7/UeJW/do5EB4/WRAx47y4
	eGQGPryefk1jqA0BQuW1+XGQHhY4nr5FwHs//kXpjJeDgk2EUghlVxQxqcoFRvfY
	CnGxUA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvswh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:34:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fc0d0646f9so178143511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620053; x=1768224853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=;
        b=N4Jjr7WUWT0PPkhXzwiYG0C6DfZ1rBzkptb0XVRhLHm7Exx5sbSqitRaAuiQ+nVGJK
         bZ32qU3R8ZISkzWwNvHLToaWANtUoEvXUje0DvPU2Wp0Bqo2CDNG0YMK717sUV65vJ+b
         S5OzL49BGT6JQgddTHbkaQCIkM6xoAceiOIqEP2r6YF4ss/1ryo1IUGnhs4lGIXqxnz6
         fyLFjg5XIh/Kb9sp2wo2l7kKFtFBQFLiqtPSFcPlwUfzvAYh127K3UPb5K0PtZQmizNE
         OunEP0kdfK3tMfj2eWiwOt85qCJt1lW2FUZGWiP9o6luMUiqHnIc59amceUyUwK2iGUr
         96Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620053; x=1768224853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=;
        b=Rv/M8pmD2oEj2rl5WYs1C40HjJdnh9mMSSzgoJRXus/JPvj5zYBw/7yyqAHeo9t49E
         FJ5PziSFumP/G3Y+/018L0fIT8Pt6KZKmgOwdpZkQNcduI0/4nbOFoPLjjdfR4Lw46/P
         q2w3IIqttf/P+ETfnQ4JQBlTc2kJJE16D9AzllDwGMzj8xdCKqtyCBtlI0TOR9+3uD5E
         4XO66cttqBmxeOfByv9Z7qp7PCCo7yAStFOJak383ddUi3fJgChUIjc0fsF171nZz50/
         KsdVhfFh3fA9OkMId4P65lpii/2He0u/PFW+1Hvz2RZ+001/WcdhaMq/2DKoMg9mOLV/
         5afA==
X-Forwarded-Encrypted: i=1; AJvYcCXXOZTG6YvQUUC3yWji3j59jmGkpvqKUpZ3QlIodbg5ZwSJmypIJ+c+GI66vv2T0BPzS9gIRDm4JTa4K6wtZ3L+@lists.infradead.org
X-Gm-Message-State: AOJu0YyGfH3MpVz7/TNXFe+4Rq2nKb1qJBbgm7rH3/2xqlcYYm3JjS9s
	MCSoW9F0knQDXf9zHP60JDruHSV4FIx1/QyCKfwH5rI4n8cnaLnQ9nBVId6hqA+xs33zaCswjWt
	jpApKdMm9/1qS2vJKW6W5gXw7Uk7Bq+5scFKHo0Vz3ljEStegUWpF2HNBvm2HikpmkrH9kMI4Az
	TOAQ==
X-Gm-Gg: AY/fxX5vxvtNzCJVTF+ZaemKa8AXdsBxWNtxnHUdReMyU1GnbvYLUw49lLDnE3tq+oM
	2r6ZvrDxVnOpb0hIRbNK+V5r0+yt8rPNzy6lgV8kgioI1PO/+LGdFXrXS4MNFLr/92NEIKAsA1B
	d3yhsv5FoEeOkRMUhiRF3o41xuFDtHJHlgjlUKQWOwzv6Ju1WMCuq/1lfs9IKU+9fyIWZ40qi+g
	eXT/RtE3eLpjpZIh8W/bWhoSjACQloZe3POqnBQbkF8UVV5Ilr+9auI57kavLBId238TFyj1N2z
	daGCpckwJUKryLKKX3jrFnnIsIPr6Ch9fWOgeapTFwjm/Q38MMyBWbBftYa01oeJyAdtDsAy7Ps
	zTIOZa4GUSwOS+7xSp4hrH8yYyYncfSr8SQ==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr830028901cf.31.1767620053145;
        Mon, 05 Jan 2026 05:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRkO0NCONkJWWXhAzy0ep55XiVJsUEFnaFCHhzMHAZVNsj44tHSkLbWNbO0UO4vNIzk1ruZg==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr830028281cf.31.1767620052729;
        Mon, 05 Jan 2026 05:34:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:45 +0100
Subject: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gMZzaSjVY4tZVvTQil8VUzRPtCxKhgc0IHDLGyDrZk8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7270TUaY6iNZZ3USQUUPyMVYCBnPviUFAJQZ
 SbtcAwOUwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uwAKCRDBN2bmhouD
 1x8WD/9st0kAgDjiJuLHe/DH08bLcxWpCZlth0KGlKegvN8Rj1R0QAKsyr+7yQgZJxI2zmLbtFu
 uHevP6bF88adt/4FfMMTJiGlsLLnnNw47I9kijxa0eob+ij8Q3c4aR2RQNI5H4L9YXS4GGvFm4l
 pMPr3mERDghSCXHaRRJ9AVOnaM9NGSstFpYBt9sqyql/tc7k/m3/Tq67I+dU3QIYbNb1dGl5m0r
 P0A++LSAUbLCusxVP9eWtPhFnS6fFF+LCxC5Cg/flpMX5y7tRoKcDHxpQgRpb1B5qxC20qOyXmf
 2ykplrlmCi4Vi9hM5euEu8cppTm6YFs0QTKW7YqIHORm0m5HtodFWLvgPaaFm2bg7uW9vaVaJER
 NQgrU7y+ZO6aGc8GOpjcLJyBC5spVcsUdcRLltJdlB3i4P027abTyxNlrmpQS96vY5i5WvX9PmH
 vRi/vBst2K2QmXUi61j7Gt06cNG5Q7aufKqp1FTFV1XgEiyziX5mbOaz0CRmmwP/DVMKF3PCCak
 kbVgAYKAO9V9B456wwx3hpvNokZHMHAnzIWeEXFk5LCMUXIK2shaxjWAZaJhvyUiaQxI8UjQ9hN
 yaNEWVOyWGWzXd4gkhRzptnmx9kCYHhUopwuXudzrTcobAEHqeqJIvcbNSZ/L64QtRtNlN4eOQd
 wE4SrRsGoLsXcIA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: mH3BBpm8moSTvOeuC6OPWSjKnQJCDlXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX9X3ZwdNPANf6
 HhlPKwJWOOc1grlGZrSdknPUjLHy2Yrq5X3Sxigud+TwjLRiF+2nZ70ENYBZkjC1ADXrgOpfvaT
 PgDc9wJiKeV1HHJdU/KSiRoXPgOxZwyj8uS36EA8LBwrGLcaB9bz81wv5E0SOF7Urpk+7y75q4O
 Q5Glda652b/eQp4jXaRa5QWgHX8gg5a+ohBy8O9xx9t41/FOj9pjJfT6QnQgLO2nU4mhUNRDqau
 6YfyWNKEUiQSeDapN6QP4iXseWgSq6ExBmj/nwq9vVjtCsv8/VMNImH2ENPc2DKqbdKt4h6jPH1
 z3VJVMa8YUH8r1Oo/lwwj+k2azlduJPKipti5hc29wYS0kxNUXu9ioOu/zHk1DLhSQ83Bgkw0+K
 ZoG0Ge5QvGdr/4DNeoAb6QvGWkai34JyYT6HXD+AmoT9eDU5DQGc2w/j4liETsZ4yCcsHVVeDE1
 a5vd5XgkV9H6jxjoz8w==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbdd6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZKLgdMRimQxpfTQYzWgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: mH3BBpm8moSTvOeuC6OPWSjKnQJCDlXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_053414_667189_956E1FFD 
X-CRM114-Status: GOOD (  16.08  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on first patch.
---
 drivers/clk/imx/clk-imx27.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..f2f0d3fe5c52 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 static void __init mx27_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *refnp;
 	u32 fref = 26000000; /* default */
 
-	for_each_compatible_node(refnp, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
-			of_node_put(refnp);
+		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


