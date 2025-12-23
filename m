Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CA8E6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=z72ZHtd6SUkB1VimxM5+FLrFiE
	Ftoq5gjrn8WievMvX5x6eb+dpPdf0vehfRLi9pbLdGx1b/CyivEjyJZdb7nNnMxCXiYTmTN1iAVoX
	LlGoaNkAl5F2G+gnjq1rcm7hlqu7Or4W5EdFsBsyRQTKSEKRmCTOxZHOC3q7IC32SEZByraRZfngi
	A+MgY1xp0yrP4Bz+SATplpjE88I8JXB6JoU3pvJDcomX+KPD0m2INs2EAe1YeyQepapT2QfSbo+Ff
	vRieZZYcl76tDk424GDsb+2GFKBrg8cXd/cH7t4/PASM9uCHXsago3vNK/ZYTLyxRjjGkgdYdj28r
	QHtMhYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGv-0000000EqRF-0uQn;
	Tue, 23 Dec 2025 10:05:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGY-0000000Eq6x-3TEo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2wUZ31894982
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=M8SyapOHuaKCmK6g
	DClYf9gv36ai/lBT6210yhTCG69DPzfV4PSPqoPtoAaH98/gPeppl/Els9g0sHu4
	dH3FiE7x3fAWRInzkFlJBSV461c2/rxqCsGSU329wslt4kBl970M/v5mPRadGxAw
	ZK5sWyqlaE8HNx9yFQKpQs+XAftrIBkQTy/sfm3jkwMePKoooxVtkMLdpw/wDB3j
	Tx/wKhUja8eC5Bb6/z/egevEOpgzblyWPRAcH1PVM2v/SlLeVRefgmPEwf1ifi62
	C+6no1YsDgwrvdY9aaF7Vt7ALSZFwNffg88Czh5lCnlgCqz40Nm/8svU8ItoGh2Z
	W1cJAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takev0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee16731ceaso95462681cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484317; x=1767089117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=fVFEroJxDeZ75qmRbteC6dbe2ZvgCMw7H5hsesbsn57mCR7b0O5XE40nQVJqs0I8qX
         /DnQsJEdplP8WQaUJkb+860Z+Fc67NXrF7MslE72FQyxRPropQHpF9C6AfVy2m2/3a4+
         edWQFyx31j+fG8WD6c1V1tQfSkj6zjzOFBtfPjXZeZPGHyr8X9RahwkRhhB5NIMhuh2e
         vRlMsZ1zVidKqnDm47+mp/+RpwFDYT+0EGP/9dVKihl83Sn9rzJ7CKxs0Z/vAU5VHF7A
         ysZWxwQxhimEYEOqS8uQYAeDwNPrRrOde+iodwyXgo8SkCT20fnsEkK6g/vuCguDMDTT
         jkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484317; x=1767089117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=omUcmF9LWmCa7PHwzk4rtD1wwbpmVdwjkv/KnFqB7CNiLfoByfAh9b9bMl9h8Pfn6c
         zWnp/vMcM2KkkF/cnpgHRKDZHZAXnjyvT+i5msKas6nr384WNm+UxaGBRsnSsjiObSHh
         9eSsVNmb9eSQgP61yEHbGVNn1NQnj635PyaP4wW2e2+DHh/urOZzMkJBysgm1NSfQRIp
         9kQ576R0XGIb86cwSZnzZc0+uS2bZBBWwDZ241I928sdYGQtxdc8rk34ztxDf/rikHfo
         8jukhIw+eO32GM/1Xem1iMM4xMketwSH+GA3ZtpgTbFkfYb01A+4Nm3dKCf8lIXCZkFI
         psZw==
X-Forwarded-Encrypted: i=1; AJvYcCUqSA2CA9Ffe//yDvW7ioPxTUEk9sZ5oDRxxg/EY1eFqdP/XcBqIZhPiD3lm0sHUICpZsVkcUJWu/SQAVq6Ffx1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Ql9hGuvVBblZg8jrYn8PUnAhKufbrdCG3rXBXCz4aqltlcdT
	IxNaFE3K4JCJEIRtAejCZOQO8w6l5uPEeLoSgwQWTqpGW0jCZXmCffriIuYyIut3lK8f8DzIZxW
	lixME2tDrG3eHB0RTnPQXNa1YVx5xqaI+p6sGXwa1hy6iWiUGGLhjDRIX7z+c2MTPPyQLKLdmru
	lEFw==
X-Gm-Gg: AY/fxX5aBBygb9O8Xqh7qkOLTNZb+cT6eM5cDC00tj282jT0hyqSpOjWyif/EXxTaFd
	qhD7DrmYMkVcqqSlUlEGNksq1YR+nxIuFCBjMdaJvjlrsyxt/zCUiZfPZNNpRXH2Io+JcRj1j3j
	F68mON+UBUDkRSzOzZecI5zLFEgVQkpQGUb8LzoD4fPR1ceVtrbddlRhSo0LwnUiGctDsdbV7ov
	r4mHJluVd2zdAg8pyyjftA4CFEZLZn/1hpyzsaEg7XmNi7Q+vuBv5G8plvJS1Ib1R9bXCDtMclL
	gCl8QFveOgJc5y8bF2cEbvq5FwADzzN1/GG747JxSUy/Rw2I3QBByN5k0KrrhE7wC0NSyTLBwNi
	ss72qe3jQd8On39OFBkyn/wT/AQGqR5yGTRxTESw=
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179381cf.0.1766484317229;
        Tue, 23 Dec 2025 02:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyr+cM52EnsiY9X9JwqntnVrF5BgN6w1ESxc7f6rP9YwP41RmdhZKCpIzJx2dLAd8JqdWN6w==
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179071cf.0.1766484316736;
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:48 +0100
Subject: [PATCH 10/12] i2c: gpio: set device parent and of_node through the
 adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-10-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEeUL/Q15FR1biYp9tcKOXI8bceDaDmm4nY
 pSDfzSVR1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 w5H7D/9X5cvGLgf2JsLNSOAwLw9m6VU91GHNuXNctR1mCyxTnB1fkm7XnMj0pPmDNHVPUKlxZXy
 +y2zTwPZV/WGJitWyRS/ppkDKVJhOAhqmd8/266hcra08tpgC6E9U7V7nKET2Q2g7b8ZoLc8CpZ
 mPy0wVx57FkzZe1y5sVSfkGVMFxQ3wnALDH1JkHHgzAwfLt6HArLLSL8O5d0qbxXdAR1+JT57Eg
 Sn0RwrdFX39zMO6h4kCG0SoDeH1nXAOQ6TzzcUxvq6kk8ySWqHCnoFfdr4A6o9+ELVCAGDD7zb5
 DWkHQum7SRuPbiOQvEvp/cs4ym+eCOB9MhsWnJbvImHjaxR3v2eXwEVwpwTV8M3GxkP6tooqRT8
 7iEeJaAoY1NzmtTdGoaX+6w12Fs11xnwTsO078o2mL0o78A1kcmhZWJKO3O3zpZTfpHpfERG2Yq
 brr0oyrgv+7HmaEwzDYh1lOW1+6gPN2nubx3213yEXiDOwMLHFY9ESAUJLLBy5iBWfbgrmwiGLd
 aLiaZXAzAtbFj5x4jJ7I0/SewRlt9itvnAlHyKMFVw+IsofVej07D4ZVwAP3AZDuf7+DOL6Dbtm
 Dp6s2jvv0ty9RTnVGoeSbXXoT/L+yuOuoJmSs6lsjxNpSCOTHtP81AacY0NC59lU5KiRClUdsra
 i6GRY6JVgaFIeXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a695d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: PgUqplXyPvXBHThsWO3Md7v6sSGTO2U_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwfOhsFN0h0cz
 2Mn17jJ/M17GHSEdPXRYDsF8WKwijLSz57pLUHmdq0tciiov/LdLeLgLokV9WsJuhfGmPaECybA
 a31C6WY7hVZJcHfs3V+F3c8cLJzF0WrlbnsVV+rCr9j1detf7vpRfnn+qEoLR8Xq7DMolze2gtl
 UiY8zolTqPPZijGlujguq1+RA4ic+moOKCpLBGl8rsnfsmLYFEO3V8E96izedLIB5DqSgOtoO9f
 aIXHbhAmr9TU7Y6H91oOexFNqSfC8RqmiULjNmrTo7DoV0fAy7Byn2C1yOPBMifh/FGK0Vk/Lb9
 ipc4gQZectuhbAYRkmuM3r9OszgpvTKLK3VhPllCfsaSdyY+FBxj/HiJAdS02Uunng2nJ8dUThb
 kVLCb+4fErPeS/L0oGkZUqFOdtz4FfY1PhcCcSvia+q9Q9NJL4j1U/RdowI3IjVgOQuaFJ5SGNH
 zVX+QfLbcYrxTRf1IYw==
X-Proofpoint-ORIG-GUID: PgUqplXyPvXBHThsWO3Md7v6sSGTO2U_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020518_990194_16F19577 
X-CRM114-Status: GOOD (  15.93  )
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


