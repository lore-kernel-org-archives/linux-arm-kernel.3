Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EA1CCF2E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=; b=SVzZZaQgnKWC9gSMoctatWWgTG
	0w8uPK1HoDRsuYHbmF1R3Dqshf7gPXuZW3RerpJcW3QDTRclZFYNURuvSNzQPKKzdwIfWdt3Kp9yq
	mcm7x7TpbCgYwKm+qZt7qmfiTW6JA3q+XFykLqkBXVgqv/Tl7TxrVte8NtMAvo7SjXhFmAzIrSkrs
	HNomTFuYwrAVz1qQVfgrgHuXtDqo6cBQbAoHeEPhjVdeBs42P10KsXCE8Tac6d/NfMBW8NEoS7eU7
	WA9JJ3jErDTopWruV8hkXIDgRrXlkvS2kctkM+pMB0AxYQfqq7Ib84Y1gDb9rXn3CvBinttjqmtnA
	zgqOxXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgh-00000001muc-3Eer;
	Mon, 19 Jan 2026 10:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgc-00000001mr4-2iuD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91Kra1562341
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=; b=mTSZCYGYxAkevOo7
	gd8DhgvlCw2G+TF2YmU4ce2OqjAZgUp0h5R25s4At75ht5DXKZv+iD0ix6f7qJiQ
	hn8ilUHRcSTcU0kJIid2VO3wNM85z8XyXRBC0uLAychv0CYc99AFwGDEpOfAQsq6
	zFlZ1ZkBpP1hgsJCwDCESGtIspAXWq6IabqNX8wJMEvFaqs/Bu+ZqdQ/mRehwy40
	0DRW5dOdFJvWhyCDUhnlUKlnSMeCDpCFywyIyGchtzoUuJ4vFsFwiLYTYf1vkZEO
	sddrq+ni5yBTg5sz8+fix9mZQa9oZecG0nfR+yx40TVOCTiUDeU+WEO75A2s/Gkv
	JbXdFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dcr10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a241b5cdso599649585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819241; x=1769424041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=;
        b=cH/m4Tqp3AKO6/8/UFIql6N07Bh8AxxainKd8H1HZjw+ZE5yMIktnwce3HDHw0lRh3
         Y7LXiKOai3s4sFiHplRyh1wpf5MMuUTt0XbxqeofpyTx0z2wwyGzh8fx3Uctq8to0/vq
         PeCJz8l9klzlYQ3MlDPma2zu4bSHvIjW8IG+AFgiXc2U1bOA2laoNs9Yxi5ucMxiNL2w
         bTCy5Ylu5PhsO+x7zbj37js4EAoEs6NX3sE2K+XNB1qsnQxgsct4iHok53P5yV77O1uW
         mVLvQXlYt/3s29Xgafoj2OApfNjXavi9OZ/SrqjDJxfRv27BA2csO16O+VWZEzgF02bt
         ZEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819241; x=1769424041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/LoGOYwYqu7kjSp48YkCIUHiMPCQCLxRjW5XuAafrI=;
        b=vbUI56YPVSDd4CmyowRslCSvaTj27Whg1FKvdM6tzGcpIitD8PxKygppTCWQvG2XKa
         GFlrmDIlYP+C5QMIwyqzNsUtgxAjHk6PDF24IVd1lUz6CQXhGlIMuC9lL4pgR9O6RI/h
         o5+3R6YWTVU9WXnDT/+1ZbSenWFMNIcKWoRjXIU5wZ9sTZzAyQCb8aYr8hA5bc/mWyws
         BDDM/hm/hVRu056IaJGBinTXViUWhUbbW6GKZ2VGHSg0rFwGO/L5OPfgdeTOhhLITgVq
         NST8BomaoXQP6oQcUzNsQ8/rj8nO3NWCiBLmGg+9AIAwgjn2VWM0ubJKeugoMA7UBAkf
         ug6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1Grp3Bn2Tdb2nU9X7SjsDQ3q5DSjZ5VjhWAn9e7l8nh5QtqLlNnx1WBYHki6mrMnrik/3km585ExbzDxDWM5@lists.infradead.org
X-Gm-Message-State: AOJu0YxywS9sTdfRCg8D0H4Jm1ynDcQmGAEtcPQpwnJCXfY/Xg8Ko21B
	o/X2OnIiro+G2QTT7KItoHxzynaEdsbyxnbhhvn6SG1sLMfV9Lx2WFHJvoYSaXbKl/zsUjoSdUK
	iXhxRaVjFXKUT+Spd2HoQbLosYi3kL+l0Wd1equak794N9sMHRY5pJ8BhF0wWdD/MDJxNqTgm7d
	rMxw==
X-Gm-Gg: AY/fxX4DxGDwi9Bt0D2H5uVTNdfJ1vaztf+243M5Z3EaMC2I4DPAKphcVtRFxNo3e0R
	oZEGjt2EStYVouoI4BI8gKpLO3Q5vJmZbvTVJYNx9s6NyTXMbF+l0WYexvedrU64i8U0gn3XxlI
	zH4/7RCXxREKhgZ1dbpNcuyiEBX5+i8PJfaPO6UoRcO5mDt6lcfmMwIGNz/vK9cN32IToo5u8kv
	oudBYhrYNgM05E4PLUwlTORP00qGwYWc/gADQcQWHMQDzQC6alc+BiDea8LQPjcPflu3S/AdIc6
	tEFNEBN/2MsaT2S6oMNyaWbZ3CHU5HVQmcDVCEeP5Q70VvWoGhv4vHasC5x35iJa1GROk8OxmS5
	yQx48ziyCSCVcEpVJCB4saqsXGOJcCkgwn1POyZL2
X-Received: by 2002:a05:620a:f12:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c6a678a15fmr1447749685a.76.1768819241289;
        Mon, 19 Jan 2026 02:40:41 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c6a678a15fmr1447745785a.76.1768819240809;
        Mon, 19 Jan 2026 02:40:40 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:17 +0100
Subject: [PATCH 6/8] soc: imx9: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-6-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tmOinQMvmCibhbCwHvJ3zmzJO/881x0pFZ+yeG4eMow=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoaZOGeOF3pZEl3wpwrdehCCmMNVv6rHvvj2
 g07QncJEh2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGgAKCRAFnS7L/zaE
 wz8FEACDVYRrHBRKEwgRYeyUXqwuQGeHjxuvsicgXR5w4UxuqTDgb0S9TMOw1/OAzHqh5MnQ+uo
 SqYW14DnPr/qJhN380jD8sAf8m3c07rptk82vjB1r0jHMCs0UsC2gz3ktaurpass1/AEuTDdvab
 MExkeCuTIysQtYDTbg/2EfpqCQ9JYZQsh2cdTFKmpcvX9hVISz1qRZsR8IMGkpjw8KrLrCLoBIM
 hXvWYhNU1p9jDJyHH7FKxXN+Us8so79s6rOzbuF42lE9nkgxP18Lnxom9VX9k9Y0gkSYISww/ez
 ln4P/IFjl1XjnZEqPqgQxd4nfyIAQpDderdrJRGyn7MC01KY26tW9CBw4Ayt2M+d1JZcIFeQIzD
 u5uUSJwFdn+0NGon9ZP6E0sXrH8pj4I4lUmJ8AQuHuCbKdZqRyM0RUs+q1m/+Kp6i6frVvsSdrT
 3UlFqtsGaTy+i8THnuEBeU4z5v4tXOZgk+94+Pcy/mrrdP/KD/7ZXcGaZpqyKWiKdrt/jnbkTpi
 AgE3o52+zKsYE7rokrf+02gSJLlQ0zijKVDMy3XsghwGIuq6CweA1TeEIXUw5OnhjOP2hDvF3xv
 45rvFr/C6WMXDFx+cLMS8zPk7RktSKJvCzwdKo3eimTJgJRx+K+rrHK262ROsfP5hz7ckmP8pM4
 5oM+qWGXbSGvkjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX2jRVD2Y4R8Ac
 lvy+tjzizOJG+dS9n/7YtuY8RH51nQNsMrXQQHMeiVhoVmpWhxBQvHcOH2gKybIZ6qoraV5vD0a
 drqoyarS5Ka5bsd1up8MUdlANlygie8YDmKN3h7zPk3VkgstGIAeVHI5VchjKwr0IocMi8NXlhi
 HBkZ1G0qgobgbzTOro2jHYlydXQKeAqfrDKykPwm6hhuBjlNGEsyRawjUuPJHXRY6+qORSIwY/O
 r1AF2VCOS1zhJ4GGzccy/M12yWNVGJPEje3IXIPbWJzjBP+Auf645UwIEHxkaxkMw2pBh+vaYJt
 wuPIPCaof9wH57V/gyc8qngVmiAF1asCgdxoaLiDCpmSb0t9gawjqon5nigTPNmvr2sMnUSlInK
 ND291MUYFG67xvEPg7YygZ/9zqFrfczvgcXa0zqU3CDvTs2W1FFo94klRkpIE/BWVa6GJWDLXEu
 CoE1kDfk9nSorAbBdhw==
X-Proofpoint-GUID: j67IsE4loNZk02wSvmYbmtdQ8SMFO5IA
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696e0a2a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PMAhrox8fQbXPR-8CfIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: j67IsE4loNZk02wSvmYbmtdQ8SMFO5IA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024043_412890_81A98C32 
X-CRM114-Status: GOOD (  18.68  )
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

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index b46d22cf0212c3f40f61ec5be85ca11e5d3207ac..0cea4307ac3923f416a63bca793a78835d868448 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -29,7 +29,7 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	if (!attr)
 		return -ENOMEM;
 
-	err = of_property_read_string(of_root, "model", &attr->machine);
+	err = soc_device_get_machine(attr);
 	if (err) {
 		pr_err("%s: missing model property: %d\n", __func__, err);
 		goto attr;
@@ -103,7 +103,7 @@ static int __init imx9_soc_init(void)
 	struct platform_device *pdev;
 
 	/* No match means it is not an i.MX 9 series SoC, do nothing. */
-	if (!of_match_node(imx9_soc_match, of_root))
+	if (!of_machine_device_match(imx9_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx9_soc_driver);

-- 
2.47.3


