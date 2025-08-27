Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C40CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 04:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T04OEWuWzVBwomdwOoyEw5q5260zvNB09JpMDzKCKSM=; b=LV8OSa91+YCSrLbX2OlsH1s8I9
	cKVpZEF9FEjU0VbfnHEm3Eqnhpyi4ahnsVPIqcgC73zXgJb4d001hDSoER17ZdjI3F4ED+zrSJSQH
	ysky/ijNeK6bb2HggQODhLYH6hUwtSdGWE9CCZL0SHsMINMVoDNrz6I6NqztAeA5fBysXjdAOjF+M
	nwtNAbD3t+UXc7uJKyMF3hrf2H0SjTL5apB92dIeBcIoeLVwK1kqbsXz+2G82A/Vdb4ZuVarW0ygv
	atuX0jso3+mA14YYrx0S1u/fVHjaDLYwuKwPxxe+oVaNEmQLxIMzfRkwe26Nh0qzR07tPHgNZQ1xf
	11pR6bRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7hB-0000000Dxa8-3AE2;
	Wed, 27 Aug 2025 04:23:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7eU-0000000DxEm-1JaX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:20:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKDMix016949
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T04OEWuWzVBwomdwOoyEw5q5260zvNB09Jp
	MDzKCKSM=; b=XfcQomCk0c62Pro2ehA+rjbmXTTnnLX22TytPVn4LIDxDi4uOWR
	ep/3xdPCNNPFLz6DrYHBDPuP7tjpSIobUwddpVSmZpYD+zZnO2EptNXnoVCYgThj
	xo3sKAUoq8fqBCxOHCtlPmSbWkkUVjOg45wi/z8QmEZ9XaZEXGeFMFAXdkW9OQQB
	aQg5BIi/c+b8hMC9lTMErncFB9muD00+5UcgtOM64PdiB9Fb8qvMnP7LYCA90ymj
	TtkIzWsLT3qj2zq+VyCHqckMAf2NLgPCEEUBJxWzjQxC8xU1bRdu7N4N8RhyiFGb
	BhpPD62QwBgobdADzBr5EiLSj+/QGKC6NjQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpujmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24636484391so54329695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 21:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268448; x=1756873248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T04OEWuWzVBwomdwOoyEw5q5260zvNB09JpMDzKCKSM=;
        b=Tnyw+cF3ZYNLSpXLzROZ1cpwDtcOFy7YCRroeUmHp2wM0LK7Uyh0qzewRi7ozX1xwY
         WNzVjYvStT1fMlrSn1woIV7ePs2EFjqmRZu9W/BFET9bGlGcyWkW+lU+oPUq/TenBMa4
         wcEuXGp91qg4mo7jKawQIiOI0v/uiP4NJoRDfk+OO/4u7wuvS6Z7k+Lj+vd9vRxmgJiD
         16cCLRt/UMhh9ldyJhYc60WCFXtbZklqbf90Bdhyll6MG8fbpoQSgsD8fzQ9hy1EE7ZO
         h/3iLV2TuQKfl+rQZSqiEBvFhtSToXa2JnDNVajJJ5/gTB08GD2RTfVR6YuPAElXm43r
         IJqA==
X-Forwarded-Encrypted: i=1; AJvYcCXCxvVvUlyYGuLWW8+q1Tg/SDV8rUPDKwyIqSXMq+spACh0p/IMEqQ5Ig3HIPUOg6X/e+pjChPKjPJ9srnk1KIp@lists.infradead.org
X-Gm-Message-State: AOJu0YwYbCRqc3uEwnQJ/VrN5Yii6zoZbXLr3CGZgFJ37MNSr6++9/m1
	5W0XOP+3eiBXkQ28AmvP3zy7WB8Sbk92wC4aBIbwcAIHkgbURmnj4cccsGOIaYb5Hu2fWwAiR+8
	UuzhgY6qYyOgcWZMkN0bN4VVcZbxJbaMl4J6uzjM0raDirx7PltRtjcxzE3b63wmmCw2CjArWIQ
	XocvYSY6+cbA==
X-Gm-Gg: ASbGncsy+lYIAHnp586rAEixQVD+9Pj13mSLKb4COEi6bflVT5+KNvFsQVClolUp397
	9OlimJiKB0J/LRmB+69uUZnFFmO6JKbqwbfIveteKmWU1qOsbJtiWEnXVJMjTJ2Le+HEF1veAIx
	qOIiJC0eNw5mBNiOeTJCcl+rATLR/ndjRkZhkrSjQ+TsY5BUxtQLSiILcA8qUVVjHZUoBBbI4yu
	NQi1XVDZK+WjmbrNctaPMRdnnmp6cWJEWyejrn4S8e0I1WzVOANn3IMsMW1M7bDaoRQTdHnDtRG
	//vRun3tGJo2neqRi7yxWYig2+RHFr0m9sDO2WgJi3svEHoL2ptns8dyaKMzLQPiyOHYMsc3o/Q
	SFtlHAD+1EMhV+FKsLmcv
X-Received: by 2002:a17:902:ec88:b0:242:9bbc:3644 with SMTP id d9443c01a7336-2462efacca1mr280998325ad.54.1756268447944;
        Tue, 26 Aug 2025 21:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8yeApLKgwQ0EGKa3A8XN1Dc/sQ57Z9I8ff+HMTjh+PnlsLYqkDSMbe5YRBoxsIlMbA/qSA==
X-Received: by 2002:a17:902:ec88:b0:242:9bbc:3644 with SMTP id d9443c01a7336-2462efacca1mr280998035ad.54.1756268447437;
        Tue, 26 Aug 2025 21:20:47 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f4072ac4sm4323076b3a.34.2025.08.26.21.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:20:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/3] add sysfs nodes to configure TPDA's registers
Date: Wed, 27 Aug 2025 12:20:39 +0800
Message-Id: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ae87a1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=obe5h0f5hI_ELFHOeysA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: hkaH8Jd3fBoTkOPFZ-ggrR87NMX2BrBu
X-Proofpoint-ORIG-GUID: hkaH8Jd3fBoTkOPFZ-ggrR87NMX2BrBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+V1ZneCP4tmR
 RibcRaGZsyROEnsQDZexWbqx3YA5HnwneV7UHdQZQ/g+rQBnw1VP2P25bI43w6C5wucXqOQZhbV
 z8TwomfidSlesRlmEB6M2W/AaiDBI8+ulGg1yvAP7hpghbNJLArihnRQvc5Oe/4eSWkAuuVuKjv
 0L9s/Fr/NZrMTDDDRLOmRM+YCe6x6rxfUGvOtHWLCZjEEcVvt4dinvm9B7HJtm6ZPbhTKZTjFvK
 qwip5tsDjdszZJhdfYhbOZsrKlB0N6OAN/T6GwbrV+JGYf8k0Z3MRl0iGAsxYQ6zSWn14vtCKrI
 WFiKuRrFiInM2uXUpL+MxCr9YTKELoEt5IW0fLSuika6J9oZrZCXE3queJr9P4cf20LVDRyUW4I
 j7XnRykO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_212050_359336_1EE93E0E 
X-CRM114-Status: GOOD (  13.86  )
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

Patchset 1 introduces configuration of the cross-trigger registers with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Tao Zhang (3):
  coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
  coresight: tpda: add logic to configure TPDA_SYNCR register
  coresight: tpda: add sysfs node to flush specific port

 .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 276 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  35 ++-
 3 files changed, 360 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

-- 
2.34.1


