Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A21C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sQKqVns/Die+3pCYhE6oYhJiqMcHOY2cyLGiHjio/mM=; b=drjzwU0y7av5SV
	HqnKj2Br4dLHDpjWzl+OkxedJ+3Nw+6DFgW0ArYtdxJ6vxjQxF1IM8xIYGNoXrdhKkq09/ywJIsqn
	c6XoF4vF77JNCBkNg3yukxiDFKQuHboTltiWxVAU3XgiZmq5A91PgERmTToG7XvwySYgItZmvesUS
	D7xWtW9Zs9jH8QI2ZGWXhEKhArn4MUHd9BtFg5+qxPPTBMgW5LMWSIni7vM31yy9m3q1njTMnVzh3
	kfAnhV7L545yAf+WIQ2L0menFTmmkKkIIZkHTChhrXrogMGqt+UXfOfVjBXBqEoRpiJZubGu1hX16
	5IVlYtRHMvOnZGdo75nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHKw-0000000C32a-2u6T;
	Mon, 26 Jan 2026 07:48:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHKu-0000000C323-0N4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:48:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q7eo593419777
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sQKqVns/Die+3pCYhE6oYh
	JiqMcHOY2cyLGiHjio/mM=; b=Q54uyLx7xneXmc+bM2lrrAdSCfTm0+cERVpoWN
	jCmrIEZ1XPuho0+n/tpXwM5kvIpkbCdm+L7lx3R42gvkwxLUipdRMgno7dSR05pJ
	9d7X/YnM4bja/6NDvW4ttT+HWqsAW+PAFzoefTDoSM6UeHo9AWAFsN9H/jaC43dW
	nvuTGsZIdvxCXCK0HJwJ/rzEuLH+KzRJqRpeiJ7/TGGE3gr39uMWScQEzYmuIayC
	o4jdp+AbGSBkb5+MD8HSMM6MntRsNz/ezRNwPB3uQU3VuubYzeZ6ENkAHf9FESj7
	TF7j14/OsS2f3KIYD9/bzONH4bLcmN4Ip3Jhb98PvY3GwqKw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24ksgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so3617260b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413713; x=1770018513; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQKqVns/Die+3pCYhE6oYhJiqMcHOY2cyLGiHjio/mM=;
        b=As0Axm+e2m2mgnMVG5Qgbwg9vwFJ1HqlswHFjATnexV0dq0QLoDt5O66Ct8D951Qqs
         jNfJ3aHx4toTn0nXyx8J0leGaZfG+Nba3CL6TJLoCP49HVz7Bnw79W8aJ579fXfFxok3
         y0VIu++RBkzFdMPrXL7/4kFAjHl6xOvuWUbQ1pxrtal4XLG5cYUUdEk1PipMCpwSt2u1
         XF3FWyacVXqiUiey+6J5shzTgzdYwlyp9VpIDBH0p6cfTOor/Gg4FAHsLCTUq3my3Vk3
         4QG15u+TZhWdg3JjPJPgFX71DUiOiKLPzLz0dUG2gHnlPXPXYqRf6YavFzKm6zRnpvah
         Khfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413713; x=1770018513;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQKqVns/Die+3pCYhE6oYhJiqMcHOY2cyLGiHjio/mM=;
        b=xLYZqu0MgoPDTWm82/ZGD+lFZN/LpPjn3mIYS+SaGrEoqTQGh6XoUpXvprlxUaVcbH
         hVLSW8pPuo0FwJGap3kkHV6jsI3nhy/uUl1ikplTeUv8MInInU98szEwGEnPUyDluCHt
         vMSfVZ2PzhbLe3RAjbDLGisRhMtWktrpmP6Gj9itf6jUBro/8wSdMCG+khCAct56ZoHJ
         Se+X3lfoulKncx0s7bYdz/NWAjdUQjc/m9tjcpdgqVwHxDC9ZXL7+MBoVDq3hCn6SCGW
         DkthmQPFKX/pXeZMNzcaXd++7o8TGq/wlworHdgGxB+42YfU4hxG7tdt7HLZk2W5ENTx
         Hghw==
X-Forwarded-Encrypted: i=1; AJvYcCXS2YU6aGLwQN0HURviyCzlMsyOrEnJGCoC8ia51tdeJiDAsqrwgHFRzg1yK5x13SywyaJgh5fJ36SZyos0wpi4@lists.infradead.org
X-Gm-Message-State: AOJu0YzIC30crHFqjzqUcIBTCBJ1v7FX9mpOBgtK82Fkr7I69xBlPvLA
	d0UUyjRhkuoboBCtXA1QY/OKeu4y1Y/u2Yq3xHbl6/Bjl2rAIQiZan7a7K1my6cQnZx1c6rz+tH
	qRT7dHAvWYI85bB5TjT1fPKP8hlHk2vZJ1WKICzlpEt2ZBekzut1hpUJKbN9jlkQSy+KV5a3C6J
	r7VA==
X-Gm-Gg: AZuq6aJoqVFAnN6/ZAQ+cr9IXjpfDphrKH3FvzftzxSzqI8I4xZgJVgSjRltvQZWoU6
	e50etjDImhEG9mEWLV/WmKUYmYi9dUnWNyOTRpBKk9IpCVZ9/GOwXvSpeb78HbhcCxE0hbQPmQO
	5ZTTJ5rJPwpPczsspBQiYH9PhpPeFhakAJrTvZR+pRdF2mc+8/2sBHJ4KewfJLY56xI9bdhJHji
	6+9hF9J63SzX7r79R9zJ3imxJJghtnIrtbkVG1Efwt4Wtb+NyYup0/PS9X3n4iaqIMVq9QupoaA
	L6QEdRCvbTPuOYuO64r5v56hSdw2U1uOmf3ubK+mahIVWtVwZ2OwHWltNG0Abfscd+S1o50aKSw
	hYyY32xHbjR1J/6oZfdJL8EkGv0z2UvNYRQtpF121kgg6oLR90U1fRbA3fobi8NL8YnXT3FOoKc
	Fv
X-Received: by 2002:a05:6a00:2997:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-823411fac55mr2933147b3a.22.1769413712984;
        Sun, 25 Jan 2026 23:48:32 -0800 (PST)
X-Received: by 2002:a05:6a00:2997:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-823411fac55mr2933121b3a.22.1769413712439;
        Sun, 25 Jan 2026 23:48:32 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:32 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v11 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 26 Jan 2026 15:47:52 +0800
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACocd2kC/33NQQrCMBAF0KtI1o5kkrQmrryHuGjTiQa00aQWp
 fTuxqLgQrsZ+B/+m4Elip4S2ywGFqn3yYc2B8Tlgtlj1R4IfJMLJrgoUHAJ1Fb1iaB+dAS27SK
 4EMF29gZFpWqtnXBUG5b3l0jO3yd8t8/56FMX4mP61etX+1YRZ9ReAwdJKJyTKNHgNqS0ut6qk
 w3n8yof9sJ78wUKNQeaDGpdWqVM6ahRf0DkH7HkmZwTkWdSCLPWJC2Wxv0gx3F8AnNwbftuAQA
 A
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
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
        Mike Leach <mike.leach@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=6974;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ZaOprxm+igQlpDv+uMYUMoteyMudp7AZ4eQ5176LnhE=;
 b=jye/Zk9FhM9ELdxLbXwCs8xmSR6p6ima68+VW5m+/hN8cK0Xo0BDuCX+dPL9TMcIGSrecaOJs
 RhxJWOVw/3MDaUXevg/PNhe/hipsy0rsTbHiqdQinzap4B8X8G5TuWP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX+KL/5C4WcwLM
 r/PuuEDnDWZQTyqsjF+Njx0IxcO0AUslurzRzzHCbk9m5L8dl7/+y7XoTCR4lTtiUGBu7mnUwWH
 E9eLvrhrfTzGj7+h0Ocysmfywc2s0b7H0dVH1gd7nyHNamvpxj+5FKlJ9s46BzEWAEF4n8Bmi4W
 r4/UWFvF8L3c1GI+nXqFKtWIJZlh1E5ikAq/5RNY2wjP+luJRh+Xv5oRsJQjyKMpf5uWk5h47ax
 WjVXFNkw7qv79u0a38CYuhfnkcTDwZfL1CJT7cXd09XO68toTsOE/Ltg9R+n2VcY5V6BzhT+Rtn
 pDIHB/H/T46JWLjVHM+B5LVqKzqqzPRe1LjTuwTZFNl5668BKP0jpL5IomaHjHznUVfi8q/NPBD
 G0C+L9sVETJYcWfz9hf3JzGPiatjYxV2Uqv3rS/cqrBHnkjB+gtTrqq8ArVr27I/SsL+zF4tfSS
 Skw10BOK7jR6AHNdnHA==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69771c52 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VhXNoj4JT-yUwxqwOhYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e1GVnz8mEtwwMT-oGhiy1PfPDZQtzvwy
X-Proofpoint-ORIG-GUID: e1GVnz8mEtwwMT-oGhiy1PfPDZQtzvwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234836_282858_D13EBA66 
X-CRM114-Status: GOOD (  27.57  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (8):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: refactor the tmc_etr_get_catu_device function
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
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
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 103 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 144 +++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  38 ++-
 13 files changed, 829 insertions(+), 73 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


