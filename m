Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09C4EA4FBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=; b=e1BP4hpT6Vbbtq0AvkpFs4IWH3
	9xI5d4IUxH9DD9IRAY3t8hVVkpcgnr/cQO5XA1P/40Q9MZMManrmFIWfQjoLGBtT/QUHFCKLrtUQi
	Atb6Lvy8uifY0uk24T8462merp6TYYSIWCT3qJGaFFxuRRXg/t0wk6M4Nva/e6pOBFCxt0vdZrhNf
	bfhYxtzoEUznZDcaBYWEHOScIrHFVTiPOT9v1qAa/Bu9RjIwoZSVrH5vtzzT+yEaeTM5Sr+eyEQDC
	DOm+16w8Onzk2G69FlQK89RNb4Kgb5bS5IxEi3cd+n1xM5VK0DsmLpK/jCQUmPxTv5U3EjXyyX5Ug
	WRnRFbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8H-00000000NVk-2EXs;
	Mon, 23 Feb 2026 13:37:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8E-00000000NTl-3DCA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:37:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2ptW3152066
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=; b=FLRgqxU0qrr/Y1KS
	g4uJW9Ub7TsH+DrfVQsrfO6XZAdyrQrdQJoOm7AeUs8wALu6bDJFxZ53WBWayDd3
	LkPcq93G2tl0yx3e5N62VoLN51pMyZAtNgvQc81E+clOfGM2OFzQ1477+MDdVtFD
	8IeOwUTxvti1PBYuEbE5kMpMs5VplU7AkEryuZJC0oHYnfdcgy+jarbsuHXy7+si
	WVvrt3Tsb+Q6j4qUAHnU4HwFZvZg1RkAvPEH2m9vDhq4RYZ4gAOj9Nc4xax3AYO5
	T3+PpQ+figj+SRdbm9kDpEQKRP6NfHqdi3aqb/U5LeGrke0m5J+IDGCrU1CgLn2r
	YhP83g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj887at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1718787285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853869; x=1772458669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=Jhd6QKImKM1Tb9FrIGB+PpyAAzCn9y96n+1UIBXg5FuhviuoQmvELpmS09BPVVBnel
         b1CK9Cyw6+SRf1JhSpuKE+dwfkiwDdMv1UJy5fZKfAtDnhqUK3FQrWrg8grPLKQRWof6
         O9BuELpAxVTfCD7llBa/dtQuCH4W2PIXuOl6ywB8awEbXDinpsbgUBw/tKCk9R6PRe6c
         g7XK/2DKbVjBdetQTW7vopqgXoEdHymppqpQHCPMVxKDyDyES0nV8dBRcpiDxis+nmF2
         e1I1Ne9TNKLWHqLhMGU1+B85bAb6wYp/MM9IbhEJEQZ4I9E4jTxDmMIuPp7KIqeg9OL3
         YafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853869; x=1772458669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=T+S+Q+sBxN3u0OdlH2wYKFgrLgvwbVA5U2MWtSjOompUIi0iz0b+DlXtDdaGKAahyu
         XK1B51jXe7BDSJgS9nFKcfjQ9WJV6mzzGiDaQu/fswCy5Oks+K4fKsihspkOpuJL0oge
         JJ0RgBQ4VzbdTzwiwyTQAFKrZcYNa6yWCUvAp67qC1xH0ZoGLw8ZrviMWhI3I74mu+1X
         RtZsK2mrKT4Ek5fhCsb0PobAG/8wI3B5VxWIbnc83pXJqqQsJiIlglpuo9/BYg8+XSr/
         gVm5N9F/k2nB/2fyFCc+92Wm4mBNZSjnTnCLuRPO0McmFlhxPwmhtKrtLAxHS5NqEJMc
         xIxw==
X-Forwarded-Encrypted: i=1; AJvYcCUCpgQRwcnmD4KrF6aSq7lwN99HCqLtG/fZ1s2815vEWV5PcAdU3UM2W208WEWfPh0Eb0Rrp/uJd61v5by7Jtxp@lists.infradead.org
X-Gm-Message-State: AOJu0YwiDLVxPXdsv2H7Q+JDFKXzcITZCduc4TFFYjAGQyxQYq0S1lQE
	DNveWRbHl3vKdV9DyrNQ2AqHUCMOGy8xRlyh56SqJwryqX26rVAfMZSjtSTb04gvCNxFo+jMVNc
	073PC8WVrfjzre2W4Mo+rawCGIuKb54pfc9jWGMZIdRsagdDrLOXxcegg+XgXxCIRpGnFzDBlmn
	kVAA==
X-Gm-Gg: AZuq6aKrv2iVNHq6IHVvDFidZAYgH3UlkFPB9IZ+gqXaeu8HEGzP7epeSEvkp+mpkya
	a1gVCR4mrpw3tFB+hTSbDvDv8W8twWA1ve3gwXcCiJt6nn7MeetHRDkJrJptdYqH6C98ABBT1kZ
	7fmmQtucUTlMaE6n6E56waBBzWzOtdEaV4rXAlTkXT+6aG8r9hE44VZkuds7fliwl/JyyfGbljW
	SDChjAv+xwTXIQsYF7iPeJKKk0XBNgh9C9xNlyf8p5E1K5Kix9ulfxu8sTkXRblZwaGNNzuICbU
	cpxcmvUCSM/P0TvjBVVlPlHQvUn8QrkvUL+bQn2lfKxkffOgbZnJ4RfEjlIcajUwdL+SnrY8tCa
	YpGTZtxGLqBPjLvcgjSVDEOiuIrPmqD0Q8Pm3lykrpkVAhYc+pGg=
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118018385a.31.1771853869254;
        Mon, 23 Feb 2026 05:37:49 -0800 (PST)
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118013385a.31.1771853868814;
        Mon, 23 Feb 2026 05:37:48 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:18 +0100
Subject: [PATCH v2 3/9] base: soc: order includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-3-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wW8xXPxpKDmxwgZvpOfgeQnchhB1uWOF7QOX2KdsSDE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGmcWByg57Obv99hS6Oh69qse1rMhM733ND3/E5jFtmsA2uzU
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpnFgcAAoJEAWdLsv/NoTD9nQP/iPx
 B1jGPMqwhkHEFboaz8rKRAWDcT1EXyqV3r8zD8iUz1itnruVo9pkg7K0BTyjjjY5jJXxGEUDyln
 5VoUzvDH/4UR2c9L5gRSHhIlCNZ/k9h8n8rgrYB4Mw/4uOeUYVbhVorTpB9Bodbet2Nmh0WNRme
 iE1SrqmavcP+8nxdt3TosgeYOpFlYPS081Q6+PesWWEVMJNuARH7Fuu2cEZvFsCdPsQciNidWVe
 o2v6Sku7JRVbV3A5H/WE1A4N+zumd5+HNWXHGCLD59q/bhf3oiE9utrugRe+YNQiK8VDZ//nxsx
 UQHrtF4bWww7nKIfFEIuneWOLnbhwSMfjhVQ+7IOqvIkP7FifK6T7dxXThCPv1DTl29ZC7WlyA/
 +P+f8FyN4RpOjggJV12eAGSlynnlvk3mI+Ht1EMz2Rc6+a6pCsquzO0s3U6ABvvA4e9gTAGwOgN
 DoLLxLkJzKFNpXpfqp2zv6cMc+ESwl9TpcUSwChH6WG7yBbwAFKI9e5RRq+dNjcabAarC5DnVLV
 HxznKM0rD1zonz2rKdFy3LvcKc5bdjNY0RrgCDkOo8ijSqxWItBb+JBOGz6d9qVHLf3zrS7mUrb
 6tqTLtWMrWS5wHUlWC5rlXEDZjHx9qFqQZDnLOv8xP45umlVi7iOdAAp81H3/qSBWTrLDPe+Vz9
 DLrZp
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX/S7k5RUJRFV8
 55/zXhbXU6IK6OB2m58Bh7BwNs+Ctl6AKA+4BunJUDo+sKYokjscjcLs3IjsWOpQ+INc7kl/vh4
 O8tMUW1f2ouMxmqLhZJZ+u9SB4GDqnh7HUWMvamkR9z3VdfCuwOrE+wTGQuLn4kQhdtpBaK6whv
 UqlnkFBiM7+/kEQWiq0V9xuB9Gayi/aiohudnFVcPwPFhWWvq1M00H4VQRFg/12ubvINVUBkZoS
 WGQZN+jkI6eTEteey1PnHThqLeAdgdiOrGJ3BgDT6vWdCb+kcy5vVMkZMcNnZk5xI7QomfBl+Cl
 PymodEA3S18SKMPHknZ1b2jHyx1JetqpxOPzNdv+3bIy/FSVvrFRP4mXF5QjC70dlJYJ5gdHg0a
 1JygDJ1MvepiiaqOj67UB59Ds9f1W/5xKahpf6mUdqyX64iMH2g+QCwjUkxUBtnpKdawltb0gtu
 3bdjU78w+td2XbE+TCQ==
X-Proofpoint-GUID: JjmwgOfx0w4asjB0k-jpUwraSxLyoyMN
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c582d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LcgYCWfw0sZjbfGval0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JjmwgOfx0w4asjB0k-jpUwraSxLyoyMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053750_941006_F7027851 
X-CRM114-Status: GOOD (  14.11  )
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

For easier readability and maintenance, order the included headers
alphabetically.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index c8d3db9daa2f02c93aeefda9dd9c5ede148a676f..48e2f0dbd330b8d402135ffa7308f454eb4ab7a5 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3


