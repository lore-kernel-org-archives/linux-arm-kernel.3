Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7816CC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeq1FQZMP/z+KoXn/UwCyrFH24Dchmhq/uExQ74p/as=; b=ltdy2ukqloFrpDuuVfnmJJO8Xj
	RvuwxB3skPhAuzgRUcMVbKkFQVnbt0SunWzKcsWJdEvD3yNJZjlOLgT9ltOcdAUJjOOnM/ZO0u8X+
	IRffeMY/Uz1mkHI0yu3G77b/5pNxi55QYgS4haJo2EcoEBwkxJS1y6hiHAA1Y5OB6dSZ7DQ/e5hkm
	Kl9VOgvrxpk+XF5FhLP/b5qehStRqoY6El/Nfk/7OnxUW/IMmNOwRkbUIY6FHZPYslINCJybyCh30
	W6bm2pr0813ioWzER3eYgohGLw1Bi/4OZMiQaKTxzxolB7Y6eB4RKuXtFO3xsSRuyYq1k6e2tDCgs
	Sa2KcW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Ot-00000001CzO-0AXR;
	Tue, 04 Aug 2026 07:17:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oq-00000001CrE-0a4F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:17:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417nI62283882
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 07:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeq1FQZMP/z+KoXn/UwCyrFH24Dchmhq/uExQ74p/as=; b=b0j5J/bZZv12TD7S
	Fw8b4ovxRgHdkLZMufTZV+bK9ZhRd42bbSEIQPn9E085TreOJBeq2kzaTNsxPMC2
	Km0PBi10KW7cPwxp9pWUBM+CI3heGyzjI+W807WFGPpuXTUkN7sXvireXgbG8Mlh
	ylOFV0Y7FGpcgBdtGNS6uT9NGySWB3Hds1gZ1ENXX5f1vs2EGTPMUlDeDeRc3sZ+
	0mSGZVlo+093B+lETQv1j+jx8sm4l0C3kUYDsch0Aku6b5J4qPRAWxJkLvOO9VCo
	Rck6mLtGIOPOjkPBoXqaF5hGSSD/RI27rvPmMbRGK0ledu0zhgO1jYGqECjLF3mX
	f1/u3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqsd4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:17:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso48646206d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827838; x=1786432638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeq1FQZMP/z+KoXn/UwCyrFH24Dchmhq/uExQ74p/as=;
        b=XK3BnwhvOXoCfKPCP1x9mbI/CsIr5mOh/eBhWNcUnPotyKk2ylmNtBHV5Nebt/8Ldx
         N0Z0U4Oe+430I7tgd+tmeuKsmNncmUJawPKx/vBUlJDTyAKxnyvX4cfGcZyhCDQnebRJ
         QohJpszAX1WWdgqR5azITR8HWLbVnEqTgEOEfdR8mov7HH7d59jYw8D5SlHBvTeeE9w+
         YcodMZs2l+5E7fS2vfI4ZsS0zPsLFPBJP3CDf1PjsDMoFVmzkzphGzfMTW/RvPcVH6eV
         7/KiwFkLmQXAEQOA+ake8nBhhLk64is1SAwgr9wtHT/3NIlxPIpwx+JQJcO/c41Kujt4
         JcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827838; x=1786432638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeq1FQZMP/z+KoXn/UwCyrFH24Dchmhq/uExQ74p/as=;
        b=qVdT+1nc0kLGD1XubRqlnTdkTeawnO/YNI70JHwdxBXE4A7ftEUJIGMaXvW5qxuJMm
         ZulIK2I3zhTqPeLxwaOigErQMczp9kmuJtAU1odvLgWQuOSRnZ1TuoM8PM49hCTcdbm3
         vi9hPVhGviQrg3ahCCwKGMc6zS432SGbVLsVV/sFCnjSFhX1338LlXf/snke3XRXdVPs
         LMdrdYI6aNBzernidydLFHZHV3H0pY7e9oWWWK+Q/jJPPznhAkDxxV8LX1aKSgWqAhwk
         AfZa5fBno43cAi3tinnq++7yMutS9fdbU62MNBVpBQa6WgDbwsE/alIuEYSnTvnmyOUK
         icqA==
X-Forwarded-Encrypted: i=1; AHgh+RqL75gX6b8cGOSWFxgZEVz+H1nRrUNrG9z9xoQWbRcCl1PzcZI8xuOi8+HDqQXvGyk88SRZNtelg/tqkwstfkd+@lists.infradead.org
X-Gm-Message-State: AOJu0YzCsj5sQHGkssfmOwsBd3oVaxAykYJyxaqTjzpTc365Ese53oML
	WSYpXqCxPu2xwDxvLjMKy+5k3lLgkqogEPTrsb1KOSzt58EXa+tHWhEHZgkhqWCi3QQv6RACSmg
	vXQG+jM3I/q9gMQGtH2kjOAA3zxprfpTUVATVLcElscIuQf/hS5sNAwEqaw2tZ6kr3cOLPeS6wY
	sOgQ==
X-Gm-Gg: AR+sD12FYFaWBNXl1Dcr51QzPNpz52GDbU40J+srldYeCrbgoNHRhwySxD3E74eRUKE
	uMLyjeo2uY4xkz07Y6CD8ul3zqOX7niVYJzivVITb/zdClzdwOwTuAAMeYTZnj+PTXqAn19IaQR
	f628686EnMImWRqxiIalxoN+90gsg7822dRvyD63cQrp6iC0hA9Z5ZoP5GpghsaEMWJvT6x01kQ
	g4ixfQWTQ/1kp+AXzE2b/5W0Bj6kIluNJOCUitVJ0Mxw/43JzFgEmn9Rlzo4C+z7wR8WniH5JoH
	yjKD77H8Nrudr8+hgoiz9c5DRx3guuGsHh7Shi0O0CIS39xIfqPKgcbcOVERL86WTs7IVxG7TON
	hjhf/Dzxn9kVf5XMsoPUIWVKH
X-Received: by 2002:a05:622a:5790:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b56796944mr276102911cf.34.1785827838488;
        Tue, 04 Aug 2026 00:17:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5790:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b56796944mr276102651cf.34.1785827838082;
        Tue, 04 Aug 2026 00:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:17:01 +0200
Subject: [PATCH 5/5] spi: atcspi200: Drop redundant andestech,qilai-spi
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-5-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
In-Reply-To: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
To: CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        Vladimir Moravcevic <vmoravcevic@axiado.com>,
        Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=841;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vpjPOm3cj55xGdd/EOSoChfrcxstG3L+1v0CwT8/FC0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHvKYyBX0HJqdTzsTetFJ/1SdRnFIw572j77
 MJ2k/QKLGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR7wAKCRDBN2bmhouD
 16SzD/48sVjwnveKEw8uD21xQl6zoA8Ch2uI2VMORVCojyGpTpksje1CXf4XxyikjhGAcM2h3vP
 zmbUeFIqWIquuQiaQXVrKmZzEyG7sRsGwh3V6ZcfLMsmvUp9DGxmEKiUdtAGw9au6sv5Uld1TkY
 n6/ubG0Rqg0OlmciitI8RFE8XofIGYNmk2QCF0zXi7ssd7iFypUhqjeVkYAh7+1YcWv734pQGxn
 F2ffhH9qp431HaInw1u2RlOj4O6w8h347tfNjfAQZYl8MKsL4RcC/gJc6O4ZCs4CQxsWA4YwH3p
 vq/py70uI5YWZ1bOSjpO/kOPw9TG+qUfG7pNrFo10UcTv8IhjhfVt3drDpuGXP2lOpehhxRnGbp
 HlFMZXbnGGaDex8yGP+fVNoyEgGAr/Z21ZboHYjQGWOnswDCU3qgvriAjJEprsUDan2FQzEszH8
 Y9tRL6wsaciOWnvLOZEcKbiAYK+LsHfh0ptE6419EhsBF4NT1CED4hqWl+iEM+aYHRp4Yv7rUgV
 ka3M5Zal/fs3AnjmrA+3MObPbx/iTa6ZKEtMm5S4bXd/8pBhPT8hipdTJOnyrn5WC1GUhVQMwGp
 fq7S+FnoOS6mpgY2g9nuEvgiUW+4SG6LktSesv9EQpAFkD+tqSIIEktVbgF/E+XLe8DcAlKI0Q9
 XZb+s74PHUtB3gg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXzHGp32LAc8/T
 knhOrWBKAAYK4HJu0tjoKZxJjIj3MzVy1++5n/MIV8EkwbZkZL/9hNsUUljl3RWpYzYKwKdBCh6
 DFVySz3zsYIKkmrFC6xYCNxGzIY7ZYM=
X-Proofpoint-GUID: qjcrkGA_Sw1tvFDXwKqdJ_1U-R3ECE2N
X-Proofpoint-ORIG-GUID: qjcrkGA_Sw1tvFDXwKqdJ_1U-R3ECE2N
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a7191ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9l9ugx5lC3ssAmPyifEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX7cJjK9dcnOnq
 smzgRPizvIO1T10cCgs3ZnrO31/Clb0dUkyEqKmG4HHNX5BzW1Sp/p8gdBtt+w1MukZF7YM47xh
 cTJ33Toni5MRsPG967sarAzWwPjWi9X9tQrIFi1DRwSF5H+f+hZhbMCivNNBmW1beZBosmstBqN
 i2tTycic8K8KoSQIpk6sBiUeyjstb171i364IecyuW/g7vjNCvmCaCT1jGt0aJNBTpBdYyKFf5h
 GBF6/iZ2QwZONZpfKiK2l/iYMEPrpLpjmqSLQYz7NQ0vCninaNf3XobZg16Wk9T5iDld6MNTWhO
 710lt1lvOGeW3BKM8b+p1Aiw6iZDVULaQ/ml0wWHeCcdNYGDbLZw29LM/CyLCOuW2i7RSSj8HbM
 d0jB5tqp2UjY4HpQws0CsDyOhTpUSoxGH0Yt4I0wiM+vv1D2bz5eoRNH44jI901mlmr4xPAZu+C
 IUosJPltCwr0aeuHErA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001720_328417_25F6AE78 
X-CRM114-Status: GOOD (  15.93  )
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

"andestech,qilai-spi" compatible can only be used with a fallback, which
is already matched by the driver's OF device ID table, thus it is
redundant in the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/spi/spi-atcspi200.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-atcspi200.c b/drivers/spi/spi-atcspi200.c
index b6ea8e556335..b532c58c0ab9 100644
--- a/drivers/spi/spi-atcspi200.c
+++ b/drivers/spi/spi-atcspi200.c
@@ -638,7 +638,6 @@ static int atcspi_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(atcspi_pm_ops, atcspi_suspend, atcspi_resume);
 
 static const struct of_device_id atcspi_of_match[] = {
-	{ .compatible = "andestech,qilai-spi", },
 	{ .compatible = "andestech,ae350-spi", },
 	{ /* sentinel */ }
 };

-- 
2.53.0


