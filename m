Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDECE98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=; b=Pc14b/YvWq18kvHtFk58UF54P7
	B6v4Umj40jawQ/tzaMjWxX4XPAaymInGezfE/xg2oxcDZZtRd/4wKRSHgban7votkR6YjYXWqPkIa
	WLaXwQNCs6HtoGK3HdLXcQjv4En5YubBR4GkweIY/yuYQEv8rztYK1cpd6l2wQofcWRfhScfjzLcA
	TcHGIitalgQzaj20pjsDp3LxwiFusOTlm3HvRm0tGToTljUTy8RmY12uUET9Avt2g6LQQfiGyxyo8
	w2o8L+w9lsYrEkwsLVzPVljB9XNxDSA4OpkSCF8eFvNS7+ANOoar2TDt4a7xJJTb8jhWb9eLpk3hf
	z8Npkz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtX-0000000HU8l-2Xxw;
	Mon, 23 Feb 2026 09:06:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtV-0000000HU5a-00Ov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKaO2A1972804
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=; b=ToyIMv+4gPxgJGDz
	OtTJXTi+6ijgFirVZaPLg6Jy4RUZZX/AFbbK6RX8Fhl71qcqqPoNGUpt+HIkIoYx
	KR6qVao5alntB2UyLJWIr5+IeFEVsdgt+LTmo7nncGhgyO6pWAx4qD61h4uLIB3B
	o90pKouDd3F14S6qyY3DuPE2J12wqRQSznVP4aELkujb7vuz8p90KIAiAPm7R3TW
	nZ3IliwtwLlDnho2o8M54txvXbR6J9bvN5gRnY8dFTSeyGYPZj/sxLUNk9NlpXzZ
	D1DSFY6dg5vPPwAMLMHoHqL37h7BSrFoOU6IELobApS8Ifq4umNQV4JoOpgjMcqW
	Vg84Xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum0fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5359e9d3so4205148385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837579; x=1772442379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=jf8Uz6OurJVBA2wuF9lRaMgYn9wr9LValqXS6fyLw1LwSjItMprrGbpSOBO0nYPJ7n
         gN4X8IkPIUefltFhXp78T0VB3r7x9ClqZjisDzbbNxVCCbCbffdt6ABGCXCTJF7QkYBZ
         16Vs7AWz/9cex8p6JfHcpx2j4+DMl747NrvbUvV/MHMho+sXciJikZ2o3KD2ba6VuNgw
         vi1qY4RhR6p21upvhllV+87L9DnU/8ZIXOzWmt/pYYAS+w3R0ukAo8z/xOcB2J+zNhT5
         l7X9W0aZtGqU/BCCec4exY3lyK33iixrDuHzLibbjb0EA96KloxRurblPFYDm2/3T1ZE
         46HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837579; x=1772442379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=H3TJqE0cCu/aepCkrCBK5HWX2CBJi91hUfrRcL/Qw8/dV+1aSRC001nacFINd+bTye
         K0XCampNNi2KNNqHNBicN3j6em39hWNiq2Kc9SKFP80oftx+e5D9CV2NCkqFI9NOzQs0
         EIxvZJgVBrH92VWxFgMZODqRybogdq00kLz3u3GBCb0CRWQF3v+ia7BjXfXostZoZoeR
         gWYVI3r4PaYfEwA88GMUEcu3pIUPILLKEgIEXpbSX+Aal0uKGMJu7pv4pIYIjDHJdOOJ
         qHWSHJAnHwRHNYswrJzhv7gWqqVAgUuN+bBI05bmm+YCZgmgpVe/p8ZOBhlNYpJ1I67d
         /GHg==
X-Forwarded-Encrypted: i=1; AJvYcCWSKzZmJDMZqMMyH9Gzmnb+FdUIJ3VvsIK7NQeJkPiZlsU+LoSo2NS6VLqdINpAUJFWQ3NWnCvmVguek90VildO@lists.infradead.org
X-Gm-Message-State: AOJu0YwT9FUFQWMdUYlsQhChPRFv51zoEWJZ+GKE7FxqUiHf75FhWDjn
	lHC54dMiWGaFZSDH852R/Xd8bnSD+mNcRp0I+lk429CbBbVTOBPBE029eSLE5FxbAEfUvK4UCWL
	WvW3guXonbM02SpR3XEtllKDstwRCp7oMEeevzV7WA5a8hycaS6MCeqthqCYf5wx+liAAf7qwr9
	aIyQ==
X-Gm-Gg: AZuq6aL6xGX6yHnrsHMJ1dNi45CK5jhj3hUzM/i8O5PTFYT0Slr4ytfXsUrObI85jU8
	8HnpIKif2Fh3sV9qMAHMAnBPTK5+QknJC54otVGt/iLx9e9ng8WOB2OsxmuFIctKDwtrmrae8BS
	fNfvrSDjU2bNjdGgBpr1aPB/iTQiljSsNLg5NhOFZ8LtosBxLkwDzLWj031AwHpFi+WcU2k3uSp
	6BreWrDwbTO0whKky2iLJ9C1rS6PijkRx0QfIc3Rfn4Tbzx71b2quCBUtqzGvleQQNzquhtRcpr
	vUFNDVAmcD2B8jTEflcv2sZWAutJYJv3IE4ozP+aguLAmlsXzpX26WXV9YvejmEoJUpNDbhMZe6
	3gwai3PtcYl3SLwRpu83/TN9eDeI3D7Szv+ZPrEo6rUyShHxBZ1MT
X-Received: by 2002:a05:620a:298d:b0:8ca:105a:f5ca with SMTP id af79cd13be357-8cb8ca6e5d4mr903346285a.47.1771837579402;
        Mon, 23 Feb 2026 01:06:19 -0800 (PST)
X-Received: by 2002:a05:620a:298d:b0:8ca:105a:f5ca with SMTP id af79cd13be357-8cb8ca6e5d4mr903307085a.47.1771837570545;
        Mon, 23 Feb 2026 01:06:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:49 +0100
Subject: [PATCH v2 03/12] i2c: bcm-kona: set device parent and of_node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-3-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhyCl9Rsm+yhDXm29XU/HR2ugRm1pVK1Y0CD
 7TkNCnQDmyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcgAKCRAFnS7L/zaE
 w7sLD/9SO5N/l8NkJMRZ8orITe68nCScnBshSzOQl8EaGa3Jvtk/L6f1vmYPYghezYgbU0WUPaN
 3OGPStzjSplnC5Uz1Vwe6MXVBKVTcbFm7QE2UOnTNgutHhrBBFyzeRvaVxQfNpFtPvVtANkMVNO
 x4gDOe34eQU2T/3XWReYHftzyFtIH5/HUN4lPIfv9Zmji2bY1AqKceOY3SGgp9t8DAhgDHMrriu
 3dDpBleL8kMsea2pzl2AX08+3SNj4BUPQihaut2B8qV+Oq4Aog2HlJ+o9x5cuCCGmlzuXzTR/kh
 Ia7RmentNuQ3hevCck55A1CgD7SXDP0osGD41ERDL//ZnADXc6bwgvew41k4GfQljU4dyloLXaV
 9d+QWNt1A5E4rl0YRPBya6pxjKsv/aGWyUH+k0/VXskdehU3dHYT/d9SYyBYEBqlk02LbEWVf3e
 IoT+UtOmEVc73SghWDbQu5u2keilAj8ivk779OFrHM3fM9bZC4jkEm1KQJ0a5S0LOqz7jxL8mMt
 qmkDF4Jr5jhmohm/R74LFaWAGcpcBDcSqpBxa+3shxx+3Nmv5DNW71aB7UmPbU9djdUxDMjpBFR
 hz1SlZPTMQYxf+zrDk6TVx4BnyUMUhyAOYttQlGV6VwcHCm4NRVUWGwJARKC2DnUtAJd4Si1BtW
 tbT+IjCraKX9bsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c188b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xxYytfOIdaUIj31isgUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 4uXuizFe6RTlw9xM2WASs5jESMs3Tb_j
X-Proofpoint-ORIG-GUID: 4uXuizFe6RTlw9xM2WASs5jESMs3Tb_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX/iK1/h5wwXOu
 hP94ZUj47lwrNsajogcYxwlgeTF3qeT285RC5XrktfS0ipwwFMfoHlAHyw473YSprI9Pelnpr8Y
 MR6V1Bo6noE4OIpERMjVCbMqD9j0epm9zrkrHR7JxBquDLbf5+MFYXlUA8quBtM2ptJZZdBR0M9
 lrDMfjUwbvKp/1xwmm8KviPL3hup7CFQ2fVKJY1bdOuj5vNQLkEQ48G+jD0YF4XlvKTtZ2XJc6L
 C4m9Mc/ArPSmfTwqCUZ6bVemq1MjNHXKmctNItUHHsT7bVdEZ1talgcobfoRkTktsPwtb8OvTVC
 UB6j3X5fOVMGq6vQBmfQ44n0KDkY0vDK1gamMcwOUe74sTSGaw7G1y24tyEcrp5O/84RGwhJvjb
 1cvgEuY+jbEI2v9qpWmme5H1PnMmaM33nULTbmDM7jfl9VEc54suJUgQkapgR46XliLasrrK3UL
 YqwEyWy2BYcQ1E0he6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010621_181689_4A21DC66 
X-CRM114-Status: GOOD (  16.16  )
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

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 9d8838bbd938bf6c43d9553d9f54acac1282f7e8..edd79689f40f451fc216455c9da5704bdc73c62f 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -840,8 +840,8 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	strscpy(adap->name, "Broadcom I2C adapter", sizeof(adap->name));
 	adap->algo = &bcm_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	rc = i2c_add_adapter(adap);
 	if (rc)

-- 
2.47.3


