Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3376FCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fAKiKuo+7Xo4tAEEl10qvc4jZotTrJ4XmaotDb6MuMw=; b=ZcXiZ6045DIiao
	V8Jcx58Jb5eGrxLgVOkuJQ2Q0wQd16LrkM70aRbttuIEPk+YKaAjCVoK3O7+/8/SsdChdMumImFue
	5y8bkhHOF2oCl5QUguS+O4fYcN/pXx/kxKYS8Tb9ovC1/xSmC/2wKGmqMOcKQnoha16/2I/OFtd2w
	LZQtCwIX8N3dpo3mLVvU75YV38v4QWk/mP+YevIRsO+jVtSqVJy/6IHxrI0fZLyrn4QcCaF1i6iLl
	oqOoNBVsni1tpNKMvU/w8K1do2+4QoRFzoFLbblE/179zztnSn+uXZ5VCRc9zEN1R6W1b+hBFuYiZ
	GoVM5mocnODxccCX3j4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYE3-0000000GCI5-241W;
	Tue, 16 Jun 2026 18:09:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYE0-0000000GCH3-4BqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 18:09:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH8x311210400
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 18:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fAKiKuo+7Xo4tAEEl10qvc
	4jZotTrJ4XmaotDb6MuMw=; b=eSQ6G6EI4RGw4WM19eGumGrwdRiSdRQKs0RRQ6
	BjHW/PyvK1eOHeqj5LrfBfP5+MVLwJjTKKWRJb6YHF0yxrMjzb8hkS5p7E8cUIMw
	J1yZtyrPHbwrDLm0WD8lySaH5mKP3Kl42mrcBxt7xplwJzgncVCWGRKSkAy+MRso
	xLrwhPzZCDqgXB4ugiANvDlWfsjAGEIv/aEWHxL6sh3rtW+Ei/fDNuGvwC4qYxD5
	YN1Jsvzlj/fJFYRBMvvQm9Y1OgFlEs8bgcITsCPQ1ybIG8nkoKmlDHaSjj7HiakQ
	/qDT3RFCE0p12DkzHtEcmBtitpsob+s77AOaOisT48ckAunQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsard2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 18:09:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13967c19ac6so10733810c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633362; x=1782238162; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAKiKuo+7Xo4tAEEl10qvc4jZotTrJ4XmaotDb6MuMw=;
        b=XnLWXu1Pdws3j2TC8m5iTJIhN4MARE2YXkZAmIU5yWiZ8OA7tWEyhqQVmw8PNDeeDK
         5j7TKrxs0XGVQ4evm42Ouw+7+9Eh/LeoMnjULxOY5JIwzhMRU5fSmChkHvjDFh+jquME
         9yCZI1qJh5wZnWKmZ20cOCa2h7rBdYlSCAOTugwC0MjkUXq+2JEc9puHuMX4y/rl3dfa
         u9UZnAzhphdAfKmCIH1+eyx97clGLJ8PzhKSTeXtvFE1iI4cCIzLqRRDvL9gc6XrrX4c
         AZi5oD7NyAE+e20eVwMEePlqJkbYQ9NMWWRXr5nd8KquuXFR0UmSNqD7JEUZBwZkoi/a
         G4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633362; x=1782238162;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAKiKuo+7Xo4tAEEl10qvc4jZotTrJ4XmaotDb6MuMw=;
        b=RCVFO8VTZ9nuXumpvrur0TfXYNDbhhB1UCNcErJq6bZ09q8fixIvbMiDUeaAwXluFL
         LGzzPct6uRhjjwD7SN/Rd84j1ZlzLmerT1cZ6zRegma+u6OLto3cF0Jk/jdQBs261sW/
         MwGibwjOcbhEFk5JkTGl7KmhS28J1Uw31U7pypnFRAxbM6cTwe6iEndbNi1KX/n3qpG2
         L9O2wjULMc2se5vbfMNZKlEFPQ14jsbiKfKWP45JOwMlY/sLvH+R2wKUdmhp7zmr639f
         L36hsGoz1MBPHV5ZJrrLuttQsYowd/LQkStJNUrfeKtL3jb/8UWTD3RubVVBl5QuhBF0
         jmew==
X-Forwarded-Encrypted: i=1; AFNElJ/u7Mov/wCZZdxcpvv+jiLXml1dm0X0uy16ncPvPBQm8/LIrrJZ2KBVSQPHZCvt6qRayrk4myzhVUoYNO9oZpFo@lists.infradead.org
X-Gm-Message-State: AOJu0YxyoIDnn44FGPuy/k5dSFcFKkuzWs8JsG8Hr6Hqg5rXJq6MfrqV
	AmtEeN4YCWMRKz6vCYUzRHIwlxqy96O1NDZHy2N5TGSj3Dalew9y5tuMhIoY90DW3dR6CZId2uK
	rc6hcymPfnKhbz7h+PVIGW3c8fMVq4iov8SrCRl0sWoWHA6ziB76Zgc1NfoqVmB0nnH25bpxbrC
	T08iSqfABSGw==
X-Gm-Gg: Acq92OEhgoym9g0aaRsBsNa0DiT5YD/nqGK/9gyS+fZCW3asle1/saFVmfce8d/En3B
	PD6uukn69oYQ74/T0KTApqsqs8tdTj8aTPsoYH/QzRMXerpUf7NxHChBt6FoMX6hbG5SGgBvhUB
	dqja21Owop3bkK814uk1EubUiHgoMCmHeHQjF/ZL+E5MqUOb7Suvfo55a+lyLL6S4a51BJKrX1P
	d07+toeGQv5ST/9RWQM1BJS4eBHMbumdwM9tb4G06tY7xjKwhAdaJH3jqRskgeNc6/YNp9Dac8L
	UBFPXpavcy6QmmkTQukNQbCgzkuU1QAVlQGxLvB9nmcWl3fIQs9rNT35/KENn/9pYGfjdeUbvuM
	bkeBYPK96kfcRmJTQJTtBArLJAEAdu4bAqMZTJlyPrCWYoLK9RIvpnPnC+VS46l8=
X-Received: by 2002:a05:7022:2228:b0:139:7bac:db41 with SMTP id a92af1059eb24-1398f69ed04mr25452c88.28.1781633362202;
        Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
X-Received: by 2002:a05:7022:2228:b0:139:7bac:db41 with SMTP id a92af1059eb24-1398f69ed04mr25432c88.28.1781633361714;
        Tue, 16 Jun 2026 11:09:21 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/2] firmware: arm_scmi: Ensure automatic module loading
Date: Tue, 16 Jun 2026 18:09:14 +0000
Message-Id: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqRMWoC/yXMQQ6DIBBA0auYWUsCo7LoVYwLhKGOETWMbUyMd
 y9tl2/x/wVCmUngUV2Q6c3C21pg6gr85NYnKQ7FgBqttsYq8YlV2oJb2InSscEWzRjaDqE0e6b
 I5+/XD3/La5zJH98J3PcHRd5bKnEAAAA=
X-Change-ID: 20260616-scmi-modalias-0f32421bd452
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=1190;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=gSQMryyLHdvcV09dgoClPUfxYxJLHgh4cYOBza3eWEQ=;
 b=hF93igeEPPEEj+VjMuQ/oRz7Gv5WUFbaGYz6EcAFAMGMdz2f+wcZBl7zZGwazwjqTJy2yhDFx
 MXSW0mgkrRxDx2fXqHBhray2y2xzXr9Z6MwzY44vUQpYGYsQZEcrnSQ
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: 7U3X1UFdC9UnOeGtJbTNJ1Ej16bIi3RL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX/upEof8MM9qk
 KY/52DBwbTWPoNH4K17cIPLzhGFL06cM+WlLLdpwM8IrnwD8luPJhVC7tuUkNLsjzPHlTbUNv8w
 F4e84mufYS0OERI57ROfU8l2jrSoAwvSfRS1a/Lf8jYNGt5myjv+b72pJ9nLu6UvK3uJrb/+phy
 UOmoEcKPbjX3dQ1UVSXtBrO83hxSd3KzOYWMaHb4Kvv3f+JR9IUfAi5yITpsWZ030fXnrQ9s9g/
 hu+FWayMpI43xhXFVE/94U7xx2YtFNx8Ill3qpPw9SuX1fKFkPIWJEy6OUyyLC3NNj6R11tjPpI
 cugFRsxhgNa3ndbQ6taOmpyT8scSSFO9xUE5dFuXSRszITqQ8RbBNJ0dySvdqhSwLI/e/OJ3DJH
 z28BDqwOwEzGDUltl8o4YWEeCELU5Ofqf0460ZxLYxdUYU67NPWDGRrNlLc4ygve34tH15CjCz3
 1fCnBsJYOrQ3on+EApw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX0PAwvfOdNOkp
 wEDEyV/k2S+pnQIhJHWisLrbECxwYm3Het6EderRwOX9hmPtMD8C7nXOwwlJQyCY+zGkgQATnAr
 gvjkFhRcQUiVdrBZRV6C7KVb8vpuXew=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a319152 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8yBAbjwBbfdicugfQZEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 7U3X1UFdC9UnOeGtJbTNJ1Ej16bIi3RL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_110925_061985_179E6E65 
X-CRM114-Status: GOOD (  11.33  )
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

SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
modules, but they are then not automatically loaded. Rework the SCMI
device table alias support to make modpost consume the information from
MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
this information, if known. Also add a protocol-based alias to also
trigger driver loading when only the SCMI protocol id is known.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      module: add SCMI device table alias support
      firmware: arm_scmi: request modules for discovered protocols

 drivers/firmware/arm_scmi/bus.c    | 19 +++++++++----------
 drivers/firmware/arm_scmi/driver.c |  2 ++
 include/linux/mod_devicetable.h    | 12 ++++++++++++
 include/linux/scmi_protocol.h      |  6 +-----
 scripts/mod/devicetable-offsets.c  |  4 ++++
 scripts/mod/file2alias.c           | 13 +++++++++++++
 6 files changed, 41 insertions(+), 15 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-scmi-modalias-0f32421bd452

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


