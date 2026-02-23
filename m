Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2232EEC1127
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xOe8cPoJ88byYsxtVowBQns9AoXPFIKBl/J2eUuUHyU=; b=qZEspmb1McovDpIJzE+SgxjQQL
	aR7slEnQBEnuZQIyJaBBVjOLPofom3eRP4r8QR0MOO3o1KzExQCc9JC1D4V7d8eWUn0sLr5o4tppT
	R86n831gJTgEU47PQfqs4zosLHg1mP1wkIwFRTCMmL1kYpf5xeQvmGkfgTNLa9dh8WN6/jITq+oFh
	rM9cFgPdOW4U0pC/kU3l1nyJXCpU6151Csu4xtXLJaFiQ4ftoiGh9ea7v+IVjJtNxuuAOIisjyXiC
	1+iqE6T7PlwPcZtfQ1SQxlKfLvI3Edtf2/2MwphOJ6cxWpT9MF6N7HqVOZZBckNuSQj11llajumMv
	wuSqZWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubho-00000000wEj-3mgO;
	Mon, 23 Feb 2026 19:34:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubhm-00000000wEM-1eph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 19:34:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGvOSf3478576
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 19:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xOe8cPoJ88byYsxtVowBQns9AoXPFIKBl/J
	2eUuUHyU=; b=KvPbIilIM9VjCMlmNzz4z+rHgEpl/GetKDG4KtHLD5bMed9ynH1
	bJ2HJ+uJA+BE0qY1TBxgXS/NrS/pJJ8N1O8FbHeplTFEOKmO94hG1gB5rdjMncV+
	rhHOlmbP/YbFed/POZV6VwWLToytVUOt9ykyRhadbHbkl7WTC78nJdC+d5CZmf+5
	GhJlPaHM70+tJulz6V1mIriphQ1QWDFYS6b7HWpfqPgh0CowmMUr9XqlMmaxVVwB
	C7TxoHRGorOW/bqRDx3Pcksap959iwEO7ZTblhADctMQUyXl004uqaiUePYwQmwd
	Sguf/ByRGE7VigDQyL1I/OtOCEV4pMt0Ftw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9rgyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 19:34:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so3965238585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 11:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771875292; x=1772480092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOe8cPoJ88byYsxtVowBQns9AoXPFIKBl/J2eUuUHyU=;
        b=DgvFduDdkf6lycyFXC2j70QWwBu5nh0OEeTmK6aydZetrplWsnviunFYAdomJ4icrw
         znyY53UXLZx+9QYfUQ+LzJR5jrHJogKdpvhAkiBomMzPH15nCT0OWPO0vwWHmbDZKmGm
         BnSNUqcK9DkQL+6U1vTLXauLkmDcMRsG+u05p6MYFxw732rjNyRPSM2kIbhau4nG5IPT
         d+bPTw+HHkTIHbpkvi6prkzjObtrYZ+s/FOWyS22CPVmKSIx2laAOumdUwMjctRArWPn
         VWImJJEQav2iIKiY5DLqT762z3uQg6x4e9eBPX5sio38HxzVwoboRnckh7N9rgHUpBu7
         f7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771875292; x=1772480092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOe8cPoJ88byYsxtVowBQns9AoXPFIKBl/J2eUuUHyU=;
        b=mqgFyi322j7JNk9PVeNpwX59ZXst9xni6gH8EKvxOZa09dhfgjpNJhfuv6g3ApSV+i
         l2SfG2ljySYpGwFsD4Tsp0U1pCrbrBcIVIRXhI9MyyumY9v66u55QQaoM3gexn/BM1YX
         HMHLCyfYD4KZus168hAd5bkZEovlk3y16EwZvSQEOGjRYf0GYzUzdeJqY2RhMpcaY+cY
         0rrbNR2dHvwL8LXP/CGePmG+RuiKRe+AuD2kTjEim31S0Wc/gD5nczPWvwGRUm99KJRx
         8ABxu67PjrwueWHNN3i6v73Z3hIJ35e2IdaoOTtozK93NgN3cp5lBJ0uqUAEstX9nhct
         tH8w==
X-Forwarded-Encrypted: i=1; AJvYcCUBvlwbIMWQU78/E/EswelE+y81EzoEKvfiCGIQHV00nx5ilhhcdiK1tAizTokGC2g3ORAprs2HYhudWZr3AL3i@lists.infradead.org
X-Gm-Message-State: AOJu0YybGUgWw+kLKba+cyQvMJqZHaIfv0nPx8832XJZ9ibxzLfXRxvo
	Y5nzeEu/3UZEpF974T+83F7I9Ane4DnP67j0+6t1heBzBjAwn1Wci+W09Cco8Tpw21OjW/XUwVE
	yCVw0iZXXnKJ09ROHEliNtFR7JzTOcYMmYkBS3jg6m8Fu9Frr/+rNdzTUpygSQkn5X5hn4c18Gb
	EXyo8/CasdYA==
X-Gm-Gg: AZuq6aI56lQYySrEzU1CNCXe1c0xi8+ToICfIhaPryIBXYAI+qaIqv5fOw9N/bBf3pR
	erwC8kDvsz2alPoKEx2oPBn/rNVcNIUlcplGzxkjerBDNCvdF/5jl+PIXExmH2LtVmstlEZQ/4i
	u6ymWDKZcqRzOLjj1mCyIGjjMNd0tT8aHcOB7mkAUEeooOBQp2t7iA17iIxdwN6p7PEEhca6i6P
	aTWkTsl9vtbJzHyHhG9tymS0lD7JREjsm7dd+Ms7wugNBE/gFymxfsIkb3/hrtC7A0Q6lTExaDz
	P6z8mWBTUr8Bx9Zpfp6eV68XYhydkoBgT6O7OqNgJPOB4fZvA+IKB1B+3vEg+ow3BaWLYhCzMUW
	3KzZANdZZElHuxJMUv8QWTmcs55KZQGZvzUAJTw==
X-Received: by 2002:a05:620a:1289:b0:8cb:9fd4:2ecb with SMTP id af79cd13be357-8cb9fd42ef1mr318779585a.54.1771875292309;
        Mon, 23 Feb 2026 11:34:52 -0800 (PST)
X-Received: by 2002:a05:620a:1289:b0:8cb:9fd4:2ecb with SMTP id af79cd13be357-8cb9fd42ef1mr318775085a.54.1771875291372;
        Mon, 23 Feb 2026 11:34:51 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadedsm177232805e9.10.2026.02.23.11.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:34:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] firmware: exynos-acpm: Drop fake 'const' on handle pointer
Date: Mon, 23 Feb 2026 20:34:17 +0100
Message-ID: <20260223193416.532231-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11784; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6SkBT54jdGQQfxqV6Yrdqi3MUM9Fu93hXV9Cep9mVb4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnKu4ZqTXIw/aEfbxxzj4Jyn3WtPAxb1HIV9YI
 Cfh6Wd3N0CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZyruAAKCRDBN2bmhouD
 10VQD/9jd1L0tj+iLoj7aUstzcIdUp2A5wCz+3NJuUFmu+kN/cpTU2VYuV4vPTsfEUb28jCAtZW
 cdD7UHKlfh3Do1pjAPs3DVoDpW23l/Tb+AcsvIICYNeSaE7wbXxzzZcOvAyGt2POCwuIH+FqJ4F
 AY0Te6tAw9f+1cGxFMGWHz7e2K6ZWqnU29x18ko/EZxmMFPpyLvgB2fwnHswqKGelYPhvrXKsWH
 GJkTwdJvekwXQ7yajvmWlQ1rLt+43I9C72gjzWkHZRHXRXVvoQNhFyoiGSVelPSwCqWCAlU6w4v
 Vp38RbnJQVBVEQO0dXqgUgTO6jIAgbXhpztEeQWpNbZDWIkvtf8rggmjKU0hOSBGgNKK1uRH8KW
 MXtVbXFKMXfIqoWpbhKmlAS5fseKGH5j7EOrA1t26E/7kQ8c7Fu/dty9Ab5jeoW1IhgQg1ecIv6
 npBPojujl24Yi/tcQPFSIQBZvYuDwQ6XVoSQe4Vx5f1LytPb2nAylP9/SjtHelC90SFRKznmZXG
 vA9gdy8YdhFy0epRSDwXzMXUY89hvlXN9dKxdQClNMljcDAGFjcdahG54gzmYELLfMDVGX5V+kB
 Qy3O4K3FOEl7/QNznL25IJxOBDkW3PZUROvSLLXzDvTZWU1CBdWoEKFRAreHtxH33Vs9fdglgqo 7XJtS3z2Fdp6HbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699cabdd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6hZ-4XOhd20wvc6P64wA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE3MCBTYWx0ZWRfX5WlOKVHY0zZJ
 m6YEDYsG/m1wSoBVrl0GzT1tMZUcisqhQrHzBGn2ovYdd5glILCawb1y4qnSfa+Dhnks4Pk1TaV
 3lJ1u7eQIoppKrL+CnZOuP92GdpHDtCMJLZLq09Knq0LDRV1/hlreVYBg71r24kzDE+Fg5gdai3
 hmJvGD0GyeN2s5OcmrzDh9vkK17FHMDD2Wt0k2ylRpWTJD62/Ur99xRsvNN3tH4P1+x7SlxhDTr
 Ev7gc/2E83J2laWR1hx4f5lYTZ/0VIpXsG6tKC0XEv9sJt8CcAlTesQkqy4y11vHutgaCcLJQ2N
 fAjdbNpLJbU38soY63pofGgEccT6oi/6BGbM929wYfjGdZq1cWR9p0HH+2lVWlDa+ToUcXw6iSs
 0JDJvYGq5vfBzyuineuVmzBoa9QqvD2umH7Ocv2uGkbnCh6fSx1z7eu/lRTBaclMpwO1jOtn919
 dYUh7ipC3c22TR0zTEA==
X-Proofpoint-ORIG-GUID: oPzwzL2e9gLPojcpMxmExrvK153IJRLK
X-Proofpoint-GUID: oPzwzL2e9gLPojcpMxmExrvK153IJRLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_113454_447316_C0371D88 
X-CRM114-Status: GOOD (  20.33  )
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
reference counting, thus they must modify the handle. They could not
work with handle being pointer to const.

The code does not have actual visible bug, but incorrect 'const'
annotations could lead to incorrect compiler decisions.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I will have more patches for more drivers like TI, ARM SCMI...
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c   |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.h   |  4 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c   | 10 ++---
 drivers/firmware/samsung/exynos-acpm-pmic.h   | 10 ++---
 drivers/firmware/samsung/exynos-acpm.c        | 16 ++++----
 drivers/firmware/samsung/exynos-acpm.h        |  2 +-
 .../firmware/samsung/exynos-acpm-protocol.h   | 40 ++++++++-----------
 7 files changed, 41 insertions(+), 45 deletions(-)

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


