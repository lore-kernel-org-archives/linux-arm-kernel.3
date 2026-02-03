Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D243E8305F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xj75HyVx2rW+IuheiWaB557dHSsiJDBomjHiklCYwbY=; b=qln7PwsWNG4ukI
	t/vYK/sEF3eXe+ZRpRGWE6/j912qgGodR3wKHXrqu9mh590t01A6rq0l+BveXX5ly/VQUnUxD2+E7
	RC7609YzJBccdPNYr+L0BrHpEUzVmGvAoKC5XuvPVZxNUJ/NiDuS9FIJE5yAJv8ljWeCLXkPyWk+O
	JdDmgLuVsbHPnk0S2Dvhx5XgJQZUYucZIRnp/T7pRA87bqV7J+QkPl8sKPPVm/e3bQTiu4tHXK6L1
	2QnbQujI2uFitktnr2m+sIEt1XSOpXZUp2JDsvAM0MGlpbAXkOl/fZvUZuBGtLUMT4fUYzpehiV7n
	mSsWhYRm8YOFGRs3L/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBSr-00000006HbQ-2gMS;
	Tue, 03 Feb 2026 08:08:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBSo-00000006Hay-0JoM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:08:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61362uPW2848622
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 08:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xj75HyVx2rW+IuheiWaB55
	7dHSsiJDBomjHiklCYwbY=; b=kSJa+yC5QRc7cYKfF+4cXNWsjbt4QlS9BhFbtm
	9+5ZsdB1J9MR7PIGbUDyqnp23kIOPtjTedpGZxqy3i2L8iTU1kTFL5QfEn0Dg4sF
	U9W0rE2uyTK+3h0fSJcGGZpB5uHLtOzFVq1N9d1kccJp/MTSecBw8CTHMR9D8enR
	JcB0Se5zYDLhCbUbi8/kDxgNuFXzA3Gucjie85RAC9vUF4gcwvncfgHeJGSFmAKA
	aPYOArF66pJESl48A+mCNnqzHeViUYlCpAjgAW65vhW10qBy2ymU76iRWTvwXM5H
	qy9XW/G64vFMi6Hw8l+UvrMVWmJW4R5L/eI27/WVH0uPlRdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtkjec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:08:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a92a3f5de9so1669675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106124; x=1770710924; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xj75HyVx2rW+IuheiWaB557dHSsiJDBomjHiklCYwbY=;
        b=G76c6m5ixtz289WI+pRxBNelyqS8uHtg1wTsvqj1jom0FYnKv4Xo6brf2ZJjMuF3b9
         HXMzBZhRauRxZoBItiTLNftzCn1gGU/CuSn+8TkWmyo0S44Xl8lRhgkwwmcRh1kiPZu1
         DuryWtrL15qlJVIERHTUmzWDiqlqiNdN1rbybqptNJ372Su1tFwDbQlnLzXVi0XNkSID
         cCOBl2q2QmLAgXwxm8jmljAJTmMXfoyUAYp+YTvYAbfOgEBQhzntSkZcZclodkL/krJz
         cIRk+KxkcQZKQeyaXXFxNDc6AdRW1KJkR4319Gsesn2mI3e7Xmx7JVuQt6D3TW0S60AT
         ls3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106124; x=1770710924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj75HyVx2rW+IuheiWaB557dHSsiJDBomjHiklCYwbY=;
        b=mEc3agyBAprgwiMEed3IO3BWEGaEnGE5/hElRBNlxyjFlqKb9ClxvjKQfrbID/3UrI
         qb19pleyFdL2bZdrZoxc3WDEukBJd11zt+pzkUBStwYfOCdtTiDagl61z3TN/cMBYFON
         ggU0V35jh1aH9Biee4Ho3936WLCUyAKjONTwCkgJGqLfANCqiqhVLBBQnICT2LpmHko6
         V8ybfg4ksVPPCBNjlwyW/084HP74TEMqocPqJfkaDjMeDacYklfaQHtk1cv4CsQ+3ZQk
         n9rzvOWkVEM5Wyv4eUCFtTGoZmFbJTexZIXggmpvC3P8DFunI7IiBryXcMOSdiLR1VqL
         9uhA==
X-Forwarded-Encrypted: i=1; AJvYcCWN1OPLb+KvbBnK0i9iAcqGQRqAL2pTtGsEiGGa9YuVsbL8LTOEQhzmE7wQs89X4396+M0el7hNTf//rquR98zY@lists.infradead.org
X-Gm-Message-State: AOJu0YwOTSx+uNNqvkvi2zYp5QnHJrmooXcvDiadJgEwnMR2PabDJuS7
	c+Rd8XJVUe+vnJACfhHwXSZ+OisuZNUcXIVPoRTBeS8fAHbOWxlVgVogKftGMHvy+qbci1Ci7Tp
	/xiut7ddYHNOD8zbAjQ9Ng9eCPJjMvyDrZIHyhdFGFucshZykTVfwb7p2W34qgdR0Ki0vT5qTgv
	KpDw==
X-Gm-Gg: AZuq6aKLSCCX/UioZUI6kUzuf07k99qG8mw4hBR/y/EVx3bYcYEjf7ZwVG6FpodhbpO
	7Gl7xx7EqlKDF87eZHCDujoDzjEOkDAWVP0DUG+kr7GkhVyUEEBFZiUvPsrvt5rIBdpPCNaQ3zR
	rlBNUxnOiHZiiZ9zB8toOyOjIurrzLUc79XKS9EkFF4RwxiR+zEk7E8Gtly4+H5BsWmUIRaUdWO
	CjmJRUhHDhZ4WIdHRuH10A7Kg7x21RLWByW/VcTFXAVIL6oQOaDv/FFSoRJ/E00toZV7X8AyAZP
	N4sXrxdzCDbVkyfQrXrVkJH/4pme7t69sVf+2fvdDm8q45v4MNtUj5zj0VSB9oKFSoZrf4OiZd9
	5/4kZBYE4jlZBBrjhDQ6CAqJT6tTKnUMzaHScUYQ/rD37vaJeKebeIZtmX93QfZWA1atwA7QL
X-Received: by 2002:a17:903:11c9:b0:2a0:afeb:fbbb with SMTP id d9443c01a7336-2a8d7eb5ab1mr146742225ad.1.1770106124477;
        Tue, 03 Feb 2026 00:08:44 -0800 (PST)
X-Received: by 2002:a17:903:11c9:b0:2a0:afeb:fbbb with SMTP id d9443c01a7336-2a8d7eb5ab1mr146741805ad.1.1770106123857;
        Tue, 03 Feb 2026 00:08:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8e512bc2asm103144485ad.100.2026.02.03.00.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:08:43 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
Date: Tue, 03 Feb 2026 16:08:23 +0800
Message-Id: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPmsgWkC/x3MQQqAIBBG4avErBtQg6iuEi1M/2ogLLQiiO6et
 PwW7z2UEAWJuuKhiEuSbCFDlwW5xYYZLD6bjDK1MqpiBDuuYHe4k23wjCNypacWrdeqaTzlco+
 Y5P6v/fC+H5SWBj9lAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106119; l=1423;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VXVt7+WRwV9U4+KBIyvQ/YO2I0p5y3dPbOD4xY3JpCc=;
 b=Aay4DUF4/BV07tWHTYfxRXp7lipM3sImRVggUGuyEoEqNxFi/BSdipDwz7phPOnrZ+fN8iJUp
 I7vg+jtXwDoBTl6GFB16amcORXHeQgkxha7hBgpORaGNSp5wCbuzxvt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=6981ad0d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pO0fZtIvyn0UN2_VQdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: WwhOpZmp64kqS7Ta_lcg5_FEpg9rZo1I
X-Proofpoint-ORIG-GUID: WwhOpZmp64kqS7Ta_lcg5_FEpg9rZo1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfXyOKyg5EPKyUb
 BY1NmL1ONk+Tcl2KVE89ZcV43eO53WVVw2gqC6AFZyzmzh7AWVMMYO4jHrf6dWQ/IALlBNB8OK0
 2bCJZp+YHgrhpNwQrdsitoE/IZqNPGEw0uyM0WBs8hp2U4sZdfUTwo2nrcBNW8KRdJ+bpzRS1GP
 /8uYoynSe8lFEdDbfVvc3YefXUUCPiQYJeaWCYOrqvJY6n8Lko605S9zJ/pM+uIyGQDTrTh5aIf
 gyVT+dUal7sWRLG6wLZ2wBvkkx9qzbuut4ErkCPsBU89/jTaLUDKjQf6JrO0Vn4pmHhpoJ//Rcq
 561RmhjBhxIpcaVAlVB2MKpvUoAM4XW2ODuIszFth3RZ5eryVIysZyCoQJB9a+tNy2u8tbqnX39
 bFzE2/K6uiqR2Boo6EQIfKB0Ipo3A4hVznyGk0hcmQA8m6zo0IWbZRhB7wQqYlViS3IktBqxtyi
 z2hVhbmEBXqKmHFR9ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_000846_121767_CB8142E6 
X-CRM114-Status: GOOD (  12.98  )
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

The DT‑binding patch adds platform‑specific compatibles for the
CTCU device, and the following Qualcomm platforms are included:
Kaanapali
Pakala(sm8750)
Hamoa
Glymur

Since the base Coresight DT patches for the Kaanapali and Glymur
platforms have not yet been applied, I created DT patches only
for the Pakala and Hamoa platforms. I will submit the Kaanapali
and Glymur patches once their corresponding base Coresight DT patches
are merged.

The Hamoa‑related patches were posted in a separate email, and I
have included them in the current patch series.

Link to the previous Hamoa patch series:
https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (3):
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: pakala: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++++++++++++
 3 files changed, 340 insertions(+), 1 deletion(-)
---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


