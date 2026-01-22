Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8592CD2ED14
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w6PObcjwIg/Fosc91JX07ivYl/s0K1Jex2A4JyQ5NLk=; b=ONCxd28TTwWACc
	twpF4baOzwXndyq/e/1xl4B0z673tDQ5zXOOyOnJ+93B73/wfTJkynw0HIIsUpOqGfjlFvhlEiyq6
	DGIJaexB5B323XmsG5Ncj7IiMyR8tbSwHGounGUe0oho/BDntSlW/VE3juaAl5zU7yjMUhf7Y3cNf
	b8b13uNy5LQ1jlCVTSejB97jOrj66CeGGOPVWlLSGY8Hy5MKXJ7O6z5ctEAE8M8ahTgcTpSUmx/39
	UpQAFKHS6ySwuC5sPzBkQRakB8x5maQ5idBStZ4jWwGmmSCPX+RnfChCY6KJUZtU2oflZ2Q+AMquG
	/Pc54lVr35Xba+NjD3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik7t-00000006IjP-0K4D;
	Thu, 22 Jan 2026 02:08:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik7q-00000006Iiu-0F6d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:08:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLNWCY788893
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w6PObcjwIg/Fosc91JX07i
	vYl/s0K1Jex2A4JyQ5NLk=; b=OyfHjI1IU/5DBhyr6u+2+uFo/r/tB5mGP6CSda
	/VbVCMO0ExMfmx48FAVklooV7MYgox1e0V9zxpfpHUi/9E6aONKJG4SthRW5D4nv
	e5wwgoT0j81apwPWsp69OJmGciVuoFbjqbfW7RXaFuFymeN6XSC5ogZY2gJ3mAas
	xZ+5B+LNprQy+oeUj7PKGhCbMfokBESQ0cZllZ8ggkoHy7Lt8G2apLBTx8ZzEcjm
	dTkywbZ0VzTRvvVX9QLRoPn6q5MKpylUv4nGpl+2WEbc3SG5O03TAuTYvqTQo7no
	hfbRkM2/R+Qboe6wkzU70xQxcuJ+yFWo8uTbV4p37tYXx9BQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6p1gn1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a377e15716so9162495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047722; x=1769652522; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6PObcjwIg/Fosc91JX07ivYl/s0K1Jex2A4JyQ5NLk=;
        b=ckbXZz8/aaMhPfTKZCIf+12B+j9KEbfTORBr0JNjdxomk+vrKCY1K8KTMpUm+bAmPq
         upBqv8AAR93hSxKsXxcc1pMfzuoU/M9Oqq+vRGhollUK+qj3WkdYYXIEsga5FKX0cjMH
         xShcmqL6llXaEw3OSFhI6Slb/95fBAOVhOb+H21lP9psqyCsbI+TTob9fP3sSvK3KMu0
         7U9sMTv5VIf510xt5g/BDtVZRFoNFcBlOd8mvJBeLNgOm2ASaDtJ8I/sSDWtPZdFCvfx
         fZCoY4e4dAcZpiWLmI3pKgF3ONg8L0MFTiLDu2R0+ScA8PIrU9abE7SBe+KcASLxDD0I
         WGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047722; x=1769652522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6PObcjwIg/Fosc91JX07ivYl/s0K1Jex2A4JyQ5NLk=;
        b=A9mFoMoFW0cPxFe5LW4PAyFlTWn3wvyvQHN9WPNZLMWvQ27trx9/dBU6Hk6AStJxcQ
         pVNSr/N3Wm+lABc7O7n/vLdCkyWi1MUAzOZMBYZA9rzN+loJLu2EapbBNBVE4TrELJv8
         jmUKAT61+5hD6oW7xbSMJHP/1Mc3ZtpQsicJoLyP/WvwzwwbvudxKM38Yd31LN0ebRDF
         xDycdqxsXiE8Sc80ghfGqNL9dKKmli6TmvnFBJ83y8woapVL1VR1a3GEZPIdbR2gdAoi
         dFx0OxDpYjx4ZzODHlbEaeSogxNEGXf57dcKWJqiYXviTufc44s+x3XxHmP8YeBU41Ow
         HjBw==
X-Forwarded-Encrypted: i=1; AJvYcCUkKUkUeCO+iG7AxLyYQyFNOVDQXhJNbnCEugKhiXDL+3+9NaqTKqL7UBqTctpvB/9yCnWwUKkc+qL4EC1sNO3u@lists.infradead.org
X-Gm-Message-State: AOJu0YyEoXCshn/BexaLEbGgqMP0p2H69Ofqy7glZJJI6+lxNI+0q7Ab
	QuKkd/Airy7hfj681tEL7Ml5p90oSTg/h5R2gT4vNH4p9udmEV/Rl6Eg3RbzHWLLe8jf4w5nmmH
	jgwrkD2NEjxK2xt64sXLSx50oNhGOUGrBaObMjK3SOJDjbw4rwI/+QbmKL9lD5ILIDYmdA7Y0Ke
	+0KB1yn4rjNg==
X-Gm-Gg: AZuq6aIAoxy+dnhA/KNe6JKnGkwUWLQEQCJgkmPg4Z2TrDu/Ud7Y2zQD/0C2WQRVMRr
	cLiX3OruuMzoWtH9Rp2L08ban32MjPjd49zowXWSxWmt2I6IZFZSx0pazXZLw4pWMTwqKX6XaG1
	gUASiQGIigw8DK8hViPcd0aX4k4zJygzXvYB5CBvbLdDfTIV5qIJq10gQyHYOoP2gzJnBw6Zh31
	1buSO8OHX7ouZ/EgxqQvwFriBVrW0W9Gnb7DvL1fcDeoiWSRR2gD/Durfe1YBuXz82XoOPM+fIx
	dc+Lw89balkDuH+swmfgfh2IRjCtWz/1ZXQ5fiPyT05wjJMxy4LR94fd4hAqpXDci0A4KCRxKZf
	zOoq5aHfx3xViRJhYpzLrbI4+9Z4OBe7ZeO0zzspotib7Njg4NI5p44xv359IZG5cS5fmqxWK
X-Received: by 2002:a17:902:d4c7:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a718894b9fmr176740675ad.23.1769047721851;
        Wed, 21 Jan 2026 18:08:41 -0800 (PST)
X-Received: by 2002:a17:902:d4c7:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a718894b9fmr176740265ad.23.1769047721212;
        Wed, 21 Jan 2026 18:08:41 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:08:40 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v10 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Thu, 22 Jan 2026 10:08:13 +0800
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6GcWkC/33NTQqDMBAF4KuUrDtifpSkq96jdKFxUgNq2kRDR
 bx7o3TRRXEz8B68bxYS0FsM5HJaiMdog3VDCjQ/n4huq+GBYJtUEJazgrKcAw5V3SHU84igh9G
 DcR70qCcoKlFLaZjBWpG0f3o09r3jt3vKrQ2j8/P+K8qt/aqUHqhRQg4cKTOGU04VvboQstdUd
 dr1fZYO2fCofkAmjkCVQClLLYQqDTbiD7iu6wfn3lWgGwEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047714; l=6693;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wsPMFRTGVtujrwEckG9FwibRpPp8G9fD/l0bRmCc/xo=;
 b=RW2TC1pv1lh0GmYuJa7Ycm5bYI0F9NlbbS+/OvQpzyn9KNe9HymW/na/+8SXRCzCPVoxTwZU/
 7IVYkXRqlhKDO60lFuBBWd91Vo4kFejtBz0btjJk31vXUaFM6PzZqkG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: EH0AE6_jndqM7Imp9K7IzO-C1-6rjxNv
X-Authority-Analysis: v=2.4 cv=N7ck1m9B c=1 sm=1 tr=0 ts=697186ab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VhXNoj4JT-yUwxqwOhYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EH0AE6_jndqM7Imp9K7IzO-C1-6rjxNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfXwOUc1hqKHohk
 2KPTWoJATk6/C8l9oFL1/LxSni269+EkmUEtQmdcqMgyBvy04q4NC1KxVpKsx/u2Q3jmvNpObZM
 1yhHwCCy78vRQJ8kERknOWUv5CgBGrWxoIZQsXdM7Wkcnhu/4vEcSDjTaeL0Z6rKvJKrp0N2YBk
 sVj+vslZnLnxvNQqWtVOJBh1bpjNI0gSZ0MnpgXJTTIVEXl8Pd8Gkn/f9g5ZVIpEkr3tWF3s/t5
 8w5C8m5OR6/3kTQQvTMlIem+lNJdbf93TA/TvdW1Diali+rrs46CnQX3y4deynKJdA3i9DlIXNf
 f/qbnzD4pyQBM1a+Hyrkv/gcETft2S2mVDoEaRRd+iC8Xms9O0Eh41dnlWpn0qefhR13LvYhNxv
 pYwfNx5GYNYSKCJDRN33yB11H55re3gxmLqsZrY5Mq8gWUFHdnwZZKf8VOIcUkiDpqDWX1VwDw0
 4pIY7DVu3Ad/ZPju49A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180846_221780_C1E9B407 
X-CRM114-Status: GOOD (  27.44  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (8):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
      coresight: etr: refactor the tmc_etr_get_catu_device function
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 366 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 144 +++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  40 ++-
 13 files changed, 833 insertions(+), 72 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


