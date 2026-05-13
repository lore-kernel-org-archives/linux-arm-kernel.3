Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CF2CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=; b=BpKEmgbcT2MCQ9
	f0Ywk7XbO3Uyo3x0u2tOWig20eOkvAH7o+M89HVLTCtaDszAhlAaWRzvfQnbrAaTt/Od+r4LQDzcM
	E83T7PC4qNLhbFqt9XeU+q+b6XBW0as1iAQReb0B4yqx0MClVbAIOL1M0icGGafco6AnF0YJxzd1J
	5cYxjJlwrpQ4vfPdz5EDMdRBRjXhMXCoO3XS0iqhDcDJlUz+/dFyE75Sf9KmNFJahUhzQk2BvnGCd
	obIEf1NProV/zApXs7vw0Jg+sd2O9oEWdOhbgCciWU3CtoyKcGIS3ZLf6paQomZEWhEOPt/rVXqVb
	b9IikKT/KLzzJsB0W62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCj-00000003JxR-0qQy;
	Wed, 13 May 2026 17:17:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCg-00000003Jw4-2MUf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:17:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGXvlo2321468
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jx1/70KZBMxN87YCAFelMj
	Lwd8H5nC5QRAC82Z/a19E=; b=doj8WYW9nQl1bm4XpaUDKLOxmiewaY7ayXEBEm
	Jmq4WomSg8Bxiawk7NqxRfS3kn3RE4sRIZ70aXSwif/98faBGT313er3vFJu8hVJ
	w875fu7uf6xEKWx/2gqMl0m/CGHaMXM315yVicnMAUUyEmSWrz+nBcscg78yxZ9O
	6DU16hlzV1gDW7KLvRuGNlfX7/caykeble/2hvlgfYWOH2IiwQtaxeSo48ZJbc7K
	2VRpbY6XYjXssA1K7vpNTZw9vM/M5L/BCTx6LNcpqg7ANVRzxp7obSbB2cyGlXfU
	zi6Hf7ky5E43F2EhOWkmkPdi21hQFHDq7ORNEfvuvJmQcxTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgub52j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef62078ee7so9323045eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692621; x=1779297421; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=Zms2E5Aml1rI0FTVO2C/GikneYaL/7pF3N+j5qni6iAlyxaUpWAKe02Bw+w/lSbs33
         AOgoQiIgPD4cwgwDoqNNemixBCWBB3MQsagpY610rG9yX+3rZxkvalWRkthWky8hnaN0
         N0vUwUF2l4TOaBbzz6eSsUVZ7Da6rzVzB8FoFrew0LjzgLS235htIba/+Qs6/CqY3zbJ
         r7TTbNaZSY6H36z5jR8LhHRJov0DiAgiRTIev9GDH/K/KQOtWS7uYwfiIUbeyuWJ5UtI
         7W4nMdS63BgE6KqyCN+wz1KJJuRaZw7HWlrnZEvCuECS0PL9ttEswvhPzr+TtS6iuyNM
         9rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692621; x=1779297421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=PNLFOcEFRxUmkiSlesEgO0Khey/jTb6gqz3K3oJXSr0oqvx3kYn0mwHH0Sni514Bmw
         Pl00SIZKN7l0qS8gqHH+JYofoHeXZyA4ys+T81OL+3LiPmcoE9RFXRMDy+3w4o7BCib4
         GJRZ0aswStl6U8hiNLBqTH+JN7cYJaFJey8gqk/jckBNDxI1gqWr84rHLhrsIilizmFI
         UfcRVmcDVolYSA+j/s/+ZZJ8gp6r3ScyN/e2Z2tQyayBM9lq4BFKxZqeX92MhpcTUPc5
         G20qBv3e4P8c7bUz/nGoU7RTBJ7q0zClPw1ZaHTexCoZkw+56KiUhXqnArfwYKV/w/SA
         k4rA==
X-Forwarded-Encrypted: i=1; AFNElJ9py/6MaERt3SjzKvUxjrrn6II1T070VQcj+7lY5zHAAr5yu7SzK2EayTdO3/jdRmwNdkSC4KXVytVq+rBOFU2d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2x15GRjM0t7fpUJfNlulRTA2RHqxrvMRhJ6XHlsCWT0Zq4/az
	NaC7F86z+lHgRGpDH83U7sPSOeSfbXXKH9nYqwnBUw/fqNOFz9kiI7zWazi8lGbNbCSIZ5QNfAF
	VkT4PzuPMUPDr0aC/zub3gbfkNCZQPaidj6CwJK5gOtmiyup9S5+hMU2MyLRToxG/gsbhpFKmod
	G5kQ==
X-Gm-Gg: Acq92OE8/XUuKSTXNN0wZC7cd9to1by/EUlpsaOvvNVJddS3rebHyv06v/ybKXyc8fd
	UlG8l+qK7GdSNu2HQo0/ZVQ+x+Q3HnHI1V2TSnbjW/ZZGJfTY0/4whvsL2agPPUQkoL7zG5s1Ex
	zlHJYwxar+6KZa1fuy9rfnWGqNA9mgJFqP8GrevIay7SfPWPCSljUbJzkyO5rpWrM8teLkMVUBM
	o/7H7B8CQq4D/bYtgtYyXTS1DfYoMdf0PID44fHPzjUWJDcad2t+B07GSFbqT5UEP3X0K6hHyJq
	ciVKDoNMZoB6zwM5770p5DW+76k1k3tXYRnibdHpTAja7094jAhuuUyRmqp5bjox/ppHs6aARpM
	TKHPETr/rvsI3lPsUjmBA+NOP0P4jgJ8/bR7jrsmX3vvTJnjlshI8GA5e9/ZOVwry8J3t1/E=
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698578eec.10.1778692621025;
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698523eec.10.1778692620213;
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:16:59 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 10:16:53 -0700
Message-Id: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAayBGoC/3WNwQ6CMBBEf4X07JJtsSCe/A/DgZYFNgGKLRIN4
 d+txKuXSd4k82YTgTxTENdkE55WDuymCOqUCNvXU0fATWShUOWosYRgRwY7ME0LzN4ZgsF1IIv
 MthfdaJ1nIm5nTy2/Du+9itxzWJx/Hzer/LY/o8z+GFcJCIjmXBhpCLG8uRDSx7MerBvHNIao9
 n3/AH0Dg9vBAAAA
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692618; l=1518;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=fzd/vjb1u/hgb97IIYa6s1ipXIoqKNbwIvaC6OZFVtQ=;
 b=8l/21SLzmvsSoWLwwEfvmbO5Eh+2Zd3kiPyE2vcX82D5ElADwxGzPYS6H11r/GbzbkoITVhZZ
 vXKXed0fUU2Dshw//daOmL2IuIk3EdWjopaoUP7UBGfpOzKvblX1sea
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04b20d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: rL3-KY3h0FI2CXF7BwWtKeVQDbldeYRl
X-Proofpoint-ORIG-GUID: rL3-KY3h0FI2CXF7BwWtKeVQDbldeYRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX9chZzQVqM3B7
 Q7dcsrkMMT3L/uq+D9/7boWsuqWQp4k5ucPZzGYs55J1iV8uRIGB250pPOk9XWh8yMpKfruWHOV
 AEMB8r9DWzWW6M2t/2SvXvuP6wl6DhNb36MxLxBr+qNJrUqBJ3FPJwtkBO4F9QP+jPGE+HQm1NK
 X4CPAsEYNPIwe2r8IUOiLD0OpolZd9BFCOFEseofiipU0TP9n9PCf2Q9+c9yYqHHtYawT3stKkL
 rQNx/GJl/Y03ea1SgwaASGBX/6Vxf5Kwhq5VNIxbKulOCHBSRQeoemObEWCsUDJGmCtoT5yKCEl
 Wq3Q0Y36nx06Gv4arAyN+echExEIDBJahJDK6rfBRG6iqdIilQ3U9Zac4ihe802k9KPsBAlkRRA
 YOIl76OE06+vbL0tPCiGWXacEFgLZf5pqWqDFxob3ID5ZzDzHhXyB/NhleXZ02D6ja+Vf4RH0YZ
 7nTdXYEDmUh+C1D8VCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101702_613496_2161E7D1 
X-CRM114-Status: GOOD (  12.04  )
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

SCMI client drivers do not consistently log the number of supported
entities discovered from firmware. This information is useful during
debugging because it shows which domains or resources were exposed by
firmware during probe.

Add logging of the number of supported entities to the SCMI cpufreq,
pinctrl, reset, hwmon, and powercap client drivers after a successful
probe. This aligns these drivers with the existing logging in the SCMI
power and performance domain drivers.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Changes in v2:
- Use dev_dbg instead of dev_info log level
- Link to v1: https://lore.kernel.org/r/20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com

---
Alex Tran (5):
      powercap: arm_scmi_powercap: Log number of powercap domains
      cpufreq: scmi-cpufreq: Log number of perf domains
      hwmon: scmi-hwmon: Log number of sensors
      reset: reset-scmi: Log number of reset domains
      pinctrl: pinctrl-scmi: Log number of pins, groups, functions

 drivers/cpufreq/scmi-cpufreq.c       |  5 ++++-
 drivers/hwmon/scmi-hwmon.c           |  1 +
 drivers/pinctrl/pinctrl-scmi.c       | 11 ++++++++++-
 drivers/powercap/arm_scmi_powercap.c |  1 +
 drivers/reset/reset-scmi.c           |  8 +++++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260509-scmi-client-probe-log-173cf85d5563

Best regards,
-- 
Alex Tran <alex.tran@oss.qualcomm.com>


