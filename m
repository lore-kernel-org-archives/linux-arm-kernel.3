Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8352CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uz6BHvIAi4ZZMGCXjdqibkmVXRwqdEcijWnO+7zKSF0=; b=fDt7a/FxcNVt7FsA7Zlk9nvyNL
	kKSS3/uxkkUqq2Nay+et284bjGAEBjiP4ME9qoQEVamgIAlP1M2n5zLyuUcn34Q9sEfzjRKLEWs/L
	MXEbXccsPkp9pScNY7nXsyE/WnDG90z86tUXqDGoJeYjwKBKcAghckgcAPd2Zdiq8naG829ZLy/YW
	yEzl3+9GEpNN6dMUAl0ozMj2jK/GJUZ0kAOxIMp2dnO5ZOEmaEfwQYNoohJwKO9sw9kla7KKXHWOX
	hppTQOdI5bkwpYD4jLJTnTw5cWLCrQ/zvI5d6IvT5myBtFF/uozZbefcCvWnAM9YTZSRB5ZLXf3X+
	YwIjVXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Va-0000000ECzw-0Lli;
	Mon, 15 Jun 2026 12:33:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6VJ-0000000ECnJ-49wZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:33:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApdiq151820
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz6BHvIAi4ZZMGCXjdqibkmVXRwqdEcijWnO+7zKSF0=; b=JZ36VXbcqGlVvhmx
	4CR7FwfYs1d+1srZyZMYWWFVHSJn7hrph/ENE2RADLGXVjnkWeCCsauFqIuBpqeD
	Jwn9i4BQkt+M58AbWnS9EFtdpVsgaI6wfYZirnZDPrPQwUVE6Fk08Y4MPO/iPZgZ
	NQgOnqeSUUxbLJ6pmCt/DLRyffJRvJKBSD9wCLC283UVn9k/ZR7lkoHUPQjs+TtH
	CNLRLbbuZTBc9Tt3MwHIOLi/yiXnlXqNMhkonixOozUoMC9X1s7bjkd8TKv/UdqG
	k95GFr6waMiNtW9pot0YCqx2eg9KpRzxmTTz0zjVDSPTVv7RLWAmz/V8t8RowU1l
	32JaoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf0nsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428419982eso3164826b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526804; x=1782131604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz6BHvIAi4ZZMGCXjdqibkmVXRwqdEcijWnO+7zKSF0=;
        b=VeAeKpguzI8AAd/YqdholqMl6fHieATXA5IpbLVfvnsYvAMCu+vGqO3g2Kqo6BhRMh
         +MHK+LXr5NUURK0h3SbulzscG34s/AOLGO1wNjxUEMq4V+8k3tHESN/pqU5rrMZXS0Mv
         z1hmmhDBHqihyvZi10/92BC6CwT9csJF6nuNr10sFlae3zO9H94YYx1ynlhHoLOarClf
         RFidRD50SVGpks2zMRuRjnIukDM4yHjQA3E9X7nUKKO9VVk1DseSEaJThhCM/Tbxxfvy
         gb2QXa6w7fV0b4dRrJt1todDc64/rAGBdaxlhzI0/mexCAytvMDSNOjXr3G/fZV52qz7
         DPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526804; x=1782131604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uz6BHvIAi4ZZMGCXjdqibkmVXRwqdEcijWnO+7zKSF0=;
        b=FSzfR66be19yGSQywMNAZc5V6ApdFY4Lv3yiMIupGKcoQgim5zABwfxk9ezeVgq8zk
         E0yMVHAaFD2iNOiVR0CBK6G9CvXwVoOeeWt6TBWvkeBOTuriN/JTygqpmU69pOX2OfSW
         QzRt9gqU+/RVSn6TpHdvplM3AeG97mJaKuiZpe1JXNud519FeGtdpOx7JEB88KZMzyh8
         jryt1HJAkTldcdJzHUCbGV+f1BEPwk5z8CcNjKy+YsFHdK3DWKe4d14+uHNTbuhl4/tx
         NzGEJDxSuRQC0daEmtE321m6ksx/hd/OcVy6gFrw1zUZnmua1L80NA04XFEx9tvzB0Jd
         BqIA==
X-Forwarded-Encrypted: i=1; AFNElJ8E+scVbb96O0nZDTGdDy6Octg8y7kxNPxmUVmyKP+UqW8QyVn/D4Kupfnvc6REvB7VSWXEPJT40vQ9P8KphMCP@lists.infradead.org
X-Gm-Message-State: AOJu0YzApZqcLNLwZHHy+OvGsz5WMk3pwxCTx/gzrkvAk7ItApT5+orl
	kHRwbXyoUu3KaGECIu8dh403sJiMAPpFG8CVVmF4YkcDW1ECb6TTlPJtojZydeWftkC0dyFOkZi
	VfXwLXNsMLFUAek4cYwRgHU5wuxNLJKc9S6td2xaNoJH4tdQg+j/0lYGOUoXbu8nXn1UozRDaF4
	BBXg==
X-Gm-Gg: Acq92OFdzTOAE0nSrz1JZYJdsp4TLPuhXnPkrSqxk1DWfGaehdRdBcujDjKSQv9v5/Q
	kCipK1Wk6143tr0So6GGHFQDQMmGNug2SabxOI1PZuuiki7nwA3B9so5lleQ9JdOHRLmhDFF5uR
	RFSI1FdmJPpJWMrZWcDpD8FWbWFzDc1K8iMolP4KDW6tqj0bFqFBfQNtSgoW7jLLjAHYYcVmU6L
	YRkkQVsSivYFiXXaPiu3dG1OawQGBKrsLp5EF5UE4DFsV5SPvGvF95SBnPgsgaKLi31QqpgiLUB
	my7NTZkEg3LrrDFislZjt/zh1LuRzeGIecPzpbdgH+O4Sn9C1wYtekHxLcmWJIoIfLMAHTceuey
	K4A1MC9y/rDyUZ84uUcJbh5S3j88a/jScA8dX4WHbbgIXG3vBAZLP6xMekFjYn4S6hHbqiOl65C
	3J57vAtRfKcGI2TA==
X-Received: by 2002:a05:6a00:3d48:b0:838:127d:a167 with SMTP id d2e1a72fcca58-844e1987135mr12122144b3a.16.1781526803785;
        Mon, 15 Jun 2026 05:33:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d48:b0:838:127d:a167 with SMTP id d2e1a72fcca58-844e1987135mr12122077b3a.16.1781526803130;
        Mon, 15 Jun 2026 05:33:23 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm9968393b3a.50.2026.06.15.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:33:22 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 20:32:33 +0800
Subject: [PATCH v10 5/5] coresight: cti: document banked and missing base
 CTI sysfs registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-extended_cti-v10-5-1c1694b6d8ed@oss.qualcomm.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
In-Reply-To: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526782; l=4728;
 i=yingchao.deng@oss.qualcomm.com; s=20260611; h=from:subject:message-id;
 bh=sVNEsaKI0s3R6oPe1epN5ZwL+HwElnwD/2wqBgGhWsc=;
 b=xrjzXq+0FweLFMAZP6AFuQu+4WYGHuaVkvve5aDJ9J4hda+bhLUMZE3XQOwes46WyedpL9P34
 yq3JNirfcD4AaZ+Zaj2JLxOo9yCEP2ml2BAz1gpbGpZ8fG/wQq7xtet
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=+y3U2mIt7mf0C+x6qBUD670cd9S2QV+yl5015bUYMgs=
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2ff114 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ZlVeDcQYEk3IPcOgC64A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -LGuWQGMLQvOcEdcLTmzRp7WQqBYCa8P
X-Proofpoint-ORIG-GUID: -LGuWQGMLQvOcEdcLTmzRp7WQqBYCa8P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfXyveaX+alNaUo
 aw9KPUsgtuyi3B+9zfFU708mY55N7gzRTXBM8QnmZh+9m6floJ8cqntSLRf2LMBPCeDeG6lZP0d
 UWaQv4Zcy/GUJWma/Ziw7l8BUAE8sYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX/bomDyQIhs8R
 vuvoosfXs3Ms/vjzyc/IQMh62K8idfxEn5zi6dcCIO13tM2H6voEFYzwV6HwBP0dP0TvW/MGRK5
 mhptV+wdHvoBwr0kTr8YyC1C30bpip5r3+49zTBAnqbFWT51WvBORWyFYRFLjdIt09RjwXRf0UD
 LL2inu0KN65RpQUsaURkb3yf7jPk5BF5N+6qRWK4gIh82mdmHXdwAG4OcVdSnhBVrHeZysd1Pes
 y1bcpAh0hZR36c95NztVPBHadBpBw5ChdPWNkLwVvOc5bV9k98iiYoNjtfd0S85jqhewSADaoM4
 19M8XOwls3Rk/skkMz/mQQOTaLJwvDVMNkfU6Kj5ijs/x2qcVUO+hmM1RkHIX0gpwvDWkTA4DAv
 nvxoUX1D65UFj2lJHh6AXRnulCoP2yvgjz7FVz4lW9cqtfoJkau070guehwLhwK0JOshNeaW5sD
 mWNwAzcXpuji7YwCdXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053327_111091_23274E02 
X-CRM114-Status: GOOD (  11.95  )
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

Document the new sysfs entries triginstatus[1-3], trigoutstatus[1-3],
ittrigin[1-3], ittrigout[1-3], ittrigoutack[1-3] and ittriginack[1-3]
in the coresight-cti ABI documentation.

Also document the previously undocumented base integration test
registers itctrl, itchin, itchinack, ittrigin, ittriginack, itchout,
itchoutack, ittrigout and ittrigoutack, which were introduced in
kernel version 5.7.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-cti    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
index a2aef7f5a6d7..9d7831ac455b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -128,12 +128,102 @@ KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) read current status of input trigger signals
 
+What:		/sys/bus/coresight/devices/<cti-name>/regs/triginstatus[1-3]
+Date:		June 2026
+KernelVersion:	7.3
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
+Description:	(Read) read current status of QCOM extended input trigger signals.
+
 What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus
 Date:		March 2020
 KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) read current status of output trigger signals.
 
+What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus[1-3]
+Date:		June 2026
+KernelVersion:	7.3
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
+Description:	(Read) read current status of QCOM extended output trigger signals.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itctrl
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Control integration mode.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchin
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the values of the CTCHIN inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchinack
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Write) Write the value of the CTCHINACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the values of the CTTRIGIN inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin[1-3]
+Date:		June 2026
+KernelVersion:	7.3
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
+Description:	(Read) Read the values of the QCOM extended CTTRIGIN inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Write) Write the value of the CTTRIGINACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack[1-3]
+Date:		June 2026
+KernelVersion:	7.3
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
+Description:	(Write) Write the value of the QCOM extended CTTRIGINACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchout
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Read or write the value of the CTCHOUT outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchoutack
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the value of the CTCHOUTACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Read or write the value of the CTTRIGOUT outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout[1-3]
+Date:		June 2026
+KernelVersion:	7.3
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
+Description:	(RW) Read or write the value of the QCOM extended CTTRIGOUT outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack
+Date:		March 2020
+KernelVersion:	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the value of the CTTRIGOUTACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack[1-3]
+Date:		June 2026
+KernelVersion:	7.3
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
+Description:	(Read) Read the value of the QCOM extended CTTRIGOUTACK input.
+
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
 Date:		March 2020
 KernelVersion:	5.7

-- 
2.43.0


