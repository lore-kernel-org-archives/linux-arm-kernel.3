Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9E1C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q4wrn6viJ00nxDXtCMsWNJV3W7jPHdI5I+YOB3g6u+w=; b=xtmDndS1zoU7v7
	qzQedgQqzzDRMrzUGSZVD9vX9pXLg35xBfIvhlQ7BoQgE/s9q9AaLBhTm8THOfJ5vFGGqpSS2u0sH
	IA8MlVjazNSHbq5bPUtkb2boMJ60Af5h/kc6x1Nu77hAo9ABdIYE99E2YPY1IcdOhnWSE1aKPy/w1
	ej3uNieYsFRwh/hdWJY2GYIaC4wMvi94MhgTTM7rmRXnA/MiAEa/oPgJ8RPyD4e0I/RU8hzF78UfN
	CFspm1Qf+FCVFt9N1bVrex4NGFJFUQv6JwamX+HPinf/mVwCxmcrGlBt7y/P/Bh6gNKXqAL57y3Ht
	ub+hAH7P0b53h/uihJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SBZ-00000005xu8-244I;
	Mon, 07 Sep 2026 05:46:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SBX-00000005xt9-32ce
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:46:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kp1R3712064
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 05:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q4wrn6viJ00nxDXtCMsWNJ
	V3W7jPHdI5I+YOB3g6u+w=; b=R08Hm582mcpT7ADjSwmfC9cZCZE8HA8lxJh/2X
	mE3hgAndL+JoLUcma2ad7UnxnuTKjBOy9LQf18pUrz6Hj7tZ8jJ6r7LWF14eGO8s
	Ps4+xBAtD6Nv9DbKStm1+kFUsldnrh8q1JmyPJw52O9v0xiDAJbh9RNJUryEn8za
	w1sr/t3if1JDw5Pl2beHTTQvCSjr8pdcGTnT86waTxuG37MUe2ECbKtGCS2bc4qt
	wo4wN9ETuJh6a9lc+jUHfCPJz/hqF2jMm09kYxtW/+uKZyFqYUGgqJYPDCXzOEiB
	KiUFcPlnIiRLCNPLmvAqW5jnp0FekHmR7OZwaOCw++sid+cQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjh03d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:46:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1415285a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759986; x=1789364786; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4wrn6viJ00nxDXtCMsWNJV3W7jPHdI5I+YOB3g6u+w=;
        b=eDaC4tdu5Pjo9DTuqozFkClGIWgV7T6IeVsVC2onwf+pFZw8Osy1Fza5meMnKyEOz1
         h2kgZpdS9rDRN4MTzE7KrkHIWnI8nhgDFGLu9bIM9dGAnLI0kQr5itg37kwdXiJdqHjn
         Sd3yvgv40ef3e3dmx3WYf1BsdPjbvY4eAA2nYfwiOS1f4Y5CtFh3MGB1ztoGHv9wsUH6
         JDYooxT/+l3kdmBR9Ff9g/gG4zzhdu7TXRZuupOWUsPnxuT+hzkLX5iUIThD6F2innBv
         JoPcfJ5RhNubKoW1BrxZ0PEUejtE7wOQHBkdwiLKm8aBF9goI6EZA4HZqf06rt09FPlm
         XAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759986; x=1789364786;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4wrn6viJ00nxDXtCMsWNJV3W7jPHdI5I+YOB3g6u+w=;
        b=ryxqkrkhpelYn7AyIZ2DcZXI7/N/bvwulsU843PUbVDIUpEonvIJfdH/ftkqkaaYxC
         pTPlLTm6VLLGJjtB2tVuTeDGhHAPw4HmgfWBhvtV/ClaKkjrQ7kdbM7RyJap+oVNrOxI
         9s0SKRwpDGq7lapgMntt9tTEau5Z5H7jHs4kTnRRbG652RYY9U4yJb06FTYpENw4aky+
         4mzILRScSYqPk8Cn7v2siroDb4D/lvQx2bS4DKH3xNPSnjN91wFwQ/kDX8972YkTYhZa
         mjk4wYSJRi69UjyOZ+iB+yTwOqNNPTJEnyNY5BPD7mFXXOwmcyFbKBUzf7BPzzwfiiIc
         F76w==
X-Forwarded-Encrypted: i=1; AKwUvByvClvsJyPDgJ/Cf+VXVH3Js7EHBNh6PoqSQjpfX5FhyshwF+mhe6uSIQApNxg8dOFF4bEMNP8kPYzr+q8tCrGG@lists.infradead.org
X-Gm-Message-State: AFuF++kwrbas3ZULufNDd2bDxJRo95ePE8uAtiTb5GOQuC7f1+NgNxlH
	dxrfBcBqA059++UaDMuHRzAHrbjoKP0vAf4HRBV8aDDbt/4aGLOqAO9jh4Mux4UngvpCUCaF1+3
	lgHNsHO0rdiSV51M+lCdXNYJQ8Y8ntD6PsPDUcgHhCtNmCp58WcaCjo1yb4SVzoqYaIxKy3G77f
	oswg==
X-Gm-Gg: AYBFou0y44PF+W7WjxeQ8/dlW1aHxNR+q0W2NsFBvGH/lPtE+O/8wUiQc+quAsN0mLJ
	BbQhSnGf4q82gYBABDgvAw43hPupIQp0d/aql8FDeNsmB8ZH9HJs6yao2QFhhnTtDY3UGduvMbW
	ydDz8bYIy862uP1t34ZMGnbxqGFjHpC4QBvYCtpd6WnxNdtnEtZ2Bv4sMxldGeaC3UWI0fQ5pmJ
	MK0ZoncU4naSgoWy3allCuC8oIzLrcrjDjMUNn9Y9xmtM14gGf21bTzx90Znc4lx5ljdIyhjH8u
	m6ON9DFwOqKD5Ag2tV3KZWrhElvEvESXSJZw7BOPhfqDL2vJd1XVgQ9XLra2wzyQZ7BEsGaOtzj
	GtUd2rlMiVzLAjhmeraUhoLAkMWfj2jp3VWGG
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr33982043a91.24.1788759985739;
        Sun, 06 Sep 2026 22:46:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr33981993a91.24.1788759985322;
        Sun, 06 Sep 2026 22:46:25 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:24 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] regulator: rpi-panel-v2: Add required vcc-supply
Date: Mon, 07 Sep 2026 11:16:06 +0530
Message-Id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5PnmoC/yXM0QpAMBTG8VfRubZa0xivIsnm4LhAZ0hp7264/
 NX/+27wyIQequQGxpM8rUuEShNwU7eMKKiPBiVVLktZCN6oZRyFcbkx2mYatYVYb4wDXd9T3fz
 2h53R7e8cQngAE9FdLGsAAAA=
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1700;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=SfJosVhKNJCy6SmyYSbzyePHCfGk8HW6DTp3hKzhqrY=;
 b=aM4ZeAqC/OnBVtphNYrAhbU8cdn1h2Mi1mDpLrR5goJTp5yDeRgftyN1MbzAm2KFcdh1fSFon
 EW+GkhWJDvtD+bo5cMDevFlEhTzyCSYtNlUpwqgphtRM0dOghqEKZmg
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX96WZV5ofcOJw
 cOLrLuYw7+PrKtfc9T5c3qX8YR/k8781Fk3ySd+Vnc/muApODl+QOK0RzLTYNCbZYd++sy1dpue
 /rq/kC+Drl8U/cVxnd+hJt3UeV7jWIQ=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e4fb2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=jWvc-858a9c_bLaJeVMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: REq27A6g_r4lCbo4ntgts7Wg6vOMM0Wb
X-Proofpoint-ORIG-GUID: REq27A6g_r4lCbo4ntgts7Wg6vOMM0Wb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX1fISK4z8dati
 b3KRAoDYbaziOf1zQNAh0EcNGvRin68DroNhWwaymxU8YLAyO/TaqFl1AxbADS84l7rRKXevQaa
 1v0vBIgLpz0R/gawRhBttsrQW8n5X9MINs2i1ObdTVLpodaDdSRoY34yx3vWXAcFJfSCk3Cu/im
 A5AeFw3SFTEq94xFWvu3ELtdcGhA0PT6ibK9fbi9liGS+6KncvKEn7fZLt4y8Jk9HXpmfEsGoAm
 jNpvca5kSiqvw9NSHRnBzmI6DRwInQFfYnYO31cWwpl15cewcnmbqEGahiKpEi+ROwVkG7LiY1i
 +WSkXjt2lCJmdbEpojl9zopTYVDsRQdBnPVaCiLyt/lFSSR4KmWwh6yDHBGYNQn7wg3OswpkSDt
 GhcehzLDgxvo2Jw1vVVEywq6p974tViex6+Eq7JTSUbCznWvNQFXscZok+lDzNUXVeRiGlvyd17
 MiatiXjfkyQccaTqL9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224627_777364_7DAB5093 
X-CRM114-Status: GOOD (  14.59  )
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

This series adds a required vcc-supply property to both the dt-binding
and the driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property and
    marks it required in the schema.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add required vcc-supply property
      regulator: rpi-panel-v2: Add required vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  5 +++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: bd2a0c2d8c49ffb7acfcb0c1177af355ea417caf
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>


