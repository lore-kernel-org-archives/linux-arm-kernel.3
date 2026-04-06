Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A7F46C47
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSdyM7hl7sg1/Z6iB5/mSRIZy42Bhi9AwwpXXv3x3hM=; b=4HW+n/GSogbhNTDVDajiWB99Lq
	vbCVytnSO7CYd0GWd/9LF761+VIlrzuQNuCaoHFvcD5wjKEMcLDSCKOglBvZF57P4dl3IeRnWl+Bm
	MDYcLqcQioy/4dKkQQ+YXo+EnFhv/uUyZ8rLTPhDxN5AH2DE4C7ep+hCUzEawm3VUu2Xy0bkod/uk
	VcSYW5K1J8LWvkwuQQ8wezK4oYRP2k7PvA4rdhD7lA8WXqeWVBNwam1dugDoJuLfEZXIuC15myiwP
	/sh7RDIsfCPwDbh9Z8fJWiYNVzbTTaQd116oJagKOlnPXzqz8TT1GOV7BvHri/9GbZstWHIAtWQsQ
	/FP7tw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6z-00000005D0G-2hXW;
	Mon, 06 Apr 2026 14:39:33 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9l6x-00000005Cxz-2Qqo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 14:39:32 +0000
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636CLwjH1575795;
	Mon, 6 Apr 2026 14:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=dSdyM7hl7sg1/
	Z6iB5/mSRIZy42Bhi9AwwpXXv3x3hM=; b=P19K56e0LF88gmGcxjEoTXRl4tqni
	OoxgEc5zLxlyolI98YZ5GnX0eI5uXFZ3iQcNZSVhlzOCSwoSiTP/0FIWiCO+Esue
	71zHWNEkX3tpK3QuASA37FFA4gfT3Otgo9TzjmLxdtlremqb7ZUlxqjUi3weZei3
	crCa9rxf2RkY0KSgcae5WFQDGmPGCTwn+rgz0iSbsU0UXd17t6mKr20Qt7GcNJ7f
	u+JHqkS0dVxiP8ax4r+dg1CZN79tAjrk+iKJsppPn0f+HvWJKqbb3z04pQ6ISXFE
	yWUZz8sZ/uTThWG0EzYnqhQqfP5bVZ+uoo5Zr6+avuM0iRqIeV8f9HmZw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dcb03tjer-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 14:39:26 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id E599BD1D6;
	Mon,  6 Apr 2026 14:39:25 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 8232F806B59;
	Mon,  6 Apr 2026 14:39:25 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: defconfig: Enable ARCH_HPE
Date: Mon,  6 Apr 2026 14:38:21 +0000
Message-ID: <20260406143821.1843621-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406143821.1843621-1-nick.hawkins@hpe.com>
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R5EMfhhS6me78FPnL-nNkY7DwEcODuGR
X-Proofpoint-GUID: R5EMfhhS6me78FPnL-nNkY7DwEcODuGR
X-Authority-Analysis: v=2.4 cv=KOhXzVFo c=1 sm=1 tr=0 ts=69d3c59e cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=3haJ9R1Aw3gUfsUHDaCR:22 a=MvuuwTCpAAAA:8 a=wZsj7YBYw0PqTYP2OA8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NCBTYWx0ZWRfX4uTIzwC5NDs7
 tuGSEI+Ua8Tu93AhvGyfVWOJWZInMT91HwYxXFOrx9TF5XNkLEOsC6pb2iBVbegurzH6bkQAo5B
 RCc8epJycZhFibpVm1J1sfKlkWCcgD9kiaNj2cE7i0p2EsVyI9AamPalAoq9ES0MJhD+6po0cQe
 8xbdRR0ZRGElnUfSnu0bTI4IiwjVlq1miuUQPeOoeQX/Tv8lZ5wF+nDilNtmushC/X8S8h2wEnK
 dymNoaHy76mnDwmJZuXIAMlBb6loBILs6XG5TWxCWuBDuyFMi9/Phv09fIY90kHtX8F+LfXhFea
 W/SZZxslwYW60UkPRJB5SaapNeQJWW6Jpg6zsWy8fkATlBav2J7603nYkG7MjETYtBOlemgtrRU
 z3iY6u4kTulo7OjeVxKNkrDxzuyQC/+1o85Pz9/m/oR5Oc+iSokZ3Ww8LJYJb9WNZc05F4QbJ+S
 QSVNPcdnuynOX+sN+pw==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_073931_739635_CC98C132 
X-CRM114-Status: GOOD (  10.23  )
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

From: Nick Hawkins <nick.hawkins@hpe.com>

From: Nick Hawkins <nick.hawkins@hpe.com>

Enable ARCH_HPE in the arm64 defconfig to include HPE GSC BMC SoC
support in the default build.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index xxxxxxxxxxxxxxx..xxxxxxxxxxxxxxx 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -xx,6 +xx,7 @@
 CONFIG_ARCH_HISI=y
+CONFIG_ARCH_HPE=y
 CONFIG_ARCH_KEEMBAY=y
-- 
2.34.1

