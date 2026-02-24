Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1247E9B249
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/GqP17qL1C56/w5WwjYrwodd+5ODSw5Cq1RXmu3/4NI=; b=R+fwS0/zQDY4Wee6liBQE+28I1
	1m5irYEmIMZGhsCa881Av4a/TDapZAcQ9sTBYMyvmuGDSKVkDyvcdF7LK6sv4rg5KYwUOmVplU9DU
	cEDirNy4BNTWsUnyuyHXyV/x1aSNWj4a9FlWEFvHdMg723JcLl5S9/Dw3VHUObwDfUyGs+mlElhoU
	ZGPMvLNHl4/eYcIAvLD0epV/FSMesHsEc01kUxHCgKxr2aUP14IbPWaAb8GHPJYbNa81WudUpE2uK
	F/RO4irGY40TipgrmTUHlxZ5DuHqC9MeJUBftNkEcmpHaEPbagOmK39My7eIponUeI/bFCQVOPMos
	JERzjz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuprr-00000001s5v-3L0A;
	Tue, 24 Feb 2026 10:42:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuprp-00000001s5I-12op
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:42:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFULZ3884521
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/GqP17qL1C56/w5WwjYrwodd+5ODSw5Cq1R
	Xmu3/4NI=; b=NBAncbBID0U7GdUe6W7U+YvYxrT2f1OnZIbLJH0vJBhVCPGD/y5
	Mh92sJBbNLboWNq2SosudgPTsXITxbJwmeXULp+G6V5XKGOWdKvYMPIZMefHCcCr
	v1sqihd7jxZlg6vSza4tiwff4vQ2Q+IpD5YSInN4bKlkE6C4zEA6NQh56lzmVc5D
	KSE2UTZiQdJNYSJLVBr7zesxxk4F3wwTZRqJZpbFI5HzYB74wrku7X5/yj/A4KzD
	BdSpKrK29atIuoFQQIPmQhQq1U3sxo3cOjD3CfVODIbWX8aa0QKLbi7n6ADWzPMb
	gzUKBrl5GxKv6r/hhTh9tIMrVrv7DDvBzOw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8tug2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:42:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89473f5a755so622606006d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929731; x=1772534531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GqP17qL1C56/w5WwjYrwodd+5ODSw5Cq1RXmu3/4NI=;
        b=ILfwLE80PWl4chvfozjtbqpVpC29rhuzHYFbM/gTkRc7NQSvu8iLwDRKM//cW6bl6o
         y0iHhS+Y4rfemEiAjuOCfqUqOOrtxpNs41wIeLpyvJDOFq+x8mgthBcd+huN8y12zK6O
         SkCt7vwWHRr+XwY3B/O1p55g7VtziAiNyWxu3CILpbMl683l0RzUuPK6YTUQmGmJwJBf
         p9U4/arr0bVLjM5jscM9jnHA6qHN4RQ9+vhaUEVaiZyaE4v9cGCQP1eUROo505rTKowG
         0HrCWJeS45GYgWiSk3N8c1YwdLRldz0WYWLuNNb6AQ08EhrOKoAENAl9jdq76Npf8ode
         Lnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929731; x=1772534531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GqP17qL1C56/w5WwjYrwodd+5ODSw5Cq1RXmu3/4NI=;
        b=czmO9dDMDlYCql4wZs9AiBMdiR+cWTMEkFRWm/VXokdZzxDIGAmyrXFgFKSVxJgW4V
         dTb9FO0Wi54TJXAetlo1i0LS2aLxzYiQ0aPe2qPgmBOS5zQItLuZlN2L4jbjy64iQ0rN
         mcs2PfzlkhuDhlcJWPzO5/qsj+wb5GCglrMn6+KMwtC5PbbbM7z286+SAlxoactSwAv+
         CiQPz+rRx1kvAKCrVO6N+CVx7s63RtOxZvq0jbSXFmNjb1MoQehLgdAnJSwc3HRe2gQY
         nGUzr0D5ZRpwqoVfO1HawunbSv9L430k5XcBE5n9XEoLp8tjggCBOPwASgpmk4Al8uT+
         mjwg==
X-Forwarded-Encrypted: i=1; AJvYcCXN1fhU/PH3Qk8F8r5RwnbS5WLFB07MlwfV1/fwh6UAGS0nnYlfrdbJtR8/8468ta64jRBg5DHSBgyLmbn9BPTe@lists.infradead.org
X-Gm-Message-State: AOJu0YzMHVZtL7FxDGOhmB2LeZyscu6R8/4xVJq+lkbvsSgbroyCG2LB
	ZAueD05LKyYtfJbMX+yVmbZPgROPWNN5BGKiLc0yude1KryTvzfOuFXk0Z9G3dkkO1ocpSSmu3l
	v4ZTTjA7LxfZVuNorWT53C7JybrW00V7MVOxaPz3ECmEQdECb0aUu3sWRbI8zbyNIVwZ44Pdr/c
	Rw+w==
X-Gm-Gg: AZuq6aJo6f7n/nHdN3d4ogJ6PkHPiIYk29wv7/jXVcDeCALqX0ZCvA5q9ya6vYbPxhP
	5JdoAcTXDPEtdsFnrRnUX0U4JEWSruhAZVP7earm2NhfAhB679hA/d2UE2LlTccjjj94E0Xaqsj
	y4QVZJB2lbQGvDXgi5PsXWPFUQSXGgY60qGx173GBsSfuSWG+e8KPVrQa5RcAXFzX7ElYGaye9m
	83GS5NpVwhY3ES3hb8JD9H0uKBRUlhykCDOiyZgxCr6ul1v2+SRXZgq7QsgJGSV0/BqaL5N02F0
	GwO97aumiUzZq33S+7iNwgvcMwXz2wqp0TYdZsiO5eKiZKmTBqce96aEGXAChncQ/CFcEWBgVIl
	5yhC19B3RE9V8VsQ+W4W0LGe+SculowB9nsXOYA==
X-Received: by 2002:a05:620a:28c3:b0:8b2:f2c5:e7f6 with SMTP id af79cd13be357-8cb8ca65f56mr1405654285a.37.1771929730839;
        Tue, 24 Feb 2026 02:42:10 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:8b2:f2c5:e7f6 with SMTP id af79cd13be357-8cb8ca65f56mr1405651385a.37.1771929730265;
        Tue, 24 Feb 2026 02:42:10 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25676184f8f.21.2026.02.24.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:42:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] firmware: exynos-acpm: Drop fake 'const' on handle pointer
Date: Tue, 24 Feb 2026 11:42:04 +0100
Message-ID: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14898; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=OkAqLih86eGhs+AlEKWaQ18KBTCIZs5r/UQDwG2RYzs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYB7V7tGPImL9hJcV0yofAD0uRgNe5D6EZDcF
 /YkfFfbOiWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2AewAKCRDBN2bmhouD
 11LZD/0Q9SfAdiqa9ATtkIPdMX3sAmI/Co/NoKAvh7VXkbqztu5lzMgrtVxmzmvWK5RpTBm2H+F
 mqIPaVyVJSI/emMri9SrcGFFGRAVfVONCOESZGqR4uSXQ1AS6hT+Pd/ss+dGAzs6Zkm10ayhdu5
 Q96PMGxo+N+HXBR2MvLHYrJOZMDN/m39HZmVavLHNiUYkYvQ3FgBifWmBX/NBxp+yGRabtiZy3t
 eAvNfzRVcenWi0RQcAIZYao6sN/0OBfVzezPZ+1QkLX09YGs0ot/2r/oJB7doXxS/sLM8CjchjJ
 JczIhXuBPFZyY+b4tCb7kL2vNpA7foaYHtTJ19DsflmkN3iPgTJow6qfaLvdg8I2mtG0Ti8X6Ls
 W9AH7CnAcY0JouMR26kYFHMX37FNLTgFOq981za2tB1WOdhuo9OBQiXKZlO0sk3/10KAGc/TMCE
 v04bd5xPPPB2mHpNh13e93SgsbqUI4a8J46Ebuwhr6Gs2P3DLcYED08dlVw0R9+TjQI/6lMPl2F
 +/YfuHr360JrZzhWjg0CvFkuE8bT/FKeoLo1GztkNk5TCY8zCBMhIwh0ksCtUDQwZiS5P6gzQoy
 qY45G6+SR8kTq/uSc2MVnH2piFtMXMh6erSklnlWzJGR/+bZYzo9sD88DJDjj0vnpdxqVqJ/4c3 5TfOVsEbdTw90Bw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QPfj4xHJ8hq6es_HJTJZAMn2XRe8ZRt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX9Ofw5riv0zuP
 uKF4qDBzMBkKd3zVGrGgQMc/GbvSwjrxPsOTEpB2fnfe1o93i8W+ltI0yH//rJ/sBTwpAZP2xtG
 zHqf8KXVUq2vpd99nHptW07FMogAGncOAa4zVpHQGSWfXB/TBtzrnXJfr2y+F/tRg7gOSakABew
 1VyGHxEdyLinf8KqGWOrZfPy8dwfyv9YYLaclIP9sGQsQ4frPGyKPjk+hJfM+buPiEbr0t6P6nA
 VeIIud+A90eO0msdCt5qduKyC4ffUGqYjw9vDiHue8oiDl9saF4GPpwDMJ2Kh6RSOyPoRALsOZK
 +bTwOZRYnZfT6QDz+3X8sJK9CBdzqa0iAkUGd2kBqEFhRHbqxogRT1pMOIKnaEazBygsFt02iEl
 GygMETzVtfWy8p2sJgrVvJnlPYnVLMhsWU/NV1Wofr28iEEw/3+92UyvrU64V2D5pgq7Vuy8fxc
 oCN48fWfyQB7YwN8N4Q==
X-Proofpoint-GUID: QPfj4xHJ8hq6es_HJTJZAMn2XRe8ZRt8
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d8083 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IG_F2lY0Ax8mXwJdcBoA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024213_413066_226F781C 
X-CRM114-Status: GOOD (  21.25  )
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

All the functions operating on the 'handle' pointer are claiming it is a
pointer to const thus they should not modify the handle.  In fact that's
a false statement, because first thing these functions do is drop the
cast to const with container_of:

  struct acpm_info *acpm = handle_to_acpm_info(handle);

And with such cast the handle is easily writable with simple:

  acpm->handle.ops.pmic_ops.read_reg = NULL;

The code is not correct logically, either, because functions like
acpm_get_by_node() and acpm_handle_put() are meant to modify the handle
reference counting, thus they must modify the handle.  Modification here
happens anyway, even if the reference counting is stored in the
container which the handle is part of.

The code does not have actual visible bug, but incorrect 'const'
annotations could lead to incorrect compiler decisions.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I will have more patches for more drivers like TI, ARM SCMI...

Changes in v2:
1. Update also clk and mfd drivers, fixing build (do'h!) failure.

With Lee's blessing I can take the patch via Samsung.
---
 drivers/clk/samsung/clk-acpm.c                |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c   |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.h   |  4 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c   | 10 ++---
 drivers/firmware/samsung/exynos-acpm-pmic.h   | 10 ++---
 drivers/firmware/samsung/exynos-acpm.c        | 16 ++++----
 drivers/firmware/samsung/exynos-acpm.h        |  2 +-
 drivers/mfd/sec-acpm.c                        | 10 ++---
 .../firmware/samsung/exynos-acpm-protocol.h   | 40 ++++++++-----------
 9 files changed, 48 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index b90809ce3f88..d8944160793a 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -20,7 +20,7 @@ struct acpm_clk {
 	u32 id;
 	struct clk_hw hw;
 	unsigned int mbox_chan_id;
-	const struct acpm_handle *handle;
+	struct acpm_handle *handle;
 };
 
 struct acpm_clk_variant {
@@ -113,7 +113,7 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
 
 static int acpm_clk_probe(struct platform_device *pdev)
 {
-	const struct acpm_handle *acpm_handle;
+	struct acpm_handle *acpm_handle;
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **hws;
 	struct device *dev = &pdev->dev;
diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 1c5b2b143bcc..66448c8037ac 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -42,7 +42,7 @@ static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
 	cmd[3] = ktime_to_ms(ktime_get());
 }
 
-int acpm_dvfs_set_rate(const struct acpm_handle *handle,
+int acpm_dvfs_set_rate(struct acpm_handle *handle,
 		       unsigned int acpm_chan_id, unsigned int clk_id,
 		       unsigned long rate)
 {
@@ -62,7 +62,7 @@ static void acpm_dvfs_init_get_rate_cmd(u32 cmd[4], unsigned int clk_id)
 	cmd[3] = ktime_to_ms(ktime_get());
 }
 
-unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
+unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
 				 unsigned int acpm_chan_id, unsigned int clk_id)
 {
 	struct acpm_xfer xfer;
diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.h b/drivers/firmware/samsung/exynos-acpm-dvfs.h
index 9f2778e649c9..b37b15426102 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.h
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.h
@@ -11,10 +11,10 @@
 
 struct acpm_handle;
 
-int acpm_dvfs_set_rate(const struct acpm_handle *handle,
+int acpm_dvfs_set_rate(struct acpm_handle *handle,
 		       unsigned int acpm_chan_id, unsigned int id,
 		       unsigned long rate);
-unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
+unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
 				 unsigned int acpm_chan_id,
 				 unsigned int clk_id);
 
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 961d7599e422..52e89d1b790f 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -77,7 +77,7 @@ static void acpm_pmic_init_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan)
 	cmd[3] = ktime_to_ms(ktime_get());
 }
 
-int acpm_pmic_read_reg(const struct acpm_handle *handle,
+int acpm_pmic_read_reg(struct acpm_handle *handle,
 		       unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 		       u8 *buf)
 {
@@ -107,7 +107,7 @@ static void acpm_pmic_init_bulk_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
 		 FIELD_PREP(ACPM_PMIC_VALUE, count);
 }
 
-int acpm_pmic_bulk_read(const struct acpm_handle *handle,
+int acpm_pmic_bulk_read(struct acpm_handle *handle,
 			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			u8 count, u8 *buf)
 {
@@ -150,7 +150,7 @@ static void acpm_pmic_init_write_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
 	cmd[3] = ktime_to_ms(ktime_get());
 }
 
-int acpm_pmic_write_reg(const struct acpm_handle *handle,
+int acpm_pmic_write_reg(struct acpm_handle *handle,
 			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			u8 value)
 {
@@ -187,7 +187,7 @@ static void acpm_pmic_init_bulk_write_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
 	}
 }
 
-int acpm_pmic_bulk_write(const struct acpm_handle *handle,
+int acpm_pmic_bulk_write(struct acpm_handle *handle,
 			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			 u8 count, const u8 *buf)
 {
@@ -220,7 +220,7 @@ static void acpm_pmic_init_update_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
 	cmd[3] = ktime_to_ms(ktime_get());
 }
 
-int acpm_pmic_update_reg(const struct acpm_handle *handle,
+int acpm_pmic_update_reg(struct acpm_handle *handle,
 			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			 u8 value, u8 mask)
 {
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.h b/drivers/firmware/samsung/exynos-acpm-pmic.h
index 078421888a14..88ae9aada2ae 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.h
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.h
@@ -11,19 +11,19 @@
 
 struct acpm_handle;
 
-int acpm_pmic_read_reg(const struct acpm_handle *handle,
+int acpm_pmic_read_reg(struct acpm_handle *handle,
 		       unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 		       u8 *buf);
-int acpm_pmic_bulk_read(const struct acpm_handle *handle,
+int acpm_pmic_bulk_read(struct acpm_handle *handle,
 			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			u8 count, u8 *buf);
-int acpm_pmic_write_reg(const struct acpm_handle *handle,
+int acpm_pmic_write_reg(struct acpm_handle *handle,
 			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			u8 value);
-int acpm_pmic_bulk_write(const struct acpm_handle *handle,
+int acpm_pmic_bulk_write(struct acpm_handle *handle,
 			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			 u8 count, const u8 *buf);
-int acpm_pmic_update_reg(const struct acpm_handle *handle,
+int acpm_pmic_update_reg(struct acpm_handle *handle,
 			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
 			 u8 value, u8 mask);
 #endif /* __EXYNOS_ACPM_PMIC_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 0cb269c70460..987b59778ffc 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -412,7 +412,7 @@ static int acpm_wait_for_message_response(struct acpm_chan *achan,
  *
  * Return: 0 on success, -errno otherwise.
  */
-int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
+int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 {
 	struct acpm_info *acpm = handle_to_acpm_info(handle);
 	struct exynos_mbox_msg msg;
@@ -674,7 +674,7 @@ static int acpm_probe(struct platform_device *pdev)
  * acpm_handle_put() - release the handle acquired by acpm_get_by_phandle.
  * @handle:	Handle acquired by acpm_get_by_phandle.
  */
-static void acpm_handle_put(const struct acpm_handle *handle)
+static void acpm_handle_put(struct acpm_handle *handle)
 {
 	struct acpm_info *acpm = handle_to_acpm_info(handle);
 	struct device *dev = acpm->dev;
@@ -700,9 +700,11 @@ static void devm_acpm_release(struct device *dev, void *res)
  * @np:		ACPM device tree node.
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ *
+ * Note: handle CANNOT be pointer to const
  */
-static const struct acpm_handle *acpm_get_by_node(struct device *dev,
-						  struct device_node *np)
+static struct acpm_handle *acpm_get_by_node(struct device *dev,
+					    struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct device_link *link;
@@ -743,10 +745,10 @@ static const struct acpm_handle *acpm_get_by_node(struct device *dev,
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
  */
-const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
-						struct device_node *np)
+struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+					  struct device_node *np)
 {
-	const struct acpm_handle **ptr, *handle;
+	struct acpm_handle **ptr, *handle;
 
 	ptr = devres_alloc(devm_acpm_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 2d14cb58f98c..6417550f89aa 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -17,7 +17,7 @@ struct acpm_xfer {
 
 struct acpm_handle;
 
-int acpm_do_xfer(const struct acpm_handle *handle,
+int acpm_do_xfer(struct acpm_handle *handle,
 		 const struct acpm_xfer *xfer);
 
 #endif /* __EXYNOS_ACPM_H__ */
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 537ea65685bf..0e23b9d9f7ee 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -367,7 +367,7 @@ static const struct regmap_config s2mpg11_regmap_config_meter = {
 };
 
 struct sec_pmic_acpm_shared_bus_context {
-	const struct acpm_handle *acpm;
+	struct acpm_handle *acpm;
 	unsigned int acpm_chan_id;
 	u8 speedy_channel;
 };
@@ -390,7 +390,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 				   size_t count)
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
-	const struct acpm_handle *acpm = ctx->shared->acpm;
+	struct acpm_handle *acpm = ctx->shared->acpm;
 	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
@@ -410,7 +410,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 				  void *val_buf, size_t val_size)
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
-	const struct acpm_handle *acpm = ctx->shared->acpm;
+	struct acpm_handle *acpm = ctx->shared->acpm;
 	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
 	const u8 *r = reg_buf;
 	u8 reg;
@@ -429,7 +429,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 					     unsigned int val)
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
-	const struct acpm_handle *acpm = ctx->shared->acpm;
+	struct acpm_handle *acpm = ctx->shared->acpm;
 	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
@@ -480,7 +480,7 @@ static int sec_pmic_acpm_probe(struct platform_device *pdev)
 	struct regmap *regmap_common, *regmap_pmic, *regmap;
 	const struct sec_pmic_acpm_platform_data *pdata;
 	struct sec_pmic_acpm_shared_bus_context *shared_ctx;
-	const struct acpm_handle *acpm;
+	struct acpm_handle *acpm;
 	struct device *dev = &pdev->dev;
 	int ret, irq;
 
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 2091da965a5a..13f17dc4443b 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -14,30 +14,24 @@ struct acpm_handle;
 struct device_node;
 
 struct acpm_dvfs_ops {
-	int (*set_rate)(const struct acpm_handle *handle,
-			unsigned int acpm_chan_id, unsigned int clk_id,
-			unsigned long rate);
-	unsigned long (*get_rate)(const struct acpm_handle *handle,
+	int (*set_rate)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			unsigned int clk_id, unsigned long rate);
+	unsigned long (*get_rate)(struct acpm_handle *handle,
 				  unsigned int acpm_chan_id,
 				  unsigned int clk_id);
 };
 
 struct acpm_pmic_ops {
-	int (*read_reg)(const struct acpm_handle *handle,
-			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
-			u8 *buf);
-	int (*bulk_read)(const struct acpm_handle *handle,
-			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
-			 u8 count, u8 *buf);
-	int (*write_reg)(const struct acpm_handle *handle,
-			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
-			 u8 value);
-	int (*bulk_write)(const struct acpm_handle *handle,
-			  unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
-			  u8 count, const u8 *buf);
-	int (*update_reg)(const struct acpm_handle *handle,
-			  unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
-			  u8 value, u8 mask);
+	int (*read_reg)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			u8 type, u8 reg, u8 chan, u8 *buf);
+	int (*bulk_read)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 count, u8 *buf);
+	int (*write_reg)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			 u8 type, u8 reg, u8 chan, u8 value);
+	int (*bulk_write)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			  u8 type, u8 reg, u8 chan, u8 count, const u8 *buf);
+	int (*update_reg)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			  u8 type, u8 reg, u8 chan, u8 value, u8 mask);
 };
 
 struct acpm_ops {
@@ -56,12 +50,12 @@ struct acpm_handle {
 struct device;
 
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
-const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
-						struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+					  struct device_node *np);
 #else
 
-static inline const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
-							      struct device_node *np)
+static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+							struct device_node *np)
 {
 	return NULL;
 }
-- 
2.51.0


