Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63ABE75452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=; b=gUE1b4ifZlOHHg5l94//ylXj23
	GM9egOP/WHTZzKd4xKNoJI0K3ZY1zv1xJo5D3iZvHX7uoFMtmXtriV2+QJSG9g/BufVF4YnjtNRd8
	t2zqYP3BBPgFqnrD/sR03D7uU76SnBWVh8PMedfnuGxxbw9SrJ86QMhCxMHtrfBM1dRLjtf66EUI/
	aRY51g1mdTQpTsWTx3EfxDvKULSaBRIjkXjcndmTFFwTMs7pYOfig1BNnXI9X5m96Pxmrq/R0lAOW
	CW+seOjedIUl983faO77o070wa1Fpl+5EfpKRWPaH+qx8lt556PwCgTwrp15dm+TfubeouJxjmKVP
	/eOHHn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOER-0000000GnwM-10Gq;
	Wed, 24 Dec 2025 12:44:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOEO-0000000Gnt9-0DNy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:44:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOA4a3m700694
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KNilgW2hQVL
	A4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=; b=OYv/QbS9aElI5G5BGNnWjL6XO02
	WgVgefJa+aL3ab57iZqGYNa3drsUElqFpIzmnFd8kVZHqgJQZbsP8tFFCPHP1X0e
	xPLgoLq7gr93/JC7zzSQmeEK8RL8Ojw4do9qDtvsRhjnRa4fgNsZRg1CnxEWsGDs
	g1yOJJhJBVNG1a4NKOsul4cxqODezrmnKnk7D5AVtor0aQ9S9fvJv//VPn/hvhNi
	p2dGmPx51k37IrtpaAr+w6b4p12ieo6pihlO1I58l27jrTkuScbpyGuTeM4mpPJ/
	FyMwcoelU2AA8SGCP1GShqSOL/KWgA9yT7vYMRfG1ILIAPWgx6h/VNVV+nA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7juqhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74e6c468so83492201cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580282; x=1767185082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=;
        b=PUAMTtBtszQSVJnsmFId1ilwHBkJ62VhdbYq3GDI59ExIj2qLxSVUBXjx/2fY1zfuf
         2XVX1tOG1bSS4n0AJI+d0pqIm0o5xGipPiSO5mthwdvec4FiCUGtm03r7k35d1wx4x1q
         1PD1XCqFjzDhqrO2du9lni9gtg7KmgBZQpt3gwz0RYQnlYzt1EU4MY+OJErM9S3JVK8E
         dzBWOx13+Fkkl+0e4ZxGqw/uRi8oD+B2Fa8OKwZSt1IWSJsvbfa/IQjxc2+EAWrenE2v
         Dne4Kt2X24hdUNTCBt9w327le6fXAU79qzBFghRf6wcBrC6pRt20I92RnGktGWFaZs8n
         5Cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580282; x=1767185082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=;
        b=GBbSKtimkflfWeSDFKHmApZELFez4mjUyzmAo+ecdBTmHrFigfJBJPvdHlnWjoE5GY
         pK6wc2uUtAiqZAgM1NF4sbxHCtuznp5iUnLYPj9NUdXGRjFMb84WbOEdfxEIaIYdnsnL
         eDH1UziUAjXVNcGT+jJNwaWuBgqBHl68qSBJTkLi0BkPqZWvFY6Loemn0uKo6Pu5YE2N
         aCDl/xPI5XMgUi16BwHWfnn+LU4C/1US4mk+4qvQiTQRtRrd0vZJFin/zSJ1CTra5Xc8
         7i6Iaf6V0Z75rHbON/kxe7Fy1163+7jtx4L7DBW5gUZuEQgQmumYAnI6r1yS/lXKL0As
         kMog==
X-Forwarded-Encrypted: i=1; AJvYcCX7lxRp+jm+dxXVyapDGhwrAfsKo1kcKZQHjINKhXR4AN3TSTJOoXjxh29SU/iTCUJCSTejNeY4WtaxubCrEFu9@lists.infradead.org
X-Gm-Message-State: AOJu0YyEixU1hJkgZ3T+IoLgZHUCCpAjHEnfgrcjTlk9PuKpYEbQVTJ2
	R+1gftU33YRNtUH6Velp15ZWSWjCCEZ0UhL9azm1zk6B5tWhivAeE84vseoEP33UMzQPyS1doB9
	ZaXPo2+1kKptu8XCNzd5wmTGxTl7DBM1BmKfnayjkOZQwyxDpTguxxa3Y9c6+Pg5QiJyPzgu0sO
	cRDA==
X-Gm-Gg: AY/fxX7kbUvPvkTYNkzgA3htLtXAp8HjfXjU89X9KO1HzB+PnlwZLcGDBULMXqCjEYq
	3BxTd4GptzHJ8NoKxODibRwjCzCfPQlyW4EJ673HBzTG233Dpa9vWNMdW16CT6qjiwj7c+Rxlwm
	goQQEuI1GExhx3VKSfuuDdqusdoQfV//59vCyGXDiTSn/nK2HzjjHFProjCuIqH24mAPv7ke95k
	w8SAryZSXiFosoFtTArnyb/nPolxeyXnuEMe6yNAijEBabQJwTDc5QCKh0LTGQKuPSzSXkvC7aH
	Wnp3Dvbykwjl+TARUsFKfakdZXds6n9pWv/7aoBYn93S1coJ24OZHkH45O+vgZMLdw+uip2inbt
	zQiqW+as+b+AUYBVwSC/+1jOJJsd0XUsIhTTMJKD9WBJNIkGq9t7vJLRxvjNv8s2P6xFEIA==
X-Received: by 2002:a05:622a:2488:b0:4f1:ccfa:377c with SMTP id d75a77b69052e-4f4abd61335mr226687341cf.45.1766580282423;
        Wed, 24 Dec 2025 04:44:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjvpN7s+TXKm4SLsrLkne4UHksiC+p6orY9KBQYhq92eh57vEMHcnwzJgX6up3Vu2ofSSjDQ==
X-Received: by 2002:a05:622a:2488:b0:4f1:ccfa:377c with SMTP id d75a77b69052e-4f4abd61335mr226687071cf.45.1766580282043;
        Wed, 24 Dec 2025 04:44:42 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/4] mmc: cavium-octeon: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:33 +0100
Message-ID: <20251224124431.208434-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FSxaYZxRQw8NtKxY6K+zMOwodj+OLUAUfn5MDuEJjsw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AwQ5nt6vw2D5baL22d3lRE3rCSSx3sNXoft
 Vv4+URvpJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMAAKCRDBN2bmhouD
 17PtD/9fPRxk2QKcs6uPuvMXpzzcrsQbQfN62ZHe0qNSRHZVjUZYRSclOZTFYSAbcTufyVWU6XQ
 +BeXZ/vHxvBypyatbdEQ/LlDjI3iPFTROp1xfZXNwjSVhfKs2YgngMDhBjdYLnj+PO1gfBKveQ/
 WwFiSASnRWqMBH/MQ5yzsuoZS5/HBB0S5yeY3HNKZAASCVsXKPmGsyQlDKc+aobVqSXIIit1Cnq
 phLUeHtgWO8BxwNRAPJCvAIeevCY2cUwoeaZC0sgO6BvTtHF3XAAVthEob/V7TANCFkQpFkIa9k
 ugZ7raeZuoEN251R028d1ihz5HO6XpvwTDDqgi7urpjhDixnoPAVWDrKpOcENAJg2jl4xIKfxFj
 6iepzuyHXalf/4fbXWTmTmQUjW1G0ohdRcb+AMvl60nnz7If3RHoNIxEM43ZJLlAK5BT/NMpEcw
 +AT7kZGOsqZ0y85GzBe5wzqqcrrsDxtBdCHnqh4v84nD0/D+pm/T4HKjfymo+Ld5Vs5Rb3kKEAB
 GUuyNEvbawqC/3EtNgnNYrHAEEqJ9BQyeDrJcIkrco854b3FknW5scT3l1XW2hQa8nLSTjrl/Zy
 Y5reUj7YPS6HmfNfkhtjmZQ6CAXdK58bZ0BcUGWK+XIFbmovY+QRNWftxWEVKJMWqhELo95L0rv +AeqG72kM21k/yQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXz1HLSMbmxDK4
 IP1TZDR49TxIDp10y2bzqNagVEhgdiqbCr18F0fCuXSEvpZ7MaoSvzRC9R7h86QNVNV1W359oCv
 clKlkEna/rP4ZD7YLPQ4NZGnA3Ymxz23P9+1ssECIsUUGKB+Bu0mt5HmCyqqh+MSWFUaIRf1Dfu
 ydJ9HkV88yNVrWG7iTPZb64kJkxLEp/oWN4cIyK4q+RTzwYbz8/H6gQspQ8XdRw3GMtbcyQGXEi
 S1N/3IpEuEUOH4LBUyTjUYtAtuGPY8k/A+7CT1KRFPP8fcu4QDfmeGJGhHD4J2aOTzHrNVZmTQs
 msGndcKrYAvjjA4gHAjWiFYuQogwhZuaOhu6djypbQ/+a0pVcWk1DLfYx2IwJ/4dsTjVU1Irhnn
 bldj6vJ7W8Cu43yFwIrrT0uYDwQwH+RYla/JnyQMex4CNXH8/xkcqzNNf3GbKbzG6NHQ0bzs7uh
 I9i2HhvATC0KHDgPssQ==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694be03b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: JX3blpM3TSp9zT_J1ZZzPKbtR0kLZjzm
X-Proofpoint-ORIG-GUID: JX3blpM3TSp9zT_J1ZZzPKbtR0kLZjzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044444_243738_EBB7E6A9 
X-CRM114-Status: GOOD (  15.76  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/cavium-octeon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index 0592f356b1e5..8a0daddd9200 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -148,7 +148,7 @@ static void octeon_mmc_dmar_fixup_done(struct cvm_mmc_host *host)
 
 static int octeon_mmc_probe(struct platform_device *pdev)
 {
-	struct device_node *cn, *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.of_node;
 	struct cvm_mmc_host *host;
 	void __iomem *base;
 	int mmc_irq[9];
@@ -268,7 +268,7 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	i = 0;
-	for_each_child_of_node(node, cn) {
+	for_each_child_of_node_scoped(node, cn) {
 		host->slot_pdev[i] =
 			of_platform_device_create(cn, NULL, &pdev->dev);
 		if (!host->slot_pdev[i]) {
@@ -279,7 +279,6 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev, "Error populating slots\n");
 			octeon_mmc_set_shared_power(host, 0);
-			of_node_put(cn);
 			goto error;
 		}
 		i++;
-- 
2.51.0


