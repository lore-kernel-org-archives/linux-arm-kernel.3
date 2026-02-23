Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5463BE98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=; b=i3fCW6o5fg2YQqAGUWWQx0AsEu
	3uvOajb3MST7tYO70RJGphRRpi8HggEu6Z9WQSAaU6pXMVNc5nTfDAzlvw8arSDgIai69XAH751xn
	9CmNpLGPgTCNYOMQJqMhPuoVQlnWO/ay6TlilFDIwaJDnr2hohjZJLUzNUofAMwP0HpC8xOFKrncu
	KWKEq3Ts64r07h0QySG7qZTBO2aYI/QGdaB1QQry+g4i6YfjftnONCKAwlMaATLlYezl8M0u/KGSR
	8EdmxO1LsbY0QRi4scgOjJesUzgK9Tb/rNDROMLeLw+3Xj1G0NxvSrcIO+q/ujHzIgYp10dQ/17oE
	3b4iu3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtl-0000000HUQo-3pHz;
	Mon, 23 Feb 2026 09:06:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtb-0000000HUCV-0lLG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N85g2w624267
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=; b=VohCfQdIzABLDJmb
	Fw038ZU0I0zohd5ZrlgbtoUHT0ieW1PFZXc8rioSQuz7MeTDwfTB8XscACuRc/Jd
	nUaOZ1g6xn1krs6hx3IM0wp/eoG9ZHT6JBAMYLidRoP8ogNZ4Ur4cdUvm3vABeex
	pTlCGPUjnNdVbxz/D0uiBmYgDN5vRVENYXBOsPjyUdHCLW9bNPLCywWZlhPxogmV
	Sc/qCB7kBRTt187PfITDacTUfcuzXjy/1e9A36D3lhB2joKKWdOkQhCUEWwlxQpg
	+31mliVns/XJIeAz4EjcCJYUyxRRVKgBNEJ+GOwRRkVWxgzmgJEJuZ0nCqcO78Rs
	jtFvEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9v3e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so3439426885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837586; x=1772442386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=;
        b=iXBRsBAByJVA7GmBIpOv7DxbzMI6o5tl1aoxfpKsjjA4HXoBwQBZuZ+UIXKLe5Kw1A
         RYT9GtlwKBuhO8yx1mp//Yrjc1k14Dub2qbyQZeN5lEq4MUAsK8dP/W4f0lDoo0J9V1f
         eFBz6y4z+MXV/McF7H6P5tXmYSltZFVss/pDAz09JJu1SO62KrTW1eqLrFYUtQ+M+9FP
         5aGRKgtjFaEfYOurFbWP7fEt632WpbYmtkDfTS5T/yngJCjo/rNExu2DibJ3ZskRLq4E
         v+wuA8bR2/cR9JsJVeOSZpkUYvobh/QH6xQZ3bbSIV8U9kFeRAukRrqSMa30TkQg625v
         XNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837586; x=1772442386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=;
        b=rCuzFVd6Mb6ZAVDPeDSihaYGgPuTdPWoJm9hUkP57VW05MnSxdbdRYLQB0wdVc/ln5
         YRERL25F6sbrBaQniZC9DG2EiCToM3/xh28gn2qtRg43VTG/hFK52L2T0Of1bekaiIQh
         S3UADeMqMs25tjK4oc/m4n0V7onRIAjEkcLwF2O0R4tMT+FS4grjq+2bK1970+R4afCM
         DwW2/OjlHfE8+94iOoZl62/E9T2EKeGdZ5K9yW+J49etg6aZR4LLfeeXjFIJoIq7Pra9
         u5vfKsLUOeadaSkf2DrX59tYLKmBXRRChMHPo56U+eEZqlskDdqztMUuWWyQm6YZkSTk
         dBlA==
X-Forwarded-Encrypted: i=1; AJvYcCU0/a/MqmGwwOaFZKQsW08teI9e94dukp4sieGVgMt8sZ4lFTE33PJk5Cm2zpZbt3MxHJgE2gr5mWOH5d2bpGSP@lists.infradead.org
X-Gm-Message-State: AOJu0YxDxcbPPrCPVJ3Gio87qJlM3PI+fJrryqNmNy8cFzPPhtE24ued
	CQg5Jes6itIHA+SmnxcJr++t/rVBaL2dcOIlmzMkZ5DVQO/Hx8vpoHyaR0J8dtIpFcwPw1eFA8A
	EcvSAJ//FDWQdZ+08IAqw1KOXZomwsbEMhBw43PuqGII612H9xTwfeAjpQV/ov/AAFDzUAvdUhw
	uXGg==
X-Gm-Gg: AZuq6aLsO/M33JNibC8VRArw4vBVD9PTu4wT/n0+Wc8td3sDtLVPfzt98wRecWuUCrg
	C9BwMiFOT9wKPEdqeF2X9o5QtovIuMR1fyaB8tSCjMdJb6CuvoDtOLwImfFeswtjc9ps+cGc4AC
	wO1/aMsAdgR840qnq3hfFGHtbih0GgfMVHB+w8OeX2qfb3vUooumL+ClX8Nx9TE1qWMc+RdM0Bs
	D+kdab9Kxa1fw+4pU3qBFfCkzolBZgE+AfqKntOwGalE92wmtWnLLKP8YEnxlj/8IBrcAY6tqTX
	6Mo6e7CNI9eUyo5tYxju2u7MwneAOIrWP6U8nbN+EapldqX7HM522vMu6XmT57mZocIp9FCmAy2
	wNSDaymw0sbFFwwDMJB4aV4oG9XButUFGE2oYbEDytY9TGRk1mcPV
X-Received: by 2002:a05:620a:25c6:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cb8ca92ba2mr819916585a.81.1771837585694;
        Mon, 23 Feb 2026 01:06:25 -0800 (PST)
X-Received: by 2002:a05:620a:25c6:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cb8ca92ba2mr819914785a.81.1771837585240;
        Mon, 23 Feb 2026 01:06:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:53 +0100
Subject: [PATCH v2 07/12] i2c: st: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-7-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rx2dtWdEbZEet4K2jCNLxIpDHbio19pJqqBXzjxrlr8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh352YX7S+FxODzw031A6NZFNXTTScBQL802
 bH0eQGAhDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdwAKCRAFnS7L/zaE
 wwkxD/93SJI2I03XT8QYkmz2qqEK1l9t+/u3zcfCHXOkN4VxZpbr3NNH79eKM4Izeho/f9oZSlt
 hpXtbZ1986gfzwMjem3xOh4LrMM5uwhAkYvTyq4h94Z1kR0U4CdqMyz2dFTrYQofwtaEaq0QYtW
 2UsClAH3A6oAmGMw84nzOkOWezWyuWVxKZu6RV7ZQsu2HqHBrksHdxpzAj07PC1rIUIKlIzWeMd
 Gu4R+nGnEsYBsqvU9UahVeDs/ElVSq+sMVG04A+OpeDoih7meDq8ZksVqmkY8aS6MbPgErpJ14r
 rfdmmPGJ3mPF/Mh4pi+uFB3sHnbzbQFg/O8iIZLC0uwQt+5BH8WIDZ0NT3m8EVRfT1Rbmn/Dpk/
 O9Jr2qQugx4m+eo3nFBu/ofAUZ6ode1AkJY10UDo9PneFzFVwYZYyIXmGK/AjWCe73SSYxRjqHp
 7iJNoHcpQ4MRGF0MpGRK5bRPzXF1YQOJtZfABHxUlTVVeBrYthBuFfzXcSV9riTNnNnMATVbp6Z
 IUghQTpX+9+gwWg7mnnANmCyfmulcIHi28C4mPCjS8U4rx45Sl3FDmuowjI+94bcn+XCPmgKlhx
 SFf6HkYKbnTMk7XUh1wNeWm1TMpJhvYhbhvaZ5Lkq3PUnPnLuKmuGtFdtewCOPT+JqzC8AkG8SB
 Wm+qW7Ou23eA11w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX46Ki24sZlG1i
 8Zq+ulhSD4fHLEV9lMd0K2MUUE/nuwVshuBivzYBz2ZsoQqJM2oBrvBwf06Mogutf+C6D0AES+5
 2l+EtWokJ8tXbJmgfput4L1iUtMTeT9c0dlaHcbo3Aybh3TZ23QJvn+CBcv2L2tbrB+3tNYZGid
 QeIWhREJYbeqrflr5c/e4nLc0AKCjGuTg11J19krUk66muQXf3dljCtu4ZCBJSDiMMAToPZpw88
 mfz0GYrJ8CE/DPbUNp8hS/WFT5qs97h0sjMnk1wkhTbLNpF23EneZvdNybvTxCw7o7hXLQOUa6q
 /K2E3d+1NvP8FaL2nlmFlU/URuzt07Eq+5dAtDcYYUKPUazFPqf9MhrrDWLDfgiWgw8sFcHeCos
 +/oq7cZ4Cwugn/fJ2Q+Kq5R72gy2aimweP63zLKwwtf+hYCtz9YCCYeWgpG3jGNhWKqhRPOK5Ra
 F+qP1NV87EMAAKDKYgQ==
X-Proofpoint-GUID: CXsU0fB3IzN0CO8mgRbsgldHwtozQVLJ
X-Proofpoint-ORIG-GUID: CXsU0fB3IzN0CO8mgRbsgldHwtozQVLJ
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c1892 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=8b9GpE9nAAAA:8
 a=EUspDBNiAAAA:8 a=5jvZOilLG3lo3iFWl1UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010627_349231_B90DD51B 
X-CRM114-Status: GOOD (  16.72  )
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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 751ea421caaf388bc2337026e0860707823546d7..88ee5dfb55e469b64537694224a0fe39008a80c2 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -850,8 +850,8 @@ static int st_i2c_probe(struct platform_device *pdev)
 	adap->retries = 0;
 	adap->algo = &st_i2c_algo;
 	adap->bus_recovery_info = &st_i2c_recovery_info;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	init_completion(&i2c_dev->complete);
 

-- 
2.47.3


