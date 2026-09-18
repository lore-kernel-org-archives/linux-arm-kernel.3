Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62421C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=; b=GfQ+ZZY7XMWOH2RpfP/LY5OPsn
	42PRQY1n1fr6vuHbdXvg6ha0RBtJpqhRZ5NJzK19hpEy1pOYj8Avw8AKyZlMlnazIrZSJZNSifys3
	BgbrBwKNLfOHOhzMzrZM3hB+HM+TXU+o2n2lkROWIet/1xAxHDbCtZn8ESeZDW2giHhUT9BVG/sCK
	NoseGdFqUdo0qqYepOzpJ6V6PgphswuEntrhJo6qepZ+i6Dhjm8KgpXn3aSL7kFoxa1q4eWlWLJrP
	m0xFOs6Q3FjP8O57Huq7VLjIyQ/I9IcI5aHj1os9UOcq0wuaKFhc5HzbpEKl5Aur7h2Uujj/zKb+R
	qapCoqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uut-0000000Dwsl-1F5J;
	Fri, 18 Sep 2026 09:29:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uup-0000000Dws8-2GgQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:29:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I603Us3423743
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2P
	F/wFYxfI=; b=fffPpa5/8Y+LmheYil3ZBLqczHXazeQzdAFtQsjrGDuA6HpUQg+
	Mz2FbRvF3hISFFd2465/0CRYGiQk/j/iFLbhH4qXOWbtVIpNfBwU5ufS2XPWkBID
	ObYTcOooT+DHaW80RpfwaoxbLZZqoxb3E0+4VqZfJomBBCjrrzKs52yHE/HVoffl
	80FHd4gX1Fyt3SyKqXXVeZy0fRVJW1z5kHhAw5PD6yXnrfKCGdDJAgMQpe7xGvu7
	mhunvHqv3jGo0sik2vkDKXPtmSZxFoeerQ7UHCTXIs5ta9QPNnFDiJd4xbOAfuhD
	Qtky/WnN9FPpPjSDD+uDbcf4GBEwJds04JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtewn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:29:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so133397685a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723794; x=1790328594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=YA2lPbRE0FPTMPdaWZlsTSpgToFzT6CXXT4ScxrA+eIRjkL84wYu/yFUAiwqmnsXQy
         Y/DVIc52nt+sodj+pjIw/mfxQgDsriN6ekHIE0gfnZ4MJicrv/11rRhb7pv5NX/jrHwM
         XpJXLeKLSP7e2r/k0elM3wRjKqUSKSEJcUz5e5JegNfX1xLaS32/E2UaeWleXvYK+VWG
         xsZUgnYcE1pO4BYabTOr/rQVnvf6p1+EuSaJW4gQIyiWB+YtflmiWT6bT45u2vkbl88c
         I6kVxe/DsAipIY+S+wQYu9XW7RpD5fXFAlcq6BqLakiHvPN/tgttYI/xqTzgm+pquyto
         RW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723794; x=1790328594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=xMBhlZRi1tg19bJ9iGibBR+ylSU24adyg8geoxFTCl79xlSQMWBI/8eAXzwML1pnqg
         dHz4ozfmSWeXKExImBaM/dY5S8DXuIP6+da+dNH6zvWOYFmTfzOHotzk4UPAaLT9XsQc
         TN4vlKCkLI/XTF94g7l3MHItqogQwHC0Xr2vehurFa1AaGT1wiiYdU4HDX3K7IP5WaJi
         tE1DfUZsuOJGNUckrCZ4ZDd2bN+sNq9IP7VTEdagM4RDMOIEafMUj8pPOhNYYo65p6lM
         cv4qR91He1v1tkOjsTwbCAN0E7a5Y9tjjO1LljUO4zr2b5s3MH/E3SJXtl/uWaNE8q1+
         S4Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxU7AnAtXsqiqbT9lMSj1LZp7Go3R/DRtRujWwx/yREwSiZfUfgpN2MoQfqU65vgpqi4QqVOPb4fKloB/jRWs4P@lists.infradead.org
X-Gm-Message-State: AFuF++mdz/LHPubApH1Xs5S38QpQ2fhKJ6frv532WRlkPVN8IoyrTzn8
	QBR2EZQUkCuEVrx7gekcGsCHLIrBNG3ivyEaaAnKKzCI/n3SalxMWPbk74AxCvXQGO3wijUxeWF
	I9U/sc1g6ZSlI3GLg5eZZS9YF8IObSrRZbp4zXUd6gk3jSv4OZ8n2pTTvM+9CF2egA+CDy6RIpZ
	lztg==
X-Gm-Gg: AYBFou2uKsP6Yg+JWdqH8MleV/3Q3BY682yiiysh6ROB1ehyFtqV0Di0kELTKrDkSxM
	p7mGGQyL6O2QAJSXGMUaLcswcyTEM7gQCcKTgAUjLQ7sE1y3u2HA116ZeMVBduA27qf/J4P4w9X
	fMBbRLnAMXVyD5Fe18g+2m8T9SKEU+LIHhHsOkZ4Y2dU/k53iCbgr4ydyxNW/zen2cFhpgnjCen
	G4J+zTCiW1v/ZpuuoDmJeNLRfeOekQ4pp8YN1YAv72EL1YyJiebDjrhk+VqdJ2uNogXgJ/GImO0
	0+8stSHFFBOP5dJJIRTZ4pTahCdxu2nHwnTmwdkmdWA+dnsVmzCMmnnyRGU7IagZXG3oVwhYjlG
	AR+yxkSZEZrOOqwj9By/cJkgcXnnjsZAc6YvD4qfyup7xYd/cohtPhjRyTf3y8gxod5/zwi6BBt
	sobin9hrDftqc=
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245525385a.33.1789723793798;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245524085a.33.1789723793406;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6bc0sm36796166b.60.2026.09.18.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:29:52 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] firmware: arm_scmi: fix module auto-loading
Date: Fri, 18 Sep 2026 11:29:49 +0200
Message-ID: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX4ZHmfyejkSZv
 A1RvcjSs94bmDorOAtSP/akYybDr+/GggPvWscG5imr7kjlKnVUx+zPcQ4Fkzbs6f6NjhaZNu9Q
 dSgeWIikkeqUSpZ6yN7gDIqDTYpGwPqX+leW/e3eoiTqnd1elAqKaEXxlumlBx2aWvkK4pJSDEW
 MCEpmKhWPIQy9T1RCtjM3Cb62Hs/DBFXIV2MTsbs0UzaOsPONmFaAP0oGKR91BAvOlyQyPHIe8U
 Enq5mXpEDYDwFru0E/ZQUx8yPa2zmec/CAKiDJajfC70Wnk9X5Yb+so2UedJs8Z28KGa39KngJ1
 rxU5V6M7RObYowX/Z0/UWPAAsZhhM9RgxhIEslyRKR/HT9jfzAnd6C4OOk9sbgC4d/hGrLmZW8g
 KMfeZJDmVre2jFrMb3KsUMRRonnHoRdJEBX5SEer66ytPlQtbXtqySdAefK4eysOdYORW6knUm+
 rb33j6v1smcNWNC0pXA==
X-Proofpoint-ORIG-GUID: 9rvefG4y_bYiEoyXaaddTq01wCj5Huf3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX1Ay0V4OTHLAM
 GziT4toKG9ZOrKDrRPFfXvpiEkYSF0rHtYRnXIMV6ctxgQ6t9uGHvVbJXpXnFPYdoOwlAPM8PTp
 63GxlV1mhE7yF/9IK9WBd65ZqoMZNLU=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0492 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X-UiWFXO2YgWyHAQv0wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9rvefG4y_bYiEoyXaaddTq01wCj5Huf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_022955_583521_96AEB16E 
X-CRM114-Status: GOOD (  22.06  )
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

Hi All,

Here is v7 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. A new patch 2/2 to always create devices for standard protocols,
replacing Cristian's patch to pre-register the standard protocol device-ids
from v4.

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } device-id
has been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by always creating devices for standard
protocols without relying on the requested-devices list. This creates
devices before the module with the driver is loaded, after which module
auto loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

Changes in v7:
- Rebase on top of v7.3-rc3
- Drop:
  "firmware: arm_scmi: Fix scmi_protocol_table_register() error handling"
  "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
  these issues are already fixed through other patches in v7.3-rc3

Changes in v6:
- New: "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
- Add Fixes tags to the bug-fix patches
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point
  (from local Shashiko run)

Changes in v5:
- New patch: "firmware: arm_scmi: Fix scmi_protocol_table_register()
  error handling"
- Replace "Pre-register protocol, name tupples for standard protocol" with
  "Always create devices for standard protocols" pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
- Drop "Pre-register protocol, name tupples for IMX protocols" patch.
  Shashiko rightfully turns out this will cause problems if other vendors
  also use the same vendor protocol-id space values, e.g. 0x80, 0x81 are
  likely to also be used by other vendors.

Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- v3 is the first series combining Bjorn and Christian's work see above.

Regards,

Hans


Bjorn Andersson (1):
  module: add SCMI device table alias support

Hans de Goede (1):
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 71 +++++++++++++++++++++++++------
 include/linux/device-id/scmi.h    | 17 ++++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 ++++++
 6 files changed, 93 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0


