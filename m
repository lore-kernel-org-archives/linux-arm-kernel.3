Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBC1C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PjFsoLdjz3lbAFz0S9PY2FNskMpGHLSA59veDz6yFE=; b=icnJEWL4/+tSlBOSRNYF+UptqW
	/i8NzTF4FFpygoG6FTLlwTIrONpIsA73f1TZ/O6qezvD9iLgpV9O4Bg8W3T7YWovCzNtWKN53A9xN
	oKZroLr8vFeYGTardURNbTkfnQGomweTwg26hKqJ8B5DR/CbBrZw3GP60H+GJcAL2upQr+Y83yE9b
	+5XY3UwICO5D3T5GYMOaK3nQZvovDbaFl7yhbrt7CYl3hcnNGiNDY8Sd+8axu91CjIYNfkf6mCROC
	I7vl+48tLTQK0BNcpcW8AUMDI+5WT0K+NoigHChxMHkrUhgfnADvnuZHahHe1LKfRl71ovbgKgu2L
	xGz43QyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZk-00000000OVw-1bDv;
	Thu, 03 Sep 2026 18:54:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZi-00000000OUe-1ztm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3eXW1209694
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PjFsoLdjz3lbAFz0S9PY2FNskMpGHLSA59veDz6yFE=; b=f271ZlawdDSjuap0
	f7XPf6Ki7lvPqYiVXxJcFJZaYtOp4PpyH4r0rEdXUnuoBeHv9QqqaSWaK94iU5No
	vE+J6nViVtcHtUtWDjwyQhPTD/qmEdATcFnUE4HCVbDaj7keVWfcELOlJPkZUb1e
	Kh26+VqUtlmRaiLnKNoRFJd4wwLbnXwFBItByRGDDtB0uVF9PX8OzTNXZCAYmUDp
	g65rArQ15MVlEsxiA1aH/LeNpgJp1gZOUIzChso4W6i4R+AV0MjZm4PwMPgdiejY
	qDL1WpjzKIcZFxEnGMAYBTiYYOE6RLnoQR7yP4f4rTrLZmuXhujy+2X0OtAvhhey
	cJ8Epw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p72e31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so231229a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461652; x=1789066452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PjFsoLdjz3lbAFz0S9PY2FNskMpGHLSA59veDz6yFE=;
        b=azwEMk1RI366wfNR9Lmk022FkLFgfUh996CHbo9iB2Ltz3eyLZLhY2tLUF5PFl9PuA
         ztIN+OPUuIlKe/0YQsXTHJQrSLNFlHR7oX6w+PD67AB3sj3vZam0cFtp7eaCZ0e9frXx
         uWjpKZ1vSSXp3Ta5j9txSsbX5vyhgoKhvgVJQyCgCJCQuX1Schiq3nxrXnFhZW3W/qnJ
         Wm2OJVHwz+F7CjJlgedO42/LVDMhg4KXqqYOx1l/gEflTg3MhPt3BIMDXVxVwTdmSgQH
         4TMFP1Hzsu88xphVbyT7o+Xhm6HJNRbW7hYLJtniUDWRiBF2sgub1Vojp+BqrzFbCDv6
         hDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461652; x=1789066452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PjFsoLdjz3lbAFz0S9PY2FNskMpGHLSA59veDz6yFE=;
        b=RbeM239XtMDBX2Yi5RhuPSPvuDma6+bdDnHP/rJKlDK+5joiMHVD1807E34BbyNc3s
         0OTIa+pf/QDt+lFbvr3bHEp+c4JTU0+po6JBWxqwYwL9GZnsz0e0UnofqIbWq2yySCO5
         0Zcj/WQiZEi7f9g3gmEimm8jqAuiskvso3t6z6yQ9vrRlXONtJnwOgpEoptNySBxVERr
         eJxRAEUb2vXJAxeKQ5yckXxUNoy/Cfz2dY/LbYfRWF6Sc6rUayyFlRvYasF628qww4fb
         GMuvQ3hzsVaTFNU9dtrAebNyu6+hVd0XAyAnk8llWjlLH0HmRYPG4eKayJjqwDpsc21B
         hmbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu3x/4bX3vrX6+VliWvqrNvjcyVVKOhLOYE0+Qq0V4Y37rf7FP684Ro0lPBtIELnwxs4t6fG0EvYszP1CJnsVI@lists.infradead.org
X-Gm-Message-State: AFuF++l2Msg7fOFHfc1+JvHdFn5s+Rs4ALWWEPZNhawnqbBN+QDdVeM0
	NzxGI3aYo5RYIM5vBci4vM9g24Xdb/0Bk/g7y+zgojogJrTRrHcphjxtC0cQJASEkL+QfFBnuvq
	vNEx5xcuAkTTN7UgEj6D/tHUHZ4bEz3nPsF1plQnlcqelqkL9ukP4RCf1nVJUjLGg62r9zPZl5c
	DfCQ==
X-Gm-Gg: AYBFou2xfgbZcc7XZhbBALy/A+srNOEKs9XwRUQdTBayaeAfWvrNJXFLUBPaHt9ztKx
	hS+RsApSGmGD871kWSMR0e6Lfh3NYWxbdRVv5z4i0y9z5Zzdt+ExgISZwsyB/A9zxxVhcOUGVfm
	7m8d12M2/vdBcZyRBzpfL6seLtEYzZCklu8JolIciQ/UShpYVfQfUPa8mJgGmg39GRK6mWZNfR1
	EoN96imqKB5po65xqPJ19HnVuC1ea9nwnJ/qQyc3jUwwF6HuhQWSFQLhIijHfhLV4eu6KqTB117
	eR2i1Y7UpZ1p0tPWeBFlldXZQfX0eyBNeSFy58K2ULReCqDeRewNuPKrOJfzVr8dSN51zD8ArDt
	ll+pK4R1JA5v/2Ue1dbVb7SDORh4heQ==
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr9549223a91.4.1788461652040;
        Thu, 03 Sep 2026 11:54:12 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr9549167a91.4.1788461651588;
        Thu, 03 Sep 2026 11:54:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:11 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:44 +0530
Subject: [PATCH net-next 2/9] net: phy: dp83867: add regulator supply
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-2-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=2110;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=eAeA03T9lPFg+lYkanID++2D7piJ+xmNgdrmLwHXhVs=;
 b=x8k+BJMfgeIA9V79xwFwkhli5rEq070Ry+6o3SC6wsTxHrrE03KNCKUMqPOPL/UC8NES8w1xv
 ZqcqjmRtXccCwCyJoxOyN2R3Cfk9wAMgmMAn1re8nimq1tozDzMfu+C
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: iBX5lTg1RZyHwIINlRvBYmn3yt3W8IbP
X-Proofpoint-ORIG-GUID: iBX5lTg1RZyHwIINlRvBYmn3yt3W8IbP
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99c255 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX8smchCtBlhge
 83yV0zIxra+mJoYL9JFu0W9vKG7KBihnyD2iduG4k+uV31lDyIlEQwRXXYONBQgzYRRoYJNPDYt
 svo9o8RMM+ByfW9oO3pxJTQVvfSQsS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXwy37FyASTi3X
 cClHbzNr9F9F7IiBtK/XCvW/+VqSec9NYThR4swSxBNWhRz/NAEhGYVMA2xLx+9gFTHUJeqhQ6u
 JsS5hCIymLhSZfCkmdDVxK6Fxa2iPQYnrdlCgEKxTMHf8MbGTzMKnk0xXMvEoQwF5j/sIcnRRSC
 bZSCx4dfpv3E/c5E6Ndu1H+TAPCWbPy7vtgZXYSE8alx1jNGh9c/FAix7BT1n8tF4a/TDnCrkJ6
 Zi7rW3VAP3IRySgiNo6sSAftFdfIFj8b19/ODixM6GKmmZg8A7WpJZcw7bbqLk4bgSPQIq+2aqn
 IW4DtWlmvAck7W9Hmeq3O6s7TeTtmnEPE5pFnOQ+lHETwVeoo/+nRBgWD5juouB/Q2wxAm2diCj
 rZE4c4o2o4YSxy38NksUMhDsbRUDs4SX9myKa8NAQNUTmIQSTSFDNbL9k4tcq35ys2fE9M+aNM+
 v6pFSuol1vKc2UFqlDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115414_632076_A8733E45 
X-CRM114-Status: GOOD (  19.41  )
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

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning.  This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/phy/dp83867.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 88255e92b4cdbd6da2e2c1d10f9c72348d28dbc3..e03b39fd080d12afe0d02a53ffef2a6adf73cd9f 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -15,6 +15,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -719,9 +720,40 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (count)
+		fsleep(200000);
+
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
+	int ret;
+
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
 
 	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
 			       GFP_KERNEL);

-- 
2.34.1


