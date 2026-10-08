Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70C5CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=; b=mlMyMSGMoJNTFoGtgsXcTvG++L
	rnns9fPwg0ToNF/UsCVD7e0zLs/AQSifiJMaiizqJdPvyuVKSvkn/dDoPRhnAgznJW+cwGnssSYRT
	tF4BSIibIT+oFhYUahOovQi24wNSujletwgyf681yIlIGS6s9h0KPrLnUZIjJf4lFHWk4NgjY0pAX
	SRCzmc/eEyHfzEGen54UaKuqi4TZHzC7Pq6wSURZOLgAPUKzs5y3MCqEyMtwifZnOsGvT+gtrzZzb
	WcG2JRRfowy5YWzbrLX2JA0hrtfrjvB3gv2lp6xprhBpplX+6t2njzJmZHYIjfDuiuEKDeDzz5mEN
	RNTi6Hsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhuZ-00000003esQ-2sl7;
	Thu, 08 Oct 2026 06:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhuX-00000003erg-3XFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:47:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZfM313879
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=; b=J3gOwE0UxVt5ASCJ
	avXMitw3WNXtFM4PLC3UgIHCLMy4gVBVfgn0X/tin784mXgNi+QH24Xhfj8OJzEo
	YDEIyOJo/qU+mocS6gbCUT3oNo2o3ueIduFJEUhFG1Q7cN8/aJB+hNYYZka/+a8P
	Y774p77QyQvQGQeDVzpSBh3qN/kcTXfL9Z7XKdSedlIADYftOlScDeqzjGrXGQKC
	9NVB3u/Fn8VvoQhukIPISNKgTNazPMv9V8Soi9dfSWShGL85KvhnbRyirAWHIIp+
	WF781xLXhQl89nIm92/Rj4Cero5M6Dw92eZz6cFUgLZDDIupYyPUXtlf74SvtM2i
	1I0KmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31fyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:47:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so6608081a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442045; x=1792046845; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=OQ62WU5KD9zeTOAFZOpiItT9zGRpCQdopbNHCI5NlSD5J2i1SfNvtYFJTasGPzeCRR
         mOzgqBIOU0Hs1+JuvXmca+K7/aEZBDyhl23K0YM4R/CoHM++kiZTkebKQkjXUtkwZLLO
         fDoV5VwEUtCMapdNVbJRfyZIGfTYRHlKYv2pU6g3G0j2VPSScw2a0xckTRdTyNFMx2+4
         Lt+P3rdUbkaTJNb7rQGF3/T4FHzEPGYdJK5qno7ZhChh+eYnJzKZI+4HITef/4KYaTC0
         G/cTGfpmqA2sgGLl92cJBlaJ50LrJIw67oHfrnbC7cG4ATsNA698G8uPUAx957M3GeFW
         SuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442045; x=1792046845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=241G0h5XmkXbmvc6CSpKnQjxMdJohU86fvoO2Nxs0jr7km7xKHS6glrzCI19+5wtaY
         5Gh7k+zcl6PQeCgz0IXOraqf5RQPiS2yqJvEEoDCALtwaZAzHPtYBTy30cF14+AvGUxu
         vhAzn4DSwYCA/+wFE6HaN0auH8mxpJGsqFquyuaZE7QGCEVjDYnGwIhrsmjrFSfBAt99
         i78q53qwA+MIGzK5Cnhy8CS0iHOzMICBrL3RXLbRrJ+6imJcHX6rtL2oxY2Eek+2HuBs
         RONOvb/joFfh6VVicollUDVInHOgaSXmQUFGghBP55Xv+YtFowjeEOc9x8oy8J5jZ/KG
         GLlQ==
X-Forwarded-Encrypted: i=1; AKwUvByshmW8oDHgAJtWTFXeDE2A1RPDa/KVVrIT3h2fP/Mmf7K9Mg1jqzP7V8DuxFeu8pzmRA/VKeJWtfOYl75hcpqi@lists.infradead.org
X-Gm-Message-State: AFq9FYLtmwYWVngZxeXd/aU7F0TZiSdp+JOc7c7EM0dG/cubCTrqFvIf
	RTrc7Tjs3WiDwAtYdfQneyLqatkc/Mbb+m4xoS7WD1EM2KcehZmkwuO9+dW+oVRPQheoL8mJPHK
	/eRlUsoKawo4/Rt/pbhrSZdGs59023APm6QEC9Ef7LG4zQk5O425OKnJCsYh4LRSgHG4NClJ50e
	ThUA==
X-Gm-Gg: AYBFou04poFEYYaSrj5Z6ZSHLwbz+7Kni4cfcKM3qTMdvv8e3bZ1TcUW8Coz9QzpVTf
	heUPbXiufJJeF5Cyt7yzBBPaI6cZIzWoSJ9eB0MEHNLPbXP7FFo/HUiPQ4AzkkKqJF5QVkB2y1r
	/jZuCbORD0EeiieVRINDAzCm05lOJnFj6La5rqYH1HBezRVamK4SZNGIp1g30bWEsnKt78bzAcS
	Hon8NVZYC2Y2IKs0R9DT5X7kYwEqlN3uMc7AIHTmCNSZnHLJkX9kGIplZvNPcLNoKrezwb66iPD
	izodONP2uMRCoLPlzmiOWuzr9/3eunlKIcGxAVNdTqPLn4S5KbWeOJGFGMLeoG2oefvF/92pbt0
	z40Cfw80dHo3sijDINngNNQFAcD4npsdlWDu35ZFBV7b94BTzm7NGhbE=
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010046a91.44.1791442044459;
        Wed, 07 Oct 2026 23:47:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010023a91.44.1791442043924;
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:10 +0800
Subject: [PATCH v3 1/8] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-1-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442020; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=j/XQEZw3nTBBHy2V5OGs1jS7fvptWPEoH7KwUYRkTCA=;
 b=X7a/wNFXtXcHebbMyKYDrN8Yycqni6KgyknrSkGsyJg9T0nph6PauXToSrX6n1ceCcY99Tnog
 YgErdd+Gx+vDaDYSZ7/BJDwI+zlMJv4B/SL2IWm+SqL0ZqPRgAJk8S6
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX6/yo7xy6f6IG
 LQ2YZ8bEht00UKr35HXGBkevj+xr6VP52g6n+NdZjz/SHi3FNo27KKxu6yAUzivgTdA/x/PRE+V
 dCUzjbOSIXRxp5DHQn42zwA8qYOLNg0w5q9balyNc9H3DmVZjZITO97Nt6i/3b2T3fbCWQgARvv
 3GJw9BrAXpEaMabp3Ytus8UBRsrjApt5JcOzW0XxaoYK30CGh1DER3bg8E4fG7xjVyxbTm8/9gl
 QyZC2l4IV8wBx35OFl0HIKlki1zQOtm7JkEbixoM8tQOtSn1oZx51MEbvp0FHkkkuQd5BrPOr3C
 Jx5k6lCQSRxCYmjZh5Yk44cWfIfZqmJP/o42d34E/OZiO/izYk/sHnXVSyjkSfIusRI5la1hxQe
 i0p5QXk7nHcDm1oMS/euNFANa9q7Eeez5qxO7BxJ7V9KRcv9WkBnV1qTVHvtk9J0FXcC//d668F
 rxLP+h7y0eZhFvkuj8A==
X-Proofpoint-ORIG-GUID: AU-OL15CdRmMl98kkYRI_ngl9zHDijws
X-Proofpoint-GUID: AU-OL15CdRmMl98kkYRI_ngl9zHDijws
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX9qOiRwF7cpzL
 2HSl6KdSvpQ3bPKEWS0GTLh2CEu7h8hCBK/XxNt3xwcP+CJrWoSYiw8KwMCpqSL/xEuGK6nrOkK
 Ysx+JlmBzj7W2oTQLhrLp27vkLRBO30=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac73c7d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234725_894862_A34B3F0E 
X-CRM114-Status: GOOD (  15.68  )
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

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6da217abf689 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1


