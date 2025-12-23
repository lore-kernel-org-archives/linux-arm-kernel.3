Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40298E6F072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Nl2oF3lo+OZ232Orxmn78xpacRm3EfYu4q21yzufDg=; b=JT9i2XClk2F0en
	1hPT51OO7oV2o68eF0SO0Z1WS/c6nixGbcho8EEN+KP9W+hR49gwXAgLsiGI+56eZaVa/+FrYEViU
	E4gLB9yi9sLzGb7QoxJIH4eo/3/XUpHcgWXc9YlpAopVPibO3vwlBugMqu3M5EB8GDxnouIf6W+ov
	reLLIynGBHIXlhGAfdD7O3lTx100G2qhKN+8X8fXtf+MOoIUcQa8fufKtXB6dNR3wYdQEZKe/pphr
	R4C+yVZw9lqEmff2aJfkJlbSqaQLiZ8DdyHpYuFBDG6A3DXTQb5vVyZBtS3qqQTLTMPEupztulaH9
	cHctktxMd7KmTouGsB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyA-0000000Egzh-2nlD;
	Tue, 23 Dec 2025 08:42:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxy8-0000000EgzI-3I9y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 08:42:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN79FeM1630570
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Nl2oF3lo+OZ232Orxmn78
	xpacRm3EfYu4q21yzufDg=; b=g1TJXjwGurY8EpVICNFh+V5cgzms1v+BtbCKS7
	2mVeWG8bf11RFH0BblSMY1JRLcIcJDV6+2JcZnDadNvBAIZ2S2GuFu0WPZ75MOkj
	WKOkFvQm+LvyGykPBU1y7OBgRqWiDbEg5a9LXtlNC4/5lEPvxdb4KffaduTCR3hX
	LGZAV7RRO3GUxhAFeMBid+k2/dFcJ7Mqharp6RFDYmho2NST8Bqzky5jamYFT2f1
	HikHLw6gAUhhrkiBYktmqwssnLv//HnJt7JPEXMxxM9BZTOSx9pJMdYn4VLGNbxh
	m4tLpe+S7w+2u+uAhZoXWfWWc5Ric7YLgrakIKYtKz4nFE1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j09a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f27176aa7so102055995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766479331; x=1767084131; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nl2oF3lo+OZ232Orxmn78xpacRm3EfYu4q21yzufDg=;
        b=C7gQIcguQuYfV/nF0UfkYbnaLsxDgcP99FMi6wOWG8PLOqqpgOhXxlM9iK/Tqxu3Ix
         cWeEy1RpabHugWue3cd+JjDWUqKbhHXfdhl+5zgEevXu7QFGnzR53+EYSs6XShzeLoKf
         82j55IwT6x9+cS4oNiwiAmg7Qvp676N7vvkknT9sG6J7ZsamVbTSMZsaQ7PMmIxB+mYM
         G/IwlsoumMkxrVQhYYMegzO88zvtwVnwK39JxqLqN9u77CGFdv7yOpXN2p9Z6VRnXIQk
         4fNyYp9GYT9v7DA3+oO7bkJ0uwxK9wubOp9AlKQbzzdmSUPs+gcD2RTtiWCGjpjBdmsq
         Q8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479331; x=1767084131;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nl2oF3lo+OZ232Orxmn78xpacRm3EfYu4q21yzufDg=;
        b=FXVSZqhlQSMfNJx6PlD4hI0ZSaf3s8oI+0p+M/npnHR0HJHuYQTluaaPe4UPoXdLWF
         oRFGCM25QY/rAHKUeauOk/UR4uFTocYttABgWB7dwSeYm3eurJVHPiPaT5AxRrQp5kvp
         128sINosCyV+eTkDxSYjoJhAKa2szxog8HJDUoedWUMuqCUIp3Tmcl005wqIhjK1IdU0
         GiKn6BBpj711d6lOTDHrhndpfkftEHR7jAfybxtpVfF22jNSo9qxk81JeIE2Tvd91qil
         ZSoZesH5K7hsTrP1m+vlZibGMurqcrsDvIyW9rcBKcIHrV1FWgpdWbt9udCT8kNV9Lal
         vs7g==
X-Forwarded-Encrypted: i=1; AJvYcCUJDo6o8gMRSgJa5CwiInYWLmF6msXcUtrZLIt4nNsUBibzJqzgxEYlq4oX+bogjq0p1qL4SVBIGyxaWc4y+ptk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4GLgsJxlkfwjYJSdqJQcPDI6mxFE5Tr7PXjuchdcXKG5vaVG7
	UrUjqN+m8a4S5SkOMVv1wFKy1c+MqX1ut7rDiZ/FNYHecLzZ+etLD9UhKeacScj7GsKzMHcBXIq
	Lh0k6nljyJIGQFY5tSZVdfY+Hr2fA8PwFjwcpE7jX7RDvU1bG2hH7/fGjA4lBzKhu/whpQ0IcfS
	RrIw==
X-Gm-Gg: AY/fxX6ve11c87IZxTvsIhoAfE/nmmhFCXVZ/q2vQ9CN+8qReGXF56ccOkqZ+KVRmRn
	/Qh1kq1EB7C0xbULuyHfWuKCU349CEPjIlhQyUVZy0S2dDkjOXS6gfzHTc7+Aw2VM7kjyCCrh4H
	PiMR5u+/RKsgNQ2xhyQx0MwDAuHZR8IHxZm4Doj9bq8FYpmQ+Pp/Px25tVwebPqwd1mmqcqPhxz
	YPg8a4titZj+H+rVNOaC8cmPGsumVRSqSD+t5QzjjHrTXp7Cjlyj7z+6MtWM4JRjlJOij7zQrsh
	YXgOycj5yOywnN2phcJbhJIC7PqHO1X1SJkkJuGpJ96yUEQz+HqUCBAvkbqJSN+0qpg4Aox1gc6
	GFKg6hypfQPBLXriZaWJlAV6bHH5G1lF2k4JXA/+iBSBKsc8ttRQto2xA8/NcDA63iY8iDb6o
X-Received: by 2002:a17:903:290:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a2f273818fmr151417525ad.38.1766479330698;
        Tue, 23 Dec 2025 00:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjZTTrtlwVzjlP6mnhRL5CpU7y5R4YPj6TU2YJ3inOB6QMJHhWq05XC72p/aA74gVKRM8IBA==
X-Received: by 2002:a17:903:290:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a2f273818fmr151417275ad.38.1766479330135;
        Tue, 23 Dec 2025 00:42:10 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e045sm11163561a12.1.2025.12.23.00.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:42:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v7 0/4] add sysfs nodes to configure TPDA's registers
Date: Tue, 23 Dec 2025 16:41:44 +0800
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMlVSmkC/5WNQQ6CMBBFr0K6tgYKLeDKexjT1E4rTaTFDhAJ4
 e5WVy5c6GaSN/l5byVoojNIDtlKopkduuAT1LuM6E75q6EOEhOWM16woqUKQOKCFqUPYFCOQer
 grbtO0chxAEUtr0Qp0ropapI8QzTWPd6N0zlx53AMcXknZ/76/mOfOc2pVm0JYE0LZX4MiPv7p
 G469P0+HfKKzOJDzNgvYpHEF1YXVQkV1434It627QkP1/0iMgEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766479326; l=2742;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Qw1YjKZatKWaKZ4rrG04ur4nkKI80vvGd0ho0qmBC+w=;
 b=qZwX4yrYCstJwrx7trCNlsZho1RVsS8hZopxBMZ2NCcw3ldpy4dVhjGx3KOcXs0TD7hoop4M6
 EKsP+fZaTpsBnj5o+BkZr3k2O0YmN7lE6Rz/mXrC8XjzrfvPOGdTAUM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: RjkU_B6Ddzy26IKiAfIBPFoepH9UqRSr
X-Proofpoint-GUID: RjkU_B6Ddzy26IKiAfIBPFoepH9UqRSr
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a55e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XEkFclYNQXgSceTWgxkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3MiBTYWx0ZWRfX389uyYphL1EL
 8TUzq18IHjdxDa76W/lsCzgXNLEY8kXni++aVTkJFkQ5Sv2h2QDszXHw9mVgic58IzCZMR3Kxf5
 uaeR8ZISv0ljomCvg1/Ttsnk2a7Vol1hJXC1gOrt8I0+TD/KGz3qZcNjvcXWJmoGlHbCcNg1qB9
 26GOgeBA5snD1sLPYPL2t/l9gMBWXjE1L3rlaxfg5vPEKtEF3LYILJUd70TeLcBPtIpVKQ+KEc5
 TaKXWeIWCjDjPGMP6qE8yV8Ot0cgTXZgECknjlmJEhf0amC1lRgxdWkXQIf6oIVKjREL/UiXk5p
 3pn6LXqhyUOn2fW/AHDLK9iPxZ4I6FCC0pGjWNQVLyXJiy22ScLFWQfg7V2mDOFvN9RhsS+AE/L
 AgdNMTDc5YQKVVE8XfegnvuKnwIjcmpOSQUUrmi5LwkCyFc2gYH+3Hezj2nzdzQPvnLBGQVV6/D
 RsrQiND8neWU4Be+Peg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_004212_847558_60635128 
X-CRM114-Status: GOOD (  13.28  )
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

Patchset 1 introduces configuration of the global control register with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a sysfs node for triggering global flush for all
ports.

Patchset 3 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 4 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Changes in v7:
1. add syncr_count sysfs node.
2. add more detail to describe port_flush_req node.
Link to v6: https://lore.kernel.org/r/20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com

Changes in v6:
1. Create a new patch for introducing gloabl_flush_req sysfs node.
2. Add a syncr_mode sysfs node for TPDA_SYNCR.
3. Remove the redundant attr_grp and consolidate all attributes under tpda_attr_grp.
Link to v5: https://lore.kernel.org/r/20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com

Chnages in V5:
1. Optimizing the solution to creat sysfs nodes.
2. Optimizing the logic for configuring bits of the global control
   register.
Link to V4 - https://lore.kernel.org/all/20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com/

Changes in V4:
1. Document sysfs nodes with correct kernel version and date.
Link to V3 - https://lore.kernel.org/linux-arm-kernel/20250827105545.7140-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. Optimizing codes according to James's comment.
Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (1):
      coresight: tpda: add global_flush_req sysfs node

Tao Zhang (3):
      coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
      coresight: tpda: add logic to configure TPDA_SYNCR register
      coresight: tpda: add sysfs node to flush specific port

 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  69 +++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 284 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  76 +++++-
 3 files changed, 422 insertions(+), 7 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251219-add_sysfs_nodes_to_configure_tpda-f54636512817

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


