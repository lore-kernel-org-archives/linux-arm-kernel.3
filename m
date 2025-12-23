Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE7DE6F07F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=HVS+3sO2cp10UGOQbVuCCVuCkH
	lSzcFJfxRsfOafC0otfKdy/uogfhdmlFKJ0UdwOsQy17WacypVY9XNen8orAPX7Rb4eyJjgah0Dqj
	YtCr2ROehW1gX0t82aG5v9zMFXeKWM9itWIQjT/+bAOARDqOgyflLtdbmONDqi0iF13yjNMeve4MG
	9/f/nSpDuY1L2qoR+ViUz199Esz+2uz2X7zpuxrDko1Z7iNWYda9f/R5bI58RldERsrW2GYBFfbWf
	YPgjf/SMhISfOMBnXzHnC09QNYH6rfEw2epBdV+MwPGcJJAKGINJCRnlJbYAk9ZPXh9tKb7P/nFJQ
	Vv6+k8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGm-0000000EqH5-01oL;
	Tue, 23 Dec 2025 10:05:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGV-0000000Eq2v-0Hnd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9rshh1889299
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=neYf11cpzXgmFemA
	i14grOLM9x9385mdH+Uh9QeT+MPfvyVfWpTuR+OhOefbLFoWd2Ccp2B3D3rQ6Sc/
	xMeEZE2k6ST0z38HZ8ODBIRROdM1dDtDH2ToaCMZFo7nJyCKfVqNaecIxiljVeVB
	fBEVb9TvjRrvD8Gj6RR7MtVIv0oQDUqsr2HNpiQFzL36Sg69HRt4qlumtNEXP+hI
	5J55+A1r4PqXc/XgTzc8QJ1PfI9XE76eKBGbwg5j4I42Ugp6a0TfgNUxf9ng9wU/
	Q/gsoLVSdDuJ387PbmOBIZfFuPiAepkAgadBDqhWMtE42A8yYi+keMNlCKjpEhOs
	NwK5/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak536-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09693109so88914461cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484313; x=1767089113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=iVUJNPeuOWn3ZyZKC2Jkbw6N9tBfXxr6z/5l40bkb5yiqA5SdC6WvAOM+9Rrfqxt3G
         47XYaApKne1mRqVwLyz0ZzWaFTrEx2adV9O58kyeFx+aOJpUw9utKXLM27gSvYFca5n9
         iFQe5OPxGwN5B6zrsaIZqcXckgMMfYb6B5dnH9qIN46H900k4TCAybwHBTRuH49l76rB
         OZG2c2J2wTCLTbguC8myAoGDbZy0/QxreBj3jv157f4luxs0vOHK7fUWfPgHHFWXJxnD
         zf54bBjcweJy2HVxQmLH8sOSA4RVn+siwYb+ZoKzOLsBq6KtvI34ykwoXzfwkud5d+zZ
         bvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484313; x=1767089113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=Dn4OB3F5Nc9m8B+xVjfCyLxFGm8NilV7ISBb/UvWAYthQBcr1SkliI8sUxIgyxWKoM
         nIDnA2IpI6WGtv57MCi6OxNIHhizTLeHByGWIkChtAtl8ye92ZV5fLph9BUwrP5dMTx8
         OeBFdZfvO+9qTDC9HH9tXizT/uoOVZoYD8rZQ7m94JjAiW3/mAMZb4tTQpAlgtuVFizc
         cATWkM9g+cAqnBBtlQ8VUmHb5DazM72nN2e+52PESTpsBGew2Ltuj8xU5vy8Hgv1coUJ
         i5JrfPEgepCHPHW5QKrD2CIGH5wHRkjlV7Az5BuJXhb9nXHY66flTG2y6idjLt7aDSN2
         LDDg==
X-Forwarded-Encrypted: i=1; AJvYcCWEIsfEaMzkZ6BiJsGD0ZLdDttXbM30Zpc1cE8mYKffJRreO5SEhUwOHX9eyn5vmkUmyMO9fsG9et7+6edOPjXy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8v17Finc5Iuk4OjOvPLNDKT+Kt5FtF4DgyEPlVG/X9UrfX4Oi
	NzoRc90XaeBpecMgtFKWEEn7+hbujOz4GuHU0DXFYUcoSya3IoLHekpfAcM1qXKlCjGOStDx/3P
	JGhWX7iZYokhJThmmtfqHAq2D7DvX2HomZboOVrxtOyc0HpemKQatQQMkl0JOy3cJ+TCZ8bw702
	85iA==
X-Gm-Gg: AY/fxX6y620qY/oOJORy7t2LazptGyz6dyNpnF2jTDEHLwuhvliPYH3e6jjr4kpvIpn
	92YkLOV1/BtEeJp5ugRbxJAYGYubDm44eXjW1NPadjo/5FIMW19Vdlat0S0icg4ILHxJGMMKMg+
	xZCMSC22hkoPMWa8GpvOzgnkVfg6rDaZD/T3wgwMD0mCb8m8zc8gu+jVM2yLYwp8N9X/gk/X7YO
	asmtuuIHjb0aUyiLjMZ3o8Pdaf8NHh8IR4afG0TADu/QLOrumhKIjQ04GOnBQMWr/sYF3aP0Odz
	YPN2bkyWfoNlbo7Rkfj6/iX4Bc0zD8tl1J7V2WUClqJKICnsKh/VzBXBb2uDRyKRGqd3lfbt5OE
	dGKqGuafXu5lcjFZm7pa8FIJQs2X3vgTWj+Sf+jM=
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219101201cf.29.1766484313515;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV+mwTcQ3wuFKlGzRImOSBX3IU5W98ElI3KLK7HMccseahW4yo+ZXWeG07JWxNXrTGTWcIBw==
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219100631cf.29.1766484313078;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:46 +0100
Subject: [PATCH 08/12] i2c: mxs: set device parent and of_node through the
 adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-8-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlDjj4ADx2Rb3xlfAMnQkHbo+sz4ovgjz28L
 EWnVXIoR26JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQwAKCRAFnS7L/zaE
 w7tMD/97LcD5KIQOMf+6WEJ+Lz4Y1Sw14f+up28X7B/gK/6aOiM843NZ/hmzVa9bU64MhKZOtBj
 Cj79x6oDhbT1wV5CJqYQfcYVaggsb9jL7HAJeRIwncgaat/UWFl89z7CgFlrkF8v61h8TIaHNHX
 GUOX1GeUxGIYLIUhSbr0QRtiV6I8Y5G7NJDpEaKMez/2WGcT7J3dNyrvJex27vt3odTYWAmh1Re
 bUw7Szu+9wntv0yye4mU5MvTAagH8Pylg8fuqmausU57fvsxHKxY7ek7SJp639qLc4V7va+dRTD
 92Im5KhbVTPWmFi+//r8mEVUUP3aw6uhqzNvYjQNmBbN6O2NsQ1vhRv0UscP5PFPpUozR8Fwr0A
 GG3km2mDfVX+8hHy5Z/wncWcHzIgzSIgQMl/3/kvDZHfUbj7WsjgORc9MBuA0tVLmquG3SsMKI1
 MBTSirX1b0D1OnJgWIwT7BczgYl1iGQex/916YxS79M44kbMtaUPiEs/owXZpbkaeRl8UR7x2vt
 kGAtUZZM/8umqo40ZDE7R/Htuoxp+ZnmnOnad7LAQni7+SPyaQtQekWYayRzl6qTl2bJ10NLg1h
 uxTPPwxTWHIo6DnUtqr0m1Pyc6annr8KyI3AFwgncoMmA+c2ebY8I2rh5rWMU6Yfrftzojk2Gxv
 8yvkPnkIMS093Rw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX6ZrhDrHYHbs0
 hZzagE/RRSrQSEtauUBE9IWWYvirrFlN4tVxuu2ZqxjAzXzqwPDazuh9CMMpTZ2g117yWUBDa4i
 Z122P1UKLS+pB7wPNVe1E1S6aYYpvQD1/dCttAiFbglW73ilmjSnjeI1DnwAftVgSZDVDUYQexi
 xIujaHlEXSagmkpQfQXPZDVMRKh+N46mxcXXANDmjTh5D05rQZqjP/jTgLHY2nDM5smtboAj1Nm
 D1oWOCrJVBwa+/X0zJYGkUZ6B0My2KeZfSUM2nHFgt7zbRGvZQ44qmse1CqK3O5HaHV4ZkeIT5g
 cRAwWeP2C8S1/8B6iCBS5jrMD+jyV6qyoJ/gGa/wP55sS5ZMw5CLS/A7r5/9IDFD6jXZyziZU0a
 zE1PfxQ66JZgRwUiyIt6meJtiu78G+SsZsEkbheLOvez2+j+u+n1BXD3oObP1hiBUQ7wiKDdGJT
 NkVZOe8wj5c3MfFDssg==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a695a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZBRMoY1RY0NPWYz5CrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: kWwubMr5VFDXWFQ2-68xplwOIgbQfsra
X-Proofpoint-ORIG-GUID: kWwubMr5VFDXWFQ2-68xplwOIgbQfsra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020515_493135_21F1C8C6 
X-CRM114-Status: GOOD (  16.10  )
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
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	adap->nr = pdev->id;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, i2c);
 	err = i2c_add_numbered_adapter(adap);
 	if (err) {

-- 
2.47.3


