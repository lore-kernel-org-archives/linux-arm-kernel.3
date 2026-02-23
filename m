Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805B1EA4FBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=; b=oJbGvRKlr56ykPVRM6smiHgloz
	nA9m+RHdDezklsNlmwfo1dOfuTBPDY687+/D5dRTysu3SGL8PL2ZnRgsL7suaemyfwEyNxP8ZdPev
	ii7FZsJeZqmtfp0hnQxd2L3lBBNt/hT7g2pH6zB5dxOpjZCfsLoOQ087fwnOfBaOKzybFrNUJEHfd
	SVFA9K7f8hYunjQ8GxV6HgoQ1MLLQx/r0nQcuQQXnvXBBLW+dsUmFvg7NHHHxAB3PzHb8BNaF5vLp
	XYnfZ8/FfW0w+Sl4vdVK/frYZtJfG2cvm36xUYxh+ZV4IK3MpqmZdIocwmIS5rrLHfUnxBHx61z5A
	lhmT8TIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8Z-00000000NoX-3eph;
	Mon, 23 Feb 2026 13:38:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8R-00000000NeP-00hA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:38:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NABahT3532324
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=; b=LcPCbrpSbRKCIqwN
	9+BLAYNwVHfItZHCbpfdNEb6/duhQGxQ2YYNCDN5J1RJXbduZLRFHYL9xZg+8PyV
	kQMsmjEI/il+4xxv3DisCyESeuiMQBtC2Ak7tHKN5hIAKII2ZrlT/KRdY6aE1lHo
	0uadnjIE45fUbkVxMF27KLjmiLR33YjGhmlAUpZBCN5HBtrEn7rddow52Hr7ElD8
	2HYcj9LTPeKB2iIkme6gSl9kmPJgEhxKZUiEmGqZlG5fRB4D0nQjQWc7SBoHZsb2
	lLZa1q7uxaaGLComc3rjBscS0BzK6/TJkP5uQDQ3C4oBPHdSWm3tVg42iRKlRuk+
	DhNBCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8mtgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:38:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so3884248985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853881; x=1772458681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=YuBLMGmfObOYvlWEWhzraKH6WccLEdm5EFfoVMLZigClw3cG5V+MV2Qmj9AGeCxeQn
         cFd6kidYEaDR5Qh6ayLh15WlMWyle9Q+tp4IQwCOq/G7k6MyUeukFx/Kcudh7Lp5LHxY
         Xng38CrqIOSt2yIA/2hoMZwdBPk5lPtb8AlQz57AMV2hwEimK6lrRmSKDgrF8x+CaCPX
         2hhu/v0Moi4db4VxlG5hFWJSZ9unj0dERN1FLeHpZbC4ZXuALhZCdfeGZ+Kf9cy2rzqN
         WSSzx1Ho7WrVhU2tnAGMXF87Q7Q4tMIOGkD6eAhTMzeirWlibmUVTsWrdxlxiiOuwk6t
         3Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853881; x=1772458681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=nuqiKHrWL9nFXZKBjCSi98cHTcWJopGn1dpJl0ncS+m90DepM0UkJhbd0jHgh1Fd2a
         kugCyPMUlhTZQan21f36KA2yPNIlLwtdAZ37KW2hdKlZ9Doav4z+CBvyOi74O6HIwaKz
         TUt+Add9pBeB2nW31jX4OFMcOVAHYFFpIO4bu3pPcFWgYjwP3SFxtSaExKi5QGaxEOLP
         3nyQhNbOpagJZmtuRtPX31oOBycOQ8WStaF9V5YFw6jkSkfEdP4CFFS0lk+VX/sDBGXJ
         lH96si4UaL3iFLWKP+T/H7cPcLHxRzrLDUb9bRqO7cODX4vc++ePJPteS2o01DHIpBQ5
         Lqhw==
X-Forwarded-Encrypted: i=1; AJvYcCWE+cQLdjLno/AVWaFkF/HdAqRU6jHDKSmDuVPzvkNjkHPVhWcu0TAwubj5SLCYt0MXo6bXQd4OASHA25MIC9sH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd0unJItPAkXaK1JNlUaxJmcTIk+fl2ye2pu85lcEgIY8QSvth
	kwKF1RosVKWr0lZIzN9IuIYCryeHKJBsEEsQb1T9qXmvi94PMvFDZrKEg3uTRxtikB5gEzQVM6O
	87W0S/o1ZfFsVnTgkVeOOIgqUeZeguWJ01wYscpreYKT7TKhAUSn6yrgonTPiiAA62TBS++rzvm
	raow==
X-Gm-Gg: AZuq6aLak7BJaA7lC1/O4j8mEkpJfhJI7bQDiKdZz4DSO6h5zrADKkfWT6IlT5xtX4+
	P/EWqllNUn0APckyFDxTT6DPHVvzWkRPJ3au+ucS0s0CH8oIASqw0mCSopL1Oe45dJQu8hpUaRf
	aRzuwmTuD4ivGRTZ97PBHEJFG1nSfF08uQ47ArnimDGDj6LLJJ/9iUKbZ1pEF1Op9RabzXBkinu
	hSCDSIRDNwfHyrlmsCjrCSPTvnAiMl8gc0CS9yDXUYMUlSCmt/nTygSkOsYzJEkVosRitDF6vxN
	od6pK+L+da/96X6LB7t25xS7zSZC+RyFz9Veomo7F5tnrJciampni7tlwHSSORldbx7XcpXHnj4
	u5XhIaRbKl2Q6a679QyIZ7TlzxEG9Are9lI1Fczm3j5XUNK2LQq8=
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864840685a.56.1771853881060;
        Mon, 23 Feb 2026 05:38:01 -0800 (PST)
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864835485a.56.1771853880417;
        Mon, 23 Feb 2026 05:38:00 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:23 +0100
Subject: [PATCH v2 8/9] soc: renesas: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KMszzjU3UQ1Jk3+c+DzRdD3TJf0mZEwo6CMTyg8oKHI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFghOtq7j/iaDL1WAiPG/QAsHsRBHvV9a3nbj
 G82aE3Fd0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIQAKCRAFnS7L/zaE
 w3ZAEACq76nSv0Z8rSsnvGgmS5/mwpaIREv1PRZlCvVtRhoMKRBufC96Leq9sX5QOvd7hTA4xeB
 WMBn4CRDV8eO7tmNxBUe6TA3bRZwlZGt50fLOQ/x0euytqiolWTednJw9IUH0kbKEhqH3EIpi+2
 gpmgUmMsKkfOFVy3NgtrzdSf/VGpaQQFG33HplYR/ulRhVxY8WIrPe6Aub2FrESs/ostBms1XwF
 jWW4trZ6JRLpYP6rYxHoFg9e7BBbrbHgHnN7HevKXTlG0gqamvekyLeCVQTGueIB265F6p+Iuv0
 TH40PbIdWRK15RqpOKKn+LP7GUy+H0zwPxweyJbMloeXmP1NN1A0tcEQplBHAROaLbjgAHLtZwr
 GdS8OA83zzoPCG+E02zTIAsC4IoN7lOyEm+9ych8d8yrms/dRFYSq4Bx/7amt8tvEvCb6q9modd
 Dm/7N5K1m+gQx+XuqXBeSV4tLpHT1dek9h76Cv5QmAdqK+j6ODcDsLWPukVAYlelvk4QrN6ZXr0
 c0VCHVAZbDI4bl3m1jpvyH8qKa1u19BV4M258yoP324LUlv4MCXh2B87jQt5K3etJbPOVj5v4Nm
 Aea7iEMtxHyRgaAnIMNS5r70A/i/XphbgNOa5UZ3EYdQxIcWG4MOL8227hqj1DnvymIz0K2rUhk
 5ESczUqqojWKsMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fvclWRzR5OC4guMHyhDctQQbfAOW0IgR
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c583a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fvclWRzR5OC4guMHyhDctQQbfAOW0IgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX0WpKrJjhraFh
 PJPItgs70STFKAGwKVW0ZqLMng9ag97LixFNAVWZg+Cb2vbAYkCt923nVFAN0OfP934UALuXWqX
 vEyb09oCLruTNBNiZExlzHkg9sAyFK1WKb7u37nE4pwOKB8DtjOB+VKCXrlDeZC0of3yJWOiE1u
 Xx6uLNkc5639WjX38pzakgFOlbXqGaiWS7h4nMuM+9xi9jyS6eJ7ieVZ366CKgE3n2UfVXvDYet
 R1W33OHXhqNGZ0rB3IxDSSXa5uKT4sRtRmKHAyC/gUPc28yXqA2tvRMxbZVjjBG1NyHpLJ0bjXS
 Kk3YHS7ro30dlI2IWFnJTBS2Ag4opojK6cfEEASfBCfS7kmKX0WmHqs9ig6bH/9tIePddM79Igl
 GHAs+Rptjljh+9EGI63YLYXoTuw9qUZ+XGkeCUH/El9ztKcISgUwfM/uCuqXnWivGpIZMjuPh/i
 z/CYabA5e7gh7/qtybw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053803_200218_5C22E47E 
X-CRM114-Status: GOOD (  15.90  )
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

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10edd0d58b064650085cf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3


