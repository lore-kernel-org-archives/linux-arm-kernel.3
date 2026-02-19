Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4245EE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ou7ebgKBjCjOIB9PlzrTghR5gcm+XWioNOKUO6+BOOU=; b=dtjGE4yfsZX+pMbSQ0GsO/e4n6
	NgXwb6ft2yxzjrydN1OlchwxCKyzkukzycW4Ebl4ICYMKe3WI/WSHS+gd0loaau/3sNafqtibAsW7
	71VFs4dVfWXTLI8iqRR28a3/SRTAij8NcUF7ZsS22+Rtp2/cHmuLt3ZF/4LFfNXv+i5KXqP/NUdgC
	BgWtCeq0Q7N2/235g36qmQQLK4C9zebyaWjCNA5sf3r62o3WsO77rNVKx/sbQ2oT5rkK37zHUATQP
	+jj+r6+fImjakuZfhg/CKS4mlp2cDWbSuGdIr50UdfmLiN2CCwZlW5ndlujpFwo8Evb/BobHrVtaR
	sQQApvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Bx-0000000BHHZ-2NC5;
	Thu, 19 Feb 2026 11:27:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Bs-0000000BHF2-2PQQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:27:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J1JKTq4186012
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ou7ebgKBjCjOIB9PlzrTghR5gcm+XWioNOKUO6+BOOU=; b=JfzLxZQBhQzr6QdO
	7G0D5NxmxR5cqL2xJIaTgYGafNC98yQGcmxG/Imjjpo8eZcrSdIBqcuXGHw4wkDq
	bVLBa5isbqlWc/7YiqRORbOKgdtotkCtH8+d8cqKRK4VzD6EDifIwSyLZJ/Gojtx
	uf1oc+NaMG2qI7qyc6FWYquhSleNqz5PF9jkWuhzbEk3kau/3QylRbhnzFKxOT+B
	yHzGHLKJLakSkgi7JHVxaPyBHRs51v6SPu2mDVjM0tAPPljwzeUM4EOrTCDbBsg2
	8GpD+1o1JAk/HvIwlgDB6PL3HMDEXYqxBbOFOjvSxl7vGa5o0chggVeOTUy6fuk1
	nMawVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd3ahcrw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946f1b8691so69492536d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500447; x=1772105247; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ou7ebgKBjCjOIB9PlzrTghR5gcm+XWioNOKUO6+BOOU=;
        b=cylCy+qO0XofGk1wN3KBeyRzX0qnQp8kp/e28zqnOg1fB9+kTs7i1LI8dZOMIJ6mRb
         cAZA4XuyYYopbp1UVPHA9LSxNVu6ObKWyry0FcX4wsclKofrAwJ+qoL4AMbr6wRJ4HQJ
         C9Ff2JCH5TUWsuknnFWYFme8I9UB0ufVx6v+FcUF+LIafyAlSKrlnipLeki+mQkQGfwY
         MiNpHoHootV4OYh4kF1N7y2oqwY0xlbpXMacXrJnz9Bm6MrBKFOMeaSwMB9URkRtIdlu
         HXW9+AFp8hKFD0YHxXsTnDhVhmlq7S73rHIE55QT4fq4BTanbZlt9kV2wsoffGsaaQ3e
         D59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500447; x=1772105247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ou7ebgKBjCjOIB9PlzrTghR5gcm+XWioNOKUO6+BOOU=;
        b=l1I1YRxImgxs1AfaPUGqMqsqtyDfyUPfGFak4kGhXRRwFXrdlphUtnd+6jQEd+sNXv
         buTaQ97Nl3l4nA69Tt6XzRsZ66T/+8BxnlU9FaVQdpi9xOJkSPJjubgRaMMUF65IoNM7
         e+LT/Ytooexk8E9gmbQwXiBX3GG+Gl0+KC81MG9KJKVrINZbnwLceqCUHs41r2iet9uo
         zxMhyAPC1qlLC7sU9bhSvz1Fifx07ZNa+7AKbpH/+WAU9TyJlAt8jBZRUaydKgfPhSf+
         DhTdcJLL6p/fqM2mF25cz9YTgYQ/yeAOv1Sb8V0bbQVxclnDIi2lncrinAjL65fkuiyH
         Y4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCYeXuqFC7wuRNpUusolg4dccTmk52x6Hm8Zks1zFC9CPtGCIX2aog1BdnGoSZ5+VV57nRHFslT/ZrpnrEuQp7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ibbHCz4ZLkFZfmr/H8gX/iRz+kusOLB/D4LLdKaWFk1KqwOP
	IArqQqtpdxmanMsZ8lmBHrpxqiRunEytdjvkGO1KTBmpR9zldV4pQ47ePPtbLFXXDz20P532EhE
	pOGX5RRDqsIl6fTS9iYyIS3kc7utxVMNJsgYmD71CNCvQt2njVILk6sTZjUGEistwx8Ic11LM2i
	9Rtg==
X-Gm-Gg: AZuq6aJBypsiHXJg//yWTQ9ut5UjFe+U1EU9xOPj215/9g3+rhTMopccnrCc+mmtJYA
	Dyo/wyE1OInpmTLducIEGLVn9w/c2xwslSiKlgCb6K3vffaef5wb2ewNjbgSyGzqQmCZV//7Qux
	gXiJnWv3WjtSJn9Q+gN37WdsYqDjiClI/kZqV4Zp5GjGs2GIH98fD8bgtgBxjddTgtSi9VLjT1l
	7+744T9nc6Vk8ShgszbEwq006xAzdZbL4tQI0xixUpeaAXU6SS/GEVqQCW27xsktuQBJweGm6YW
	rGaBI7Xt9RKYiJC0qe3hIcGPtztAPyNztrZ1AVQK258jVOMwoOdxGDg7XpDxQduHHZ6HhimXBAh
	18G5v/dqFNLZpaPYxiV5bmqJbYLpRVXcF3iyaAkcHltyGiA==
X-Received: by 2002:a05:620a:4447:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cb74058e0fmr576147485a.25.1771500446935;
        Thu, 19 Feb 2026 03:27:26 -0800 (PST)
X-Received: by 2002:a05:620a:4447:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cb74058e0fmr576144185a.25.1771500446487;
        Thu, 19 Feb 2026 03:27:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:11 +0100
Subject: [PATCH v2 2/3] firmware: exynos-acpm: Count number of commands in
 acpm_xfer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7024;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMLN/7ZBA2P0C1881XG/mSB/uFAs4yEuNbwucOSQHKk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOY5cA/feqbe9rvzIDKDL7Qpbm2bFuPWfPSY
 9T0ZWTRZFSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzmAAKCRDBN2bmhouD
 1zoiD/9dC38H15MV/QMCaANwKiwL/JatPkLP7TNRvJ88xastlsXzFSPEwFJp3L9DtbGJOBkqWiA
 sF7HIlc2Sf9xINNV5UN6n72HkadHHp24tUr9N02/4MC6+wd8UqIBtmGiZ2wy0GlSbrmTC+bbA1d
 OBOSU7sGAa2BOrIiqPMaXohj1xDdzpE6S/huoFBnRMdoNLeEB57dCvU7RYjs1SOTduYFjrcoO5W
 3HsUKqkFtjoH9BzSzjgSFvZ97juKc4bic5Lk9v3SQY8FDn5CQzg22fl8+dnVrUjePuSpd2TYT/2
 C1bnRXycAsmdwBxGmQQUqdfVevX0ClEXDUdl+0uhhL86O6KY1Yf8e+qf5BXsJT02Bf+WrfJU03u
 IB3oKJU5E7C/CNAJRQandkdJOWl37MqXrVjMAOGKfjEhSWlt0pcjGB4871/zJxmsIoLaxWhRX/Y
 AixdV18ReBbuCtEEUuiLLv4dzJ2HtFORaR7DitaWgAiskMdHdRg6tGvly8H5UZpL/WPWYeFCLlx
 /wn09R6nfXhcSWUNOUE3CXxepPmCnuVwyOUDfjFJ0P+Nh2WSrfFrpcAHknt3IG4lL0jqASBKkVT
 Ad/HXweYA07hJ42K/4GSK6k/pX18QSD3+pi6j9xiQ67YpwVJSJY/TToZDRHpiYVGfn6rk0+lBMK
 kuEvko5lxhmmmZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Zo3g6t7G c=1 sm=1 tr=0 ts=6996f3a0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=OVqkz_Oto1G4WS9Ues4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX0coUW24nu4gP
 eV/vmrf87NhMACbxPrLspxUIaw92sgz9vh2WL/HpkH2EpG4MG6bLVxHRMGF2WS9FsBscXvgpXt4
 g2srUly75p4Rjv8K+p1f5NCv/mt/xIhJfNCapfsjpae/Rsg9Jh4o8Qab24s6Spp8M8u0k4eYnhX
 AjQOYN8RJ+FCdA6C5mW2jvaAq/oSrl3Ly5NEtC35iDZuutsQ8ToFi+oP6s/hz5BpZeWgmSQ4gb1
 Sl+ioixltpY85LR7xL11f6WSF89wly6/aHOMQyP8vV19Pww0y33SdpJUw0A3kcKYJlGRROdavHP
 oCCuGUQBqvgw9WvWI7CpWztbZr2KbhIbFW5ShW72R3d3GN9oE6nPv1xHUiWhbiaIocmJGF/lL2W
 lin3l/Yo6UUFuyyYjvYkC6YkX567cfHvjygs0ZfZm1AuZd7Z8XSWQCxaizmmqRDRsuX1RT9YdkD
 X0BOMqniNabh80sP1bQ==
X-Proofpoint-ORIG-GUID: _j3gTNQYUrUeFouaXUPvcdggNWxve-rX
X-Proofpoint-GUID: _j3gTNQYUrUeFouaXUPvcdggNWxve-rX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_032728_622730_EAFBB128 
X-CRM114-Status: GOOD (  20.68  )
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

Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
so could mean length of the buffer or length of commands, and these are
not the same since each command is u32.  Rename these to rxcnt and
txcnt, and change their usage to count the number of commands in each
buffer.

This will have a benefit of allowing to use __counted_by_ptr later.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  9 +++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.c      | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 1c5b2b143bcc..485fc77ad4b1 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -5,6 +5,7 @@
  * Copyright 2025 Linaro Ltd.
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/ktime.h>
@@ -25,11 +26,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 {
 	xfer->acpm_chan_id = acpm_chan_id;
 	xfer->txd = cmd;
-	xfer->txlen = cmdlen;
+	xfer->txcnt = cmdlen;
 
 	if (response) {
 		xfer->rxd = cmd;
-		xfer->rxlen = cmdlen;
+		xfer->rxcnt = cmdlen;
 	}
 }
 
@@ -50,7 +51,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
 	u32 cmd[4];
 
 	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
-	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
+	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
 
 	return acpm_do_xfer(handle, &xfer);
 }
@@ -70,7 +71,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
-	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
+	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 44265db34ae6..26a9024d8ed8 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -63,8 +63,8 @@ static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 {
 	xfer->txd = cmd;
 	xfer->rxd = cmd;
-	xfer->txlen = cmdlen;
-	xfer->rxlen = cmdlen;
+	xfer->txcnt = cmdlen;
+	xfer->rxcnt = cmdlen;
 	xfer->acpm_chan_id = acpm_chan_id;
 }
 
@@ -86,7 +86,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -119,7 +119,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -159,7 +159,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -199,7 +199,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -229,7 +229,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 0cb269c70460..c616ac951a0d 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -205,7 +205,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
 
 	if (rx_seqnum == tx_seqnum) {
-		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
+		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
 		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
@@ -258,8 +258,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 
 		if (rx_data->response) {
 			if (rx_seqnum == tx_seqnum) {
-				__ioread32_copy(xfer->rxd, addr,
-						xfer->rxlen / 4);
+				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
 				clear_bit(seqnum, achan->bitmap_seqnum);
 			} else {
@@ -269,8 +268,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * clear yet the bitmap. It will be cleared
 				 * after the response is copied to the request.
 				 */
-				__ioread32_copy(rx_data->cmd, addr,
-						xfer->rxlen / 4);
+				__ioread32_copy(rx_data->cmd, addr, xfer->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -425,7 +423,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 	achan = &acpm->chans[xfer->acpm_chan_id];
 
-	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
+	if (!xfer->txd ||
+	    (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen) ||
+	    (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen))
 		return -EINVAL;
 
 	if (!achan->poll_completion) {
@@ -448,7 +448,7 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 		/* Write TX command. */
 		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,
-				 xfer->txd, xfer->txlen / 4);
+				 xfer->txd, xfer->txcnt);
 
 		/* Advance TX front. */
 		writel(idx, achan->tx.front);
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 2d14cb58f98c..422fbcac7284 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -10,8 +10,8 @@
 struct acpm_xfer {
 	const u32 *txd;
 	u32 *rxd;
-	size_t txlen;
-	size_t rxlen;
+	size_t txcnt;
+	size_t rxcnt;
 	unsigned int acpm_chan_id;
 };
 

-- 
2.51.0


