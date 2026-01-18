Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD6FD4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=; b=z2MR7TZfq1g/YFTYfOLltN4uWc
	cvbYiZhXmvBi8RSzkCzxxJBlyZb3OumYx4ncKRUn5KLFNWtpur2GfO96UJ5nI9snA8JkzCL29DCg0
	nNKPYOrjiBlLDY+utOvyw0JWEDQ56+U3cMhSFSBNeztEMfwMDUq+eJ6uoPG+EZIk04ZtWU5kY8US2
	se2HmivN9MYI79uf9jlw1gtMhRGIFCQLo5yGNFKNiIPU6UZc/7J7/pEx09NnKUrzF7YBRhb1uOCL2
	lammZPStyKKXw4XxNrgWsIbDQEuzAEFB8s4HxXJESpuSk+B+rHlFwzQDCGs2b9jNRUTuaB9V/WYO9
	ZN9GyJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEN-00000000fov-0JEC;
	Sun, 18 Jan 2026 18:10:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXE7-00000000fYY-00mI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IAQm5m2097948
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=; b=KXHpX1m8m3rn36Jg
	XAOXwYt+u9K3TjPostd/Ga+OJGx79TdYs516hJ7Uuj1DP0pic1AGnEgszDSbZwne
	PlDfhwKpRxALzLVi9/aOTpk6UditMnDm/26xLFGDtbrHEDQ8D8GdH0lLQR4Svsqo
	pnP7iEh9mMwx8zLBM9tlTFKD5OpkE0j97kbRdyVpYBq944m/m/NN6wbfgx+b0Do/
	6FHtL3IJp+oK9lZqxZHck0q7vU3B3O9QpoRqSvP9CfcaD0RXSV07ytsg3tCUjcGe
	ow5J9jBBcx1u5RbtkPZs81+1yN/7xDoG6TjVaRHXngafujCzRFemL8NSl76wwWQ1
	/MK8Jw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q9amwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a0ec2496so717975485a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759813; x=1769364613; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=kqE6n2rt7IhMiw62kPPZpyFreJCWPsv6EN/YBEtTfbrixjaiL4goYwACBJ3iZD7OMP
         JfFkwqLwSTMUL88q72JPptE3qnjPbrBIgLH4AOoZopi0nI5/DEzbSj8YhnIDhfC3fWp8
         De7w889HSdy9m2/gUswYlEEksB5JolhK3DLD/mlIMUF6ZhNXh0uONO1ywpy7TbcTkUeZ
         icssZaIGDeJDlt3T+kiLkvgv4TggGNQ1LXbmoXN4rRskhH18Q3ZDGoL3l4YzIEIj+9um
         wx4/Zwktt+yiNoQ/Qxz7tjLknrmP53p8LTnx5y2hGZKCe4cveAyDqrz4RRevsgBQNXJw
         BM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759814; x=1769364614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=BEclNz2+mO1m8HBWhTVGdbNjci0O4ZjfL7o8+HWpcjCLhdxPEsef0Pe86HP4/bWoyz
         ImvjNwkN1CGvcoKD11ooHbHUgt0aDgZsBnjSI3G++FIJaoxtIzfcLBtTZ3sW8OganXCF
         hYTn9l4cSbEkDIDeuAraqK/Rn0wgkBf0szvMPVLm8yJvPv2D3M46vAVVbJRfBQjHUQX5
         uyhMKJS627SZ7/4El1BWfxjz3m7XHHX4AORd++OTBa7J0aUmK0/E2WIHhKxIYEQrcIns
         LnYu3Ku0NeZICxP8AZAUr9A9aaIkumNqUUxXxc9HqlTZt+uVqD8OB/J5XgHXykT8qtYR
         Qk2g==
X-Forwarded-Encrypted: i=1; AJvYcCVRg93+QRS2zFWY9U0c3arb16dxulzmDPyWjOHzChWhiDoLj9uQnWW33aQXA/Wi3RZcX5gjLGk/qRVZxfpykMpM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2EEAT1j5CEAnNciugtW5RHqxc5PU/qBpJiVSIeTxLw1IPFHOu
	+x0MjwjeW8AUptyvtcdl6IGgvM6oXgUHK7Zqc+Xq4shUNs7eWYToqmApYvxgKOdUugutD53pMuL
	QS36N0PSgpysouit6UL5TmHL38c/BCZpmobIfUlUfFBkuh6flQ1eykv78j86TS+JHkwCXkqxfX0
	ASJA==
X-Gm-Gg: AY/fxX5s0XQvunWwo2QTRO7H2G5vseyooJsDVgd8O7zQciW3QJ+mRSK33nZqS5tCkme
	frtY85uF4JP7N0hHBtxMmQjetqUYsM2LWH7VAa0NTZ6LWoC89Ii/hv2rVu+gdLEH4q4HT1qo5fJ
	Va9A+Ax5wLxfUCRfqtwvS8E1745FTnfwWkbpjzyaSl9wjeCY6t0gwCButMk/MYPH4yqP1TQ6FgJ
	KigHG1PerqyzVvkY8NL+Rc2owaRDFwKPV+z0YtcsiU3GKVV905UqIJlQSX4FZ5+m/fEByWBpjQF
	TOJvIXWUfPmeCP/TBy0lkcZMz3q5V3wOWaGvF9MHURORR34H2Fsl2u7sPHvZVk/Nd8Z4hbvLdJL
	GYdWJM26++TJ9JmjFcvOPX+G5t+a378injQ==
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1223537785a.66.1768759813367;
        Sun, 18 Jan 2026 10:10:13 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1223533585a.66.1768759812755;
        Sun, 18 Jan 2026 10:10:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:28 +0100
Subject: [PATCH v2 05/11] pinctrl: aw9523: Simplify locking with guard()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-5-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHyayuoBeIp9CFs/To0KGzg5wtCKMQchY4rd
 ZTVsgBVTRyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8gAKCRDBN2bmhouD
 18jKD/0Q73dFNHHnrM5068MUNMPnIOmN7objobVATcjCxeNYoQiN8W7ivD4SWKVqA/DdX1R5St3
 0/tCDBGqXO12+uj40UIZE4ljdgKCD+fsn+WSOyeGFeJIxnFDyd8A6kCV+M957Av09NHGOuZzCz1
 n84LPH3ZRBC3uEP8gG7lVsIgTJ7Wd71Udx4I6Tf07bk7F2r+44NHCHKRtu55X8WAjRvLmynm86Z
 YOKnbZ2UCIUPJ62n3gMymM0/Ir+JkYjini6adzG92nXecsMf8J7ulbe3ZCqT5uJ5jTnZRR3KKGb
 psXi0oNg+Osb0wrW5nqR6O2Im3Oqs44dXVV3i/kbow6pNJeKSmmU5W+l68bvNbT281ghjvLIslY
 vvnRwxod3eZUawpDeP6T//3MNuKK2Gg8x9Lq9ey+ddE7nCFUTBA3ypX1ErFjwFg0DHDk12c8WII
 gi08BdhYaU8LtIxZzranwWhmvK3EgkrmYF+5lIoiIaY0e8XcmSW8WsiZCwrGUt/cBly3O7IY92Y
 FNoDXLaqmlFiFgTiMN2tVA1DpqquhFr/7fQp130j1BwOiRjF1OVqoVodqNKRPARHoBOIEmZMpIC
 PcI+/h6wyzJPyYXnC1UAQaCuoEGdkdUU7RcbXCWBfUmrFfqNlwHm1DgkCLMLdyMmi3GmnFcSM1m
 fHjfP614CxYOwQA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX9K8Z3KOwqGpa
 xqxTeDi6+qwDisycrtE3F8DHA+mSmk+UF2lQEOyve1Bpy0kHJRoltVYhlfVMaZZpW96FT4GS1uD
 KRWnfWJUClR0euXN4DrQJibKX2NsPFKctFXqXfkO1TgGkDTEfpuZnJUg8/MrD4IYib82CYw2ZBl
 x9lCtzOBehjbRgaYgOtHMc0XLZpdZ+JWZouBDaRCJy8d6o6tqzipAs82q8hJP/EFrtriCU3tMAd
 7UkH2ymCMqw1+f2CMLSYf59eeZNDFf5SPDWvWhyYz38VcQlNHw8AqY+ygDFlT6sBI1dDljDIMpT
 O9tLb3eNTTL7xAZVvxZjLX8GTCgOfhti8myGSpyEzemMEiFMBg/9a4NgD7kH5DW3ARogsad3O4C
 anbctGxqPerYljDa82lm7Q77TI0brNSmCW9DpxWdJhbwZMqH+vQUrnnTBH6kxR02k/uQa+kFhjl
 zW2fRkk0X8wE6yILKjw==
X-Proofpoint-ORIG-GUID: fMH-mIEgCiMI1-bbE2_XaU3_o0thOSpH
X-Proofpoint-GUID: fMH-mIEgCiMI1-bbE2_XaU3_o0thOSpH
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696d2206 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sJPWbbE6un6nfY-uGV8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101015_067443_9EB4F688 
X-CRM114-Status: GOOD (  18.89  )
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

Simplify error handling (less gotos) over locks with guard() which also
removes possibility (at least by reading the code) of returning
uninitialized rc/ret value in aw9523_pconf_set() and
aw9523_gpio_get_multiple() functions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 53 +++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 479553a79216..02a24ac87ea4 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -291,14 +291,14 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int mask, val;
 	int i, rc;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
 
 		rc = aw9523_pcfg_param_to_reg(param, pin, &reg);
 		if (rc)
-			goto end;
+			return rc;
 
 		switch (param) {
 		case PIN_CONFIG_LEVEL:
@@ -307,7 +307,7 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 						AW9523_REG_CONF_STATE(pin),
 						BIT(regbit), 0);
 			if (rc)
-				goto end;
+				return rc;
 
 			/* Then, fall through to config output level */
 			fallthrough;
@@ -323,10 +323,9 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 			/* Open-Drain is supported only on port 0 */
-			if (pin >= AW9523_PINS_PER_PORT) {
-				rc = -ENOTSUPP;
-				goto end;
-			}
+			if (pin >= AW9523_PINS_PER_PORT)
+				return -ENOTSUPP;
+
 			mask = AW9523_GCR_GPOMD_MASK;
 			val = 0;
 			break;
@@ -341,17 +340,15 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			val = AW9523_GCR_GPOMD_MASK;
 			break;
 		default:
-			rc = -ENOTSUPP;
-			goto end;
+			return -ENOTSUPP;
 		}
 
 		rc = regmap_update_bits(awi->regmap, reg, mask, val);
 		if (rc)
-			goto end;
+			return rc;
 	}
-end:
-	mutex_unlock(&awi->i2c_lock);
-	return rc;
+
+	return 0;
 }
 
 static const struct pinconf_ops aw9523_pinconf_ops = {
@@ -599,14 +596,14 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	u8 m, state = 0;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 
 	/* Port 0 (gpio 0-7) */
 	m = *mask;
 	if (m) {
 		ret = _aw9523_gpio_get_multiple(awi, 0, &state, m);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	*bits = state;
 
@@ -616,13 +613,12 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 		ret = _aw9523_gpio_get_multiple(awi, AW9523_PINS_PER_PORT,
 						&state, m);
 		if (ret)
-			goto out;
+			return ret;
 
 		*bits |= (state << 8);
 	}
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+
+	return 0;
 }
 
 static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
@@ -632,30 +628,28 @@ static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 mask_lo, mask_hi, bits_lo, bits_hi;
 	unsigned int reg;
-	int ret = 0;
+	int ret;
 
 	mask_lo = *mask;
 	mask_hi = *mask >> 8;
 	bits_lo = *bits;
 	bits_hi = *bits >> 8;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	if (mask_hi) {
 		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
 		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+	return 0;
 }
 
 static int aw9523_gpio_set(struct gpio_chip *chip, unsigned int offset,
@@ -695,16 +689,15 @@ static int aw9523_direction_output(struct gpio_chip *chip,
 	u8 regbit = offset % AW9523_PINS_PER_PORT;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
 				 BIT(regbit), value ? BIT(regbit) : 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_CONF_STATE(offset),
 				 BIT(regbit), 0);
-end:
-	mutex_unlock(&awi->i2c_lock);
+
 	return ret;
 }
 

-- 
2.51.0


