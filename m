Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FCDCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 05:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza22wRUqSHM=; b=yS4/CX20wNuAWaMz0bdope1AJ9
	WuKiT4hTQQc/TQZC7YHLZxfxY81pSeZRf1pQNjSa/mmzV9Hhn2cg0gpVQHUpAZwB7EirA5E9wCQOK
	1TvT5FxPyGJpcTIoBTU4dxDz6sDaeLW5fzM2WiXTKLucOoH8i44gOXVXy3ZkjYajY7AIGS1H+nYWn
	zNp36EMRw0Bmt5ynV7wzdGbcc0XCeCXlf8kHTjO8hgVBJk20cVUjLNqyFmS8bWo7MxHqaEok+VOpg
	bB64FYWfTDoKnxSEXkkp9jIeZ53caruP91NL3z+9Uc8wXuGl6VPgW6M2Z8O4gzPURiZSNiSJ4Ly9N
	Cl4QPYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbu7k-00000005kLP-2wRN;
	Tue, 23 Jun 2026 05:56:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbu7g-00000005kKH-45CT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 05:56:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0i7E92839629
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza2
	2wRUqSHM=; b=kvZ+qfxzblWnPpLzCCUN9E6wVvShPr31cBpABbm6nK4SxP4yyVI
	GjXxtSY+TL3e0MgPrvX0cH7ZjE8MAEJNwma7kjZ4L/57I78NgghSgubLO9UkYCZs
	1YuUzvDlB3QKJ4FLKO/bz25JQMLtFi4b5AefcIm9f+nuk0oidXBpGvwEcGH0wNZm
	/ny8ObuL5YF4XGRr8AVJRrCTta2Mz88woNVWYo5ZOXONjePyaphg+jW0xibatXYx
	EoLC7Gr5J6WRP/CFOKaThyLTPgTljERJIBjA73xs24GyRCqFlVaVaC5ysVlXLacL
	n2Yj7PSGhHvXdzIwWxBnlSzNnAs7QL/PtRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37hbsju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:56:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158e75cbc0so863918885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782194195; x=1782798995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza22wRUqSHM=;
        b=STIdrMIigvjWXI8IapFkhmWD/xtT9c+kiGv9NLH/g+gYCxmPCrZpAWB3lsMPBLgw3B
         7Lel/5Vkwig/DXQmuXZH9A06/onxpeEuAHNTWt8O595cog0fREO6BjPxkYQ92N1+GXFD
         1wv5nCBC01yHt3GFf66FkzxPQEfkXWQ+op33ALYGwjsoSVW4u22mHnm8rIHczry2s2kK
         Ze41wjdrqzujxGXatyBMSEfUo7VAMPfz3qLF248oN1x12W4Vd/QYTywPFWhXeoPqULI6
         kjLXQf2GsE1hYtN/PrezPFJrIf+PI95to2Vs1rWEW1LCwCm7Gilq6wDBY97uTkCGE3Xw
         tGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782194195; x=1782798995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza22wRUqSHM=;
        b=klFpGPksogZhydanzwgFyICpDpnngRtaS6mmYOv7pbitvVNBQQgYG7+PwG3xtWSpY8
         WLn9j/phKgQpfcImvVhgRTOb23vZOG7vHjBQ+hDTyGmdIQGGYkvDXwplpNr8ppQ9H3iF
         HH0D6VFVonlXZNuHG6gU46EWQVUu2rjlxE5cSsPyLrQQ/Rwo12B9rIgK9xlewDTRh4HM
         8lhE9HXiPvjU4X0wUBZGYD0b2BNk7CL+pmke4rVJsKctVeu6UmJp5/+yBN0cr0cLRnZ8
         XyrpttmEyUOw47YO+KAItSAwp2y9LRMGlCedAZduMCv5O6gKlXd8SbLuGP0XjWG7bodV
         5v1A==
X-Forwarded-Encrypted: i=1; AFNElJ+KrPw3VB6mopFAmfWu9y9XGplJn+YbX9tpJ2iL+qiTu33T5tYiL9vF7FdCiookNWcqgjqieg1vcuzqR1AZmvOP@lists.infradead.org
X-Gm-Message-State: AOJu0YyRX6vBWNDB/TxWWAmW4G26zx1oulL+KjO7DeGOOEYYVlGCqrmZ
	bddTV+fVyFBVjvyesntOd7Q3F3u3apd8tLPi0ZVN43A2ncUril2lx0hkXMQtD/zkW0wgrl+dmRF
	cFwGVifqBXaSSEW0PUI3S+tI0dxiGtxIUAhZafokIDdj9o3yBJEPb3YVV1q8/wR3rRiXUVXywbW
	4pwg==
X-Gm-Gg: AfdE7ck5nWtluTD7WFcVLnsm4PQwpZjLSaBA2DPUU7u4R3NjDPZtWI/VMU0uzMAiwpZ
	tWiIhCeCejB9cgoO7hMv9xI36kTHDlkEeaENssd39avb1YEc6IhYKxmsJasivVWK2h45cdT+nA4
	ERtYuIi65SLfAs6wHZT8LlfR4o7N5iyFATs7a6uJHejPovOmeuglR/1X49omJkLWhyRKM8ACgvN
	sKMkWAEJtDQozq6iSJ3VrwITP8tiykeio+JvHpMnX3/TRuN4686YKAJb1WCH0FuME51mvDrzBsd
	rGNyNXQbmkWVmzTuGXcCg1m6ia4HK4S2f19H6KhTH77SjtbmdnZceV4pNR1ZRcelfugVZm2oM9o
	f6784ZPfbBfgYfZuYp+VQIEbged4=
X-Received: by 2002:a05:620a:4481:b0:915:d32a:1cba with SMTP id af79cd13be357-92646584105mr267944585a.27.1782194195102;
        Mon, 22 Jun 2026 22:56:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:915:d32a:1cba with SMTP id af79cd13be357-92646584105mr267940485a.27.1782194194509;
        Mon, 22 Jun 2026 22:56:34 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm472730495e9.0.2026.06.22.22.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:56:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 07:56:27 +0200
Message-ID: <20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=38hp3yau3RDTeW0oghznzoTSMclkrDug0F9GSJUr8b4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOiAKYsNS6tRKh5vJxix7/ly3bWTgUxwiqMBSo
 F0mmQGmFtqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajogCgAKCRDBN2bmhouD
 11mQD/4n+LkA+3kQ6RSk2nVSLPIh+GVx1iNsnmEBK0+sjPsuWzEyhtFCkt4QTnaac/9wzAzM91Q
 UF27QIyy80KmCXPSBAXSGaD7G9WOQ72IdPBOU2liUucSQ0qSdN+oyd7UK/l8A6jGhJzp57sqBol
 gX19h8Byp1PVTjJVSBKpNKoYJIYCiG82MqKA7gNXGXL5/IDODVDVsneNhoJS+Mjtz7cuPfu5YMk
 EvQPIXCGNRWOxnGuihKh7O9JnfaWxXyzW5LGPWBiSEbQL/sZiIV6mKSEPh+psP2cSH/cDlTK7TD
 jcHuAHHQJmcT2qYNbLx6X9lNQf/9McOngnRHGpTW/82sPvg5/e1xhxTvxesJayz3vw+pIWq4NNN
 3R9beskLV9WnING8FFr7EknYYKmKJaKDZrp29705xjaI9E/2HIkrmhSWeluX8tASI7JVGQawmyA
 V4BIcHTda/ZQ+aVDrTdMQsxvI/PWCXrqIhqvGCiRjr3zjybX6Eh0eSn49W3BE2FMfoUHoa82TC/
 VBbVPXffhf36fPRM9Chl9EFEilnbIIY8SmPC/ogDRlv/i9YDassuN6aGDgLLchLIdnb4mRgsz8t
 009ChylQcO/SkI88HDEoSzGhH0ZeK0J/2ngpFMEzheiWyBAncO2f1XJmOiA/cUE5kEGEEfF6uAq UYWs/dOg3gQOJmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vdwcZy8pNWSCPeSWdbKymwYRktT7v75c
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a3a2013 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=OuZLqq7tAAAA:8 a=hD80L64hAAAA:8
 a=VwQbUJbxAAAA:8 a=Dav5TBI4JZG5gbSsjs8A:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TvTJqdcANYtsRzA46cdi:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0NSBTYWx0ZWRfX75jY1AAdYw84
 Tna6Pvqad6d7yS2pVbwEhYj1xyTiX6d+CfMQv0p7/OanvRsjiZzIENGbDETS3814zohVkFWGD2M
 xkHxaCyUBelqxEO63wVAYz2YNPkLsOk=
X-Proofpoint-GUID: vdwcZy8pNWSCPeSWdbKymwYRktT7v75c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0NSBTYWx0ZWRfX+yUczRQvrtfz
 JKGqrhY3NywVCDUbjg9GU6Bp9CHNqBoqOMRzLh/VZioO5UvB222eQPbKhGtwBdBYY6UGD3gN4/u
 /pxeZiD9IA71QzxGOaNWe38WZH1m4S3YXwnrzXEZ2U1xEUfpD4OgHibbsrkhyz0BUiT32p1zPiM
 8kSxqkhdn94kwDPb5a9rFPRp6W9O82vp9wcckSbPsgjHEav8Zjy11UV7GPl6nG64iRcdUqc5NSA
 VE42Sg049PlPus2q42oFZHliU3NdEC6KxMEcQH8j65oaxhBHiMGjDDil54HQZDiQpL98HCOZPo9
 fIwdNaHy8VlsqC2614cspJ/K+hMhzwBZr/eVtGdtDSGNiZYcR1aX6826lu7FlzKwzL9v62y4Noh
 FxzxqsO7aZSyXjb2J7vuEHUDdUVoxE18l6mtWhf2+iKfagnhEtDZGIeSr+ukIImklZdS4CKk4fd
 xeZJkPLCBBkRQC3Zowg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_225637_134250_919D7C5B 
X-CRM114-Status: GOOD (  13.82  )
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

Replace permanently bouncing email addresses (550 5.1.1 Recipient address
rejected) of Adam Skladowski, Sireesh Kodali and Chanho Park.  There are
no new messages from them via other email addresses, so drop them
permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC clocks,
because he looks at other Samsung clock hardware and drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Stephen, can you take this directly?
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 2 --
 .../devicetree/bindings/clock/samsung,exynosautov9-clock.yaml   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fc0360554f68..9f2b970bfb48 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -7,8 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940, MSM8953 and SDM439
 
 maintainers:
-  - Adam Skladowski <a_skl39@protonmail.com>
-  - Sireesh Kodali <sireeshkodali@protonmail.com>
   - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index e9d17d48b4f3..3dcdfa7a8792 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos Auto v9 SoC clock controller
 
 maintainers:
-  - Chanho Park <chanho61.park@samsung.com>
+  - Alim Akhtar <alim.akhtar@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
-- 
2.53.0


