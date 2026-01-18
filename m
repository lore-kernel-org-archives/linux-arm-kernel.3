Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4490FC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=; b=ws8gER5ZiTD0JUseBAph+sVK2X
	DV+pVqEXk08E552zr9ooeFPQNLsgBH5/8jhDSR2RfifhUgfH+bvdKQ8i0oPXnGTR555QvWzTLo+nA
	VlKuM9A67JZ2o2H7I+oijLa873jYKmTIU5S5vdeIxCgciNO/wjd25mQocTaRo/nTKB8Zjk/9VxZky
	C3IjKVTuH9TnFkCCK9BFbXOD2Dnz8wAA1e4a+JMHUAEJeesneY79wQMupauMgP/FK+dCJGfq6aBn2
	6CFBRuYnOFzGBR/a+WvPkVRt41nCFmuWJiJlm09gJPBQ66Rz7gDYtYGsTdMRkH1emj2gGs/sQe8lN
	jql89+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEr-00000000gKo-1QlZ;
	Sun, 18 Jan 2026 18:11:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEI-00000000fhn-2FSB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I4XG402653475
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=; b=Z6DB2YhGkaLCOu3G
	dvJzrF9MGYlT25uf4akGK2B2DlOvGRwGmJkrWOY3hzsMZ9UZKt9Edh/p9bkWGcRw
	ajdURbQ8XtREwXTXybLIEXImTWYYnGNwOm2JsNhQGOtXgrTJfP0JCqqeKjwLBLit
	VU7tDcy+orbSwYYr5ZET5qJ/GHTAYICe8F06wtnrAv9XQ+ZekQSdskicVPmsod1j
	jXwEuDZ/7cpau5lyz9sJ3ZCk1xTKJju3RqwxrwYerQtNGXL4GV9TsZEV2RI6HFgM
	vUIkGVwtgZpSNCspbZo8ypNikiv8lENoW2W9dQ0qDWgj4faSZJsRXaFDd7Up2NXc
	o7I//w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5jyh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2a3a614b5so913548085a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759825; x=1769364625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=;
        b=hnEQIIfuLyKljAruCkz7KRqxxCZa+/3ywayOdVED38NkYFhDKQe08Bv0BqFg8dF5qK
         V+tVSvAcDEf8sAW+mCnLDaG0ypbuSSDT4h44puWtk+IR1A6i0EFMgSuXjmuGO1fnqb2x
         G79Ai0uq44TTVWqwF7hEjUKtpxBbLum39FWybzGvKCAjGsSe6SmGMvIQ18uUTo2jl/65
         YGfykw5cebmWrxuWT+1faJJ5dtwQ3hDrbLA6glJY5iK4pJxxub5caDhQ88fQdQ8w6reU
         wMlm6EwzcYtKWhb6xXjXRU1Xsg3CSV1PzMFyGXdDX50IdRUSVvNfROPje4BuG9+h7cFw
         45HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759825; x=1769364625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=;
        b=EIbmFcROE7DCY4Yy/tekeMVyYFgPNvecPtdUF5+WxqroWWKzPHZ3Z5+TutkuFPgzYl
         F6VJvls9BndzGZWcrgVD6RoiG0FNkOo7pKDWUGCuNil/erW/XDXtH8g7WhMr8WRWBZtb
         fnViQIlcAHw5DjJiSwE9Me/BEvV0+ILPXoCk4zVotiICWEesN7DXjS6uQqdIL3K9pjz7
         JpAbAIOcXj+dzNmtHAzGyrPd5uL45Zggyl4D9HviVIuvl4dwit3zwiGfjmzvVwVU8XZp
         ZlyZn2ym8Z5EQR8GMBGfevrkhdNNNsrFn/5/hQngpLYhU+7j3t0P4P435Sa1xWKgmW9t
         Rbxg==
X-Forwarded-Encrypted: i=1; AJvYcCX3VMLGa+ufGXZ+TFJaDTZ3oyxZ197kyB9EnrEGMswgoJrVLqjNHjqzw0iQrINX0itkHRi48RMQvFKTaONQJvZ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwHxo96Kv8ZenB3gBPGxtKlY2nwLJ3FA1zi96RZjPlnXKOM2rv3
	1QANKhEED0iDPN6HHt98DgZqCSlOwNC+kT10HR8+kJIcLa7oD05vmBe/P9fwnuuj8xFthz7sbOO
	PiDl0inflGwHPBNaQGWB/iCx7A4/3iv+6ZpWaJCJNmIpKkuBY/heLuRWstic8irqDSJPtYZYQyT
	wdOw==
X-Gm-Gg: AY/fxX5GF/xMJyq8sn2oPKVC3uvBW44YS97jRFaBdG49zsKsjhVGnNUtYymRFHAl470
	V2tvYptgfcKH1myLK1zRY3tTuitZR3I4mFlfWGC8IpmwOC537bMuY77fxIK0wYmux8t1hqBvgsM
	ixdEbj+F7awbePqOP0GxOcJ4+6paX+CzklJVVUyJf+wYOjX8rOiOEO/lnhDJpeV5W5L5OG4pcrs
	Bh48PbBZ3w9RHlxHWm9elPuW8489Cb3D9LDPXeAYM3LJn+qcYZMkb+9acUHMBHdgw3O3L7i1oTy
	FGfb4JOF3fiNolC38wSnvRZDjnsg9E3kQNiGrIJ7n++PpZYUUGRyFgT494JupEZANrfXA0rfafQ
	skWxwX9KD0Bsj6C7Q7XVK4pA96R0AiH9syw==
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1679912785a.42.1768759825045;
        Sun, 18 Jan 2026 10:10:25 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1679909785a.42.1768759824643;
        Sun, 18 Jan 2026 10:10:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:33 +0100
Subject: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xHpKv/L+LPsJ9X96+TG0TkMyLzJ8lmjqPrbjckpJnLU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH2V7HCVVZQA8nE36OlRFJLPIeFm2jrQH0SA
 voGEok2auGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9gAKCRDBN2bmhouD
 138DD/9yYDuntgcWTSxWPvfXFutn8XLNtbjiww7N0//+LCDsOtjjM92dz6ezguNQS/QHM98IHRr
 SF6pn5H3zt8atlHdhCPpyf3x3oKRSwOS0Akm92SgBtUpRXGuMiq+7O2MsLdR/tIUF6gTEgn6yFV
 84Lk5zDvgwOi0QlMHAVQZPovb6h/vY837EVCDSRCFQDUTEAR7na7JozMG8tp0VE0mE7bIWwPT/f
 v6lwP4dm5xYRh+B6HzZmHXrpwVUi9RbgeRK/PNZNadB3uz62KT1T0IT8R9nZUQtX9G4FMRwD3xH
 P5t30O/Hz6it1xvrvw1Lu5f3+AySnjjr6MZxix/zVD9DGKJE40H8HH7zTSSsREL4FwUU8zZS7HX
 dALPTXy6us1q2unNwiDi6kI/AVXWCCZ6sGl+XxvmbSBYYbIWREh+WyDt22jBLH1KeIKQYb7jH64
 SyxqJFMRWZNJsMGxf5H4BjA+NqW9skDWnXCNH2FnpIxnCtdb32i8yyU24YQcB2qy+UqVOj/UGme
 M5VDHJie/HU+5EggRTKsw7A3HWxLO/5lpq8m0Aym+vl3+6ldnGSTLTfSdS07z4/0Eibgnw8tPUH
 +vVzE2zpO63gAjhez3qAdbhnW2A7TSbUiCJyYbYcgetBXMa20Xnn0pQEThXHPYBZKIK1KuGnnf6
 /vUyVHqLHNNxN8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX9DA7Qm/Rb9PD
 mYe+PFCs8MrB/SCla8iCiCjzHvUgP3+ygtCJLuqZwEWP+rok58GneKMzYL43KPb0xlQ8ZosaOeu
 7PRwAeLKbJv0noCx777YmzqpbqDEuwX80HR2dlm2J6v1wVRJ3IJKIBu2n6qPUD/Ug5mo1dyi745
 ZcH0gY+QuIAridmVdlT51TobdShQa2aqIa/Gbfa19gOGnx7/VjiaY8N8uNchAIZEcX3xiemYSg9
 AFx/DmPuTynsEnPwKB8IW8/uTimWbI2lQQVMJIFjGni16v0GzJ6lvU/Vy227QLbGg0OxQgrn4QG
 8cPrFqYJFXqukUwpLP8+vhdJdnospSnG5KhmguLKSJVtNwCuUUf9Lp/VbvVdOEa+Kvl1QmjCyW+
 LfSpHdLVkRALu79Ma72wj5IE8jUJSQR5DeTcNUFTTgtmF6/PudaFv4c5fqyW+1dvwwTYjzpyCsU
 sGgXW/vYWmN/ZUGxqTQ==
X-Proofpoint-GUID: BTPDPqicr3AAgXPduJBoV0IeLAnvytYA
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696d2211 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo1y7j5tH0XFdPBYKCAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BTPDPqicr3AAgXPduJBoV0IeLAnvytYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101026_777994_253EC7C3 
X-CRM114-Status: GOOD (  13.84  )
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

Simplify error handling by removing two mutex_unlock() calls with
scoped_guard().

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..bbe1cf712965 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * The lock makes sure that either gpio-probe has completed
 			 * or the gpio driver hasn't probed yet.
 			 */
-			mutex_lock(&bank->deferred_lock);
-			if (!gpio || !gpio->direction_output) {
-				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
-								arg);
-				mutex_unlock(&bank->deferred_lock);
-				if (rc)
-					return rc;
-
-				break;
+			scoped_guard(mutex, &bank->deferred_lock) {
+				if (!gpio || !gpio->direction_output) {
+					rc = rockchip_pinconf_defer_pin(bank,
+									pin - bank->pin_base,
+									param, arg);
+					if (rc)
+						return rc;
+					break;
+				}
 			}
-			mutex_unlock(&bank->deferred_lock);
 		}
 
 		switch (param) {

-- 
2.51.0


