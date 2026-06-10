Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D065FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=; b=iLsLAjfUVsnbpTFlD5mNlsjI4g
	lYYeZTF6+E1iM9A+IZuKrbGlqoxwxD+0SI2MBIxHcxZe05zVbuA4sq82yXL4hVzJ1IFRFovoyW3vM
	KGZrVX9MBCp5kfK8tg/BDeGWk9peUujaUc1IPUAiD9y1oyjIJPsrLJTILFpv8ow9+nueQhsXcBKAo
	Z7zhM6ZkWZ7S6IX9tIchV8HLor2Mj5OXd26qkIIXFrX1PBrjuS/+PD04ke1m4mumsQJ5PyIXdsiCU
	xdkP+pkVIfpgdYhfHz33d7XXNc73d97g2Rea8yKZbZz7y4YY6/xirPyHcol7vWjh61j6nYNMUlJKR
	2w/9iMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfx-000000078Op-09pE;
	Wed, 10 Jun 2026 08:52:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEff-000000078GR-3rxf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:52:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hmqF469535
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=; b=IqSlpoKC9cWVt/ly
	c0lKq7+31n9Hnv36hhfdInICOq+qcKnZ99S6c6oJrTR4YP0nxzwV5YBo+63czQd1
	me+reUpypNNT8P/shkFp30I+0bzHqZeZOPTOJypsYDKT5DAEh1NAIv55nefq5VG2
	NJk4Z+cxn88mTWW8T2SroSYdWbQGXwF/CtaaOj3MWd3TRETz6Fw8dpOJ0l7Q+Dcg
	2zGh0pjuDJgbhzjz67wCQqNmGTLotNTAI7h1uhfGsx83HwCIYFNkwj59wY3l7AZe
	EjbdMOmnQUfk7pnl7HtDYmWWMslQuksuAyRXuGR3xfcMULwgnxTS0dZSbBaRTOpG
	4hnk7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvhbe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso67052015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081543; x=1781686343; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=;
        b=K/zv0xcZaxNC/+9/g+Vk10PTnJLYu/Z/scW3YY6OVGBOCw49ChUCoLn6TnhG5DvObk
         wEl3QLHIM4TEdVa3BSJMK+lP0zYzu7kWVkjdzvDbTngmKwqy6fMV5SxglwXZlJPLE8Rd
         pJmy9bKH3AT2ljEixYRqmkW1Kt1jWu03H/c85eF0xo8xNqrqEk0GywMpFbYmdS3da0Li
         3ku3dPWLUWAB2gI7YRJFv6rD5opGVY/855UsJkUtvxuIkAwbA2ixS3MSbu4moTjyDiKn
         RXb1kwsGkdVwEDaf2N4G3So5EGAHn/8YcGVU9T0fq/pTV71mPCokbfo5hA1O64o2njrC
         /4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081543; x=1781686343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=;
        b=UmtZUKgOkQziSpmBS93xFA8CgsIEuyw03DPThST3LXVkctmRk3pp/ipVgOwhoSsEWf
         eYl7C902xjXotWpTUhwtbsyw4HWDwTNOKUN2Q+dCF0i8a4NUnbH/9mmhKoAnXx7cWeb6
         e25rwiL0QGdc5i3xrM3ge3v9/rDs2GTjnlSqt1YIhbm07+w64hZMvm1P7I65nRC0/Arx
         eUITLAPglCMAJYwfGk1h/xWwj/2vvWjhGwFTFDKxWfdBL1BIK+lEdg5Dzf+TThUNmaNV
         wd3eVPkrpxQE61lLrVL69hNs9hIVpobX8VLeevF5v6xxcMNoGAGwdO3/ACVZz3W1UbMM
         YMqA==
X-Forwarded-Encrypted: i=1; AFNElJ8mAx6B8yVSjSUA4J+FjaS0JfBCwqMGPeCmQ5Gj8vpj+wamJ6ViVc8ndujpSL1Jk13gR8rOyezko1b/GjEmeFAH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq9Fl58tyCU+51sceZ9Ra0ATOWdSpY7rnjtS4tMxzEF4sgn95l
	h77PnkDzuutDaPWMrDlMvGubHt0li17OmSURnPEhrjgihfe+bdCntrlcXJl4R+0ePGJrXwf95ip
	+Ti+u1l9toExuiW+9NIaCkLN+fZJMpVLPk++ifW7o/tUguH0LMaHDL0a1i36Le2EBH4HbhA78hw
	qRKQ==
X-Gm-Gg: Acq92OGkogEdrk2Hz6mErJWJhBeqt86Z3G9K+Usq6VtagmPXpgucMA8HBwzz2b1ao7P
	7sB5S6c80e3EQ+8OhW0OZ3ogiZJDns9Vvba0BEWAgOuuFy5HPY/sCG4/CE0o73BEoVttJMPzvlj
	7IpzjrEm0R0OdHfhXbN19MslCGV+Aj6bT/N9z+dHSODVShP3SJkW5yW3H7SM/yLhhvWqEeVsA3i
	LvQq8jtMELAQb7FK0mANOEJBCQt7JgnOs81FZChiqQBow4z68nflN8eigZdDPoM1tqU5YCZ2wPE
	iRACwl6lWFojZfnpuR9CDOp7Yr3EXiTzY8+acbuS9y6J9HuA4Sgd82gQT+4uVaCNmG6AN6xd1Dn
	C/78qRXsQwTO+vQzyHRmUUocMLsf50W2fd9MnyWxKhOP72yz/FZTjV0VQILCMX8nL3Hjw0SfwQJ
	ZGL0frW5LaPDyWmOVEmobav8DAbuhTk11/k8/Cv5fn76N7c36w/sRSxM7nT+4=
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr266012415ad.22.1781081542466;
        Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr266012015ad.22.1781081542021;
        Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:21 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:31 +0530
Subject: [PATCH RFC v7 4/9] PM / devfreq: Add new target_freq attribute
 flag for governors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=7702;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=37NxbrW1EfFxbpoUejE/ZkFqRHFRkvYdYd39MI8qo+s=;
 b=W2YwkcFEZ5IJT5/BN4jcRVsu+M3gLs8KmACdb/DaAC0FZxActyPflb7dcQI3MNy0IpcPTz95u
 UBtczXw4hFBDkwsTXTzL3xmtnru2Kr0uwjm8jtUQ4lPWKylW53WgoTs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: TcDMXUVWMWDDlyP324MceGLujXPgci7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXz+biRulqkhRd
 K1iEueUgVTQ+2eBj3R0B4diTkqSiT4IeYpCnQGKqZ1cIEIoho5dk3hBshZwVhu54RHTKG7mR7aO
 tUjz6By8WBZhBIiAWptIGjkZ3AJsF3gbEY/Y7hQ/e8EvFpPn2yh2cguwYbW1osLzxBDGGY6tUWj
 O7fjBy6hoH1WREiz93ea5vwww4GIE81qjR1vi1HYJXrVvBk4+MzjybC9/QigxDsUBmz1DO5l16m
 XwfJf/cukq26NoB/uoFtimLVb68AO5RbnRpTb/tGT1UMCZgP9MkUVr8pRrMQ9WRtdmsBbP8XfmN
 BITyW5Wg5sfydD+x/wbJ4lYi4WQv9VA7NsKKeAYIg5PC2VIcUBkP9KCsvWjv8q4GdO8jHrvp1px
 4P5ZYt030a6MKuZ/wvtIPJTJqqJQDwBB3dGRfAv9aGuwl7ikzhVTax3bdbAYlgY5wjSHHmZH6BZ
 yMY0cvYDIhkYMF5uWbQ==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a2925c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=WcTcrbn6WVXM4q_icv8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: TcDMXUVWMWDDlyP324MceGLujXPgci7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015223_978183_5AA8F163 
X-CRM114-Status: GOOD (  21.18  )
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

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The target_freq sysfs attribute exposes a governor's predicted next
target frequency. Not every devfreq governor has a meaningful value
to report there; some merely observe an externally-driven device.

Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
a meaningful target frequency must opt in to. Gate the existing
target_freq sysfs read on the flag and return -EINVAL when the active
governor does not advertise it.

Tag all in-tree governors that already populate previous_freq via
get_target_freq() so visible behaviour stays unchanged for in-tree
users. Out-of-tree governors that drive frequency updates and want
to keep target_freq readable need to set the new flag.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
 drivers/devfreq/devfreq.c                     | 6 ++++++
 drivers/devfreq/governor_passive.c            | 1 +
 drivers/devfreq/governor_performance.c        | 1 +
 drivers/devfreq/governor_powersave.c          | 1 +
 drivers/devfreq/governor_simpleondemand.c     | 1 +
 drivers/devfreq/governor_userspace.c          | 1 +
 drivers/devfreq/hisi_uncore_freq.c            | 1 +
 drivers/devfreq/tegra30-devfreq.c             | 3 ++-
 include/linux/devfreq-governor.h              | 3 +++
 10 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
index df8ba88b9f6a..5be9940a5853 100644
--- a/Documentation/ABI/testing/sysfs-class-devfreq
+++ b/Documentation/ABI/testing/sysfs-class-devfreq
@@ -37,6 +37,14 @@ Description:
 		The /sys/class/devfreq/.../target_freq shows the next governor
 		predicted target frequency of the corresponding devfreq object.
 
+		Reading this attribute returns -EINVAL when the active
+		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
+		All in-tree governors that drive frequency transitions tag
+		this attribute, so existing in-tree behaviour is unchanged.
+		Out-of-tree governors that previously relied on the
+		unconditional read of df->previous_freq must opt in by
+		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
+
 What:		/sys/class/devfreq/.../trans_stat
 Date:		October 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index f08fc6966eae..2f27a239e34a 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
 {
 	struct devfreq *df = to_devfreq(dev);
 
+	guard(mutex)(&devfreq_list_lock);
+
+	if (!df->profile || !df->governor ||
+	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
+		return -EINVAL;
+
 	return sprintf(buf, "%lu\n", df->previous_freq);
 }
 static DEVICE_ATTR_RO(target_freq);
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index d7feecd900f1..b75e4bbee4b1 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_passive = {
 	.name = DEVFREQ_GOV_PASSIVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
 	.get_target_freq = devfreq_passive_get_target_freq,
 	.event_handler = devfreq_passive_event_handler,
diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
index fdb22bf512cf..b9ec587f582c 100644
--- a/drivers/devfreq/governor_performance.c
+++ b/drivers/devfreq/governor_performance.c
@@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_performance = {
 	.name = DEVFREQ_GOV_PERFORMANCE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_performance_func,
 	.event_handler = devfreq_performance_handler,
 };
diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
index ee2d6ec8a512..69eab1d0a7fc 100644
--- a/drivers/devfreq/governor_powersave.c
+++ b/drivers/devfreq/governor_powersave.c
@@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_powersave = {
 	.name = DEVFREQ_GOV_POWERSAVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_powersave_func,
 	.event_handler = devfreq_powersave_handler,
 };
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index ac9c5e9e51a4..65ff9d912ef9 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
 static struct devfreq_governor devfreq_simple_ondemand = {
 	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
 	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ
 		| DEVFREQ_GOV_ATTR_TIMER,
 	.get_target_freq = devfreq_simple_ondemand_func,
 	.event_handler = devfreq_simple_ondemand_handler,
diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index 3906ebedbae8..d1b765a7b8e5 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_userspace = {
 	.name = DEVFREQ_GOV_USERSPACE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_userspace_func,
 	.event_handler = devfreq_userspace_handler,
 };
diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
index 4d00d813c8ac..0800116e3334 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
 	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
 	 * this governor is not interrupt-driven.
 	 */
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = hisi_platform_gov_func,
 	.event_handler = hisi_platform_gov_handler,
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 401aac6a9f07..fcb278c4a74c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor tegra_devfreq_governor = {
 	.name = "tegra_actmon",
-	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
 		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = tegra_governor_get_target,
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index dfdd0160a29f..2853f571dfdf 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -43,9 +43,12 @@
  *   : Indicate polling_interval sysfs attribute
  * - DEVFREQ_GOV_ATTR_TIMER
  *   : Indicate timer sysfs attribute
+ * - DEVFREQ_GOV_ATTR_TARGET_FREQ
+ *   : Indicate the target freq sysfs attribute
  */
 #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
 #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
+#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
 
 /**
  * struct devfreq_governor - Devfreq policy governor

-- 
2.34.1


