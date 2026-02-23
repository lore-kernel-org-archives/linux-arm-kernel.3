Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720A4E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=pmTkVmPvUmhBg7SZvnrvMn8MRJ
	s/2EEwbmpuJeKH1HsI97zDgaJCeeThBOKb2mT4PWfh+1jv/JF0CMMUca1BzLGFafutSl9QpxEG+lq
	+iVi4w4BkAyE6d/AONFndih6HaESyAncOjaGlQfzcV+wQ9GghnqIIDaQ1YbRXm+NjXTY48VndTokh
	GHteS0f6oUIrVhP9/GM4AMflOqSedDyuXLLrJvKj8U1B0eWqf4koau7Or3znYVvqst7cRudsu1TIl
	iR9sdWFcGCqf3NBIOefvXp4VMpYvBWYZbBThNcxUjOTDidKltj4qvswAglKBLgel5wpmjG4CmbJTg
	Xv/b83yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS00-0000000HViI-1nWd;
	Mon, 23 Feb 2026 09:13:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRzx-0000000HVhU-2yYC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:13:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNHgp31778082
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=ACBMi7vxntgULb5J
	Sm4Of+obwXTOgWEcFFHqcz7jBmTUkJDiJTEQFCDvLXA/xcEcfsWZIKkvpJx3ELvl
	M+erOMeO8dpd1F/M2lVedCmuT3cVHAdwG8QZZmS2AcVRcWyv6/4Yl/7kFgACiv3r
	M0KpB869Eqi5c0s0iM3GUF1eXjREy+S0P0H3Htf/nB3cUKlS+f9qvT/6jhR/OkHr
	fsgMbYD5aCnZ1yAy4IlZZDMAdcUhxMPZaHwE5V51cb8QV7WwcHHyMm+mNocI1oRC
	CCH86WbjuY3aVhL069J7Cb8lMrvMgNoGowS5OLxF1pedVxz9qHGw78HJEkTgYL9F
	EKUucw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9v48w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:13:00 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-463c632f9a3so53362727b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837980; x=1772442780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=SNKJ84W4B15BrSdQW7JNNB0SoZbA/YXHc/QAVAaVcyRowCqA5674fizB7Txdt8wNca
         YAuOfcj/RrT+3vS7HHroUdzR+BAb7+35zCV3vkpcJGB9dBMmyevb5sDV1n/UXYffgSJl
         MIgHqVbgXR9M34gIWwFSj6KnNY8ZFM/UhF7X6EKNWf3rF7o2qD3bYHabWlFrZmxD5cIT
         pOdt8yJkS0TSJmum2TymqdRbIdJNY+gLL/0MGR4S4E7P9MmpSgYUokP/L2Jf3M7nk7Mo
         /yY1XvP0R25dXT12WqvO2T9Vr7W9fqGGONowZvDHs95L5NSpj1aKTBmp7c7iST6ZWiRk
         YE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837980; x=1772442780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=RacYUAOqbGjWv/EDlCdolcIr28CWilJy+o2jPHfqPcP7XkUnaX50wpUSy4iysriJAG
         fUy+9M6twrPjD2xWPexBiWTLrNUuV9RRjWZ1Yvn0ix8yHCWUVpyc5wLF/29IFIQb2Ivy
         xwAPSu5NRj5WBLsRKapJoFzFQzxcUQHAa8fmcFXIq96N/8I+CUF98K2g+5HxxhtoykEP
         IWUXTS/ltZYyIlXJyXUbyp00uFJGEhh24CHPCi0Jlr/ORezjoiJF0qOJeDYnrj6qVeaS
         j05ixTaNAAO3aWmjDDDZkL5tEjTpPKfwFUNEGIA58xTzw8BZBPVTI3Xh96nxMjrT+qTd
         zanw==
X-Forwarded-Encrypted: i=1; AJvYcCW+zt2jeoL916bpeNR3zFyPGziCDSdG81EZbOMOimkNPL0GcjTPPWF+rMoyG4sVtxogWQf08UZdxMB2qvXVPUBn@lists.infradead.org
X-Gm-Message-State: AOJu0YyOH/9jRueyWq5l0RKgb/IF6M8MZpfsuwr7YGNv3eOTGq5ZH4vh
	cbcoyw7d99h7fXLcZwgyePeS5zsLkJptHFOWiWT5Gr3v4Qd/at8/5uWHJjKkLl4fDL7cQK0q63p
	Xm7gMmX8UtXG2x2nriCOmbUbA2+t3pnHgR34N7vSriDJzEpc9xrx5tdZ5YNxJarnCIj7KYr8k4j
	nIn1HMVGf2aw==
X-Gm-Gg: AZuq6aIsKEkNPlKBvw7SdBam20XEA1M2czMXWV3V3EjMk2z6ehOJLFhhRrjqBse6Jpr
	+o6wFPsmEeEC40qhtpjtW6bPVri/w+5Q4MGNrhgDoRhSIKGiPsBQETkDUVriOv83BcRAo8/JWu5
	nyMlUdVubgCfQk3NBsG7RmDf63SqHXXfAsNWgaBIQHNxj2FhBTIrrT3WcecSY4ZIDH/UsThNAPK
	vNrOK5zjdSvpMRVJBl6z+0IvnI0udYnO9lxcq6ayjWiV9numsTXfjTvvqTjy5J2I+AaCIdF05dZ
	0IzAagfTHC9wHIbzYljA4fYyNOeWTMjMBnPy3NRCgvzmoYzAMkQ1BtaEP5/m4pPJOQtTqsXO2YO
	rK8ftycIX4ZJIlZ2oOdO57WNbbk5rwDn9YgDk+tg0DBb1WGrMJRsN
X-Received: by 2002:a05:6808:c1b2:b0:45f:2042:8fbe with SMTP id 5614622812f47-4644616c0e6mr5169194b6e.13.1771837979781;
        Mon, 23 Feb 2026 01:12:59 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb8ca6e6c6mr944315985a.46.1771837590759;
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:56 +0100
Subject: [PATCH v2 10/12] i2c: gpio: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-10-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh5L9W4QURdlXv0MMYDy3Wx+w14PFc5E2/TU
 a0C5IUrGYyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeQAKCRAFnS7L/zaE
 w1AvEACvwcgSdpL3LU2XuYTrJqc2aiozZlmvj3/1Ie0jMcJEH2AK45frU0bCSRvr2gqCa3Ii60X
 6WLZVGY6RlNRcdxRXLRSZBvSE0Eoce6hkv6Q5YC3L1/cw8bbzrNV5usBKi4oO3Zm99AILawCmwd
 zJ+97Zpcy7O2/PN26x+KI5d5VP1+tngkzEvNqH3Nla9aCUt9PpyjL1f0AVJJb6QVS+Lknv/Ci1W
 GHiSaZ6FFGvYN0mE6bz2csmla16RJ5R2WSSWG3wGVcWhwECiQgsRSByzTQO/NEgkl6ppgN7lCU4
 8vXuo0q0t/6Z5pjWzh+HsqehjDvdQzAhjip0VqM4lr7bjbhfjxeHbYytbLQbTwk8nQU9WeTFJza
 B0agd251nKKlp3X2vDs/zC3adAlD6rqXJG0Rekke0GvHOmXCHDoGI9G0FHspKYH1R6IQESj/atf
 RFAxptAGIlRdEyhIssjv5tEk8tNpkgV+aOdxx5Ww6XJXcURDTdiVmts5AfQFkdMd0GVo9xAeXih
 xNbmcFwpHrWa5hjOt896Lld2Iw2ooAPt60qFvm/35aEkwP/nPU/SgLJGtHB9Hevf1KvleecWkwg
 odc4uoBYOug8l9+6L6rue9mcvWyrA+2VwZWcYKw5+CK210buMCsqUZJkbIZDwejQ88avb1U84yT
 HJ5aTEt7TNzEmWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX912uqU8goXdV
 AZu3YUAldp/bZIjCWAxtRij+l0kooWM4yoSXnP82YCwrcBF5C75yTCszYOp/yY1gDyC1YZ+Leov
 GqbGpgdBUfPvcjkOWt8lQk5+W4rHSBL1HgtzzEpW+rDOxdwi+tRfnmrFfV2Zt+ldL94GbbedNUE
 1iGkBC4LxvuGASjx6uLWV71Ed7xaGZ6Qu6SVgEi+RgqPKf6dAwLXWz1YPGwCzyt7YJOccZ1qqyc
 mjh5HPxbAMvilfdIpuF9FLMSMqT3Z0nKyor4l9PQukpf5wWA7K6jzcpOtiFf6k0R4hraq4ykqO8
 Eocg3NbesWuzC5LsfBz/pf0J+lp8+lkTqjg6BzllGYMxQupZGI9CT9XkXo5oesUo45Nf+kZhhFD
 BJSTQjuPWrgQz7eJ8zyIoQszoi6aee36GbE1hXJqSpoTVb2tTzhn5wEUWau/5TB/9W+huxdKMUd
 AskVsG14Qhv15rkHcoA==
X-Proofpoint-GUID: imIreJA0GR-7JcvKZQNZmim8x-YlY-i9
X-Proofpoint-ORIG-GUID: imIreJA0GR-7JcvKZQNZmim8x-YlY-i9
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c1a1c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_011301_893057_57CA44EA 
X-CRM114-Status: GOOD (  16.57  )
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

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3


