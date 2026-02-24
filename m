Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCB3E9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dcx9Fb9RAhIPBMtW22u+1jg9hETgYE9w0yg+16sdIuA=; b=aYtUmtn3haTS9BTpRbSIl1Dst7
	vxRvQhP7VQsD3758fDPkkDpUgAESYne/50QFBR6O/FEQ9L6LukbVlnar5WNmrbIwZKVrzTtB66sbX
	CYfoFEJloZJlM85l/EU8oIRSEhSIkLTEjtUZmYC29Lrdh8XGFNMGBloOKFeyguekI3JX5Mgk01LeR
	Tn0rc4X7dAIKC1T4Jj0Gx85s3qdAgtWD22hbOhdeKlkNon6nEXzih7H0Nif++Fc6/6rwJiLUk3cLK
	nVKBbK01pgY3VbxpX8wajWs5OE7zIMIR4EN3vsI+IcX+O/tk3khRd7P9Zu8Jdk37zt120oti8B/Rs
	EYCWADuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptS-00000001sJT-0Fqi;
	Tue, 24 Feb 2026 10:43:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptO-00000001sHj-1Vpd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:43:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFTiJ3570257
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dcx9Fb9RAhIPBMtW22u+1jg9hETgYE9w0yg+16sdIuA=; b=H4DOzgVA83UHDgOM
	VVUnvWAYTLNOLPanpo4QupRYaWBh1QxF944TCbYx88pbymRFzDVawGttNM0lIv1N
	OAIJordGF5UDSK/c+qa+HpzR/3laOnj+Vq8+dUUI6f0+VqjvNHoF9NNbgs6slhDn
	usF4sPZ2ZO1C8eEJPwL6rd9Nk0CNGDVcflRdQref2T9u/ORNXr2kIbOTL/WYf9zX
	93cyZ8xqZ3nx25GYa0Kyx8g5utiIACl349wERwD/2WxWT4ConMD/lA+AwFBwhfss
	Z77+KjN/3XFhyxvVhpVf3xhAcQIDrzVrD8WMt0Bfl6Nz0Qc5Uu+NGFcxFtEbxr6A
	o6MMGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rby2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so5542687885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929829; x=1772534629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dcx9Fb9RAhIPBMtW22u+1jg9hETgYE9w0yg+16sdIuA=;
        b=FtobobXMHiYWB+xN5WVKmy35wUmSSjIJu+kcSADZesvFX85TZT1p6/rkoryL0G0dPu
         pcMH8Ed+9Cfr+OOit0vGUBvJlHoH2f1EXsWV2+QOFDlFNqtwi2Svqt1b25pujmXtbnE0
         IkxoxmzvZLROBRC+74g97E3ZSCxf3lCXeGKuj4FL3lkSHWcj6yDpU3IyKeFZh5aUiPuE
         87wVGauGodXu+ipILuv7IUfZdOuDLBi6j7FMl++T8y8HdWQpNIWW9eehNJMMAUSvwrLC
         hN4BydOOfHxUDGLtz5+xZvhyE5uri/ZRG0WQqwYdJX9BwiBqod1KXyeQ9QAu4lwlq+bh
         DrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929829; x=1772534629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dcx9Fb9RAhIPBMtW22u+1jg9hETgYE9w0yg+16sdIuA=;
        b=TzMrFlqL+HJbp3LRgzVAI6ZG3RMKohkusaxWmQ1ECDRqEk4dmCKKK+kQmoDq7Qi7la
         7+GVfNCDmymKddabMEA0AlTuFf3cTyuziIbvisZvBabb4HqhXpk2AFHeUyr3O/X9VpFS
         nVN5HK0mZcLAQSZKOT7f3P+PvcOOWOnwmij2JzQq6BCGAydXtb5aLw/1DhmA8VcSUF7Q
         xK8rj9M4hEHYJ0i2YeJk8/RzqwjKo1P5tEAXD7UKw4o1893iHfAVJiEmm044wAjnaiNe
         607sdFlLoEQzAHI7aPo925udITM1MjfXs42IwGalVBFyRQGwnwBN2vRg4gk/O0BAkZSP
         1nGA==
X-Forwarded-Encrypted: i=1; AJvYcCXk43Uus+OCYfOeqAVa4e2dSUCcgpkdmyXMJKD3U9kTtETcCFNU7j7Svps8FpRTpIgqHgpWlcfVJ+cnF8AsNrl9@lists.infradead.org
X-Gm-Message-State: AOJu0YyWIBiyxfo83d8/T0/qQUzF8G2ZZ1f/fDbXmqHcA+5dz9C432nA
	FK1UHAiLQGOWomEAKH2w12UlYNLBl0qaxGPrZvC4ORYNpiUyPwZ6eswA6rZpm5n7U3JApeGR1Jp
	5nGSJZeMVCchZYVfGsjS3dIrElZHxNej41QIN8h97eRy5uKDmhyiL47SeV0NrA4vkQEDZ3SpRbX
	2Vsw==
X-Gm-Gg: AZuq6aLGty1gvJlXIBH6EkCUmRN5PHYzY0gN3d6P7qH05p/htmRKNGkwsSS7DYCtmgp
	4Bs6O0ZICEEay6qV2qhKczRzJJGEwbeKODPo+ilIbeJpIXwLUhOlZp1jAx1cY4gAu5ChAKXPnM6
	2osajmZ3u/RwAF4u2tjuQ2JjJH1/psXpKWvU5PHfUjk1itQFqHFh9EAYGjuW8gAp9v5RdLsU9xO
	ePGFdvsTqe4pnd5mvngltiSzKR1ycp8OcRDvF0qBCwXZE6bNg0YotuHlVRnutNbmCWSqG55Va0u
	5U3evKHGPuICar8YTr6RSEbI/rSi81fah4pqIL5QXVsUXgZF7OSi2Au8pWAkkGuMRLbhbRaeMuN
	S0UyL1JaJdNPhe8mxLDAcKqOxGLQbH35BRorvrXb7kAjQCQ==
X-Received: by 2002:a05:620a:1a20:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb7c02208cmr1910194485a.45.1771929828482;
        Tue, 24 Feb 2026 02:43:48 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb7c02208cmr1910190885a.45.1771929827852;
        Tue, 24 Feb 2026 02:43:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:39 +0100
Subject: [PATCH 1/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-1-90bf93b53e27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11852;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rdvBOwT1w+fOKzKlMJ4qCaqyF5VXzQXu8RFGhV4wPWA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDdTaa70Ye5luvvU/8VfllC+pftv/qtWoBPV
 3buBcqZcgeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3QAKCRDBN2bmhouD
 1w8QD/9hJgj7Ium0TabC0RFOre/lPkhH80ZbNT0C7u3H72t80b9a9oXATiFxDqfMFn7onM2QmAQ
 M4iQ2VLzIT5u2i+dE85kbk7w7BD0HDHX8iTDl44DDfudhhOlhZIf+qq4A+cd+MRNHv7FoB4mSH8
 TK1K6BTOytpaQM7P8BDz/qeN19Guercv31IYV/0yQVb++rV3G/CiRM1vVjiGs+MCN/9bPxteGyE
 q2vKegAYvp0KMqdMme8RCTB990GeOcrj1aaKnidRgBo7hiAgmWf1aTSU4gp4zKKYWH4rkM5+7/A
 GFECFw2Mfp4QPs993wWOYvruO0jWC21EdKKZ8hQDe8z7QAczC8IdyKIUsBYI88ocldlc1W5k8LN
 ItvOLcSqCrUmIgd7jzTEkUComIAui37o4BAndrsxHN+bRa2AcB9pd2Tu9/2VeUOII88WUFYMXDM
 D08TbnJtqxefQAH6hKwHG3Dt2RO/P9xlmJNL9qNv9/KIE0/XPzBIh+VHyQ7oix0ifPWH82/8N5R
 m6I+MXPgn/artpE+JEa/PQl8qaVMuywYXgLCvNg3OtNb0ABfYVXppKDZt8or7dPZb5MnBGlGWaQ
 Kfiv7JuRUsLv8gHLiLKG2JjlbrMTpWL677RuQ1Mvy9LGMr6CjJtSSCsFy8IuDsVTzc1+qrymRNx
 M4z9//C0G6j43wQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: G46xaHK3XpbiEEMEjfFSGNa8z786Y76a
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d80e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YWpryjrgZ2of67SKuAYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfXywaPURtty1ux
 FvQf5urONhRxMRb9yXInzUqZI/ClXpsvB7kaKxFjUjjzWjitwwj/QxOyeBeIghGjJjlrssCuY9h
 zl5GHQooHxgraxkeHGcINPozq955FrK+c7VGzC8RHO41DzpGVEzuHF7/9tCtO1Xgm8sQlRrJjWe
 MOHsfMLgHgaZHImPjeo4mUTjVEOkcGKx0jeRIJVuO/Eav1C1hul6j22AWa3w8gDZPWyRqwwLgiv
 D1/0NXoewd0GViKvTJhxGI7YQBGOELcg1cljwo3Z6xZIiYh9iYlZs3+4R+y4th/w2pBuioiT1BG
 8bKo0PLqUDhbLJDhRuRem9tVU9yCU7wIYpcEu3lHc2UJiuJAIvGdN7QlO5WsgXTIQ6agtAt7wCX
 so1RXohsG1T4gk2mLlL2vd3gE+H4fOCT9ebRPtcf7/fTNeW2Drr05kCIoujaXBLNFiarran8MWt
 1KrtVxqfpfRHu0T+gAw==
X-Proofpoint-GUID: G46xaHK3XpbiEEMEjfFSGNa8z786Y76a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024350_416549_E13CE1E2 
X-CRM114-Status: GOOD (  23.26  )
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
scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
to const thus they should not modify the handle.  In fact that's a false
statement, because first thing these functions do is drop the cast to
const with container_of:

  struct scmi_info *info = handle_to_scmi_info(handle);

And with such cast the handle is easily writable with simple:

  info->handle.dev = NULL;

If the function really was not modifying the pointed handle, it would
use the container_of_const() call.

The code is not correct logically, either, because functions like
scmi_notification_instance_data_set() are meant to modify the data
behind the handle (in containing struct).

The code does not have actual visible bug, but incorrect 'const'
annotations could lead to incorrect compiler decisions.

Fixes: 3095a3e25d8f ("firmware: arm_scmi: Add xfer helpers to provide raw access")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/clk-scmi.c               |  2 +-
 drivers/firmware/arm_scmi/common.h   | 15 +++++++--------
 drivers/firmware/arm_scmi/driver.c   | 26 +++++++++++++-------------
 drivers/firmware/arm_scmi/notify.c   |  2 +-
 drivers/firmware/arm_scmi/raw_mode.c |  4 ++--
 drivers/firmware/arm_scmi/raw_mode.h |  2 +-
 include/linux/scmi_protocol.h        |  2 +-
 7 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f121..f9efe14a95ab 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -405,7 +405,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
-	const struct scmi_handle *handle = sdev->handle;
+	struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
 	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
 	struct scmi_clk *sclks;
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c35c95fddba..a18babacebf2 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -154,8 +154,8 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 				       const char *name);
 void scmi_device_destroy(struct device *parent, int protocol, const char *name);
 
-int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id);
-void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id);
+int scmi_protocol_acquire(struct scmi_handle *handle, u8 protocol_id);
+void scmi_protocol_release(struct scmi_handle *handle, u8 protocol_id);
 
 /* SCMI Transport */
 /**
@@ -277,13 +277,12 @@ static inline bool is_polling_enabled(struct scmi_chan_info *cinfo,
 		is_transport_polling_capable(desc);
 }
 
-void scmi_xfer_raw_put(const struct scmi_handle *handle,
-		       struct scmi_xfer *xfer);
-struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle);
+void scmi_xfer_raw_put(struct scmi_handle *handle, struct scmi_xfer *xfer);
+struct scmi_xfer *scmi_xfer_raw_get(struct scmi_handle *handle);
 struct scmi_chan_info *
-scmi_xfer_raw_channel_get(const struct scmi_handle *handle, u8 protocol_id);
+scmi_xfer_raw_channel_get(struct scmi_handle *handle, u8 protocol_id);
 
-int scmi_xfer_raw_inflight_register(const struct scmi_handle *handle,
+int scmi_xfer_raw_inflight_register(struct scmi_handle *handle,
 				    struct scmi_xfer *xfer);
 
 int scmi_xfer_raw_wait_for_message_response(struct scmi_chan_info *cinfo,
@@ -522,7 +521,7 @@ static struct platform_driver __drv = {					       \
 	.probe = __tag##_probe,						       \
 }
 
-void scmi_notification_instance_data_set(const struct scmi_handle *handle,
+void scmi_notification_instance_data_set(struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
 int scmi_inflight_count(const struct scmi_handle *handle);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e76a3204ba4..8b27e74d8a19 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -438,7 +438,7 @@ static void scmi_destroy_protocol_devices(struct scmi_info *info,
 	mutex_unlock(&info->devreq_mtx);
 }
 
-void scmi_notification_instance_data_set(const struct scmi_handle *handle,
+void scmi_notification_instance_data_set(struct scmi_handle *handle,
 					 void *priv)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -638,7 +638,7 @@ static int scmi_xfer_inflight_register(struct scmi_xfer *xfer,
  *
  * Return: 0 on Success, error otherwise
  */
-int scmi_xfer_raw_inflight_register(const struct scmi_handle *handle,
+int scmi_xfer_raw_inflight_register(struct scmi_handle *handle,
 				    struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -730,7 +730,7 @@ static struct scmi_xfer *scmi_xfer_get(const struct scmi_handle *handle,
  *
  * Return: A valid xfer on Success, or an error-pointer otherwise
  */
-struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle)
+struct scmi_xfer *scmi_xfer_raw_get(struct scmi_handle *handle)
 {
 	struct scmi_xfer *xfer;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -757,7 +757,7 @@ struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle)
  * Return: A reference to the channel to use, or an ERR_PTR
  */
 struct scmi_chan_info *
-scmi_xfer_raw_channel_get(const struct scmi_handle *handle, u8 protocol_id)
+scmi_xfer_raw_channel_get(struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_chan_info *cinfo;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -820,7 +820,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
  * Note that as with other xfer_put() handlers the xfer is really effectively
  * released only if there are no more users on the system.
  */
-void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
+void scmi_xfer_raw_put(struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 
@@ -2202,7 +2202,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	int ret = -ENOMEM;
 	void *gid;
 	struct scmi_protocol_instance *pi;
-	const struct scmi_handle *handle = &info->handle;
+	struct scmi_handle *handle = &info->handle;
 
 	/* Protocol specific devres group */
 	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
@@ -2282,7 +2282,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
  *	   NOT be found.
  */
 static struct scmi_protocol_instance * __must_check
-scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
+scmi_get_protocol_instance(struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -2317,7 +2317,7 @@ scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
  *
  * Return: 0 if protocol was acquired successfully.
  */
-int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
+int scmi_protocol_acquire(struct scmi_handle *handle, u8 protocol_id)
 {
 	return PTR_ERR_OR_ZERO(scmi_get_protocol_instance(handle, protocol_id));
 }
@@ -2330,7 +2330,7 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
  * Remove one user for the specified protocol and triggers de-initialization
  * and resources de-allocation once the last user has gone.
  */
-void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
+void scmi_protocol_release(struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
@@ -2372,7 +2372,7 @@ void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
 }
 
 static bool
-scmi_is_protocol_implemented(const struct scmi_handle *handle, u8 prot_id)
+scmi_is_protocol_implemented(struct scmi_handle *handle, u8 prot_id)
 {
 	int i;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -2388,7 +2388,7 @@ scmi_is_protocol_implemented(const struct scmi_handle *handle, u8 prot_id)
 }
 
 struct scmi_protocol_devres {
-	const struct scmi_handle *handle;
+	struct scmi_handle *handle;
 	u8 protocol_id;
 };
 
@@ -2525,7 +2525,7 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
  *
  * Return: True if transport is configured as atomic
  */
-static bool scmi_is_transport_atomic(const struct scmi_handle *handle,
+static bool scmi_is_transport_atomic(struct scmi_handle *handle,
 				     unsigned int *atomic_threshold)
 {
 	bool ret;
@@ -2582,7 +2582,7 @@ static struct scmi_handle *scmi_handle_get(struct device *dev)
  * Return: 0 is successfully released
  *	if null was passed, it returns -EINVAL;
  */
-static int scmi_handle_put(const struct scmi_handle *handle)
+static int scmi_handle_put(struct scmi_handle *handle)
 {
 	struct scmi_info *info;
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index dee9f238f6fd..bfc1d57ce052 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1464,7 +1464,7 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
 }
 
 struct scmi_notifier_devres {
-	const struct scmi_handle *handle;
+	struct scmi_handle *handle;
 	u8 proto_id;
 	u8 evt_id;
 	u32 __src_id;
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..efae99febdde 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -172,7 +172,7 @@ struct scmi_raw_queue {
  */
 struct scmi_raw_mode_info {
 	unsigned int id;
-	const struct scmi_handle *handle;
+	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
 	int tx_max_msg;
 	struct scmi_raw_queue *q[SCMI_RAW_MAX_QUEUE];
@@ -1210,7 +1210,7 @@ static int scmi_raw_mode_setup(struct scmi_raw_mode_info *raw,
  *
  * Return: An opaque handle to the Raw instance on Success, an ERR_PTR otherwise
  */
-void *scmi_raw_mode_init(const struct scmi_handle *handle,
+void *scmi_raw_mode_init(struct scmi_handle *handle,
 			 struct dentry *top_dentry, int instance_id,
 			 u8 *channels, int num_chans,
 			 const struct scmi_desc *desc, int tx_max_msg)
diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/arm_scmi/raw_mode.h
index 8af756a83fd1..49895b81bc3b 100644
--- a/drivers/firmware/arm_scmi/raw_mode.h
+++ b/drivers/firmware/arm_scmi/raw_mode.h
@@ -17,7 +17,7 @@ enum {
 	SCMI_RAW_MAX_QUEUE
 };
 
-void *scmi_raw_mode_init(const struct scmi_handle *handle,
+void *scmi_raw_mode_init(struct scmi_handle *handle,
 			 struct dentry *top_dentry, int instance_id,
 			 u8 *channels, int num_chans,
 			 const struct scmi_desc *desc, int tx_max_msg);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b0..17095e41f5c6 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -909,7 +909,7 @@ struct scmi_handle {
 		(*devm_protocol_get)(struct scmi_device *sdev, u8 proto,
 				     struct scmi_protocol_handle **ph);
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
-	bool (*is_transport_atomic)(const struct scmi_handle *handle,
+	bool (*is_transport_atomic)(struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
 
 	const struct scmi_notify_ops *notify_ops;

-- 
2.51.0


