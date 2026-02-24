Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91C9E9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVPafuMTkBBvdHOwmIqwEby5N6HPu4j2/4G4NoYv4Ds=; b=365RmPjMaGpn4w
	1enVEsAAO7iptnwc+5eaeAOBZhXKm2kl4yvrwalrQ3SeX3gXE+fUsw9Oyt9aQ3fypopvgu4TDDMCK
	+kWFrPqg/S72EDISRtQbtTxdAPB+IX5aaJGiHGY/1r0CLZtj5aQ6XIzrPRK5vSiCTGPZCR8gduHSt
	lRRBWW/mOBGjEacgszfKAohS8qRWfwUQt1QDrB9msnsGrT2r5tlQik4JgdeFxtcm7iKH+mIhFDGRL
	wv5y8q0tLSAft7VlT/Zq8pb/rnCLt3I1ILUPUA3XHwGwO9HxVtwj7Y9QdlVKC8v67hM/9xecEaZRE
	WT/qBKEn+ZNoFkTv9e6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptO-00000001sHz-3ACJ;
	Tue, 24 Feb 2026 10:43:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuptM-00000001sHK-1gfx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:43:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFT7U2560554
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GVPafuMTkBBvdHOwmIqwEb
	y5N6HPu4j2/4G4NoYv4Ds=; b=d/oQ9vYRMDkrfNc68cBbbYSDw1IQ6cPp24mLeX
	KblHfoB6mwkPmGQ9sxCl77WDjAgfiefYV6LRzDjAaReBxt86oZ+m6nrDXY2GQXB+
	x/5XVbvu+CraARis4OvfkbU36yhSg6XK4uUu466ijZgFkJDyYvsQX4lUMhsUnb8L
	UD//CcI5M4fLbpS+/fSXfR/ZmSiRO+DCj81KyI3oTbTBJ9gvGoQQ5Q04eO3XJmj2
	InicdozEvmXzHIpVklzrHyvQNl3BRDr9CRXBXXiRwZKsS4jeeC577MgDmiYV7wXB
	tvbLh2g5ZMB3PhT6U6a1IBwB3SnJoL2ghBFJksWgjZws+aXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e393v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:43:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506b3fb32a1so535425341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929827; x=1772534627; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVPafuMTkBBvdHOwmIqwEby5N6HPu4j2/4G4NoYv4Ds=;
        b=NeAROyVjt9GTK8OrYAqPmLou5T1CsSoXIo1SEvfEpnCBs9tnKT093LR9h0pe/6U7mU
         dVN27I3RWRWVZlPuv09eElckuD9sqs+xIDFvbOwIzv59Esb/C9aSjWcoviZNXCkwvInb
         3tg474jcyceSU/CS9Yxap+yO9mfSQApxQGRl31iZIVP9YkZ9wWKyUvc00f/zWF7VCmY9
         CNlZqkSgH4KmrjPVI55BA8izoFJtld5DfvCEmXqOgYWE8LFELJMV5vOnGW295bYyzp2g
         Bf3v6pbyy1j6V1h5HX7GwzeSfPoBEzL94oUu1kqw12a+H7yFVyRwSq/p7wG+mN3JchDP
         OV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929827; x=1772534627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVPafuMTkBBvdHOwmIqwEby5N6HPu4j2/4G4NoYv4Ds=;
        b=QNlYkfrFmLBiXvm7FAj4Iobn3UvU+sC2y/Y6fIk9tW9suc6/qvrGKevcqVeoosfNJv
         HcSi3VLjy3ecSXUVQv4V8GeK6uCU6jVo7hPLEvSxvfS02VnkSl7+tQmbgokfl+0RiOom
         5ne54PTnk12fYeZOOPvSY25u8eKDRaPGnKRd3V6lUmj4g/47H5Gygsbc+lpyMJP9b9bI
         qN4wMnAYDxZCDVtIyAqTaiqWYOAqf1IAlgTQedxMAEhpE/SrqaNHMtDWo+WAgQ63vh7W
         jUuR2xZvVG7uXbfEmBD/XfphzlPImBUCrrAoqTmkYdPTZAL9hm/WZOe0BVOxCe6JgEQW
         VJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlkZRjD09DbR88CUr9ulyAW86FPvlc+Mp65EBGgTduEpZSB0Pl9fWzteOLinZj6KPl3Lx72Xg6uACaPnb4MTzT@lists.infradead.org
X-Gm-Message-State: AOJu0YxvILh5U/WlY0c++mtkVRW37v2BOYel/9APM++tgmsIgzutbYln
	4E0OGsKDNldlDXU0d5n6jVj0oCCHwE8yTifvl9d61xYBuClyFmX8Lh2v5+M3FRu9luh/a6Oy3ib
	CewgrN/jMCWXLxZ2GGzsz9xIUBYo39xfobFRhgl+yTfJeS8fF5HTjrnroxEPonib13XU2xMoGcd
	Mt2g==
X-Gm-Gg: AZuq6aLbzzJ7zy80B5dWz6VwgjiXuSHLNOU+AHlReR16L8hp7pogu/gm9tVCI2dM+kb
	imgyLkOfZ1iD6fcN3RY260Z9Xcsl5+bzs6WEM6GYZuY+xfaSTeDVpbra6knw201nSkGgvzAjVE8
	CzZoVf2vffu/sxs+8Sv+inYTF4HGyvrRNQnd1DgT/5ijX2kB4BYoYvi3DSgFptUkFfX4tRNqYjs
	POHFcdoEXQ62NXKsCx18dQJFhsAeTOssRijfPQ8MesZITxTsZ8EWKHpjfS44g18zsCxMpSPnLEv
	di8b4rAmwXN1l8bHgZVT0doHvdUu8OpVPLxftbtSiX+aytvTK5XXeudZEi7N3yblePpa9J9QW4/
	U0TffoibIh429n9Uxeenz1wgqYALtadrZ2E4CoBuxov+H8w==
X-Received: by 2002:a05:620a:4627:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cb8ca6e217mr1443429485a.52.1771929826687;
        Tue, 24 Feb 2026 02:43:46 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cb8ca6e217mr1443426885a.52.1771929826083;
        Tue, 24 Feb 2026 02:43:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
Date: Tue, 24 Feb 2026 11:43:38 +0100
Message-Id: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqAnWkC/x2MQQqAIBAAvxJ7bsE2FOwr0cFyq4XQ0Igg/HvSc
 QZmXsichDMMzQuJb8kSQ4WubWDZXdgYxVcGUmQUUY9V+oMxxAuXGPKF1hmetSarrYKanYlXef7
 lOJXyAf+h7WViAAAA
X-Change-ID: 20260223-handle-not-const-9a6eb5529590
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6sPDie8uUqGDS1bsA07NmZp55tMOfOGlzrz/b5hPRYY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDcRw8HWd8txJCgD3Arumeb3Kt0gJSl22Bwu
 5P16m8ME0mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3AAKCRDBN2bmhouD
 13RsD/0U2Kzo2qesvlrOb07YD9SW5ZCP1FxlSzAGO4KbDOGkmm5by6HPnMA2oR+qWkAfHJLNNP4
 fOvAtijr6UM7Ckd6ysYb0jQLJ9GcJzeFPY44yghOURRRRQK2i5wa7p64qcCyCp1P32kHsbj7J23
 JzXFCovKdNGyFm41w2LPX4DmdaxDO4z6tRr1QfhCaKxruQefjBuORlAMA0BOVVcA2HSxfvcvJUG
 LUsf/aiM1p7Vb7tniN3bQmUZlhF7lSDwIMfMeR5EMGhHf21vgEOYjJtQRG7ZCtm6uNMdfzR0NXO
 8nJXjDY3rhLTThDp8eig8CybDwLP0kFCNNZi3m4Ro1znCVVbOi97ZsCYhyL2t3/SYXzMioXWyHW
 X9ZdZiO73mFpyEbQveSIcUJSozDn1t2p93rirFPmZkU2rmpk24qotVBI+uTprSRal74HajfsYzr
 fm44jNBruZ3VeX0xToabjB0aOc2S1udXdwlvuP2cCA6mOYdj/25TUWPIqCPWiNCt0U4ONm+eOhs
 cZ4Ysui0ZnEhX8AupCpEl3ji3sTsVGbGVBnImrxiA3jzY6pP+XT31QKcnRrM+YDG4z0Hv1SKMzy
 SmZc5CDHJozCT12HnwAIGab+HOJg8NASzJ/UIaV8Pg7YJ9G6w5imQg22Boz+n3CrFtliY8vg70j
 u6MGUlqTSqnFg0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d80e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QjCKVQx7SMNC4EIcHegA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cMad9JvOtHipzSRrQeI3PXb8Okiuatyf
X-Proofpoint-ORIG-GUID: cMad9JvOtHipzSRrQeI3PXb8Okiuatyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX/J108KIClpfn
 SUEOcKhhuLL1cz/38Y4WK/nKL09ZLvtCbYj1wrlxiHwLh1jifH8mhtYnQi1ZRF/MG8pG2LeJq4/
 hlxJfFh8rvixEEpMnU2nzlva+JsoLYcMCO5nogFzplgELsavCYGOqv1mBbBlAvp/aakqFppDa+T
 cQQZuribZauQeFSN4LFfnx9E+ticlaRPGPCw0sflbHgdBJwx0ES+ihoQNJpyOUJZ0AXp4y15DOv
 Ec8FZyFwx0iLNQP/V/c7+/URQtJAmlRiI8BrG2d0z2G35k4BIEP2L66vRHrJWp2SkUSERfvNPa7
 kqDPkk16MEd233Tzn7cGi+Jr6d3TGQmupxhL1u8XzdnpjGgm+buisjljvKMYtkDSMjOE3O61wXl
 cJUXeYgJ0ObKibnpBfBekQbdLnyh9/710Q8YpNG7zOxz90SDglujIs48hzaTKXCIqBN51NBIZZY
 +gur+yMsCQvrHiWzOGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024348_586274_11050DDA 
X-CRM114-Status: GOOD (  14.32  )
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

Severale functions operating on the 'handle' pointer, like
scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
to const thus they should not modify the handle.  In fact that's a false
statement, because first thing these functions do is drop the cast to
const with container_of:

  struct scmi_info *info = handle_to_scmi_info(handle);

And with such cast the handle is easily writable with simple:

  info->handle.dev = NULL;

If the function really was not modifying the pointed handle, it would
use the container_of_const() call.

The code is not correct logically, either, because functions like
scmi_notification_instance_data_set() are meant to modify the data
behind the handle (in containing struct).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      firmware: arm_scmi: Drop fake 'const' on scmi_handle
      firmware: arm_scmi: Drop fake 'const' on scmi_protocol_handle
      firmware: arm_scmi: Use container_of_const() on scmi_handle
      firmware: arm_scmi: Use container_of_const() on scmi_protocol_instance

 drivers/clk/clk-scmi.c                             |  2 +-
 drivers/firmware/arm_scmi/base.c                   |  2 +-
 drivers/firmware/arm_scmi/clock.c                  |  2 +-
 drivers/firmware/arm_scmi/common.h                 | 15 +++---
 drivers/firmware/arm_scmi/driver.c                 | 58 +++++++++++-----------
 drivers/firmware/arm_scmi/notify.c                 |  2 +-
 drivers/firmware/arm_scmi/perf.c                   |  2 +-
 drivers/firmware/arm_scmi/pinctrl.c                |  4 +-
 drivers/firmware/arm_scmi/power.c                  |  2 +-
 drivers/firmware/arm_scmi/powercap.c               |  2 +-
 drivers/firmware/arm_scmi/protocols.h              |  4 +-
 drivers/firmware/arm_scmi/raw_mode.c               |  4 +-
 drivers/firmware/arm_scmi/raw_mode.h               |  2 +-
 drivers/firmware/arm_scmi/reset.c                  |  2 +-
 drivers/firmware/arm_scmi/sensors.c                |  2 +-
 drivers/firmware/arm_scmi/system.c                 |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c |  2 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  2 +-
 drivers/firmware/arm_scmi/voltage.c                |  2 +-
 include/linux/scmi_protocol.h                      |  2 +-
 22 files changed, 60 insertions(+), 59 deletions(-)
---
base-commit: 5848db9e2caaa560a21ce692c4c32badef3c813f
change-id: 20260223-handle-not-const-9a6eb5529590

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


