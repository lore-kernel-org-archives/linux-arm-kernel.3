Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5C6C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH+AlWop+Y=; b=H/ir6Vs4TGGiKfjgW9iTvNOQ+9
	dLK5xrsA0427cPuwHTRdMTC1toB33ojH24ZQRTzsBIhiCctMotMtPPyRmf0MKHUHGhLwU0hYcWJxU
	7411/EP1JHGxwYrMzjOISHfqEhufvg0vIlZifth4+cTwJAro6Iox9MU78PKe/qzQv6LyzQFkJe9Xn
	oRXr/+3atytHKY0ECDxo2tsDnyLfGtNdb8g60plswSy23h/9/PD66KmokXFvJT5z9BL+K7jMZx+Tp
	F97+JD2uYR8oSknV5d2tYi+8jmpbxEmlfMv/UTNqP2hsfpV5aWokXftjBRo0+SwsbNvEZS8qxLUZ8
	hhvstgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536L-0000000H2FB-0q8A;
	Fri, 11 Sep 2026 15:23:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536H-0000000H2CY-02HX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:23:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAfU222576
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH
	+AlWop+Y=; b=JSBk6OLSYPVo74ybSiJ5pOAIuWOhMqYRVF3bJjJ4te8EWZHEVsB
	6P48U0FsSQD38omr1YfnWtUqMlE2RtE1EZN+KvDOAKBvrLeAsIPFTWtanj6GYNRb
	INFOi4U/juywHFVEtgR1IeuwVhvrMWgdRJ6mm/lmrOC7Bnkp4v+31HD8wiWYeN7U
	mW8pF0ib+ZH2kzcLYzTy+RPNG/ZCUyqkBxwQ3av9AMDlBspiFNRECHJHhng/3+t2
	5q/Mmf1oUchSMnKKZsW2cHV12StDlTTpPc8LHlo6cY5G597CXH7urVcKTJ4ys+2C
	QYRepI0tumv0DA+srB5dj/PK/vnjvuEnbmg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrady6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:34 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9829a8b46a7so198643241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140214; x=1789745014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH+AlWop+Y=;
        b=Y3m472YXcAP3V6pebcyVr7I5XseiNRfFGqVycA1CmN92QiLEn3aGwaabmWzChhIS0n
         lNbedS4VVqLZnNc5gBrVT4RI1D6VXS9SkgI7oyWHv6nLZ0CNEM9lw6ORLok+gfH/s2tt
         PFzNflJeESgYEwtWQIsGSP8UbQhSd2QRQzOL4BYJ4saPGR1uWz9En+F/9gqDagUJbH7U
         TS7cI19WYRlvP13ipfnc/62Ai3BDpCAx2ZfcjGQ6kbGcv3LN/SDzquLKC2VYhyPZPZdS
         jRSKRF7ztiHSh6iFEcp2kKFS5NggGrT+FevQnCQdxnPtKblGA0GQoL1O3u5Npn+PC1ZQ
         nETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140214; x=1789745014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH+AlWop+Y=;
        b=nIcOuIJQ1HFEkxqyYG2Vx7rUvTjzxqAtm/bNeSlUS9wVzzpaFIlpVrepg5luHmId5X
         gip7DnyyspOdNFOVP2jIYOF+nM/I8osLcFDv2NVFSeaJrKx4YybAKNb+gU7/01eNWJ4R
         vmT5/QahQ3K4r/oZKjk9DujINCx0j44OlMpGgS3o/YUDfe4Q6zJBpVNEGM/WTOdBCVs8
         2H/gIkH8Dbmux37QPT6qPwGu2nKAWHz2mXbpyVUCqOTHBnR61aTBF2a5O6PAlefDHhda
         /VNU1Sk5FB5n7K07XxmdauJVRmyCPiAxKWpiS70OrCUYkuUqPngc+zBSGkCgO42MlTwm
         BZvw==
X-Forwarded-Encrypted: i=1; AKwUvBzy/DDnLh5/cgCrWHDLvh3/AK155haxbuKBtfyKzg1BSUqm3fwtQFK+nJ1Bje83gDrBZ49Hz1CqHNEwSnrCbNeI@lists.infradead.org
X-Gm-Message-State: AFuF++kp8bmY0TQ+mblmBXzPo+O/w5NZIucDB2FUOX2mACRmR5T3MidG
	OqAv5XeDuefMKk8/69nP0dAcK+celGA9OeMl9H5WtOmC3EN4gYJoGgw0ugvlIAOT772BqLvRkmg
	FVJ/UPWMHiq1v94rAXfcQ9bN2+KTI/y/fRBpGjjdFD7A8VtjcsLSyUr0Kg/dwXuTHNnC1XpMPn/
	gNSQ==
X-Gm-Gg: AYBFou3YAUjVdJElq4wFQki2y4u+qEx9MJxEoq8szG4X74q77XRlTaclhwnSCl34fbB
	kexi8cdrdomwaNanlbG8VH2b2i8LmjSBW7Rq+sez7dRCiXesb3D53Ff8cQbYV+IOLyc6938NR3+
	7bl3kbgUUGHncVTys51QL9HQKdvx66bYwbK5QlNpj9UBOlaH5cEFOztndAHyz5IuGiu/pVSN8fx
	EAMAG+WD+cUNb1QdypvCic4Kww7T9iutN3yzSAztaJf8K21W2eZfHt++uDvINsD5pTW7J6O6aOW
	ocE/dnDML2v8n7l4/CdUyr+0UyTr2+mEC0DODDGXRHFdfNj0qMU6YTghlq7AK/aqDzthB73p6kT
	Dp3ndyxYYbS0YVPR6fko5l77cZOKAjOhjEoNouzNODeE5GxqT2vPBX3iBh4vrJj7Z/Vbo31bc7R
	Lbpgmgrt+ZiYp62eWSQot1yQ==
X-Received: by 2002:a05:6102:3a13:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-792ab142031mr5533605137.9.1789140213593;
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
X-Received: by 2002:a05:6102:3a13:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-792ab142031mr5533490137.9.1789140213093;
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:31 -0700 (PDT)
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
Subject: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
Date: Fri, 11 Sep 2026 17:23:25 +0200
Message-ID: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 486__2VvcVDvZ3OLuJEq53F_T-R9cq4l
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa41cf6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pQ3uMOGh0wyPnyaBa88A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 486__2VvcVDvZ3OLuJEq53F_T-R9cq4l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX1XnAW2q4VDIq
 oSKITlkFlB+ItbddQtoZRgsjYMMNXvNtK7c/ueYtMPMwXWD0hh1rYhvHwAbQbngigFw3MLv33+G
 eAYOF1eMlktYNyjqXUnQ6UcL92rFqYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX+CmhBPVHJeU9
 NKij1Z2tRTmDYhiaLyLQZrDIyffTGDBK7U7gSmma8Jvbw385xdpUjT0hdk2kWtiHqJw/O2AtiTU
 NSHvZOZ/oGtp4VT/YC+rp3zhnXNjUBm7QcX7DLGwruXlBqhwt2fzmGBIi1k2Z6njFCyA2FeqW/5
 RTA8eMnygAMiS0rEkRZyx30pGkK2/c9zgRD+MgMb6MIMiFdZHLamZlGaulERQauIT6gk9JqB7Qd
 gD39ZXCWXCxGMiyFtA5vpR84AWNdrFRLuvgzSAWP8TMs5yJN/H7pnTf60GEuW3MFSrR4G9xkNFC
 /fX9Pvl0NYcDwoZUo5GozP3bKL5uoxTS5mEpyNcb7vPORSInSRNNF214vkhz6uRbjqAV2QpQXHX
 lQK9VxBnjPJq5rP2NW3WCPmbXBqq00OYUdhtKf2Nqk9Fso9t+CdwvmYoUAzGG/rLWtPodzIiKjp
 SDPR+lYHe+IfpQNA83Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082337_168727_B7E1623A 
X-CRM114-Status: GOOD (  21.52  )
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

Here is v6 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. 2 SCMI bus code bug-fixes.
 
3. A new patch to always create devices for standard protocols, replacing
Cristian's patch to pre-register the standard protocol device-ids from v4.

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } device-id
has been registered which is done from scmi_driver_register(), creating
a circular dependency.

3. breaks the circular dependency by always creating devices for standard
protocols without relying on the requested-devices list. This creates
devices before the module with the driver is loaded, after which module
auto loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

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

Hans de Goede (3):
  firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
  firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |   1 +
 drivers/firmware/arm_scmi/bus.c   | 107 +++++++++++++++++++++++-------
 include/linux/device-id/scmi.h    |  17 +++++
 include/linux/scmi_protocol.h     |   6 +-
 scripts/mod/devicetable-offsets.c |   5 ++
 scripts/mod/file2alias.c          |  12 ++++
 6 files changed, 118 insertions(+), 30 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0


