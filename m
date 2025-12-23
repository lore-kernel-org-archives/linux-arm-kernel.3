Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E67AE6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=; b=mOpNNwsOy6jmc0ryciJM3YVBiC
	bHjAzE0iL9UnDj6G6R1bM23ee2BnEzZguM+d0fQiujMbkPh/NfD8d2y7VjzG8hP47xyzWF3MHgnea
	1/KdCMYBYy4V+yiFdoxM9sdP3PQMtwaUVlPnHBw0i0BGiopMenA+xFA2h8mLU7Kfu0ZMsIWGBNG6P
	lx4mp8kbs7ILN0xF5M76VhAOiGb37szhEFuVN6chNuHcOMx9P/ui2F7sD4ocxNgDJVm83rzLhdA8O
	pwtVlykQDEFnqap06iIn/gSczk02/do14N0ThLOM6MlGBp8pOJxuIKDhpya4qBKrhM6ilDRXgBRPT
	QTN5btiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGM-0000000EpvO-050E;
	Tue, 23 Dec 2025 10:05:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGH-0000000Epqo-2EJJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4LvTq1356377
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=; b=pajerv1lDNcrq7oF
	mQmcbA7QamlpI260lXdeMqWb5HuiGh8vx2uVdNJXoeJPkXbo/80d4tNJxKyqiGE+
	G8zAnP+XVLv+veOTawhxAaR/oat8TAB41Xd6WtOxJJifr/PVcCocFulHrAcoCFsr
	AQd3SVwAhK4FRc7quYsHVRgdxtfJrZuMc1SmBUsXBV59XehNxvWPgKkHhzP5MrCo
	6piL9Dfm3vOgSin59nFrOR5NwVn28Lustl+9xFSDanXLDZ/rzZDsW2qFLjRxgFn8
	dr+uwvgTiF5wlSvk/3O2qy1OoVE+R47c5OQ9vb0qoNTpS65ZXGBcO9sGIMSbtazj
	iIvkzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2st4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee04f4c632so91518041cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484300; x=1767089100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=EGhs2//3ROh/4EKJtxVAqgeGZAc8qq1Mu8y1JdJQXc5dronIsh04HCcWDgpD7ZkSKC
         +02NQKBn/wV7pw6Dy6hjXZuHyelF1QurD5Z7TVh2q5hl8q/ZWOgkLv3IOOuPJtdkQg1L
         3xttBRhAjSRUwJs+9O6v1w2ghLuCqs3CBPiSZId5W4uQcAzS5aitTybCYIruAGu8SQ8Q
         8WqvK3W0JBKICuQuKEazAe1JVuwo6tuEXohYc1wq/vhLLpaJfZGU3/KVbfmmsm09d9mW
         kbNsqqvaanHcPCN9amFdfQ/EW52umaYC5XrwoSz5au15SibYeQe+ay3tX7XBl/gKEMuV
         6NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484300; x=1767089100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=bj2a070yidm72tHaqWFEjoAs0Yllr0T2klGBiFJQQ8DUJVYd5UQo8vAaRtpa8xwl/Z
         DbHYcRkxPNQRYZqf1NP4F0iJuqhBAXWdJAjpKkmd+HEIJ5d0d77IynW1jU1/3dbHGqzc
         a+0TnSHl80g0PRv9UAmztYkP5NZ4K1lXGEL1sUDoE1Njx3C4iJeDRtqBNlqNBgI4qCcT
         2sgW5y1AvuupNao6FxvrCKyEjfBJ8QLMMmCWM3Nc+PJrfECcmzaN3yUcZRYsWqGLd8JH
         2GJJBS0DvIMGiyIyHnVxg8pn2j4GDAxoqmzjJGlngyMSt+EmiQgbFEqHp7nD5a67GJQ1
         ngEA==
X-Forwarded-Encrypted: i=1; AJvYcCV28ZLBwdX3u8w1Dhx+InIzQ6S7Zex/Zj3hJqpGeXFrS2xtw83sJP/0NEKUDX6vQSWpH9FN+OAZkcDsN9HulvmL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw42LcT675//gtAuik79Jvj7OQqBkWqEFHyxFMUsbaUvxafN6C0
	uiBsowj4qcDvBO35B0Rb3sewJEJICrUWElP5O113NW7PQJ1XC8Z0JMuAT+kkDtkv6cJ+mjcqfyz
	fSiHEkehzPctdSNKY+jkbljbj8VCGYx03kD1F9533RboYRWPhgoVPoYwHbl0L/E1CfbWpDSOpbT
	MoTQ==
X-Gm-Gg: AY/fxX4U0g5ayuCan1jHMXrRx7vvdpXTa6w+pa9mnp/XRvDFe5FoEf8y0nVRgjrhUlC
	qL52po2zuWOVML/dCqJABHebHvFVLS0qiWko3Dl6aB6AS8zDfgcA0CS26O+dwMnB2Wb65zSdmfx
	/uwUz08rC6lf8JqdQ78vUh/+/14j7T4e4u7+PGxiCXjNRKElHW+iaINuPrEOwC+PH4D/mJafo6j
	HzU9fz45+ZsK/+Q8OmShcU0rsg6q7liFdCyYBP6aT4Wj1KJJYT8TCPAO6E6LfoLkTc2/kd282qg
	gqgx8UOc04og7o/HGRxyGaeyoq7jqZ2u0sLILrLNX1F2mOiW4hz0SsyJPrB9uUxqeEffd6tCXOd
	f0+3C2R8/MjFcanThluy/05oDx5KX1LtZKq5plAM=
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210630341cf.66.1766484299967;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqs8aoS5bfuwJD+WoHohzfrk6zAuOj6uBm6rrybCJgzMO87KV/ByX6nI9XDqN55s04/NcSkw==
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210629761cf.66.1766484299529;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:40 +0100
Subject: [PATCH 02/12] i2c: qcom-geni: set device parent and of_node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-2-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hf4+ULdK6Tdx70XShge2syYlIjQYGUsU9b67SniGPyE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk83XYxA2nG8trXqlh/POQctyaBd55aW/HEx
 yqR05jcKWWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPAAKCRAFnS7L/zaE
 w3K/D/9opRkZjX4lgmsOo1yyv8mXTtQbojGRw/+sWzvd3iklh7WtTGjjQw3irf5Q/NHiK0Ok7KC
 kTHtJHfu1jtbiCWCLHsJW2aprqmwxz0C3zjImvzFKUGd5EoTKhclKs6YpK6ejenbPt1crczvXsX
 DVbM0dp6qLrL83SuX7MnQ8ZWhYWn/pF233Q2eaDd/+QBVDVv3gck/FeJssLvB4N7h0CHawCHHEr
 GMGjxoeEVkiqR7aZITY5LorSFUmsIb3NTEUW3FVcWFpycxbRw3+p4wFQYDR1Ny7qGf2ILLmP/CJ
 U9LomEhmQZRkee/72jqKH8bo1FbfKP/P+VYyoUdTf4t9dOUL2U3LeMh485sQPqDTLq8Okh56v3s
 17XlETa8bmybd91T3pFrmxIV2mnuw7a1zsS5YVJwj6KqHK3T2ooXJwGCTBxcQCeWOdHttolsxuh
 puUqOv93aA/MSveDWf3ExFCRarP9b0NivMt85zgYH2M3WpsgSGYB/cAv2xSTgvWRw1FTwfaweW8
 ZacS/HhQPG3qxn2ZvGDzr/5ZHR65afrTsHquJQgEXAywgCExHGubbx+ijVtEDpPstDX36W2N6wm
 FRfjvhcCvUOisaTzzfyUkgcH50RcSIerJmDE+fwZ5XmXSwNOKtRL0ZivPRm8xYr+JtY7NIKtny4
 dfzPrDpz43UP7mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: LrwDDZiUhfXj4_TSkQZx1twprw7ojE4N
X-Proofpoint-ORIG-GUID: LrwDDZiUhfXj4_TSkQZx1twprw7ojE4N
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a694c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2mrIo30mG6rG
 1lPhiLC6oNrnAMsE9Z4tja2Kt7StDLXC6ZUJ08GFrqZY5CjqFfjMtUmKMcKT2jzr2KaSKc67qX+
 InsgQinfwkXet/dBcibr2JXitq+4sh0uVp/Dd63FsG+wlhEez4LF7dAtl64Cz+WCnuj8JeBlVFa
 kNJoleHZBF/sWpAzwvQe31z+dwZZrYDxc5yGwdCKNyTNEHmBU1m+a3w9vh64Qyflu2andYqb+cJ
 77QQwgJM8+PlvgNgoYzhfks4KukX7+Afu8APduR9lJn0mndSePbMIw3Xj2y6aMPXItaodjTIXXA
 e8Bx2KO9uQYjbP9kVPxunNR3game1o9Zg5UnN7XwJe17ZvKwoRBQ1QCznJiJAcicpwK6rCm2N18
 0TLytgIh2WIxSOXMKISCKEPejRMe9eYRNPd7XPMlZKQh7Jrvf4hYLONDAnZEuD90HhvB9tpIP17
 uNiw65fM0cMgYu8XnOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020501_689523_6D960357 
X-CRM114-Status: GOOD (  15.66  )
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
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3222cc6c91386f8904921014a3f90..389fa49f0ba7e657d97a94d9e27f5d916d1ffcf1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1038,8 +1038,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				     "Request_irq failed: %d\n", gi2c->irq);
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	gi2c->adap.parent = dev;
+	gi2c->adap.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");

-- 
2.47.3


