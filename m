Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C534CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B9n/qeKhLq11qnI+Qeisghld9kpOGURg5g7gMr/FqQQ=; b=2pA4pHKzOCoahHpTWHm8myjJ+W
	KoS8kEQez9A+UKZWDAT5VMRg7AIe1GG7PiyXqCdq9v6LBv3QtyNbUHCYr3zxTFfJULUzHq1Z9xDWN
	AaPkN/lehl7mZ4vGr5Aa8fwrd93FcO4tndjQvKj1B1jk/d+xzEa6UQlXHHvHv+EMgLla5GMdwcp7O
	/p7MbdLm2HodSHfDqvlqouwNY9S6j1rzDc3GKjrjuPX4/mxOBSVXDsiU4NoCPw1rNXRe14Y5gp1bg
	kg8Pt7hsrDSFEGmAnlBWS9ILcItDvA8RGF1+PRmuAQ8aX4WE3i9M40JSIjr3vyGx65rM2tg+6cjuN
	IuE/QglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pOI-0000000FY3a-1E3b;
	Wed, 02 Sep 2026 18:08:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pOF-0000000FY2R-1zaV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:08:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrtiO2731222
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 18:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B9n/qeKhLq11qnI+Qeisghld9kpOGURg5g7
	gMr/FqQQ=; b=NhjIT6ilug7PAN+x1NJim3RDlbnSlvCBXrs9XvdZH+JILFvyZh7
	Dqf0M7nqqY6owTCJit2HAbi2lNU1p1MMYau06YR8U7fm1720vJjINQzO6M+ypKsP
	dl6g5/IsD6gMzXW1JiGCb07QKMybv2Yu0fF1pu27Pjj1IcNN1i8oBDip8xNVZ6N2
	mHortr639bvuqg8BT5CJe4OgGhz5s1vo+stcEUbsxZ+JjqCBalclnceD86AzmMey
	eV/qPvZK6sP+ggJeqqV/hBcmkZloqeM4RchtSxnwCp2dincowUgkpUBr0dvW2aH5
	XFSNPZvoBVCsdPCE0G2iS0+cHLxxLt7ExJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2b7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 18:08:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso209506585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372529; x=1788977329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9n/qeKhLq11qnI+Qeisghld9kpOGURg5g7gMr/FqQQ=;
        b=HSAT9PqMVeLaUzPcRQ7jlFiDlYLxkuEGhP4bONbql7kKV0DmDNOwFH/1cT4XsBZe9j
         YzxtNQWhKq9+M3iyXPh3X/n+Qz0p3Sg+AUAJ0wJIkaLStJMvnPW3AgPvy8SBC/EndIWi
         +1Jh7ar3hDNggelm/gRROas/Ad24+RXQtqgxVwZ/4spdTyKXIUeUv4lVMuUeQaSz43Qg
         g9hk37aiCEYUyA1hx4p1VItNaHct1JEB7bW+ET4ZsekPNf2Ma20Ty/L8ZUYcrBpUGOfz
         HgpqagwFetsr2+r8oS5tCMJ2Q7w6tUvDps3TQ/ICT28PSVpniEox25DpwJpxJCGKgKVK
         JqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372529; x=1788977329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9n/qeKhLq11qnI+Qeisghld9kpOGURg5g7gMr/FqQQ=;
        b=F0tWldICSLbCF+X/ziFhvDHVgx1F0W1eV4rMytYmJ6qzLD49JO5OQ5drXpoMKpVOC9
         +Xdc7ShsmuUUrt32rkNbAu1s5L3Fqo1jcwHHHT6+NVse7kkGs7pY1GnKG37kYEXE6eBg
         ggyqHTxbC7aV01Fe+Gt7xvMIcje1xrPeycfW8+2hTrY1LGGW607kIrnPHYXyCbEeTkj2
         GkN0+DPK3ZycHUhWITWGrLQoI36eTqiIJcBlHaOm2OuskUrT9tXfl1q4jTyCtVjFXEvT
         knxCigITTwOlDTF1zsDxqXSvgq5zh9TLh4kalfdWbtQqMs7SEYjlTAmq62/xtF1eg3MB
         GH0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQYCtDCPj4ozk74ihi17HYaHAi0r0HprtOPLZL/U1Urci9LLOPSBLtkn+9kZEez/BoXQwLki5usIp8FFu6+ny1@lists.infradead.org
X-Gm-Message-State: AFuF++mSyd7FbK3NhmEyl28g0Te8UVeMt74RB5psRW0FSDIrKjlgaDDS
	dVNZ56mnNxOqB5dxTt/IAHDF7E1crAOc+vrz088tg4uTuwTDqVgvXk6jiS3j/7gemqCzx9DLpv+
	mQS2CPip1caNVole3rnTkJnqfC0t15bgAkTbERlmqDR2deqmNHvrW5Myjnf54iYfafJodWUayqq
	Kw4g==
X-Gm-Gg: AYBFou0kPBVIuUdBxQlqqD0IjOsYLZYzXF6G/lZ+qsLhkQCkcNZ1G4UWTyTRE8grGy2
	YbcOlqaJmtBs205kUTaIz7MCttUJuZq/ZuY+n7bzdJbskGN7XGdmglp/0ZRVW9Rj0WqVRc3L5Cb
	EbOcb4RlkLKu4ubLaD70YYlhx/QmC4qIK7Mnr5HTn9UBjytjW6U+pdaZpFzqK9Y1zlF4tHppGnt
	9mniws9AHTR1zV7A8oGB6aPhdnrmHK9z0GnsICrbc23pRm2erTlCyydkicviqtoP7ptlcF/m0XN
	GMYTRK/jBIRRBe+5f9nblmlZWfzwgMHSUVSEkD/rQFRw042hGv6gPXLqxwB89Ypdnz9g7zySTNa
	0TFYrvywB9KoGSinsmD+Ig/8f0C19eGEiiWYDqQDtzJnfSqGipqOVWM/yLoPfc2Uvm5oJNwDu7d
	0S3Y6s7C9DtrtK7uY=
X-Received: by 2002:a05:620a:494f:b0:927:25f5:ee08 with SMTP id af79cd13be357-9396100e110mr654420185a.43.1788372529131;
        Wed, 02 Sep 2026 11:08:49 -0700 (PDT)
X-Received: by 2002:a05:620a:494f:b0:927:25f5:ee08 with SMTP id af79cd13be357-9396100e110mr654406585a.43.1788372527919;
        Wed, 02 Sep 2026 11:08:47 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:46 -0700 (PDT)
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
Subject: [PATCH v5 0/3] firmware: arm_scmi: fix module auto-loading
Date: Wed,  2 Sep 2026 20:08:41 +0200
Message-ID: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a986632 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uKFJyDnsAr_ZGfoBym4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RennWLRYsPGOYd5IfemYuehDnO21E8_k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX0kMaSVioyc6R
 dxUmsbTail3bYZNDtixUPiN3EGb807XYBAJLfG+ux1hh+bUzt9lgo5h8B+ofGy8p8JKds53Wj3C
 XrZIxWg/Qs1QBMV++rOaLB9yC7zOgPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX6hfLRwqFpp1e
 2ZNDISJzXKkjk+J6xKGiMdcqoI2cHUf4ZZkPhhll/I7LLhph0eYkvYtp2zEVC8PdKfNDEP6qY3R
 duQKeeohB0/cExhaLNoZ/qmchq00CnWUuHZHTY5lq1QxZfpOSA9SmEwl+msXTnzE0p97oMWm6d9
 WMNmmx0Y7qqE01E2/VpMhsFS0QM/+5gJ6k7/DU3VX7CFB9U7qEj3RHbm99mAYiheS2cssQr4DnC
 NxMJToDiXj3sGxC+lLbVS8xhGle3iF9eMrYmN2BPczl1t/Zt8oMMBfj1qSzZLOp9p5XoGFDd3JV
 1z8ZTjX9zjUo3qbCiLBNrwTSDCCumWdUfhmXQDfzCKGBJl8CdUqIzHKod4tAfxh07h6nX9+s/Kx
 SIEy8YYgK+pgVb5EevtCrItcavxRxZcKUc6L6XGvgwSnT7HpKIjHqD0PIPdobIFYhe35UQ/2dFt
 OVQxqJzekau2WVFXO5g==
X-Proofpoint-ORIG-GUID: RennWLRYsPGOYd5IfemYuehDnO21E8_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_110851_642901_1F6DF6D2 
X-CRM114-Status: GOOD (  21.11  )
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

Here is v5 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. A new patch to always create devices for standard protocols, replacing
Cristian's patch to pre-register the standard protocol device-ids from v4.

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

Hans de Goede (2):
  firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 97 +++++++++++++++++++++++--------
 include/linux/device-id/scmi.h    | 17 ++++++
 include/linux/scmi_protocol.h     |  6 +-
 scripts/mod/devicetable-offsets.c |  5 ++
 scripts/mod/file2alias.c          | 12 ++++
 6 files changed, 110 insertions(+), 28 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0


