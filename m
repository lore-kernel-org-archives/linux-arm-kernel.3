Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3786DEA4FBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=; b=sQBeK0C+g4Cev87Z9bC5z5R5cy
	GST+PWKK9gon8NQL8CYZyrp5AGZ8ufnmJdyse9Gt+e3O7eQrckXhS2YEcycnZ9fZSB+Ny2hw15cfa
	w1n1tA4F7FUIxYeHxGl9x+TuwXX1/FxvJORYJf82rd3cC2lbS3OqsoMTXWijQYpb1BNmJES1ymG3n
	ui54vQEX7+a5ILzhHDjv/5oz8wh/npUzce5+OLkQi2vX6ZL+uV162QizckqfnSMTUmb5AZlDRBHPn
	A7Gl6hmgRgsw6Ft2yo1h97OZqMljTBKc2iWht6tx+EKmu5zN1OdmoTCt2tBFer/ZK6DX7eiFerPGJ
	RIQIzODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8H-00000000NVH-0hMc;
	Mon, 23 Feb 2026 13:37:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8D-00000000NSa-00j7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:37:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Bg1X1249093
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=; b=Gc1bpG03f022UNad
	fUDzodaBYofNggGgA5AoUsJO8Cae+F2eoClsfjq8mxraTNEdYl46C2C6dPC6b3oc
	IzwMC1C/OASIq180M2ajZXcnIp4sTKme4BS+j46IJ08VbJse3a12CtSUcWOw3xWm
	IMALeVJl0dsGdUKPb9T5wdbgPl4ypkerwEVfgE7Gr5Aq4oS/Ws2gXQrb1ipfaPwk
	659QB1Sbq5CYS+qe6ZvsFhsoixSsy5+yMNbsWQg89wpUSgTI9fgOpFd0TPe/Cyew
	oYwByt+dZsthF1xqJsVtY4bAXA1gsXI7ionPuAHjcZJZxSjqyMWzYaao6/nX17je
	WouRQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so487983585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853867; x=1772458667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=;
        b=X04xoxPRTIO4UC51BXLnc5beRsVX0q//Asr2Ef5FUiyON8o9TpDKHzhcfT0yP6QPbh
         9vY50FFJBc0FPIx18nKcghOjAYTy12hYG8WydWVcXt2+gq+UcECRIkjrIAuPKgyFxkzS
         +PKZp9BFDl1JuS7SAwoJ7lVZksTL1RZ48RxZVdrIE0/taJcHYE76XokyubwFPfJ4tjrY
         mpko0pTp+tqbYz0fwmlxROyD5mAAsTJVvGkCOVotHiFIDtXuSKxVXzdvrdWUrEaE8DdM
         8IVL96xUc0GgmMxS/79Lk0syGJLxO1zIXVG/QUO9gTxFUxfH8UJOtXJBW9Y6q78an8/H
         FUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853867; x=1772458667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=;
        b=Oz+7RbaQWSJUKLzp/hBTr5xDrsJP+PMTEPhEPly1hpvrkwS8Fvs7PZuGEtqatm0nKd
         4MYYEnPuQIPXjaRRKMoPY5ius1DBP7gKMNs7zPHP/7GWxP/o19Zk5rSWsJXyozYUHheH
         Grjc107mpMf2RyM6YI98mGazKOz+YDPXOTrO97EsmtZfrkXLg140+DPCo4NdTyC9aFuG
         znkEASNFcuhKCylWLDBav+nOrH7xx9JjRTGoKzFqLp3eiiWbx8xtzCtGWn99KAYqdD5o
         3/UPcSJrwq826hfUiHbZAkknSIwYrLD2rKrQpt75+olTVgbNlTaePsJtk8725GgX4htq
         kTFw==
X-Forwarded-Encrypted: i=1; AJvYcCXgdN7zfsiFGzwd0k0qn8RHvxTT4Dt0Q4o3Kh7XXgu2+whoYbnBbZB37mWPL8nfZIs7LzGkbxdf3l8xV7h1FBcs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5AST0z9SGNxLMcsxKlcWdlWyXoaMVRfWQ8G6pCSV+iTmKGe5a
	X0LRbnUVojPXNV1ttU0zz5wSorZUd/l9/SL+2+YHDBa7fqOm5MGxVhCzcecgKLHeO5v7F32eMV7
	BUFlNaFo1srYDGSLrhAVnb61be38xqQZBMT25lM55vTreAYvshcsTjQhlLKiPzQiBbJp4NdUiwW
	sxkA==
X-Gm-Gg: AZuq6aLRvcuHJPZyFRkehVLM9bMxgNImZvHZqrM4kWMsuHxdaDBN1qYQf6H1Xhh/D7p
	se5RqDjY1l5XPvV97M+zhH2X+wIcDHiQqGID4BcBOOxI+QfQPIHuBOTvG5XToM8bdKMUo8zGq9c
	9Bt7mmSEQf914me6nozl0SaP/mIGpoWeErlHzf4eeKMPfgfV/X+4bRbCcPHTcVC9BvA+aQw8lTK
	An4yrBg6OLftJkRZYZhqhGsB2H/631ouyVUZKWtvq6gmTn1opwe0sdy4/4ivNXv2B1nDDxSLEV+
	MbO7myxGEyF4sqNALDwjlWpy1vD0VkJZDiug64MQ7a+bTGiZSUTlvZ4v28bKlGzJDv1VImgMOJ+
	gXDXE6n5e9G+5pkr/gvM2DH74yVGhxrUzHusbdwMuJ2DEgte5aF0=
X-Received: by 2002:a05:620a:28cb:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb8ca8205cmr959711585a.64.1771853866888;
        Mon, 23 Feb 2026 05:37:46 -0800 (PST)
X-Received: by 2002:a05:620a:28cb:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb8ca8205cmr959704885a.64.1771853866254;
        Mon, 23 Feb 2026 05:37:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:17 +0100
Subject: [PATCH v2 2/9] of: provide of_machine_read_model()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-2-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/FJTjprAWyIQ0p28j68CoxC5wxhBmOvR55ovCeBCxn0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgbTl/b6yX8U2qdfd5c/S2H7znWwXym2k+pZ
 MO32cjbGJ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYGwAKCRAFnS7L/zaE
 wxZGD/4jPIFbh12WXp7rntI8dFBgq7M6R5+xsXiKYS1w9RXHJTI892M+j1L7beIpUNcpYkqP3nv
 vmRLcAyEMG09INav/3Z6yLcTOENIe+OvXqQJ1guGaOmEPg+isS4JYzMckXNBL0+QdiReYpyNXE1
 rkxJ4wyEXgoGenzNem/5lqGcgvHxFmhXT2ilVostK2JOmk/NlZ2D2x+uk9csiTfV3YObr95sX1b
 GveR3OzPuKuYvA1E6s9icHhS7nEq9xKXBcI2B9L5qwtsu8OXLpM3JsNUNx4vfNR4n6IBd8d8kta
 SJ+l6SUSwWxM+MGuC2wSB+a5GcycljvcmLKjRphj7duZDne6er392axMkRJGhTxahwQ7pyvnZwl
 Uo3xOLG0wfzLtLUhoWo3ehlZ0bbxzkhaJ/G170mFfWSQ4F+tasn6CVTXNqfmZiRvDeMWVAQFH3T
 48Zlp/AsnbU/0/ktaFdf/sgbYpdBpKWM5I/OLg1qYAHdEeRgzPJGUTtnK8C6LbR/nQgXJq6yjgm
 OW3xwuOaG39ZjEXVUtNiInBsxOZFETmmWfaSYMALTPYrsLYrP9vEnRQLvhDEtTeJ3uoBxJjqQe2
 UHrm/TILadf+0Gd9sfzdKQQAMUCkOcG9oP40wWr1pfsRZrE+OdG5s6iGTI6gMNbEKDFcJNWst0R
 NJIpI4bRnU3W5Ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX8ydXMtFK6GzZ
 QG0ravQZXdQ7tlz0el4BoLm8YZJttG1BPxRBOg3xA33cBFUY2m+J/53sY2VY/9bOLC6s9B8tj4F
 KjcnoPGgSzWhVVRHqTWnQPvbBo+GN75A+WV02hBRx8kB1PnVNpI67zTppcNT/itJqlMbpK18jvL
 +MGRmHqUzT4FyX/NKpZcuRODU/lBNijqoHLfOe7RqrxIB2nXOk4Qa5n668w+NdmtkfJ+XhNh1mN
 2fLcERwuDlrZG6IjgD65jbmPZ8JU2U83L3OaN5rK1rwNmbvV2x3lJiIq+wRFZ4+aP647RKFsd2N
 uOoqv0o+4QuoxW8M596EFZuwJzPg6MXvdxRTLxTYbAjTqVvpAu9t5qP3uibOjkEpARMLNHwjt8c
 UYgASsFpsSSw/sF5rMfId1ptCpzqZ6cKi6/QzrN47gs+KLCup1NCXfnWgun4CP3Iw8G3CcTryOP
 J63G2JgRz+CuVwqHGpQ==
X-Proofpoint-GUID: pQcuyIbPGFK3TbCHtz7JWGl49zPquzQe
X-Proofpoint-ORIG-GUID: pQcuyIbPGFK3TbCHtz7JWGl49zPquzQe
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c582c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=F_zDPpySZ_qbLQh0X2kA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053749_166667_6B3BBFDF 
X-CRM114-Status: GOOD (  15.11  )
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

Provide a helper function allowing users to read the model string of the
machine, hiding the access to the root node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b70aec32e0e35ee232b413e548742491bf763df7..bf4a51887d7422f5b8bfc63c7b20674bf03d800e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -449,6 +449,19 @@ int of_machine_read_compatible(const char **compatible, unsigned int index)
 }
 EXPORT_SYMBOL_GPL(of_machine_read_compatible);
 
+/**
+ * of_machine_read_model - Get the model string of this machine
+ * @model: address at which the address of the model string will be stored
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_read_model(const char **model)
+{
+	return of_property_read_string(of_root, "model", model);
+}
+EXPORT_SYMBOL_GPL(of_machine_read_model);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index 7df971d52b556f21b510a8b5ebfc8df49a2a6f64..2b95777f16f6ea1fb1e4bd0d9902cc2640d14795 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -427,6 +427,7 @@ static inline bool of_machine_is_compatible(const char *compat)
 }
 
 int of_machine_read_compatible(const char **compatible, unsigned int index);
+int of_machine_read_model(const char **model);
 
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
@@ -859,6 +860,11 @@ static inline int of_machine_read_compatible(const char **compatible,
 	return -ENOSYS;
 }
 
+static inline int of_machine_read_model(const char **model)
+{
+	return -ENOSYS;
+}
+
 static inline int of_add_property(struct device_node *np, struct property *prop)
 {
 	return 0;

-- 
2.47.3


