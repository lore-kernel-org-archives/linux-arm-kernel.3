Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A32AC47BC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwDshA9XlDU=; b=ryAwMUpFxleqPC0vaTgvWaCsZN
	aGlZ1fazq0cFlSVfQazrOfkysncK6K2yDhTprPQ9CUTRChXV211LyB7MuROk/P9IfM9uc3pegKtpl
	patrcJ8s047rd6sq8xSy/ekZ7XqIV14tJNPjhaX+Z2Og1Aubd6H0lv8BQ4iDjchwjVrfDjXKb2eAb
	Ugvzs/QxQtCXPkUkouZ3E2AULHHgncnMcm8npyZyqRAanY7hDC156Ii6WXfAEHOvm89tPEouw16pt
	mOajWHgSuPIm5i2RRPvML6Izf1yqox8FE8xFjsJ9DafICdTKeHRAUD2mAraexG02/0vZy4lC6LitL
	/yGQxczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2oN-0000000CdwQ-0Hos;
	Tue, 06 Jan 2026 08:53:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2oJ-0000000CdvD-2tsz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:53:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QnYn3443623
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 08:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwD
	shA9XlDU=; b=SXjLicC0Irkde822s/1KkHZ2zfXDNTJAWMzY7aDz6iVz4UDNNwF
	dKnEmyagBgUXPuLiNcnklbfwZCKsdIsC1KLrMY8D81r2UgTXIIPZIQoLI0ip0hXz
	BqlVL/aUbb10EtjPv8i78N04HwMwM3vRXogvKnj+/8EHz6Be4QmRFChy7lMQ5uSd
	I5qJcpk35el2nT/tMD88mOY94kx7xNiWrRXsj1THPrYBImvLzpG+6NmU4/1/ajM2
	h21yzNfSEuVmQpSNi1IQLhrRrJvrVrLX9FEBL3lMpd5uwe8glUkWhLFv6RrZ3ioK
	JE9L3Fhz5e4D098CQeuXnbx1z/ISt0IL3XQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9rqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:53:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9ff555d2dso201366585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 00:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767689582; x=1768294382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwDshA9XlDU=;
        b=YacREhlQxnqIIeCajj7zsbiEmxn2Ab09ZWuKHCTnf24pFJqOk9Wp/tt0no5wjgBijO
         oLSX1A0DWuKa0bodRNWzzmrZ8srzX6sVjKD+PS6awdRk+bvFSCbNorwpWSWOHdyDQiSY
         bGEk29Qq7yiEVS1iX35RsYOK65VF0KMPQX1pEyHBRxPycXLvMNwOPHH0x2NRI2uMGc8E
         FiwzJK1kyuwNqJI1y/+tadeav72IKkTqNtLaZUC98F0g9q1gy77v51SQ4bPIdjadgclL
         28BeNCjnn4Tu4oZmHKEJHKtPVCV9nN3I5f19edEIrqZsmB3zYrFmbgwZeaid2VRoUvTy
         RKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689582; x=1768294382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwDshA9XlDU=;
        b=GCodDMAAISWG43qaUu0tezk4eiZ/HQMIYjRzkCndg3oXeGvoolCmieBPklP/KlluJ0
         zZzsxxZLtnVaiEr58laVZ1vbxrV2LVhJ73+nYZpvvmwJgLYX4JJrAaW5A7ybwDRVxond
         ugkY8Vk7aLRrYKrLsMxM48tVzisRAFhj1KG0WAL0uWfWWuaJkFYstNecYmAiuy/bbYx3
         T6PFAkP48PptlqRgeOtzWMhsaRrF3kBJ9rVWpXQLCG59N/5Um/qPMYtx6STjg2qRVkKC
         NX+6MyB2tJokonq8u8WtgsZkJMAg7nR2gWF6ebUylGd/MDFiiZmzHb2BAXTSkQCKVZf/
         Hl/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrzSFrNby0ngP9di2rhtVRM0PNyc6H111DkcbydwoCvIh60sp6QB9R0gxnVfd5hs6uaV6XjvFas9xOUjZ1YFKq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3W4GhfAqSjRy+nkkCQKM8tKQrMpWP4ExOpzU+Qdv4/iMAF4C0
	JZvucbAExAKaf7/qEp6ditxN3/xacmFeupxA1m5hp48FrNl20i31Qq5jMI8+YlVurnxstwZPIVr
	TGr7Pt1ol4sZkVN7MakBmkcU6MVm4QGCvM86Jn8ogrJefRh/ET/7P14/Go3+MUTJRliN1rlqEQI
	R6UA==
X-Gm-Gg: AY/fxX5nrqB4OxbEcHRlfzx1w5Ms+sh8AAencN0fT/p6j1NQLGr6+vA30l6z6qSf0+t
	rLfwnOg8/tHoybBZRri4qYpQx0mB2ykNz8XFdYn2Uz+ijeIDTOdb67nCHJqpwy3oBaMRzNPSlfS
	0vmuR3uRsSdjlPAAuyTc6esWNdmwRvjJfTR7xV5YhwiuIhKBsaqOfZkUkFGwcb2EEO2h+Vz4xMS
	6UpsWIjW1C+FX3i8fMVMWh77Uc/PSconaPEcIt19P7FBzZ99ldK+eWldzwLRedXBIMKwLVw/QTA
	Lri2J3v1eOrEidLTK52XbWhTMdsU6DQAeksyPpIG+xUeGd15BntaDyAkfGsi6a4wTGvg8CSFbpo
	iSsPJ5GvcHsRZyW8exoksytXRW1mK+xewyqVt7BY=
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26528301cf.68.1767689582059;
        Tue, 06 Jan 2026 00:53:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7E9Dd0gEbHGw/qwmI9Kg/hwl220mH23Q9cPSWqNcPBGofT1gZNovh8hqrkCtABFulpregOg==
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26528171cf.68.1767689581612;
        Tue, 06 Jan 2026 00:53:01 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7fb1486csm13152255e9.5.2026.01.06.00.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:53:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
Date: Tue,  6 Jan 2026 09:52:53 +0100
Message-ID: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2BG0pPPpGDAh1YNfTf0ZtziGKqHdSt15
X-Proofpoint-ORIG-GUID: 2BG0pPPpGDAh1YNfTf0ZtziGKqHdSt15
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695ccd6e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=qfAtFR7Ekgvq_9IDEGwA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NCBTYWx0ZWRfX0LQu8i+e6VRD
 HgwsTQe0RYUyV9LtOpVbJxWjud8jcpgxrPDvOyoS/42oSgo6OfAd8gYxfiQdXiGdE0Yapb3sxJT
 aLUS+RodTHzFnnNC0kwRPSU6X2do2PRygS/+bdZHhJLaR7c0KNF8Yo8ko+oo9d8j7PPJgoF16lQ
 Wl5Caw9PwfvcmRBeAba0MC3qzI33u+CoEm/D3ApMSoq0IkZiiRscSjXkidnHIJu7EwmuF3XsX/e
 BzC6xIUUyNZO+wE6ndyNKdbcplTO+oK1KTrZJTm/t1NLF17ZTGorS4ohIDa2tpXuptMYDXITg9o
 JdjsoI8lYeF12OJ1qZD9TcAfQyoUNBUg79MwSposb9FmZ4Hf7N/VtnoMTniVdaEhkHs4fkqKqD/
 D+WimJbMbgjZIKAMNb0lku8fRT0sNAL4qepGPjPWENR5EVe5R+QGN9kUeusVnx+zPbGjwAQQajH
 ldPXFsmbptdWRAJ0kxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005303_857727_EC145B17 
X-CRM114-Status: GOOD (  16.53  )
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

The GPIO controller is configured as non-sleeping but it uses generic
pinctrl helpers which use a mutex for synchronization. This will cause
lockdep splats when used together with shared GPIOs going through the
GPIO shared proxy driver.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Cc: stable@vger.kernel.org
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index d9e3a8d5932a..ded7b218e2ec 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -893,7 +893,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,
 	.get_direction		= aml_gpio_get_direction,
-	.can_sleep		= false,
+	.can_sleep		= true,
 };
 
 static void init_bank_register_bit(struct aml_pinctrl *info,
-- 
2.47.3


