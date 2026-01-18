Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02563CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=; b=K2G/O0UFGiCDn7d9gtkciVoSoq
	XUudjEisRT7LaHkgbpo38Z9GC5A534TPYYjuvRXbFGOOMS9AFtROBfIq3He4vKlJ5avAW04Evwrbj
	tQa8rfqvdNXtiqqARAGdA5h5drBnwnAznvTUAxEr8WhEJBQy815O4SNV98D1TDndkQi534UJfTJ6w
	ixsh0yD1UTan++wIPK3rnZ5+hM2DvjsiYYrM902YcpUqUnz7qu0WxaMkJJSbEr4rAh07BasBz3r8w
	o/pFX//z4otZ2DEkTvquEKRdb/6chw02HxoECQw3JSyrXDld2qTINlxvYeuurnFHVMs9Vu8cPr3Js
	HtAGm3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEa-00000000g2Z-3uhK;
	Sun, 18 Jan 2026 18:10:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEB-00000000fdJ-3ohM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I2kmeF1265162
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=; b=FLHmcbh8VeT0Xx7u
	ocCWXxIuvjB9tBx5LxiCDtIBDccJU379nP+UmbRcoyBcr+3edNEdpueWK9J+M9dg
	On/6tG/zQrLm8kIshV6N+0lPrvBMlNib7FFNeOZ8S06q3klUrsezMEtoWQSE7x8a
	iEZVX+2oCVORqUTkeyErZZCtqx37t6TybdAYQxnbiueXwqeFCCkNWbDhB/sk9zJO
	wyGw/a/G1LG/16y68VMQZIcKCntDh2BsmDjLvW1Mt+2eHXhh9/2Fc79ypv3cnxJq
	yymNkMmzrvQoaprecP+D3OwcUzhJd+k9MUIKezJvfuCKhbJaAMB2BIcNG0+2rc9i
	yD93uQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t72r46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a344b86f7so100108846d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759818; x=1769364618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=J9/enD4N3hADZVYZmXl38/R+cDy6/JA12c3JfWtvA/1qaIzQVs8IR5I5YVQtntzetG
         mXIcXYdOg4Qtmrdpws00yYmshG9lIrzOrGBFNpL++uxdO/FzCbx/qTqSVADYQCocyhUz
         6Ma+9qzasL/xq+e9Rt1hDLAfz7NKizdP6ynEJ5vkvk6wgojKPuZNiwHbfX9oRmxcUgfq
         RP/3cSNQwE7Qrt3/BWmo5tIX8+FBOTO82wdsMQT2RTtDk9iJVBsrgOOGG+FSHlQOJc+n
         otshTmLOSvkbHppTlCUSZ3Jz5AGWCsugRvbRoWImkt9A7X3kvGutQUvu76DfbVreBCpf
         Vk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759818; x=1769364618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=CwtXyHLWaLRwtbUkJ02kD6ruYTWXcBMauPgHHEiFMnkMvCKIgppns++s8x2m+/nd8r
         fdSMeJAwXc+XyYUlF8JpACt0Z8v1xoy6ZxTiBYR1VaL9fNs5mdItaM/553t+KUCn5kNx
         29GCBiNwygHRF8eaHdpNeZzxUZmdqRsc8aaH9fFTCk6h0mQELpmsny1yMdm/AeKsF2w7
         LfGYMvNU53axdTW6qsR6oSfSUHJlXXosfOoSONpKknHzwhYLdfQXmlrKR8Pz4FQIWtbT
         mnb6P7/cw5kVX2cAzFd6NiFUtmBVLhQF5D0bS7fXbMsjMWcHt2zDunDKieOBa5SNHOt/
         UpWg==
X-Forwarded-Encrypted: i=1; AJvYcCXitnJnHaXMvP83PVkFALl5jOshgv0B3QOOyP2vHDuxQrjurPfH1F20UF74js0WJzJcRaS79EKWRpljxDik9wTF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Wb3EGSODcT/x1tCxu60B2SvT9420Uz1yZbqkf3+lWFAJ5qYU
	3FULQJFScKQVQ9kdC0SRZgsI0n2orChT93MmKA5hnrinPMjPzEjoMFVhP6EsJBgyU0qo4uwWxzK
	XGABAZI31Dlcrq8DAnfAvMZhjLQRzc3C28erUcFtXFhDRvtFvEiQaI2Dh4glxTtO9TV5ggnwh+u
	OTpg==
X-Gm-Gg: AY/fxX6Kcicq6tWRd8Xw9BxQ2tRavm6HNt8tUbBmlwzFbQZPGpgiFuDaRs1sG2XPYSe
	BUbNF2fuXHN9N0KOXn1MyHn/mOjXMxEBs6nW1dEqPpnuLf2ATKcBPNytamsU4MqoaGgzbtzSrYM
	BhHxp2kZxgR5KezziNVcpC5wy+mDG0P2Vnmaa0zvejGaun/p1SCgVGG34J7yvSbipu0GgOVW82y
	1lDYOVqX4kBX/vTXZBpyWxkBdfDAK++Fdf9cBEax2knhG3/wKI1Vz6NvDRa144ZmxspDMhYEyCb
	aJ3Ca93ozwEyBujakkve4AbC7FkaonUpeFP9uN41Gyu8LzTa9Fh7T6ATQup54qMS9/Rgm2IhB38
	sl+5wiZk651WMWPZxwQwC1lrjmAk6m775lw==
X-Received: by 2002:a05:620a:4543:b0:8c5:af6:3efa with SMTP id af79cd13be357-8c6a67bcd01mr1262131885a.86.1768759818314;
        Sun, 18 Jan 2026 10:10:18 -0800 (PST)
X-Received: by 2002:a05:620a:4543:b0:8c5:af6:3efa with SMTP id af79cd13be357-8c6a67bcd01mr1262128485a.86.1768759817837;
        Sun, 18 Jan 2026 10:10:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:30 +0100
Subject: [PATCH v2 07/11] pinctrl: tb10x: Simplify locking with guard()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-7-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH0P3baB5JzE0xj4EquivvpaBBrqdpm6amOt
 juDbwiBC2KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9AAKCRDBN2bmhouD
 18o1EACUQyCgNzHZcDtTGGjP0XngZqctytCl/BhtXdiN2scGWH47PeJ1EbokGmcu35oOMeMoF/P
 Ai/yJjffW+dvyctYiUkUjdX8qhiC2jEMnBnR8HZEw07kz1ropOT3VtM9UNzcOP4VVa6XiU986gx
 +A9IxfYMZgbHYem1kw5uWedXNzll31yR6NXl+qm3YmcapiaWrXfhMQr5W3+Y014NvLqFh0h0nY+
 VxNPqKS0K7Oc6imDFiXRU50DUa2PRBddUY72TCkg8IbNE9LNnC+IouRZfrpjgzU+o1sRF5zlhhE
 I42rY1W2TwyfNm25FScOIOwekUr/tt7XHK3Q3KNa7vNG+uurb06yeOS0NW5zEIh+fH0e0tevRbL
 5txnHIVmMgsVP9qzzc3Br1lDZbc52FUcLV7vvC9rMpyHoyONur5eBHMB2UKz3Xqa2NBtZPpWsFo
 wo5+VFlpkkdh5y2iBoS1iDvXQLvtiqBpaHj6Suu/4MiSLX+PkV0aId7KrTqfcC2PmJjOYVi5Q9Z
 vShD+pW5GDt3E9qbXvJRxs0a8bvIwVXqG8pg4P9bsL9v+rGt5VbCvR6FyNIf67jL9QRcUvEn4Px
 54ALdRQJBLaZ4OkpCq7oTGr0tO4yjqNJDKYKdrn03h/zNzPbiXClpfTtiL9qzncdjmoS9IgEOV/
 vTudhlAhqE6ovOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696d220a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fB2tTgKqvhDdEbG57mcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: s4Sy1rdH93rX4AbFW6JH7LF0tzaZxIS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXzNk9WMf3OC0V
 UO3EQTHyuYx5FqRMb6HdJHDDTboCiXAgAr8BA6ppw9EN1ABE8CEdVh5dBXwWvyfLQAwTAWqdXFj
 Epgm9nPYhxCwJJ37fY56gHgVg37glppAFbZUajXU5D8F9E1w73pTs8lr8fhcgWS+LLL2Ut4J84M
 Nta4OvEaMn5L0Kwzgog2d+xBNTkNxZ79VTZnwtBdYi73rJ6TMEgRQNp4YIR6AINbQ14PGjWeubY
 JUHuvKOx3eGpAk4pst2x6Cu7XXB0qMYLf/L+fu5D1pNnVTPYNnlOw6q+G/sNaJdPd76ISDMi3RP
 Ao03DGP3g1wDGuVFJtRJDd1B+0pZx1wHUz57PUUOz97z8cHDi2ofKRVYP9Rqv7cb5/ZCkHpZSdN
 IprDPU+h3bUovvnYxrThYx+oqqw7UD+8JF2G/lJhI6UeSzhi3QgTkRdeMvM19Umd1TBSwWnkxmT
 jXngzj/LIgEth1lea9A==
X-Proofpoint-GUID: s4Sy1rdH93rX4AbFW6JH7LF0tzaZxIS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101021_759459_5270AD73 
X-CRM114-Status: GOOD (  16.79  )
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

Simplify error handling (less code in error case) over locks with
guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-tb10x.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 129fa51d13b1..3f581404a9b9 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -607,7 +607,7 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	int muxmode = -1;
 	int i;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Figure out to which port the requested GPIO belongs and how to
@@ -642,7 +642,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 					 * Error: The requested pin is already
 					 * used for something else.
 					 */
-					mutex_unlock(&state->mutex);
 					return -EBUSY;
 				}
 				break;
@@ -667,8 +666,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	if (muxport >= 0)
 		tb10x_pinctrl_set_config(state, muxport, muxmode);
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 
@@ -695,34 +692,28 @@ static int tb10x_pctl_set_mux(struct pinctrl_dev *pctl,
 	if (grp->port < 0)
 		return 0;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested functions.
 	 */
 	if (state->ports[grp->port].count
-			&& (state->ports[grp->port].mode != grp->mode)) {
-		mutex_unlock(&state->mutex);
+			&& (state->ports[grp->port].mode != grp->mode))
 		return -EBUSY;
-	}
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested GPIOs.
 	 */
 	for (i = 0; i < grp->pincnt; i++)
-		if (test_bit(grp->pins[i], state->gpios)) {
-			mutex_unlock(&state->mutex);
+		if (test_bit(grp->pins[i], state->gpios))
 			return -EBUSY;
-		}
 
 	tb10x_pinctrl_set_config(state, grp->port, grp->mode);
 
 	state->ports[grp->port].count++;
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 

-- 
2.51.0


