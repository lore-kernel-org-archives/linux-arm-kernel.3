Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5D0C79F8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=; b=lkp0oQW51+SKwbw25BBV0WSyYO
	qQ0TKSjg2Lx+n4YX0TFhIsVMmqfKMon8vqePJjwjuZLos+BZ8QAhjDgr5FfNWbW2vv0hsmVaxSWwK
	iXHq7g/lJQ9p/+JimiuNWvCPaK187jLiiDFSGTKpAEZjyVtMBd+DpdZXSJnPJATVMSP0YrRdav/yb
	uMYADIcnYsJwtZoAdOAU5ao9fpl4zOfrVDjdV/9HIO17RoNI5SBAsu8XIGH6FZsiAbZ97f/ES5v7c
	+1d+hFy/e7d86Wt1jDDfgquKOSZKxOjHuL3YL1a23N2v5QzGJY4WFz/HXnc1fdgmxd6GbV521tgA3
	I4DvDHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckj2-0000000BTIY-25vy;
	Mon, 05 Jan 2026 13:34:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckj1-0000000BTGE-1K43
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 Jan 2026 13:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=; b=SBRN75FMRQZgk8o4mgNuPI5F3a
	qPLW2xPQhhTgGRG8RlQ4jNgW2wwDWey4ze4N+nLSJsGgXKRpisfT7/plyriaBNiUxRSeR2cBPFqJV
	wjV8rKa/mxLwv7be4+0VTh5Zsg3HuoajGNoQ/wOT6SWl4MgpYstHnD0lOhc2cZ7+uJqWcJz1OjMYU
	16i5inGS3NIYPVEmRWj0fx7c4B0i10984kcENT/neB9aLEIFKZEEPVVOaDBv0iwZjT5BIWOyMCPuP
	Gr927N3pWi0Eex0mfStKqNqBY5vicukbLoNXKA1R1zpSbUzTU116RlpYm5+t0j+QJ9fCOuWsoxJbZ
	bpkgDmWA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckix-00000008Iea-3bW9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:34:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058L33k3652262
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=; b=kTN5IPmHWAYwIMY6
	bTLm2FRvrzsWg0872uWjazo7CtUOthJGNScCOTLOWLSf6G7Xgbu68N72t5VmBtj8
	V1vy6UXeIQ0QcTmZ9mLevu5YGYBvojNHO8KM4IXlI5UqJ9axXuAP9wjiLzoUrRwG
	55sfv3mDCLAJYwKE7B20HFLQa9Ri0ZNQClVaA3MJ3WNngbl7yK7cZKQfIyxnj81n
	ggNcNLySHHq7qb17OzIvJo3zg6wg8sHNiClltJc/kYgue1GRnG2zYnbKO27Fdbub
	DAFZEg0Pt0XNzX8FPlx55KdHXpmPCiTaq5+p1Kk6wwMq8ZlJSBp+7iKz/Hv1Rbmk
	joMj9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvswx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:34:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ceab125so390239041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620056; x=1768224856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=ITOHw9FEvd7/kPLT3vL4brZ9KivMk/CZXPPSqSFFafduZFF9aiPpCDs1Bx3C9Ti89z
         f/FoIY4+WYkSSfE1jDq+FrDjBScKWbFomKTZAZdjGj8LE10V9rHthAXA/brzbzHLd/wZ
         YbD/vXG9vkybfxweHQfULpSOqpz97BsuAbMjIimfWmnE+mVV599KGcUeWTaKjrYhE8kt
         I+U6Z+6A7afoMd0oT4Ckckf7AtphsiKj4DW9vKUt7o3Xi5H5+720x8zLYElwSCa48Bm/
         IGUGY33Q9SBZkyH8iWz8hs4ksmgoMhioru7k330hBswNgezUzNkueC50CMep3eY6/65m
         /Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620056; x=1768224856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=gcnjyyiwgXUZicjWAdEX3B5OTtusPA9h0ugNYww97GMMlW8jQrZaenzF9KTm8PriqZ
         1vevh7nNSPBPO/rD14Y7zavzu5jLwInIozC0qIW7o5gSCK0YKr3WLmLfx+f9GuduPqAK
         drpHOlhC/rxC6eEy1o0Q0ZtjHatzGvzrW0t9OC9Rd9dyzbULXBrdIfMdlUAnb6JA3MJ3
         swYCHGEWhbPJO8HtYFjQ5DuVIxR1Z+6sLEhw5GXoWNcVE4UkHLSXAXmNDSFmpccL9O6Y
         vJb7iEFR5+du87iPRu4q1WP4I2RBeo0FoBIEXDM4SqzCZDiaHKUdCFGkUr0mtff6QZAP
         Rqkw==
X-Forwarded-Encrypted: i=1; AJvYcCUHdzBtSwzQq3MgqLgiEneM44n8RzKrwkCbsSF4UBWgi2tf15dxuIRMO4dX/U21hb321XGpsvcmQ1Hca7qmfp5k@lists.infradead.org
X-Gm-Message-State: AOJu0YwWGx3hoXwGNzS3FzntGfpduyDs4HP0df5MxxbhsZNdULxsgLw/
	QMIDWrwDZ3Ejyh5Xr8+8cYJ7DVHY3d15HRDYrMe44MTDjQxKIBNGMYk5Mwtg2fkyVtUc6o+1shp
	foG0crKyqs/V6xceC3bMTvE1kIj68qKV4xskGjBRJVesBcdoub8ypYKfdZ59/KZxyEUw5G042EG
	PwJQ==
X-Gm-Gg: AY/fxX50Z/+Drtigl/ulXG7K2XQM2OhWTwFMBD8DuBwdL6o2KUYnTyz7z/Og/peDszc
	cOoD4sQZ65KEJkJlLm+ziwmNnTKH6Zj+DpHH5+BJZ7bHOABD3k6gO9gwx81gSC6hOYltyCzZjGB
	W08hq1dwGy002bQQW11G1Hougeo588Eu0Kt1AXClN5KggJ6j1DrBRrjXzFoWfLG6Xynbf48HN+Q
	iMzVCINx4QPvpAmtcpCyjVFqBMtAsxbaTzUR8i3ZDuXNYT+x7JPWBJeNcysOV4tnEe3w652cZkj
	EhqFJMm3RvHbxyOYVmwD4vvY4Dl6IbhiR3t2YNfbecEBiom0d01H+KXR2RlJKjTBDIzhlG1BvZ/
	6huw4RqDTzJwTuMsZfnkJV9CbqBwVtCMF/A==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849343161cf.37.1767620055819;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvCss19TuzHTSn4xc5KfwRsOoyqP2KDps/f1CJU56eHf9wA/2/5GRqU+YaxUO4C+nFYpkDnA==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849342761cf.37.1767620055259;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:46 +0100
Subject: [PATCH 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wadaFrSSj2BDmJ3Y9ZwRT2wmM4bLw1N+eXfF5sF3PLA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW728Erceuq7BAzG0tJPUBxSPGgMpB/EHmi/cc
 Q1ZyCkRLGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vAAKCRDBN2bmhouD
 1zE6D/wIyBX5G3Tz0OKc86+zlTFfb3sgWPJPG2/wE9P5S1QCt8BMPbgtOESBU4oTjXn66148vpl
 4XA433YmKdR7SjWdruBtZOqiX7mSmQX7D+8XZlzsjDmqMWDshv3n41mHz4BGlTPsmIVG80LeFfK
 STAvr/njh8HCX/m/zH+CrDN13GYwT3TzdmD7vqgN6mzGCpWHa03kWlTa0d2Bp5aB/1N2W6DB3XT
 acNWdBnPZ6dxvlZc3aqgTDyQw2qfuUOLW2oNPKKD6lzpwYhMDCapLOok42Gd6H1U0OOl++WqP9b
 KuYbkdEqhXte22rq3yX3IOCFTL88H2iTL+ucTcNvzbE2k5lnbidNefylPrbT54uegORpnd6cp+A
 wyr58AVOWkbYBUvOwHu0p2gjbvVMXCTvjRASpUORfyC+/eHriePowQyW4pSkRr6TKufiu/mSDxk
 BsG5gwL07OGLc4LaBJKhnFKbNcokTq5Lh7z9zSbhb2MISrgYXZjF01TISh3QIZ5XsrKILL4iKW7
 XhBXMbwi3s3zYmfJUxdLjtJJ/rMqYOkG+BD39Jowg8p5T5RstO/N3aqVr9AfjiMAKQzyr/njdXy
 dlH4tFltIR7kP3B3ceyM4jdNp6Mi/8elfSx3k5QjysshnK68eMtnAnlIA4lsOHWUIfFP9EFpEqC
 PaSRKa+5UVrrIBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 12S2A34LucdZ51gW4gpY3QMLnkeDTRfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXwqWxaZIyb10l
 W5cxOiZn4r4iV/s8/hF8NjGkaOiD6T6UK5qtniYtx8icgVHIya5yFkhO+3tAxc0iD2PUsZVA7Bv
 udGgbmPohf6KBLZvBCM7Kw6jsmKP2b/IOUVbVfCbVL6OfT+LhK2lDlUZjeIfp4qQpuzaIAhDhHI
 G3+qLzIYLvsyTiCwZ4C+4hN2mNy3E24JOuLFz0esB21FBwQ9gxsxhhtP8WSEJW40qzzAPTb3+eB
 ByakqT6LBH2gawh1PKaIFL9lijeCKtAkyBrHLZvDSn/U0mcByGlUjZvB4HOCrgyrlieMBW71AYv
 HL/Xpd6eKlDNXWqBQ5jwFQ9omvktiJja9GjImhFnczeEI8iobMC1FNtwHGWsV/HrHk1hwc1a6KX
 8iZQlhS4cA+UbxeE5VWg2ey4SfeQjdQiJ/hONMpxJRw+yYWvrKuVoYTMSQXj9mR/GGJVXYp/SQp
 r/lt4scaFf7iQyNdiZw==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbdd8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 12S2A34LucdZ51gW4gpY3QMLnkeDTRfD
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
X-CRM114-CacheID: sfid-20260105_133420_493136_B494D05B 
X-CRM114-Status: GOOD (  16.04  )
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


