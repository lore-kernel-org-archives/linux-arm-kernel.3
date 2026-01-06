Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD12C47BCE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sz/H37mRcKEZM1Gqhc8mjnRIaCTY2KeQ9I4K+I9kP8o=; b=Xvj7PjC3BY7o/+BbFb1cbxZvlB
	/Q7DzKWxbOKUqZmXO3ieYKQ5/jp5JtPPtimJNMY19zh5BuYErROQI95ANjZQn1w4/h5UAJTw36DPw
	RuAeGmLgYNb8XGbGGZRwtFPUl8xONaz1yyY0dTj3ojq3e13G7Fnr0X8jaNIEXEQOEGc++naYgNRpP
	D9LJHWdzSJiA/bUNphGbhxjexVelhm+n2HehWP8DqvgOggtzmAADtG5LYjPc//lxXClMOZvSmMCpD
	QpUQOzQ/eAvH9KbVaFJ5k05lJ1LV6z7/gf42qwRUPaGVsEtgzOqbyJYKs7JkOFripyaWv65QqeTGA
	rrqBsn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AB-0000000Cfod-0y4I;
	Tue, 06 Jan 2026 09:15:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3A1-0000000Cfmm-3NfW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:15:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QYbw529180
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz/H37mRcKEZM1Gqhc8mjnRIaCTY2KeQ9I4K+I9kP8o=; b=HCVtwo8N1KifHXa5
	OwySVnXsxhSHc9dSIkb/ofOdb5bk4S8XoTTbaBAnKBoNwcf32CPKIUNJBN2qGi0u
	XCSDgbc8tU1Qh3JmXAEy1X9LEPDHng52T7a2jFy7jWc7Kgh35P4r+iQwjj7wjbP/
	96qkGj0OgfwcVg6vzPKi1KJBlkCxkTPVY9Ny41h5sCRHETS9Ny6Nqp5PrhNPNxR/
	UbjxrjPwLze3brDPkj0Qwn7Wn8BFkAC7weUFrH4+VHQHQ63VfI6soomLWcfFPRDz
	/lipZAHcIv7dfnps95+s/kPKpQhmdMk3TXEppxyNVb3AtqZh0I8nLVBP1mnt0w6u
	P9eE8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu2j05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:15:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so20690331cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690928; x=1768295728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz/H37mRcKEZM1Gqhc8mjnRIaCTY2KeQ9I4K+I9kP8o=;
        b=G6BmDHyZsfMqbhoAryP8JmNIbLj5Rk8PR3RvgBpFcxwu519a38Wv50q6eDDhM/5MNu
         PLNB8eQ/CdbTPuiYomFTm1aupR1DxLkxrsqdSfeY0qvKNgwtmNzFcFIA8m/Buf8CBIyG
         P/9nMiGQf8wwx7ZZIbGlRFU4BBYjjPAvJggXQezR7QD55ywub2lh88R+VpIhbneUWFI9
         93Ar73/ip9izH7GPiXula5LRq8T/Qth31aMiZrZVl9U6/sPSDB8gc0Gv+3F6qz48xLZY
         lYqiFpyBzVxyY5/MgQDOlQ5OBKkl+/NPjQlkXvmc2HJtsNYPWBifT6yXVfe0/rjy71I4
         nzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690928; x=1768295728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sz/H37mRcKEZM1Gqhc8mjnRIaCTY2KeQ9I4K+I9kP8o=;
        b=Wc/KG2OVbma0zX2SgqkAWNM+F7HMgM5mU82LQ82/8COwFofTWAL5BgbhJp7OhMRIAD
         CcZTSJu73LiuhiNubwo9BTaEyZPa7PEwCWeiUw1MyUOETFvsRdoBykithmVrkPW/2kp7
         axevjnIUsUnvThVBfwZulvaxqfGPX5Lk5EHbWBkKokaKUqhVGv3moOT49JYy9rBOJxLF
         +Rl5/Q0aMBdgtefntYMkcfF84YaYSCZqHjDraJfLBeSZgO9TtwlHZZRS/wBL0jqgxSYi
         pZ9cHx/yoRsESvfMUIDbs8ymt6KtfnBtAhqQWyZ34EOgRTTfNEE0gZSw2zTCCbMy/KDT
         C38w==
X-Forwarded-Encrypted: i=1; AJvYcCUTIKOFq6TIAB6PSP4FW2hCgqwF64ECgh4Td1ZcPXv6NFcIgfJnpUHCAH0k3dKFlKvG7tC991I2wMpOYdJGEBuT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+1vfAsb3DM9A6lZ4Xjc1MhrnuF796CuGWL/YKMMmjEGYXsnVB
	MS+ZyCNg9cD9Zqw630Ph9X0wxpw644EVE7WiHQlyx6ZDF+x3XeSr6ZRsyPuo2zuLAAdSk1aBZhq
	5dZgX4QffMRczXdNYnOhTnyAK343pkY90PByTtmkYSl2rr/iL19cZzzR1cufElyCH4mX6yhXo9O
	Hp8Q==
X-Gm-Gg: AY/fxX59eTX9qIn2uJnWU9xAF/3omIHoaItMmmqPmhPp3U6hmqgigAZsFfiDbS0GRCm
	TxR6Ht1yvGK6F8Je2uyww3wOYnYPBhgHwDu8KbGhiSuoWqX0mOJlemWEqrD+FlDNylKPUlfi5wW
	o9dj3W+WNR+ViAAGZ/NY2WaQDv64Ss1Qtssot3uc5mjLYUsXddUhQ1xsEIswkRDCwesn2rM/eoG
	9lRLhgExKjyhrhq1E+nqhq76O7Zu9zMelFutzksU2IuQ52XdDrnbC+fAeL9mF3KRR/xnQ0qwtpM
	/AU2DmDeXAUomP76NUOBqx1wyOL1nqdZv8wAByrSxmtdjHbnUtkpH4Pzly91FYAQKiFQg3Eqgwp
	UWQObqMVnuYYoshpAtu+Xwrn05GylL8tt8A==
X-Received: by 2002:a05:622a:230b:b0:4ee:2508:3934 with SMTP id d75a77b69052e-4ffa77f608bmr25087531cf.67.1767690928288;
        Tue, 06 Jan 2026 01:15:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk0HCaFjf2DM3cIi5iNwtwmjyXb0B25YmBVLhnJpxIPS8z3cDYv8bJhscbR5U8qCmjWrXfcw==
X-Received: by 2002:a05:622a:230b:b0:4ee:2508:3934 with SMTP id d75a77b69052e-4ffa77f608bmr25087281cf.67.1767690927866;
        Tue, 06 Jan 2026 01:15:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:11 +0100
Subject: [PATCH v2 01/11] of: Add for_each_compatible_node_scoped() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-1-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9sqpJR/1PYKlbU1KPBe/Ap+/bFXa4ydA6Vbe18Jb0Ns=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlc0qGhLlz6ZfK39HYRttlvAahKJuYaVofdC011WB4DswxSW
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpXNKhAAoJEME3ZuaGi4PXluYQAIby
 pfeW86Sd8tcvltXVqInweG9xpLLOpmCo8S4FAwxxsF/RgBLOfakmi8GOOTbB25Sv1Hd3Giw04C8
 aZaH0WlBQxfZ3tV4Vv43iZkahc4XGsAIk2NydXukBkYCzB4uj8P0uHnNPlaTPIoZ0BLlg8tTbDE
 Nwrbd0+X56fSgUVZuC3KKQagev0lQsGb986vI97tsPdysbRfzN2IhPXrGZHkzsAev/Pg+4MmtGq
 wlQ5kTyL1eypzR6PMeFZcPb9kVOwfYVdQpkjIioUeo4E8uq775cJa1XiJSdC7FBvqg0Gp5NegkW
 n3kkNLmqPYOU7upF0/aHM4ucku1nOLWVFPKCDmHK1F7GE8N4QKzS6qHCg3KC42LZLjP7xMA+6n4
 U4dLHCsul86wfKmLjTZG3MD+mXFg7efUUufDhexewui4js/WZgdiLQlwhcDQJ2ds4x6Ey0rZK6I
 vjytAmOhmwEGJNzzBvlF3ZQmqfCBdJPdEtRYU0MTaFvUxw3i07gXWZweU5Y+CPdNKLoOlsAgi45
 sKoG+f0XDuNX0Q4W66+jqTO7sJ92ijIChypoSgUfpfwPE1X3qP+C6MZCRqPAUzJ1UV98ZLX1G3y
 qi9pmRK1TY8kp8cpW8Op8c7Ybo822HfkmTzQww/JhHEdJ1+D2wj1k7+1o5cGTzaW8mR8CKsiyI8
 HSf8v
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXwGgkB7gacTAI
 zA1agYpCQOfwnxDo1cs3YYmHZcxuAinRaOa3WzCjjFYlpqzVcw2v3BuA5+nkH7bbmVmB0EbFy88
 i1Khvgz6TM0xDXkM9gKTmIxfxYKtqQAbpNmX3kT3tl+ozQx4KGBIzRIzeCMsqPVxDcMSL5PInqI
 bznk7eDwd22LeHYaoP+9WMVgmjEzAgTGCUrHvfc0WBzbWrUxMiUs0C8JAE5kajpmNaA/hWOhJv6
 HprxpcHcGEnqMLQ1w6cK22khKq6p/ZA9C1ssSgJPYoVsIMzJKIfFjNT0tCG3ScGg2L0csxcKfSZ
 gV0M4jTkfZdV3lqT11K4RPr3sEBHYJcFz6u7DKavy456rNQdIcs17VEgO6f4zwiWG+ysfBk2uLg
 9GimtWE4qiClXI0hxjYurDrnJjD3hBNpIdrmnCIT6Vpe/GhWfYpbJ29X2Wi1pGcOVr0G93p8QiT
 IVlM6Dh6zcjEfrMmsQw==
X-Proofpoint-ORIG-GUID: Y68uEOiyXg2JvP8OqRsZ_aHvSXzPRw8t
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695cd2b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=onCjdZOYdOMVgCgPd3IA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Y68uEOiyXg2JvP8OqRsZ_aHvSXzPRw8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_011535_747216_89B80A42 
X-CRM114-Status: GOOD (  15.65  )
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

Just like looping through children and available children, add a scoped
helper for for_each_compatible_node() so error paths can drop
of_node_put() leading to simpler code.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Prerequisite for all further patches.
---
 .clang-format                      | 1 +
 include/linux/of.h                 | 7 +++++++
 scripts/dtc/dt-extract-compatibles | 1 +
 3 files changed, 9 insertions(+)

diff --git a/.clang-format b/.clang-format
index c7060124a47a..1cc151e2adcc 100644
--- a/.clang-format
+++ b/.clang-format
@@ -259,6 +259,7 @@ ForEachMacros:
   - 'for_each_collection'
   - 'for_each_comp_order'
   - 'for_each_compatible_node'
+  - 'for_each_compatible_node_scoped'
   - 'for_each_component_dais'
   - 'for_each_component_dais_safe'
   - 'for_each_conduit'
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b4..be6ec4916adf 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1485,6 +1485,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 #define for_each_compatible_node(dn, type, compatible) \
 	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
 	     dn = of_find_compatible_node(dn, type, compatible))
+
+#define for_each_compatible_node_scoped(dn, type, compatible) \
+	for (struct device_node *dn __free(device_node) =		\
+	     of_find_compatible_node(NULL, type, compatible);		\
+	     dn;							\
+	     dn = of_find_compatible_node(dn, type, compatible))
+
 #define for_each_matching_node(dn, matches) \
 	for (dn = of_find_matching_node(NULL, matches); dn; \
 	     dn = of_find_matching_node(dn, matches))
diff --git a/scripts/dtc/dt-extract-compatibles b/scripts/dtc/dt-extract-compatibles
index 6570efabaa64..87999d707390 100755
--- a/scripts/dtc/dt-extract-compatibles
+++ b/scripts/dtc/dt-extract-compatibles
@@ -72,6 +72,7 @@ def parse_compatibles(file, compat_ignore_list):
 		compat_list += parse_of_functions(data, "_is_compatible")
 		compat_list += parse_of_functions(data, "of_find_compatible_node")
 		compat_list += parse_of_functions(data, "for_each_compatible_node")
+		compat_list += parse_of_functions(data, "for_each_compatible_node_scoped")
 		compat_list += parse_of_functions(data, "of_get_compatible_child")
 
 	return compat_list

-- 
2.51.0


