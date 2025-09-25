Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16287CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wCWq/YTIiXrWmR7ttDtIOYqUi63gbK9WENznA2ZOMaE=; b=NGerGTWtdvJ0pt
	6E1UKqPqdehlVYZ54FxtokqkPDd5JrqrVNS5J5Y7qA5qeTcTiFTZi7H6QCKqeLKPTJyFh/knaNSDc
	vJI++82SV1trOMm4jaQ+Gf13KT4isn0BxUfHEeS3Je2T402omo77i1QJ2nhgPg6fjwAsBo8YiiU+o
	+AgeHFp8EwzJfvEohkUEpmwgkV5Ci7mI4/kh9btcO6/xY1jXYG98cdr1LOnWyj4hPbnb+HXnWxi/I
	P8q3wfoaQvuApJk1p7NLXg/I8yHxHCzOGmaGwboIZ4UbVHsYBnkxC5uEA0bP4KLCYpLjjs0zyTPys
	QLjlrwmYOPsKFfBAfuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jRB-00000008Cmt-2WkC;
	Thu, 25 Sep 2025 10:42:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jR8-00000008CjX-0JYX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:42:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9Yq7g021655
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wCWq/YTIiXrWmR7ttDtIOY
	qUi63gbK9WENznA2ZOMaE=; b=gYBx1KdKV7gFCTrFdAvzvjXuqpIsCRJtDsXDwY
	TFWMH2WGYNJTvNCX0Jg98J+3UBmoXp+Ry7HiPL5sJ64MqiYHecd+pvYjnUQwqel+
	/sAzP0Sc8IHR5Qvs7Dns16S95g6rUWd7XviRdTydl/lxXVBrYAgHd8l/W2JYEP4Z
	cC0yFvTq/eGS4AIe9w2eezg7qY+9GfbI0rj7vHdGoCRbGCDarshK1wWRYNEBGizp
	eDLzojJNe0wk7FAOZ3tQB8JLFqBcTxWZdnVkvTw2y6pWR9HlRM44oxnswXYWLPwh
	Y6mQswqDzPAMFraiq51CER36m7CbjGSBqTJVnx3DA4mseeJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budafbrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:42:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24ae30bd2d0so7460115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796970; x=1759401770;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCWq/YTIiXrWmR7ttDtIOYqUi63gbK9WENznA2ZOMaE=;
        b=qZrq4craX2dMlI9weL/Ni5zHnBwhh8vHWQ5qaT0v0FHJrAkR5voFM3N1B3XE/K51ta
         zmXS5cIKdF6t/BpeNU+BkMNQMC38uP03eboKJqmDRbmrt9MwyexlwfnubwcmzfOuMss1
         R0G9Du3PmzMeW0Er5wJZbBvEdsxb+A7OXtSP0SBNnJxVQfOTgdPxZGLmSenuu8z4VYvJ
         ae63BwaKMk8D6vDxJelfzrO2DtKbLchR35ypcTXl8ZizWq+wwLn5yP/xCdM3mg6RgT32
         ++V05Ci0a27rgkLQ7NWPupVjvCMxqSlMtMOLgEgNfXFR82IMr6cJ2GHa+whBoZuZKue9
         sr3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaxPn1M0+cen1Ap23rMnzyV+IXmkQDOFTF5v3fUi2UB14ipJE7Nk1xb/IDsI2b+gMjJ6Yc5NiHZpFsHJsX1NXc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Zkitw1QVInW4GcSnpX9lQ91GR/Gu6c/VglhcDw4CjFgICisw
	8IGzcgrckVnaUkxFkcPM91HbfEWrgSapX/85OFO+kWSuVqB4QZoImOyQvkBwZFJ5Lictv5z7qF8
	zLgAoo6cPXSo2ypZKE0RMVMlRDCWUY1/R/aO9vsRackiKKVUpxsjJvnPKG7AZlf7XpkfUVbODYg
	+qXQ==
X-Gm-Gg: ASbGnctEXlkUaAkGlib/G/HtO/vPc7Q+eibt51bD0KMgxTLO3+aRZ56kNewt345l4iQ
	7qcbQ8xhtzWGfiNmhnZTGx+dx6fPHLahKB5MxJg7EU/EKWm+fiGylaaioQPLjYWU/tvx9X07v5U
	mzi+82u+c220NEeJmvJs1+9FnypTmapvi6IOVLwY6oxrrgw0eiYNQl3XcbyO0zHwhSL2pgAlKp1
	XgOtjLkDpcQkVjBYdK0RfdnEComsoaNhIQRXUxlLeb2Pps53mjbHt/bWrryHfyVb2fBmaC4zNBq
	6TK7jrykjmHDv9lvBW5MsnFLtKY5QD4zWINaS1s4wl+B5kmJtZ0hVRZ5HRyM5aSNFWaxBYJmdSh
	shvh8DchafUmgC0yuDv0pUrsPbNY=
X-Received: by 2002:a17:902:ea02:b0:270:4964:ad82 with SMTP id d9443c01a7336-27ed4a91a49mr31884695ad.38.1758796970362;
        Thu, 25 Sep 2025 03:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeaT2eKj5qrrJzt2bg3BLWcEXxAXbXiVG2V0Z8kPJcO1D39oatro4Oz6xFObn0LQxLYstl1A==
X-Received: by 2002:a17:902:ea02:b0:270:4964:ad82 with SMTP id d9443c01a7336-27ed4a91a49mr31884365ad.38.1758796969889;
        Thu, 25 Sep 2025 03:42:49 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6727ea7sm21046845ad.61.2025.09.25.03.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:42:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] coresight: replace the void pointer with
 coresight_path pointer
Date: Thu, 25 Sep 2025 18:42:30 +0800
Message-Id: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcc1WgC/3WNTQrDIBSErxLeugaVKrGr3qOEIOZZhSQmmkpL8
 O612Xcz8A3zc0DC6DHBrTkgYvbJh6UCvzRgnF6eSPxYGTjlgirOifXvweG0YhxGvWtihaSss0Z
 JaaG21og1ci4++srOpz3Ez3mQ2c/9v5UZoURRgR1jQvMr3kNK7fbSkwnz3FaBvpTyBQ+WBqu1A
 AAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Carl Worth <carl@os.amperecomputing.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758796966; l=2517;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=LInkO/nx2wI1fZWqmF4NU0yltD/5FgxKoXKOWc2WyZk=;
 b=t8zV3ze/A647mSAN97+cif9kLqWiNiGcMZ/8TUs6JBfTRlHkirnpRy5cC7V51nLpOqxMTFlDu
 unOfp0EOptlAlP0K5Ekf6Mjx1gHy65Ig7OO5GRk+VAl3q+CSkQS5WHp
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: QU-avHkSUXYuMLeUf9ZOal7gjQLItKRb
X-Proofpoint-ORIG-GUID: QU-avHkSUXYuMLeUf9ZOal7gjQLItKRb
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d51cab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vzhER2c_AAAA:8 a=i-0O458ng5iwxdbG68kA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX/A55RMpC4m3C
 N4sFBpTyK9GZIzlBLVj7H23ABickr/n8Nql0hUdjP4c/uxxO1kyY2bmKb2wNk2Sn0y1etPQq8Qj
 e7SdShyeacTRWVTBEC03Va7GigCzmWZ4s2lhoM46sBicJK0ehV1d+foAVRyAuTBPUoafzjHQKgP
 ywdW6vVgTZPfijo73GZa/6nnlEnxB09vCATvbj1XV3Zt2p0eeXHC/jhrgVXqSwhLkgFD4LZjIOM
 idiJQ1B07Hq8E29Lcc6VfqeG8U52qH9NVfJP6D/xZ9KG8JH7caQfrO1Nu2UfEItbninord5q6EJ
 GJR3/nVPWVngGPM4QKQ1JJBAsT+5YMJDPuxZBWgrXqQUtH/Lm9Ss5w12py5jom7iRR4YFhRkeeF
 fujMQkpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_034254_231614_8F71AEFD 
X-CRM114-Status: GOOD (  15.51  )
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

Patch 1:
Fix the issue that the catu cannot correctly read the handle of the AUX
event which is caused by the commit[1].

[1] 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")

Exeception call trace:
     tmc_etr_get_buffer+0x30/0x80 [coresight_tmc] (P)
     catu_enable_hw+0xbc/0x3d0 [coresight_catu]
     catu_enable+0x70/0xe0 [coresight_catu]
     coresight_enable_path+0xb0/0x258 [coresight]

Patch 2 - 3:
Change the sink_enable and help_enable/disable to accept coresight_path.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- Fix error comment in coresight_path
- Collect tags
- Link to RFC: https://lore.kernel.org/r/20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com

Versions have submitted by Carl Worth:
V2 - https://lore.kernel.org/all/20250919174932.3490404-1-carl@os.amperecomputing.com/
V1 - https://lore.kernel.org/all/20250916224441.3008824-1-carl@os.amperecomputing.com/

---
Carl Worth (1):
      coresight: tmc: add the handle of the event to the path

Jie Gan (2):
      coresight: change helper_ops to accept coresight_path
      coresight: change the sink_ops to accept coresight_path

 drivers/hwtracing/coresight/coresight-catu.c      | 10 ++++----
 drivers/hwtracing/coresight/coresight-core.c      | 30 +++++++++++++----------
 drivers/hwtracing/coresight/coresight-ctcu-core.c |  9 +++----
 drivers/hwtracing/coresight/coresight-cti-core.c  |  5 ++--
 drivers/hwtracing/coresight/coresight-cti.h       |  5 ++--
 drivers/hwtracing/coresight/coresight-dummy.c     |  2 +-
 drivers/hwtracing/coresight/coresight-etb10.c     |  8 +++---
 drivers/hwtracing/coresight/coresight-etm-perf.c  |  3 ++-
 drivers/hwtracing/coresight/coresight-priv.h      |  3 +--
 drivers/hwtracing/coresight/coresight-sysfs.c     |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c   | 10 +++++---
 drivers/hwtracing/coresight/coresight-tmc-etr.c   | 15 +++++++-----
 drivers/hwtracing/coresight/coresight-tmc.h       |  3 ++-
 drivers/hwtracing/coresight/coresight-tpiu.c      |  2 +-
 drivers/hwtracing/coresight/coresight-trbe.c      |  4 +--
 drivers/hwtracing/coresight/ultrasoc-smb.c        |  9 ++++---
 include/linux/coresight.h                         | 17 +++++++------
 17 files changed, 75 insertions(+), 62 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250922-fix_helper_data-f56018fc966f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


