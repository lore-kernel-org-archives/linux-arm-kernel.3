Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8865CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWi7tLFsC3oHaAFTRIeTndu8yLUafh5CrbBfm6ky0VI=; b=vKFeSTldiiHQoF
	iJIVyfdgUiOYBFc6XJjrbwamFqREB/eEqMunDxaxAHX4JcBJii/zioGg3fUtnl3oF/cVpeSRWhJiO
	EHBwK9KDUoS7hw/rbGt3wJtKXHe+BxT4Qn+qO3ePEEwLZuWLr339bQ7isUVb1yNExGkn5NHaWGLwK
	a6ltRbGKhxIlBzKoFHoT/ofgX6wiuWcAn6v5e1OoGKHny1qYyH3nWFGrHviFOkiu4PAW3C8OzhQ5F
	ItyhaLnVWkNIpWSCaGq1TfALBs04RE9s79CFCPKCKYORt3CAH0dP8YOP4qCklFStu7VP6oYK1sApf
	8nXQN7HIXXA6MQ6GgE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b1s-00000009LBu-0FiM;
	Mon, 22 Sep 2025 07:32:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b1p-00000009L9o-3VtX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:32:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LKnmrr006378
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OWi7tLFsC3oHaAFTRIeTnd
	u8yLUafh5CrbBfm6ky0VI=; b=GAwpi30kFHiiuARFWDw1oBImLiZqpXVP8ZzmTS
	m9p2cN7VEFvmQi+jHQhhNgI5oB+9deNPAMrLRtudClo24Fff+dkjeI0nX3X+vBTZ
	MvfVkH/JwTNV6PYRyDfGF0eKjhyOC9jIE5jtzF7GeOkE9ypvQ581bq2GKHtY8fr9
	dq4ARzvoGKxXcIa1ME8GyhU9Ha25W8T9VpY2M7vrqXhVLHNL97+FAXenwE9rNWe8
	EqhWuLOEUh4MWnWRoznj1eyJU8UQq/SX0pR1eO/uwfVQmGMvhrTJkhqBzVRcmito
	9uv4dCryadcD0h9GGJ9wLTbYcwMEWNUhq8o+aWt5pjPWIAtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nekukpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-267fa90a2fbso57332115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 00:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758526324; x=1759131124;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWi7tLFsC3oHaAFTRIeTndu8yLUafh5CrbBfm6ky0VI=;
        b=PuRsRDGALxTsBjKz1jSofT+NEPJEGzXRgKzqxa5qETKeNgSe2iQrVE4Y1xFf+izLUz
         0Q4qjX2MZ7g0lF3TgIl2T2FALXsqAKIq+j/MgZ8WhELE7AMafmclD/YwGkcugwuhORUr
         39IQS1dhSX1/sVLysx37d0sbkDa5WJ0qku76viGu6xnvWFlg0wRTpkfYzul/132E1ksv
         23hTpcrFvrF/5fHvBSBGNDvoG8ZQctPejF5vwM9bcG29chrtZGPrYfLP6BthfLpRGMw2
         Q3eTKgIr/j42tLojuSQwO3ri3c5Ixr9aeFOV6saFaqsxXfpZM6xUn2T2QKnobBMfl//p
         zaFg==
X-Forwarded-Encrypted: i=1; AJvYcCVgQS1RhZZRxfInD/D0Q1TiwK9biMLzBxtrBvq2DYMqplLIB+FEBa0NQTD/IJQ+/s+zTwnnFvGtzj8SnY0l8pl/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4c4HNTlroB1BMAUOw3mEFynvw9hAld6H1dMg4yXFneQF2fBRS
	EK68QFroEYLRA5dXGRnZG7rXzuISnW2GvILWVIXaIGkNWt/3NGAdDlTIXjx64ncWAml9gXGPp7j
	NpuX3AfwRoHklEwv/AAugVnY+4wbojdcp8TabhK7SzVmvp9swRbRUJxXtyssmwvxdclW60bDAnq
	e8lOBqRUc3KZY3
X-Gm-Gg: ASbGncu0nIZlMklqTvSPOePMs80i0Z0sEPpNOuNsDp/FIshr/AEWJhQswLNSAj+WYPP
	08P9qgekSFIK+4xcKTLJTMyddlKOr8w58Hb7cZGYKPgjR1p8FwNokJt0SvREsIqgDfRQYKZGfan
	EFApZi89uCwCT2Xmkarz8CdrAX4A/LYsgX9UNPsO8qBKytMy3xeNtXHXH2UFD6gmiafHSAODVh2
	QknmyqDOqPPX9mpYusdhWIlz1u2HabPpQOnd6Ojd5+mfA9s42skCnsPpQplRqa2cC7jlttULS77
	JN/LX6SDzyQuUwTz87kCbsfiAnNId2+64Xncw9oX+7aStQgg1SBylJDUsUWMA4yg5EuaE0hK7tP
	Hk+9kc0ALmeU05bOxM37RLc6b1iU=
X-Received: by 2002:a17:902:f68e:b0:262:f975:fcba with SMTP id d9443c01a7336-269b7952ec0mr154758025ad.9.1758526323535;
        Mon, 22 Sep 2025 00:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMjZkCKxOtZY/ljG3yp4aaA9ZSaDbW1wn7Y3F081kioXdQoygdRhRGBnvJWT+ILCt2MI6gTw==
X-Received: by 2002:a17:902:f68e:b0:262:f975:fcba with SMTP id d9443c01a7336-269b7952ec0mr154757605ad.9.1758526322703;
        Mon, 22 Sep 2025 00:32:02 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800529cdsm123806865ad.22.2025.09.22.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:32:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] coresight: replace the void pointer with
 coresight_path pointer
Date: Mon, 22 Sep 2025 15:31:38 +0800
Message-Id: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFv70GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMj3bTMiviM1JyC1KL4lMSSRN00UzMDQ4u0ZEszszQloK6ColSgErC
 J0UpBbs5KsbW1ACGAKQxmAAAA
To: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758526318; l=2227;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YrT9/6cOaNebvdLrOWVAkYW+o5XEoVq2kg/YXaHHI/U=;
 b=zLvwT4JNV1lIAn120SkbsdBOV6Lx7oJRcAmeJQk1x0htNRlJon6mYHSDodNKMnLhhde7pD1qV
 ce4pfeJTocHD1EHELMcRKuUrAf76kdB+Dmk+4ryq/tazgAn8PSVqCw9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: A_CdiTrrOcdV6wYWpxeuIuns92pptelY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX6ORKnTXuu2Dj
 lHXpzq0IlioCWp0/mrqDHlFF7I6m4j0aL9UTwPEg2w4aY5l3M+O9ZFeTmg8uce6sJ7dzPMFaxZi
 S+RcmMrNU14B6WDdaXghmvFEzcBNzSp3efQSwe7UaI4I0SpYJyJF/ttDNKpfQaJzxFJ6O2qFa7U
 +MeHAT4mfPQDX9TFADwprUSvWXx5Chtz/JQ5S8ax3/q6OEkTAGacI7/G3/CPgOqgxEesPsIeJdG
 e5YJyp5cjgEDbc9oO6lZBcXLiwEpq7ejUDDX5YzzgODZCD0XYlqLhHt9l/r/5Kl2UFcorCJDD5M
 l6G7mnwMEp94xmNMdFechB5gYZjRf5QLp38G+Wtf9XTMFVTBsJHpy09Gbhvi5mrherFpEhdiZNy
 4tht6tpj
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68d0fb74 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=i-0O458ng5iwxdbG68kA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: A_CdiTrrOcdV6wYWpxeuIuns92pptelY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_003205_893273_E2DE7E76 
X-CRM114-Status: GOOD (  17.10  )
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

Hi Carl Worth,

I just created a patch series as an example to fix the reported issues.
Please feel free to check it and let me know if you have any queries.

I think it's better to explain my ideas with codes, so I directly created the
patch series for sharing my solution. Please let me know if it's offend you.

Thanks,

Patch 1:
Fix the issue that the catu cannot correctly read the handle of the AUX
event which is caused by the commit[1].

[1] 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")

Patch 2 - 3:
Change the sink_enable and help_enable/disable to accept coresight_path.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
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


