Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6806FC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=; b=OnHLKu1ortmOYDmrNXtp72C8k+
	BWqB0WMDWRGtFyYY7IhoWkwpUd3VtLz07BPIeYshAbgIe+w+erx5BlWKJZRbZiSWtkQyePGR/38wB
	OsGCL3FEtzX8r9InoEbC+bVrU7d4+tjIpQgoZ/QlfncLYdPjqONmLqwNi3KOgegp/Zzb6JcjKV9aK
	2Hf7JQKoem4vXFXcMc7k/QpvoVS6BGzImxvbMgYSdt0XhNnosRwonUgPmLO7G09MOPl3RgLanoQmE
	K8TR4cVR/TIJMUAWUdPbUfcSC7JVrLh1SxjVhLBJ/S2JY2s1oCZg3vQYuo+VPm2KMy0rTL5dvqS14
	JyhY6/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEA-00000000fcR-0kie;
	Sun, 18 Jan 2026 18:10:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXE3-00000000fVs-0GfO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IGpeUd3099662
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=; b=XM0kU0IOuobH+dzF
	6qVL0KuB91DXq8pk+r1qmhwUkydjBo9HyCAY1LKdpuGih0pp9iKU6HVfW9HWLFxz
	R3IvKRlSB4lkLTBq6Pbr+wtIL33Q2GypI40wf1+SQn+5VlMc+q/3g2J/WUeCGB97
	1dnPHYWjD5O3T1uXciWGtbVV3Wo7snw+1aYn8bU56XpkaX0IxdQtyK/Gfzq2EqHd
	49dgs7MxLA2i7SGKCaYTRZEYUpviIKBf427BxsincA+Rj5kL4djRYs1NICEOqLuo
	Xf2CJ7rrUcH9mKV8D8qc8HG7eIjsQBCiUZGE8GGMvx+q81KgwIcWKIef2/ofx/2C
	kdePBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2ke2rat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a87029b6so583496485a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759809; x=1769364609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=XBRyraXpKAocUT/DpCKTGF7Ulr2pQ4ZRZiAqcnPp730Dh7QvUqz8hDHBXWyPAbFu2b
         Bjkg1XRB6t1tgrRuPvLSwcwocaVwjcCQQLFKyai7n+vnuZSS8SH6nlk39go5H1ilKe5t
         qkFrLZ/XdnYloltmqTXnCvV/ZGmvExm3NVw68O2BZY+rgZnQJzSk3nKSC0wIZTsu18fC
         2mtQWBNiCttKKk8LGgDcDsPbSjnmLPK/F6xfcCqQyvrieV6ZHrUlI3+XLINCGKP/RwQk
         pkYNzDrRQ81OQ+WNJ0lQray88EBH8kmIQG9HRmNeTPa96/CH31hxIH6AZrUR/SmrQOXO
         nIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759809; x=1769364609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=C2Q93d2omS66xXQfs68Vag/PGRXz48RVGt18PHVmXqH7iCUCRl5p2TPx3o/XjoRHbh
         O5OQ6UF+jLzJOHySrlJQTVtCT2mfi6yX4fxdr0NPhk1QttwwDfmMgXtCZPLtqsmZ31eI
         PsY2yxnKL0LIeC6k8ugt+/2ZB80//OUy8/GwgR6dMtA7IpCtlzxhsBKxaK4reKXnTJl4
         IZNOV8cgKPmPPwhxHRTny8JVN5iFsWZD72zC311hF1gEmxeajb33qOqtdm/j0vrV3Fii
         jpcvY3TejL5FcA8uCUJwqRijz70VvBmhM97RhWGudH/Te2vFcoJ57UAFNA42XvDYcBV0
         RgEw==
X-Forwarded-Encrypted: i=1; AJvYcCVue6K4hdHfC7dpcw81JISx9PPtZRB/b9H0Mj6hksC8Zbf1E2gj617kfi2EN+CbZ/1Q09GDo+kr3K5y/7ZYngot@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7nJh+ZGdYyF/ep12WBQG1ieYrllJTjeE49+BUxvr6QIPE/3ak
	lYuOdfLU26YpczplLOqlutL+1mYwlk8WIVAylFzy62w/x9PSDQJrzaSmD6pvZmwbWiwc8OiB82u
	zF6CSNm0d4m4sXipQ20FnxveD6HqAP2HleuC7xlW00ehlRGYHzn2791AtmajLLnDxQr6555q4Ky
	iqqA==
X-Gm-Gg: AY/fxX7npalaEIu6FlLJHMpkXHbFV7dWnC7/uHbibuFH0TrD300pk7OEhvAzzoW7kVs
	xqdjBMS9U3M6s4bdFxsLKqWEoPRY6VDjPAfWlPlVpiWqe834uen7B4gUL88r5cM7NNhryvom561
	qWV4j0OUqi3fhoqt/hQbdQUVdZ2pDDY84n49m2lyQdpyG8v6R8N44EkOOn7fi3Zq2eM8Q4OjKvu
	IORjmEsl+lD4sL/GJYaoCdq0K7QWOHQnw1Nl39llSvfA+OmDy2T0XeUvrI474GmOXIJZKHJ6roy
	Qo2wboCO/Sw4AYjxpYPbUZJZysS7iDeS5dSXmph+z7j4y+0slPbnoX6mPO2hADsRqYXrz4Q0+me
	/vtijLrXHeBEiNqAhIWiLK7Yxrmd9Zh9/cg==
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321766185a.87.1768759809380;
        Sun, 18 Jan 2026 10:10:09 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321761985a.87.1768759808928;
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:26 +0100
Subject: [PATCH v2 03/11] pinctrl: sophgo: Cleanup header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-3-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K3uQDGZFV9ixSLMAp+XTCn6w6PMJReQbBttCFQN0F/U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHwFh1ny8ZUBi7E3yd3ZVK3fp/JTPumZY3DF
 DMrk8Bsjp+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8AAKCRDBN2bmhouD
 1xP9D/wKpjBpf0B5lT15hZHuDhBlqt/XMr+dL2IoW+gDe82hyBNbi9Mssn20GVc1WxaEnqmnq4V
 p4+swUeTdryZjhbgxuKOPrnBZ5Vk+8vlzjCsvDVQ2ReBaqMpORafXuxkCKFgclmPhchYQRR6b/9
 /6l9s0yU2jXLJ/19u2o6w1PYH9z2E0bXHvYkcbKNeJFQHEKOlKZO49UNYTddgFA6Glzh2kmdWa4
 iVPwqzZEAbi33uzkLpefoBgD2iQyRwmyLJSxN0ZlVWdPPd6cxYvfPMWlr/a4ZUDTTfEYRZzlkEz
 nxG+54c1yU+jxM5okvGMdms9h6U5n3xWwKQoHYLNd8q0xZXrjBesvQB1Z49IkKfDBFLbkNGgWTN
 tlOUZlfxVOe5kEK6DwJlPpG7xVCf1ey6yUYxBCnqM+1HYMFULN3Q1/C+0jxj9XJZ4mKG4AC63n9
 dYUqyGyPrLP8dKvvV619YhkgqwYnCKINxgT5jTECPev4nLqZjQxG2jWTZtVcGitKwo6aaZAPm4N
 nxmYst0BFODDdlwnUAIbEeTzcSbEfm1xCuURbI7/ir0a83enDBdVx7FY/SLEB55rhRpN63dJLgx
 Vciq6wWoExc3WoBaH3dwBm0ST1MNbLbF6lHxQqvEKQELGhE9JzTjOytPYUjW7UbvNKOMmRQ5Grw
 4tuQ43AnItwMaTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX/fhADJdjQPK1
 BiWJXBR628ZaFRVoMRAPCgEjTRI954dgQzXxzVyU3DFbnsYmA0hP65skfDArDhAPQU4bP34x0Lz
 GeBahk2T19w2ryjYVKXuIO1c9zMOgz1EAmq2vKSusq+JAo9uzbqB2gClrkl9wXQtJE86cxuXT1N
 IP9ywAyb+qtMf29BsruQQfXuVDl3jj+4gfQBlk/9RlDRMbxWyRLL4fUCt0zsgEiKMEXhmMRM97q
 gyFmTsIYRlGepTaIXhDwoylN/7knUYz1amPD9ZQVi1uWYBO8gXvRcLt2hgKgpy92O636pur4Dw5
 khtAZKEHZF6sdDTqTy5TeOh9lCMoNqhJfFNPP5WyIzKpq6dv/U1/e5aRz0kcGtOKbSpNVaEN5en
 8sx+4sdJVVWKSpxtFQneQTmt5RS9KWnGrmAxNC5B5XcVhLtqHnyskukPUEkfXrq61LcPUJIZwD5
 C3HtCf8VqqZntzBIS8Q==
X-Proofpoint-GUID: bDDBt9V7EN07ItFyNiwJoRTbzzkCSsZ0
X-Authority-Analysis: v=2.4 cv=EJgLElZC c=1 sm=1 tr=0 ts=696d2201 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=XMepgddcWT0EFqeyVMQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bDDBt9V7EN07ItFyNiwJoRTbzzkCSsZ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101011_217255_FE8FDE62 
X-CRM114-Status: GOOD (  11.38  )
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

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
 drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 759c0e604acf..973ab9a38fcf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -6,11 +6,7 @@
 #ifndef _PINCTRL_SOPHGO_CV18XX_H
 #define _PINCTRL_SOPHGO_CV18XX_H
 
-#include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
index d481973fcf97..1a2b00dde1fa 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -6,12 +6,6 @@
 #ifndef _PINCTRL_SOPHGO_SG2042_H
 #define _PINCTRL_SOPHGO_SG2042_H
 
-#include <linux/bits.h>
-#include <linux/bitfield.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 

-- 
2.51.0


