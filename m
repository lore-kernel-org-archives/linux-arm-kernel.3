Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E599ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o/PAU65y+x4pXgWv5a2hPhaymtjDm7AI43/Wgvmb97w=; b=wEzbayRzVgPlFuro0xgvWXyAtz
	2urYihXAzCeQ8BkSGqGl2P6m3IZhpHL6kTJF5sSxlfeWsx8KnnIvscZ5DTlkYpizp9D5BtZ93aSzg
	cgaqQctWZQpTfIZ8jpfcWUjeOozdhZLHVTSny5gTVMU6+YgVjsopslHEP0GQo7OjgXG+O8xWlKmG9
	Pb+ywcsektNC/LiOjXCcBTodujZBF/Dj3k6uXVST7JpDGB3bi9LGxiJk8xzV6nMCo4rAVwU89qEnK
	5OOvUCN5MEUYtBAi7+aptqZ9wK70QETM7eDlhrqOWqxDdMgLZ/uIDKV1jm5WF/EM35jWpOW3dF3AO
	vM3gnUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoj4-0000000AxSY-2nhF;
	Tue, 26 Aug 2025 08:08:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqngs-0000000Amwc-3vd5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 07:02:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5sle7008821
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o/PAU65y+x4pXgWv5a2hPhaymtjDm7AI43/
	Wgvmb97w=; b=k6MUGUlNzMScGMv7Mn+SeG16LjB2/zI5yNnpTkoQXCQrdzT8aqi
	b4emxyvi4RDp74rkg0In1cyD3L+3mpfJaJ1Fva7vj+dnFuDUS2hTukO4HG+A5d3l
	GpVHoKR4XI3Gn+TFp4FaQSdi66SmPoQ2pEocvJ1+r3QyGEaUJv4RX9GAuObcqZCB
	uPnqEW+POyXQ8TvGSQtDi/sngfGhstkZBZ/nJdF6iysPsWDgQF2UCq9k+mMgDBRr
	r2UVsrz/g6qMeJ2MsHWCJk7AA9Gm398+pUpNPDhqGU0MhZj6CIAQyuqkXcf1x3w3
	3AB23yyBDAWgeyd+E8t0Fo1CGQqFW6oWR7w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2qx46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:01:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737c5efso3959828a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 00:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191716; x=1756796516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/PAU65y+x4pXgWv5a2hPhaymtjDm7AI43/Wgvmb97w=;
        b=b85spppSp4uvwBJRofohBsWOZPZlkfll1O+qSQ7LFnrm143Rs0+9M5Knu8BSFydWUT
         UgbNu9Y3M1fOywjbnI4sqQY3rD8/r1bu2P37qFh5agedRk57ofgkjPgtVmN1b/ezg3Rz
         wHgixQkdMrxcpWgM5I17tqn+YzfQaexj6CRKwGfybIIk9SCTcsPbBoOUDG+ITpELRjc0
         AIWanyokl3JM5wOjz8Je3GkZHle/QwlejcHbT1IAgvUZIFXu3mxUsWAJqpmAK2Ox76Op
         10zsWro3AN2i+AO8ll7Sn9g3dx/MLtyQAvs8Ts4x26Tgvv1trFB0GcWTOxdWRxozAzLw
         RIKg==
X-Forwarded-Encrypted: i=1; AJvYcCU3RGE2hiesjABhnRtRE+QJT0v6TCC9GEcLC42s9Ct2bjGmZYkU+Qkn1twBDuv0xUADbwszIwL73OjymtF22bcd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9W+uK4euZXF6oj1lUVrgA5NScE6fpZz6t0kSgg+FaaGBCLLyR
	siFiz1PJm/qXQz+L4OX2dvVS6x+BOLuKxXcL/TACLhpyfr9EF2+Ch8boJgQARRpGVl12kqUSgTt
	Sdepgk06Ada9BrYzCFA8PguXU6jUp1hOb50yCsCdlxLjokfyJJqjXrrN4upCgxb2zLx8vyTv2Q7
	n4XeZbzprGbVL0
X-Gm-Gg: ASbGncsRfGN4arFUdjnppoRQbF8GHg4l5G5cCOUWvlADZUP4gQT7ERFuDne5Wm/S5BM
	GnOcs0V3mHgZgnd5bvLdgtZb2KV1+g4TVDTL7XqKBBdr/zMNOKYwkLGF+LXFGr+COeFmLG5RWJ0
	5g9cowpRYr0eSiLI4NfBz3No3oH+rMAoIRITaOA7ZBtHG2W6RQ2xVzxFbJyl4GTKqoj6nc6FGbQ
	0E/04OlU9ll0gnpmNh4XCTQommusdh6ssuL1F4rylyT7zT4FK69ZKRpryMM2dWoQkZ5Mxr0lD9b
	Dy/nawnoOKPXsnPz91nhSToZcPtGuxYB+0w7yXox2xEjWGgvznFqjQmHe9NjfyCdM+jTg6z/nY3
	LdUZze4o2aEe2BqDzYYM8
X-Received: by 2002:a05:6a20:a122:b0:23d:4777:49ca with SMTP id adf61e73a8af0-24340db08c3mr20573602637.34.1756191716239;
        Tue, 26 Aug 2025 00:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa1tnLz9RnVmTqVK1eB+6nF3z2owo3uluL6pLja7TFL9iYo1XEunkDWrl2sU66obDXiJuEmw==
X-Received: by 2002:a05:6a20:a122:b0:23d:4777:49ca with SMTP id adf61e73a8af0-24340db08c3mr20573552637.34.1756191715792;
        Tue, 26 Aug 2025 00:01:55 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:01:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/3] add sysfs nodes to configure TPDA's registers
Date: Tue, 26 Aug 2025 15:01:47 +0800
Message-Id: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ad5be5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=JXyblE0GroTofN6fZGsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3HRGnZrXv1ru
 BA8i2cDJYmmdup2OWEXL7QjXbATyEA1GY7QvN8IgbLQ/k58WjzVhYBC+sJDXLIkA2m5WSCdsD51
 MRIFltV6GYTzxzGGIjb9mpuspkt2p4diqUp2ictMNFE3g+ZnD585OdDiqkmP8UsQcaUzA0MZXHP
 dTJt5gSzTIFcIYdgZ1wHRxS3ppkNF1zzukN6JCxZMGdqC0sGjZ2zNxF6d72/THWjQYV3r4L2KYy
 CmWQ91WIFmtyW8ItTtdvocIm5UrvpUvgg+DUrFu9+aOR2IsY5xS8gsI9zcRZANCTd/wxNzPpBcd
 VfBhZ9RbjgSfx2+zUVZivVlCxQh+37DZpnlyL7zGL+WfZ+YdJ+QVEgCORUa1sis4L9BrKpBVz/N
 0TRsZ7qA
X-Proofpoint-GUID: RYY5SithbJjT61maq71gc2sf2tvESbzZ
X-Proofpoint-ORIG-GUID: RYY5SithbJjT61maq71gc2sf2tvESbzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_000158_993991_4865C2C8 
X-CRM114-Status: GOOD (  13.72  )
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

Patchset 2 introduces a function to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Tao Zhang (3):
  coresight: tpda: Add sysfs node for tpda cross-trigger configuration
  coresight: tpda: add function to configure TPDA_SYNCR register
  coresight: tpda: add sysfs node to flush specific port

 .../testing/sysfs-bus-coresight-devices-tpda  |  50 +++
 drivers/hwtracing/coresight/coresight-tpda.c  | 301 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  29 ++
 3 files changed, 380 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

-- 
2.34.1


