Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125D8EFCD71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8MyYHMdqwx9jeWh2ZShYllz65zXkXeQo7KoCbCSjLgk=; b=C3ZpVoHovkgkF6
	jiJNbnSLr9Fb7/CfHaKzfkLhVZjgU0NBQaRFi2Nj9u/5eQPhtrHRW7kLr4EiezLraojY2gph1PIuS
	x3oLNW26mz3n6VuDULeJHGg/UN9kBUz2RF+O6ADuF/TZGN7NAl39ee0N9KRVM/tuRW2miykH9VcwG
	FcBlKNdvnX838ozad1g7hDSxzI1KL5IR11vr7t/l2qSemC7YwqMVUiw229Jfy7eaSP8ZEDGTiOWNw
	keRdswEcFluaSjCmOuDs6ekOC1JQm5fnPl9vxQb03MZYVrAFLuiTYSXc3fALYICIZltndxyWxy4BN
	jsq/cvtnvRIYOm5Clkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXDn-000000070sh-17KV;
	Mon, 09 Mar 2026 09:48:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXDk-000000070sG-1hc5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:48:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WE2F3773310
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8MyYHMdqwx9jeWh2ZShYll
	z65zXkXeQo7KoCbCSjLgk=; b=Zf6bgdf3oVn9Xt4tVXKbWt/E97HHvSTcTxfBsY
	nk6CAoHXIqfAr+EURaRzwd0QoEudjScvjeB15wwkhhR+EPkP2Pa3xXJrLE2zqWvW
	ioFS9AO9xOQfv2pO0Wirjbyao4kN3EzHk3EPoTMal8+Z9Ie6yu92Od1pheh88dqg
	+PtRu0KtNBd2jC3SXEAu6v3vF0CtuzjYXm07ZEdO+PB90kHgTO3JhVMllPvBR23v
	JdiXcjnvRInZuOnWHTYU6kEXdN5GaAloo6bClSzy0UMhOTC6/NmznKc09TTAkYOG
	MGyQe3WoSgzrSuY7YSc4K9A230RXAJsdiXxkl3hIzD5WqtBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa89dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4cdfc468so77762525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049693; x=1773654493; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8MyYHMdqwx9jeWh2ZShYllz65zXkXeQo7KoCbCSjLgk=;
        b=XhTJ4z/QaVFPhFHd3Srss46PpnA4lsZHO+CdAC1BtqLF3u/CGAT2BM6tqfKdRB4ddU
         OO8Gik2mA7tCe65KImOmBaKMbRyDquWBnOUEdvxsQIz6sMgPmvQRkyJRkeB6jzjRnVUX
         Z76HhW1D1BlkVe8RayyZsE0APlnoILK6oYdo4oVJry2mLv+B5zel22Z3zD1Hp9qMko4V
         dZiCy7+/Y7giG841ggyQlCrkeHR3Z+wbYx0SyWtPDhmgK5pSpCLXk6xWka3rdL/faP+e
         uSPHdO4cfVOHM9ApXXverpIty8mp3JNiy+Bno3554kTYBRW1xM5hkH5HCuWZA8euF/85
         p/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049693; x=1773654493;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MyYHMdqwx9jeWh2ZShYllz65zXkXeQo7KoCbCSjLgk=;
        b=et2h6Ui/yBKNInUdyvLi1bsrfSn+qoJ8zl61ghv8/XU/gSigdY2HLQ+/vO0ZDPWLqD
         kZNNBZY/Fw580bqOhCy7MNJ8acRMf0ckTnzvO4RJ6Y4G2cOukz/pTQBnhGtvSTm3/+IH
         fLuRabet8Y+WUijCqJmugH9Gp/NeP1+jbsoTp+lx1AYkhs4CVXSHUABmqzKZy8asTYsr
         EOktcgHCsY32m0Tg4da0dIl7uxSbVnlKaY6EpAoFJ/0/1a5bj/hxk6TeWeW59gg0VMU1
         PVFy6DqSunHdSR1eK2yweZvQuYgMJBHR52d5Qt5elnW/7CQpckc3+OwebzQIQrVX6wUb
         Y4dg==
X-Forwarded-Encrypted: i=1; AJvYcCXcayq+qzI5fpVECUTp0BOTgT3cO2zT3MKT8Oegl6QjdZAq7PFrl+PUOcWFlV9OD+c2GoJ0e4jhsXu+6tL+nDUs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9h61uNKcYzfvj0IIoKMfQRut5n+zZllG1B3V4ZmtIrxF5mnHZ
	dCNANRssChoAKP8INX9F7pbJnXxcSHCLK8QsBB3jI0RyEz6x6AAOCBTD30+IJoJkif7V0mN60F5
	Lqw2Hv9RWoEuCqMwX9lJhbTXnA1Y2DdBYcvBI6SulDAHuZGaadN7jrdCYHzEA9mY5MHPiLuphPo
	kfRA==
X-Gm-Gg: ATEYQzxwyiCF6WTJV0sH9BTA+MxH1wScVFvIfTbxsOCTM7FdBHVZ3Uy/F58BVyaupa0
	l8F6U6+wudXTmk/0kXJp1l4jDvdwPr27nvDiA4mqXmGcMPdXGQgnjdjf/ZaZKyz7Dt55XlEpQav
	LcpWQiHPB+gcvJWEar905Ej2ADeLUeXxxftEbemim7stDvUAaOoZM2Xixtq4gbWvtFgRTYf3JhO
	sLmw0sAlU+zj+bAe6+Ycg+Ng5V1/+VT+Oj3m6n5Nlf0IA6pVS+Irzsmw8gl2WwAg6K3Dwb/hJ+b
	RMEVuGU6yIOwOFJQEOqNNXD6BgbmALFkQ5dL8AeVAS8go98BciWHMtHk9LMNzuJKdRHWqPg9P/7
	IpQ2i+v1T9OmwNnbwCoFY2AEvyno7DSQFiLJ8gV2r8W/19fwPGa1xht4YI6WDi/xj9kkD7igo5R
	EYbn7Y/TJD
X-Received: by 2002:a17:902:ebc2:b0:2ae:3bb2:a8c0 with SMTP id d9443c01a7336-2ae82476ea9mr125505955ad.44.1773049693100;
        Mon, 09 Mar 2026 02:48:13 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2ae:3bb2:a8c0 with SMTP id d9443c01a7336-2ae82476ea9mr125505785ad.44.1773049692574;
        Mon, 09 Mar 2026 02:48:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v14 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 09 Mar 2026 17:47:39 +0800
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD2XrmkC/x2MwQrCMBAFf6Xs2YW0ltj6K+KhSd/qgqSyiaKU/
 ntDjzMws1KGKTJdm5UMX826pAptf2ooPqf0AOtcBXWu8+7sRkaawgsc/gUcUzGWxTiW+GGRwcO
 34xAuQrV/G0R/x/x237YdXc7UL2wAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049686; l=8337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Ur9ZbyPYZ2bHLgztSEXn2DrTgZoj3F8nnYaNdGKTF2k=;
 b=qsKO26xH6T+Lk6enl3J9EbOeQKZfLln7TdLRKYWMlkWRP1fpdGh+qN8L9y+fn/b80tkw6eL1d
 tElv/SZHuWHAe5hB9w19w9jMUvoLAZwpZCpJ7sTTwVuq/QGS508T/iY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: JT6f4N7R_lg_XwOemLCar5JLRWHi8FmM
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69ae975e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=6IPhZ7wLu3BbSa2q1HkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX0TJJcfW6q7Er
 5Y/v5DNVjS3JxRcfnGL7PatD1Cuy8akJTk68CAyuYfWEFz+6icUjei0uWdorTeDwkT0gabemL5H
 GirMjYWiNOerxBYQvwiDkpf5RA0k6kFOtRBL5Ez4xa1uTYuVGZ7POENeJY8sOizGVhLQiji1hg2
 x8hYvh2/Fcxc3nZc5LhV4fEdaMICcvTSGCLSI1UGWfc+KCDGaDyPll3rlPeSpXHVXjC+jgVSYRh
 IYeu2JMmrHzZ6/i8hhiLyN6btm9UaMYrwdezwCXg/BJkxSH7nAAxW0nnEU4lM5/tqbfwJWjazLS
 SZKWF+bomB9V/+fAMb/WSHhKLkl8UjCEAw/iq+89m3p7+TS/DkYVofBMeLSoq4qyvFQFf8J6XUq
 hl2MD1ZdNAJvfSMnx91uYJPYhZokz1V0V91oj/6unr7B8A07q4G1y5GEbdkL8hZ9zeYm4ayvbVD
 7d9KQmoiUCb6BuZltCQ==
X-Proofpoint-ORIG-GUID: JT6f4N7R_lg_XwOemLCar5JLRWHi8FmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024816_565246_54004204 
X-CRM114-Status: GOOD (  28.11  )
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

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0

---
Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  58 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 136 ++++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
 12 files changed, 768 insertions(+), 61 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


