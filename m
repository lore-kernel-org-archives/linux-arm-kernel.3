Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA11D26D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=; b=XFHBbgm1lxS9F7G4KX2q91XeCR
	QMnJOX3Y+DsL6fe0LbjBsDD8/FR3s7ZWbOzicpdNTACcydJbjyUIa1XQ3AjjrxgivV1c3l9ZP/vl9
	+1TyVwABGeUQxh8Aa4AMD2wIB6N408xvxtqqUAs2DGe+nZtUXAk47er9EGngEM30kvD7K81DGJiKX
	s9LCx8C+9aU+4QAEfwpmuqazk649F8GvaYjs3fRtaGzbn0JJcSayTjHtSKuQ/sK4YzhRCDTDqZ6fB
	B7erWo/17HQ4RhKO4MMTMZGShAerv0vPq6Q6ADyGG7hdkHyWuxHDwZNUX4GKvYprBVLYYr1ysDnco
	JwUUW65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoU-00000002fPW-042E;
	Fri, 09 Jan 2026 16:58:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoR-00000002fNl-1LdH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2rQq1062741
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=; b=T/T1wnZqVNpxiZp5
	hD+LFonCaQQAFUllDlTuU68BvCYFxaJ+DKJcdJ0VdJjZ9V0EulEXir1pbSlxoTQc
	PAK0TPhlKXzOONBBjHcXOGB2fazcViaO9itphbnlLfDKHxUaD9Ok79bMH2dmz1l9
	fsmIO/JUYI1gvZR4E6lWUN/TALDirKH6zoTGvKi47pvt7i6vF/3JdK/GNjXkpidC
	kSc8hpHnDBQL2GjIMYUHGIPZ6TND8NTY3H5W/MfPJP2uxhT6gmjXEy9ueF5U+8Wb
	SlBU8BfQ+tfnSnrMASPNhDP8b8FyMfvqGfp3KRNJSkEPmMFSMfladaeu1M0KS+nX
	dZXMNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f69091-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2de6600c0so1126099185a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977890; x=1768582690; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=;
        b=aQi5y8wvc6tyAo3pbDFbqglayKDBhRA7BJlvbHAPHiyQi7ee63EsN4o9snvIGiY8yS
         5ygRkdXCV4I8/DnsuPXrQGLx6Ko8yGRSHdAGzheCX8WIHFIws4/Eo7U4WHMEkiZCmD+1
         KSv2XH2r5BtE/5oZsl/nkOQe2HTT/OpnI7BgxTU8TFl2VKIjiYa/uLhgyNa9CRG0nhyY
         94kn2uTKClwVXtDKoIbERSPN6g+UNo8+3vKYalpCCw/pDQKo3LkBpW+uuJcN6A+VWagj
         /qB6O0uBnNOgZvTmR34j8/+AqJAt2fbgcn3TCCceuhJAR+YK7wOEXFzl41vdxHkt4A75
         Npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977890; x=1768582690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=;
        b=G45ldhJuYzUQlaGySuBuSGkPkrsOn2vPbsWWKEVCpgvjYRqjy6qimuiUFh1eiLaCz2
         GLZMv3yaIjVY7VaiiciyXg8uYEWfzTI/1NYlZ1hHR+P/vtdj+A/pjDyG9Jce5SFKI5C5
         Qa79KHsfNqklUxuKa1mZCSS7UB6xkKuZF63O38vCpzlfMCfmt1cmCpxkJRvdJB4LRHRz
         xiwBlIVKN5Y7CCvQjQ+aGNs05LcfnUiIrMiy2LNCyX7odxcakAACixCu85noVLk9mFm0
         uyEOrzEdQp99Gdccu6rTV1QnMZgzEaB1Es7Flqa0hCN+ieNPvHO72AJcM8a/ujKpuXav
         PTtw==
X-Forwarded-Encrypted: i=1; AJvYcCV+SmzYkPCUCtgASgSQaiBIdtjysYNFQbpZ48Vwrsgdx01qkyphmUh/nmvBHFIe0S2JVjV2oCROkdDc0NlIbAKU@lists.infradead.org
X-Gm-Message-State: AOJu0YxBLCYV/Do7l4mBIsTgR716SiI+xh3cW4TR6XVYqKHQcA8pXBge
	gPZ3+9I6K0Lhs3WB+XXyDxsQnQwPB/t6qY4VL6K4/Uo98o6PQ94TErhG5MH/+KUHM1UC3apnfnm
	7uAp/9KREjoS9rT86L/m3cC8m9dE0hwin9ariM/6j0Da0m5sy6j7CZi7WtZVDfzM9UM48kpY4SS
	G44A==
X-Gm-Gg: AY/fxX6V4i4T17GMV/B9KTreQAENGiH9jcnjcsTzZW8lUkNuJsbEGyjKcWq7lx/+gMl
	xJSEETNyW5sNoS20JgNjpJdVF4Orl/isGRQY4wrF0h7EG2GLugYS5xNnRJhY0D2LNHrjNN3t+eQ
	eWF5XMQuWKOg4WQiQI8XQb8rZLalgARmvvV/7DlOg5Gq/NfwANigOE2ikRxq3IcRX71LjCd81xu
	80n5mm5DEzrE7o3tafpw/Tpz3ZmmWEJ2lQ9gqmxbHaQNRdgfbKNUjrK7zkt6tu5q6ULbMdRtMq7
	YrAVQDoO4VCD7qVhwDrMg31YtpTz9d8qoYhxtgWwfdZEMOGRpqsImTVEVejfVisABg4KyjJqxJ8
	jtSEI83wCaZoBQ7fSGZl/dkArhYXuif7MlQ==
X-Received: by 2002:a05:620a:450d:b0:8c0:d16b:b09c with SMTP id af79cd13be357-8c3893f2882mr1251306085a.58.1767977889662;
        Fri, 09 Jan 2026 08:58:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfygeLKT4WxsJq2f59hRzHmtCZgHcvEaJnVArr1Jk26l50+rbiaa9DJq621bHoEVLD5i4iPg==
X-Received: by 2002:a05:620a:450d:b0:8c0:d16b:b09c with SMTP id af79cd13be357-8c3893f2882mr1251301585a.58.1767977889107;
        Fri, 09 Jan 2026 08:58:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:45 +0100
Subject: [PATCH v3 01/12] of: Add for_each_compatible_node_scoped() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-1-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/vmRDAbY7uS1UoozvlR9f7hg8o56xUtijAL2sU3FXNw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTORfxtpTacTz6ZE5ouIOsI5kOFpz+cbr7zLD
 7GEBv5R2FiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkQAKCRDBN2bmhouD
 1/R9D/9awDSv9Skzn4Os8FgAZhOeF+IX6AxHTJvFa9IvTukIrYSoGBHRYpZ0E0boMZR+6wG+f3C
 TiIx/LQwD6zud4Q0JtXfs0AQ3WWBZBsmnclpVFTDzdqwnl0YEf+OI2xR2Q1eFsI+Kb61KWrRScQ
 7wD49DB6MdqQvzephOQSNS3tNRncHz22nL0/3YGj5I+JWwXp0CkH3jPFC12GoP2v9F7X5QYxnot
 rQpzcblFkV75PdYWX8Sm3qHfCSF3YNxO2twZNCEQmGIE3LKR5J91J6IgCfecO1mAVLVnIxKzz1S
 6znhWZcLim5uKCoXLjLVdEg3Fn41FkgH4E5iyn5QWGc6iV5Ghoy21ydJcsBc/6zS+ezS3zdsjaA
 d8TqL/6osDfqfRNQu1Pp+2/vaU/0gT6BYIwd+Dt/Mcmw6avWhUBZH1Z/kKepP92Y0W6JHFAOKbD
 4wC/PrnocUb4wMm+Q4Li5a+RA13hbJcI0/M7D9j8stwiBur/XhRU/QdQP5FEk5n2qi1FlsUd+ip
 NuqryOarJ+okJFf4pu7X8dAbBtYX1jeUBGbVSnoNZqFMTSfSZrjT9RC3S6zyMR2ZQiCgYwDvP7K
 57ueeO+ZSE0gHgCjXlATjeQqeniZpoq4FfRTULcgQ3P3FgdBSDAuLeegLPBdSmHFtWDgscg6Xcs
 Q/QoA7qPzEiiMxg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=696133a2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=onCjdZOYdOMVgCgPd3IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX535j1hBk3YEg
 YkId2LvkVC8TxQxZLlrSueFwZ1X61xTEiTS1G4N6nPv/+9gCQ2Y9G0S62PQ7of1vvYh/8r7Cqko
 waaq1O/iL9fE32Ir8HB33qTrHxpxQifkv4vp98kZgeEJjKcu5PVKAw5JUoauHd27iTfZgyQ5shc
 FTqkUT/U0TqHFgSeT8rQ78pk7llsxx490iFX4f0AhcEBXaYtIyS7KlJ3B19FUYTgvzyxx+MXUAX
 0uuSo8K1i8M8EYD/5GU7R7EW+4zO6/0Uo25px44hfeZim3Sdz/o4LS7NyJD2J8qycTvqXbacEOU
 6RE4Nz7SU5/y4U/VNHa8n5+kvsaYUcNsm3SuiQuYmKCgKVZiQenfdbTuHIXtztKlowWSo5/Ob83
 i4lgTkEVR6MSICI4mcPFGyVkgeP/B20zON42aZu0Awmb6HoxlkkeACcWeEUCisIEEeY+bOBcl1T
 ZSy9SfSMxOz2cy50fCg==
X-Proofpoint-GUID: XwpCYxyal-_xSycwQpei9wbzqB93pui0
X-Proofpoint-ORIG-GUID: XwpCYxyal-_xSycwQpei9wbzqB93pui0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085811_500223_1915C256 
X-CRM114-Status: GOOD (  15.23  )
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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


