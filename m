Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B09CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTeTl1+Qq4xtD/LrLJVHev9cviwyL7IZCbUMY7wQWU0=; b=Kn91bZqrc8lVQ1r7yIl7Rt3CCF
	JDT4jQvTOaC8WqK1osfe3EcEp7/YIeZ3w7yWfRdSpEv3ULJlkYHE/XiWOxngflBgBQQQTQetqrVje
	JHO3WyruPNI4iD/LraQeNbCfsn/XCw3n+zJYAF+woI9fW3uZTosM65rWUHcwXkTAukStajRijwvmm
	8cU5KKzXxgJIuI3MLmwJqvJ4cuSy+74tXYBmsgm3wBEKuOweZtQvGa0LHPuU5/cPDieJnk/Gf+Tzx
	iim4YXvT1Y9jE1V9nHzTyskDnA7alpvXPZa5cAts86y8BEXfS0J5FUWbAQjakvsUj2mk4zEIjQpyD
	yKh6Ir3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Km-00000007hkO-01Lq;
	Thu, 21 May 2026 12:17:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Kf-00000007hgB-3EKU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:16:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99oQa3009540
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTeTl1+Qq4xtD/LrLJVHev9cviwyL7IZCbUMY7wQWU0=; b=hJwkaT8z4Kp0K+T7
	7hLyG+UrEHeqqdgwWsVJyTjWQGVAnw8DlwXarISdMaRmOa5ETcy4b4d9vrF8Ygyn
	JkKl4NFzAio55YFw7EfMBSWZMkzpKKGuvvIweHVdhkVyII/+40B5dBgjggAt04nk
	2PR2cjsQ7SjYrpsKFVRfZjEfXlnDi+xMrFmxjGRdnTyNp1nzXOJaEkFch8ZfRNDU
	XhshLXaFt0vCHoCJNQf2NZVle3MicXE9Asl0W4SsnEKYyCQg+EiiD4DOGAF+O1G5
	3LbTkXZ65UwaG4hCVqGr44IP1okgtqYKtjPaOYIu3VxeEhhR/uE9H0s/p/d5bnT3
	BuMItA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr3245y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd6aeb3637so150463805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365816; x=1779970616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTeTl1+Qq4xtD/LrLJVHev9cviwyL7IZCbUMY7wQWU0=;
        b=gRnF02v6zWxzSF2AsefhgU1xi3wPATRDo7dpC03ZIeB+OA/lRJwmVtxi7q2lFoII8f
         TaztyXo6SX+RcP2j4M3jHW280uP8q5B4RuImvJoyQG7ZTieuDkOSExWDT7Gx/PZ//4iJ
         yETY5ZhzqOMlXE/y9YHjdYDhA4rfT/VpEGKTyBiMqOz5kiUeFMYs7TpKWxc84g1bK8NE
         AX36zdQodMnCVoWzQo6clIt6xOn/sdSOkGZ6qwpTWgg/s7HIibLgYZ5MxTWZgJY17YWT
         sWdJ6VT23untQhTkaZbjfK1kzIruiDuORA5f/Tbp6VWqqgHNJau0ykWfgjmFHrhTyg/R
         j7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365816; x=1779970616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTeTl1+Qq4xtD/LrLJVHev9cviwyL7IZCbUMY7wQWU0=;
        b=PfgbloYlMgrqW0qq9l6Bd1gLzrOuVEOkvLbm4aKykqFzCEHj/NJMo8FpHFxKxJZhJl
         mSPKQO3cG+6HVhC8UIj8phRCxS7r7XlvNkG4cEzveMymMaShoa6fqCme+97AayZlkaP7
         yLEe23MHvsvJbRTBHzpWgbpppbW2dSmxAR50EdkpXWOfGBa8P/D9fZe5MMYjCnP2cWu+
         vLltK/x0ij0UILaakLVaafllKsHrL9Y8+w2xtCG6JVIZzD789zDGOrzkdVVKuRY6WjsL
         BlLn9Tu1n+DFXXo654Uy+ogqLBLHVzURJL/iIs94Yqt68SiQU3yliVEiSNdsL9r056kK
         M2kg==
X-Forwarded-Encrypted: i=1; AFNElJ8mFniR2ZGaTLMAuOv0P4hKPj3VQMaO8IIOtZtoHO/z5bImJm7PxwzfZQGijdiNgBFGrWRAdTQ8lEMrDsTUoFGG@lists.infradead.org
X-Gm-Message-State: AOJu0YzbqF5iwQd0PkfCUTkF6oaWKHCfAKy0u0oxqeet8TKovPu9+3Lj
	Czp8XfgQbXNvkiWCjc4C81m+ZeHNsE5P6pbuZzWZ0cA9RSHLlbXBD8fJoSZq3I0gWHSkEl6sm5u
	KcZjw6cjYu1f5fyyW5GoKoKCm52V5aklugA6oW+w2SS/jQcIAhkFQVlyYrElZZtJYQUBhY+9KrX
	h3yiXKfMasCg==
X-Gm-Gg: Acq92OHnu4j6NNGo371SM6YdP/cKju6HgdB9sFJja/AflaVYoI9Mjf/HSvr0y3fgteo
	Xypsdqlf95jgHjfRAB8tPpnY0MB1+q0lC8iAT7M+9QEKQ3Kl2dB3/AePgkrw29tivRusSCfTgoP
	avDlbqhJtrqXkXhJQvY0tAwhJxu0INUiUrX3lCo1bRj0tjWjuy68b/da/rk6Kry/M5YnWAjdg0r
	KTypzJQa+HTSyYhvc29gy8DS+gxnQJikXr76J+FejGO172PJTPSHpPRsCMivN+qn/JwSfJpiaXd
	wf/Wy1e/zfetjKNqR9Ma2sKaSjIgdzoZiGOEQgyA8mahC0mWN4B0Kiiec5FdXgJf0laZOimvFxd
	U5+MIUm5Lmr8tTwfRLDUkWoyvYn4fbs84vf9klzcxfgl3Webe3lLAlKZaW729dTUMzr0JoWmlZ7
	Qm7WMFJjzV6vV3oA==
X-Received: by 2002:a17:903:298e:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bea33833d8mr29418295ad.28.1779365815580;
        Thu, 21 May 2026 05:16:55 -0700 (PDT)
X-Received: by 2002:a17:903:298e:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bea33833d8mr29417895ad.28.1779365815129;
        Thu, 21 May 2026 05:16:55 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:54 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:30 +0800
Subject: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=5578;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=FM2YtHpM4OM2HUWr2MmK4EhxL38NMpDBKrZYgHLhkWw=;
 b=Ds114TPyMEar/y2iZD9LJeZrXlieJ7ZuzRXSPr95QRLqTkOMZ8bTcznAP6UxlyPYeoEw/Q4j9
 PpmiG0bii0BDjzLh/r6KKKYrUT7RdWxuz6oDifB+u0XaZyDhkyR1SmU
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-GUID: d1DLwsm6szklWNQWQNHjL2VRO2gXOqqJ
X-Proofpoint-ORIG-GUID: d1DLwsm6szklWNQWQNHjL2VRO2gXOqqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX6/531wgbRBkk
 qF8AVlcLUqQmnAv9Ea1KXUJWTHJeFdtyBf68mxfLWFEjrRc/4XcXKCfzEoDkdO5tWs58acyAtWL
 duYR3XAqSHoWMY2reOxUJMy6CFx+z7DXgmjqcNamEbSOFLK17cobGK93AFwVMKvbcACipWN1XUd
 tqLa0tYIRtVS35Vp4ePo6lGWHi7yzypo5h9DK90a0/IZ7La43/VbW9GrGdW0fTT9XfPaMR26/Vz
 p/GdESInjgikd/nqmNOh+BIm7v/4ohEyshk5JULJt8FxMV9DX9JZF/5sFIuYkCj41wLYNroMwNr
 1qNCYKYBBKDZQhyMMU6NYVB8Ws34v8Vyxkk8aPYQnXqUOusOBS3vP+3C+EXO2n7XQTl714JhKCw
 axh7aA+7JcLDw2eBoV47alHQjTZtRAl5j2IK3ZWq1e+UMDv+Df4lpC2soIg6ZEraLS3N2iAfjs7
 k7cNlubSAMZgIDBhCsw==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0ef7b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yoa6GI8vE20v00mW0vsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_051657_934055_2205A959 
X-CRM114-Status: GOOD (  17.84  )
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

Qualcomm extended CTI implements banked trigger status and integration
registers, where each bank covers 32 triggers. Multiple instances of
these registers are required to expose the full trigger space.

Add coresight_cti_reg_index(), coresight_cti_reg_rw_index(), and
coresight_cti_reg_wo_index() macros that carry the bank index in the
cs_off_attribute.index field, keeping the base offset and index
separate rather than encoding them together.

Add static sysfs entries for the banked CTI registers and control
their visibility based on the underlying hardware configuration.
Visibility is determined by comparing the attribute's index against
the number of banks implied by nr_trig_max (32 triggers per bank).
Registers beyond the hardware capacity are hidden, preserving the
existing ABI on standard ARM CTIs while exposing the full register
set on Qualcomm CTIs.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 7191a478b2da..feecc9d6563f 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -207,6 +207,15 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_cti_reg_show, NULL),	\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg_rw(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -217,6 +226,16 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_rw_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0644, coresight_cti_reg_show,		\
+		       coresight_cti_reg_store),			\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg_wo(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -226,6 +245,15 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_wo_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0200, NULL, coresight_cti_reg_store),	\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 /* coresight management registers */
 static struct attribute *coresight_cti_mgmt_attrs[] = {
 	coresight_cti_reg(devaff0, CTIDEVAFF0),
@@ -515,18 +543,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
 	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
+	coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
+	coresight_cti_reg_index(triginstatus2, CTITRIGINSTATUS, 2),
+	coresight_cti_reg_index(triginstatus3, CTITRIGINSTATUS, 3),
 	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
+	coresight_cti_reg_index(trigoutstatus1, CTITRIGOUTSTATUS, 1),
+	coresight_cti_reg_index(trigoutstatus2, CTITRIGOUTSTATUS, 2),
+	coresight_cti_reg_index(trigoutstatus3, CTITRIGOUTSTATUS, 3),
 	coresight_cti_reg(chinstatus, CTICHINSTATUS),
 	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
 	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
 	coresight_cti_reg(ittrigin, ITTRIGIN),
+	coresight_cti_reg_index(ittrigin1, ITTRIGIN, 1),
+	coresight_cti_reg_index(ittrigin2, ITTRIGIN, 2),
+	coresight_cti_reg_index(ittrigin3, ITTRIGIN, 3),
 	coresight_cti_reg(itchin, ITCHIN),
 	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
+	coresight_cti_reg_rw_index(ittrigout1, ITTRIGOUT, 1),
+	coresight_cti_reg_rw_index(ittrigout2, ITTRIGOUT, 2),
+	coresight_cti_reg_rw_index(ittrigout3, ITTRIGOUT, 3),
 	coresight_cti_reg_rw(itchout, ITCHOUT),
 	coresight_cti_reg(itchoutack, ITCHOUTACK),
 	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
+	coresight_cti_reg_index(ittrigoutack1, ITTRIGOUTACK, 1),
+	coresight_cti_reg_index(ittrigoutack2, ITTRIGOUTACK, 2),
+	coresight_cti_reg_index(ittrigoutack3, ITTRIGOUTACK, 3),
 	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
+	coresight_cti_reg_wo_index(ittriginack1, ITTRIGINACK, 1),
+	coresight_cti_reg_wo_index(ittriginack2, ITTRIGINACK, 2),
+	coresight_cti_reg_wo_index(ittriginack3, ITTRIGINACK, 3),
 	coresight_cti_reg_wo(itchinack, ITCHINACK),
 #endif
 	NULL,
@@ -537,10 +583,22 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct device_attribute *dev_attr;
+	struct cs_off_attribute *cti_attr;
+	int max_bank;
 
 	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
 		return 0;
 
+	dev_attr = container_of(attr, struct device_attribute, attr);
+	if (dev_attr->show == coresight_cti_reg_show ||
+	    dev_attr->store == coresight_cti_reg_store) {
+		cti_attr = container_of(dev_attr, struct cs_off_attribute, attr);
+		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32);
+		if (cti_attr->index >= max_bank)
+			return 0;
+	}
+
 	return attr->mode;
 }
 

-- 
2.43.0


