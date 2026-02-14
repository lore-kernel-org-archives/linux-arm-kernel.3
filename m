Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D341FEF48C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfe4t1IfvFtaq6PrP7lrtAAdNePeCLs4FdSACzw0PJA=; b=lh9fNB29DJRTmvHAAOCcNfIcQn
	iuMaIVhFs5M0j25ocAujt7r5MpwnX+P8qF60uZkgnXZwYWS/RhG2GnKL26gUYzqC8U44l59dhuOpe
	hJleAQdsyWtOtLCN11YkKQ3OtKOaDgfHs/nQckqCJX4F+spCLfuyCLZ12WzIQENgNG1t4AV7bIWyV
	fZ5WxvSgGNFXd7Ku+ExnCn2MZ9A75cuSMfQ+/lI89Bb3KcT9hjlghK+1iR+td0HbibWlUUDkm3qpc
	sAktGzm14mG7LsV+fUsUDilSgMPqh7I4JEvwpUAS/kWU2V3jQ7ZAumk+PBmgGnnBGxKIVi8gUZzWk
	XpkNH8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwV-00000004XwN-3O5w;
	Sat, 14 Feb 2026 12:40:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwS-00000004Xuv-1Zzv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 12:40:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61E9Sve22206082
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qfe4t1IfvFtaq6PrP7lrtAAdNePeCLs4FdSACzw0PJA=; b=bKwtkAcZTCk4Gg/t
	bzo8UnB5xe+NbsWSp4BDQ1914PmHPKwJybrR4h5fy+f8DcU7wKVuhWjR9wbmNttI
	Kq8gd+w2tDJ0KkIBwKOBXH84h1cEdfAJVT40/5o2RwLT7rmaX8veoDUeZxUEYczJ
	OY2RPgeAzWwbZYwS/MdMpn2KPp4uQa6xTubCQ2rIUD93Sv+Gh4ErHn+qldbYHSI8
	sOh/rshlUQJjb95WimsLt1WpUKhTv/WBS/zbIeXBW4qkXKIUd/4Lcf3mGpv36duo
	BmHmhvlb51zivyytAlEW7T+9+zY389E7W+FOzuottrD5ArSeLFF+dATlRA876c7R
	3nyqKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe60pkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:40:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so636188485a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 04:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072807; x=1771677607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qfe4t1IfvFtaq6PrP7lrtAAdNePeCLs4FdSACzw0PJA=;
        b=fpA8oRbW4KdBH6Tioo6OTgbRLUSrxI4vdxs2bo15spijELCFV8F0BvFFCeCZ5debof
         eLRKoKGRZBjBzQxTdPsfCBnPDodXSyZRBfd1D91K94t0qGduljgD7qzmiTmZ01MD6BVh
         yoN5Gv0q5XEgD7LBBoDgnB6pbeH7wh6DzKOZkdahzedPCw48IxQtT4sqjuDG+JCX7vF/
         kik7XurCX5av9MdLgE37DmumYQfBjpWLoYAwSXVaHwmI+3O+4PtEIWlXXl2jODIO7BVG
         8nRkmzNYvyFpfhBEYUKa0bE3XB0UAHAd8pzZoYZP9Ilz4SbCKN63ETsxsHi+bUeR3DxO
         26Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072807; x=1771677607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qfe4t1IfvFtaq6PrP7lrtAAdNePeCLs4FdSACzw0PJA=;
        b=Q7ZrBlGFsC9ROcgHwQpIQbYqGq3iKNIZ3nx5QYIRQ4W0+ImEF64XVF3zSpIu3W/Q/i
         aY27N7L7dNz8eORwAT6ZANJaQvinhT2iwwTHC98J+VDsAWNYf+517I6ebwi+4Xecnwf1
         nGv9cPzdBKwjjQoSSTjR6PMvajIauI9qMwirha1mTVMTZGAjysYLfyBqj+1CNKOv+hhB
         RFtXtPeqd3ZCOctl+nfO5lj9nKkZoFods+HEen45FuuggeDrYpjsM1rYm+2oEuzMat52
         lsCtqNHRK2TvljL2b38XwUjF/K4wEAdVCJNoJndSThbAQ5zgxvA+4DX2ZmuXDtTtsZfF
         zNtA==
X-Forwarded-Encrypted: i=1; AJvYcCWi9pvn6xaysSz7GFxXL1tBN69AdqlkB0yC35n7cE2t3z2ph/2n66j/vOy+kxrHIwjU603lv+VKSzhQtSLrqU+F@lists.infradead.org
X-Gm-Message-State: AOJu0YwxyRjqtH0ZtvlrIRwoEJIYsz7SPrrzSeB3UwR4glv06n1/b9HE
	Ullrx+m53kJyj6NT2L/SUinCFryklBUi/9Z/Z1LSsoJIHiUntpldDOVhcOa/iJFivrYCZ0SnoWO
	tb7nivI0P1AVRIYUIkazoo8w5XRFTXddUGcGGsQKywXKOvQIoum94wVY32ZgiB5YJGsE2qAc2B2
	KVvQ==
X-Gm-Gg: AZuq6aKEXYNQBvrZqKsUqMLxyJzV4IrC0r3lI4uizJCxiQtGWFY/QUp9Ut+Y+xpNRbu
	oKqNZLo/kN2SRLE4p4YfyBC8hXA8CU6/A/tdwfRg1799/8uBA+wmc2CqCmMFeQceNEvdLrrF/rX
	IznKSREAyhutgHWhMuc3F3SIVuLEd1QyQEoB/N3dfDj9+CUg2gW19ZnMKZwurQZpx5TQM1/TucS
	vkP5xCdpg2ON9i3xBOtr2K7Z6VtuaO8YdfDfE5hhbik+tTo6EygjhNokuMfnNYSgYH3hE3KytjH
	IWIsa4H58VgpMDEP8U/IMnGWPEsieQc7yn2JQAHdJDVLhogEPxWnEvfyKhPfS5ZBmb7RkZunIJ1
	EblRWUZk0kmdgeYRkYYlNkMp1TR+PHhlQHCU7MWcydTv0uA==
X-Received: by 2002:a05:620a:2903:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb4c00c94emr346485385a.55.1771072806824;
        Sat, 14 Feb 2026 04:40:06 -0800 (PST)
X-Received: by 2002:a05:620a:2903:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb4c00c94emr346474185a.55.1771072804086;
        Sat, 14 Feb 2026 04:40:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:40:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 13:39:42 +0100
Subject: [PATCH RFT 3/3] firmware: exynos-acpm: Count acpm_xfer buffers
 with __counted_by_ptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vAX0qIkhBcbpZf/oznc21YsjusKij9EY5BmIgI9Sr7s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0c/JRXcJY9Sc07saFg8+mEauct0i5cEA9pB
 pN1qP2vzj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtHAAKCRDBN2bmhouD
 1z96EACbWxdW5F32wYbd0rmoZMRy4j/Wn7g4wHkVHbOV7LkRawfegVoTDDp6gimOSqT2X1dUfUS
 kOeR/Wu+/gucDSpJFkauHlYuyopevHBV5pPc4H3ZejnfkaO49GnBxi/MdHNDtspXYLc8ICrCJrz
 150dtU/RDT+aC8OCJd1yqorStz34XjChvudY8SSrSyFtfDL0jjGw3q8Y6S6g8LHhq9uSOIOCyxV
 MP8h66ge/AWsbtKw50xSWT1j7SOsaenT/rZAu4jlZLXf7uv0oNqxs6riNKP11pUce25bsNsIPOO
 5HmMBpDobHXrbUJxnzehI3rsQZy1L8zZ6WtgR+pbi0KLg+3Hc0vrZxVqIRd5LJeFym0f6JRO8Kx
 xKi57yWYjIWsp0zzcMMw2jqYOsVnsrd6G7JrEfX2qOZumcj3BqTHzYrZX2plwgEuNVItsvBX+1w
 NBAlEAMFa6xHAcdfTLPKDEwTBNdUdywvkk21TPPPRfWm4tzVpHvD+UI//TRcsj6MkdMTu7yk7ai
 4RcDWfhQ0Eg5UxvEDGDnODNyuKGZxHQRdjFakqLm/oaaLSEoRQNC7BJE5vRolniL0aVOLDo7Igf
 d8P5YdI+AJO1MAOHwA2HUB1pfCsEFgdta3kwuthJAOSf0rimyzJzPUzqesCcLbjQ7Dp3iAltBWm
 7xpZ3UeXzmjldTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=69906d27 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=S5Eq-Qd902Z19Fn_UHYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aVu9oaMnruXV-8zHaZVQXMTXKix6GMOu
X-Proofpoint-ORIG-GUID: aVu9oaMnruXV-8zHaZVQXMTXKix6GMOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfXxo4rx8CYiHVU
 xwP12F0wGuqvmL0wUgV3wZ8PQlGu9yEyL1TPoY0R5TnMNwLbO5RR+B2+kTZexXSkwtlptQ1tbbT
 lnfZS4oKnmIE4FE9Nz2yslDgP0agZWMXHfoYrrwkWmIhI3jlxT8061IHpky4DZGnYSJPJp3TEaW
 9qChkUxFPrOHiHRuegd0TM23Z4SRnwDYhulEj/OgGPhvrn93rosZGuMSGhTdEWOyrGSIlB0lwU0
 /2XxB40kfxnqW9DBY0QNu/HbH+XaZ3MslS4/G9y28jID9UQuTwCMMzhHwH6+XCKI98BaSA5VuTV
 BI9vLEL1f8q3z94O6/Nlo9F1eLfXxSGfV2oj3EYc+fMZrS6f5N060bq5YF7cNzfutHG6nHDTRGJ
 Yj3X9k/zXoyVFeKe3sLxG/+bwradM/ugOrQ8rReyB2weB7X28n2piNfnYU+MnsXJq3KoS/V9Xt3
 o0hHKLaDmkEtqLLRSJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_044008_540890_8EDF7F21 
X-CRM114-Status: GOOD (  16.65  )
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

Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
validate runtime that we do not pass over the buffer size, thus making
code safer.

Usage of __counted_by_ptr() (or actually __counted_by()) requires that
counter is initialized before counted array.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

__counted_by_ptr() actually maps to __counted_by() for clang v20.
Alternatively we could introduce new __sized_by(), already supported by
clang v20, but it is not available for GCC, AFAIU.

RFT, testing would need clang=20+ with COMNFIG_UBSAN and
CONFIG_UBSAN_BOUNDS enabled.
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c | 4 ++--
 drivers/firmware/samsung/exynos-acpm.h      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 55ec6ad9d87e..a4864973f65d 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -24,12 +24,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 			       unsigned int acpm_chan_id, bool response)
 {
 	xfer->acpm_chan_id = acpm_chan_id;
-	xfer->txd = cmd;
 	xfer->txcnt = cmdlen;
+	xfer->txd = cmd;
 
 	if (response) {
-		xfer->rxd = cmd;
 		xfer->rxcnt = cmdlen;
+		xfer->rxd = cmd;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 422fbcac7284..8392fcb91f45 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -8,8 +8,8 @@
 #define __EXYNOS_ACPM_H__
 
 struct acpm_xfer {
-	const u32 *txd;
-	u32 *rxd;
+	const u32 *txd __counted_by_ptr(txcnt);
+	u32 *rxd __counted_by_ptr(rxcnt);
 	size_t txcnt;
 	size_t rxcnt;
 	unsigned int acpm_chan_id;

-- 
2.51.0


