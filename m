Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5C5C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V54WJAF4OpAFQCcXdZBPujT7oaJ8xChgOl60kdfl5GU=; b=v42d5wM8Z+6rWaTqGzlxIvBgVF
	H167+gv9UjsGieqTXnnBtkffHdULSweil/5xt1t/XE3a5/kfRqmoTFtfdE6kovor6WSNI+ZAOecKu
	WH1GkzViJV9GxXWnillzODWlHfl6ci6DSsljRgxd3NgVTkN4XOJhxqdjJMPu6ni1Q6yaueoEVaPFt
	Cat+9lfUvhDEJIe6AxgdiqsktMSlKt3GZHXl+4fYilKupFSH/5dQZ/zS1Cj7w8vXVIaiol7dQmPOJ
	PjI1Xfed9xJkefOwpg1HrYOWU7uEkYTFrSP1rbxmt6zGc2imTRdD6FXVrreIAvbnKcWs7UzqYlnEp
	A5pYw+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWo-0000000A5sl-0HkX;
	Wed, 16 Sep 2026 20:46:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWi-0000000A5qi-3BkF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:46:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFePbS2432172
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V54WJAF4OpAFQCcXdZBPujT7oaJ8xChgOl60kdfl5GU=; b=bX9DUS2GlI05Y86Q
	kdhui64lbpu1Zs+aZ1wn10HsmoC8AtwiDUkUoYoGtrMukztcxO/8hl5cJ9Jki8vT
	EWt0aKr26djOKX0tmcenInvAylVk3B5jY1cugcEb2AbKDZQqM1WN5syWxVrxxs9O
	i0wlkmRzNpHDKijVjinWZCzje+9eNFGTaIRfGgsO061Aig9QCbFhmLuzFbaLw46T
	3K8de543CQWFc/zbwTi8FGcWX7SBqevVV9UBzINXEv9087o+faYbv0RP1B3lEsQa
	q95NG2gtWPMOkevhDQT3T+i26W5Mn7aEwX0hCt0hT/ArQ6q5/z65V6wzxGRcjdba
	l6z26g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthntfgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso19086385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591603; x=1790196403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V54WJAF4OpAFQCcXdZBPujT7oaJ8xChgOl60kdfl5GU=;
        b=Wk+ocPDfW0lG8gU5IYyREELiOEeaXBeuklYk1yB3M91qhRcrGq7/tvlR9gPEQ8ydzm
         xtXO681tu19bq9IVGGu3IhzbDdAAvYETD/5FAAsgDhM8kZw+V9mUkL3xdCR4FrV6sY0x
         SY1M7xjrtRuROpM1Zr2hMrLriVRdWWJSn79YqrBW38mXXBnYE638iu2icu2G9wLYqZWQ
         c2dfWMHaPe9yK7dWCeG2qyOX8iJFYq2p/2WwsshimJS7d/wl9SuZyC3jI1A/X3QoxiZi
         gwJYUx2/iXl+dNXTud+UCTGXuJM32yR6CcMSp4yM9bOperSHKHdYPoUup0myCxKbWijJ
         4mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591603; x=1790196403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V54WJAF4OpAFQCcXdZBPujT7oaJ8xChgOl60kdfl5GU=;
        b=OPjgIIrtF5UNWpr9oQgBVDkH5oAFTG6l4qCdpQCi53aqnZiwjaHML7YAgWJ45EcQSl
         QihPNHqY54J2ub3VBDKZqDgtA8f+cftZ7vxEneGJSysqcfkFKNseaL48rHNL7E8bbnkH
         1L8cbKeH3DffziEaeH4Ah3Z/2R/6vF/hAa5s7mv6Gk+K1r9n9da4/+1haW/84QvJPGTf
         CnuC915kij5bbUqO8hZNAEeLI0cub5Byzg7flbFvZKSW1eiN18lO/ZfGVQmSUcnLRsGh
         DsM7kh+fooVcR4A59YAeGzBVy+c+zu5/gQGtmgHMGB7T5NgddKVHBNgWe4MOkt7F++W+
         7Pmw==
X-Forwarded-Encrypted: i=1; AKwUvBzjPQAz9hptBeR5pOzef0wHQ6Yl3DTlfWgqgkGgYe2EXO9boFlmvuF7TsTm2jvIw1V09/AuKO7fHofm6MP6jiW7@lists.infradead.org
X-Gm-Message-State: AFuF++mAiTsiHjsubdyIlBwFRj1ysqwEuW5BmGYLp12s170jUhGpYICO
	EMAEsaibVGxKDVVrX+WbmK/Z6ATKnsY954SLMvFBd/XvgA6O0AoagIUqUXFSODpD3KAESHiC1qr
	6wEjRVzq5fwAn+pkH7MwcxDYeqs9lTA8vfDbg2Qt0a+jAxCgpvp8mA9H8cG2NJm26VdTdtiHOLR
	hxGQ==
X-Gm-Gg: AYBFou3bhN5yw9rgJAFs8mCYwshy9M1Cy4AQNn3hbCOukIXTyiPyf2c94BzWGjo2/wh
	onRk3eYS58GhW+P6TWu5kkBv8O08hXvyTeYDeA6lr/NkV+zmpKVcH2zZaZqs4wWGPghfJzcnwjp
	+vPlXFnJqnbwYOs7YkaQLJrECHXPxODQxbI8UA+2jcZOMK1uS726mJbKfGxbhUDKvgbH8yKitXB
	yXyjiHqpbd6z/nKQp0ePVUvAHx1IH8Ul/pTIanpGmkb3vBEmBnbwbMeMJPA0DDI3/D9385BD6u4
	0QSDBfqK/j2xW0AZZ/oBr8nkScU7pKHi3D4gHzBPbvPzAiblgGJgScJ2rnWQUvgiiPEe8VZFsq5
	tU37btV+7lyXIlxkQeMLemro=
X-Received: by 2002:a05:620a:4888:b0:937:3aae:1385 with SMTP id af79cd13be357-93bb76e453cmr671860885a.11.1789591603032;
        Wed, 16 Sep 2026 13:46:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:937:3aae:1385 with SMTP id af79cd13be357-93bb76e453cmr671855685a.11.1789591602580;
        Wed, 16 Sep 2026 13:46:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 22:46:32 +0200
Subject: [PATCH 1/3] dtc: dt-check-style: Introduce way to disable checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-1-81b86685d068@oss.qualcomm.com>
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12124;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+39inuOtk6dvWrV4F97ZO+lWq6rs7jFZ3XYSkUU3Fnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwArlUKzY+H14ISF+z0eYpd51l7pctWiN7s5v
 6eHTfQRa2qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsAKwAKCRDBN2bmhouD
 13RZD/0d3+cV8drCD4DEHLJYopCkMUyaCCSHYuNoBs/OL96OafohnyVrYTuP9FabCI9znb0k0b0
 Ps1M2xBPSI8Ir7zIo856Adrpk4F1k6eejLJKX+r+2wEoS9uJ4NSwNZC7dcbDQkdlyNYrY7UhuZn
 IBHkoladbBDfL4NYFr9vvqrwW4/VbY7Ej324lQacI/WJ5tiHESeSaCqFw+vzcHnOVaCNMQ1mgQU
 EKOUE/+wu8ZLMixCum0rweC4O3+M7K0MUXVH4Tx3IzI6yJaUheED6PnM6bCkYSPjKbTwhbiXSuX
 ltdnkR8w9/0/SEFxR3jq5EO4/AHExLTE3ivPcTBYtodpizfOsePrtiG1djvVvONk4E8inyCH8Qb
 Kt5HKKzlrWN778o9l+rKB1SVqy6/wylm0/I1JEFrXCPAfXsEoif4ef0svul38ox3lvW24RG50zp
 Ou7qhlNZzfKkKjh9/RJ944IulgoO9wmQA3OaugNWDSqKs93mbhlWwS+PALRn61gFiTGkf1xKp3B
 ope0VmJb7A9c29XrC2k2oa3MpEsSMfZ+cYD5kp9i8vb5MZrVH1kw0+ZVqPnNuWt8gRhhoHCbPWw
 JlGZfHLogvDqm3sMPAOOEZv3MZXCfKFS+1KT+ivFRUT1F+v160yzOmF0Ekzn32c8BVw9goL3v1s
 ZcDYInCXHgTFj+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vnJJjOgl-e75f_RR8OqJPhBtq_28R5OW
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aab0034 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bBYTsk_4rKjt0MGUfhwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX6gQtLVcOPIh8
 E4PHyxjKwiqxXt0ANlM66T0lD7AoAMftdW5V9kyixHwI2lWMmdKFS+OObAacUGh1hzgimVfGVq+
 Vw5ahQxkCl3J8nAWTVHpGMPOcoVoU9V6EINULgzq48vGxm4kRkz2/o/UmHI4GNdcwuhHeoIHTIY
 /ytXqiS37rYPubpEzfzJXpYFEkhut1AqPF36oYcGGTLfdTDnI2uuCiDGGD8Xm0vbOYPPv7o7TiG
 vajkIvsf3EW4g0hIkZEoGtRpxB3ZjAH5A21ZjRRMhT0WCJBEBXnaGDPV7vy+a/98PEy5q0YFftV
 SBdYc55zQsCV9dnnqn+49jWXn2zK8v6XvszDfbzUBBGB22wjRLwNW17IcInYw5NYBzA1XDNBeFz
 IrqxeoQVdJDK33cmF2BkXozv5D+Ce3qc31j+2PNF3u4iFrCXIBLE7UjsbyvvNyRmAu99l6dlhmj
 P6G7+IGOdAb6kJLOG9w==
X-Proofpoint-GUID: vnJJjOgl-e75f_RR8OqJPhBtq_28R5OW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfXweo//OL3xcZw
 Xupqa6yDeT6eWj8+SLbgNKbsc8rwyS/WStPjX+2CH7gCUVJ1NzRLU3Sx6suPsf9z8I2uy4seRfK
 o5FyxkKobD9cMyxYx7mdJGQ/hFbl6HM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_134644_811908_5532EE09 
X-CRM114-Status: GOOD (  23.15  )
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

There is a lot of old DTS code, predating stricter DTS Coding Style,
which is not worth fixing, because of impact on backporting changes.
There are also patterns which violate strict rules but make code a bit
more readable.

Introduce shellcheck-style way of disabling specific rules in comments
in DTS:
  /* dt-check-style disable=RULE,RULE... */
e.g.
  /* dt-check-style disable=redundant-whitespace-strict */

which can be placed in :
1. Top-level comment block of a file: applies to entire DTS file,
2. Before new node: applies to that node only,
3. Before a property: applies to that property only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 97 +++++++++++++++++++++-
 scripts/dtc/dt-style-selftest/bad/dts-suppress.dts | 52 ++++++++++++
 .../expected/dts-suppress.dts.txt                  |  8 ++
 .../dt-style-selftest/good/dts-suppress-file.dts   | 51 ++++++++++++
 .../good/dts-suppress-nodes-properties.dts         | 49 +++++++++++
 5 files changed, 256 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index b8c40873905c..96f9c10a70b0 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -54,6 +54,8 @@ re_cpp_directive = re.compile(
 re_dtc_directive = re.compile(
     r'^/(dts-v1|include)/')
 
+re_check_disable = re.compile(r'\*\s*dt-check-style\s+disable=(\S+)')
+
 # label: name@addr {  -- label and addr optional; name can be "/"
 # Per the DT spec a node name may start with a digit (e.g. 1wire@...).
 # The address part is captured loosely (any non-space, non-brace run) so
@@ -342,6 +344,94 @@ class Rule:
         self.applies_to = applies_to   # input types this rule covers
 
 
+class Suppressions:
+    """Parse ``/* dt-check-style disable=RULE,RULE,RULE`` comments.
+
+    Returns a dict mapping line numbers (1-based) to sets of suppressed
+    rule names.  Three scopes are recognised:
+
+    - **File-level**: the disable comment appears in the top comments of
+      the block (every line before it is blank or a comment -- no code,
+      no preprocessor directives).  The listed rules are suppressed for
+      *every* line in the block.
+
+    - **Node-level**: the disable comment immediately precedes a
+      NODE_OPEN (only blank/comment lines may appear between them).  The
+      listed rules are suppressed for all lines from the opening brace to
+      the matching closing brace, inclusive (nested children included).
+
+    - **Property-level**: the disable comment immediately precedes a
+      PROPERTY line.  The listed rules are suppressed for that property
+      line and all its continuation lines.
+
+    A disable comment that is not in the top comments and whose next
+    non-comment/non-blank line is neither NODE_OPEN nor PROPERTY is
+    silently ignored.
+    """
+
+    def __init__(self, lines):
+        self.__COMMENT_LIKE = (LineType.BLANK, LineType.COMMENT,
+                             LineType.COMMENT_START, LineType.COMMENT_BODY,
+                             LineType.COMMENT_END)
+        self.__suppressed = {}
+
+        for i, dl in enumerate(lines):
+            if dl.linetype not in (LineType.COMMENT, LineType.COMMENT_START, LineType.COMMENT_BODY):
+                continue
+            m = re_check_disable.search(dl.stripped)
+            if not m:
+                continue
+            rules = {r for r in m.group(1).split(',') if r}
+            if not rules:
+                continue
+
+            # File-level: every line before this one is blank or a comment.
+            if all(lines[j].linetype in self.__COMMENT_LIKE for j in range(i)):
+                self._suppress_range(lines, 0, len(lines) - 1, rules)
+                continue
+
+            # Find the next non-comment/non-blank line after the disable comment.
+            next_idx = next(
+                (j for j in range(i + 1, len(lines))
+                if lines[j].linetype not in self.__COMMENT_LIKE),
+                None)
+            if next_idx is None:
+                continue
+
+            nxt = lines[next_idx]
+            if nxt.linetype == LineType.NODE_OPEN:
+                # Node-level: suppress from NODE_OPEN to its matching NODE_CLOSE.
+                node_depth = nxt.depth
+                end_idx = len(lines) - 1
+                for j in range(next_idx + 1, len(lines)):
+                    if (lines[j].linetype == LineType.NODE_CLOSE and
+                            lines[j].depth == node_depth):
+                        end_idx = j
+                        break
+                self._suppress_range(lines, next_idx, end_idx, rules)
+            elif nxt.linetype == LineType.PROPERTY:
+                # Property-level: suppress the property and its continuations.
+                self._add(nxt.lineno, rules)
+                for cont in nxt.continuations:
+                    self._add(cont.lineno, rules)
+
+
+    def _add(self, lineno, rules):
+        self.__suppressed.setdefault(lineno, set()).update(rules)
+
+
+    def _suppress_range(self, lines, start_idx, end_idx, rules):
+        for i in range(start_idx, min(end_idx + 1, len(lines))):
+            dl = lines[i]
+            self._add(dl.lineno, rules)
+            for cont in dl.continuations:
+                self._add(cont.lineno, rules)
+
+
+    def is_suppressed(self, rule_name, lineno):
+        return rule_name in self.__suppressed.get(lineno, set())
+
+
 # --- individual rule check functions --------------------------------------
 
 
@@ -642,6 +732,9 @@ def check_line_length(ctx):
     """Lines must not exceed 80 columns; tabs count as 8 (see
     _display_col)."""
     for dl in ctx.lines:
+        # Ignore suppression rules, which can go longer than 80
+        if re_check_disable.search(dl.stripped):
+            continue
         yield from _check_line_length(dl)
         for cont in dl.continuations:
             yield from _check_line_length(cont)
@@ -1180,10 +1273,12 @@ def check_block(text, mode, file_type):
     lines = classify_lines(text)
     ctx = Ctx(lines, text, mode, file_type)
     rules = select_rules(mode, file_type)
+    suppressions = Suppressions(lines)
     findings = []
     for r in rules:
         for lineno, msg in r.check(ctx):
-            findings.append((lineno, r.name, msg))
+            if not suppressions.is_suppressed(r.name, lineno):
+                findings.append((lineno, r.name, msg))
     findings.sort(key=lambda t: (t[0], t[1]))
     return findings
 
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-suppress.dts b/scripts/dtc/dt-style-selftest/bad/dts-suppress.dts
new file mode 100644
index 000000000000..1602dc74776c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-suppress.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	/* Wrong rule suppressed */
+	/* dt-check-style disable=child-address-order */
+	a55-pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* Should not affect the node after this one */
+		/* dt-check-style disable=hex-case */
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			/* Wrong rule suppressed */
+			/* dt-check-style disable=continuation-alignment */
+			interrupts =  <1 2 3>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			/* dt-check-style disable=continuation-alignment */
+			reg =  <0x30000 0xDEAD>,
+				<0x30000 0xDEAD>;
+			/* Ignored suppression not followed by node open or property */
+			/* dt-check-style disable=child-address-order */
+		};
+
+		/* Wrong rule suppressed */
+		/* dt-check-style disable=child-name-order */
+		serial@20000 {
+			compatible  = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-suppress.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-suppress.dts.txt
new file mode 100644
index 000000000000..8d1e7ee4db27
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-suppress.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-suppress.dts:15: [child-name-order] child node 'a55-pmu' out of name order
+bad/dts-suppress.dts:33: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-suppress.dts:39: [hex-case] hex literal '0xDEAD' must be lowercase
+bad/dts-suppress.dts:39: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-suppress.dts:40: [hex-case] hex literal '0xDEAD' must be lowercase
+bad/dts-suppress.dts:47: [child-address-order] child node @20000 out of address order
+bad/dts-suppress.dts:48: [redundant-whitespace-strict] extra whitespace before =
diff --git a/scripts/dtc/dt-style-selftest/good/dts-suppress-file.dts b/scripts/dtc/dt-style-selftest/good/dts-suppress-file.dts
new file mode 100644
index 000000000000..8c3220ed27c7
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-suppress-file.dts
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/* dt-check-style disable=redundant-whitespace-strict */
+/*
+ * Here goes reason
+ * dt-check-style disable=continuation-alignment
+ */
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	/* dt-check-style disable=child-name-order */
+	a55-pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts =  <1 2 3>;
+		};
+
+		/* dt-check-style disable=hex-case */
+		serial@30000 {
+			compatible = "example,serial";
+			reg =  <0x30000 0xDEAD>,
+				<0x30000 0xDEAD>;
+		};
+
+		/* dt-check-style disable=child-address-order */
+		serial@20000 {
+			compatible  = "example,serial";
+			/* Redundant rule disable should be ignored */
+			/* dt-check-style disable=hex-case */
+			reg = <0x20000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-suppress-nodes-properties.dts b/scripts/dtc/dt-style-selftest/good/dts-suppress-nodes-properties.dts
new file mode 100644
index 000000000000..e65b152cfa1e
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-suppress-nodes-properties.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	/* dt-check-style disable=child-name-order */
+	a55-pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			/* dt-check-style disable=redundant-whitespace-strict */
+			interrupts =  <1 2 3>;
+		};
+
+		/* dt-check-style disable=hex-case */
+		serial@30000 {
+			compatible = "example,serial";
+			/* dt-check-style disable=continuation-alignment,redundant-whitespace-strict */
+			reg =  <0x30000 0xDEAD>,
+				<0x30000 0xDEAD>;
+		};
+
+		/* dt-check-style disable=child-address-order */
+		serial@20000 {
+			/* dt-check-style disable=redundant-whitespace-strict */
+			compatible  = "example,serial";
+			/* Redundant rule disable should be ignored */
+			/* dt-check-style disable=hex-case */
+			reg = <0x20000 0x1000>;
+		};
+	};
+};

-- 
2.53.0


