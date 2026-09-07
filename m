Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D709C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ppud3nGl13YsNzAxyhfY/OorUntYFNkI2yG5l09eE/s=; b=KAqWWxPyz+RhDKBK+xWG54WmGf
	e/U0uLXrixRvripqM6Gwba4qWyNQuAmbBX7anLZcEI8BJ/F/GDiwdq/gkFI7Oj35IWNfYs0EBW/73
	txQL2ni399X+zEBMF6zv/bDD/4MIkiexN6umYXC5IJLQCUErx20uV7v1RMjW8yQEOI55yBUADtilG
	jZ5MpLVvTmTL2c2o2Gcl9pGfQ9K6Lv8bXBg1De+cpb4s71NoZhS1sXvCJfekeOhHUOvLTwXDmkfal
	X58SA9mAq6OkIG+iKtcLlgC6dOblV+GqJdcXV+CD82rnb7bR+ctyWqmGE+J4aJxUDZd83WRDyQV0n
	rHDluebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3agR-000000075HK-168x;
	Mon, 07 Sep 2026 14:50:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3agO-000000075Gs-0O43
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:50:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdUCd3025901
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 14:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ppud3nGl13YsNzAxyhfY/O
	orUntYFNkI2yG5l09eE/s=; b=T8IW4QZv2orgIEkuMBNR3UuBd/4eotRB5Luj2N
	i5MuvhPLWpoW6jTE8FDZTe1IZgxoU3MCyZ9QFq3wRghVv+n2EKGlzUzZSkO7i84T
	0u5OD5s0E3dsILtH4pwgMMYMcpclptlTKERyWffA+7LJKYu5N4b8gcL4qxGTkHr7
	m8qAiDkD10zPadMdwIQ4Vwl+arNkc7qQMR+nVPN/J8xcjTUa3MuFud0kkNOXX1tZ
	udZb41D3J3Xk62TjXbYmEHLGqX+GKSdUx1kJuKiu7v+Bdclq51jW0xYEQVkEky+7
	e9woIbSyJ0j2uAZlC/hHO4gTHNyvM+WW7Wb4JPr4x63+oZVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty14tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 14:50:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so670954385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788792650; x=1789397450; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ppud3nGl13YsNzAxyhfY/OorUntYFNkI2yG5l09eE/s=;
        b=FvvRLWJ44y9obcaYUB+UCcwKX2BEzsJSfFsPTJvnbvQtowwVSj64/AEo5i9clEwjbE
         WC/aHoPfr2+eehAQfNffrr5ZPJ6kNJiwYC+ljaOLYLhZnyVjlSPo0VI1af7SM1UzCxMy
         gWq5VgC2XHtRxh1dKnnyRgXSHQ0OX252AIubXMjWimcgi1EUTrdUQmYtT5igh5ZIcnYD
         sUDCqtmN0YBJFmfgSO1AvaF8MyAWT8plF7yt6O8JosnuA5lYL8PLp7/rC1cd692A/1j5
         Ocan2NFwGHTEdeFZ3vZxrNhaQz2vwJ62IUJDYvjoEUOYv8Rapw4H9n1brZw1M1OfVAuS
         Yeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792650; x=1789397450;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ppud3nGl13YsNzAxyhfY/OorUntYFNkI2yG5l09eE/s=;
        b=pbvQ+i5mSgvihF4U3Ku0u8U/SNN1t4rMcM96eLt8ik9TB29Kp3MPie1Z8fzncuHMwS
         zHj4ixqPORKjYAiylmdtSXCGOpXNCngKRC0hUuJyRcawACTYhL4qwzzXnHDn7mNwhPso
         3fn9sm1MRxM1LykBFa/ivWrK1ifMRutf/+FwhDttjpeD9R2FSC9BepfoLGHnZWPL57wm
         lBEkK/Rcv+O+X5lC/jN2BqqV5T9/Xr1pI//9WMunGipKly3QkLCRnmVt+4YV4u747w0s
         EnB9iSCISL9wX6g3u1MouBZzGx2c2kdpmuU/gE8PtgPLjVe4WEKmSKSXJoRpyksHG4Ts
         5nkA==
X-Gm-Message-State: AFuF++lmatXGMWhg/xItreTI4TCjwAySW5DouSZb0nOv5caUwMkx6rFF
	RJw48FeiATxoW23ot93qFKkOkq1NWcAyhVjcV5csdw35i9cVNUgZpYlYYRuhUIqEA1RLRPr/JxD
	b2eZDNtP0xbBz7jI7iHoFVUfvkqa7uhGsarPY73pZFhI0aSyMufntSJhKFQ9ZfU9q28fIXRc7fe
	Gvbw==
X-Gm-Gg: AYBFou0LOhm6F4+W1pHJwprU8/j0gHVZd5UQIJiXk48+v1Tca8KB3u3XxnkJSbbIlG9
	9qJYrhvQM2/vReltSdstjNYXTk3Rbn+QcrZMCNfESF/+mVSlhmekwLH5tMmkwiO8BuvkkvOsuYg
	SmA43kZ4Dv4BnUof51u3XLWfddjRfqtFITwRHFGBOUgQJGRQFkU1zMcicFoklJg/oR70Rat1q28
	HgS5U/LLCj0gkFDC8pkvlSweODS/3gy1JYt0+63FlzR3GKleCawsJ8k1naNXsm8wDAoHt1ttHrA
	H2tRV1e9D8dUWXWjgcf4PgQ+eKa4LsJQDmHdAsj6zKKYMjNH5OiN9OAJIWnsKaXn7NGTwUiBs6K
	ePHFwCnG22jzdpr2aBPEiVi97Vfk=
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2292724285a.38.1788792649580;
        Mon, 07 Sep 2026 07:50:49 -0700 (PDT)
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2292717485a.38.1788792649044;
        Mon, 07 Sep 2026 07:50:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm29352286f8f.26.2026.09.07.07.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:50:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 16:50:34 +0200
Subject: [PATCH] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADnPnmoC/x3MMQqAMAxA0atIZgNVtEWvIg6ljTaDrSQggnh3i
 +Mb/n9ASZgU5uYBoYuVS67o2gZC8nkn5FgNvemtmYxDL4cdMPmLUJMXirifXBSHYINx0cUwEtT
 6FNr4/s/L+r4fdMefmWkAAAA=
X-Change-ID: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K2ViqTzOpEDHvp+cqdfYocXKmQsQgnQjVeDffFe7fWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqns9Bv3NjIrxt3+2C2pEysw5R8Sg664dHoSRZV
 Di1uvEpaVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCap7PQQAKCRAFnS7L/zaE
 w+7mD/4l9IRKkaSI6SJ0J+rVvXu/a+tmFBna6FPq6jp8CjYS+Qx45NxwvH+4s3vm8TMZU7ha7ZF
 293O6Z22dlTshcljlPcPJyM4FIDaPwtNbEynp6OsLZd8IFDCQ1BIzOq3vSNfKcYP0G35L0Ev4Nn
 J6x6RD9ncmHxinx2hy5SYLLQy5RSCb9H+mt7uqSnYNMfc77AY9oCbrhe1+uleENiXqsryZ3Hp+T
 k2NSOUZmyR2WN95svWm482tFbfgC+xTIB1AdE9Qdb2Frz568h9/sfqg1r1T2BMdiDIIbq4MC58Q
 4sNyzGO8y1xkcegwZwUuvllCXFeGyeHF9sAU22JbzwoW9k77FABG4MwF5242PPokxnvwx2ifs0o
 8dUhvYxthfV627z7f2r/vGLeztm9njh9Q4mDsbwunv01xg9BrkV+LNXzj42q7tbZMOuHjDN6w1T
 GdbBH7qkKdQCv8wURf5P8TU+o8ggO5WkMu602uNHf8K07SzfgLmZn0OUfcXFXw2ir0mDLol3JlR
 fKTNJkGUYjTFqVzCqOdVGaTfDaE/PXNg5MszJqBkmdc3NmAJIZRhf5UFmi4PFUeYJe+55RCGYf0
 gih3SLuHgoegcCb0qGJRA0RK21VGPMdzsLWxpB8AmaZIP19wznlMpyCSBUMjYJQ0BeDGRjxTnEx
 pw6xhOFYC9T0QJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ecf4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-NV2PVthcPmsdjADTgsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sIA5xvzSKXMyoL4dRIzqQybuUpfNw27W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2NCBTYWx0ZWRfX6RXxnBdXGuo7
 tm9VR6ixEAfbI+cRDUhpE+unm/w8OfKiv4tzNT58g2fK0r/TkW0BmLBYO7MDvIMVKx8aHky16ew
 VuoS8SEUaNSVwkm1h8w8uAhPl+hKu9c=
X-Proofpoint-GUID: sIA5xvzSKXMyoL4dRIzqQybuUpfNw27W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2NCBTYWx0ZWRfXxXN1P4asEaLR
 coJr6fU3/76w0mXxIjqPNmez+INCziD0kcDnvQcnyG6S6GCmyeHfxMeS2wgzOJNJg27VdCUmXGB
 QEn2USlYrGFQS4xGqRzEsTBOwdnCjPxs0o1psRgR3oYifZGmnxgxhwOq95FWL7I7oiiGVoR/jnm
 gmy3bWWakLYMoapw9W/pUlV8FUv6Ifc3e7KgvwlAO49XQlO+aWQZt/qooYom1Y7f2zaFIY7wuTl
 axEFbf6WuG92FwrtP5VZG6aI9JD/wNOCgz2vSRgaXko9dbw9UdwPDpRUS/KKuW8Xir7EDBEIEng
 Lv2ydn23vLppLOjjI/+1RoQ/uvrIc9c9NFWkKCetK1wEM/ZkTuVLdCxjIrlT9p6hkVU1Z1zOrqi
 HKCvF0uHv7FQxE1zA2GUVaOgHQ42Bs3JPuiCuL/M7jF/MfqrOuYr6+Hi3XLFNu/DwNTlqTB4cj7
 mCmwWNF6Lp7D7K43VFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_075052_139186_E1C3BC06 
X-CRM114-Status: GOOD (  16.88  )
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

Shared GPIO management provided by the GPIO shared proxy module has been
enabled for Qualcomm platforms for some time. By extension of the
defconfig, it's been effectively enabled for all ARM64 platforms when
using the default configuration. Bugs discovered initially after the
feature was first enabled, were fixed and I haven't seen any new reports
for several months. Make the feature enabled by default for all ARM64
platforms officially, which will allow us to continue the removal of the
deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig           | 1 +
 arch/arm64/Kconfig.platforms | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index bd0b4aeceb218f4085978af9421c97e5c7cea94a..b6fcf6c6a6089e26da08a7efb7eba9422f96edc4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -195,6 +195,7 @@ config ARM64
 		if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
+	select HAVE_SHARED_GPIOS
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 76a6a0e6ae4f1ed496cea090fd73398ed525e732..74c03cb2f9bc84716fbc9d186a38f4646f0f295a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,7 +37,6 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
@@ -329,7 +328,6 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


