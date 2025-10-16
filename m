Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9495FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 18:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFHiPMUq4Md01wD5fLIaoTnzLwYa7cZa7iBHCmHZPxk=; b=fv86USKb7j5uuMcHKNzcwjALEq
	agJCz+t57G2ueEiyw6T2PJSww7IBLM1RaHXGLWVymCqxfdjwfMhuf2XIj6C9ECuXjR0UGzTlBhyCf
	s8fv4OLz+9tYelig2zMC8ua4ATo850WZOvy4mFv+TdFIQ3X9FWugY/JdLKZpd0v0A7iMjw5JLwh9F
	iKXlUnXcS/NMOZu9a6UaFQOEAWUAtF2qgTnvecoNNrqi7egA/yUwABF2j53CuPtx9NmeHR4DjEnNW
	Dp347FgrFWUflDnetUqwL/tl7dHhzp8JpwokHH1/0NbFFBJf2BakHnJxpUdLYV48zSGC582XnKe1o
	4MQa1VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T6S-00000005jek-2WjJ;
	Thu, 16 Oct 2025 18:53:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T6Q-00000005jeD-08GD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 18:53:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GEeHHQ024790
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 18:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eFHiPMUq4Md01wD5fLIaoT
	nzLwYa7cZa7iBHCmHZPxk=; b=WQG5y/dbHZrZhhomPGevKA6ey8HuAOK7ka3L8k
	AK5TnbBydvUMEhxn3JU4wGIUdqPAanNsRqEqgD+jBa+pNjB8gTB1GGKNS2LJqStm
	cEq64VFtRvmrTAnSC+BwYLytfnjLFWdpY2+SCU+1owd2bF3ct4XKtd4Yy/3IAQdj
	/rSsy3aXga3WiXxfpFnCemRleMG461ZX4GZHySLS/kdXEvMyP53GUBcMSY1a1sBg
	HKLvwYB53/nTHHPVCNUSSEbjELIeRVWWVG5BTQaLVmZj1z+Fl/jh/DT4UT15vjUJ
	Zw76xBrJsNq9zoz25XFOu89sxJNOUBQqnbcxhLpSCxQ7TkRQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff11cfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 18:53:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f610f7325so1020857b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 11:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760640807; x=1761245607;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFHiPMUq4Md01wD5fLIaoTnzLwYa7cZa7iBHCmHZPxk=;
        b=uxGs/Nfh/u6pNaxE4YhrMri8xGW01Gelm0rmrwHmEkdoragChNk4o7oBfUjU7R6/zw
         HG+loVDa7lPM9Pq7i2TzfW5yEMn2THsPM1yCpAczHzVuVrWA4cO6jV56SdQhkuL/Cgmm
         tyd2zk5z3mFX7oqPVSA9E4SHpUIyLL1w1dXHWxdVZ8+fjDIp4sGeffItU6SJm+txZZYV
         AhzzYAFRlm04CquSQrB5uf2PPZQz+CMAcHwNnL4IHfRMoA9Mov4VXJZ07mxGwR9neCJJ
         oaaHD900/gFECcv0BjzlHvB9rB0eEouwvVaj6iHi9Zny5n4bWpC5KYJEUrY7b0W6XmhP
         Vysw==
X-Gm-Message-State: AOJu0YxXD/HbCwNwgo/VOusYZVDY+dYF5FqhnZVs2dRdlrcB5UXFmx6S
	W18O1mgvnUmfT+9xnFegsHdYg/HQM7/2ZHd7BKVVLvExOXtLrMNbP6r8MWThb1JCuGp3dh907ub
	BQH23634vtVwS3bAtnWuafbQU7vaXdxvRl6LDFNLnREAyA4uf8sK1ws9srnXUa8fHz0xrrS06w4
	qrwvKbPfoiMw==
X-Gm-Gg: ASbGncuQfrNQUXv6KL0UEABw/rs45zuy2p/Lh7vRIC6JTkdea82kS6vTd978lBcDaZx
	/tQ8lsYpQ6hMqyiQlzvhkB47GQnW+IqYGBxRcJ8z1cqD72bXjA+b+sQMhgN7gCXPmL1RGBbg24V
	tht67IuAg5c77I7kWfZ72+jJPhfBw9wFmG90zGqDTNbA+3knjvaGf8+F+D3RUjLxUCJGLSqL0AA
	2DfOkUSF51k9GD3mlu2PSgR8+Tgd2duAfSC57qhpg6+xvOPyb10SWp4SSKyxn8HrBI4MB7hHsP1
	ElKoq0DatSprEaPai4QS4ipHKDZZ7a76bgoAyJKLIXKRDL+ywBeYcNJxhNiIyllokMIGd4JvP0w
	LSeC3b6A844lfyIq+ZImb1TA=
X-Received: by 2002:a05:6a00:13a0:b0:792:574d:b20 with SMTP id d2e1a72fcca58-7a220aff329mr1132978b3a.25.1760640807530;
        Thu, 16 Oct 2025 11:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI9YEwO2q4DvEuCB2iTjQevF/8YkUPQABypLhGfV7GQxCNyKDaED8fqQ3J6JkK10r2HG3qzg==
X-Received: by 2002:a05:6a00:13a0:b0:792:574d:b20 with SMTP id d2e1a72fcca58-7a220aff329mr1132947b3a.25.1760640807047;
        Thu, 16 Oct 2025 11:53:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm22897713b3a.59.2025.10.16.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 11:53:26 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 00:23:15 +0530
Subject: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to y
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABo/8WgC/x3NQQrDIBBA0auEWVfQgDX0KqWIGUc7i2hw0hIIu
 Xsky7f5/wChxiTwGg5o9GfhWjrMYwD8hpJJceyGUY/WaPNUvzWGjXykhLUkzn5DaYhelslZrSy
 Si8a62YUAPbI2Srzfg/fnPC86eVtXcAAAAA==
X-Change-ID: 20251016-update_defconfig_tcsrcc_sm8750-5ce7d157b7aa
To: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwRm0mHKT5LQW
 YmD5WTazet68Vx+VV0K5C4MDXVeBKpHE/0wLVkAxzUSRc7Oj+u95M0TNgzNXpAJjp33Ajo5TljK
 eesJjdT3+9+0L9T7P+IT2jYNae3PExADqeTY0a00AQ6EJFR1echtm1f3KOxaLxTePFtPt1wrf3X
 T/eNJzw0qmQDKJesTHNIYKlyOIpGpjWqyUr/9FOKoEzrddiIwQP8ZSvXnSYhMIq0re2axgQlEpJ
 hbXKXlOC7/mWN8Yoa8nFB3yd1Nib7K+mUUC+IIV4AOGO1YLhgy8P2ApNp9DQAX6s2ShQZQz74bl
 +vy0/wyKsEwB2nIci/Qcqw9CQbEuIueIl/fsFCV+w==
X-Proofpoint-GUID: fw8LwyBk7c6AFj1bJqkp5uUG3JjU7P9s
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f13f28 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fjpNi09VKJx1qQd3FNAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: fw8LwyBk7c6AFj1bJqkp5uUG3JjU7P9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_115330_076661_42C38524 
X-CRM114-Status: GOOD (  13.97  )
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

The TCSR clock controller is required  during boot to provide the ref
clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
the UFS driver successfully probe and initialize the device.

Without this change, the UFS subsystem fails to mount as a usable file
system during boot.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..85e3afc07598a99cfdf804ce1f320ed76717fcc3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1449,7 +1449,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
-CONFIG_SM_TCSRCC_8750=m
+CONFIG_SM_TCSRCC_8750=y
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251016-update_defconfig_tcsrcc_sm8750-5ce7d157b7aa

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


