Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9E8D1118C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=qZ0zwk9LQBwHR2soAubiVCDbpa
	vPl5ij72rsAEL0sstwuVArN8Noh0LXjEokFdWbVSliTO5bX5MIwAj3h5TGlD1MvpCxa/rZ7PCbXDs
	Y90masuLwsI/pPbaAIccJTM7rvB0KTd5jUa9T+AC7SifkG2Jjca2M8YmovfYP7Ieq9glnprJ3atMu
	NxxHY4HyuUfmRDP6Pr9Ct4AR8id03kbKeH4yhMjr4YR13h7tlPir68vrU8cbCv89l+NGBkKvLlOJT
	f6DA5zLWQvtswOCCqnp9g5Z7DHFpCjpQJ2AxvKAvj4zhLgQ/Dgfa6ZWitkbe2XBGq5MMh4rZwvQzZ
	/+G8j2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVO-0000000FQtZ-17Lj;
	Wed, 26 Nov 2025 17:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVI-0000000FQqg-2Yz7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=b1CZCOPUQAHUScmfKwTztzyICh
	4ZHhsvYIxL7/bbC1acIIUttv6YMxF3yt31WIGgawLbyaNWPb0Pkn5EhOsU/TmM0QEf6pGcNBOMVCQ
	31gf0wB0zYB46A80edEral//GDlZaejMBlQcvd2Gt1Zp4rNHcPSqK/Xz45kQBABG2GHn2jg4chnfi
	XujU20KlcX9m1Mx21tciIEUKUOIRxYw48GWR56Vp5fbz7L3CZczFJqCZSHAbxAsewAg8a/fnaeWLj
	9WrB9RuJJ6Ok6/Lhi+mQ9tVa3szuOilw1wsILQk58dlV5u4ed0Q6EC+knAwy/YI/iOwxo3WER5WNR
	hSJ13OhA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIde-00000008WmE-1NMi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQG16xC1234827
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=Ee8TkNAeaCYxJvR7
	lYj1pXGUbOv1ZioxdpU4PbsiUvJKz6+krctW4P9wtMVAaXktpi12jqYfhfAqpaRn
	3aO+9nS1uAS2jbej8HMZ2z03oc3ux04JYY17n2PJM0rxXpobRbe1JlQezjc1qbGr
	SNS95Zmk/sFlw94g/jNOcsfiodqdCNXvoq77llIjDhTGjN95MGIeno1Q/LK8+emq
	8NIb/V9LFDMoGHxREC+x5Y6EqPnoPVu+SZGutRkA88nyNURY9L2alyO9UZO9i5Fs
	rtU0aZbSyTEFvx/gByqCNh3PjNPnaOOCl6h/H0b+RY5IwvaqHvmCCGHrCmWKtOOV
	ySUDiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41rxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22d590227so824116385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178826; x=1764783626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=g1o4gYsHUrAPRGffKkMztorhdmenLPGk4KFkNkeDdNHqswHO4Wbf0x2ijH0y/Kf2G2
         9L1IGINAQQ5/M4R5ankrw9FJy46cGwgXqBPFNbWzic6RX0f+Fla4eF9zO5WRAGN7fO/S
         AGcmn0wmdFT7Nu3or3AxDK8u0OUetGZslwyYQOiVOPh10P8jVXB1nWvY3lwnsCZsxDJ2
         HTAP/rvOLEdsEyWUBEtSchtNa85/R361QPtLpR3FVtF1FLSfy/tpxQGBVTRqwnffe9ej
         Mow21j9AvxESmCTGdFyUlqtpXL/av61bz93VdSxy3R8mMaXiEJEwwxeDTrIcgX5jicmK
         SHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178826; x=1764783626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=DxksCsXfvWesU3lHpRwGxVcT4cKdeug5JrxFCLbMfTGPl8P4VvTjU8Ss41Q8VzOSq8
         jJIn4b9FS6jcraDFCe9dOBtephaZ+ONGS8fUs+AdA5fZk2L/gnXhjmNG/zyMYaSNpHO9
         RQPZ9FQ4ihXrpeKfbjz8vgem5pFTFDXbSXvKGUTjA57v2IBFjbzr6TIQlw8rfr5KR6Fb
         kWE+WevKCSSL1iuKNkHZnwXheTkLRRoqXicrsYqSR4O+lzC7r4sY9JiYR45wSrxyyLtP
         byAUkjHBrx25rsTw+jot6JQUgcW1smYoJ5R6tVNzm5IabV9+TydQGghVkvQWQ15Chtay
         s3uw==
X-Forwarded-Encrypted: i=1; AJvYcCUuM8SNOz3BpZYaqC2OkbX2NlqrbhKzDusuvERQcTUlCHGeZAOg+GpqhzSl5od/RhqIXsSW0m1vJ4fuW78xSHtR@lists.infradead.org
X-Gm-Message-State: AOJu0YwsWFvEi9nyObq297KIGPNtvpo39qVSllumt3UreNmT64qNa8O8
	l8lL8QlWCj8ax4RJo5VQyAYuc3paXmziK1J3nIcbpajZkfaNO0gFuG6ZqjMJ3DKuj8J9IhIblfX
	HAXftEF22BVb55SA800c8TBkq+hgY5gUIy6Yqh3FzUJl66SoEKWvx8En4emHdfukdkOkOJE/u0T
	Y5AA==
X-Gm-Gg: ASbGncsDxKPpE6ZUFj1SvEuqYO6vfTWqYBlT7iR4MjO+U1agKaG2WtnM0j/m1WrT/sA
	PA5eyl0vW0mm3/N9Wbpn4iSjS9+FLarrjpGEWaN5nNrVYAE680/01WR6PbRw8S/7quLFTBxYwtL
	Z/oun6IqTcPWIEyJX27ltWJHecuf/ugKD8avXgLykPFTsLDlHZ4o1hVI8s0izIQ/Lk4/HSH/ZWE
	dS7BA08o8vATgC7gr4KM/h9qgEm0J+v10yS2Na7ErphZ1LxRqOYDCz9dOkSe53bYM4cjgzWe0yI
	qOasPwDv7iv03X1aaV3tEOLL+73Q3xN8YX5G9ez1JeBc8VP77eTCyiotgsOrECBhbJAYG0XZ+2M
	hcxlc/Ga6WoYgTHldnzYzh/d+14C02NQSsw==
X-Received: by 2002:a05:620a:4450:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8b4ebd9eb92mr1051554285a.53.1764178825894;
        Wed, 26 Nov 2025 09:40:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk+WYbCB4UAQQbssL44Zoba/uliDJA/IjRYxhjiFF7e5XtfCI4o6pCvBemDjZ7Yr844NNDxQ==
X-Received: by 2002:a05:620a:4450:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8b4ebd9eb92mr1051550185a.53.1764178825481;
        Wed, 26 Nov 2025 09:40:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:08 +0100
Subject: [PATCH v2 4/8] regulator: bd718x7: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-4-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt9jg7POV/+E97cdcSXikJ0TTO5DEGd+g0Bp
 kPawpTUcCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fQAKCRDBN2bmhouD
 14ZND/43VbjQfFZ8ZQa5GgSj68cGizpnP3Lulpkl8vN/CoSgNdpLLuGGfkeOs06X70hijpxaoZe
 MVvrUQWpEq1kaGB1T6YYGUzWYp6FNYlBmZ+QhvikUVe5tSOxCgPNmtoSmAj+zd5g+v26Rn8gwFL
 eZlAaHb68jYse5ydpQoxMJHJE0321ctWbOm74TnUssgF/IDvZ1jOZ4x0dqROWnNQCPW+O3eLsM8
 aU+pxN+P7yezxa8ZSs3qrPQz/hizAoumN+aUGcG9XpzXXyKqf0xBRIsoA4R819t0QQ4J1TgLSPU
 8McgGQaxI3GUziCm4iHNVSb20BjsrBzKKhA+Tzw5Y8A2DqWvqvNWN0Wstshiw5ou9buzttotAy6
 UKIjtlGg2ykA1Loi5KvyWbCuwtDRn/xgKrLwa0ug+R5vJ1xzvGQLhV7QxxjC/IrtSXSbaHsyFhl
 YaenI2PGY2McssB625qOsSAcBvaeSwVDRoadka76VqWWwFu07JcyPx46cma3Ge7oHuHWZkd/hv2
 TulOrFyUwbXqB0/cqCuDyMqfs6z2sqVN6Ei2ElwBAxH758K6NImijE8nh+yHfUCP6zhYF46OwE2
 T2drQ6+mL0of8qUkQXJ7cQfXPEW4ooIL4iXCXmS28dcJ2SZ0HQXC391KYo3g2a55OKm/7/okviI
 nKAGPltNQY3T/mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 7BwRC4Xs3sHstqXyZ5S0rNNudJ3B6G-m
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69273b8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7BwRC4Xs3sHstqXyZ5S0rNNudJ3B6G-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX9DFUXrI/CUqI
 XxLvTHKcld455OE6n+/LfUGT53U+xWxHRDe9RJMTm2cgL3IpYTqPLQFWN0Bj7N2XaoMqH1qRI7i
 Qc3XH/fAVsgWi6JEWyaTzEOTIAoI1S+YSBCQwZwisj7UX9BbE8K+11q8RV6hEEguOBC2VgAKBQU
 NgAp0vDtPedCqTGhzE5m6/d1RUv2txO8SJLLc0V79jB+WtWHx16nzN4MTF7v4M8eGd0JrMcGRmB
 eWoOKipAMc6JM3pMyqwR3zQ3rU2RM2odppDrkgNQEhIIY4gXxQYkcgbcbAUOLPtRVz8kIIUNjTQ
 gRxjtvupHFwFwMNt0qyMzeMudwMfL6TWr/5yeBNMzsxeF9eVzEVGhF2i4VcuFLaUWVaYF2mmsvj
 SmdqXUIvlA+H3L+os2bM/M7prxt9zw==
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
X-CRM114-CacheID: sfid-20251126_164506_767794_7FEF70A7 
X-CRM114-Status: GOOD (  17.31  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd718x7-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index ea9c4058ee6a..1b5997c8482e 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -698,9 +698,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	struct bd718xx_regulator_data *data;
+	const struct bd718xx_regulator_data *data;
 
-	data = container_of(desc, struct bd718xx_regulator_data, desc);
+	data = container_of_const(desc, struct bd718xx_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1


