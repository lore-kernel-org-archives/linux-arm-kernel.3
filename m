Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD3C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sG2kUOoNXTpFGVqjSx81RXjkZACMv2nCZdw/ToWaVY=; b=HfQF55fXlLS9ryGu/gB/2NpWHp
	3vC+gbHpaOYjwJatT2FtcKzurip/lUGMA6lObjLDy2zpWuEw0AnSG4xm57Eq94p0p0B09lhNey136
	+7pi7hslMo9wRrKzuNruRtUJE/lYsA9mhzPjGIF5TqSGlpYIgFqDsw84dc2mo/bUGhM6tqmtqahAD
	GyBErtcY3P6GVR4TErp7vnQxU3tEL/iumCy/w+LYRpeqCAygbNv0OtqHl4iOBnZLi22x3bKu389LF
	Sdop74bUwdLITF85Fmw+4rh5GxVz1Giy/A1KLy9bPnzqDZjitPXl8e6zx4BKQ1cHcZkoGthqJn2wW
	/9NOprvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLHe-00000002jaz-1qm2;
	Tue, 04 Aug 2026 19:58:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLHb-00000002jYK-01EX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 19:58:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlV5Q940142
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 19:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sG2kUOoNXTpFGVqjSx81RXjkZACMv2nCZdw/ToWaVY=; b=SBu/S5efX3MKEky9
	WUCMyIcbLHQ1Wxi4IPa9C5jVpH/2lN6Iscbef8UD0c+Ia6yT59SdXrh7vbPkmP9T
	3fI2wQOb7uL2WJKCfw+drjNd5kGSb9M9r7HMcHd1QvW3HLGy10nrD6TPsH7leCe0
	SDYt+HaUhMGUoBHzhUaVFJTaAfNq4ughIIDYw5Yd46iadEsGUqOHu1a80S0SrUUg
	dufvZedyUmj3NPBtBzbSBACwZIYP9ZtrozNMZraYSdmHXHwxzTmgFMEXV5Glz72h
	6X9EwVh6SHi787IYKSH+1YfqLM/tKH1C//O1CabqFKF6auI4BDvR14NxfKDxfaMr
	Alc1zw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug65a3pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:58:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso2575735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873517; x=1786478317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sG2kUOoNXTpFGVqjSx81RXjkZACMv2nCZdw/ToWaVY=;
        b=AGL0alQL803wWO4KLHmJTdOaB/CfioWTq57QiSP/ZOo94RnsHbEcr8FBkX0+Ea5SfO
         goVcgjoIz1iKPEhIS1BaZKys0oNBviL8qwgRGaxqRnv+Y5u6sBDeV4v42cg9N2Khx4l1
         NdqTERCgID6d3f/z77f9dqgcJ2b8ViZIKnj5nnVhEJKKcmLLn1lQgzAqXMDQQKETHPNr
         l/KZF5pliVlfWAQURGRNqQLhBE2G9TlFBEeOsaabI/nKWpOZQC/q3a/kl6vDBrd7Xal8
         8cbH9idstO+gz8Jvh2yevf0MJz9+QhlxoTVvRw4cWjWnjQDGdN1Cz+RHgJaxdvlbI2mR
         qeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873517; x=1786478317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sG2kUOoNXTpFGVqjSx81RXjkZACMv2nCZdw/ToWaVY=;
        b=Dx0a96/t+PAqx5YG/aNgOR4VGGmUnW7+ZHsXVBJCbgxYOCFwZI4vozRET2S+UfYT6u
         LsGi3/UgFnPp8haw3dHI1h4B7VFrnKS4KUOsSGPU/cqG97d7bFy+JUuAxwTrqBuV8VOJ
         OC+aUyh/88di2U6JrZlFZc+ZyWYm2HfSsBvxQxVZoQW4nrnLMmlkpLrZ1+kVyiM/wK6j
         WH5sxHpqLbmZo7cnpVS1/Ea8xYEA1eWG4EqOlRl8tniboTeggsdWlsTHirFMsCnT1+2a
         RqU3j9QPKyCUMEhJvF+6ynwULPzKlz60aT8Kvg8cgcDqPzfPB8e/ft8OHotfZKlHez2+
         HVdw==
X-Forwarded-Encrypted: i=1; AHgh+RoCXaqVyUlT/KWxeafILDd4Ns11N7DGWG9a9TYiUJeOqmuR1iQPUGVHUWKTKveP7/gPukYP7NQy2CwM+jrfjFyW@lists.infradead.org
X-Gm-Message-State: AOJu0YzWvwBVKdi/qw8AQxC1aGzNW3EEeYOC1t5q+Yxu0YZIukKTk+0j
	x48NB+a5BHZ4VS4zdRV4Lby6khTtyo7TR0oDqhmCegmJZJwJpNbTxB29urETX2YzgjRe8gVdsS5
	SIAPwmB2+yX/F9eYGBBF1hkGdPgWFO0SCkTTSDPhQ8KmzQZAaYNyukq6e43raDRk1Qx7zezBjXL
	ff3Q==
X-Gm-Gg: AR+sD121RAi8A1VreV3ATr06Zy5Lq76MfSAdQq6Wlz49+PnMi+ewCkoj9y0AyRbJzTE
	kscTYUPhOChcuQLd4P4Y3C33Ju/+ui8prV9XZ4IPYdBiC3HaHlB6iRxEMy0Dfj6+M6XJoT7W2GW
	3namvlzJcN8Nt5oDMDQZq2lcGfqbXAl+g51V6CvMrhE2NDF2CnsUOByxcWK4XGKiDeMxr7Jh5+s
	QXW2gcTQVqXIUZpFmd9dLnld4i91EpR1VPiEm+rToZ6DQZir2yzpzoF2fhvV61gXav0vNQpzhfr
	duGs9LckDG529QbnMGRUjelPh5ptlL28ldGyGWMH/xYnFcqtE1NcTk/6yI0E/0A52uBUZuFsN2D
	qjZ/PgmIcLtLuQCYu5PHv+OoGqYWVbwBV3g==
X-Received: by 2002:a17:903:2392:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d0cc930358mr8353845ad.9.1785873516951;
        Tue, 04 Aug 2026 12:58:36 -0700 (PDT)
X-Received: by 2002:a17:903:2392:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d0cc930358mr8353295ad.9.1785873516378;
        Tue, 04 Aug 2026 12:58:36 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:36 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:43 +0530
Subject: [PATCH 5/7] spi: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-5-61171ab1cdce@oss.qualcomm.com>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=3943;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=aMvXNSriPF/1rdXD7CryP6EsFDq+VBK2UfJSFjESgos=;
 b=Z7l3NK4ZAErxpmh0xCxi1JAF+UNI5t63aPkBcxlmu10SL/ThlehBSe3n4zPL7NVW7nvmOlOSn
 6kRFgbHJBz6BLCo2NZ91JGbM8nXdnAJbYVOBu3A1vilb2cZqtF1ArL1
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: QEh6cZtVYqc1QImwI0aq1D7gtHdeVWgC
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a72446d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=V8jFpX-JU2fdHFI84kkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX/HiUHc//uGU0
 timXyZREfsujwJ8zAalRE3fMuelgrkGlu1yKFAbLE8j+hqzvJIph6F+0TlA1oirsgoIdGbFOTyV
 V/jS6l9HJoXEBsB3HOd8bC/S8BgKLc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfXxKoDTzWlC9n4
 efhgi9gDk78DyhZ/Qtv3oQp7niG1KtyNV4ydPYiQovWVkmTz5G7OrPcVbXOOdCW8QwD6vXnD356
 gDIuxiCBuVntNcTiUuT33pgHtNxU3X60TmyTcQ8beJ3fT1UXqNmvq1HiIcpUe1Uz0Gntg1ZFGhx
 d8Jwh0oAWrAHjNRDwatKnExo1YKVRPhwonHcJqXujBbWGmxyCrEziFToNMKpmLooE6L4hG5Er8H
 4ybTQt+qHL+WPY4B7r1yPq4TUHqvRrULdk7C+YPbVvsL4I34O4NTGAC0K8SUhuFd2d5NtyLxt9w
 /aFyfg/HoaA8YSO8jMN8phVnTOkZqe2HsWKIfvFnBhHKY9C57aYcvZSFFgnXEOuSsqmaEYJjoSI
 bqeREwDN27NJv1DsC6Dt2mcCAq2VaG4vxw7sOgncXG5SlSRVYhwp6AxQO+H009Vko7OF88p2LuH
 frqq9fSZ7L+jJjDwHxQ==
X-Proofpoint-GUID: QEh6cZtVYqc1QImwI0aq1D7gtHdeVWgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_125839_167298_CBF53F16 
X-CRM114-Status: GOOD (  19.57  )
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

On the SA8255P platform there is no Linux clock handler for the SE
source clock, so the driver has no way to look up the source clock
index and divider needed to fill the GSI CONFIG0 TRE for a requested
transfer frequency. To work around this, firmware instead exposes the
SE HW supported source clock frequencies as OPPs on the perf domain
device.

geni_se_domain_attach() now populates se->clk_perf_tbl from this OPP
table at attach time, mirroring clk_perf_tbl on the Linux-clock-managed
path. This lets get_spi_clk_cfg() call geni_se_clk_freq_match() to pick
the closest supported source clock frequency and divider on SA8255P
exactly as it already does when a Linux clock is present, and fill in
the GSI CONFIG0 TRE accordingly.

Switch get_spi_clk_cfg() and spi_geni_runtime_resume() from calling
dev_pm_opp_set_rate() directly to the new geni_se_set_rate() helper, so
the matched frequency is applied to the correct device (the perf
domain device on the firmware managed path, or se->dev otherwise)
without the SPI driver needing to know which resources_init variant is
in use.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6566975eb24f..09e796d22ab1 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -15,7 +15,6 @@
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/geni-se.h>
@@ -82,7 +81,6 @@
 
 struct geni_spi_desc {
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -150,9 +148,9 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 
 	dev_dbg(mas->dev, "req %u=>%u sclk %lu, idx %d, div %d\n", speed_hz,
 				actual_hz, sclk_freq, *clk_idx, *clk_div);
-	ret = dev_pm_opp_set_rate(mas->dev, sclk_freq);
+	ret = geni_se_set_rate(&mas->se, sclk_freq);
 	if (ret)
-		dev_err(mas->dev, "dev_pm_opp_set_rate failed %d\n", ret);
+		dev_err(mas->dev, "geni_se_set_rate failed %d\n", ret);
 	else
 		mas->cur_sclk_hz = sclk_freq;
 
@@ -847,7 +845,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
+	ret = geni_spi_set_clock_and_bw(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1162,6 +1160,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
+	geni_se_set_rate(&mas->se, 0);
+
 	return mas->dev_data->power_off ?
 	       mas->dev_data->power_off(&mas->se) : 0;
 }
@@ -1178,10 +1178,7 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (mas->se.has_opp)
-		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
-
-	return 0;
+	return geni_se_set_rate(&mas->se, mas->cur_sclk_hz);
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)
@@ -1224,14 +1221,12 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 
 static const struct geni_spi_desc geni_spi = {
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_spi_set_clock_and_bw,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_spi_desc sa8255p_geni_spi = {
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id spi_geni_dt_match[] = {

-- 
2.34.1


