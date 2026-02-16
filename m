Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D262FE63F33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rMVTVE6mXm25OeX+iOc5e0I0EziX9QVV9q1R0GXD3GM=; b=azeQooK0TBMzbKE0g27+z6x+Iw
	euFCOr5LzZcU9xgUZuQAlouBJul0FfIkxDInMX/72ljWj8j5W/2T3C8p+HdXNA5XedlZpeDJoaYNU
	vbEeOKh2l41Yg4RDoDzd6moMoHAGgx0DcBIdA2kOWioeS7DKpaMY+mxXPv+DNT14i1A9ZMKE10JrV
	CTvvxpeL3mCmMkl7vPUgVTZsUBjB1bU045iJ1e+GVwtd55PXKy1H0x3POUc0TBTMLvEY1X4Ilhv99
	mbZYzKZOsHViSd0Ua+0ETsKKScPCyzWklyUWF89SeuOWmY98X0l4KKrcD15T2NMqHLr6E1F0/hqUH
	xJm5oBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrttO-000000068VU-3m9C;
	Mon, 16 Feb 2026 08:23:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrttL-000000068V7-2JCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 08:23:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FMRib72101896
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rMVTVE6mXm25OeX+iOc5e0I0EziX9QVV9q1
	R0GXD3GM=; b=iyx/tN1aasJqaZGYZPuLefbZVo7i+OtYBnolNO0gKtexeEcH1H4
	PRTekwxgJcs5MVE9SfvWD/l6h2O3LaKTbxS0247H8IQfOLOvlg38XhwsGpHubqwU
	P60yRcA3At+TLvrTFqE6uZxAIWE9Mv8eQfnI2KUhOD8cVhvMKrTfMCUAHjz6egYx
	7JXS/A6/0o2XJ5TkhZTO0LcDcIE9FFLA3IVuxZVfS5kP/okO/NIWjw84p/2G3tAv
	Bl+QrGf95sVjCj42/U2wFlWmgnlfuPS/cpzsFverk2SK2GYceGxckMvW6FA2s+F8
	g0tTxwPYMZjUMHNty95LTqI787IClNg62wA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6buj4ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:23:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso1762204785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 00:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771230217; x=1771835017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMVTVE6mXm25OeX+iOc5e0I0EziX9QVV9q1R0GXD3GM=;
        b=RIKEDxA0GP6dR/i78P9F/JPM0zMSlMHxVzyqBD8w3di1P5yeUfvwXvfTk6lQWUMZIL
         tCeLL5+q7p0xoFm3Cq2RZcKgFiqGhQ6MvYPLJQ/WxG2s5Swzi5Ch3JEeIIHxCuPTTZzj
         jM2lqkXLrZXBbFAh6hKkz61RjYdARIISBmFIALAkmsrOELhZGJrrbhjOkUwf35rT+Lhp
         MXijj7vCq1XPPKFC4Mrd+1XrXUzHgZeZdsPkD2dwvZzLr0NIN2FlbJDmgVzgKSebjliV
         flLBihnLyd4OWxlOFWUaNvjZlk0Q963Anw/hKNG6ipWvA4kyr9crf4xwPOiPvEzmNd6Q
         lVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230217; x=1771835017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMVTVE6mXm25OeX+iOc5e0I0EziX9QVV9q1R0GXD3GM=;
        b=sPO8awO7saDvKabpOw9eNtBxTPwTAjNdCBC7t09PEF2MXf4456DKqmuUDFK1X3X8/r
         CQynoZscy2qCSdFB6SPKRQ/CkJqYDNEt3IDQrSA6MbYQhcy40KXy6ypAiQd2C7AxuwSV
         dBmVNfzr4uXWUzZXUJpnQMAiGfvO4ToDvZZC7HmwBJXSG9S+QGYjZobF3VWGIn5ADuUs
         qW62M/Z8Oh0pX6J3HOhXSrWzWwS/B6dcSgBb32iBDJKMvSGprrCKJiAqv7Dy9IjEU8ro
         8zAVyMIpo4BtOOq76ejqIpC6qzRbKqc2BWeAANcsDvbvY6yc3HVHYfPCDIFEaykaXMr4
         w26w==
X-Forwarded-Encrypted: i=1; AJvYcCXQkbboJS6b0sJhmLbXI+C5Vuw2eetFi3mk5tpou+r2wRjCWE0QFzyTu98Vbq9nhg+W9v0DvDhIDc+1PeWcSipb@lists.infradead.org
X-Gm-Message-State: AOJu0YwiX74cogo2XwL43zb302VV7wi8+S8fe+aR6jtnE1t7WY3i0jb/
	/9m0Qtw7ACw2rbhhAO2jsu6i4fajkXxl/TP05nwCIqpIQogsCbbwllravuNgUWodLdngqGJk58P
	ZS8EkQsv7QNdq1NQHLzC2LbPyPAxqbiuEnLzup3yHKjMlL7Emqk2K7l8mFEFUhbNaiv9DCNdACE
	G9fQ==
X-Gm-Gg: AZuq6aJAkC6JIlZHwCz9nkT1yeqj9UxRaYcu0zYdXh/sMpKH2y6OLf471Btf94N7L0v
	yOU2B/tdpiiqCEFJTUApV1EZtOIpRC4AYTrCOS1meVR1RgyvMQZC0v6/s8VarRjrA76Mr595Pyy
	P/bl4umPzXboTbMawZbrB6THhFedjuEd4JuutelYQOYr5U2i4R0DF/4Rr4QW9l2gd3GBhsmVLb1
	ozz1xrN9dFcFKo//3sI9wJXiCk9Xs4zvTwmw0/21IsbYIiOuYLT0/FPMkkbK/Kq/zKNk6hCnQ9y
	fOC9FMEEcA/FMZiFoZDMTChxlqRuvRidC//QHnIOohDYQ7KbjUrReHGKXJTziC+1Apyqud1Gcbl
	qgjSXbO4wQSWUBIGUmJwag5sOy0XXrH/4QtIbjQ==
X-Received: by 2002:a05:620a:4448:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8cb4c039214mr846298185a.77.1771230216930;
        Mon, 16 Feb 2026 00:23:36 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8cb4c039214mr846296885a.77.1771230216530;
        Mon, 16 Feb 2026 00:23:36 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370ac3564sm218760205e9.5.2026.02.16.00.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:23:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static
Date: Mon, 16 Feb 2026 09:23:30 +0100
Message-ID: <20260216082329.32029-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sFAr2t+BvnqFlwrW1ysGHeXPiGH3mfxxZ+VgNKOcNCY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktQCAupsWXrW1bsfGu0/qby30s34FN1H2791f
 KK8/j8IKGeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLUAgAKCRDBN2bmhouD
 18VvD/45qfZfCuBtVGeMp57N6vu1v5hp/gwgOWuzIwqLz70+h9S78rCOt9fvWJcwYxDyhsQ+t6P
 56waeLYDE7JIskiHEurE+9Gnyk7IQiDEosEaK38E6nvq63wcxiqNfUGdxjohoUf4w1XB4IbxI6b
 8ZE0AYXMGMgJsFkSQBWbsRGSoPRas7L5PDwXu4iv94jcw/+JqQ5SRwrMRednN1cyvTmBHpILMuk
 mJbsfKSJKdnf13Ch/5nyRfWJt7GGLSoDUdQoY34QccZbJnl8CnjFs/phkD6E8C1HEyewT+yyQNh
 hUOYumIBEItdCE5i7frpfHF+bSfiLfVWkGBrc+fWKAp0IemL9xBu2wEcZZK6w+k9tXb3k4dCZVn
 VcOZoWR92wzly6Db4VlDZpBORcHi3QpGjnYYo1/R9YHaPubJRBVI1U+bPBv5Q3CxxAMNoFzS00v
 TSvRjoX/X40gVhzvucRpKGgTLl9Z+4XEeuBCQ+DJ2Ec+2CTKGlzvHEpQPQQHE3hY4hU487436HP
 /OBg28lzzr5mwWwSExlVa2TB38Zy3Kc5fC4FimaIi3o3pqEnScIhKM4z+qKx2yf72gI5zZw49zO
 VbusvV4KUQTxKkMRtqG7pOeVmgUvk1rpXOZ/llREjp6RxVNJAB6CNYmQ7SF+DtUVo91/Gm1JU9Q IULPE4GaGIXa5ag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MWQgygTmoCZHk0RkqY9rG23N2wTwhk-4
X-Proofpoint-ORIG-GUID: MWQgygTmoCZHk0RkqY9rG23N2wTwhk-4
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992d40a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=lLDweYiKzoSJucHH224A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2OSBTYWx0ZWRfXy55Ar60tUOJE
 qu2XCq0JEGFD0XErsCTyQ/XPdUmcq2By9gd8GrYZ+W2m7q1FQYUQlTmJThFOj7HgVPhnFQJByOz
 ELudj2wOzKySlJg1hZsNDf6Qwvmi4t3/sBuH/6U9yioyP1+su34vGsSNteYBMci02Xy2DTIBlh5
 sa0iJiw1J7yZLIrrejL9rZE63XW2DCDUVGZooQCisLDoDMLsT7nc9ftIQxLJ9x1pWgHDuA4MnLA
 sUT3jqVIW+HrzyyNA6ZxChb/mOpWNlTVQDrYjqMNfuGUTSaysZt6dHDAw6isxNDgoJVRd3e92Vq
 JoeYmckDB7j9I4+Mj52ARF0HJ0d3GQGOqb2rJLG0Z2Pvnwg47vgfSQbzo48Dogug/qnvGKZjRpb
 7CBmoebdccboKvPh3GEJS20rxn8WtsbWYCUKOQYItrTWjXCEjoVhC4B/Fj05cHi7+ASMQqJpvKI
 M1CH3S2LhmX7DHGxCdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_002339_615939_606FB0C0 
X-CRM114-Status: GOOD (  14.82  )
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

File-scope 'scmi_imx_misc_ctrl_nb' is not used outside of this unit, so
make it static to silence sparse warning:

  sm-misc.c:19:23: warning: symbol 'scmi_imx_misc_ctrl_nb' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/imx/sm-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index 0a8ada329c9d..8d95a901734a 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -16,7 +16,7 @@
 
 static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
 static struct scmi_protocol_handle *ph;
-struct notifier_block scmi_imx_misc_ctrl_nb;
+static struct notifier_block scmi_imx_misc_ctrl_nb;
 
 int scmi_imx_misc_ctrl_set(u32 id, u32 val)
 {
-- 
2.51.0


