Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1336C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q3ovaYbtyWvTPy1NCdh4shU/gvReKJ7FezthyCu9rnE=; b=mXkbdoeklCeFmwlancSvUhcybx
	3ojn9Goo73mlhWOLfm6FYD8L4KefXmNdkLJsLjE2LbJVdhBf1/gkAhTDVedYx0cdcshjMkQvRcsCi
	XRgx5yYVvCp+UctOsthxZBrSxHpKsn4Nbf0YEnM2gzqJ3fasHJ9y8V520Lo1fQpVCUvMeIH1FX1Rr
	B6h2mAnzfPtPlvcq9gqQrwxvJ9uemXWUq2PSbo0W0R4p6kJuDmDwcIK8igc0Snw24X2XTiNC0XAau
	/agS3LFVxrbSqDjNME611a/wEOQ0A8KhfqjSRIkAdh1v5Ot1Rq7QDhilNPiuUWvB0tZ7qJOJwUqrm
	+MbyqFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OvN-00000007GVg-3mtR;
	Sat, 29 Aug 2026 19:41:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OvL-00000007GTM-1yZc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:41:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxpf71743620
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q3ovaYbtyWvTPy1NCdh4shU/gvReKJ7Fezt
	hyCu9rnE=; b=d/f/+HHKdAQBAqMLf+Af5NPzyxKS9WgTtGkYRmH+Bl5y2xV4Cm6
	ypdS3X9LxySFt6jQIPdVKvUqJEhIilzGMEJSsHiWFgNoNYzs82B4lnMsDEXRIK42
	4++oQUB9orkOmUbeDj+NAZuKtXKXhLbgfACn8ulkdT/nFuogYNGgYqyOuP+PIHjp
	Nm9kUcrKgpIfVc0xI+WoEtxhbbKGlRu/UnF8gZY4qro5eMM6DZf3ql673l5Sjcs9
	YCluBaPGMX8LDc8/AcKT/jWq5vjH0NaCy8MXBzhEf1cUxxXAL7RUWJXNuyMJxTAc
	Rd79OWFqwIK+0vD6MyQZPo6jAGuAhTTzytw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81g4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc16ac179so30407131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032466; x=1788637266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q3ovaYbtyWvTPy1NCdh4shU/gvReKJ7FezthyCu9rnE=;
        b=YE3Ir6fFw+lsstexg7r3j3FktBrWb909zDWLCKw54b5+X4FZh4rdAfLNpxc0dwmDu1
         rFbOJuoyq4ufJA0Ob+tBMvv5qbMtQkDdwtdW+UCPF5DGiov6MdUc2JhwBSOu6v9R3E5y
         a4jJrF8Z9o8MyHl0ruvHewl9zh5oMbI6GlupENK4npO79x1t3RSMOupz4GRmhWKr4Oh+
         OCPRBecPwnDaASXjiLJzJBNfPvki4duQ9Vli+7CBN4Eg85ij5frS25ySX5f8Lpg/TBUB
         z27PZY2V9ymd6ACBSHT13sdAVrZYPL00ShbmrvHYGcZg4apKksEybxcxE7XzuKiq9dwa
         OeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032466; x=1788637266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3ovaYbtyWvTPy1NCdh4shU/gvReKJ7FezthyCu9rnE=;
        b=BCiZ/TXYEZm4Yky7czxVlLcjmLFaYpzoBB8phchrvBGChsNCl4QQpcFHNviMFnhmxR
         RO3NGsJciXmgv+XCY1RRocG3IETBUvz/bxv+PzYi3iK61djF+tstlwZJsIfGw7yOi+qC
         0qT5NpQYf+TnRcsWrpHM3C7uA/9Ot8KzObwtX+mZiWFnfQFij8dcq90jmscKple9ZW69
         hRVho1DtREuIp/7yYfqQhSJkYxcIOPbZr06iPXGnbzr9XFMlzE8vuK1aRsJ3f0m/2nzu
         8TbRrs4qeeLTK3gl5fYQS9EXk2gOaVHbblP24q91uw1sArroUaBwRDnjr1gUZ5H2BKp4
         Eqkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4boQ+fYvY+UAUddqOGJ/Lzh9hpKpW3B7iCVYz/JVj6SWsebtu1sVTqTJo22ywGfBSLdMbsm1lDIS2k6VnuH++@lists.infradead.org
X-Gm-Message-State: AFuF++kfRunABC0OGfgX1e7Dciv4kLuo0/4Kt2MNqSxX5mzMOy9iUkvi
	LwZlkS74tXzvwQ9KyGyb8qLpTFhtNa8yZLJB+hn8QLRNey0cKjhRU3Zae8DyuXEg52hTiUoAJqZ
	tkedYmVhR5ISSbTRrazrmFzU4b6Vr/EXoEHg8IcEDnyjlyu0moJSd6SMdyK7V64BSEPSrBaVm3k
	ZQ9A==
X-Gm-Gg: AR+sD10gJ16EUhjbiLsReRoeB1eBZPjkrxwroiIso+DphrLhZDVSO9mwX+I9RdBMQpO
	T/6PMagLt0dgOaEnuL81+r2sooWkipiwRo2tJtlLOy8yulFEBnPZZrVSe+Ba9QyN9uFmnHC4Q08
	3ihyrWqckta+Qb3ZaRwnAyCBEPydvIGEBrtE0xdq0Q8Q+Fi/iDEmFw5taISn8bHomC2HM460Aoe
	tFsUT9Q2EQ+Su5n8oO13NzPxdPQjLIDUFdDih4mo5RhTMCAWVDmrHfG7W1bSdCxjqfg0nNjN9I1
	Y4+Im3gsEcNB5xvo90y7xoJ6k3tWNVghf82eF2W6Xh/4GyBXqO4zHO5p3qfwUncqPYzyln09Vch
	2VFyVt7Cic4mFKAU=
X-Received: by 2002:ac8:6906:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52fa1bb79c7mr304455501cf.10.1788032465984;
        Sat, 29 Aug 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:ac8:6906:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52fa1bb79c7mr304455121cf.10.1788032465612;
        Sat, 29 Aug 2026 12:41:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm243390275e9.15.2026.08.29.12.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: aspeed: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:55 +0200
Message-ID: <20260829194054.107929-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lCD2rnWylJ/gXC+S6T2sric6v3SvqHkmqg2cRrHiHMo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXGQUFLSmG7+ry21ITbphcniWDbQTny9DzW/
 uj6+C8Bx02JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1xgAKCRDBN2bmhouD
 11eKD/9r3+XtKocDcW+pxNJI51m+1e71/pIgJBXGflKkNxHvdYF5/H1EBW9204QVUbOlY8LHAeo
 12dvJa2Sj/Yggm6H3VzfBRbGYXsGV905x2qHmiuUeY7SxrM63MydbAmvSSzVm2z5jV46TTOR0hU
 Ed/GK0kBcFijqgjvbmaBBbij3jrqnaXMZYTvmB9IHi0CWTO8Ss4JfyJVSXnKsroc7EaUJJaQ3uV
 7D4WmDfsAhLi3ux484loF+I6pFnEdkSjQFO/NJIXT5X4vDFymZWDqyd6+zhxQSJor3r2fyp5PnC
 rxB79bTY4vn4so9xauyXexMs9vTkOCas8Nqfqlsfalk6Iibbv63MRGBaSUg/2MDHkd3KPtTaMeR
 yyqtmGj8TjVD2HQbQWKjdsipL91niG7Rdijqq7wdPDAGfczgERm6PqGBJKAqPBAYMY9MODHjwlN
 gOMakH04wqABfZsnu3lvwped9hwDwdfr+qwWPb8y1/oR+s5GGE28iohdQ3QryuQrGU6XV3J7uXR
 KVL4mNUZwyMJfQTPFYOIaFOmwVhL3YwDL1wfYEVTZNdZciWYgm8SUttXDiPBKxAsvAh9jYIHcqA
 aHNuGC9yJewTxdTALu9Rnvoinn57ZKyB++Eys+gK11mu6WjfN6dbZtCKqBqFl/6vDIh0ihWz+iE 29hKMHMetH3UXMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4u22oZ8TDF1XeQJycoO7F-xbfUuiQ4EC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX4YOLOjT+eKNb
 pL2IEt9mXsXqVeSWEd3EAGof0gurPQUcoDnDMffN9feAzSqzC5Z4KWc8JRtTLLNiGMuxt5KbdW+
 4sotuvo5dK5BcyoctNXYB6oRQMkAm2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX7vldkGM3F+6/
 etJANeSNvPaMiZVZ4PeG2A4QLr4L7jEchXWhZy7XqW0FdYzsiqKAjD3DWFXTCMG5Dpsx32oTY1y
 JDImPeH+TQllGHN9NkUU8Rk+l5TAlcsOzr1MQLhbaMnYd7rjHLWzSE7RA0KAc2FamFZh+9OsJzv
 fdHxQrAXasqVCjOv58bBHnUz7H0DvKtHojJdAz6FcWhJ6IU+ZjmA2wIuQUA/dWu9LxDIw4fzjih
 CP59WmizEBJG0f3cRzyFAi9KtcPPkRCq1cK2XMLRlipe2bpwCbviwTmrD9NqPXxU+rHcpke4Har
 SVcWuG4k7PmgX8noi0zTHqP2BQdh/wRbQvvHTsntmzQ1C1dLrB4jP/hkFb/6wbj84OZXGiHs246
 A8yKuXZ10iuffUjKnXcR1dUs4ddp4SOYVQoZWmCvZcNjWjLny8wa383gmfSAXYO4McKUNupcLym
 oCawX7GaFdDwWa+b5+w==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9335d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4u22oZ8TDF1XeQJycoO7F-xbfUuiQ4EC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124107_514382_61CD3199 
X-CRM114-Status: GOOD (  14.03  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts   | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
index 89907b628b65..d235ebc3022a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
@@ -213,7 +213,7 @@ &gpio {
 	/*L0-L7*/	"","","","","","","","",
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
-		        "led-rear-id","","","",
+			"led-rear-id","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","presence-ps0",
 	/*Q0-Q7*/	"","","","","","","","",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts
index b961dff388d1..154a2eaf8596 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts
@@ -75,7 +75,7 @@ &mac0 {
     pinctrl-names = "default";
     pinctrl-0 = <&pinctrl_rmii1_default>;
     clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
-           <&syscon ASPEED_CLK_MAC1RCLK>;
+	     <&syscon ASPEED_CLK_MAC1RCLK>;
     clock-names = "MACCLK", "RCLK";
     use-ncsi;
 };
-- 
2.53.0


