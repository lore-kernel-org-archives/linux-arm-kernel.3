Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85870E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUGF/dKhzzg=; b=FzO75w+xl8ulwAG1Ti3C9RunNx
	Ysc0wZ3OE1X2psXfaB2Ih6o4es8D/95ROj3PJv1e28Dq+Iap45Ra3MmD0Fuqb6rW4rFF/pWncCv/y
	1I2WAUtIVjAvsmsNpZnfVHfAJ4d7Vy+iSyygur/imvFjcycDMWCZIPRQuN5Ao4IOLHAKvy2KAaXue
	Ds4b48mbXJJhTSJq6lr9T4CmOO6Dx1Gr90gnXW1FjCrTnYb08X5rc2cbxG3QuYpb6RtesbnjeGrE6
	BlzscxTbeVcuCoMtZ46oCFrgoqgt8iQRMN5uFLIuiiJYujHvnRo6QKZw0Im+YmS9vuHXt3tEnu2yn
	/zkXUl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3MO-0000000Fbwb-2BQ2;
	Tue, 23 Dec 2025 14:27:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3ML-0000000Fbvs-2ecM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:27:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9uYGS1530068
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 14:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUG
	F/dKhzzg=; b=Xh5icLOoy8CU/2EzGLuFAqRy0WBYl8KrKW9HXBk3aR6vLYBTiqL
	SOwWsKei1Zf6s83ixUg+C4EvXDD0q1JKfrLj8bBoJAz0ewklu+M5ioIMqKRtrQlK
	Q+rxIqhfn/2anfupmKmhOkevUh1D66rP0wt5vZCFfJZM5FnygtPwPvVrWcTM96v8
	FROCNXybd6PwFJcINQ4EZ2RJwJrgme7Idc4ug06d4IidPz+F9uyPolgaopUuUF+a
	JwORV5TOtDP/3Kk3XBeL5uguqVHtuodRF2l13AZigdERWG82l771/RtWyKArJioy
	uaf6tBYfQC+1YPG9shTQHrOsq+830me6OrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y4731-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 14:27:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso53558481cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766500052; x=1767104852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUGF/dKhzzg=;
        b=Th9LJND6ZoEdTe4hNszwLY4a8gUURJZNTzYCsA7ItL7KS27Usu2RLxBuMOFwC8aF6J
         GE4+Bwp5wFeixEGVzNVwd29Us9FixIdZgrSarZD3HSqMUs09J3ECqNgP9gZnL5j9FC6d
         kYql9blurzSy9bKUH60zxKUFMF/jxm2bTGEFJ5SwO4MHBXtI3z9USLeEFktMHFKAJtci
         lxB1vvupi4gh9bgyqW61bSqZE6m1IJnUP/4VT0z+6ULYpsvJpNCouoqT6MoS6szo6fyW
         RL+CBpbpyvsz4R8ZLGP2oEblv3Aeoe+9jaKN9gvoEkwW9Vz8fyWdwp0y9MBxZ3JOMR14
         BlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500052; x=1767104852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUGF/dKhzzg=;
        b=BsGPoC6wl7p/zdjnaTiSQ+AzLv5TuK538ZvlXaicgbMAIH6KeamREp2tMgtDphh3xQ
         rQHW0VuHAx/1I4SJqLaDzNqHwUygtsjsZqiXWzCG4UwQjKV6FKuAN3dzi8UAtm3UYdfp
         eErNzHKHSNXjueyzbP4+IHyk3rdKHkm2qP0mrZNeCF7MFL91bggrgcCIe2EZuquf/WbE
         xPX7ZGNMYCxMGlrTDWayZ8mQbb28NDzgFVs3pPKEcxhxvz7TCNX+yEGEbHCT139hbOwr
         NfvcAUnflBqIkrCbtw+gnQC6n1oQzCLzPngkaxydBYw73iY4/b89rzM1YcxZA/ZHwCnc
         EwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCUDCHufG7ItvJ3jtfwCZgstmte+EzsWelZmUppsXGF/YO5RYZuSHZ8WHaYA07IuZg4rTTCwbNxxby495O5VwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YytlRlly/pnhkfN1gmwAZOPk/wQ0C3oveb2k+LKjvgr0o6ZZFyF
	WC7Oi6O4l6x3AmneNWMzf7qPLGO8t+HtOY4ISbTUVzxL2JHdjhwSDT6fGcq7rQ2BpogqVBTXURC
	xS4aStN47qmI3uXJtjvjp73xF52+w5+jESzXRQRCCd4LBTlc8IFfF/GAw4gesiJhpnmfWNsL+QB
	coFg==
X-Gm-Gg: AY/fxX4iIrHKnG7X+ds3DCzy+kZAkcv7c/vXKgTOdJXJ0KckGbIphH9DPoYULH0z0Rk
	33zAlc5A+tXI8LC2K3NjYaC3QXBXpvLYTSUWIkfAwtxnk3YI4yEps0Sq1/YYkF+qu7MEnoeDwA8
	iKBpv3PcwGVpIvVoIh/pUG+Sr8bFSIjKPwvSsjoPCzwNoSXoqFYH1BLxjeO/iQoa2pGyczWDcug
	x0gsAUyEmHYs7HtNd6A+1NQKbDlUGySdczwFWve/AWBPWNx9eNcy88mLueIKwcYhli7jbY0EGGD
	sMWEOfFYKHDpc/sHl8GTVYNJ+v3ONO6tAWzqiVyw7+1AOBf7aPzMbcEMqcfVACWhRGpTdzNohKr
	W9n/R8Pn7QgkVo5bI3BBPFk23GSIEi6uyOOtGgEiPCoFwygCnqf522D5oa35rMffAQ2Y=
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr4210401cf.75.1766500051677;
        Tue, 23 Dec 2025 06:27:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHx+8Q5tBp9PpPU08NqJiNNbyikoFy4Mz31nrV8wUMn6eSen1oEP/1OGcxPp/BnoRTrVnnaNA==
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr4209811cf.75.1766500051064;
        Tue, 23 Dec 2025 06:27:31 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1436477166b.15.2025.12.23.06.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:27:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] Documentation/process: maintainer-soc: Be more explicit about defconfig
Date: Tue, 23 Dec 2025 15:27:27 +0100
Message-ID: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=znQnP7Fd/J5vrSbB2hX4Rw2tMOJPzDja/Y8g2yuXw2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSqbODFu1+y29Lt26g5cF4++AiVq22ztuhgxKR
 XuzH+B6gZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqmzgAKCRDBN2bmhouD
 107MD/wIICO+f4FkJs5tEZJvvejnNMjbjFPpr4VfVOutTg4JZowCjaxlxhvjq0qkhxbKTPIzVCV
 FUpp/a1djgTc6iyN/uiE8gr0To9k3RvG+pyAkiUTB802B04PGsgnSK2He1X+XLLLCpGRwH6rztH
 Xtw+0SZ4lrE0cmXM/Zi0GIL2ZhMDTxmPNJKCsEMIjmKKDsX1uuW25tVwKQHCZwhi8QCRTw8wGQl
 Ent/elBNLhxTHc6NE+UK7Q5eWeH72mW9ViaoXflDomzLeYLiIbEBKxcN76GlXIsPQuWjX3EgVrA
 uTnfsnjwIm0WTNGRzpO5YOi9OgtX7HtazOqB5pevbp1g5BGyAP1A10ZXQY2xkoeF+F0Il/zqVeg
 XFP4AsjCaJiLBjUW7lYMWpAM25ZfifEScWn97r44K8xGd9GDqt7bkSowCQSIqpLQEbzGcDlYT45
 WLXdVGquWZ2GBOX5HlQbM+wCo5f/m4DJ0/Kz2wI669cjlFHb6P5JUcomqUFMUDYCxulnGKAYW9t
 YzAuCTG1oovPFMlgiyAgjcYsBbnG3U/6UHB93ZRQLA9FHeuLiDIKIK2URd8nqRRg2bvAc0RL/dL
 CcufkFpQKoZzDLdfjsddfFV/o4p0Ugl0cg4CJomoMiHE+ZK8Xvji/SBQzqwhF11kxQ6/t3Yu+T7 YwuSYEFw7uf+d5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694aa6d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=u2BcFdJyl2au2J_VFtgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NDPwZmGsQ1ICsQLObnKhISWEuUSRkPkO
X-Proofpoint-GUID: NDPwZmGsQ1ICsQLObnKhISWEuUSRkPkO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExOSBTYWx0ZWRfX06tCbA+vhiD+
 0FLlOOS8CdXx2VtmpCU10L9Z96NIF0bcZfgVQ0nlcTMwUViwfGfi/uEzXHAXF69xwhkIpygfw6a
 tKPi6K6L0TBgQIpIUREUfjfSdAplkKa8KFbkgS7WcrU3hPtH+Sz51wnQnum6SNLFCFU+cWQeeyz
 a/BKBOvC684KS1MhzxsvNUEAGkUDfaT6LHSu56SZ/Kwb27zgKvLpyyHAt0x6WYVU36mFKmnhfxe
 fEogOz+mnuWnnwFleK10pLR4K7uqJhUde+7l3LMqJkslQ1oSZXpCHjS/HeJGIDZrJsmy/KbuBP7
 F5zG0oMF7hQD5Lc79odIWcYt7mvJP/iIgr8hbIczHuh9BEmciVPNBTyh/jKvIhkWg8mZDRe2zuS
 RRsYMeXtBsaPExBgbr3VyiwslSEzw6LPY5v+oJ/JeTnrl/Ffnbwh8+IMTFkop4BD/wyDL8VVx1Q
 hgdjeRn8zrCrHQ7UaMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_062733_696768_7050144B 
X-CRM114-Status: GOOD (  15.74  )
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

It is already documented but people still send noticeable amount of
patches ignoring the rule - get_maintainers.pl does not work on
arm64/configs/defconfig or any other shared ARM defconfig.

Be more explicit, that one must not rely on typical/simple approach
here for getting To/Cc list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
---
 Documentation/process/maintainer-soc.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 3ba886f52a51..014c639022b2 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -57,8 +57,10 @@ Submitting Patches for Given SoC
 
 All typical platform related patches should be sent via SoC submaintainers
 (platform-specific maintainers).  This includes also changes to per-platform or
-shared defconfigs (scripts/get_maintainer.pl might not provide correct
-addresses in such case).
+shared defconfigs. Note that scripts/get_maintainer.pl might not provide
+correct addresses for the shared defconfig, so ignore its output and manually
+create CC-list based on MAINTAINERS file or use something like
+``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
 
 Submitting Patches to the Main SoC Maintainers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.51.0


