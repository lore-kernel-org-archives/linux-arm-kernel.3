Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D848EA4FBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=; b=aPwGTKCE2Dkgz6WVm/xpzmpdKs
	XeOUWOh8i6Sl8iGw13ozKgUjwZcWtj9f9DTvv+17pwGp7b8Eugo4pnMr6Mh0g6RimfV6UOExJOp+z
	Bf9P2X/uFWZlPu3xLBR57yhNrfW8iDQp5X9NTIEf+i40YKRkuGfJQSyesDO/aNHDw8iHYSYMn5LFN
	1BXbzoFUJgFNeKRWu3GDrEv/9+IlAOmOodIk6Eilly1USiNh6kk1VO9znHVB8WPLuCvY1GdHngHb/
	b6G3H0dtizBLYiwoXWsyDCp1mt9OdFTCPSy4SWrtsiU3dqRxUON2XBDCizJQDAA+xdmIfO3YNt1Z1
	0Ds25IEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8D-00000000NTL-3bSo;
	Mon, 23 Feb 2026 13:37:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8A-00000000NRP-1Fnr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:37:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9RGmi3337870
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=; b=mgNOIZOYdqaEeMQb
	ri/vqPoX9fCBh9wx3S+uAWh1y9/R60wqQY7ofww98qjP15gtNhXKd5kz42bdAee0
	eOE4jEXR0zg01jndXaBcI3BNyAkdY1h9AKf2mDvEBu2BnWxGS0kJANIqS4CVLqdS
	9ZGcRB03rlDMDme7gSzYbH5dr/1srlerCWQQ6GWKF9n+peFK+hE7hiSR4utjlCeZ
	zIkLp1D8k2BOzuMmzyjUvnU20XrVler7Ad9n0uj3IhoHUpNiku+XdCvDUfUpJKpl
	eeboqonnskflPevjO5I44TDftYCJ4cbaeDWoK/fEtcj/S9Rv++aA6Fk3MM6z03oT
	UU0p4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8mteu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b6b37d8so3911829885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853864; x=1772458664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=;
        b=eQheTmjbI62XHLrFYVeEyQ7LJ877kSG+/3DuGQo+ngIw0GvQH4l4ZCUXTHMLlBt+J9
         GCAXpDTy6qX/4n4ClmYW90HiWsT87gGgB7LU+tnDul6Hzyb5Qf2UqcyJQFtkGcsD2Fx7
         02J0h0mV1JKFmiGP3/S60exXsTJCy51Wvp1ijK/BpXxD/g/MWtT3n9KDU7sF9rhD6AcC
         u3OP/EqB6tjiI38xI+TgVwfdD2e2+rvT7ZsqTCtcbklg20RkKiBav3Lc7RNOorKPeNB/
         Cv2DQyyCKt7LecIw9qw+VSrC7dkNCHzQSqWn3NZFtg++bLh/h2ztCtz3Ya4Nj82PN4fJ
         dJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853864; x=1772458664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=;
        b=Fr0zLOr/0dRAqXSh0c0Gm4gSogKFa3xJQnBDB7d+Z7uRp31jfsaVc/9PnqrViM+iMx
         GdpthRDHgWjoCMY7Mx0IsuzIanCEpzjt6d51sYrY6sye+92C7QCpDtZKbAfAi/flsE0O
         Ehg8JaNs6/X2SfYnW2HikLJ16JVfUUDFmFa6SK4S6fJhUF1/3AFhVoj0wMkj2B9wFxbY
         cjW53xe7b2hdz8c+5zAVBR4E6l74lAynU1BkZ+cOib9Orrxr7QVcKKLRIQRYOOndj34v
         0wbM67i8Uvcq5f0c5XWkDF3h46oz9rV0rc3RSkqFhwxQqSnXDbk7Szi0atkzPm01t+sp
         Nk6w==
X-Forwarded-Encrypted: i=1; AJvYcCWEuppBOpYMtreklY4ni43vdUmUGb6+C2VlvCefcMcr5+ixXf6glvW9Gy41bnDh/fI8CaaHlx+Asqv0rXHdLJI8@lists.infradead.org
X-Gm-Message-State: AOJu0YxvrP8UWpW5DvsDnScA5PQPatpt2W1DBYLYDCzR1M3e2Xx4pgpO
	r3z9K0jGku8kub4Q1kTlNeSOCyB1Rp7ENItDDng1Gz1qJbeFi+iF7EmkgWSdNPD3C+HXdPmxbWs
	Gai2FBDCN+YRLliqcsuETJt6BoK5MmxKGJYX6EiG6aPKn5LI4oOlK45GekkUT6tFC9/CqvwqL9u
	O2dw==
X-Gm-Gg: AZuq6aKnu3QCnP2GWfOwTD0fNqYJ1Wi0XgNaWZ/lR4+b8mF2tCJ/OI3Q4MX5Ob8JF7V
	kYvmYB6z3fWUVrDy5e7mVRwOTycx+QyIoIoH5RooNJG+su01wW4w3FIaT+MyR/HDZxbJMq5yeUP
	Xg6eK/0aycuQ4rIBWm1P1LrWlQueFiwuhFfmNZh8EobtajZWgQgWEnOKCQg4+NIoZkCuU5PcB3E
	1IyCkHXt6NgjPyUHbBbHedgc9S7McJEReCZLGWJJH4zgE5MFmp1S0U0GFFqbDpcVyv4JMmvqy9k
	leMCnadFmDCXFq/9h5OTaX75nBu6XH1dxWAq4APZ69nJAuotdndZJafaZICnUsDM4cnQsuPFZ4O
	yKyGs3kDGJAGUKa7iSpt5Hm9LzIxibnDpvjFSsiK1D7jh8hazFqM=
X-Received: by 2002:a05:620a:4492:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cb8ca72253mr1151981385a.53.1771853864479;
        Mon, 23 Feb 2026 05:37:44 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cb8ca72253mr1151976985a.53.1771853863950;
        Mon, 23 Feb 2026 05:37:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:16 +0100
Subject: [PATCH v2 1/9] of: provide of_machine_read_compatible()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-1-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QPmNRNSabXl3r0S7jPuSa+7dPpXvOPNSvq8pxO+7W4U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgZHBYkzb/CkVSuWiIkaFvkB1D7XlGgt7SZk
 chVZS6T0G+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYGQAKCRAFnS7L/zaE
 w+QED/9rJEQy7HuSo0BQ9ZoeKG0P8FHVreYTHlCWGpsvaRCRMVMEZyB4slmYakmKcWwbnLENZY+
 1jIDpUXY5mLSHXTBrvHdUX6k60h0nmSOtaSHaJ5CwTfVjYRZOIFm/d4lNiJWerGRMV4SQe4X3ja
 ElpspUQUiXTLqsn/oKdVztBdHfQ6dBu1h6OxB2jg7DTnJ6AetZfAhGOhrKSrpBxUEiHqsUzniBf
 Qag5wN7j1cez9TTi1UBpsMw6M2SvVq8S0qOP5bjLmfgCM19TW6oj+mzMS5upC5HYbqPxUQPaB+v
 P60UueWK9KgDiWBdgNtF7igKVWiFUTIEWQ6QMcJXKpoEERLk+oq8SMJdcijxhcZajFfXLZ8ouPb
 7JVcABKecdQB2lD02pkMg3U3BQVszqyyGcfNur/rhPdzgIclUBm8MnHdp9vSje5kjv9en9QKHJ7
 CW7zKKKB9MU7VCUdHsUfXx18MOWWzL8fPwQ4+f8fmMkJVNPopP10lUZ8soUJDtOHhihRMiplcJ0
 rkeqaq6C7WB9ZccLKFP7/4brEWVRkh3IYNwuisoflhZHx81R9osQr0U+ln92f0YFQukvCpWQOU+
 q9SJQrjsARlsv7DOFf7Er6rfjK+fnpLqp2sGBwUL78PcdMaGpX/udpqn/CgJO8S9HPHgVVsOBrg
 xHABeyImOD8ufjQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: jS-W9BvC-z-TY5udAs9QJdlYXlpIpYiQ
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c5829 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aMBEx6ZYl_lYKPCdRXsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jS-W9BvC-z-TY5udAs9QJdlYXlpIpYiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX+8iJjpCFbxwb
 YMUyi8a9sNGIcIqqUv7x67flB2vsb1Fik5x6g/vhyIBSSSZAWBk7Qz7J9T2VU0AvWvqtoR0G/Go
 r0rocmFCaPSE7I4/s3uZCInWA3fidfijUeIvuD5EJ7iZPLY47SCopmx6jniKDQWfFv3rOZG9cvC
 LHlvUcn8GUDCzWWEDc9hBXkO1ZqtesyBOOsaxAK0gWePqEB36xMlavA+opyb79puYqvb4P9OPyc
 sAbTt9ok0OGWcVdG2Lmjl5pbgCnRvxIwOOgkCFEO3accD0gafjsjJdkjdTbEWj/0xPKdqKB2d2v
 V6k8kDlgEkidONxd+FgOSdTa2E1P9c6S4BV5+8mwks3yMwYMUuZJdAEeLtN1/ANd8CY/96gwJDG
 wZEVI9aqVV900cqgJXB4Q8GKOhOT1F/AoQjWYPdQMcfEHVPCL1QYROziNsehPyl51V2TiACvI5p
 9N3rsV8VyDfeBNOF+cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053746_464316_5F43294D 
X-CRM114-Status: GOOD (  15.24  )
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

Provide a helper function allowing users to read the compatible string
of the machine, hiding the access to the root node.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 15 +++++++++++++++
 include/linux/of.h |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57420806c1a2b9a3c67b5dcc0f95610a87c2e46f..b70aec32e0e35ee232b413e548742491bf763df7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,21 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_read_compatible - Get the compatible string of this machine
+ * @compatible: address at which the address of the compatible string will be
+ *              stored
+ * @index: index of the compatible entry in the list
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_read_compatible(const char **compatible, unsigned int index)
+{
+	return of_property_read_string_index(of_root, "compatible", index, compatible);
+}
+EXPORT_SYMBOL_GPL(of_machine_read_compatible);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index be6ec4916adf522aa5e4dcb1480fe91e1a4e29d2..7df971d52b556f21b510a8b5ebfc8df49a2a6f64 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
 	return of_machine_compatible_match(compats);
 }
 
+int of_machine_read_compatible(const char **compatible, unsigned int index);
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);
@@ -851,6 +853,12 @@ static inline int of_machine_is_compatible(const char *compat)
 	return 0;
 }
 
+static inline int of_machine_read_compatible(const char **compatible,
+					     unsigned int index)
+{
+	return -ENOSYS;
+}
+
 static inline int of_add_property(struct device_node *np, struct property *prop)
 {
 	return 0;

-- 
2.47.3


