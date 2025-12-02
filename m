Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27A3CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jF+dv23Egm8ORgXvS1vXPefxbBKc8v5jVIo48yAirzE=; b=JaSM7mWmA9nkQZ
	MIdm30Q8zOVP645OiAt6WYvnWgTURVjxZCNcWkrcYfLEcZQagjwkv6H3+hGdt2EoWJhaTNup8aUD2
	vCcJudmbpVLKcdgbqhT+HWJm3WSvui+atG1PiV8FemHoCdACRxfJsXu/vpFlq5LFpJkTvHDL97AEm
	zJms4XXybpZX0Gp8EtRPgsNbM5eyLysF3qvklqlecfSjSdmYfg4KqAiAg6YpMQXTOYxB0ffTb16qx
	/BwgIy1P0F/ZgTsjA0Quwc+9C2KNudZT1hkJZIO7wcDhf8uYI1cDC7EJW8tBOONlnd4wJ7XngOWB8
	wRKvSIuK8a77nxHMqXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQK6c-00000004utK-3Khq;
	Tue, 02 Dec 2025 06:43:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQK6Z-00000004usF-1IbU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 06:43:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B26RanD1741507
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Dec 2025 06:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jF+dv23Egm8ORgXvS1vXPe
	fxbBKc8v5jVIo48yAirzE=; b=PFzwFoIgvqyTEi99DCD5HTXkTSlZF4GSdnLuv8
	fAhEfH97DdDDMHxV1HRIV/QdoU2/e5xOovl+D/yFTJHCvDCxVmlK8ZJGGDrLERk0
	PbXt63H+5HrXsftw/vMybeY3dHiZOGHWBR+0WwNFJ1l5iI4IEMDqgR8yjXOqtIEq
	3fJsGYqRbm9VsJzzrA4U1JrJFIfXg0LhbY71luwNEYp3G1gjyjiA4UYeyK/AGwuy
	d3v5Z7/xVpexlRrbdtZj7SRvuMlJWBgIQDPhfFj/i5y22MFWhQtkguZOfF70KQsZ
	mLKNYG5Iri0y6nFsKOw8rE73cVj+V28W28GOpqoElaJjhILQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ashtkskxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 06:43:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e66542afso137822525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 22:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657795; x=1765262595; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jF+dv23Egm8ORgXvS1vXPefxbBKc8v5jVIo48yAirzE=;
        b=Qsue0+N3+CigzZBSP0ewbnJQsK3eWRCxOgKBP5oeUFzdxBOzJxZ2APingWx385hpIz
         h0mg3M/sHt2Gf4ntXn0t1bZv+OaV6/cY7CbPjxB/wxcj+6S189o4UKsOcdt+jufPXlGP
         L+7ZizdXcU5qDuPeE7XYFJkQzzDvLLD+NuRTn9ddVb5Rf4g4uqmv/Il8fAgDByGb5/lY
         apodbQUfYVVDxX5XGG82KjSmLpTA1UVmtzFXhg1RPd5BBptUHotBqRIQLNH3sCYzC0k+
         fLgXMIZkvqH8Sr/aku9QXfpfVSdLI8EAq6KPhqUtnO1fSo4sqY5fCSihtx1dUP+ZlTXu
         gIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657795; x=1765262595;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF+dv23Egm8ORgXvS1vXPefxbBKc8v5jVIo48yAirzE=;
        b=dxrs1PN00G65hqRxTa5jUgaDpVSsH0THtdsN5ONu0WmIy863MkCoYuDkec2uy7ge0f
         9AKBSqpYryz+FSR56dHdTOzRgmyPwfq8UKnP03SYWsG0tS4hme6uGUugnSdzryF/Jtuo
         lGRCzmWUKfQx2jZxBLhwdIJhy/F/wEOl+6Z2Be4WYeE6e9BotSjcKubxSNSqxKjwwgIx
         V17Uqb4KY6qzhtK6DlRa8XIuVFcQBhR3dn3ofhNmIJ5hGoSO2rm8VvbFsFex2KixCczH
         NGsFrkoMittYr8cn32UwuDB2G6xsDXnpKekidew3kBR21pLakkl0Q4vLnBfagpgPMko/
         OSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxnEVZcikl/k7XCoEJsoRyKfcGYfmOipZAMY8FUNJVF5+utQHh8zGSfDbVn8eX1s9zwwCqlMXtd+JvaJILQfc0@lists.infradead.org
X-Gm-Message-State: AOJu0YzLJpj2UJ9CACnVxkzzcg22yVVsZCEzkHLEnhje/OfuB9C94Tqp
	rYfcxE6QWxUsapsiMvG6P+Rf+77YgCTDeGB4QeYVsCOuHv/wFH37vV9ynKxNZWeLH070fH5G1Bl
	Q76PIninu0VN5H+ST2yBDPbJxRF7wmc5NXGz/PXLB+Fqp/xX/ANGmld4QO8ADU+QJUvpo+dCpd+
	LUlQ==
X-Gm-Gg: ASbGncsxzsjWg+qF7q1hodEHlf+/6BxrsfkxCbbWRcppUulT0C4WaXktvkY2thYTFzI
	fGkFBXbW3mPPmTRMLCK/+rWHYUyNeAP1rTnZdgaTg2nDpUGl+Fp9Ia6ZwTHupA4tt2wa8VeqeaC
	JDgsubHDGtCTwMCYowSqkhMh9T6Gzd/xPDft07AjV/zo1mcpLlJWnU0qbWAWwUiH8iaayqPiEAL
	/3u06Cn7fNZsod42L3RwML7JxdfDt1sDf9KzZr68QxU6s1ObAzwavSLDKTi2I4R85zee7EfUevX
	aChWgs7tat3pg8tdNwUrAdQ4INVEXinVNHdIeuTUPnNzOYcTUmvwBqzoK61H92jyhrIuPfKaN7a
	PALcbU/M49LhBm0Cb5/wBlAbhBhlW+fxSaz/RZT/HVuyw3rjZIV4c3LiihBIb/LKEX7S9Ghe2R2
	Z5tg==
X-Received: by 2002:a17:903:360c:b0:298:450d:6926 with SMTP id d9443c01a7336-29bab148b39mr315620815ad.34.1764657795542;
        Mon, 01 Dec 2025 22:43:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvYeVsKcBWthLpi0x84eJ6/7UrtySaWZso/bO4ItERgBVQlT0J5xWM+Qr4OQyyW0znGxoyBw==
X-Received: by 2002:a17:903:360c:b0:298:450d:6926 with SMTP id d9443c01a7336-29bab148b39mr315620635ad.34.1764657795027;
        Mon, 01 Dec 2025 22:43:15 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb450cfsm141821675ad.74.2025.12.01.22.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:43:14 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add Qualcomm extended CTI support
Date: Tue, 02 Dec 2025 14:42:19 +0800
Message-Id: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEuKLmkC/3WMyw6CMBBFf4XM2hJoZXis/A9DTGkHmUSotkgwh
 H+3sndzk3OTczYI5JkCNMkGnhYO7KYIeErADHq6k2AbGWQmizyXlaB1psmSvZmZhep0VZSIsu5
 LiMrTU8/rkbu2kQcOs/Ofo77g7/0TWlBkouzUuVakUKO8uBDS11s/jBvHNA60+75/AVpRW/GvA
 AAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764657791; l=2923;
 i=yingchao.deng@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=hg393qa4WowvY1wSgSubo4QC9Dr0Pfdv2DwRyxTPtgw=;
 b=wcqDUIuOlcN48PcoSh60fElR7YS7cSyZhiM3/r0gz9KDcL13hQ9qp6k3EK9VM94mhsjTiij2b
 ijP3HAfbUxwChP0W3ah7NbP9SXH1thi/0mqe+v/3l/Dg7+daVew61RF
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=QWvd9DuX5YKvc7/VfWGCElGNr3HbCyig5bEb+lUUohg=
X-Proofpoint-GUID: NofOcqtU48_mibOb1PNWeGpwOspdQ3_X
X-Proofpoint-ORIG-GUID: NofOcqtU48_mibOb1PNWeGpwOspdQ3_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX10eljFbp+5Im
 CmVchQ89XKYY6e3ZHM3IX9h/vN6B2nXAuoM+R3g16OKHNT4Uc+Qe9hVFviQAKfu8GKzNVGBAeDx
 hFblrVDNAMu0htG20GqQQDQGY04akoAWrImFTrCVBQfQp2HLKwq9aa1nB/UwBOA9ObNouFr4hcc
 R+vJlHwjaz5/YZBJzU6aEbMubGgHqsWVBqkV8CTAsSpCE4fAs+/udjqm8j/9qhSST4jy4nxlq+w
 ADIspfBQYcM+achFEjZ5qadhlwXm5NWrIq2FfJJfzf9Re1r3pvlA9YXMbf/5R426BzNhP8U0JqE
 6pr8/ghyXgFBJ7ypkgD4S6OPJYkVA3pBnzmZGqTtzjzTwOF7J0wlUVZ8tJwOzjEfDiek8tyk23U
 +p/dXWbH4MZg2D+ZYT9T2VkC2O+wXg==
X-Authority-Analysis: v=2.4 cv=DL2CIiNb c=1 sm=1 tr=0 ts=692e8a84 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qu_5hfJKU6GsaiMghqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_224319_462851_164513D4 
X-CRM114-Status: GOOD (  14.94  )
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

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (2):
      coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
      coresight: cti: Add Qualcomm extended CTI support

 .../ABI/testing/sysfs-bus-coresight-devices-cti    |  11 ++
 drivers/hwtracing/coresight/coresight-cti-core.c   | 153 ++++++++++++++---
 .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 187 ++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-cti.h        |  60 ++++++-
 drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
 6 files changed, 369 insertions(+), 87 deletions(-)
---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251128-extended_cti-3ba8576629f7

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


