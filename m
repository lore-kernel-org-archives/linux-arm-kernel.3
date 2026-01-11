Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4033ED25032
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MdLFsWjHIZRkAMjRx8XyAvxX1n56tujFMjH6H3D6Wb8=; b=UXdao8Bs71iZCl
	Gj4bw6+ggGQ+FhJmZuefTbOqsRyYDTi3p6gGgslJWni8esaj1Au4MZJXkfgrEOjSnJQN+2GpX7d9a
	wIh60/zpU1MLc4aHTeDkanZAl7XOH3Lx2uQzLdYTo3S620zIse0KtlWQCFSGlKdHTg8dxu9kt9Mbl
	/cfSKN6IatUFkXUdr2RDBvf2wvvsf8OvIDFPUNciLG/uQObOD0jWVAhhjKfmSxdG2ydP/9awA8gOE
	sIegVgJXi6oFVKteEUtFwhihSxq9ZL+qaAUfv7yJKqc/vX/QXhmJtjEggJA0QN9Tij/6kcKkR84ob
	/BOTSZkv6tCq6diQh/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdS-00000004Kxk-0GOK;
	Sun, 11 Jan 2026 15:45:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdO-00000004Kwl-1Td6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 15:45:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BAHlrK2916545
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MdLFsWjHIZRkAMjRx8XyAv
	xX1n56tujFMjH6H3D6Wb8=; b=fHxPrI0hpdhwKZqcIdv1Lp+YxkCOtUXBqjaXH7
	GiXa8VmOOMXj+e2LujPib7y+GFVR0yBiwZKCiSWR9Ys6FQy+aGZEiNLAWLjZ+8t2
	INis+ujViH3bHqd6uiGTIWH45xDJH7ihkH4V0rZqRrbnaXAU0nWxcYOwNkA9vb1j
	8M+qiEDjJoqygTJW0J4vIGQYk83vgyLtOSqEAf1UDwdZX1j5hD61j4/QvyCjPt1G
	9ikHpYwY4U/URC/dF3dioKEiAeha1d4tyr7mXSV7ZUK13LMyCc7uPoTaXIKxo62e
	+QRkaPWfDfda9hE7n9oWoQ8qYc31SNTVqfgW0f2pUfzmYFVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyrefd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b6a9c80038so610037685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146340; x=1768751140; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MdLFsWjHIZRkAMjRx8XyAvxX1n56tujFMjH6H3D6Wb8=;
        b=JgA4w9g0mp1Rpy0Nki6uDM91kfW2dhAj7etyaC4QTXGFAuiw1axDoGDEyDm5WXIonI
         PCDmh0n6y4oim+hxtVPP4VyqcmKLUDX4NmMUML/Lo8vixbAaZdx8JRbLMSHuWAIT4GOC
         X+/NbE1ZWbQ5E6/pFIW4AIiiPEV7J0w3ceprV/VPPYM4fgx49ZRgaNv2IZWkRR5Wmv+P
         I0uAA4dq+z5F/DbB5arTlh8NbcDUndCfxg++jKJx73/TZ4bPgCIyeWwRreOqaBKSemOK
         3jg6g7qIPKHQvoOCTypokzYiiUEuYi71jnNalpQVW980CZ9omVCzBDMzbEJCXrzUtSCT
         sK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146340; x=1768751140;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdLFsWjHIZRkAMjRx8XyAvxX1n56tujFMjH6H3D6Wb8=;
        b=SJWifZD6ELezEjAMXhHGddddG31Vmtzs9QuQT2vRONoEJlo/E7CEqCFvwZmzeRWs7Y
         o+HYlVHNTVDiM+hphta7+cPPN4JAnhr/Jsfhzhxyk0+qRrU4wLPgloqZ/Pj9GCA5jhqr
         cQu3NVi0unVqsZYG4eN6saJlwnoCQPpOkc7n+clpm6N7zkMj+yA/uRS9uVzAemvfbwaq
         RW+5N/YNB+nuqofyWul/Qa/Clv18pIdHolIRmeojFS0DC331/AN6Nn85WvX2ggUjYcI+
         B52regGW9/B48lcPdk6IRf/y4Bf2Th0nZsl9JAcbdnffCEfoZ9Tyv10JVAsp5echR+yP
         C30g==
X-Forwarded-Encrypted: i=1; AJvYcCVrAqmdsjqP57J4sxGV2AJOys7LLW30KU88ui0Qr4k8mSoC8bINJBb2wurLDrIuyVuM4XYab6P3Js11P5UHTWMt@lists.infradead.org
X-Gm-Message-State: AOJu0YxZVFFYnmGxB/Ymdgzsq81fHbVXqAklZGis/EWAkfE8cTf+RriD
	t3099kchuV6K7vwT8aUMqhuM+L+5TqfhSZ/RryzoqJPhcHBxRxZifvYzBBNRSMOpE98gq/sEDjH
	97tx9xVmWs3eJEoMgUGwn1zFl5UldkHbKRczwPQHKRp3wm/xHmrzVNV1IL8vuzwq9uIonJflSui
	T5PYyyOwCejA==
X-Gm-Gg: AY/fxX7Z9qp/CiMU4YGR6HZgFkeL4dG+LmxALp1zz6EBZKVQosL4sAzo6HHrfmlyWnn
	EYzupAj6v/6BMB+AXYgLamkvyYPzn2G1Kpp1Wdb+Ipe3wcb5HW+ri5hvaPASy5VYiYCCDh0dU5b
	XPlDyDjEeUSaUPRPceMG3bwXBgzv0qCgEYvGksh8zrSD0l8o9sSJijikP4yoTWwEttnQtgr1A/O
	ekZXZBPZxKhmb79/c3zaiUrnpTjly6WUE6X6kmzTalcJOw7+PIscZ+B4HKvbAFPE9Tn6NlLmCfA
	sx7H4DGS4qfTPAZFGfyYKPNlUS7WWc+3vDCaSFx+ryQZEETHDv6+KUWgnPYzYP6z4ZDxYPtwuHO
	PJWNtSdbt54t3mN6NBwXwUMNva456RiEiZQ==
X-Received: by 2002:a05:620a:290d:b0:88f:e620:21cd with SMTP id af79cd13be357-8c3893df007mr2186643085a.62.1768146339838;
        Sun, 11 Jan 2026 07:45:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW6HzxxfCtPHKE/LZjMIENnm2+RH/Q9xgNhQhcFP5uBiKOWdPXLy8h/mTMmdTVXAX59wMXSA==
X-Received: by 2002:a05:620a:290d:b0:88f:e620:21cd with SMTP id af79cd13be357-8c3893df007mr2186639485a.62.1768146339364;
        Sun, 11 Jan 2026 07:45:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND v2 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and
 drop S3C2410
Date: Sun, 11 Jan 2026 16:45:29 +0100
Message-Id: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnFY2kC/33NsQ6CMBAG4FcxN1tCD5Hq5CCrg47G4TgKNAGqL
 aLG8O42DG66XPLfn/vuDV47oz1sF29wejTe2D4EXC6AG+prLUwZMmCMaaySWDxo4Ka0tfAJC24
 19fer4IpQFZUqCmQIp1enK/Oc2TMc81N+2MMl7BvjB+te87dRzu1/eJQiFirJSG9WhLJId63py
 dnIunoWR/wqEmX2Q8GgZJtSMVXrVHOys95Htzu1bLsuCgMu0zR9APWq4IcNAQAA
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kqEEkCIScR5/MiJUkEOuOsx83FqDEKVFeb98ScMf/b4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8Wblt2WfaTlcEgr1PAwJY13vxMXIFXCCFKda
 xj/csBAr92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFmwAKCRDBN2bmhouD
 16dPEACXNQ0emQHW5KrqNvcneYbX9caV2GX+9qc9llbIChA+tBS9pJcAg9xo5vO3NT+9ENvIZKS
 RA7l+U6w88Lun43qUQsVSGHb6y1JB2qJ3tT6yG7Dpgv/BWv579cBK6F2ybvBxaJ1JUIcw6Q6t3L
 tLx3VacvpjtfzYW53mEODH5QYUYQrNktN6xvz/KHjR20awLkvV80e2LK7osJYuOES8TKpaa028Q
 CCA/k/xhEeTnT7k6IKah+H2hVfjqEVdnqgO5ZmHPZCNFOLhtYYctnbcYJb4Gwnd7rpS4RaRaaqC
 /vXKyyinTm8NNOFa3YUgQr3x+QCQC0wVBq9PCoyX34hXqirRb6utFArXwneFr+dmDqQiuvFhaHP
 Ef4rD/KVK0CLK0UJ9PaoetzF9aTk7e2VPOF6YP9EIzXcd3LeZ8ZyNoNWgUMe3yMj1TK/xM5uHwI
 iZVJAPZzueq9TElLDaEwaUDiPKWjIt5YpxCcdi8yt0rEHHe9unY/DlLZ/5GuBjZsEpiPNdrC9+4
 YPAUQCmb4HGBtvuHBAGP5uTLd04sFuirS89pRzdTgAaa368ZqZE+kUikZ3Rx2N8BxlrXqwZRCxM
 +qQ0dBoMUTZ3KONPH4w27eos/4g/qvGgE6K3A4yB8p7tEacydJdxYM0xOd5xKKaLvv4rD6zwkph
 vhLC5GvtJTDlc7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: UlY5YBmAfoNaCHjMZn3ls6r8juxorzJu
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6963c5a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IkrQgrjNrYqhz69tAt8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UlY5YBmAfoNaCHjMZn3ls6r8juxorzJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX4pIAfjH/5Hqi
 5nPaTfaGCoKEQfzdYP4nOUnCAqHUPj5WWqtezOVaw2OYgA8V/fNrGktoli9TbMb6OEcT5KTYq3j
 zW8a/sWEQXMzLFHmuU2S0U8kmawaS2sMg5xIAfIWsiuJTGs6pENaboXYdbWKgsSuBWPtxNMGWDO
 OIEbjXq0mXfjng4khvicBkJyog7xSEX/WYVOJRkL7HE/fHNBoZWcBfSXBwES134yeVEiGPfyV6g
 UAx6UqPi8iZEe25R5M1VYuOQHbqA2gMu5FZZn7cjDTGoNmKumahHswGTzkKw63r80/gZweH4yrL
 bIpNkhlqhmIRlMp37BZOUwGfTV02btsiGGo87cuXCDdR8RrgblrhSX4H03f/21tVyN6jR2GIkus
 ifOkldwQGBWxgVEzlMUMtc2FwHHyf58jH2jon5rs6o08vuCSvEIQEfUSYBrLShZqd2ur+IRTbb+
 d7iiCKJZPZX1T4WoRdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_074542_569425_7219D297 
X-CRM114-Status: GOOD (  11.74  )
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

Resend because it is waiting for 3 weeks on the lists

Changes in v2:
- None, just rebase and apply tags.
- Can this be finally applied? It's waiting for almost four months.
- Link to v1: https://lore.kernel.org/r/20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


