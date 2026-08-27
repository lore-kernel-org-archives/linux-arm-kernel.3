Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CDFC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOQ6tcmRQHIn01iUxXOVIhspNTiTc1cqfMZOOm1oy+s=; b=ZppGqfLAGl1UdbDzP4ArBbLLlB
	Iv2tZV9W8tybN9WheY24SBtKK4x1+UmRxnD9om82q37WKnyAg5Qa+i8w6UGIWpOuN6g2G8ea1xL81
	49Le5w4XQ3za97zvGHPWLbi0FOlHl/GA1ExbyzO8Ql8ZGv1VsDl/JDam9cLWOnwD0ueR+N7nkLXd4
	w5N+pvc/pjPFKzs9jQp4WFTXwJMNTeezmIxPm1rRKoJ/arCmyrYSqZm4bLvWf+MIPZDDwZLRjSMw6
	N88GJIs549L8v7iphmzVPN4Jk9k3JngjPbM3bF5W1ZPXt6TLi01W3VR1Gu1Y70VFOc9ch1laqq9tD
	z4fBQELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzePG-00000004Xwp-32Gh;
	Thu, 27 Aug 2026 18:00:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOm-00000004Xmb-30n8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:00:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdD2553711
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOQ6tcmRQHIn01iUxXOVIhspNTiTc1cqfMZOOm1oy+s=; b=og+R+JU0M/Xyh+NY
	il8boC8rRpr2LcJNFgKK3uRjBgXrJCotMPGRzS+MKtXlD/vZfvpsqYTwNZL+n74+
	ZikFJENA/nvVdHFCghsFjUHOYMG/7z1OEn7f8opKvUvY3g3OHMpXFgjTKkB92S4j
	DcuexOthjFH1MABKMS38AvH3ZESEbwesBPWJdh3Kg2eWXTpaZbk9sNzCVlCXHj7E
	e8KvOzxc6zjzbzmYrYzd7Fh+6jT53jFWBAfCrXmhuEr85be9WLgxjicnPaw1bVZW
	+xHpQlVtcJ9N7+6JXpBwLkAJ5fKgJycFGdRzOVgqXtTMZNK5gcLrod9DWUddz/JF
	g0WH3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fhqj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso247992a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853623; x=1788458423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOQ6tcmRQHIn01iUxXOVIhspNTiTc1cqfMZOOm1oy+s=;
        b=VeKCLC2MvIfrKk2+OHQKsfHv3Vza49id+xfVgJ/uV/ZGZenuRMDicxRRfdI8ynyPTm
         EYlpcvhKD6vulnbwXij+711hWmEDBmAr/iMV9XaFNmYIhvGqZncOKkbroB+CfmM63TiG
         94N2ib1y6TEk3xmNhsLw8ohaFInucvIoQ+y2KL3ZtWsJDLCy8LAt/1f/Q2e3NPD7kVs1
         UFuTUmHvunjxN/ZPPDRzrvjdMCyu09wn+xpu2rCZi6vJJHpfgy7ecHNbeCA12/BdtPc9
         urFhXgL4yM7YfvueC2yi7FN0bBJ20YWRF6FvcXCE6LG4bVKK7rartALjdUDq6RdURzxj
         G/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853623; x=1788458423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOQ6tcmRQHIn01iUxXOVIhspNTiTc1cqfMZOOm1oy+s=;
        b=CaAvOHM4INaICYUlT4LYRBe67Xd3vBfDW6QjaW0eyna4O7XJ8wJh1682r9QHyITQeI
         pmLdQlm97r0oQGWkrAM3+UJpU5IWb/eP180GgUabKbOGXzumqJoRmhQVEZbTIDD9NJXr
         58BHcxebn+03zwXz/svRxU6qprBMXKFb7jLLN3WyWG5w4EosrIybDilYPjjXXnOOu81p
         8xwZQidZYnHakz7UIBRCdbVbt4CJ+GsfCuueIy/jRNRrS4Ys92RJaqKfbx4teRlPzap4
         FF4w1Fc3W53e6k4475ThXCUG5AG75nSnz4At34QVp3F4uxmlTDyvtNgK7o14llJdMynj
         rgIg==
X-Forwarded-Encrypted: i=1; AHgh+RpxDjfrkUpo8coBO9N6U0yE2CbpNIlcEL+43Y9wLIEpBfaGji2HzCP1xILzUWaZ/G5OaIsXogQfZYMsR0X4MHiX@lists.infradead.org
X-Gm-Message-State: AFuF++kcbbzFoACK4kNyj/phkrBKAHnY3luP2TYfaDmtzlAqfppKt5k0
	B6Qa+nCe9nGY6jo/aqpkghD3bqUWVY0qVHYfhwmcAKZZp35hgPzXwfHMqxoiByOnw8l5Aq6lX9u
	Wo6doKVvtUlfsCJzEs4GcFY8CasTN+4j1f2+tbNCwOBZgXjQ52nAbTlCPOkIgH++BteJgpEQqsc
	F87A==
X-Gm-Gg: AR+sD11A8Qv9RSWwvsXdclGfVow7u0FNT0YPCX+tcezojXr1gQRSVc+63BuMS18pft6
	fMmnuGeRK9acTdd5LTUqZpr2uEX0CgnEJ84kVQnlxSAN3xdadIrC3UYTsdTddm3+ON6wzJFP0Vy
	+qX9mIxsarZau2fIJcoOHT+ExanzvRd2UZyMn4B7wvtSMd7ltY6b8A6SXauQ2j6VNhYPsHvul7u
	fyeVGxb6NMqDByGM6Ho+rzt9PGOgvETzNsJSF+84VH6G278EOJtpdPY83ibBoWBmwPcUB0OXaJx
	d3vt3JkLZWdCCi5LCI7KxvnWhsmdj7IZ4phS/Nbqm8E3C3no6BzKGmibwLqKjygHS3PsrtRkhyJ
	YtgmKw9KJDOXjHKohOCRGk7WGu7T/bQ/Bhg==
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr1910680a91.11.1787853620687;
        Thu, 27 Aug 2026 11:00:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr1910262a91.11.1787853619265;
        Thu, 27 Aug 2026 11:00:19 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.11.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:00:18 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:24 +0530
Subject: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=3900;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UFbtM3Wi59vHG7aQiqHHkhJP0XzUIMUsc/8Fo4UwloU=;
 b=SuK46GH8fU7Buoy8TzORlm6WEiTSHXMtcOF2tPugNtpZDBh4ldOCJthkNf1e+NaN4d1ZK5Edy
 hg5t7jDP88uBZIMEGFemCXKBci5gBezainJ+OKoU0BCFjS0noAt1+I5
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXwRtbf0dajQG9
 FopdvJz6hDQ/4NWI8h3pXgL8dbSAGCcz0caEloWLzsVHJwqwkYWdoJIYb6J6ojk+k18ihvmN98L
 o3sq4ti8ywooPioBjR3jWdvdx85U6rM=
X-Proofpoint-GUID: kcXR5hldl0B-5AmrRq4aAbGejEYOF6nk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX8m/n1WmgbzW7
 kfDZUrqkJWaBs0Qu2+3/ingA9WoOqZENuz29X3mgaaqlmEgHTeaDE2/XEGURN3EYggXbTHfCnVP
 DzYcJtGaCun528OmfU63ph7e1XOuLuJ1Miuw0Iv5obOwUg32yf9G3rvbe4r6lacsLQhrxKfnn64
 +ks/4C9Vwbuurx+8rQ08KMLg7sNvR3tBFvK7fCBnoLC3ox+qtsQp12nQI++29S1JBDGWSR+oUSk
 ptcChjZIjimMinqOnnIG0aYT5Qwm2+ER6OFptzYHbkeZ9OlQ5K0s5R7nbu9+orHcEu2aWa65Nbz
 7Xo7hcXxpySk621bXBIEmT7z3ToBbWbT+gwCx6McKs7QOhuW0IJHRCYbA9cI3CTeBlaWlzTG5N7
 I84TZjWpl3a+UVf08NBKzVssKbDPNXCGP6hWCsnoJ/mDQF2e6wJog0AqksZBmTqIi62aMfVc0G0
 LI7JtDpcqSaGtzQ2L7w==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a907b37 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YnqcSKFZeAXWn-m59-0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: kcXR5hldl0B-5AmrRq4aAbGejEYOF6nk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_110031_474629_D3D2438C 
X-CRM114-Status: GOOD (  21.54  )
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

The I2C driver currently assumes a fixed source clock selection and always
programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
needs to switch between different source clocks.

Add the source clock index and frequency to the I2C clock map entries and
use them while configuring the controller. Request the required
source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
with the matching source index.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..a3b7609e3cf9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
@@ -165,8 +166,13 @@ struct geni_i2c_clk_fld {
 	u8	t_high_cnt;
 	u8	t_low_cnt;
 	u8	t_cycle_cnt;
+	u8	src_indx;
+	u32	src_clk_freq;
 };
 
+#define CLK_19P2MHZ	(19200 * HZ_PER_KHZ)
+#define CLK_32MHZ	(32 * HZ_PER_MHZ)
+
 /*
  * Hardware uses the underlying formula to calculate time periods of
  * SCL clock cycle. Firmware uses some additional cycles excluded from the
@@ -180,17 +186,17 @@ struct geni_i2c_clk_fld {
  * source_clock = 19.2 MHz
  */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 7, 10, 12, 26 },
-	{ I2C_MAX_FAST_MODE_FREQ, 2,  5, 11, 22 },
-	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 2,  8, 18 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 7, 10, 12, 26, 0, CLK_19P2MHZ },
+	{ I2C_MAX_FAST_MODE_FREQ, 2,  5, 11, 22, 0, CLK_19P2MHZ },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 2,  8, 18, 0, CLK_19P2MHZ },
 	{}
 };
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
-	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38, 1, CLK_32MHZ },
+	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19, 1, CLK_32MHZ },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15, 1, CLK_32MHZ },
 	{}
 };
 
@@ -198,7 +204,7 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
 
-	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
+	if (clk_get_rate(gi2c->se.clk) == CLK_32MHZ)
 		itr = geni_i2c_clk_map_32mhz;
 	else
 		itr = geni_i2c_clk_map_19p2mhz;
@@ -218,8 +224,13 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
+	int ret;
+
+	ret = dev_pm_opp_set_rate(se->dev, itr->src_clk_freq);
+	if (ret)
+		return ret;
 
-	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
+	writel_relaxed(itr->src_indx, gi2c->se.base + SE_GENI_CLK_SEL);
 
 	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
 	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
@@ -1228,6 +1239,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		}
 	}
 
+	dev_pm_opp_set_rate(dev, 0);
+
 	return 0;
 }
 
@@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
+	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
+		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
+		if (ret)
+			return ret;
+	}
+
 	if (gi2c->dev_data->power_on) {
 		ret = gi2c->dev_data->power_on(&gi2c->se);
 		if (ret)

-- 
2.34.1


