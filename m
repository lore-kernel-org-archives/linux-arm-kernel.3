Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4D1D1118B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=; b=e7KUItCKX1yHSE
	Pn3hij4SHm5DUw2HWznQddGVwZG+kYBPsOZ2WK53kWdf9BXoTF3j+DMkgwoAB/X16D40FFiAxR89A
	EF3sJuQq6sVYVoh0acSBOfFG70Uv+rF0+DNGR3yCxGgnlAsTzvk7QWB/G9Ka9Ylne7B0J5DTlLgar
	U6ACMxlEyrG09JUj3qiBY/ZAavRrp1a/PvVFndra2f8osDk3Ii4j3R7yP2MZcxzetwZya1U4DKXMJ
	2nsxXteET/s0BukKV5SVXoO1N3YG497Yt08ixJ4z7gjEoFkkSGnE03QwLupxlLCYcu65amtw8/ehu
	OmRQTL99KaSw+NIQKWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVl-0000000FRBQ-2ZMR;
	Wed, 26 Nov 2025 17:41:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJV6-0000000FQo9-43ir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQG1r4l1234787
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JHqleQhItLHM4lrJ5sAFUn
	HOBmEniAGn/X/VpuywkDs=; b=R8SSXyZ2jt/e3jtjAV6E34xmlZUdhW48MkbRDR
	5z91lTXDoK5+JdOp5homLut9sjo+OL3vJHlDV1OPKAY4IRfEmfDdfV/9miY7SmvF
	jxzr+uMbWrG73B2+qC9Q4jbIE1XH+WbWAyFpmt3ePlJeCaGYDM7u5wObT47CjE4M
	1B7ANVCRzGxjiwudiN7tm8B0aG+07Dh3NZDMKGJoSjxGSQgXiEaLAFqURw/cubkl
	RlZ+AiK1AIiAf98g2xMb/9o2L5LqLet2RvyT6lycpACTiCnftg6rNC+SKxGA5TIq
	Xplk4z/PXZN5JoKHuua4d5tHtUXrbmma70H+bF9YL+3Ndyxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41rx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b245c49d0cso1824447885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178819; x=1764783619; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=;
        b=EI/E2ePdnBOpyC2q873xNAQdVH+ixVJb29v+Nj43tEfySkQ2h0rpQFNvd7P0CKWt/N
         oXTOqEpPoTD+CtF5CSgBjm5HIWRsTV+IAD3fZtQA8/U5PLUPPZGCO7K4CSwFs2+1DAOq
         x0uzXLKZpI5HNrOJmtcCXXM/qHIP7y2nbUakCBF2fu2xgCHEcV7eti1rTz5jFYLfdfht
         77zvuUOKSc+nRwC2o/4Iu0yyxm3LOD2/NL8nOZJgqSGdG5ZYyYUPIYdHNBiQ5+Yj4qfg
         E9bFGKJp+8kR713SkSJDeoOGGFA10JUgN0Q+jmJFs8ClyYTrJI0rM34/eRN4i7eWG3Nz
         AOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178819; x=1764783619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=;
        b=LiA5Cqq+i6nOqr5YxKzWxyBDoRfxvhZtos/lO5aCtVtRYWWU8rQO+md8tVvWOzU3bp
         QXtdNKXZ8JrNROapsgWwjAab31pzcn8Z5ZqG6UIWHG+/KPK9fcxfD+tJuLSf3V2Wmtes
         7sSGfDJGpoYcyc1vPEWV6Wz8tTlYBW4OYdSRYW44Y5R55dPjBp98Zd6dpd33Rn8Pav7b
         SSP5UU9vZ3NBLFjZ7sE9oyVtSm/XsSQNnsOjXX19vdPHXnviJo1XOsPJW+EIyIpDG4dS
         BhwKq1sClcUOy8NTK7tvwRteH13wneiC9zTNCxeu0+sdC2GiLS56DR0ZoDIreBNrwy9F
         hHKg==
X-Forwarded-Encrypted: i=1; AJvYcCUDwI917GAZ/KSCru/Dwbs/3DP/aUTxYXpzTMYPNzTGd1Nr5qi8cfF97Weypd6X1nRvkueRhSNJ01t9FPR6P4Yy@lists.infradead.org
X-Gm-Message-State: AOJu0YxlUghwr2De4g9JbpOasbpx8y0oE9SQRRfppkIHl5n+nF4SpPNF
	Rp4CnOC6J71XCHtyND8jXcFcjCdUbsGJW8+50KQIhKFNHFqv5l2S6tphYy5kWlSTg280zEpjMEd
	58piC51paramzrsKq2VRnW9VCkxm2XX4cpqEa4OCR2kjCoq7XGUGw6LwR4GoIcx76tE0DmXtA9Y
	BOJBYitUc6Sw==
X-Gm-Gg: ASbGncs1JMhtN8NUBY0T9qCRq6hslhb/Y5JU73dxF4DeBRJPER0bndfzsnbwxpHIGZb
	mQNlonQhLWSJfK4CUZckqw5d2qlh9l4LxKONPJBEl4HvFy/Wvt9KRqrMzr03K5V4MLiWcr+uB0y
	UxM+FpvHy7giOmLnPIBRzlg8Zo8Ld54eaPTzs5leNq0yz6odWq1xBTrLe4WVlTn3blAYBHAH4pa
	iDhzHoAsc6HJpdti+co9V8aDh7d9euuvRUuDqwOn+0W+4JG6aILw2PrhFVZLWS5dczXbXb2gNqS
	0DfpF7eCWnAqv+M8AEIoBoB9EuwvKbQBEMSZ/UBH5ycDWbeNbaf8xnKNXAHYUUyE2Z9L/VrEg6r
	VR3FrU1XYTIwD1NB0c+DjNPYKBEf0ZTYrTg==
X-Received: by 2002:a05:620a:444b:b0:893:b99:711a with SMTP id af79cd13be357-8b33d1ee4ffmr2610288785a.19.1764178819420;
        Wed, 26 Nov 2025 09:40:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECdUlT1+ot87WedYm/WP1Oj+nm2wC2UhUR9096vkFJB9K/7pV51iXl7gTIFt6VQQYJU9OozA==
X-Received: by 2002:a05:620a:444b:b0:893:b99:711a with SMTP id af79cd13be357-8b33d1ee4ffmr2610284885a.19.1764178818974;
        Wed, 26 Nov 2025 09:40:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] regulator: Use container_of_const() when all types
 are const
Date: Wed, 26 Nov 2025 18:40:04 +0100
Message-Id: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQ7J2kC/42NQQqDMBBFryKz7kiSxipd9R7FRRpHHdDEJiot4
 t0bPUE3H97n8/4GkQJThHu2QaCVI3uXQF0ysL1xHSE3iUEJVUipbmi9mw07CujbA+KMgbplMLM
 PqAQpLawuXmUFSTEFavlz6p914p5jmn3Pt1Ue7Z/iVaJAIrLXspJaN/rhY8zfixmsH8c8BdT7v
 v8AIRuGjM8AAAA=
X-Change-ID: 20251126-container-of-const-regulator-20e240c45b78
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6DKEtQtDLJJQwsMG0FyYufP9LkF0morViykioS/EE5Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt5v1j1dKWdNgdHT55iyox07jOOS68HcIRhW
 7B/0lBsblKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7eQAKCRDBN2bmhouD
 1403EACKq2Mwl6E/+tWaSR1Waj9G0BRQNG4tZPiXH/xW6V37CI1hItFhBPgS7JOLlfQmKvNDSUn
 x0VFPLuxHCOXT6zsXy1yWd90EJLYT3GfxImE6mZaGyA7xMffKOTKZbTC/iuTKi08K3ztT35DNhv
 yTFhTjIcH6AWic/wIdtRog1On9Qd4Ln6yfX3oihlfAWnGEC3ouPzRpvislZcOdYjhSGoUq741P1
 DiBKFy6YUnMOygJMNwap2+HmmruhVcG2ynjEDZWmD2Wpe8K/Agnlg43CoODuNOGHWvPnjGqc/eo
 upZ0zyNJNMsqm8hZOxILpixlyobCv8Khnr1iAkhrKYDb8u/TITwziN6xXyjBPrl0J+BaP95A0+K
 2yILPHP9kpTtWfCBtMzdTfBl+KaEry7J4qpSjcSgNv5aIdMLIysmaW9K2MuAuORO9GiJ+bNFevB
 6uwLDk5r+UCjO3b3PrOI4oGRO2a+X8Qxh1uWpo+wLGb7F2cAOLbYR12ehVxU6n9Ioc+mKhs3Zl6
 hrw7fg0MrZCK/ZcONldLLZ6gHY89IDvX73l6eDE0ewVF2c9vrh4SLO0x5L527g495hJA2/xHjx5
 1oWAVRQ+p3nUk1+K95Xw/roitwp+3lXc4cGNxsvbctMotMw+aS19zk6tgP9ylMpuJL0q4beABGI
 DRgd8q7pP2VLBVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: iPL7bYZDVj3FAqpI_hLzPCKV2cSQuv39
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69273b84 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=_fikr7E7o0wGUBXK8CcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: iPL7bYZDVj3FAqpI_hLzPCKV2cSQuv39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX3fmCpjP9FCjp
 /zGKvkj5rCzInV59RfE7wHahXa6GRQ3o1p7P3nTSe8pZxARf+HWGEl6GIW4RSAlg6jyk2gy4zL4
 qw/Ru4jrZPkZ5RD2OVTqp+kdtiUaQ4ucMzYB6j6OsczAnVXt7AzAxUyJfcPehFEVkXBgL5SvnLe
 JXV+gpf2oDc/l1t9cF6hB2w7CYWDC1wQ8GLjZpPHSvlSz6tkY69rMXAxFXrBotFJy4bwK0ls+Yy
 XhzQdOFyEOsmwCh4hfVkMp/NgVtgVlP0BQAO609bwwPd1TmDu3F7dPZ8G/Q119yvrvWSXvxO1BE
 jvfxol0JgVex/w0WyfEzpUid1v04/DwfOHuswDOuzHPKToZULYcatJO0VicWYhJ4EREkBBqJ8Qx
 xLfBc8C5/eSOIA6RZ8KzFQrhf0qVdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094021_000427_1F489F86 
X-CRM114-Status: GOOD (  14.36  )
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
- Rebase on regulator/for-next, which does not have pf1550-regulator.c
  so drop this part.
- Link to v1: https://patch.msgid.link/20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com

Use container_of_const(), which is preferred over container_of(), when
the argument 'ptr' and returned pointer are already const, for better
code safety and readability.

Some drivers already have const everywhere, so container_of_const can be
directly used. In few other drivers, the final pointer can be constified
that way.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      regulator: Use container_of_const() when all types are const
      regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct
      regulator: mt6358: Constify pointers to 'regulator_desc' wrap struct
      regulator: pca9450: Constify pointers to 'regulator_desc' wrap struct
      regulator: pf9453: Constify pointers to 'regulator_desc' wrap struct

 drivers/regulator/bd71815-regulator.c    |  8 ++++----
 drivers/regulator/bd71828-regulator.c    |  4 ++--
 drivers/regulator/bd718x7-regulator.c    |  4 ++--
 drivers/regulator/bd96801-regulator.c    | 10 +++++-----
 drivers/regulator/hi6421-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421v530-regulator.c |  4 ++--
 drivers/regulator/hi6421v600-regulator.c |  6 +++---
 drivers/regulator/max77650-regulator.c   |  6 +++---
 drivers/regulator/mt6315-regulator.c     |  6 +++---
 drivers/regulator/mt6358-regulator.c     |  2 +-
 drivers/regulator/pca9450-regulator.c    |  8 ++++----
 drivers/regulator/pf9453-regulator.c     |  4 +++-
 12 files changed, 37 insertions(+), 35 deletions(-)
---
base-commit: 35ed371beec9dbd889bf2ff2afd6cb549aa32805
change-id: 20251126-container-of-const-regulator-20e240c45b78

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


