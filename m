Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A36AC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=; b=lKrb0POGlu1QMJOO0O2rVEq0XY
	L98NVJ6MywoM7vCAWIqbMnShN+GGlAkyZH9CaRTnXtyrOq5Jwc+SrBkHS4n+ocIfPB1nL6gHuhyUG
	049U2nHVnDrd6oaarlB5lV6Z2u9QtdXd3+Z8c+5kMcp4+ni+x674F+ylbNQsayT8W8sOOkdx+F5Kt
	A7j1ASu7C8cdaY0olC2xIqiQl1A8JYoHewVNwKeTBDhnZRFLxSNETNqDqHEHuPBDvAcsHQtLbELN+
	teJBL6g95rvnHPGhusIWaYvUnXIvBtOIYELMyoTigwgVA9z/g5Ja9gX2oumSkc01euN7rXGuIpcYO
	o253VYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L25-0000000CidV-3zqc;
	Thu, 17 Sep 2026 22:56:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L1t-0000000CiZ6-47Cd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:56:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLGEnG3431986
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=; b=jZMepdNnQHPlWfp7
	/eD7VWcoFsNazO/PCdEXpvvI+fDrLQsGWRl8KShHMrFPSaQmQixaCEL26H2lzE5d
	66oOXyzAfD+j3tFBwbhzycez3avWc3wZftAQKhJNLc99fwzjK3nENz1QV4dpI397
	OmrYnN7AOJreJWtbP/aCvFlYgnuVf2w5M3TjAZbExgB7NR+cBXyP8ya5HQLEOI3x
	HO5nrnaCNe1SX3PhsVKaUkZc60DUcSCA4+k7Qa8o8owQVDqoxNMqMUBqTKUkvFjQ
	E3ryxk2NJnsjJu6X00vnpKHZ2kobakOk6OKQbqHisbjeGKchj3y/vCHGxYy4eqxh
	44awaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6j9bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso283871a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685792; x=1790290592; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=DYdY91f+kl56uCb12EJYjahGVvwT3vT0bavFvaobuitmS5AToMw0GFbV17cS9aMIkp
         xRSCN/h6MfUMWLsB5iOfcepZrvmySx4jw5Lg2zWzV/QskSsIyb0a9q5Kzo+InN+r73a1
         qOs5BZNbn4XvyPq4bgrsskhoynAxO1v2Vvl1LMDgKcNaSQ0dbpeJFG+5s1sNeqlUP5vw
         i4G/lcY1Z5rh6/0RdriPfC/02gehhktbSB8o7xX4X3qNQGsId6yHjncWJX0aevK9B3M+
         NM1LlII6i7kfKJeUabs/j1j6XDqukYxfdLcs8Olv5NSngT7vFySiWkYvhz5Yv0P06Rco
         mxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685792; x=1790290592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxlxRRDVK1vBrWCas79ZIfg+L1LP4XTtHA+rHF5ADps=;
        b=TukS1rfNUwDKExgo5viQab3H1wWAGJ0DBE6p+7gWBnfvM6rHNPVtT3MTii5Pl1/K7/
         dVy+07gpBCIaguU61s8h0uVo3uFYa4KhO6qAKT57gHpYYJxC3LZDpF1effMBSYxnklbb
         yV0/e74jvP+4Ph4k5a1wS1aH0CWNoFDlj+CDn0H9bajLK/ooNVFaykLy0Idt6vcCaBkt
         eaOkau2dOBoGrwLHOV5ynFig3KF7Mw2XeLeSb1E+wsgeembhIxnOvXzWJPIXCNTzZWgt
         /I6J2AE2Y1LA8zThGsdfBsWUP5TgSxglxEPN+nOtOmnyKiSqmPSr+2b+GJaJ06ryy0ur
         ywEw==
X-Forwarded-Encrypted: i=1; AKwUvByF5OGjAkRlv9tzrcZ8bxXi2mBCZPOxN7o9r/hSpQLbrXa+d9bxSnKVj0kC1icLgjdXYcfqkgA32/tJV+vc4DJU@lists.infradead.org
X-Gm-Message-State: AFuF++lXD15nBfFK0Bue+p0jGEd7geYHNO4k3nb/yKDXIfvzcAXQ4BeD
	Z/RPjUK2a2Mugi8QM4ELjzeNVCQwXismIbQK0Wd2iDUCYDze0mhZhoCl9VhS/0GkLLg8PWEdSAs
	7DuKSfLx0FpKSyXKexFMSkUutsD/I1j45DcBWNBExn6bTTWXxTj/UofCjVdvqdbX2aPe0px+PnD
	HTpA==
X-Gm-Gg: AYBFou2s+soEWky3GXL/iJ3rh73HteT3DOjMkMeS18YDtoRh2C1HJuM0MyzOmItTAwD
	FUXtbOzgSEVNBUNbYnaNQhB6pLLKcESfv4HB2veOE9C7wUOrop+ghqmug28O+eGV1qDckIrnZ3I
	mg4Q5xqRlFqb2M6EC2uXbyDgc5O9/KrdUVXVXL3uYQsOL3d4T6KUkK1uy9ZGSs5Btqe9ReKBJ3x
	up0Sj6jUgugTZWYXFjonM11s7tBYsd8rzSSM4itVLW8LDkFJw/oij0Uegef4zyjtPcYA+pzKI0g
	m1Uq8Cc4XX2WLkm60tPfz4CHtxQbeaVV5cVyf3D8Xe+auU3xyIrjIyhfh0WWbGIFe41X8vpK9Oj
	5Y9dDRLGN0pJcIu9GgjIylUaXw1qw+ytCNK1iZoBgZTpxVy+mEw==
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267903a91.15.1789685791792;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e54c19b62mr1267874a91.15.1789685791376;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:57 -0700
Subject: [PATCH v2 3/3] pinctrl: kconfig: Select generic pinctrl helpers
 for scmi pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=746;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=nSbXNq1OJYe51dl5okOjHM4uLmUxr4IZI624Hov2mXg=;
 b=qt7oMd5cieO9tBGCHfxsL5Y3SMPcyQewnlHKqaYhCp59AL7QHCz4Kd5e0fL1RsGXRpuU6UHP0
 ksK1xR5Hw9qAFoqa9WBQpYsb+g3biaoLgAEB7r62smDxGFoG6dVpub4
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX0ocugXhHxM7b
 vBT6t71a20l/8hEnfuCrDe9m20qENtfFNeCQycSOIb3XErB5vJJX2l1STvzgtBiD5n2wTv1rAyw
 6LC526LWsZoKOOK68JhgMmP7PFCMf5/E7H61DrZrxbXzabGejwNKf6EMbhvK7y4JJ8VBxZHZtsu
 706bJnCaHst1t9UbPpmUbyhWqirUx+Gt9i9u3U0vhbgHSTr4SLq69r0FU4qNQyy5teR7irfd9Im
 JZfyB5JZrsmPcu0Xk4hu8i8xJEwjxG50L1rH04QO68rQRNyE+HQQIpk1tkar6uBNxN+WzoV9zj8
 kwh0SzxpEOuAK0e+1Weore4krmKy//PmXXOXOUasKRujgcQ2YYSDzoQ73SKnnujje/2Fg1rw+A4
 bstkF9eJjtJPUFVYGEg5r5k2Ngx/fCQuhQ7PooUoN4nSPEGlbqouzJHu8RTAHcvOhJfNVaKUPxL
 tvOEo1fei1QuwI8hxgw==
X-Proofpoint-GUID: NmAWzopJfq17iyqAF5gWRBhRXttZVrcF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX4AgLkq3EK4nc
 Q8q8Ltqg4Wg3M22e6oEMJ9W48LHdOmX/HYBQd7kYed7Bf3ktqk0LZfoLFO+35tRNgR3MnZg2KhK
 UbmEsRvwL5unODyDuwBnSLulNJLv+Y4=
X-Proofpoint-ORIG-GUID: NmAWzopJfq17iyqAF5gWRBhRXttZVrcF
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac7020 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eVtWBnz9pTluID88zzUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_155634_151036_99FAF429 
X-CRM114-Status: GOOD (  12.95  )
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

Select the corresponding pinctrl and pinmux generic Kconfig symbols
when PINCTRL_SCMI is enabled.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2cdd7b2c49b..c93f0bfcd7e9 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -532,6 +532,8 @@ config PINCTRL_SCMI
 	tristate "Pinctrl driver using SCMI protocol interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
 	select PINMUX
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	help
 	  This driver provides support for pinctrl which is controlled

-- 
2.43.0


