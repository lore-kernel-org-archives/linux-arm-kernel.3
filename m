Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D18CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=; b=4ne1/3HeCqWoc9JcZ0H75pg1Ay
	uqpdh2Zgw7pcLkPCj6WdojgNc9PNdNI5NZSZHLKp1d4NgrzNyvyHHgOB0yQHDus02VVGLTA3jNl7L
	gTnwhzAqbkeIbztZXxewNqFM47Kd5HvM1tFyF19ypdh5qTRyFrTK+RIBbkrSwuwBkLR9DLVgRbAmW
	BfraRRLFFRzpRpUVq3LEuLkvKp29zRc8POudzTRry601upcwvQQXO9xn1FCj5NeB9Qz/ZqlfBtOCe
	VKQZDeIYJgV6gcrS083T1bmJvZXcq4W5XhVyfHXyhnv9+W0Zpv3HHFKhBp+Yuhv1I3kVQpaEGReJY
	INcn+FaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBi-0000000HMBe-0nKX;
	Thu, 15 Oct 2026 09:55:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBf-0000000HMA9-2dfu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:55:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jkQx4011204
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=; b=Aen46/Krbej98b8C
	LesDKNiB6nAn2RhbQZHG+DByVuGiiMKPTZeOhTiQCVQFT8fg4iCPBJKorqj7IWeL
	ZehWBsfpeUQz6zjqqKglJAlsioG+jREQUB07npAiHS+vi8ZKQ6I+E4NnE2tEAlJf
	TtAJIAs3AvtgwgLfa25T4cwdP9Dm6fhkNNUXEFrq1WRhVxWbMbEdfwhXdb6C01M4
	4Umqy9d9rQ/r5Mx9t00r5x6o4LvABuv7hBLjRi8hFpCdz1GrLf3CLzkSHAkTaeYZ
	aQR/j5/+tSWZccep93mxiV5jdIcKWCyVrraDb/C/BTPLEkH2MRA3Fn8kyGU04PR8
	tqYXgg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbtn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso6044813c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058146; x=1792662946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=gWEw4z/+09slD4XcZbir+9Xwz9QOPfyprLwbhMtTeadqTw0uZigdHR3MAW9OsWaxoG
         tMMKqXB37NVHF0zs5he0gSWHV1rpRcZWHp6GWFT5y/dhkS+gvTLD6O7pW7lytcWd4eHf
         BTSSbdLScS6ozdfqwGTg7ir8ASNmzsSghIhiccZvzPTjrsnJQlY2arFTr5fWp/gF5TP0
         HnUuwIYiD23A3nIptHaXjyopJFOmTqqP+x2FphwJB4axq+wcAVTJSgZrc1JEuhpcdbrK
         MnqvsiIOnKhJ+PECeL/wJCBAJw7TCS0cN+44d9PHl9HJiNuzNEF3rPVpbqButvySkU/j
         J9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058146; x=1792662946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=T79rTrptKlOfvXkfY/VJZdCSda6tKMYUjDk/ATxaEd2EKD/ynZp9RydEuUCjlTUTCE
         XrxlK4PDGl8as+Iy5QK2FTaC2bfoNE115nHGbh7JF+Q4w5Ae0DR0qkMPAFa8u+i3wtJX
         5WIOsTJf0k1nSLhFwyZEaaMITU8h93dmeeaRJEqGwFSwumqhX5Q+jWpWlj6hOCVwQmxj
         EYVdj2zG3WQncptQvW3wirOnxvt074dWSwYoICclpx0klQTYpgT8qtCQ+vCFJMsKtk5B
         ybdaJQ2FA3snEv1xGFfJHVXcWJJtGRVGQhDf9DOcbw1pETqSvStzRRJlyREQTi7xlV2x
         W17g==
X-Forwarded-Encrypted: i=1; AKwUvBwvl+OILAZ+6x75CYKBRdkIH6HVq3HrKftC7+yWmNTkkV2kMdDkkC+MwqAQ3S35D3VmXyw0oF9dby1TcJmZiwC4@lists.infradead.org
X-Gm-Message-State: AFq9FYLLI/C4o7DldDD/lrNbfBTOPUSjqL60427kWCdctr0RGSx9V9Cn
	KUoT4/xJQSIGpjzxeuc0c5Rs6PCXtgvAY3yM6RWMT+lOBS5fQwMa4ANKQVvAZoYeJ9QRE52WT0J
	w/SwknGqUGdH1AAcegZFngbGy5LfmPKo3+orxzu43mFSs31kFBVj9xC6DtRNojuxGXK/gPY6Y+D
	iUAQ==
X-Gm-Gg: AYBFou2NgMbY9AluODnUDl9hgad42gV34+4koHbKXv/d38IBVE2b7qcOl17qpwka7kv
	7ChAfsA3X2/gObLhfTdJu8Ny868eTl0T+nYaX47dIn+Ak6t00DWGdqEv/qJez0pi/c7I4/wU6Fs
	BuACsDCbi6ohAGz3OoDJa5zaUcHCrDnJNqfR4xV1/a8I1GEoS4jYVvW3f7w9/sao0nBZuRPjKun
	jt6W2Ih2Uq5RUzaurfd6yGBHUJ03kGjc+wgJ0kJ67cOmznxS2fgxqjGz8aR3UT6ynf5CMwtOzLk
	+KS4sflVvdfO8LSM4KExz3zop4mR+VFZ8auH30dSeu/i9vSXZCoo65CLoBPWGUAFjF5YglxRYV5
	WXK4duhg+Ksb1ptGK9rtmzHzM+6iB
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902773c88.44.1792058146140;
        Thu, 15 Oct 2026 02:55:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902738c88.44.1792058145567;
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:19 +0530
Subject: [PATCH v2 3/9] arm64: delay: Move USECS_TO_CYCLES() to generic
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-3-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2581;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B+xQa6aWfmJa8pgwrofKzJvK3PURgsj7wVoF8yt4ddg=;
 b=8Qsz/wTwPE8obmSszofPzNsTV3AW55FSO0pTbnSQ8pL9/PopWeZZUe3RYhaBB1KpOzqbR+2wf
 Wv2lcWzDyyFCGsPOWNA6LQvNsuv8/3dekFfOSjD6FM7QFxHqs7+fJJV
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: gCoXXj9za7s0-dkhWXyLwAYLnredeXj2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4B7Qowqhh0vx
 BSpCgeDTjrO1ttFNYCe1TGvO+KygYdPJnAwR2NFpRF/Dvjdm6K2oGEjuPL/jN9H4mm3ctlQ/Spi
 vcG6hJK86NtQF4tsRqS67hRtlf+Ld5s=
X-Proofpoint-GUID: gCoXXj9za7s0-dkhWXyLwAYLnredeXj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX2jz+WuuA57JU
 ikn+3av5F7Jg6TnnQEHsMkQ5BNi58I4BE9MXUEJEdcQ7k0YIbXXy2Ea8S9yp2eEl1t0cuHwotpa
 XDLFoCHxWpnluZ9auB7dMtJZhiBv7UtjhnIJ5lbJ08KCLJ4ap/0H41OscVMs3PK4fD4YmlNCvG1
 EsZ+3p6nFppq7+Kb6r9s1Km+QN6HOOFseegFY0bfcBNXsDEgAUOH0FLjmBQ77MokTkkwLbCsvCb
 L8bOTM7bKvhV27YwXIQvMspJHpj3AWjiKhkYauMMvK+DZYOvjlSgF1aaIMRmMitENS2YP5ANd6P
 6GSnZzuwdoqWwoW3Ff/QOaAh4e5HHioZQJ3W/dWbqvjqT5Wl5jqJxXQP9p0vRFnPIxYAKdJiZ0C
 ft8nWpfGNe6YDiLA7fF6RqT0iIz4HY4lYhTwt8ucxx6oQPdlcJQy2Olm2qYntoJ+oPrp63jc9e/
 f7x/96SyHW+V66eJoPw==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad0a322 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5RFle6wAAL-XeIEoYeUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025547_689303_96ABD65D 
X-CRM114-Status: GOOD (  16.95  )
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

USECS_TO_CYCLES() converts a microsecond delay to arch timer cycles.
rpmh-rsc carries a private copy of it and of its xloops_to_cycles()
helper, and the MPM irqchip now needs the same conversion.

Move both to linux/delay.h and drop the rpmh-rsc copy, so there is one
definition for drivers to use.

No functional change.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/lib/delay.c      | 8 --------
 drivers/soc/qcom/rpmh-rsc.c | 8 --------
 include/linux/delay.h       | 8 ++++++++
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a9ec3953657a6bc8c0de0da4399fc..117ac5a2f13df1935dbcbc7bf32901f7a4411295 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -15,14 +15,6 @@
 
 #include <clocksource/arm_arch_timer.h>
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(unsigned long xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 /*
  * Force the use of CNTVCT_EL0 in order to have the same base as WFxT.
  * This avoids some annoying issues when CNTVOFF_EL2 is not reset 0 on a
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493d9e06c048930b8a14a38660df4b1..4a664d522142747427de5589f8aa90b3e3b74bd9 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -146,14 +146,6 @@ enum {
  *  +---------------------------------------------------+
  */
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(u64 xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 static u32 rpmh_rsc_reg_offset_ver_2_7[] = {
 	[RSC_DRV_TCS_OFFSET]		= 672,
 	[RSC_DRV_CMD_OFFSET]		= 20,
diff --git a/include/linux/delay.h b/include/linux/delay.h
index 68b2a69dd24d6c135f9f749c1e2f15f8b3bdb141..31e1a3dfe2dfc1a9dea7fd6d7db735f9a2507474 100644
--- a/include/linux/delay.h
+++ b/include/linux/delay.h
@@ -17,6 +17,14 @@ extern unsigned long loops_per_jiffy;
 
 #include <asm/delay.h>
 
+#define USECS_TO_CYCLES(time_usecs)			\
+	xloops_to_cycles((time_usecs) * 0x10C7UL)
+
+static inline unsigned long xloops_to_cycles(unsigned long xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
 /*
  * Using udelay() for intervals greater than a few milliseconds can
  * risk overflow for high loops_per_jiffy (high bogomips) machines. The

-- 
2.34.1


