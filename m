Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CB2E9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN2/oaoWAN9Y1ndJ/NXYNONg9LQ3Nd3Tzaq4ZTvo8i0=; b=GBSUU2GoP0stEU5GUZI3VwgZnz
	OlkNQat7IQjBbgV+7mLgHBeYPRjxFQYDZl201V/n33rBWZtAO5/LpaEz1OyinRrg3bjAN8P8rFXJN
	mKd7vcFs3ZaZFl72VJZkyrr/8uDkD4lBJycL0pjiHBLPH22lt6W/byxsPiI8Tr0nojIiFU0P105Zu
	RLlUWJJbaFbrTE8OVopoITTLhH0YgO2TEx9qnv1KXsxrXXtwEBbNU+z18rarJYZjwXZBKh1qVn0I1
	kun9HRrLD7c34KwbHw2S0G8U8+X/Zd6TmjCtxJOxwfvmn4Xj1PSQw4Y8iMzkWCA395UpInXq3RXfU
	xQuOxCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptV-00000001sLp-3kUc;
	Tue, 24 Feb 2026 10:43:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptQ-00000001sIS-1XTo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:43:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFYgL2512787
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EN2/oaoWAN9Y1ndJ/NXYNONg9LQ3Nd3Tzaq4ZTvo8i0=; b=cPaYdboOJOtS7ulU
	F+gmThGKKzIQQpHO32G4tCZofOrtl9Mi2ccHv8fQvLAU/099SCESdOMAFH0fwKej
	zJl2i4yGVsFdd5z19P92egoMpiiwNytSOy0YhTEmQxRT+AUAzmLcHvtT+i65X3OH
	cdaxxg4u5xDucaSg5G3VNLGRkEos6yVnDW9tiSw72U4+kS3H4s0bCoXRWBOsfjf6
	1Eio3U5VXiHlqR7tQA3td0DkGrHFfz3To2anQ0yZjclAcPR5d9UCC+EVBe8vZBTu
	dDc85W3rc30lHjSFhzCHfMq6PdQllFDq8A1k8beM0Cz0ap/5hP5YA9uINV2bfkgF
	UVbMGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81bxjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso630936085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929830; x=1772534630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN2/oaoWAN9Y1ndJ/NXYNONg9LQ3Nd3Tzaq4ZTvo8i0=;
        b=cP4rMmPrfzIKOK+goZf/4/BTQXtUT151ZPtik2QIyqY/s+59lmYqEiYM8XIcscC59s
         5GteZuCyWo2d3wbTPQO/XiBjnXnVFtBFShT+aLnWMKG56MnDg6nQK8EreiMktxVVfYjH
         TBIcTZLrZYQe2mVPKP0lstj2Rw9nsmrHyihyjJTD1oTQ0EAtMLO0o/8pPmIwN3ZFrxH8
         8GAlANZI0U66U/hnd8ic0jtnUzGd56bzzY/Co/O9hpOdpB6XN1rZlMVOQr65hLaJCxL4
         KTvBhoM21lvoMnRmgVm0r8tey9ueruoSjm+FnOq3oxZPK0JBsu1wuUHy/7w6BCn9lnrT
         Nkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929830; x=1772534630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EN2/oaoWAN9Y1ndJ/NXYNONg9LQ3Nd3Tzaq4ZTvo8i0=;
        b=lD+fh9l2SEJhfrLZ5/XU8LGTy3UDbgNr+zmpN/97emJxYJXpQKzQ3r4vEJPrwQsPsJ
         fBI1AMqfBGYD/+Z0ZkV84maCxJALe9ZnT6zBqG0hiUbNWRms7SzR6NzhddPhn9alUIbk
         vvIj08ngo7hRbIwxSmlyS+NkXlLNnUdVtFMz67ZRg+UbRt5S78+g6jVtVdFbMgCwj1zR
         CYbVfIQYoNtUkTME2ghhq4hiUiD8wW5uXGd7hyqUr9IBEI+zgYIFK/Wa9Xpa3wtEza5r
         UHhDppllGZAi83srK0Es36ky3D+SIwkgJXYpFvgE6wLLtmOQI3rWyIF+q5HJxBAQRaM4
         Xzjw==
X-Forwarded-Encrypted: i=1; AJvYcCX5KLJIE6u/e0ZElsY/kdV3hTNx+0n5yJaCGptvN19IpU1SQL7CFwpjfPAs0dcxKkNeSS/La5B7RtO/oqw7fiPa@lists.infradead.org
X-Gm-Message-State: AOJu0YxVo5jk3rgOPB4NOm3gWnvhx50aW4teZXn+X3O4Of5vCtGjSmZI
	fF34zLXjJ8ggGQHr0BWD0KcXKMK4gpygYNyKevVKbJOKTDp6sSk683BoI/MeFYDdKvwV7SLVZE0
	/XmqtatLBychQ9zE6m8yrHnenI5/6M6XwzxkLQsV0dnRzCc2f+jHd4mhhDJBdcA0L5sK8Aelycs
	SxfQ==
X-Gm-Gg: AZuq6aKlX+mZcHtw2wOPmYVsOGPh1IrWo4op5Ac13FQJX84bAm9JUd4t/XyJnFqxP8T
	y18ymfUqa4UMcwP+sTGTmNOOlcB5PcomjB45KX7DRhXtPd/c8nknS/YqFdt25iOeY8Sfl27WK6G
	PZHwK9SVUtLktrfVbkqysFYyDRoQimbePyZ2EUzbIhp7GIBvnsgP2+onOGDd9cmxCFQkbfYoE2b
	o4Wlzt7u6yjg8IHcnLQCicQku2BZVees0zpb3umHTLLedaGehAH6FvLVSBpPHU9+Dv4FOjIaVeZ
	cV3ZJvaZCw8tQr5Ml4bDu/oC9lf7OT6U40x+fbQp5PmrzmzdiqYth345VflpB1fuHKSPQWVBUft
	nZyct8Adt9D7OcLhPT63qAMWaTT/fRCjoi+vvvsv7RwzmyA==
X-Received: by 2002:a05:620a:1904:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cb8ca14a2amr1432280885a.35.1771929830380;
        Tue, 24 Feb 2026 02:43:50 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cb8ca14a2amr1432278985a.35.1771929829895;
        Tue, 24 Feb 2026 02:43:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:40 +0100
Subject: [PATCH 2/4] firmware: arm_scmi: Drop fake 'const' on
 scmi_protocol_handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-2-90bf93b53e27@oss.qualcomm.com>
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
In-Reply-To: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11774;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MtfFLt1YenfsJ/wZknYcaqCTSZ5/bjAtaD9/JYLsnnQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDenvwWp+Df+vhEBzfsFyDfJYzjKv/jlKST0
 85yGntKMS2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3gAKCRDBN2bmhouD
 173fD/9N+O5OTQ5QmfRdqz4D8cWMNwN9LGcibNK0uSezOak//l35xH2ZllrAQyk+rUU2Ewv5+US
 r9O02OyXEQhwZwffW1KGyRq/4JNwVBEPwoZrZ1HacFOiZuvrmIGa4nh4GpRu0eWMLD3giALvetR
 yweybtVUR/g9ghF3ZueROwSANuwdXseWdJFrzFK1nbVe5+pgBxS5nSF3q+kZn5yFlZUHoxbG4aj
 wOG7mGHSgM5RH54+SITR3DaeN+3b9aQPl9yUUyZUHNmUaXiN6RaN3ERcnYli3rOJBNj6aDdBrPj
 Vfpz2Ap5Hq47Q7kOQ27q6aXQk6fX4LQ+ItKiF8mPCHgt6htCiPRm36/k3AN8+hgbX4JVvwWyAbp
 sOuMcleIy+/OtH6CxTmsnRXCniOuXof2YZybukRFER8fjoh7J9Ej2SlpOZkHK9OWgGfC7GS4nrQ
 z8UinGGV5GDZZtAr37unCsWVhqh6EyhsyjYi+MdIHBwAkUE+pXPbvgON25368JXxtPQQ81jg1If
 wUdByQT0kNOLAJHelHoXC4GJTSYco88WUFKlPAn1eUE7rr0TJOdCph4OReDaDOSga856jDVTLeE
 Bt0GCCTu28sMiLuwwKCoqj3NiEBeRSX3mcsMwIPJfBxtPgDS/izQuTZ8GcWChKl8FBI/R9drC8j
 TUEjhd4poi1gumQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: P0tV1lVdTGe9rwGLyRjhZh94F90pa9BA
X-Proofpoint-ORIG-GUID: P0tV1lVdTGe9rwGLyRjhZh94F90pa9BA
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d80e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QOiUi5lJWKzMiGfd4uMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfXzZWLzEgkdbsU
 xMoPZs8Vs6eOQnpTZvNeA5XX1tbvllT8o6wHGEhq/ws81KDU0vqSSGw4FlBmC2UX44AJf2Qwj9y
 IT4iud4Iny1mMOC47fgtO8IDUE1MooBu668bbOKiWpqLzqbTwcfGi4Ogj6oYy+ofFOJIPFPsCbj
 TUnRVKl1zaZLTaoQoeLj/tsr3nnA7WQtG91WLQXZJm+Bq/iF6wt6KxOlV9YvJFNfANxiK/uOcv7
 KWsMLySkgFQ3HS9aDcmmz0npi9dTlrsUubLA2oICZry5VQbvEoEsmpVhvG7AYdWoCQfBX2gDjWW
 f58w37pPrMUZvhmJ6Ob52k04p0DoeBKcKtNWTQBShGYc3+mRIPlM/1TiqMYy7ALAXB0/qsSfAwi
 dnbjsOeRNK9uWj7DXbVdsq8pd6UdOJG+JhS2C31/AUJjhNN8EtDOVX1ci9mWE4Rax+8lnZRtxPo
 HGbvz9zM/GmZXQDijCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024352_537869_02473BBD 
X-CRM114-Status: GOOD (  19.73  )
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

Severale functions operating on the 'handle' pointer, like
scmi_set_protocol_priv(), are claiming it is a pointer to const thus
they should not modify the handle.  In fact that's a false statement,
because first thing these functions do is drop the cast to const with
container_of:

  struct scmi_protocol_instance *pi = ph_to_pi(ph);

And with such cast the handle is easily writable with simple:

  pi->ph.dev = NULL;

If the function really was not modifying the pointed handle, it would
use the container_of_const() call.

The code is not correct logically, either, because functions like
scmi_set_protocol_priv() are meant to modify the data behind the handle
(in containing struct).

The code does not have actual visible bug, but incorrect 'const'
annotations could lead to incorrect compiler decisions.

Fixes: d7b6cc563a60 ("firmware: arm_scmi: Introduce protocol handle definitions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/base.c                    | 2 +-
 drivers/firmware/arm_scmi/clock.c                   | 2 +-
 drivers/firmware/arm_scmi/driver.c                  | 2 +-
 drivers/firmware/arm_scmi/perf.c                    | 2 +-
 drivers/firmware/arm_scmi/pinctrl.c                 | 4 ++--
 drivers/firmware/arm_scmi/power.c                   | 2 +-
 drivers/firmware/arm_scmi/powercap.c                | 2 +-
 drivers/firmware/arm_scmi/protocols.h               | 4 ++--
 drivers/firmware/arm_scmi/reset.c                   | 2 +-
 drivers/firmware/arm_scmi/sensors.c                 | 2 +-
 drivers/firmware/arm_scmi/system.c                  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 2 +-
 drivers/firmware/arm_scmi/voltage.c                 | 2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 22267bbd0f4d..8302aaacdf43 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -371,7 +371,7 @@ static const struct scmi_protocol_events base_protocol_events = {
 	.num_sources = SCMI_BASE_NUM_SOURCES,
 };
 
-static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_base_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int id, ret;
 	u8 *prot_imp;
diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ab36871650a1..58cc392c1c80 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1064,7 +1064,7 @@ static const struct scmi_protocol_events clk_protocol_events = {
 	.num_events = ARRAY_SIZE(clk_events),
 };
 
-static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_clock_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int clkid, ret;
 	struct clock_info *cinfo;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 8b27e74d8a19..951711aa7d33 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1630,7 +1630,7 @@ static int version_get(const struct scmi_protocol_handle *ph, u32 *version)
  *
  * Return: 0 on Success
  */
-static int scmi_set_protocol_priv(const struct scmi_protocol_handle *ph,
+static int scmi_set_protocol_priv(struct scmi_protocol_handle *ph,
 				  void *priv)
 {
 	struct scmi_protocol_instance *pi = ph_to_pi(ph);
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 4583d02bee1c..1c0a150612a8 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -1266,7 +1266,7 @@ static const struct scmi_protocol_events perf_protocol_events = {
 	.num_events = ARRAY_SIZE(perf_events),
 };
 
-static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_perf_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct scmi_perf_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..99f98eb6808d 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -827,7 +827,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.pin_free = scmi_pinctrl_pin_free,
 };
 
-static int scmi_pinctrl_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_pinctrl_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct scmi_pinctrl_info *pinfo;
@@ -861,7 +861,7 @@ static int scmi_pinctrl_protocol_init(const struct scmi_protocol_handle *ph)
 	return ph->set_priv(ph, pinfo);
 }
 
-static int scmi_pinctrl_protocol_deinit(const struct scmi_protocol_handle *ph)
+static int scmi_pinctrl_protocol_deinit(struct scmi_protocol_handle *ph)
 {
 	int i;
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index bb5062ab8280..00a9f53295f6 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -319,7 +319,7 @@ static const struct scmi_protocol_events power_protocol_events = {
 	.num_events = ARRAY_SIZE(power_events),
 };
 
-static int scmi_power_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_power_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct scmi_power_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index ab9733f4458b..ac527f59bc1e 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -957,7 +957,7 @@ static const struct scmi_protocol_events powercap_protocol_events = {
 };
 
 static int
-scmi_powercap_protocol_init(const struct scmi_protocol_handle *ph)
+scmi_powercap_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct powercap_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 4c75970326e6..309e834e5392 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -183,7 +183,7 @@ struct scmi_protocol_handle {
 	unsigned int version;
 	const struct scmi_xfer_ops *xops;
 	const struct scmi_proto_helpers_ops *hops;
-	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv);
+	int (*set_priv)(struct scmi_protocol_handle *ph, void *priv);
 	void *(*get_priv)(const struct scmi_protocol_handle *ph);
 };
 
@@ -315,7 +315,7 @@ struct scmi_xfer_ops {
 			 struct scmi_xfer *xfer);
 };
 
-typedef int (*scmi_prot_init_ph_fn_t)(const struct scmi_protocol_handle *);
+typedef int (*scmi_prot_init_ph_fn_t)(struct scmi_protocol_handle *);
 
 /**
  * struct scmi_protocol  - Protocol descriptor
diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 4bc5c24c2d72..532ebac3286a 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -351,7 +351,7 @@ static const struct scmi_protocol_events reset_protocol_events = {
 	.num_events = ARRAY_SIZE(reset_events),
 };
 
-static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_reset_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct scmi_reset_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 882d55f987d2..0a2b3bb83cc9 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -1144,7 +1144,7 @@ static const struct scmi_protocol_events sensor_protocol_events = {
 	.num_events = ARRAY_SIZE(sensor_events),
 };
 
-static int scmi_sensors_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_sensors_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct sensors_info *sinfo;
diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/arm_scmi/system.c
index 0f51c36f6a9d..dfb7183d1f14 100644
--- a/drivers/firmware/arm_scmi/system.c
+++ b/drivers/firmware/arm_scmi/system.c
@@ -138,7 +138,7 @@ static const struct scmi_protocol_events system_protocol_events = {
 	.num_sources = SCMI_SYSTEM_NUM_SOURCES,
 };
 
-static int scmi_system_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_system_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_system_info *pinfo;
 
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
index 33f9ebf6092b..1f569951bb31 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
@@ -342,7 +342,7 @@ static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
 	.button_get = scmi_imx_bbm_button_get,
 };
 
-static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_bbm_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct scmi_imx_bbm_info *binfo;
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
index 753274af11d2..928d93a8603f 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
@@ -230,7 +230,7 @@ static int scmi_imx_cpu_attributes_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
-static int scmi_imx_cpu_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_cpu_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_cpu_info *info;
 	int ret, i;
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
index c56ae247774d..0a9af7ed1981 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
@@ -223,7 +223,7 @@ static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handl
 	return ret;
 }
 
-static int scmi_imx_lmm_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_lmm_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_lmm_priv *info;
 	int ret;
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 0ada753367ef..79c7966888be 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -459,7 +459,7 @@ static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 	.misc_syslog = scmi_imx_misc_syslog_get,
 };
 
-static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_misc_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_misc_info *minfo;
 	int ret;
diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index b9391c1ee8a0..60c3405b4999 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -401,7 +401,7 @@ static const struct scmi_voltage_proto_ops voltage_proto_ops = {
 	.level_get = scmi_voltage_level_get,
 };
 
-static int scmi_voltage_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_voltage_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct voltage_info *vinfo;

-- 
2.51.0


