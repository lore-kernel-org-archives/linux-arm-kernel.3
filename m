Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC262CCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=; b=bXSRahUCudJgH3yqgIZesnTdR7
	os2umfoXyC9qtCwe3v/RzMI53gE9WjYvXVJR14rUiV4cOq7w4KrBsD68EQE2gZQve9UCElWqZiS+6
	hsBAzi2fxsRo7vT+z5u6TRH89vhzJwu6GNBU6y5BQDXovhTr2CBkMYQuJlAncctZhngNbuZ0wqWYD
	g0ahXc02E8VPylpt3CXNF2ZVNzL9o1jBjj5LNU92t+3yk6ulS36W//pabJfntLpRGG6OYCYFscDve
	1IX49//7G/5VMEwPajGKfizkwy0iSkRv38gfPZQa2IvYsBcsJc4CQaheWs0S+6y5UDB526wOR+o4B
	exnmt++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgi-00000001mvW-1tIG;
	Mon, 19 Jan 2026 10:40:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmge-00000001mrt-18SX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9kIVv774034
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=; b=OBEHAtrAlu8HDwbs
	RkoTd5c3ZdYVwQQf28rXKoUCGjoutZoyT5rSP5WNXNaIxk115uqtEcji2V9fT7D4
	rBbcQ121Fkpg44TcweaCVCJzPC6t1e/MFAe31hRY8tWAhM8qj/bpY6KRaVw+x2za
	GgJnbqbGSqfJOcOv5WWzSFVonvqlSBqu/nFUb3T/H68rhbsmYdhVlH2hiWhw4hzC
	h09m2f5LmaXuKfjIgCh6xicgSlxg6MbzJ9ZRpgXiX4KpJqBOvuigtUJpqKwm92kG
	UEeWM2N6oNGeQ7nX1dcmowJqXxAQF27TbAwZBdSdqSANxpuxhN8IYqhmcHV2m1fQ
	MiCLvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a85wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c530da0691so929301785a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819243; x=1769424043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=V4phZHhBx7COhBBCvlhsID3LA2vT8QRFiG8kwk178rPFytilLzZdzFxpXCXxboRRUq
         QPo5zuzyr8BOVUpeA/enMmGzvdei8xPNvzzJDxzom9y/1ezpqKvLsrcwNHrfGuocdQvO
         e6nQjLHgkx9o8Lzfu0CRNKghem/DhrrTDfTnDYUwfMK+i368QMqvZ7KjrOWHIgqE0x4I
         mn7LtRxjIZmT3k2L6m7fel4+gx8WL9JYvnoXmgdsJmRRkO51/TrMkTNSIdA+ZVhwWIhR
         WQmNlzT51yVrT4gVxtqvLp6h9BHc1vlBYk7j9Lg24E2b7aB9zOJaI7tDFMVpuRY2cjJv
         FHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819243; x=1769424043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=J+3o70pbWByQ+k7EMCpHEX7vAY2gRQURqnfbCGqRCimzoXM6ksFa0uCJU1iK95q6nY
         64uGQOHWJ/MmJUlvUkEE/xj+eeQayLYDw3H4HkGciNq1P0AIwM0VD2ih6ouvZpxCmErP
         Ena+LHElZuZUYy0plhPFqr84qHEHyENFhqs94sdFf4r5TOJuFOsYC3k4BHYmQyQCF2eH
         Mdr1/2Gtwi23Z3ygAFwGjeYF9OBIbv43jt3o83VpbnJpxY34aIgekhVRWW70cMsqio/X
         4rBPUJ5V8dCDgTeyBSbpEucuVpI/kCjRlV5iNMp5+tJXYNFq3UWc8DtTNZjyOe4F8Zkt
         xUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtlx2n0ZVF7qt5uCyMJA2lNeJCEpqDJ1a+75xgIV+SylA+9RE2wnNXMptKrj9VveEQ57mZJ39pxSsuJZL7HrkP@lists.infradead.org
X-Gm-Message-State: AOJu0YyKJ3D13j9fqyiu/qmwWujLG/0D2FDZ1fShTzeBmLX2DXocNUhd
	STfyAVbftYk1/mYLeRxRuFRwUuKOqFr5PNaG1QMdfUpQIH+Im6qBQYdhYozvJOc/Cla9KfMCUjW
	sQ2brBHaRIesiM5/pZHScC/CEW7dnss6TVJ6qrAYlaulcznN1CAIodrQWwVGscE1EveSq2bSsyW
	my5w==
X-Gm-Gg: AY/fxX7T/Ru/EukfpZwFrTqrMpAM56hL+fYyAuYov679l8DhXOfJ78opdG6TPi3GZbG
	LD1pGnYn7DdkcVLMjOpAPjyW5P2yU/RSvslRwKrw3pPn8rimy9a4iTBpJ7+fIavKeaS3+8FizKr
	3VbsNmQlK2/zpvqx6kelqe72AA/Ts9Ldl6XG7sI388OMRym3CG42Un3KZtDm4cQjQxvFTFXeWfT
	X/screiEzIY8AZcQlBxsIS/Hm6RtZlmjO2NAsScqpcWKalJsbQbU3lVtmh0n4aqrKSmtQyxeaW8
	HJ0UwBzMRHmLaIyE4AbXWBzdwcL7HL+R6JcyvERhIHaN/GwIZci0B2nlCKQovEJX6eeCUzhaGwE
	16FlKetIJj74Fxahp674o8tgzj0UjSb/Py7y5TwCZ
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427583385a.84.1768819242829;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427579785a.84.1768819242411;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:18 +0100
Subject: [PATCH 7/8] soc: renesas: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8VSQLtaVd4SNUXyj3qVXPL+a8sCEU/CZusptF8ZaPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgobvncIAUeq9gHK6FXvIHO2lk7wpWwVIIRh/
 iA36+9fERmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGwAKCRAFnS7L/zaE
 w1hQD/9acgWHH3rnfakx6eDD26dTI6G9En6q2VSGmlbnwsl9tJ4nMDO2VLCusT5nxXCXG2YZ0+e
 2t7D68GFRWmhge+8Yo4En2R4ksA3WOpsvKOp8tGMji/3KiTjejFLsyF8yQaK21jsa2opCwRuwpy
 OrGdc+tFSsiIs2dFImSIcB3jwA2vGfOxY5RPVMDYtZJKmo3AU+FDDAQEEytNfoRhJ6gKDbMmWLy
 QMx2FZ4YK5TYSINwoxtiVMJScQQ5iqIYPWOo5QHZquIEdmXfClYw4BX7pB8uHTnpAT16yN3GPNY
 ryBK2rrRF9eTdtkmf+M4tRv4OoOL5EmJavIowcGDyHqHwE5FlCADIpYUSeaSwTnuxfW6X1LZr0+
 kDhGDEn5H+UaCrjAqMdrFE1RZ6scfc7WAwBw6LEbaA9Hg8EAkBqrvmJD6304Y78t4bYiF4WLTHM
 33vbth+dCB4S9vw/vX+/qelRibAzmjKOoAzJe4wuTUlmJ/Hq5opVf3rk/gtneFlw/l4bj2QkGax
 u0vlJhYKqneqCMl6QCd90ysN/QI4xNDatW5h3YoMEj+TU/eMdp2a1RJ4cTzEKUSvIkQtXNLFR6S
 gUtj6o/etpKnVJYXyD0IGul+1SDf9TfejO5yWonCratG4+iSt5OrlbTWx0DJ9IlvpgdzWNRuP5+
 tS0OA2oyaV47JIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7oDnWGTeGiTBnFT9y8_DQetvUMHg1sgw
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e0a2b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX8jpFVAVcfv8X
 zpQ/9T1IZ8nz5uakwkh2Bh55bkJDO+sUatqCYprcENhWEN+j5i+jc+PM+Jw8Dod9tIKgXIpTgON
 JHvOWju5YRIyrMR264yGq7RC/oEeS+8Wg+t30+e2P4R8GZmu0gfOZnPWbv4NjRRvICr3iHQ6aLL
 Kcc0FMxNiDY/9hbxkvMwYyae4khN0M3RuS0mahSc1ZPs/m1kVeefId1Kvpmx/wyMzSwQ8UDmRtD
 jfzQG4P0UeudPB621wSzxjod37jjg8LGLQUUKnEDh0NZ15533ivvuTU2GCAnh7XW8v3xgtR2DUb
 RyeVIfXuWPHBug4vupykSo1Uv+bfwgNvWdlJgi39zC9SMIG32gJoBD3vaG8DdB4umHkwSQocC7Q
 eOmbICqfuqSo/1LQwUIqkI4GO1/ZVsF+sNHeVp/T7YIIiD/9EOB/TmkN5cR3pI3I9aTmABafO3C
 eEju/y+4k/l5ngqUIaA==
X-Proofpoint-GUID: 7oDnWGTeGiTBnFT9y8_DQetvUMHg1sgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024044_323094_BD8F0CE2 
X-CRM114-Status: GOOD (  16.46  )
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

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index ee4f17bb4db45db7b96c782b770e5bb4eb139e09..7c54b39b9cdc6b070a7cb6c1c03cc1356bbf0309 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3


