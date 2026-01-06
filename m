Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B22AC47BC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=; b=x2TCP1y6nNurOODgyN8LTS+RBH
	GEQEofZI1iGpvTkTg1tCuaIqrT4gHjDs3CucLykPoXIfIi/j+QkuZeQYtFqfgz91CxtdmdK6ViAj5
	vRHmtNL77TY2a4oozCyJ3gqgIzeCo993RnMUgLnL3Aj+fzxbh0MKfE4LaGMtKB+Cj2ZGsKIrAXgdD
	ZCjc4IJrCBEAmrDhYB+q2MOVn8rI0rC7AeV5zKbMQ3ZlzxdRkoWIrIUHqfGB9Gh+4wL/f43HO4bSc
	0x/pDahI9urP2ToNKCGExpFTO69faDO7mQci7zfD8uXZX7a12jkZB6uGd55zcNEZv9SmVccpt3GSm
	csmwj7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AU-0000000Cg1l-3L8I;
	Tue, 06 Jan 2026 09:15:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AJ-0000000Cfu0-191C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:15:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QYN2529179
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=; b=NtyVQoF+ceBRN0bs
	ZCjO/WD8II10dIXjRhh26LBPwj+8DJQmjrFB4Cj9YMGhRP+c1CjxwUU+syFQgKq0
	/Qh2QqrkQq3SR7xNIJ+Z2fhI7/kQH5zCJDOtyLrfyhXxire21mu62dpmL4ySsXqX
	zJ7qDDRZ/gcH6vGY9Y8hW1fG7rRbY0BmB8xoJbTmxvH5gzzaUzv7KpnLNtvKHPXk
	wtPraP0WL3YMGPLtWpesV93pNYhCbCtuKYSxJXXlXclYl2TeL+EpEC/l0CzEdLge
	pwERZjupNDyWwzqWeU7ulWmbWZc8FqqBq27fznfJj3teew0oQ3Td3Dy093kyozJ1
	vsz1Cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu2j21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:15:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso24094161cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690946; x=1768295746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=;
        b=I5yvVjdNsn1denxzBbkiqQrek+tV2LHoELsm4Sm4yUTZNNzUJtnforpwHpO2k9QDW0
         C7NoiLqDoyUMaV7rq/eg18LVC3XvGGbB9Ii8lc9P5ODDLmZAh+xmnJep5ZOcjrlJqtji
         XlgiyAp2p1od6cedZUpmridIPwP3fcrICBGTDEMMjM+gSoVxnEOu79HuvMq0fzZBDGc6
         3WijgkNnk4LA3OUwIRiVfz3OI9YpOznMjhnKXsWTPhprmoyDubZNJYiBU33sZmsrtI9m
         9hoW3XJpso0zUztLgB6G+543atpjwAyYvuNVUCvLOQ7mUtxZOicy83e1CMzBPNgqA+n8
         D8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690946; x=1768295746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=;
        b=oyjX4YdMSFRWNqsg4A7diTqbLqm+9wVQZ/3ZaAWGr8uYs51T4IWlQAmkQtFFA0ypbE
         /x6+htp4EQwh0nZYh7ehCFJiN8jRgurBfke6AQ2wnwqKWXofKD7mTwQq8m8/HUW8m/xd
         dNorubXnxXoMX0L9IeJXW9U6Klabvbc3/T9YQ2QEacbtWWhehdUUqYmD/OvK6GeBO5eR
         PBCUHlgTxY3n00r8M0l9IopeqIRkULdDAQhOpGZb89F6mGPpIF+f3jk0sMkpTGc878st
         vO1tZeahuSpGGCo/cN+x9dorEbCtyJ1veckQVYtlcDb2nBmx2dWWgdwsRMq1KBOp97c6
         LzXg==
X-Forwarded-Encrypted: i=1; AJvYcCWq6CeNsTFoTR4wELled2HR4u5sFAzm5DKBC1BUEOQFHemEhD8JYkiNYCEelAVCJM82tYtyPzqwxQK78oKOffHJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxIkJ9+/1VtBtMCdlelHjURSp/7eju80DghG46Ym/8aL+HfTQgY
	eGhCLrmhD/CcIBFKHtrPuCkSiCw/gBX5mgXojiVK5ThRl1Rsb6d0fAKq6TJ32EQOUgSWHlE3ora
	DlwwBiXRd7g5fJx6bzyBTpJy8xT9+DW9i/o4MNsEoPd2DLBpgeJ5zzAUL0PLJSCsQf4mLjwJ6lw
	tE1Q==
X-Gm-Gg: AY/fxX6aG7T/c1sPQwWY1dSOzyIP+fKCj1T8vte+rbdK8Y0jcuvt50EsBbTHM5OLxjy
	wLgdob52a4lZN0YbeY0VbHfyuaO8XK2/ssrfRm6gyIhN1yHQS4GRwtjt653VIWqMJoVyjLIx5vo
	+tvoCnFDL7l9i50eNb+d4qU5C0FEDo7wDQub//ly1XA6P5x8915RUhQlDjJPsXwhkOzXKaZpOFy
	Z+EB7XPkKSAtQCv7QiVzZrHcOi3StQdv/PKMhfmKTTW+mJIj/iRDAIlr5UcVr0f/XIfRMAkhgcE
	P3WHGMn5UsIF1Hk/6GqArZ1Nd9DE20Vi8ryhhaGRbaFAdDaehx81BsYwZk0Ddb0XIFbEDHPrmv9
	01d2Y4NwPma23a0IVxKQyE581jIPHVlIPbw==
X-Received: by 2002:a05:622a:486:b0:4f1:ab34:a0c9 with SMTP id d75a77b69052e-4ffa782e976mr28103481cf.81.1767690945702;
        Tue, 06 Jan 2026 01:15:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+GiS707Ezd61sp0fMv7YHWgjS4AynuPW8/ntoYHo/pOSzK7gjRauU4L2KRKcyyV5Q/7R9Yw==
X-Received: by 2002:a05:622a:486:b0:4f1:ab34:a0c9 with SMTP id d75a77b69052e-4ffa782e976mr28103051cf.81.1767690945195;
        Tue, 06 Jan 2026 01:15:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:18 +0100
Subject: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=B2RAEF97ngkNBnHTIi768G91uQ5BuNJ8Fv2Rhei9uNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKn0NuTErJaGzdb4wCVzMIKofdqMitWHqhMq
 EMTzwe2JBOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpwAKCRDBN2bmhouD
 18PGD/9FFNjyRevfgPdzpoydpdTM0f0f6RbmG4ZFfdELpbX7T973V0+MVSxAbrtEAiCSpiGv2lb
 XekSg8Su9wpX5jTWIXiR6qx+XCdrn3wCNm8xz6ZtzPGSPwd51hEiIOAmHMk9/8WakntDOCqmBFs
 DDff7uGHZGlsFnmRvh3UnL6nyxD2HgRmwPGfEuvjF3XVh62KU0F/rAuzZbDw8ebYL+FgvAg67df
 D8E106iSvRWjyrOhasN8Zi0Q7EJTyGWcc69ScNa3U9R7BsZKACIWooO69WY54aOs/PgxgBcXLSw
 2f7QWw19t9X5tvnxSJthY2zHcBwlupi7Bx+m5NTOBl2LCajdFgES2ramoLhlQwdSJ8i+4gra/K+
 i9hBTemvE35IHyWsXLOCppibb3vyGXzmxYhXTHBgtxelsicK6hUZLNGHUkPbO1tA0UybdgN863+
 x13nxG+wm74AHPncWZULH6rmNykZJ/r9QkkguX9BW5NWZ8KMkIUTBJi7Wo6BpLGUFBtWdsOUn6b
 Kowz3HrP38XO64o6h9ZwV4Wu4qCruCojveanB5yc37G4WiPATUPtoJ5H06RQ7HqkIF1FXlHx8yf
 OcI0QHN+fBdwvlCcXF49fS4W27bN+Q6093BKrwmTx3hp9/EJFT61Ey44RWSslB/UXFKQWZtYjRL
 gpsx9atEIP9pe3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX+RBAo9g/DpNL
 C6rHHHL+vzjFDtnuZW7WkW5+EEwh3q1FvAamtsPEyyjJTmD/r/Ozp3bylqOm1unxiimALY1clrt
 VI1TmIdSeUCMsrxNCf45vqExn+vEdKbIcQjdUZR/rwwDNsbWiEpExBugVOxJYgpiEQoQ+BuGCYc
 tE45UHWr4AyWwg/mYGNfvQPsEw/Zf2qez4jwx80iwrwbTPBFRN7dTedR6TBaHF3nu45zhCTSReu
 SkNbx97ZIDTo2Yv0Cdlodu7qO3riwUQgy1yOEwTjKiUh6AnnAYU1ypwWQqRY7w5LXx6P6UgOmqA
 Gc6MDhdrf2U9yhp8WZFd+1fFFx8pJpSHGSZohtUg6ODHdKYsSARuKTQzWHwG8w+CrMVeKXKfLgP
 KI7w5GWHfge+wpKTfkrIEmx7tXsIxvFsj0EWneD6mnAlyfG9yN7QIJYMFxF3iq0oezlctWUBPmq
 6GW/8nE+WbzMmFaKfvQ==
X-Proofpoint-ORIG-GUID: fQNGWDCkQOyIdguW6j3Tm-AaX0ooyPrT
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695cd2c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=75aRx82TGYjwQxWndmAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: fQNGWDCkQOyIdguW6j3Tm-AaX0ooyPrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_011547_338280_4E0D0187 
X-CRM114-Status: GOOD (  16.98  )
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


