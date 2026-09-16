Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ECEC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R8MN1jUSDFS343/7fvvAHk6j8IvEcZo9/KawqASQ3kY=; b=ms+eR9S7mrtws1
	4pscMOLbC3h3PENGV5AJHeQS6Mr243JzhiAT9o4ynaxRzibWZ++6CxkKVZoEissnzS2qAJitMLeUG
	kDjruqE2F6jNS0ANmU0jVbelZIm5vzAH+sEHGzhKD2jg2xcJRiPZ0UpcNBZ3DTJZQtymbO6U+QBOY
	8FEM7bJD7vOdBwIeGQJwz/UI9q9K1KQFlX9lFqBEiUPdjNMI/ivROUDnvpTlMb+5jxMDiioQe+S9K
	fKUqMlYNEeOIv/CWxjn7ibdS5qyB+IJePxUONTaTBeExwNgkLxSC2R/u840eVXCYF5YpD8s5373R+
	VQaqhf/LkNry2NJ1qmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t5Y-00000009pS4-0RYa;
	Wed, 16 Sep 2026 17:06:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t5V-00000009pRT-1oPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:06:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GGtIXK3402903
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R8MN1jUSDFS343/7fvvAHk
	6j8IvEcZo9/KawqASQ3kY=; b=G6on4X0/Mla60a3HI91EnVnQVoH8GaUZ1gQN2M
	vYHlwg0qvlPIxzsYyZKr+NJGyEpZcAxSPIlynJan9+qlQsIyXnLXXpEoDxAZQVXU
	CfItnzMo+c3QbHc4HDE0NunTVzkR/TIlKZbzlI7RT4VKrjuK3K+Iw1VsUQba8k6s
	9xGOggaDlMP2vGz2Azs6brFm2cOcbSuaOuMXNYqt8pJWmsHomFb18QiPdhr85tZh
	XE0ITtFp9VQA20WqdIbd5+tXDeJNGV189eNBugECl6id0xFfmRmZo9xDZvAR/sRj
	21/yzWrDofJcQnN3RIs7+8qBUpdf09EQNYQ6BKc4m4uhY8VA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d01u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:06:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso2005180e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578384; x=1790183184; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R8MN1jUSDFS343/7fvvAHk6j8IvEcZo9/KawqASQ3kY=;
        b=WAOD/nzHLOBZj08PxPkpwZ5dCa1dcu+U+9IUvrmsQsAcTvNvsTKUVJRqcEDlDVG0/0
         O7YZN0L2Si7kYovlyvFeZV5H9OMv2RhHu2sw+LB43a9ku3ptIT3XdyYr5RwOkcj3diR3
         sxRRao2Pmfel37M5RKPbgsl3E2h1Fo7ss8YweGtx60FRLVJ6OSpGTHzdZ9iPcvmDGFSp
         JtJFhsadNRIILUgZcxz7qJgJHm3DstNeIcP4EQ5obbpzHwRA+uM5Cxgy+3AxtI1RVtSI
         dn+QCexJehDt0xpnxSb3tInFjZdS48a4U5nei7sJOAyoh/BXMZewW4dUroZw5Ugayep+
         a7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578384; x=1790183184;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8MN1jUSDFS343/7fvvAHk6j8IvEcZo9/KawqASQ3kY=;
        b=rpNZl8t9UplUNDcUYjN5wyQdIZThrS3u84PMy8eB7lFr2HnAUtG8BkANzQRK+q2lSz
         rdGspblyycNjIeGKwLu1lpDEQ+OOWo2FlqQDkpjTDkdUNUcvE2CKVCD2TJm+U0VbsJwf
         VkIUCM07vODeBxuI1AozaAEp1ZrdSywcaiUGYwGl3LIRf7LPDI+Bv7At8AkD/1GBvgu/
         1zTfXqvE1BxsZL4JnOKgNpFyvJvnzZwCg93NXDZaOJUbTm48OxZH7cTm4PykwF2/jGve
         M3PiHY2PUtDJiROeCOat9mCmfJUyipjDMzb8jJJlWizpGYB9rr5WMGDc7GOW3ViB9dAy
         eMgA==
X-Gm-Message-State: AFuF++mqpFeyIHYfc7HTiIeJAvB8Wa0/bnHaXK+Yn2PpM2oTBmGtotpM
	2J2aKGN0Z70ivQofOefCnCU81nh14+AlDa/ntZqH4BWiHj0uvOIs2WczuPCBLd6dPc0nuLv82Cb
	eyxYN4/9why/PXEliPauG2gCcLXLG9yUd1yyJTALQN7TwtkXWdAvzwPiKxp3dHR2ATcKvOoFxjK
	YoVg==
X-Gm-Gg: AYBFou07bNTCRcKhKK3/YxIpb3XQkr4HAJakK+GG7l4sKYdvlxb+XZiImEZnHRzagtx
	es81OLg04xZY35+3WmPkDAJApKc39nzDwf44Bm6B5tPpxIxjk0aKdpuxF9glnvzIE43o3yJ0fzg
	r+HpGb2CeNYB7d3SwlzBgX3qRukBtyYn4mL3IQT04v+OF/eISmuADcJEXSSY2DwNX26ahyYUTpL
	mi6V6JHIuFAyR3fTshFpiFRA6JtE/4slrJ8Ef/i5kTb700OqXl6e+p5jkKlYZJo2JxYom9bNGhj
	Q/tRyveSo7ctc3/z4mhv1ygWOnCoOSwFmy48Bc4dRmPtE/gePLhOYGtqTekprF4UWFQshT7IW6y
	yMXNdEgblWb0BS01A0LkpnZU=
X-Received: by 2002:a05:6122:6314:b0:5c7:ea14:4fe7 with SMTP id 71dfb90a1353d-5c9a574a8acmr223982e0c.9.1789578383734;
        Wed, 16 Sep 2026 10:06:23 -0700 (PDT)
X-Received: by 2002:a05:6122:6314:b0:5c7:ea14:4fe7 with SMTP id 71dfb90a1353d-5c9a574a8acmr223943e0c.9.1789578383352;
        Wed, 16 Sep 2026 10:06:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344bfsm7951293f8f.27.2026.09.16.10.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Date: Wed, 16 Sep 2026 19:06:16 +0200
Message-Id: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBSEr2K69hFawYgr72FY9OcJNdBiX0s0h
 Ltb8ARuJvmSyTezMMJgkdj1sLCAsyXrXQZxPDDdS9chWJOZiVKcy4ZzUBWYSEBypOQ60ANKlya
 gGKyOoL2L1iU0gOYijVHayBNn2TYFfNj3vnRvf0xJPVHHTb81ekvRh89+ZeZb7//VmUMJjZR1X
 dZcV0LdPFHxSnLQfhyLHKxd1/ULDkYRg/cAAAA=
X-Change-ID: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DvDRUmbdA1hNLtbXg8l29Y6o593XR55fqEPA4seYRpk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqsyK0nTkSriwe/0MMAuYN/f8r3VaRJQpQYSlC
 XYDy3ELxdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqrMigAKCRDBN2bmhouD
 1wmHEACWWgibWkjIlfqAt2MKy9hE2yYOPIVsZ8DGJ26S3kKVqOosYVDeaZk9FLCPPdT2B4RAbs2
 j0FXA6Nw3bX6XsRI64oIWE5z004fs/SitB8i4DZgriK/+QWFuwtFuk7JAmdASf6mV6yaeMI4J2q
 +s7TcTkQzqIMGYn2N3OyJNVT1H6axeXTi91VSZ8theoYSfKxwNE08lJoZEYZraNfOMg4fyKsRn1
 K+Gg2mzWXzwHtvXdzAE7VS4QdgW4aIsPvEwI7nAXIFNo1/+Nohfp2qmV1z9W2CTcLXo6YLLLKPu
 XzYvxdlSiFSfQ6xIbSGYyw5kIyRyAkp7Lpx565zautGlFaBhnZDP+ll4541fd1h+m48aW+N/xYq
 uvGr6t35lybnW/541vys1fCdGLdkeJesQsgrPEG8bGvblCEC0uPgpsy0Tla3HAd7vFm4OlKIYQi
 6HxHqbLBZKeb/Fz+aq1aNsWeYiA2xWW7diaY6bpCDY2r56calFBTZDRZx4KMRY0ropOo6bFKJw1
 DE8vozcjKQ/zDXCQ/FyAsR98/zTJBasPJGeurSyxSVOtuLLZvGI4vBbKqRoyaAI4XAnzqA1eDeg
 NWanNJg0jxQ2eAyDMZve3tiBJrIciBJ2iCr3HIM3qhKK+XH9l6dTzoiFlSvqIr23srP6mYi41aS
 Ge74esyIK+t8Hcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: LaSdT2TVL5kHww6fVmxce1y4WAIeat9h
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX58G5eERTf/hV
 Q0YTvrTI2XYQVJ21YByCeUBy/v/US8GDRuJxr8eEKyfedfVRlteqglKVe3holJ33QmNLwFOD/vz
 d6cxZBxl78Gh6fnaIlkMYALkj/e8u9I=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aaacc90 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xKH-exNoj8ZXVN6IjzYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: LaSdT2TVL5kHww6fVmxce1y4WAIeat9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX1un+A7i1HF6i
 uYMLMxd1jeyichPXtV+Z++gqOUngz4rQeBPIT/PhJGOEFAy7fekIdA2fqM+aN+vxo2ozN4VNIWq
 k07V2v/IBVmAxbsSixDm7SvX90DFmbaB3uQLbznwf8phRmnMAsEOeUKf9Xa0bJb3OZCFa2n/RbV
 UBLIJ2+Jkvv/TKLbsGGyD46k7043sK4pN0un8pL6o4Ffy7uxTbqauzuPqILdaSCqsqQ/KpRbLb1
 FTnCFoeFGZ6Zx+Fnnp9koyUvlJj/BHDiGXqV5nteAx10i3gAqRA8ld45kxxO3wackc7ajpcxNm5
 BOCIonCfE9vmB7GN8uwHvX7ULhLhm+gmjU/f5T6wnRCceYgodS77de3ygil56M0nrz08yYaq47h
 dknRfCyLZaMvv6buEbHMAEqboKasRO1BOJX4Ut9CCck05S8I+MAC5in0LryeS+SQ4cGtC3tDSWE
 6Fv7f6xOi7yhzhDnoFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_100625_491600_2264A4D5 
X-CRM114-Status: GOOD (  11.50  )
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
- Do not reorder CPUs because cpu@4 must be the first one/boot.
- Remove applied patches.
- Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com

Not yet complete, more files will follow. I probably won't re-order all
Exynos5433 soc nodes by unit address because it is way too disruptive.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++++++---------
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 108 ++++++++++-----------
 2 files changed, 102 insertions(+), 99 deletions(-)
---
base-commit: 9e8494291f765bb1a8f43e36fb6b9146b20bc12e
change-id: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


