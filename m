Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EC1C88E78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4t3O+boQ/6prVdjN4I3fTqFDViq1Qb1L+fZxB5u9Ng=; b=oMmHNwSB+tQQgmy7sDq7X1j9an
	TKUmcd0C55fANBocyH4ccR32ffRCJrFGnIanpjdy0pfHvq3XofGNvgHpZm/LCcXDMXMhFey6a1kvi
	zxjYVQySbZ8w9yVxSYIl4MjeGaX+Z4UjZy8aauVBKt0CN73AGeLzYOFt/Mn51Ul4KHqA4NOwp1wnE
	MJjw0fmrcoOPYfKGTTB7LrvC5Gr/T34hijRDlkm+m1pixRbiHPx8PUYikAVWPPnZMtbJ/0t1DZVUK
	yn2MYpjrceDkXHAMy2HXEehwpGECwESc5AnrQZg2Eo5IUSKJqvVMkBlFohWB63vxHak2AZ5AvDiLx
	prWblCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68CF-000000045E4-2l2E;
	Mon, 14 Sep 2026 15:02:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C9-0000000458m-2tgq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:02:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Ywe830703
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w4t3O+boQ/6
	prVdjN4I3fTqFDViq1Qb1L+fZxB5u9Ng=; b=RrEuUu9q5M9qmpGHhQ8s8q7Pzl9
	EpkPm/6FmCnxpjBOSLOGlCC4llT6x5+99fyOX7zFdEhdG2bIE+aelkWW825w49nR
	pY2ITnqj1XjmAVakfbg3jRGMmlwsUjrW3o+h0WEcufPQY+T9240rla/h6/kmxD89
	6psc+Yb+beDmcVwsDS+U6+yl6MbG5AJIxgdHw4XeoTHhab5r/+D46h46fBfWb1G7
	ZzaUmglfFTWoBY9GGm2162yjAoWviXpIxNHlEjEb6oJOKuyVfigZzuJDfi30gCsJ
	BuBv4CBNv/j4DDRtxDL8uXSqP7Oo24bB6r4vrzDoMrlb2Z7K2xy0GcDdGGQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsu0na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fb21aaad9so3015353137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398128; x=1790002928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4t3O+boQ/6prVdjN4I3fTqFDViq1Qb1L+fZxB5u9Ng=;
        b=WvGO6YpzNksRCXYF+Tl2G3yUIWenKDUowGo0NvaRJfDMlFRXvyhbP3MW7Erfm/7vUB
         ZLYcxmqLpfGTOt2VPC5B0OZIhLSbckPRtENbyRbkrsXODsQamIyaVmK3dlYgmRhZSAvA
         8y/hCrgc+i+zuOXXj6YmiRqh6RzbFxGDjN6/SaE/UPqvZq+tE6n1mrvADYfhrweWVP61
         jQRwlwnF6VwJ6ByMrwISOhQ02GY7XSwG6ri1bmry757ciqBhsfBNXwp5kHReFEPNT+wE
         3k/S2bkTp/QppLhZ87njyWCA2sLHQ4jdyLB7UktmL1OdRmZheocON5d+0PzuzcAiVjEs
         FUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398128; x=1790002928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4t3O+boQ/6prVdjN4I3fTqFDViq1Qb1L+fZxB5u9Ng=;
        b=XqDQWMZsKacbSJna4L04OEWBGtthXlA6o2FMK641Hb4da40Rh2AvyA0q/5PsbUykAt
         i/2UdEm+bFP7GAZAKggFDcqM80sIyXMq1JwD34fXtRMS/w24VFTIVafxNCo/8GaPUZe0
         UW/eh0DLpO/KmjPZUlFn2qRtTaow/ke1amvmjcTXzHLZcHTwTkynrrQHQb9PEv1LjbJ+
         G2NBKJXKN8LVFvu16MWrse+a0BSU4ZGM54r1NZJESOGyVjwsjGcr0SYE7Y8JUH6Sb0fS
         JvgY69vk8y86AKXtlTukYMXh4qKRn3VbxeGSgJj3srCIBMHNUif+I+bHkni+uHEbnqoC
         uvXw==
X-Forwarded-Encrypted: i=1; AKwUvBxnhrgj9pXGqOHplVywH0R647XqwpU5B0Zs0CbopxT4T09vgHzYbp58RptGPXq7aSgB/LlvELqibWMZvgq5UD/M@lists.infradead.org
X-Gm-Message-State: AFuF++kDtjVehSZvP3dXmTmzfSm0trPnGeTIA+0sxthb4DKGVjTfEQiD
	uQiiKpX7Fe8uX43Loju+7r6CvdY1ZJU27/2okcPXLB+duhcZmjnMP7YUwzDlJYJLkktdhwzqj+p
	0ReH8DwqeYYIDXi292pyRnU9wuld+JJPl3BE3Ssz+6T3xq9sc3f1P4jQ8FtMkwTxBnzvhd+Hy0Y
	Etyg==
X-Gm-Gg: AYBFou1vGlCNG72eAp6+UXhgdgsmR8+41HrRBs75A+MZwooWv0GGj4heUTWQuHBCZYE
	OAC+Yy7ybivoz5MbLDMp8YqLxfuTwapkpKcse98PgH1clySPMQPgMxINkXXst5IoNYNuSqIPuSu
	Au8FlvDQRiAd5EiXazSkMTaPXl73pysu2bxzhjlBuMV1wgaoj6tVEa+pza451PUK35PiJFS+EH1
	kx2LfK5whcVd4lL5RS9flZHCohdr2WqamQQQICGeuQzoDtXa5rba0NT8fz9J2efuTa1xfBbx9Pm
	8xKbchLSqPT8pjoimoHtVj4/BHjTYkDpQf1Ih6jeMCzJ1mURgME5urBPOZDEHlIyxiktUTWegGW
	eBqGTaZAGUVaI1wM6nCoMAH258SkpUhdZWM0sOAqxywkL7CZrBrzvnZbhOg==
X-Received: by 2002:a05:6102:22d4:b0:791:740b:7ce6 with SMTP id ada2fe7eead31-798930aa611mr2058719137.11.1789398127693;
        Mon, 14 Sep 2026 08:02:07 -0700 (PDT)
X-Received: by 2002:a05:6102:22d4:b0:791:740b:7ce6 with SMTP id ada2fe7eead31-798930aa611mr2058562137.11.1789398127096;
        Mon, 14 Sep 2026 08:02:07 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:02:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] cpuidle: psci: Move initialization a bit earlier in the boot sequence
Date: Mon, 14 Sep 2026 17:01:41 +0200
Message-ID: <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX4ZXpCUESBb8K
 57SSS1N/vGVWrEsB12trAHPkysC16iy23q75F3cgUtOLUToEQaFf/Up14lrD3dSQVdnB8kIHGdH
 ePv9WAVUo9ifZ4m5Xm3dl22Hg08rr/R2Uj62lAD2QEzICKQPL/rIV7QnN2g+lJpeY3K7nqnvNwm
 lswpi1TpHNUVaM3R4l3M69m+FAqnQ4OCtyfOlG1X2F2l96ZF89x/n3m+RyKJqTZuGUuOdJJGcMY
 clKcKGOWoPzaY7aYRimrJpviZBNMScApsI1T3FPVunn32IuEpRZ6eDP2FeLiZ7vkzqAdH88C2bo
 7S6oW3Xz/H/J6ZRiFBbp0fm4rmTEHST8cCuxj/09TTFZezKvxZ6o2miZRRQsFgBQ4Yj31yE7ZZC
 k1EMuMFX6DAt/+sp5IKWQ9dSpcKzGZOr81R9n/e26isDuiSCsUKudfaeoafcSHjGOD8X4u46Yt6
 napvMKw1MjF5Wb/32YQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa80c70 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lJEbMRRrfWY45v_ev9wA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: VS6r2rUAEYRoxSK-S2RNPQB_PIDmjOQ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX4bPCufSceFVm
 DMO9QwXF3bxuXPGqjjXtpp2FVFt0ZDHZLM91qI28mo3cTgm4yK+QQBupM1AFZ+riOlYw8VVq55m
 rmt3pRj649/+psr25KkT/vzas7/X3IM=
X-Proofpoint-ORIG-GUID: VS6r2rUAEYRoxSK-S2RNPQB_PIDmjOQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080209_877578_2486465B 
X-CRM114-Status: GOOD (  17.20  )
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

When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
it's of great benefit to attach the CPU devices to their CPU PM domains as
soon as possible, as other non-CPU devices sharing the same PM domains
depends on it to allow their devices to be probed.

Let's therefore move to a subsys_initcall, which should be soon enough
after the cpuidle-psci-domain have initialized the PM domain topology.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- None.
Changes in v3:
	- None.
Changes in v2:
	- New patch.

---
 drivers/cpuidle/cpuidle-psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b250d0dde760..0187d6a9096a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
 
 	return 0;
 }
-device_initcall(psci_idle_init);
+subsys_initcall(psci_idle_init);
-- 
2.43.0


