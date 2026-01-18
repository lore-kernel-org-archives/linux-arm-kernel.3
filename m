Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6136CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=; b=kfg+jgyrF0AcBnGLryx9SuLmvw
	j3N6FnBqg/t++QEsLoQSJ7BEyevEibZLRQP/jc7lNj86svAPochM+DUDzHBcfpXNATp+8N/AhQ2sf
	lA73DTEOYKsJ7I/S2mV10xIBe48/1whmgxDot2ceIeNmwo3/bWoyEzGPnLG2jTlZJCoinQvOALPM4
	+SxsYvD4Lf1Xt2H6S3I07ln44bpsd3UEfmqD3I+tRg/bwyGhUcwGLLKCPPtZ9Up85/PmYsqEHllNq
	hfPQmIgJCPB4pktc2lelCH6EcYsmezcAckhSOldMrHrlon8Lm6bkeNja7q3bTU8SbgotTGNonOVd3
	BMrxy3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEs-00000000gM0-0rJF;
	Sun, 18 Jan 2026 18:11:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEL-00000000fm4-46bM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IBPZ4d3019878
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=; b=CAJnBbDnA61W8ImL
	SnAgPRZ26uidWw6/crkIz13LXLfpToynIHrH8fGSxXxetED4wm5RJiZrZDg3rIfp
	I+yQhrd1CBcJ2Ad1lFGyf0FsGqwUca3zvkkfCL3ZCW32iOW4+BU+zFImpamvkP5L
	3osMGujdYac1/k+nkBafEmhc9umBL/i3W2CHMm3rb7+w1xHJXWCVXvQUKh2K6id9
	bp6GniMk26pToQycFEVVN2Av0pqMYej4EFc/gwjGx53qUMEe/dVECDdxjQSVVBKJ
	QGMQkydLLEne96NU+CuKEKwSYdrZH2VFYby+MaKWI8kzKlyfM27gyaBY1pIwxY0N
	TkbXFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2guju2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ae763d03so210444385a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759828; x=1769364628; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=;
        b=J0byfMRw9AiH/d5yNYryJ14EDMvCF75hZVUUZSST6cwDADv//7AzWj3vqCRmmKStYf
         Ur6IPcJXWdAontPW/1zccIiMI2ZTpXxbZ3jcujxi6lzXbb0yK50J8mfGRJ4dAqvd9smb
         R1zsmtYoAEAbi4JfrbW7GC12vseD5dx6GzCQJ35CFYM+1DUHRcVitYMAaEKZkqTujgvi
         DJU9bsTEFTFfNTqaYnOfLyz/M1dzcDB9o8fFTl3uOAR4Yf+qWIZGa5Fxv87DsJEpPeg6
         Tvmx5lYmHVxt41WQc9KUC6fr0aNvZF7dzOZ5bxFW6fuCRd0yjef4leXdZh+eIR+R978p
         3Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759828; x=1769364628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=;
        b=YY40f84p8Rk3msgyqzWFhvg2CRE6LCEg9tOqrcwWjM84ePJcMsiORK7V/KXUobp4I+
         UCIKRBMEdKBZiBNl3nO5Ypmv6vZAa6dFh+OLHMiZikVn8knHSY+O0oBBnPVRe5CVTOT+
         Pazsu25LtY0sp36EYcKA7IYuGUlDMgP76tVSbPf1j9oNYoeliEcMnllJfZZooLIaxkZ5
         pqY8og1c/Qm54lmVreYXm/zZ9RTACt88himV9c2Iq1c/tdbBN9Qj6ROCe7MO2YfkU1Jx
         9IFNphjfwyt5gIj9RurUOf+GGtYNo0HGHaAZNObq+QsDKK2MKMhQ43lLhl46UTUcz0z7
         4Urg==
X-Forwarded-Encrypted: i=1; AJvYcCXxHI91ngK87dE74zM9JsgPhpcRfg/NrcFf1ENmV4FWIBCfck4Ri4GHvkZz/0F6JZs8uUohvMYBEyCF3LIMSA9F@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2A1/vrNtNBWqvAU7NI20B+N9nieZqySuDOl7hHBocvDqXMuPu
	gs786Bsp1ri/29l8Z03CctKC3VwQ4baPgXnq+YM5LKvsqiV/2PWVIgfZv6bpvHbMzSsyk17f09W
	ReQ9Nb8/cwoVyG3RQZO7Ce64mtkutXNMvbnSDXKdueIpYJ81KGX+efSu0xaGu+eyrf5IyPlzfRy
	7rBw==
X-Gm-Gg: AY/fxX53IeByHopyCfWg/X5bUpzYu+9ZDT9nEe06j+QxXCCfVYB+D3weT+VlrXeuakp
	Rj468fSEzsMTT0/eUmqOZSgWCaFqv/U7MeNij6Pzn7o2BWr2VDJsWtset8+mOtPdd9tOV7ZNr2G
	I3ZZLcnKW+2ClZlfad9UJSwzJgZSUhr43gU3YQ9Ftr3ncO66cQ71v1dCnJX0R7OR8IhCUNkc7gh
	DNYZDgijJJHXD715no2eaNuTWLjAr7DjOViHwNAu6B6Gq+xXVQXLgvi+HwD8gmj2T9qp51DkGJ7
	lsSimOgusdV9y0jV290on6Z2yVa1ZTpqZf7IHPycpxLjuy5J4Gz3D1ZPZ4qYy01QpzSoBeBbUlj
	tRN54Agix/DCmacrRuyJV90qqnSQeY7xQtg==
X-Received: by 2002:a05:620a:2808:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c6a67b79c5mr1285495185a.70.1768759828486;
        Sun, 18 Jan 2026 10:10:28 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c6a67b79c5mr1285491785a.70.1768759828043;
        Sun, 18 Jan 2026 10:10:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:34 +0100
Subject: [PATCH v2 11/11] pinctrl: st: Annotate st_pinconf_dbg_show() as
 holding mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-11-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k1GvsBNYWO8pFPyazMMNabsh3Vpjdc1LSTY4GGhIuOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH3xTqF1UPuWpw21q5i4y/0ItOY7uFl5LJRk
 I/zBJTe0SiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9wAKCRDBN2bmhouD
 14rID/9CmPz1fyhRfWxv8BXOtmT8JzPxM3Qn1vrvoEw3Redb2US4V07grJBDpsNMH2yrzXble41
 qSybWyUX5o3mUWc71wO3IsMFu4uIK1mOxv3WeIRfETEaVH6Sn7DYx472fLtIqS9oZ+qA+sCBJja
 VZqb59C2Wu6FxIQy5jRXgkXFhzpMZX0nRzYzDwyQb/gPSnWoiBOSRkxbAxvnAWqmPNWAHehSuS+
 S3lTrzXTkY98p1nxFqfdeU8afywPvhvwDpfmevQNjxy7iF3EVPf2z4pyHTOQREBUBBmC1perTa0
 ANxtLXo2E8BaPttpb8EoZLHxfX7PIAA3ibfLPS0dPI9Yhlhkq9HgRSbSvTKCGxLSk4sxrjTofoP
 8reJpHpMVSLdOfwPApz5sWcX+oq/L74sPON1vtXunQcS1QSf50DL+Abn0WjuoQWPqg6LsySITQc
 oE9X/C6PfDtxOP7YFCEU74SomVt5ZtAwYGK9tgAjJIhKXro4U0APc9TE5T0ekdeapQyKRAkQIlh
 2oeg70iEhT2N/f16R6mk9EaIeneSiNYN/wqgMiPo418GRPwnMZVANUWr/har+gk+z3ScAHAYU4w
 LCmu/3TUFx8+BZXGjyqMjtcINUApT5RxEOVxvgAkv9Z4jn0eIIZd+UQuZn5nKG9jKV3FlgN0K7J
 BiN1rYOCb1j6Hng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXyXYj/K14z6vU
 Lex4BoVIfvCOWdsWQMEVmrRzHm7JN7F+BfCvZ3t10VJDxJ0ZMbtpTJ/5IJYWB0tHo2oHtdrNKaN
 2ZzsawakfL0dmSpHjwsRVEWfuCdjFCfoMgF2u1pnmsjT4K5EOvTIZDiEpeb/AIhqU6z5jv5L6Dh
 Htinv4+URnbrzJljlOhUU1p310UKgj2Zj/fO7uBDrScwvquQG17cVfhpIpfK4DZFRGsB67s6AiF
 zBPfvlLJxKX8bfiPYqUBI2264VVIWmwyGxATzeYQTuABV9gH/y19ooXLhRvYQHz/3ITXb5P4NUh
 9M1hfsu+xX2mG91c9TbQqGPurpy3r8mhrAogChcxYYEBeBNd+utyuBbkUb2UUdc8hsRNVYTEbdh
 r6fnhLPKhyQmzz/UzNZP4zx/jqZBMXlk/RbSw3wxuPKiJvvcjaDM/3i4fRD6I2wZckok6tuAihT
 E3npZoBfnCPzNPQBNlw==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d2215 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8
 a=RIxbnQC35JVfspY8PfAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: -1OufpA-1sOUpgVx9VSHFclJpGLam7NI
X-Proofpoint-ORIG-GUID: -1OufpA-1sOUpgVx9VSHFclJpGLam7NI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101030_280015_954156B3 
X-CRM114-Status: GOOD (  16.28  )
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

st_pinconf_dbg_show() unlocks and locks the pinctrl_dev mutex, so it
must be called by the pinctrl core with the mutex hold.  Annotate the
function with sparse __must_hold, so any changes in pinctrl locking will
be statically detected.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

I think this is still useful, although maybe a bit pointless if core
explicitly always locks every pin_config_dbg_show() call? Anyway,
pattern of unlock+lock feels to me like something worth annotating.

I left the patch at the end of the set so it can be nicely discarded.
---
 drivers/pinctrl/pinctrl-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index d3cea3437d7f..8ce88e591f47 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -987,6 +987,7 @@ static int st_pinconf_get(struct pinctrl_dev *pctldev,
 
 static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 				   struct seq_file *s, unsigned pin_id)
+	__must_hold(&pctldev->mutex)
 {
 	struct st_pio_control *pc;
 	unsigned long config;

-- 
2.51.0


