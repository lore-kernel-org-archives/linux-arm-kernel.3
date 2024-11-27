Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA881D6ACD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GRGKjYxWwsRelyuP0tWpLLQewWr/T1xF1uSm0KaiNUo=; b=IZgZuyBDBVdlkxYjQpAvPPfAaJ
	/AG0DuWL3WNGTjcL7bu7M2uj0yDU24pwZThrIkgjnZCS/YpbqabYB007eJd6WQxcqD0hiykm4qbsy
	qbz7Ce22UTCRIcMJSKkIxy17rtABXc0orX3ueFOCJakbYjY9cM8iwUJaJDBfq94gYKMg/ugHiGwin
	cSfM1MusrGlicklr9GLK4CJwsVVhsZOgwmeA17iKl78k1p0KUSOZgb+C8pLKNxpJC1UOu4DMPlp7Y
	3+s8/MrdhU8cezUi/zbY186P7NONQttySC+Rk6XPe2w+P1E/g3TqB241GmzCuTX1rDO1TVRy6tmDZ
	K6lcH/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGI9Y-0000000DFBm-3OBe;
	Wed, 27 Nov 2024 13:32:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGI8Z-0000000DF6S-2yx2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:31:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-432d866f70fso61576805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732714282; x=1733319082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRGKjYxWwsRelyuP0tWpLLQewWr/T1xF1uSm0KaiNUo=;
        b=lOxYTiKmcXFRNFV6XzJf7n/FQ+O+TzNiqgaXYiwNp//gUj/vXSXKgJppcK75Gh3DZr
         aIAVMiNExk/psABGk0S9/yNni5s52YUPQ3d4+UsTLZ1B80Y+MAtV7PNL2cBTFKSv9rvx
         gBKaOoH70PfME3K6s9Q1gN/AU6sY8wq3nxP3mjwmUvp/N0n+j68yvsX++aOVIPD2+tcE
         aSzl+rOmyAWm+P0weJMwTa9rtMQ0xwDG4Kc5gKZm8Qg2hFVFrC9zCryLZH6/uERYD6sw
         EHqk7aBR87dLPHzJQF99QaXdLUS7zPG7dhNvocz2U1N5tIL+ttMeobfzPFgnrkZJhnD/
         s5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714282; x=1733319082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRGKjYxWwsRelyuP0tWpLLQewWr/T1xF1uSm0KaiNUo=;
        b=G4Hnb4m9S89v6bKbgDYnkPks5gNTQkZcx1PZZGiNXwwpzOvE8xeqgwB3FdvafG3sPR
         huGnNawd9cybjBS7Z73aNMl96U1praqZDTrgwwZaG/91cGPyGwqnIjZ33sugiH5S5gJv
         JAW2Nds3ylOx6qhrf53qjn+HEirRMBbo8+dCY7tyUeIBVUFd0HTHhS/wAwHk9IPrfBjd
         4dI8DdXFZs86zB3yH3w4ttrUv6/qWPNBbQJVQLyyVtIkLMRyn15oQO49np5PEVJa78PH
         7y1qy+ESSMNrLZRpkvTP8fSgJO68rpr8cGNJLEIZOuLXHQOowoD9GqLJhX44w5aUKfAu
         9eGg==
X-Forwarded-Encrypted: i=1; AJvYcCUVQyUq9jzToGCgBcBJRpfVmjInBka3yKEOUVzNV/m9Qw1J2fupryxbkRHGfEuKOhVA1RItu3t3aIl6nO84P3qj@lists.infradead.org
X-Gm-Message-State: AOJu0YzPu4N4J0Z2ACpBpmTTo2PncLXiLp2wSkelIKoS7LUqD26yCaTf
	V6qEJDuoid5KXekclLmxakNxVHjhNrDSdj+NK06ISToW+sJmgrdpg43t0t0vnMs=
X-Gm-Gg: ASbGnculVU6P8JoxDbeKPZKjP6yYaflA1ioqT+a65/IXIradEGb4pviGA6/QUpJeDvV
	SH2OPy1yQkRjbzor99Mf0Lqxsn61X7m22RXkxP2j14PotAYsJhEbQig0N+KdTv6oigoQtlL5NUH
	QyD/mHly6IbXD4p+pPBr1FZf2DojaPntkvHBFDa55XFSRkjGAoXUDYLAeCckwFRwZ+za9b+Z1qk
	WxDEXJhImE9Vf9QbZr4gfU2u9KmV8X3z3F0T+cUvEGiYbdfbpZN8O0=
X-Google-Smtp-Source: AGHT+IEZ7C9LB7FM3cTaauPjrEMojqCE1Of1m/atUBZHepHaTuyY1CQCKhviAha5orYzGSUtbCVNQw==
X-Received: by 2002:a05:600c:3b9e:b0:434:a4a6:5212 with SMTP id 5b1f17b1804b1-434a9d483a2mr30303435e9.0.1732714281484;
        Wed, 27 Nov 2024 05:31:21 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:d88d:8601:f512:7eed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4d42sm21130305e9.37.2024.11.27.05.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:31:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Jacky Bai <ping.bai@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] pmdomain: Switch back to struct platform_driver::remove()
Date: Wed, 27 Nov 2024 14:31:04 +0100
Message-ID: <20241127133104.673408-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6060; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=FCq/wz9CODrxpUcZSiq/K80sBf8feqP0ZtgImUXPI88=; b=owGbwMvMwMXY3/A7olbonx/jabUkhnR3eYnzuzV/fUnQrjrQ49PHHO+gcVHK+DnbvNafNiwyd yMyndI6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiIsxn7P302Ocami3Yay4yz heZou26sfvk5+MmlleGe/2cdFmZ5qej1M/IxwwyGd4/fF0v/8JNZ9MrlT/p+/sJPZyQvM7r/OCE nZFb32lKOXWQqm/nH6a8fFz0PMs1VWibzKytH5szRXxH/3rnMFvS/aSRkZxTroKG5mv2EwocgOb /J3kKVE4yjXsSfWnAvnNNvxfqzzmXPehdm/LtsZe9t+Ln3kuTNRV7ROu/Mc2MMv3DwR9Q0PJHdK PXPa2LShPTvX6xfBQi2zkh+1lSsl6JeUuse+77I+ng869z9EboKHJlGlyfz3VL2d83bvlpl5imX jbelvk6NzOnuvlq6YCebfozAbING75TLb2MEnUW+7zkDAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053123_955337_AB50E758 
X-CRM114-Status: GOOD (  16.72  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/pmdomain to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

En passant make the alignment of the struct initializer in
imx/gpcv2.c consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on today's next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Best regards
Uwe

 drivers/pmdomain/imx/gpc.c                  | 4 ++--
 drivers/pmdomain/imx/gpcv2.c                | 4 ++--
 drivers/pmdomain/imx/imx8m-blk-ctrl.c       | 2 +-
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c      | 2 +-
 drivers/pmdomain/imx/imx93-blk-ctrl.c       | 2 +-
 drivers/pmdomain/imx/imx93-pd.c             | 2 +-
 drivers/pmdomain/qcom/cpr.c                 | 2 +-
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index fbb4c90b72c4..f18c7e6e75dd 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -233,7 +233,7 @@ static struct platform_driver imx_pgc_power_domain_driver = {
 		.name = "imx-pgc-pd",
 	},
 	.probe = imx_pgc_power_domain_probe,
-	.remove_new = imx_pgc_power_domain_remove,
+	.remove = imx_pgc_power_domain_remove,
 	.id_table = imx_pgc_power_domain_id,
 };
 builtin_platform_driver(imx_pgc_power_domain_driver)
@@ -545,6 +545,6 @@ static struct platform_driver imx_gpc_driver = {
 		.of_match_table = imx_gpc_dt_ids,
 	},
 	.probe = imx_gpc_probe,
-	.remove_new = imx_gpc_remove,
+	.remove = imx_gpc_remove,
 };
 builtin_platform_driver(imx_gpc_driver)
diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6e6ecbf2e152..48e3693d2bdc 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1438,8 +1438,8 @@ static struct platform_driver imx_pgc_domain_driver = {
 		.name = "imx-pgc",
 		.pm = &imx_pgc_domain_pm_ops,
 	},
-	.probe    = imx_pgc_domain_probe,
-	.remove_new = imx_pgc_domain_remove,
+	.probe = imx_pgc_domain_probe,
+	.remove = imx_pgc_domain_remove,
 	.id_table = imx_pgc_domain_id,
 };
 builtin_platform_driver(imx_pgc_domain_driver)
diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index ca942d7929c2..23db85b7aa9e 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -889,7 +889,7 @@ MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
 
 static struct platform_driver imx8m_blk_ctrl_driver = {
 	.probe = imx8m_blk_ctrl_probe,
-	.remove_new = imx8m_blk_ctrl_remove,
+	.remove = imx8m_blk_ctrl_remove,
 	.driver = {
 		.name = "imx8m-blk-ctrl",
 		.pm = &imx8m_blk_ctrl_pm_ops,
diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 77e889165eed..e3a0f64c144c 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -857,7 +857,7 @@ MODULE_DEVICE_TABLE(of, imx8mp_blk_ctrl_of_match);
 
 static struct platform_driver imx8mp_blk_ctrl_driver = {
 	.probe = imx8mp_blk_ctrl_probe,
-	.remove_new = imx8mp_blk_ctrl_remove,
+	.remove = imx8mp_blk_ctrl_remove,
 	.driver = {
 		.name = "imx8mp-blk-ctrl",
 		.pm = &imx8mp_blk_ctrl_pm_ops,
diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index b10348ac10f0..0e2ba8ec55d7 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -438,7 +438,7 @@ MODULE_DEVICE_TABLE(of, imx93_blk_ctrl_of_match);
 
 static struct platform_driver imx93_blk_ctrl_driver = {
 	.probe = imx93_blk_ctrl_probe,
-	.remove_new = imx93_blk_ctrl_remove,
+	.remove = imx93_blk_ctrl_remove,
 	.driver = {
 		.name = "imx93-blk-ctrl",
 		.of_match_table = imx93_blk_ctrl_of_match,
diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index 25ab592945bd..d68273330687 100644
--- a/drivers/pmdomain/imx/imx93-pd.c
+++ b/drivers/pmdomain/imx/imx93-pd.c
@@ -162,7 +162,7 @@ static struct platform_driver imx93_power_domain_driver = {
 		.of_match_table = imx93_pd_ids,
 	},
 	.probe = imx93_pd_probe,
-	.remove_new = imx93_pd_remove,
+	.remove = imx93_pd_remove,
 };
 module_platform_driver(imx93_power_domain_driver);
 
diff --git a/drivers/pmdomain/qcom/cpr.c b/drivers/pmdomain/qcom/cpr.c
index 26a60a101e42..3ee8184e4be3 100644
--- a/drivers/pmdomain/qcom/cpr.c
+++ b/drivers/pmdomain/qcom/cpr.c
@@ -1717,7 +1717,7 @@ MODULE_DEVICE_TABLE(of, cpr_match_table);
 
 static struct platform_driver cpr_driver = {
 	.probe		= cpr_probe,
-	.remove_new	= cpr_remove,
+	.remove		= cpr_remove,
 	.driver		= {
 		.name	= "qcom-cpr",
 		.of_match_table = cpr_match_table,
diff --git a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
index 0b5831e5ba1b..d579220a4500 100644
--- a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
+++ b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
@@ -313,7 +313,7 @@ static struct platform_driver zynqmp_power_domain_driver = {
 		.sync_state = zynqmp_gpd_sync_state,
 	},
 	.probe = zynqmp_gpd_probe,
-	.remove_new = zynqmp_gpd_remove,
+	.remove = zynqmp_gpd_remove,
 };
 module_platform_driver(zynqmp_power_domain_driver);
 

base-commit: 6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
-- 
2.45.2


