Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B70CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w3kpJ1YF1DD3iYW4MQj35xJ5DvVrMxnWZA099SWSNrY=; b=ASWZ8gDEbc7yhH
	JCm+cfQMbB67huAS37CpkBPNulLRjxTc2fCWvTJX/axRr9LQ+U2ZPpNiuXamzhBn263oltwYhbXyJ
	WKUE4pcSiy1HvRRxg0TuKp9DNkW5gIU9Y3ZIVQe1SsVDBJev/dZpCLqGqq9L/7SmueXT5unsr2wzv
	88LhHHhfz4Y91nEgq9zfLVSy2LixYsPBRnz43VNXp/cdzGwHbeF26uMyXLrw3syYh01kXDhDJPiTt
	KafBJIdvanjCpoHxvAhmGtOkUEYQbuWw/m9SFS0n54iJ0ROSUrClbaUiWpI2dbf447vZeMkdsqAcM
	CHnVH2+134WYLqBOm7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9zZ-000000045gu-2qtE;
	Wed, 29 Apr 2026 18:50:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9zX-000000045g9-0SPH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 18:50:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFVMUK1721227
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w3kpJ1YF1DD3iYW4MQj35x
	J5DvVrMxnWZA099SWSNrY=; b=d/mk/SxfjYGF5I+3MPAB3xkTFJwd3+LGrfhXaP
	3SGu1gzh10LlkLlR30ynljkcIITKBJ85UKflBEvDXpWSNDMMPKPbxUL7UaJUhkww
	fxJaoUiVcli4vERVXBNgC5Pn3UxS5aQrHxIzekrBfm3z16i8dx5OB7pntQr7wqzf
	eaZUZqp0bD08oPnwtqcBbKU21G0fAnAjH50pfhYra4kLQT2xb+Z7VMq0a4NMIeUt
	GMllzDx+9zejzDvLxwZpU0IJVvJQXbe7AhG/pxh1GJGdpiEvhhWOfLTiNvcWjsOm
	FWZ5KnRU2JWmp15kPVL6G5rLlNDmllnU2MBkkNTJe527buCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua733je4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso1378301cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488633; x=1778093433; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3kpJ1YF1DD3iYW4MQj35xJ5DvVrMxnWZA099SWSNrY=;
        b=iE82bPmQP04VUz01UDPZec0T8hswymxprHWqLbTonEwQ22U6D3elTKXrj0CsbUkhq2
         iQcPx77rSbUIngvfFLHRQyNHiW7LkW/sDgZeCgPlfewKrIB6DXdhRKu40u7aZDpm/Lrp
         UJboBfULfdlxf79+UCT6A353zI05iraUaD7OB4Ned7Lnb6oaxnPETCJUOPoxu4AtJeyc
         WOtS+l5We4Qjzbe6BtdrYB+8t5AEVqHvBon5C8hqLEVK2a5UiGENMJUegfFTRrBNjrDs
         wtWOabz8JfyTryuw+zrtos3Vmlxig1DE0+0A7jvfg3W4VWI8woDAuyZ1hGIycVKRBfvB
         6Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488633; x=1778093433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3kpJ1YF1DD3iYW4MQj35xJ5DvVrMxnWZA099SWSNrY=;
        b=nz/eFM2w/4lxNPqAV+ZRBcaq47IiHqJyVgi+HI8KJmzxos1UWB5GqhvfK8RaEXNOGN
         v9NsxTs/4KJ6r+AvV6VFjL3cB2pE3X9OOGeNtyROPDu+MOAsPRMuigREp5mf8DcFtZkn
         05NdCOzfvjWFgCaDpLfs144xD9zsrsP2s6XS913ZijrXTzwQpyPQQXsz2jNoyJ+1hGbN
         iWIJBlMBOxQ2evlmOfjbZ3zIKJ3OvKMQVNgQnfuwh4JaGVNqW8G35g6JWz+XZWgIsn3o
         20zDXiGVvHDorvx98wIg9vOl6Ghtht24I0APqOW+6zqNcb6gRJ7jOJpLJb/UBkB+PKw4
         7nUg==
X-Forwarded-Encrypted: i=1; AFNElJ/l77XrUowQ91wD83txG7E3iLypBwi5kW//aY5Y+sxw/3fO5/WMCVYNEmkjYmI/hJq/5IogYvIiqHYrzlDlECQk@lists.infradead.org
X-Gm-Message-State: AOJu0YxBcSyRBnyRTqY0CYw1RH6JSwQW5HDUebWVYx+O9/z4xNdZhXUw
	FuKEympoSJ0gs+q1M5xTznpkiY9dQPyLDkzR06PIYqJrMwNgmob5fA+5xFCHn1WMS8576z+UzLB
	tN3SkLfZrZuvNqlNn98ijtg6AfBqIdkGlljZmsTEW37jFd/qnEPIZE+Qk3WKwtqaQ1EuyBvydRR
	HM+Q==
X-Gm-Gg: AeBDiet9xIf9a96AT+F+Mfj7s+XgdEPC5hY+q+3NIpY3uW1OFxEjAPoNv+h6971rNJu
	7zD1jO1MPMbLOgeCkFHfwnS6YDlRBNGfmD63WvF2rnkWn8+sUPWqQbGdVqQAkjDR+rd70QkI/x6
	2N+gzd3qigENMK1BUBe6S2WYoJ/zrjX6+8VvFrrg9+HQzzpqB0GLxl5qTk3aETLtVtOXIkpwt8j
	0prNmeGfog5drjfmPojpnbdPO5AHnYlzAKyKzM95PQ7T6tIV+0ZUy0mh0fOq7axR0q6D1uDc3A6
	VcmEcAF+tvZZXrmeIqELvAtFkQWORswa0GMdCHMtsr/KqPRs8GEi4dM4K6yHDgglY4ig6E+e3sO
	lsaYoryzNYj/kNFHNPsT5eX5+jQunEtxPONv3XH5Ax4Ri/cNxzl2KmmQ=
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr114508111cf.4.1777488632923;
        Wed, 29 Apr 2026 11:50:32 -0700 (PDT)
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr114507721cf.4.1777488632489;
        Wed, 29 Apr 2026 11:50:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: defconfig: Cleanup and change Ethernet
 drivers
Date: Wed, 29 Apr 2026 20:50:21 +0200
Message-Id: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1S8mkC/22Nyw6CMBBFf4XM2hJay8uV/2FYQJnCGKHaAaIh/
 LsFt25ucpKTc1dg9IQMl2gFjwsxuTGAOkVg+nrsUFAbGFSiskRLJVq0xo2WOtGkOea2bNJzqSH
 4T4+W3kfrVv2Y5+aOZtoDu9ETT85/jrNF7t6/7iJFImqdlbJQRaZTeXXM8WuuH8YNQxwGqm3bv
 s5Or/m7AAAA
X-Change-ID: 20260412-defconfig-b57e7f9b5394
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HBHVal0FD6L9MTwIwcMg9wiNZPqpQBx28ASdmtU384M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lLxrpLsdOHut7VtjOiX8gPoC004P76w6lbXi
 6wVhQWIM8aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS8QAKCRDBN2bmhouD
 16C7D/4yWkW/Fl+x3Q9KV5n4VrRQVV7G+ErvA2VPxIfvAxeL7ia18kPjqzSz4q0SLSjtxCPTa/Q
 tllUpJchTE5+Hk2P+zIU41qaUOEoR+R8g0TEwWvPiBk/vJveK72WXF7Qs5knU/5DyB3FuNqxgLo
 /t5/AIEax8m0NWHSSvyrvea2qEpWWfx4vP1eTdfBpUjqhvHPOufMml0sX21uCubJUguj5FTWMjp
 Hh2T/iGRBcFk0zsTy+zP8hlbXG3ICr3SWr+fs1ulQDpjqz8blfXwc+ITUqke/hvYcKtEtUa/NVV
 TZuXzaj4pJPCv/gdFLyVRQ1955Mnv1J/R2daARN7l2NbF+IXY6NdfZnQDRNvJJikOZCpYiemWkh
 y8geMVf45qqJMeIKBtLP8HId2//y91ZbKmPJUfC8pRIMxiPKfXGdYEHN+38aYYhE62L+llU4bMJ
 OUDzZ+BtiViI+SyEq+Fr528Vf6z7C0kXTyrX8pbSzonZWA8ae2t1SGCTKJ1u4DCSm19roQwlZXh
 lYRh0OFaK/t+lanjq27QWtaiijA4my3FPvLlq6FOrZnuxBKECsEudOprePg6XOQKuPrOJ6u+c93
 a2ueP5BB0TSd3J+hb4ODoUtUTr7/wuTw+tiFCWG+ZpdH+RSyi54t779esYkfzSlDjBii7qYqkuP
 eWbJtaHpr9Vm6mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f252f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=W4zqwXEf2e1zRF2VhI8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4OCBTYWx0ZWRfX6HhyTNJO/HZP
 alkXg86Q7f/ZTt0lvdiL/rRdJ8X8EzxpG9E1odmxE4pxhTdlNtmkZwyObtbunsvvwy3+XZ6MYjO
 BsLahRMm3mEC5eQM8yhlabzPUNlVRM9FI9nWiprD+QsCymUaV0yOtKXuc9bidd/Kxe4+NZAPTD1
 dsOZgvrLY6Wy5xAXIzzFlGGgLbekSXNJQ83whxr6VACnAp4ZgsPwQvCGHj1vb8sfT2bxSRee8LU
 idbssn2NyHtlrs13FPvUK+N4qOaePN+tIIc6xjehIRmJI7VMlhzxQoDI7TMPySQ0rkv5TZ31yUC
 AiV1eZCpIT45qDEODgd4SAsxIxTOIe4zSZQPZc1l+EaJCSTMGyJsNimGn5/KUPbIub7TgeMy5Zo
 2COK8gjsJTU2fQTIIlh6r/bEttp7TaJAQ3lkGsDZf3nVqopD81GON/BC5sAikuRtQ0dU9AKw2B6
 flrvjc4CqCkWHqUe3IQ==
X-Proofpoint-GUID: U-Q0bud24aO227h5ttjtmR7Rlr5lGT8J
X-Proofpoint-ORIG-GUID: U-Q0bud24aO227h5ttjtmR7Rlr5lGT8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_115035_211528_16F8AD7E 
X-CRM114-Status: GOOD (  11.91  )
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

Changes in v2:
- Drop patch #5 "arm64: defconfig: Drop AMD XGBE Ethernet driver",
  because the XGBE driver is used by enabled ARCH_SEATTLE
- Last patch (switch to modules): switch also IGB, because it can be a
  module, since I2C will be built-in. Switch XGBE to module (it is not
  removed now).
- Add tags.
- Link to v1: https://patch.msgid.link/20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com

Several first commits have no functional impact.  The last one has.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: defconfig: Move entries to match savedefconfig
      arm64: defconfig: Drop unused legacy netfilter options
      arm64: defconfig: Drop default or selected drivers
      arm64: defconfig: Drop unused Ethernet vendors
      arm64: defconfig: Switch Ethernet drivers to modules

 arch/arm64/configs/defconfig | 374 +++++++++++++++++++++++--------------------
 1 file changed, 197 insertions(+), 177 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260412-defconfig-b57e7f9b5394

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


