Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317DFEF99FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ChNQ0sN5/DiYoC6u1SEgcPiH2YqmBHOxmwxzvZzWz8=; b=TwZ3eLB1pdsOul+Voa2NxQq3Hh
	XsEq9NuHq6+8BwIs2c7ugTZBxcaUopshf+v/GWqlsE2go2JkbU483lnp5eu7u7cYH/D9a6TNsVknL
	7l3deUM/l1MoIwBfl9UdXIKbgfXSF8Eu22xSQDy35DcX+CD7cSdjTNKF1/8pCSfrPjajlOOeZPRFO
	YkszdnAx27w3eme85m3ITMeE0sBAahZ/1gIQ7AWlqgZH7RPW3bncmJ2Y84HOAZ25FzGAXO0cp0988
	JjaSRQG0DlgQoCu0BZOwPhTbG9NsmwUSu/k72CwdHUTqAdk9sTua0TvWB2/jWbmEJO5wICswb5oLq
	+GDvZDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwT-00000004XvE-01QF;
	Sat, 14 Feb 2026 12:40:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwO-00000004Xtc-1rLi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 12:40:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EAigp53548816
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ChNQ0sN5/DiYoC6u1SEgcPiH2YqmBHOxmwxzvZzWz8=; b=Ai2jgxSKwmRCG6r8
	DW/fxS+YPGAouZGxpiQO/NZLMVYFsZjjTfKUvwhpb4i1v9NAi2/8odqFMFlBSWGZ
	jfBVf+/0gDoersUXBs6kCfzrmxnGFh2vm/Tn/p4wyKuNcHoXx8sUxArgzGJw2ANT
	326lP+MKVjF1QG56xENQ8OFRWaEO7BpwXBj56zhIPPRq0sV+6Sc42zxh1h4wN4h/
	1UJbOBbYbMWBeFh5QHHupxzmiMmMrJj3Y4jFyDb6qJkMnn9JXy4LKoJUCrMWqQVv
	6Ei4kiLPhp/R/pDzb4dqcBuiS7K3N/LaogASUzkj3QuZNLGkhSQ9Boo3O0w7VdO0
	jpiC3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag248u6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:40:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506b3fb32a1so82016201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 04:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072803; x=1771677603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ChNQ0sN5/DiYoC6u1SEgcPiH2YqmBHOxmwxzvZzWz8=;
        b=d+mcMdu9HlzSo3mAEFZse+KA0m4jfC5Ulxtkon0EqaZRXN9PslEau0lc2UwGIAFA+V
         WKGr0LDPsVZYuA7xYx4U3TjK9PUkQ/RcjW81l0OTeJjUAo93CyfMePd+XyDTAo1YUgQc
         czdS6ijA+fdoXLVg9Jw+k8TbBXC92hwDq6zmqCacACfckeKT7AX7mfFiqJqwYvm1xmoO
         Rv9ud394E0mA2sOZkyE2ir1nFim0UhIJTxtHW6/2NeXkLw2D3Xv395aALaC0JWXdUWPW
         nX8h7mXpXYS8gXb4yLb+VfCvyy7t3kllcrzJRELwi3E9YhnxtpOAdNNdTmfhoeCzlP5H
         m3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072803; x=1771677603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ChNQ0sN5/DiYoC6u1SEgcPiH2YqmBHOxmwxzvZzWz8=;
        b=mjloBFe1oI3Fe4DzNDKf/ADqHOCsnPS2ph3lUGPNOjQOqutEDeqDWcIDTRiFEC6LNx
         8CfqtP7NPfbrhTm0dHFj//qGMwGoqWu3cMZR45NIqRiWAGR2ERcFRwiG2gYou1fZbUs8
         F3TxFusJCQOJg+3DCLCG/qLOjTDSuQtu6SM7wdPUtfkqM3G/bOt7cW+2hEjYTgD9r61/
         khsR5GoRKPqrIDUNBhc7CthzAA088fra1ezdJm1aMTD3334wRwPnQuaPZ7RChIb4qrGw
         mT5tHuEND0Ry4/oPWCiZPzsI+cfm43s5EVNcVUd8M3yybiblfV9qiw/pE79VhuxryDXX
         xioA==
X-Forwarded-Encrypted: i=1; AJvYcCVcfVHRq7XkMEhRNZiAMlVr/ru5nQ+1g3JDSe9xToFf/PhmI//1yBMegHu8mLlxu34o8otFyrDj4IJGAdAs/HeH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1MXY9Ghi5MOrwdmIU+FUCzBOgtNtow7OhqyJvOik8E3bXOl6S
	f2A2YijqIdVV9FzjNt8T0Yg2U47+fZGHeqsc5uRloYuqsl7zTr6tt9KKg9HNFCJ1XZsMCTaurkx
	wGVAppME4y8P/+o4Q+1gU3ASl6EwkRe3bYNm/FHIZYWRuachGbozLzzJFkeR0v5SUUcq2TJyXNk
	ASLA==
X-Gm-Gg: AZuq6aJL2+EUcI+wy3FXnkxE4bmz9lxSnBZRqFdKugV+Ym7GSKInyjS2CNWgM3Kg6Su
	/ilGHriS7frxzMw8dFnjYnE2ncTnQxXjx24kaDF7nCkG+hw/RRUWEYxrAVq25pu+EFY5yXH9nFB
	xL18ids/jD6zLrHZm+gfHMYfE/RQBFI1jfy8nb4RR6tghJpUlrbRHoEC2CDs+XLrz8AgZvyejYi
	MLQ4z84jQiHCeAoZhLQnBJl/jFywAeOd09YqOcJfBegej27RT9L2Qxus/UOETUnPFN0Jb1wydTP
	yQmMSA55SnzpI8zr3yXJOjMabYIV/ijrjSlrTKoIcHRth9lh2L8Jx+YE4YImdUXZXZis0ElmVpP
	gNl5B0NRseCW+udUDRfbJiat/S3EMSmI2tKP5tYKq6Jgr9Q==
X-Received: by 2002:a05:620a:471f:b0:8ca:2cf9:8197 with SMTP id af79cd13be357-8cb4c01475amr339891585a.47.1771072802778;
        Sat, 14 Feb 2026 04:40:02 -0800 (PST)
X-Received: by 2002:a05:620a:471f:b0:8ca:2cf9:8197 with SMTP id af79cd13be357-8cb4c01475amr339889085a.47.1771072802231;
        Sat, 14 Feb 2026 04:40:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:40:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 13:39:41 +0100
Subject: [PATCH RFT 2/3] firmware: exynos-acpm: Count number of commands in
 acpm_xfer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
In-Reply-To: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6706;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7feOF3Elx5oK8syt/T37E03ztwOdUNRtuaEPtI7X4x0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0b6OQvxeirc2xuqsfeyQEzVUkBzADwwpMdt
 WS9g5qUQbaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtGwAKCRDBN2bmhouD
 18GJD/9TaH0D1uNgkwpVn6l0/zxtSfyRi2kkO6reLHLEwbL6l3EAhGf2aqRrMDKDyh7UQQgRgB9
 RY7fSQAvdAydKnS3ovDFWBxPG6ZU7CjdtwBhZTE4Fet85+ea1bEpUodQRU0CRHNAIZ3nYhaDyIM
 OoDGk8VNryGEJ4nPBM0yiMNcOrQ0oatdASHxa+yzniGTpQWN8vdyVM5ktYa0I7k+hIZ9lx6+3SJ
 myQ1+r+0bseAVdIhbjSIAWzPnAPgUG7/2LBafX4VYyc5eJ5jUOIj5ilSt/h2w7Glb8JzB79PRGj
 QiopKUag358Y7yIoyKEgy/J2SQnasD5H7ldXjMN1Oucs739Gd99S3A2H26zUI95mG8qDLM7H+jq
 8M5cU3k9Qw+1Kr8OLrA/naH/r76e9m7LuKIr9dumQG+J9oC7UL7Z0HFHOMSYHQmoUP5h/eJPDLn
 tyqAPkS+u0cOZtEgwBs57KtOkzUAMf2+NJ+85nY21Lc2/W1ghBQfO97rXGx0+Ok8OdYTw2a370l
 4cCuvLueN6PVEW0DDhQiPp7rtDKD28Fd0pVKvXhGSq8DwZ3Gh5/Fi2el7yJLiGmdC1JfY1AAS34
 RCcDuTeSRlCKzA9jdJhtxx6nkFahFqT4F2ORhmEDpGMsNrK8XeWgYt+D/YKeON9gloCbQATdY0/
 R10iR4/b42Ku3/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: IiX6yVhCAy-sL2Y9AxrsZQ5ToBTn0x19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfX4wYBamlT1yO1
 plsviCToSKuF1Q3w0hs423R44gG9kcjmUW+hfo/rkoJ6bwkpn3vpoJbJrMnBI2k3WhM+gVksY+3
 iq4smTif50XiKglxPXuVm15GgLbEu5UY8KykUuIFHt6+4cQdVe/oUIN4QUTLkPrA87tCf8uKQfY
 P56OhiqetHpajikxDq1JVpfkGfRYJJzRgEs04mISc4TX0InYRFPFkDGzbPlp3aUUw51jVtDhBry
 +nEwgQEDq3UVvK8NEeAriF7FNrHzp+0a6mw8Tgp7UGuIKo77Pmmu7jdaBuMGUNuklTf9A0Ie4kP
 J+qO7y/fWu7vgtDJlvQn49xhQYwLpdiv4IQUXM0akOPWt1QPbt2FQG/KK9F6gzhkJZlGjCh68cX
 54EJ8PTq9AfYkvBGb8sLxqnktSudUKaBEwlskx8M+Yj8dMB170nZiCxD4AFheuYT+r+sCM7uYI4
 rb3NH6PaHzURH/XGRUg==
X-Proofpoint-ORIG-GUID: IiX6yVhCAy-sL2Y9AxrsZQ5ToBTn0x19
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69906d23 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=1M7bLk_J3U762fdM4B4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_044004_606088_D6402FA5 
X-CRM114-Status: GOOD (  19.80  )
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

This will have a benafit of allowing to use __counted_by_ptr later.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
 drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 1c5b2b143bcc..55ec6ad9d87e 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -25,11 +25,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
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
 
@@ -50,7 +50,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
 	u32 cmd[4];
 
 	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
-	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
+	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
 
 	return acpm_do_xfer(handle, &xfer);
 }
@@ -70,7 +70,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
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
index 0cb269c70460..242745e8394c 100644
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
@@ -259,7 +259,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		if (rx_data->response) {
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr,
-						xfer->rxlen / 4);
+						xfer->rxcnt);
 				rx_set = true;
 				clear_bit(seqnum, achan->bitmap_seqnum);
 			} else {
@@ -270,7 +270,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * after the response is copied to the request.
 				 */
 				__ioread32_copy(rx_data->cmd, addr,
-						xfer->rxlen / 4);
+						xfer->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -425,7 +425,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 	achan = &acpm->chans[xfer->acpm_chan_id];
 
-	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
+	if (!xfer->txd || (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen))
+		return -EINVAL;
+	if (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen)
 		return -EINVAL;
 
 	if (!achan->poll_completion) {
@@ -448,7 +450,7 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
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


