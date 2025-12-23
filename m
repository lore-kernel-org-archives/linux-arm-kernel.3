Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1765FE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=TCxOA6zpHZrwbVraAg5r/DbIVR
	ndLFz7Ye1aDlXSaV23B9E8Ctya+cCJrKyoU4sLqo8JY5HrhJL9e4PmD7oKFl5OA/A1+cO4yQCwdpR
	2ZX5ubNjT3IC7l1RDDpDndxBGyr8g5sc5eyeQ5d+s7X2EdsKZuw8Z4KERF4Bz61jJLVsBj1ofSDlY
	ZhGDaYhbefGSe6M/kxzMs7Tp8/U69BK9VpKTvzRlQNoNtCZngSJzNKvtKB1hPI+jXF8VEfthSUeBi
	1xV6fLVqBIehJNPAhx1T6VYydj+OblG0nzXEE19CTbRw0rWOGRMngKbYr8WGqDuql0JOd/OZln2Ij
	azXmes8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGS-0000000Eq10-3qcF;
	Tue, 23 Dec 2025 10:05:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGL-0000000Eput-3ngx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6wvjS1630783
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=RW8AkFYEduRKBW/W
	O/rrnXcsPJG48/Yk9RsQyHLAQsSQUJg4rMSIiR9BHf9N5/CvrbDheomOJXd7jp68
	9gc54c2UfYVouzEgysCs6fWpAN1rsjbVapbx3qF0FXHJlZFN+hfvwz+rbLh+/r/y
	FBtrBAw8V8DM9V92jjsj/P/BIi9tCB8/Yh5qR8wI7X6KJumhfsnNntU4TVyik0dN
	spzrEZemSU4Bs+CWduXtmTrPoR2f9fGJfCk4D7oa69yfjP9aUhNp8jHMjdqSJnp+
	/Q5oGDp2EEf3amNcU/MxI8kdNrVEmgPoYlRXLt49krvetD2mHlU0jUB+To7IgRsQ
	Towseg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j9xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so106935821cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484304; x=1767089104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=hjm4EHBI8e3e17ovzxcdsCPkPayme5fPBFH3d0XXskCLlTzIX9aSSmm5leg3KxTD3P
         vSTIG3ge91S5sT7k6u7e4OZ0a0VWZLX1VZCUibIvXUUlNdglyKmSunpmXvLBRoDdTKct
         V08/OGQTSa+QnavXifT4WUZQ8msE7yzSw4mEKEBAwPcf3sqolsklxBR1alrZEDZyoYkd
         A1oYhF7XhrOzB97dXPGHBzAKHwqOgH2AbiUx7qiIk4TbEbXKvgjSjINoq+SN+znkSFuR
         iXZv0orE71kOMvWYWJJ3bJhHE7WR6G2yPomd08SMlVtmWj5OdTv81OLpb2jw7cCEj3xT
         oRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484304; x=1767089104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=VikcOQg7c6SfVhwfKXSp682rU7RPw++72e67bmnjlEoNnMki7sXQIc00zwt9ey+twh
         +FT/mfnsiH/dSgtOb76R9NvYQa0XtPTP962GTWb/N6nJBA6NYL+xXwD3VX5N/TuPmclt
         j17kUuRb0mOZo8l3MmNGz/ezWQSdn9etuGh0wPuReExyFEetUnjsRkpzrKGpd2HodZSg
         ONQDmNOOJFSNDLsrtVw0R0Brl3tHqX4rc6MgMNQZ9B+Y1jBTJPdI5++0mvCnCoigdfDA
         MQRuhfAj1dSA5HkHrZK24FDracdvnxmn7q4fLKodWsW6BtTgd7L/2Guy3fSVkk00QCFT
         rl/w==
X-Forwarded-Encrypted: i=1; AJvYcCU0LKBH8UxqJUlBbFAhvjcakt5hGKq+n/xtwgAHJi9NX7O0dX/MW5bP5tkZMXnxdZxNJsseDWcSY8MTxarqX6EG@lists.infradead.org
X-Gm-Message-State: AOJu0YzQzVcJY+E+cIgeFvg3RgzUUBaz7fL4A9TM3zu8kyJs79+IG5Ia
	lmqFMS7kncf/2OgZlg09NX2Kcehc5EXhrdHQ7bpUp47a9NVm5PLMhftxLSe5YhKywZc8b1IkEd0
	2rFdj5lM9hD7wELBig+z+u3x6+ZaRGtutU4MUsK6ced4l2zfPkUbyG8y9k8yKOjlX2YxQP13dDq
	hRLw==
X-Gm-Gg: AY/fxX4LpNtr8t//5Lt3bzgiP61ZJucJFkXLaYsZXIgnOTiHlCtWjisGstg2e0xTk3e
	TU+cUEBsP0uC/13Q6cQE+fTYp+RCRHwJuVsgRTmdOY6Qu3inU2ZjEUzfkETK2kckrgz7ATKl2BJ
	1cxqmjtPtOyRzTY9XJpqoUfKBD+qEU+3TX/GC6eKun9DS0ZDq8zkH7b2lFqHgNMwfR+uGUC+qsG
	XAdaC6+OWbdrnpy0jrqeZG6TzIa33W8hnH5DclfUmNF1a2I6+aNHUeOqJjlWvsvUEODgOWd+jxS
	ywH/2q3CozwNrQR2CP5AsH+tV0Fe5MqhFVdh78VGdwn66htkokrKNuQYS77mYHsLjVmGFsPc40g
	izf78jcg/hwZJzY7xJFnxfuRC9d+4ZdU0Cr67r4o=
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230371cf.56.1766484304501;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIjj9e+R9isgdw4TyIq3Hu1LbklgM+U32cHNPR6qnouGXpVQcoFz0NR6/hmM+Q9uZlUedF3w==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230141cf.56.1766484304075;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:42 +0100
Subject: [PATCH 04/12] i2c: keba: set device parent and of_node through the
 adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-4-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk+kwvyegNI/zPQvrSmXauolivDt5IGKfzgw
 GoGwiPiQAuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPgAKCRAFnS7L/zaE
 w7mcD/9bHC2rhBydNMtDo4LhxwjiUk1fcyXFZjeF/im9i5gyNKJ8bBrqQI2Kdt3dy0KPpziQOg0
 BSV0lAJO1bIqOsPwuc3KKYk3/hn0L+KYBp/b+lvF04I3enMZWRGN2S0/ffsbchxO1MeJ0V5b3cK
 hfZJu4EVftckpM0O9Yv8c60e5Nb2JR341WvhfCxS7D0AWLJQ7Rk7IPrwEI7YJEtHU2uOl+zA9Ld
 uPRMsZkDy+deZ7ByBQfd90O786cGcKAet5D0odFsO5H+ddDmmUTe3YAktpsbfuxMqXqhPoXaBEc
 i+Axp3by5tydT59O2lHrMDs/Kzwee5Ue1tcVNindG1cTlvgNekh52Q00KAe/rF6+70Vl73gf75/
 kBgWrGM7J5xycVb6ED7++BH7uqHlIFWJaWkWICSUKDy/Yfkg0hzCazcr7zLUZnu9CVkGX5dJcJM
 Qt4eQ6z6aMewRrdtwTarz/laWMPOVtvUcKNA7UIMw3BpzRzbDtPYmsXkQUfTjcVOCRrs0DD51JH
 M5IFzjAlpNlW+Ld5vdixHFgqRdl4rBK2wnGFXGfrzhXQnWlDLa1XbP5ZbHgyJ52ujLIX7IGrLRh
 45zcCCphst3DcutxyE6J+BLDoSOV/yQOlS/iZEGTJmOGPOYwogfJO+0o8ogUXhVpHOOjC76fo7z
 NMVpq68KkxBip5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ocYmMi1txslWb0faFPZeAsLsyN1uqHOP
X-Proofpoint-GUID: ocYmMi1txslWb0faFPZeAsLsyN1uqHOP
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a6951 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=op3mqaDViYxnCTu1ZhYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX1mJ4f4pCitXK
 DuW0PElLX/yRY201xlGhnayv8ni+ESbYyxTlXtErRE8YR8DmvKL7v0joBPoi+lTRWXS1s3p+1vu
 Dlj/Lb/9a9evCIgGmbYk3DhcHbXqDrX5zipPeiTXMrCi7MDPasLwbBsudkk00UAYQRAwSGYOYHs
 kib6/SwMxnwtueG0iRXkkRLZ8XlX1X0uSm8/aLDD/9C+rAff6nFpkzQQI5KImSxk1HCy4F2jgQQ
 dZB6qI+pwILrTvLUaeWfOpBOcMRLAx5/s4gQD/DB05S1IeDqLBC7adyeBxNwxPCzVH0EyIN8JCg
 cpZwaS1JxKNmSeJa3Sp2xaEckSOIAcOJ5psSf6rVZvQ69sbT/WE259wYrSIC5wlhiTM2HPjMakx
 yB/q4gKDcZKP5jWR/5vKLf9MoAP1ezeVCqFO8SAGavQaBEHT9tCmMzbc7Ub6UIokQKFFuRG1pyh
 +QClArfV7X5n2llQ+6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020505_958658_8435F625 
X-CRM114-Status: GOOD (  15.52  )
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
 drivers/i2c/busses/i2c-keba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 9420c8b342b573da435eeef5a05efde35d61434d..01aa5dd9638dac38dd92500cc8890feb8020754c 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -532,7 +532,7 @@ static int ki2c_probe(struct auxiliary_device *auxdev,
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &ki2c_algo;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 
 	i2c_set_adapdata(adap, ki2c);
 

-- 
2.47.3


