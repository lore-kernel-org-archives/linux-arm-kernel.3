Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19368C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YBmgYqqiWvkxoGNGtW+gM+8EwicKHDMEQq55ODtwzk=; b=XWcJB4m6qVrDJia/+lwQQjuYN2
	w7gNPRbwMWs+hDrPw0TJ9lMzqpMmhPKX6atEnWlAzvaitv74uP/jVglvCtPc+XIrPgyuqADOLmtIg
	YHouIktq2dvbs54Uy0xrgfr5Sd7KScGhWf09H2hoIctA3x85qX3EODHYfrCl/yeXa/Jzsh+nPcFIt
	8SW751WlDa8Anfq7TtADyJMSu7PbGu/ngbci7T+FT0ZYXqzqJvnbuiRbVwPAFB01V/E5uxZqnvEZj
	x8Rxg4FsKxfdj2CGPTmhPPVJvGDdr0YtFKWIB1njV+GNUN+eyEfU/aLPRgOsdQdLP9sXFyOF/vcPj
	kq2cic6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpW-00000002VvX-2SKG;
	Fri, 17 Jul 2026 14:46:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpT-00000002Vuh-0uML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE88QN1974260
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2YBmgYqqiWvkxoGNGtW+gM
	+8EwicKHDMEQq55ODtwzk=; b=FXUQOOHjq/PnecFHk+Zv2FZf37IBT1HTLmr97d
	okn289KMuITPbIdvBVxZ7R7LhqeEhEQIHZO4//29WVmxBkQv3HaoOfgW302gBK5h
	Ed5F4/W3ObgyugXXB5BvnSk2nPjyhHTEm25dDs6lCm07YrEEeEkjk6r6mvZgkLll
	Pzeu07iOCzbduurtrN2BCDg/+IZn0jQMoMfdzwlJrR/2OeaVQPqaUZRwLB01hymv
	d/bxhfAUmjx08FpzYyLZN3b6C7iTP0jgQsZyy0rFu18Jysccb+4hjXHwqks6t4ip
	1hKUZaSYrW5I90SZaaK48F2IFY4BctjbYGzCfosLDBFBE8mA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2vpvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso161774311cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299577; x=1784904377; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YBmgYqqiWvkxoGNGtW+gM+8EwicKHDMEQq55ODtwzk=;
        b=Em2fOU1AnUhbQOhy2AbiWBz3Yb0k+7QkV0hAHC6Wm0b6QhHpVidVawtBkLKlsEzzvf
         ekuELNDONjvOJtit+5dvmUN02qg+lYKKIPbU0eKdRGDMqU0ZbUG9CdMMjluEkCh6+jWP
         oA6koZZ1NBsFrVerlxEF23DAGWkDAFOENzvtbkyFKqExqz0WcuraQ+9GdOFz87W48tdo
         XV6sscQIz4YQEK0SFDSm2uMAiWJKYoIjocbtj+gwKUdNd2mIZwIwpxYkpMbvVgXAcs+n
         hS7LCrVouBhImNvTd+4cEQ3GFlGAMTNtH0BWpVRxPHwS2eZUIyLttzFKlVdMkFW9wlwo
         KAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299577; x=1784904377;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2YBmgYqqiWvkxoGNGtW+gM+8EwicKHDMEQq55ODtwzk=;
        b=A+ACvxupgvBCD2AdSw2dUUFSSBjRJN7nOHsj5yFzY0lh/7AsLXQZwFDaSClGVkvQzj
         yo/Vv4p4cEcKbhuDZ6uyxno/h5HkkEWHDsfXUW2kojRMmfIsxKJpR95/T1WfFipfHwng
         8VV6vMpLwqtuTydUA3crxyvAoHRVUSsPVsMU34wFMBFGBML5mu2wP0axCqrcudmAxoPx
         VBI+cRnoVXbcvJa6wPloev7jB5Ofzpj4swHdHUvcUjItMTlMwaaahQ3GmjMWpQkbGpF3
         L7zwx4diqvDtm2SyKUxSAe3mJwGPeJF5gy3GyQ3Gn8lnB12eM2RuFTQ2sQqim7SR0vNq
         H+Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rreo4XG4O0Q2u9Ctg6eEqEXmy1bjtXVuOUiez2z6wrpfEHqUMDunalDoyclHZey+F8OcxoUeSN/2iVZcnXHHcwv@lists.infradead.org
X-Gm-Message-State: AOJu0YwtIZv/FWHYNROU6r/drMq17K7uJ8UKcQrz9xWEiz+X4XgwjYaT
	iMhrpXYkZz8IzA4WhC4eZ3tsWMO4m9lhB/8Md7/sOOb27satSl4zv9hj7RNw9ihlHtEHh6KYhCK
	cmjHbegVX3OE2Sv2tB19DNEL4Xoog1sy4CY2QLkusNMhsrf0DbIWoQJsl7DvXvwDcHLW0afPqi7
	OMfA==
X-Gm-Gg: AfdE7ckZT6BRFD0SXUkBrQiOxD8uX+3BfjzVBcJvoatHynzOkW5MXi8YQHzGo+tGhfV
	BEpe5lbnoNjwYOY556t8YEIz/jVlo4hFguv/aqSIMiEzMpjrMPftau0SFjoAqu48ulOQDqeoG+4
	kGB5Iji40HXguE7RO6GidmTRwndI+wFMK+iE9nxRQnWVasiBPfbnBwFkb8rOqVRTtLyaGM0LshL
	3ouzqvzGNoHukjXiBO05ZSYtQ7PbZoaZoRWzURzoOYKMt7qs63uimPI5sqDwDTDJIm3d/7LXuU7
	TKW5mt6L67QusbJV0myRxF8yY38MI0xqdu/XPXZx1KLXmpgYfQ+snSkMglzU25Mf+ffv/uTD9l1
	UoECGVHAHjDsEAd3BmO/X4hjPOdA=
X-Received: by 2002:ac8:7f8f:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-5213c7e50cdmr24070091cf.21.1784299576627;
        Fri, 17 Jul 2026 07:46:16 -0700 (PDT)
X-Received: by 2002:ac8:7f8f:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-5213c7e50cdmr24069531cf.21.1784299575917;
        Fri, 17 Jul 2026 07:46:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:15 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] iommu/qcom: Misc Fixes
Date: Fri, 17 Jul 2026 20:16:02 +0530
Message-ID: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sXj2Cib0Uwg3Yuabi5EMx4Lpm3PkJ5X6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX2+M5htillDTL
 v6elrVfQpY757JRlZ33h5Skj70EXb5m7/nv+Nb29Of6mHnGc2s+VabkMZ/9+8wv8u2rXMoPT3ex
 A8hz+CDi7EmjF4qu1vgdZPZnSWTd1VE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX12Fngw/rqoDr
 3nVX23lKObL2dLQUNvNYSOrFvDyUrz2BeD+rZVFWw6u1PDSoCbYvZsz42CsYmuwG/XxAitB8kx0
 JUgZ8Vf+uhj7iBSYRIZULsfFQ+YznLT/A2uOTl1S8cdJ2hkZk/UKq60/hp3TzTW5M1hLcfa9/BV
 UtNuq1OUbq0kD+qaLsisybeHk9K5ca9mwKlMaJwrMp0RQi5epUmObtks/3CMtLP6eAjfUsyv+m7
 /eqsBQVfUfcNNl0uaR6nGyf8TYbSznS1zdP24ymflbR3u2cK60m7nXvQ/NxDLuVfchO/aAOjR+M
 4Yr8gN2BiO4oSryACrGsxAqt4nnl8jLXkLFkQE5+SHk09st3tQbFad2gzYrrkez/TGLtERIA/gS
 8EzReaeei6gp3sBXjc5ELke2ug3Of115eXWjL1y/Q09ChoAdYZis8bsrf+oAAY5UOGx++coYqXp
 s0lrjSE2FBBw9/3H9MA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a5a4039 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=AmUTqjPzaPleRPW9gFYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: sXj2Cib0Uwg3Yuabi5EMx4Lpm3PkJ5X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074619_369801_FC25B382 
X-CRM114-Status: GOOD (  10.79  )
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

Series to address fixes in legacy qcom_iommu driver, it is based on top
of  https://lore.kernel.org/lkml/20260623071245.1985938-1-haoxiang_li2024@163.com/

Changes in v1: https://lore.kernel.org/lkml/20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com/
 - Used devm_pm_runtime_enable in 2/6 as per comment.
 - Dropped 6/8 and 8/8 from the last series.
 - Added R-b  and fixes tag.

Mukesh Ojha (6):
  iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
  iommu/qcom: Use devm_pm_runtime_enable() in qcom_iommu_device_probe()
  iommu/qcom: Check pm_runtime_resume_and_get() return in probe
  iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
  iommu/qcom: Publish pgtbl_ops before releasing init_mutex
  iommu/qcom: Enable clocks before hardware access in
    qcom_iommu_ctx_probe()

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 31 ++++++++++++++++---------
 1 file changed, 20 insertions(+), 11 deletions(-)

-- 
2.53.0


