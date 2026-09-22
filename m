Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB21CC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=; b=36ltm8yUEVZFczWxUnEQLWO9Pz
	G4pH7F5xOJn+c+RBr1bOqAnK0SOyWRBeP5CigwAOa8F6b/aSBDS6x+zb92sX7cU7plB2tOwMg+4x8
	gl38PUS6e3FZwVtZaXFJDDH25QLLy0VbFOk47c7hram70KfDmhy8dN6j0Ps3ctMhQoGpOJaQFLuac
	2Ov6wUotuJmhmOSt+xw+eVyj4P6VThYnpSQRgViPjdL/QAAe/mT8oHOiklTnTTNRc6M2yMyIxEvg0
	pa+nnfxS8ug8BH1twhkLKXFZ7/ELrQpBjZxzLhBoVFt3Mn0lyqTEB48mjVZj39bzOhtvyb7iEpJ7J
	1sOBWYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x905S-00000005Oks-1StJ;
	Tue, 22 Sep 2026 12:59:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904o-00000005OCn-3gxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBP75h3670888
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=; b=KIWB2lfDb+0cFwdu
	x2xxBtU35JfmUKYkSo6olWVg0R+d+5/DTQt0irGA/hS1cvi0fyAoZeeHgnhnOPSv
	SP6S5nhJSYU7LK8bhc9GRhsom7SB9F+PcLxEfhLCI37++HsnZkrOeMLGPkZ4pV2G
	nofTzSuG8KJJmVY50aiSLiLQBIqNg+kjc9lQq9XB5sgYRpMQkSkMUNleBGyUbDGP
	UfO15gved1vD87/R8mwApX2d2YwE8WRefjln1UVeiS/awmC+KXTmc1j5AyY2mzgB
	pwQsf6/SPZdIiRH+5HBOrslCcLNRJ3YsoYPDy1vYILmzMi6WL/a3UVwaeswdbx5o
	EUD6Jw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt8dfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9ebae1b10so90299e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081905; x=1790686705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=UptlxTlI3dkC6CI1IUYTW+oIWdd/8KarDBr56ztxCs7CtQ0sbGGafkgArtGRoOHojv
         lc3qSuHxZjv8ktyC+kR0tlcPbRo/jQmB7L/nT0DagURr68xtM6b1kSpPcLpAL4ffVv8u
         wp95fBZgcY+AOM6nqOmetrQHWQmCkwsn+NejoWIQOr6wnEr3oSbHJkYmiKB1rIuKdnca
         Mf95j9lSFH3m1+E5oGT2wTGpMbAXi69MIlOQTst8LUUzkFp2/YuL8DSMk8P3OtPEEznp
         fv1unbyxSE1V9nUk0BMzQgiP4k7n8qqZb6rsJGxtiuDvLzEiz/2Syb7vBioNp96p5uT5
         KDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081905; x=1790686705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=BenyH2wqX6C7nlsvmK7HG+6Kwi741JeB+y/aIevdgjp+k/HDVNvCKYCt3OZUUsTM2u
         E6XMmYrbbAsxEHHq3hzGNzIlKHN1XGc/6hucZjMP2ACWFQ2kJv4J7bRGgfiee9Jm0o5E
         IW2SXMqH+b1y9knnNax+gfco/Mg9tn2w23CbK6tyo/3VGcN0qChoQtf3Nl94M7eQx05S
         DUDV4dtbPBANAzbN3po/jAVEDXPfpFWkd6hfpw+HZ4LPWhlAvlVGdezVPCvnUJYPAZXA
         PJz5LR+gn9mpG/QIdpHMUIVllOI4i/5IhOL0sGCRvEPx97NSRpPPHf4Y0wtEkRm156K6
         rkWw==
X-Forwarded-Encrypted: i=1; AKwUvByBDFbXmwp7C79cSsL97atKpDaZy1rmJctJlVRKnupIadxo1loqUDaWWbRANcugz9/H9soLinirbdrglWZ1wnvS@lists.infradead.org
X-Gm-Message-State: AFuF++k/d9WMiq4JfPajKUYl8M/Ke36YYg4yjPh1IkDPGe8yI5rL/gyJ
	d0OvaIXeFbm7l8NSroDyBBfMT54Jl0aVtHR+NCnfy/mrzBuXUqeEahIHW2I+d5J3oE50ZL1aE++
	IeNWsRWExskVWU1TmQUCRpZcu1Sx8LZLcLcl0CIdZH6lw/dqEFrp6Z+235kDIG1n9sopDmS5SFj
	jsnA==
X-Gm-Gg: AYBFou2rVdY4164MON2guQLknoS5FacwsiUwVecnXq4yVtKGMVwc7Taudwxz0PjCg5X
	8Be+7DRz4imzF13DNiqrLxNbxE9OGLD1YNZKujDkP5x1xJRk6e7CBbjdyCVnRxOSKRKVmSJ/8hz
	jM1xHP/h/jalSfjhHjaTESGh2UQdCyRgaeAt6wQhmXcMX5d0M7VSGjkb2D7Xj4Y7iU9c2lotkq5
	CYeDg8PVr6DSCtY46jERbKlq4+HeIhyS8jy7d//N18lb0GoYE6EPvyGoHHXq9UWxTBN7rSp5+h3
	vQJDVNsNoPzQEUqMc3FOtDPtOwoNY0PadCpR99x9Y66d1n8/oZaCJXDLXFWRRgwyU8sTjwvnTbP
	SIB1EAHy5qZJtDwX0NTyaxjJWe2A=
X-Received: by 2002:a05:6122:3488:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c9b5885d0dmr8002435e0c.1.1790081905258;
        Tue, 22 Sep 2026 05:58:25 -0700 (PDT)
X-Received: by 2002:a05:6122:3488:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c9b5885d0dmr8002398e0c.1.1790081904775;
        Tue, 22 Sep 2026 05:58:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:29 +0200
Subject: [PATCH v9 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-14-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QSpKCyM8sZRrkH8iCybVhH+lwRqWiSeaHHG1sXtFQNM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsntBDvWlAS5COUQ03+xkA7ZHypS6umrEDCSLI
 dauC7+6RV+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7QQAKCRAFnS7L/zaE
 w5M7D/9iAIzuA1TTTvPNYfwed+K8b9oNDY7AYeVjsaB8CFqotIsA6/0mHPhKJK+5Hfw1vJsDUuG
 +T/6tJ6s0VeQwHtm4tvaA3IclmetEszg194gkPMmwQuB3vZZg08vCzYGHdhdPoEgiCMlZMZZtwU
 N9FMutmW0TYuyNQnnRr1Y9Uu851x6CXd7mtCtWnbYig0l9vy51bxeAlvnf9oP+zLNG2lnZrrFsb
 KjYVdKKwcJkStEndXYI3xs+A5Vy7IrC6uNl8/mCvEhG2nDU78MdQQJHyl/bXQTBfe0hlcnj5P4a
 haLNPfj8ZFriRf5nyJMyQp+9tUzgb46QC3N2OA8nfWEPY5pAS4NSsNfbt9WL+K8Zi01x6MGb5n2
 A51heqkbr/eaWBWe8t4adoh0HzAI8bJ7K58F/r5cenefTp5oQZXvPYJMhjQKB4vCw8sWQWeaGCo
 vWlU2e2dZtIVO+DiliLM49lh4bTjYb2GTYehD6UYeY6B5oZF3bTrYe3NloKVeP9/w7rDeFn29TL
 tsDl5CjBs1Rl7TmZT6smB1ilKmrOdYhE+XbhXagelH449cu4AsP5Jvbxbt5zvVttUe8y+c09wau
 KrIVtBgd25rJ4al+Wjq76Q48nRBrLX3reAbqKAnobFarQzUwhbo63tx0gDXBxVDq5fL6SIAo6pE
 autPbDIl3pPryvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 9sHSjdTiHtqkNxnCJ_0S81UbZ3Ze8EQD
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab27b72 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX91TjqgTbi6oM
 NtwMhAHlsN+pAiCX+nIUHXHzXDO5ukhBxcw6G0bE88+GtFS5vJiYc8DmHurb1Ww8sksj2oK87JM
 qZu6AYsJKbMNccufZuxOZTAnRlDwtWXb5ZxmxKSfHt7jwssYfT0kEw//8sEckgJwiE24URaQ8kG
 uM7ojBKZvCG0LfaY+DQw9KMxEc0HicFv79hhU6J2vDhVvzAZPUVI9aZz3iYL/rAVuDXjzYJwTuG
 AbThMRhdgkOS8bRTdZ9Yr8/IyIyxWW/9ZgfNcC8p43h17KtaT96kIUPqEoU1qydkDr45bhwkQeI
 Df0aAoz40tdSiZhzzZ1OmlOCpXUL29f0zDwQ9C/zh+tS0M43HfD7dJm8KOV+v+N3v6z3tRK34xp
 +fwNYbF+xjIQRM9iBQNcfgv43T+BccXItRouqNqO6B4qQe1JHFFdEfaB2h/COEztcmrmmbJK7Ic
 Q+OvsT2YywSoJNCQjMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX1IVp9BhRqGpw
 W/k9GH1Tt+kgCuQCa2kn5QhH3WNZTHMMAEKzO/SZjpzDupYC8gwAu5th52wxiWbf5t3ZFYyecDb
 87RHwKzuXYMIHQbxcqZ2A0BeIT/WbMM=
X-Proofpoint-GUID: 9sHSjdTiHtqkNxnCJ_0S81UbZ3Ze8EQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055826_952068_54FBDEB5 
X-CRM114-Status: GOOD (  16.34  )
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

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the multi_v7_defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2d6292f8cab39596b540084fbd8b30f4c25cd4ff..7750b11f80312bf6a6f0fb276315f32f8714b4dd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1150,6 +1150,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
@@ -1323,7 +1324,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3


