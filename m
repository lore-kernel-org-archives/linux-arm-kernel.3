Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5895C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=; b=gDaluysl963cBsQA48/ItX+A/t
	PuYPKOGADGcNDrkVCu1Ar4n4SFuZswLlkGe15CsFttLLxCjFE8B5cThcck9hS9oJLjAQ3nIWPwnnl
	4X16/+zVcf1DvIdnct02+x7axL791gKz3WMtZMVGFgTm5/PznBkVzZQlFIQwp0b6sA05vN2VebaA6
	IcTKzXox11k/yDizAmDyxHya+pyhskvYDaTOSesgYusn8mcqzS5fWTFa4wFEvs2JQA7oI/4OpC+86
	FtmkbUw9e3zlDE05+qgt1kgwH0shnsqcuRepANXzq0KddlXu1ZeKnlSY7a3OniFhTZ/jbxJNN5D9L
	L2fJhJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536X-0000000H2NN-0mNu;
	Fri, 11 Sep 2026 15:23:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536Q-0000000H2Im-0dBH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:23:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmIwm799005
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Urk/tOiIEwK
	LzYvti+etTD7iBNYdIx2xH64rRVioykU=; b=Suq9KY7zVg/VebW6W63FMbrTuJj
	7ap8NNkC4Lsuzv9kMMfAD/4qrM2tl8jxAe/P7CfqHEXFezJMEx93GLLUd4mYXgOP
	MYvLaM3AVLYi3qEn6EHYbpSAoKaKHoydQu5x1EQjM+5m8+FlnmjhShHvXbOb8CeP
	BCMP0JBc4ms6YpO4HoYFpZst5TSnmCXVv0LiCae61u4gTCfHoJo9FzmBcIU1hx6u
	F2hKMEQhv/553GpVDCLEvyMYAhZ6UUsHiQlc1fGGD3vZQQTzfgbaGXGGc/TkaTcO
	QLyW+Io1/xtaBj6k6Vf8sm7/jRYPc4YoowZijbeEXxnHdYIyBdGud2O3D3Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q147n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78d25a8ff32so248374137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140224; x=1789745024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=B3NrGfvUGpYH6xGRjy0KySuQZuIwKyLihIXpz1V//Thl21crMobq7AhpNyrzlEa263
         LUubECpTI+4rFKdsSsspZHrduydFEzxW8020cdgzCqhgtdBI13M+GN+gVBzISGW/g3q9
         jJZ4Kwr9MPlU+9UZ6FlYfRH43lS5NlS8BoRgGd9hyhWUDwKhjvRRZKAGWYG86G+2hfAn
         TTKygH8h0Tn0u4RS6kSlOooAruyX8GM2j5CGvV2OPfiWUoEnAM7mTv6jsjFoWeObB8SK
         JcS4oIYR/z+11Fwl7K/euJoh0Glm88upxV/JZkhxlL4zD4/bagCcn/vwnvB4iBIBAgzT
         TDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140224; x=1789745024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=NL46EOmHD9edEzTgeIWyoWjLEsWxSrUMrfk+KqGKPOYQEkilTCi0KXj5rM4XFaC8Dn
         Pwtd1B9uJFADYmQ64BpXffcnQyPEU3/bbh1PwKm5Q3yxKoQHw1L8GBhZbGb8U5BJT8q8
         udXTuhtfjafSfbAzvFw4vAS8/j+WaalNk7ynCSMcVrcVhzKHlf3EYlIlzaxw0gHdXd2i
         zOzdY75QYNpU4OEdasPxmpNu3sGoLiX9z+iltoBl2YZ5OIaAioehHgQ6wn8BkdpiRcwH
         fjz5szca1gwG0HZGDNFKiC8qvRPqeQ0vK35U6+M1Rux3IckRo4e87aBskyQC5ndMSSDf
         9VmQ==
X-Forwarded-Encrypted: i=1; AKwUvBygfHTUOzLrellLNoELgChb/pjLWCszomdPG7dyM7/oRQw4Z4IoqKhRpBqVs832yIfDPEIoyLv9UGZsETH2SGDz@lists.infradead.org
X-Gm-Message-State: AFuF++ktFnNCt48age/EG5G1QGwPCttDjVzCaJFDcy9PQf/x7x9Fod4t
	nDCZaN4Hd4Y69LvS+3vv62Yx43KUTmC9Bs0M3/Qf/nVupSeBRJ4tq5MXK426LwfiyGTkiXifgdU
	SPtO+Mfys3iJaidhaNQTyhhmUKOm2iQD9vEFOQkc9NhdJnTHrXOJaJJ5ezG4+bHzo4gohyuuJ2V
	9Z6A==
X-Gm-Gg: AYBFou3X3t1jRJnSD3evV465llcZgX8JQUzNwV+/ghSyVMBpMISpemtYT6bxJd59wTP
	/uP2WbDUtc5MEQbR7HPQYnReiphay1oFjTCzPau3x1VpBUXPhuJsluoxa5vBCpXTVFR25C+tu0n
	V+PXv5ngBv55+MU8/MIrAgFbCZJpfCL7sPefnrFhIT834rHDiasBtdE7rXin3/iQuecnYT2wLEY
	eYhURXCWqXrO31Ir2CD6kTERYOTowag4dcrKMlp+Mv4Xxfoooccr9ESJ/fNnkSgRKUovC7BmxpR
	Q8CJHMI7XZJ0kC4Ha01/AMB/F1n+kFu5qHokHyg0+dPGSnRd8AIJ6kHrU2CjFowt2HP/MZ7HhbP
	xOgfd2St5i62vzhAV0q1/cyrjSrfNJrS4FDf5AVfrsD5X1I1Wmgbk5uuFRRr8CO2rb9OvPEECwm
	9etHz9RW7gK8Oi8DDsUlGfbIl5XKHiKTcvwgGb
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941236137.11.1789140224572;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941110137.11.1789140224027;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
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
Subject: [PATCH v6 3/4] firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
Date: Fri, 11 Sep 2026 17:23:28 +0200
Message-ID: <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa41d01 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=EzzhlMzFHTv8R9URApkA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXz9gS57N9vPWG
 UzK9oMAi2tv/m+gzQ7D35e7FS1i1bmkep0imoU/7yIHaKA44yZW6O/jwnLMIKg5XQEu94nK5UW0
 Www4n1BKrk10XFiIlGjY8koOgPsVFf3Pj57ATDTg8iyfp22rL3PQWAoxcAGUQpCyCmi/zy7baup
 nOLY6MypTXjnxubm0IsM9C57jZ73zZDZr2Ekxmzsi9QbRt46JbSTJ2YjJJV392qxzFlICG8B0Eu
 2duwciJIHatrmPahUaY+Soai7gPsnKm0d6mD/KZXBU5281XXoUxpEo77cXhDSnHgFTjGs7dQ1od
 D+sDsDT1A0I1VyfdwJtz/DaFjsko5dyHFSMv428LegF4FhFVUnLTEdfX+brFAFjVQU1K247lY+J
 ynjypM/0WAVrSVYgY9MW07EfhaL/prBLvUM6yTFM6p2o1aoKpcY4yUU/ZVW5je5bK2s7wkwdkU9
 dRYpFNdDNwqsMesGM9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXxbtlDohPwiAD
 8EhHrOLeg9FvYqSapjpxAeZ84LvO0mOLdCXfVeZJMwCp8Pkv0fgRqDMYyP8IFgnkJvIB10WKeoj
 N5VEGE+vD3ISF3GqOTDti/d3TK+0FE4=
X-Proofpoint-GUID: 2tyViaA4kN-1-mn6KuIjDs9B9ERzc_o4
X-Proofpoint-ORIG-GUID: 2tyViaA4kN-1-mn6KuIjDs9B9ERzc_o4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082347_025609_3B11F568 
X-CRM114-Status: GOOD (  15.04  )
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

scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
the notifier call. During this window phead might have been deleted by
another racing scmi_protocol_device_unrequest().

Re-acquire phead before cleaning it up to avoid this potential double
free problem.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- New patch in v6 of this series (Suggested by local Shashiko run on v5)
---
 drivers/firmware/arm_scmi/bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..651d4ba06574 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -173,7 +173,13 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 			}
 		}
 
-		if (list_empty(phead)) {
+		/*
+		 * Since scmi_requested_devices_mtx is unlocked during
+		 * the notifier call phead might have been deleted by another
+		 * racing scmi_protocol_device_unrequest(), re-acquire it here.
+		 */
+		phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
+		if (phead && list_empty(phead)) {
 			idr_remove(&scmi_requested_devices,
 				   id_table->protocol_id);
 			kfree(phead);
-- 
2.55.0


