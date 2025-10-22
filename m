Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA241CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPO+5ZAHamuKpqqW2/tdbIcyYFMs/w8rT5Hidhv6oKM=; b=bW+CqnWS/UBVM/FbGKCLrvcQ1P
	7sWYTmIXilV0SYP4IbXflrAH35gQrgr/USfezzLWRYIRbJzOc4Lmf414KDAG8HjHZcONiDfUbxggK
	ELd9fBqdo/czCCHp8nTyjJOBEF+ZmOASZIvtErkPGmh+OfjFw0J4mvT5dTB8nN2JGQN/HiJZuUrtm
	75uxDUK1AVYXVtV+lQg8eqB5SpptXPDM9QslKZYucbIof4rFVuilNsHwiTbGT4oeBBx59n6jQVR1p
	6lW+ahHwtfb774QtZGyAp0+cWIgZs41oxOLqdF/CfzRKleRLRYtH8EXBQ4OVPy7OLuIfhJZs7dce5
	6o5x4ijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaqG-00000003Ptd-3F6j;
	Wed, 22 Oct 2025 15:33:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaqC-00000003PsU-2afa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:33:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MCaNMN027963
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 15:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPO+5ZAHamuKpqqW2/tdbIcyYFMs/w8rT5Hidhv6oKM=; b=lrf6gYQHCQAi2BID
	JmDEh0qwu1jcWu3t3pikSpPehuxsF+0lUsqCzhmtWHzr/KPQJhBcKzGzQeBGHO6f
	J1fOLGrVk9kwhZ0unCUK8NfBmj27mRcbUOjH4dzfFzL5Nff9L2ziFL6bFDBV1AXV
	CYHzbMoJyEEsV+apH/LZSe1ZZsfauZqg07afAxsKlJIRKMnZhElHmmAGqUKUppCS
	T2JaIXcCyJt2L0wmA3u1oF1DTy2AC3p9PwyAwhYNURc08InaDOkMikq5ysHDKz7t
	ZEPZyhlAnEOei5PNa7CHiiCRj8osASL/Ump8w/VaqiOysI1loOJGNKgRnxRqghXU
	4WJnTg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j53se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 15:33:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-798920399a6so1067354b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147210; x=1761752010;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPO+5ZAHamuKpqqW2/tdbIcyYFMs/w8rT5Hidhv6oKM=;
        b=GxFR9+LirenMiPmAVWOFr19HxM4klEzrDECElJWsbAFfoMeIC7C0prFDDz1AABcH77
         al3f7omAJxDFHHB3az3X90Me4jjMUuQABaog0cX9iQV2juxhhCYTK20V/E1Sr8GOr+NB
         je9WukUyiiTutkOOx480zb8i7+5mpZYIhTfl4ygymVnFNh4U5Xf2u6Pa/bUTvKEgDrsi
         JXw9FR+8AWQmA02aUkru/Eqf61T1d2z/7zXBphBp29+BM421kwC0UDnwFk/EUECQO+H5
         O9fSKnyCrWtcyMzB/aIwePryIx98oG8VxoQct2IeOk5mltMZxKvoMywmjwf8rIf1wJ35
         kQqg==
X-Forwarded-Encrypted: i=1; AJvYcCUXSkxE0fM9co0poHvFzf4z58E/8lsFXGHmnHyjFpZmE0D/PnTXee1A4cmQlnVK0/92QntsJfnmBLivyHyYUm24@lists.infradead.org
X-Gm-Message-State: AOJu0YxsUZ4jRUpAupnooLMkttDLRutaEhWpJCwrdPYL8uaykO3rjD9z
	rkL9fLzE5q9VrICWx/gFO0Rn8QlZWDoe11SU0jNNj3IsK9FoCnpwOo6e5YvAWwOkOzb1Ucb/zEj
	DVfTyN+vGd8g6xoeotSeWVW+xB5VTjwknnUYNjKN2zEk958eC8P/6daVDRPoCMN8YCGbb4U3nQu
	D4eg==
X-Gm-Gg: ASbGncsFTyyF7t1fcuCscuyBvNxcWmlFwi3EjzDOtfBcKfRFQPTNQvvKJC0Fs/dt3/W
	xiG5GNplSUt5UY0uRXvdxKLUVT2PccNHzXxb1j9y1FGzCTJM1bi/zf94N80ZZanFe0+0Pax3veo
	JZXVLC76x37BdGH2+oNI6xuLdA1wMExokAJXiufp329/vRZEAxJr28vHm0whjnSRXSXe2U50wYU
	diF1S3YOxN6tEaeIftn0RHKNhSbPzLZ+SSrxzE04K22putPO/HBaK6XWj9eK/E2WepnPmdM7leP
	zBxss6Zl/0HKCHakeNgT1HBbSGWM237uj5sgRTjSxhsrPnNL7Vd6pj1Ym6ggJjpfKKJAK0fPU+6
	RBVWTPVQA8zaP+TzqD5QONiIJmXzZFO36PcM=
X-Received: by 2002:a05:6a20:918c:b0:334:8dd2:8372 with SMTP id adf61e73a8af0-33b684d0d35mr2913259637.3.1761147210332;
        Wed, 22 Oct 2025 08:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhnUYXmpiGBzo98XdERRsQOMLcEtfJFyd6TXCoDRow6qZGinPXLkS3DXGRJAh4zEywkF2EGA==
X-Received: by 2002:a05:6a20:918c:b0:334:8dd2:8372 with SMTP id adf61e73a8af0-33b684d0d35mr2913203637.3.1761147209734;
        Wed, 22 Oct 2025 08:33:29 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf0443b2fsm571552a12.30.2025.10.22.08.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:33:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
References: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v2] wifi: ath10k: Support for FTM TLV test commands
Message-Id: <176114720901.606027.2235262810066845660.b4-ty@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 08:33:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXx4KWVUUxkHAi
 8xH5daoavCRD1a0bxBqPsUXLmfgpyLzPSo5LEJjxmjq7TMtujqMyrQKzJExgN0uq0S9ySdkYUqE
 rZra2vx1wo+7N5wvzcoFilNvEhITWJXBa0dANJsv8C8m357QMSCiN6sQWVE6du6uP8c7Xp/jpjA
 OBrGCvmjO4MTZtLRKfVAgEtWmyON1qJrjn2R0qQaFpsHQEEXL2tY2bNHX6PQAEnbG5eZ6Nl4mKT
 g6SgoqX1JlRbVCbCRGg9AOLfoHRJTnG5Q6v8retcDRZ/7hVU3PTchaDdF6eBqaKKHCDO6faAlr2
 kgV4xCo4IZf4v8jO5dnYnJOUQPkNzE8DAQVOuEhqTpU/LCQGmpE3KU9CRYOdVLEPURRoUoSN749
 GEhJ+Uu9Wv4ce00VNWtFPwXmWwYEnQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8f94b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CvSNZa8qkPPy6F7HHe4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: whD3xZJrLmZB3pKPaSJqUbi3DoQOBfw1
X-Proofpoint-ORIG-GUID: whD3xZJrLmZB3pKPaSJqUbi3DoQOBfw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_083332_800175_8ACA059A 
X-CRM114-Status: GOOD (  11.48  )
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


On Mon, 20 Oct 2025 17:37:59 +0200, Loic Poulain wrote:
> Existing tools like myftm use 'legacy' test command API. Similarly
> to ath11k and ath12k, we want to support raw TLV payload submitted
> from the test tool. This requires segmenting the TLV payload and
> encapsulating it within a WMI command. The opposite operation needs
> to be done upon corresponding event receiving.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Support for FTM TLV test commands
      commit: 54be197109762d2a3c2b23d44e960ce7a43a3798

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


