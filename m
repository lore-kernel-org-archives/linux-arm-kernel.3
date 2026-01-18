Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F172C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=XMF76nTaDe2PIjhENotZ7h+2Fx
	eZYufKKQlxrLgYvPuz2sn05IHjwqgF55/ytllBXqfyHLwPQA5GodNF798IWYqpLkEZbvIC5r/aQCC
	zr6qRyFzvuIu5iUPQ7XDIuAxg0R1g6XBr9YQd2sgFF48Mb660lsT1IejgvER+5p11t8rDOzaTlIqH
	qQZf1dH/FbaAipEQsqh5nU84pyMlExEZY7j8mMCSboypX0OESXsz3GFaPLQ5Ft3zPem9K3+BK2gCc
	WtTpmyZuIKQ4h/enGnNDVKb16ZLK5wUOLlUmGibRNFI7lomMm4abo2Bbv+wXOYoUXabxjmiLBPqaK
	9QKktiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEM-00000000fnz-27sY;
	Sun, 18 Jan 2026 18:10:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXE4-00000000fXL-3RYL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IEeNw4601279
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=EKd0XTCH2anl67j7
	+xoS3zAwyuw5gexTX4UDZDbMLnC5kc49ZKBvo/PRSfX8H9/mojr8PFpvgc3ME88b
	6axcSF5oETo3Ez0pN8KFbvoEFyhPrF7c+uSatRaUEvMLzXAK644V1AGsZn56bvQS
	bCZLsjvXGEqpYS3LnoXqvUCuqUI7H7Y11WJLUaxSPHHwguRGZ4Q7IimJmipOt+50
	Q6aw2Gwamt/7NCO5mbtrghH/O7wwME0l9ThG+ASTltN1oWwT7WSEvV1+2j1EvAR2
	nzqjOBiZ1kktZ82XgQPuWYmITvwpCe163Q9AwYzYfAfXeJQ2iw890FeCl+fRz5AT
	mTlM1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3kh2mch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b315185aso473904485a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759811; x=1769364611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=WGdUkJaPz1KaEvkXYrW6y+RXfNmNEmQZerqVEdlOTheUyRbReRFDDQ/d8PAQClEA+u
         jJ+E0lM+SKnpfdl/BH83bWjjtvOcUNVpQdQOt8ebZA6CWWKdp3pHgbkWhcvQZPnxlAni
         NAFRWPJy96h2Y5dBovWJPz3jxthIH37vbccs/QU2XE6BvAejI9G/xmmH/N9z08H0UGwX
         ed/Fu6JzGVnzpsFptke1D68Io2Nqf7vCTb7Y+UFSaiZ8aJhnBGUAKRUzvJzzWGt/NWDg
         r4A9UaAkoKbI4YEnGiZ1fnBoMQZ6l49RG0rtB5/dzVv0GIYP+gXghj96+1Nutm7TZKJL
         r4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759811; x=1769364611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=DhM9XIlCpFwd5Pkeav8mzqQAKUzyzmedzRriPLMFndGzy+wWcS3Z5XwE6KFxgyZC9v
         v0tzj+7GTpi8cl0DJWGcUdgcMJWE0PFORpUsIGaQImDs1gvloqkGjfSWd5tUb0g03ba1
         S5Ulxe0/oJraVgfO3hxyaNceFZVomkXs1MhTN49stupzVFfKg+ul33wZY7Yufhd9iulq
         EdxGflkNr82LE1mOV8UbxuC1DH5njl+oHw2USDgVD/QWONyZlbpzGI57eSkmzNT5PW8Y
         vCHsYoEdRB+TlPuKagdX0nhUdrWDQPGwhSGnGDnLbOnsFWNVR5hP+5gmcvrx4YI4JDge
         LbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4cPRy1xV5ThRxxcbjTd7XCL9XamxSWvwGqsm6wXQDmV/GUO9ps5tNVf3SR2bDNEpAHcJQW5uzvYQ+wT9490wZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxEWnxJF+rPZZHox+XDij/wqUANXnq29QwMucdNZ3UV+c4eGYW3
	coxr+nD20Rbb0mE959FaGmtYniVQZ5Yu9VJxnoxHghx/Ifpd0xTLmGuShLgYkGHvMdU8F5EWJVf
	XPeubWTqEEu2hXPBNmiGFShHVpRorzq7s3H3ug3w/HfsL/Jpanq76XvNbS04pVsROmYbVQhefAT
	+ukQ==
X-Gm-Gg: AY/fxX5+7ZcqxYG25TXFhN2sj6421aY0JbYMC7Gr2C5pKTJPObSuvydyn4wWcrEIsmi
	iiNSie+uR9rkc18fx3ljcovSnxldxq4MBzH2nQISe8I6u1anhedj4kVtr77SehfbjdUqmKRTmgz
	hiNydyp7km7lrog40aIiMQv/S461zfhfic6beuihZUMSUKckhc7YktJXdXElQcuxEHrbWFZlqju
	MSqJAaaSVn213OVPxYiryo8r+fz7d5ch5cBMNvIxuuoWBZuObCQk3RY4EGuEKRvMz6p14/Sv7Rn
	5PknsdjUIJs1GDdL8+GZd6eWdB1CxX7/9xAUHpuq6QgQtP5NFGOhW5g36Uzdp0FoatGdpbFjxEa
	Z+lW9fjSkyVw5WvkO6ngers3SXPyk1i2YeQ==
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391331885a.56.1768759811394;
        Sun, 18 Jan 2026 10:10:11 -0800 (PST)
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391327885a.56.1768759810821;
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:27 +0100
Subject: [PATCH v2 04/11] pinctrl: amd: Cleanup header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-4-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHxcMweZ49Q5Nba1wrVt3CAmG8iWHmyaxcHb
 TNtiusHLMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8QAKCRDBN2bmhouD
 10MfD/9Y8BgVbkm6bl+36BXzMgv1xbm7JsRk164MPz0v27NRR9/A7MTJxMXT6LNgShVq1djSxge
 6g8uCxUY/9zNFfEZbrbUevJi5cHtHc5/YUTCSNnot/lyVENX5O2KSCx3dYOpUdjrHDF8VX8ybHW
 wzM/tjZOoVQ7+gYxMukxqt3s8XLQOVct9PlD6qtPZmiFE1vab6GQQgLNVgM1lOYylEfR2ldNJXs
 jXDMtydYwc+g2dbP9e5rnGzbL2XkzK9qGia8zw1O8+ri8yvQ/U9eaHS+WXwTO7Vlr1QAxEc4oUC
 zKbv4wtZ1zeayUoWUv1YYDBGknxgFxwVQ+bjAyyLW+9wq3v6aKLX2CCdb7vhkv9IIbgJ0ieuMw0
 xixdCHOWfKQ+OYzmelQ7pXLN7RTHkKO8loGnPsXOAVHqo6wdt1FOQH1bb4xGl9Pd1K011ZOn4sP
 piveUlRUfW37nPiHBDROLc5yASzQBPjKA06V8RpaHwfC7I/9bVbiBuGyvVHdGhk6LBSFFKEjrBX
 UljGUMx3HN/A8uksjr0su24ucX5chRlqNVyncRJqPaYjbJAJ0zFKM64X1r9AnLRwEVfas7sruYn
 VGBFODgVsHuDAOcu5XDZBnuzDmqv88C04tW2Pve5Yakzf9c11d3W7hQUeI1nroie7c8OQHhI2ca
 a6OcgYeqNAjKKjQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX3b7lYWviRGoW
 d6tMNjUSEPL3xemdpo7yElCcFPpStpz9TJJhS+pcfnNQ5HeaHAE2XJe1h7LVDzC4ajDkF7QrNRs
 fgKSsax5J+TTdi62T35ZMBfGcst/jMqSWvEFlIq0qQ0VA3OnDeP9i5tNcvJ80IuBs8oHQj5zCNU
 KIwhOlqoHnQ357oEZeqeiLSz2UeeYxcraUWaMfnplOGyJBTeSQQVZDwEARz/P6802muj87xVcLs
 taQz4LTq3nfklZg9HY11pmyTbrtCgsX7CGthL/boDkNXFE28JJJ7tRT4EP5qc58AlRBqVGMBu85
 VF5Z+kDPOHWN7Zs7zX8gS7mVC4rxCYmB1ZNZ2JCbxqcLB1frWnZnxTGPBqFDwsYWSn6/5A06QOK
 zgjeEz7FSur4fYIcyDNihFJBMXYCY4j7hVXRapDFF6YRgHiZX4cjTZ0vMcjSoIDCNPlUZzfnICw
 FuWbhg2W6O4f10HzFCA==
X-Proofpoint-ORIG-GUID: VXO_kENx3FGKJSXwxDkcaWdLLD7qdl00
X-Authority-Analysis: v=2.4 cv=JcyxbEKV c=1 sm=1 tr=0 ts=696d2204 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VXO_kENx3FGKJSXwxDkcaWdLLD7qdl00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101013_977477_CBA59215 
X-CRM114-Status: GOOD (  12.08  )
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

Remove unused includes: no lists and mutexes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2dac5c71eb00..2af94ef56434 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -21,11 +21,9 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/list.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>

-- 
2.51.0


