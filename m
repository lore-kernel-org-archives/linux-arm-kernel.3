Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68404EF48C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xb/pzIo7QtIHMST3kDc3YmbGjD9C0q2jOrYRWsvjzV4=; b=kPGBx6qFSdexzI
	6vGz5SMPY0NAxtXu2gJngeA42WE7fCU2p4sxM04+Z6HXwlLieWKvvbpNFQVUjnuHh5eyy2M0jsrR1
	zbGTUCmkDGmrFr/yZit6wKaOWbKUks6jgL+y2kMAz5SrZ7rA+UPd58vISaL2F4RZ/PLePsBky3c2G
	XBmae5SOb+Y377QpKSzwm7MORp55Ket26Vdseu/85vLtVtuwReMr/2q8Bl2JlyFxonjAF3bChj7+s
	iK7qOxRSI8HCvAGqRGaQl1xU9+eyZ++O4D2BQWFCgxR6N2qDuKCqiNqzUzLjVhre8D7W7i8lB1qu8
	wGF9bdGh9oI6JcK5fY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwO-00000004Xtd-1jCH;
	Sat, 14 Feb 2026 12:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwL-00000004Xsr-3kzT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 12:40:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EBTnKe2440609
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xb/pzIo7QtIHMST3kDc3Ym
	bGjD9C0q2jOrYRWsvjzV4=; b=Z8ReBtnuB+YPJaGb7uXNpFv0dU7e1SypluZuck
	T5zAt9d2rbmfVRoPlSwKXrgwcRFJpecKjHgnjAnZcQitB8AbLngBMoQWeaXAn5x9
	i6hBiLSeDuS2bzI9i8kQXjmK5/RGgOXe+odKRl4M7WfXMpW7fYOBeSibmVX3dtrl
	7Iww/cQEz5qrRiojoXaLN0oeiKg7PKkQ9uBZR8T7QzMlG5QKU0XBXZfXyMsDW59n
	+47o+PZx1QQWjt+nnZXvtzuFXTGs7gyopyMv2yk1frtJHb3ntFmKDBfHwRlTUs3i
	MyLIZLZz0wZ6yKt0VZ/RoGwcS5l/vTqVSmXLs6QpLUFd9HYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe60pkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:39:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506b4005ab7so62567961cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072799; x=1771677599; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb/pzIo7QtIHMST3kDc3YmbGjD9C0q2jOrYRWsvjzV4=;
        b=En77eQ484fTechayX96LYyHcGyWUW1NqvI+O/ATIEjvSUyl7rfEUxgakVJCNudPG76
         rgwlz96zsSaaUkjaSRqd7/ZDARgxn7cYlnhkE8S8s6aQ/+WgGTjqLfsO2CbINqfQ6Mdd
         VvY1u16K0bKhMTrPEk5DY9Ok4ckxuELTec8frNnpb2hYXq0IUu3cjTGLf8yZprLfsJqo
         oTYdpJdp5785OEEIyaFq5OfEvpT9pb1wEDarNWB1Le8dDRhUxhiLz+UNDJCHzGlbLJae
         t7CcNJLY0/PstHqU/Uk1y+C1mk/QJDhNh4Xh9W6ByjfwTvV9CbJYmX0XkZiJfaUS+ejN
         +R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072799; x=1771677599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xb/pzIo7QtIHMST3kDc3YmbGjD9C0q2jOrYRWsvjzV4=;
        b=Lc3wPOyoYzFhvzCP82JYbqCDKBsE+d/TzncCOcR17ghcIHPK5/PNG3wL5wQ7KQCVnu
         98+YsdoMFqWPgrEpEui5OKnpGQbuRoZA0i0w31l9GoeFmzOsxD5bMo0N+yn0NrHMZ5V5
         SWqpgTktHyoCDArJuNCOhD0PnunJrWWtCH4Whzkf4RaxVi3F+2iFdiU+QXuWNtVfICV4
         fVm8IqpcBJ0hI2KaxPY7a4txIiX3K3OTONFiwNMSuCcNJmVQ2P7Hv1qnogLEU5aOWRjZ
         2LxAR7V1CTgPrHX9A0WtBxGw0cI3uuCbHGnfZer9mB6QIgXsgvoKTi19CVomMHILtT1w
         CWDw==
X-Forwarded-Encrypted: i=1; AJvYcCWry4ciShT6LtkXTCvLPsENS24sfpgV26hDccR+NLJnHEH6qPG6DnjFi69dscILFD+503PpAicsWH0uxVBao5no@lists.infradead.org
X-Gm-Message-State: AOJu0YyYKRFWPd4bHMC/kC2okjG+cW4gA+sFCdFYxgBnrCLNu3HLW0sl
	8/sVKhDk+UNJa4BUXcnJkV89LgW+Vo6B1TM9Ex/XUZ6KkJYon1rwYAnRPnIKbNcISgjxSErQrqL
	M5J6bdE+bavEZp72dgSCi5j5ytUu+uEjnhk3lUw5fcdIlvCLJ96zp+XuNdQPFV5+gYjd2G9ngAx
	75Ag==
X-Gm-Gg: AZuq6aKZPIb1ofINFLMgcxlvWg5Vkcmc1VY6VHWEHqmKarPx6abfNNwJ1bQCPGYRTtk
	LWKqusZLkemZStk9CEkB4LzJ1V61impOsDoqIFGjEMSSzjWP2bpaRHPIfH0bY2QFFvH3t9yoQdH
	wc5Krn4xsRZ6C8gFDDcs6bVqJH8W6T7dl+KAMjN5jvQ358vh2ei1hLlN6EWfysJwuydV7MGIISF
	BTTv9gysSfjkAK3n3z5H3YqbAJstNHYm0qIemRon+F2Iaz3XryDNAtlONxxeYNIxBF7KVFUe9v3
	qKb9C5BcSt4ot0+355/CnP60Mtvf5us1C2F8gLMkV1gi52ZTRC30NZ+PbYddiUneSjJlt0qrmwV
	Al1tW64EpKUPsT4JBwkMnrCR+vCcqT3v5fIIX4olkqMvkiA==
X-Received: by 2002:a05:620a:bd5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cb424bafbcmr554203185a.80.1771072799094;
        Sat, 14 Feb 2026 04:39:59 -0800 (PST)
X-Received: by 2002:a05:620a:bd5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cb424bafbcmr554200485a.80.1771072798555;
        Sat, 14 Feb 2026 04:39:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:39:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFT 0/3] firmware: exynos-acpm: Use __counted_by()
Date: Sat, 14 Feb 2026 13:39:39 +0100
Message-Id: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAttkGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MT3bTMotzEolTdxOSCXN3k/NK8ktQUXSNT0zQjC/Nk45TkVCWg1oK
 i1LTMCrCx0UpBbiFKsbW1AIdLyPlrAAAA
X-Change-ID: 20260214-firmare-acpm-counted-255f287c3dce
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ONiiqucp8rwwjeLYwP2GWKV3pJxf48A4/L5huMYhgk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0W2H6AKwxvD5z8NpRIIHogIgO+FxKyPSD21
 Nx3J2SgRnOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtFgAKCRDBN2bmhouD
 19foD/9Cqx9EUziHMahtUq6/t26GEQ9mlLm0mCCkm7Bw9XFArPV5wat7RCeuSWufRj4C4c2/I1A
 7gT1G6Xf3ELFwmzH/06/lA6rtdOIARLJ6vxGEUQoJLr/VixcUgKDUN0KJkaDnhwGxmIvmJubm0d
 O3+zip46n4ZW9mGzEsGNUVKp7ruayuSvSLx7bHNdNxHmih40JPSanL1MGHicCraxoN3rELl9ftM
 qiwtXUetwwj+mNY+m8UFUYhNwLV6/iG7NfFKBDR0aib/iLXBALOoZ34xKRmt03p9MIZOuFfSdDt
 zWFeJmHEDZ0lzothX9GjNRI+gb+2m293CxcdKBXlWtKbY8o5x4KfULxF3jUic7Mzx3Y6YkTpGRd
 uNw04jah2wsa8iJwxLenBN2UY9fK4gNlswGSZhjU21cKEU4OfE94mQt2sU1ZhgcKgSHzoW/CMNf
 wUaWh9OfBh3A0gCrA/MLxWTII58DhjNFyGUIacVBUJ4Qb3IlfWyVM+BPPzJSxSoQT217DneNxWl
 s38A21SAGi7fzVV2Zrxo1K1BNsJy8Tu3pJH1Az2i9gWfxqouYGP+FSdCadbAfCHsDC/nkwU8uyZ
 h05GYwxczzAKG7hCSRr2p9YPRU0C+e8r21CTXYvG1j8p4rmnqmORlxfi3xvJo+XyHF8sjNUDaT/
 A0dUA6VD6b6XQWg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=69906d1f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=xOK8jz_NIFPa2TsfdJ4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qX2zO9LbuJbzfMuZP6KceT4kOoMhpSSr
X-Proofpoint-ORIG-GUID: qX2zO9LbuJbzfMuZP6KceT4kOoMhpSSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfX5cSOYSlUbPP7
 fO3VX1XjVBNKW8BQbsHkr3R7OtGumyPOSKflQPKHby+kocePAs4G3l4H/++krE7UfKF/sneFw14
 lQVyo/BOAJKZFhJQghmzaH/3TEA+cGpBUnR4BwGwsoYLUrlje/uHe8I3CKiImq2aPYN1jVKGYBj
 pRPAQibmu7vawUkiUDUn4B+Nc1hvPAXYqKNWK5q9dnBFET/J5GtpK+vrPHFH0sNE5+GgyPK5ivQ
 wBVMEzCpZqqjklswkCj+VxQrKe/84hH3jlyncol7i0xwNlCHxVE41bJc49VPErr59Ju6jLocOA/
 SCfmBgfARWIywfBIyQnaN3JaDFj6Sfkjz85d1FVJSMff6VILPvxxXf1nCaDPG4EDiGJTDMx/Csj
 ShOVZC6ACgN6jnTIuSPmu1+wK7lJdhFgE8RuQKm0GyS5pBc10eFXJK61U5qMioEX5/OqW30+kJx
 smZLS0Z7jZc9KbCgnSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_044002_073525_832281B1 
X-CRM114-Status: GOOD (  10.77  )
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

Improve safety of the code by using __counted_by/__counted_by_ptr.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap index
      firmware: exynos-acpm: Count number of commands in acpm_xfer
      firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_ptr

 drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
 drivers/firmware/samsung/exynos-acpm.h      |  8 ++++----
 4 files changed, 23 insertions(+), 21 deletions(-)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260214-firmare-acpm-counted-255f287c3dce

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


