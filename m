Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0C6C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=; b=FTu6V2h9554QrQjABlK11rVFnW
	r8FJPtZqSwQ4c/yZpyGt6dIiP2hd1IsNawoFM2pua1eNKI9eQQ5qiVbYz9zjbIPO+EWe+uj4M4/tk
	QHEez1QgYRPX5voVJYtk9pCiQIHXUUmaWkqE8QvyxOL+moQvz2qJHYnSlkigOFJdSAiErfx55b6oK
	G1IL8XDrDxi3qIAswRqq21MaS5WlMCCmlpnI7FMjKSJRahRR3nDix5TPCCcn1prbMD4K1FghXDzXn
	g1b9K0NhC/XLH29DO7QRP7wWySVfnrKjLtgqLBzmeir7cRojkSqmTIGsoJDZFfvx4kOJJowDVmdli
	dOZu6qbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEp-00000000gIs-3o4j;
	Sun, 18 Jan 2026 18:11:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEG-00000000fhV-0lsC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IDe7013281269
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=; b=oRpcLxOSIgnQcj/G
	yg8Hyar8Un3q7Ovi/gBJnj3R+oluHlUQFC1DHjF2h+VTk000kvwcmxlLWX/zOVUh
	w9fRrrwLuCluyalYVdPb3sZJZpCc/r/UNmi6zxL129lxgfQnpDDPVroP9f/ethIv
	c70ogb4hngTCCYaYJiWKzGJZLPlO4m8JtHNoJSa1MkMfEu7IoaWDAtkf6sJGjaRA
	ZsHfxqXTxLw9yGMPfIhg8nSFt/MiFAFZ+zVDeEuz121NLy0+IiSSFsIOgTKm5U4b
	S1oRRECpIpwXLg7Zc4h059rZyp9AmllxgFuqiGNWeKo/C6u4MPf7QevOiUl755ST
	oqvn7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2guju2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52af6855fso497422285a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759822; x=1769364622; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=gHTxVEQSP0GOD1GcFlX5FiCtgZxqCC1HZtc0LEmFM3FpRF9F+LIMCTL4LxLz90oyl1
         nm9YOtzPNK4XoH/hkfeAysp2hMznDwHkXn0SnVgfDAvlW8jRPgma5WfiU/ALNE/wr8Dx
         k0Z0hueq3Hnvhr0WZAbVAr8wqUFckRgbHDbLbkPVSM+R34Z1/uri8yIHcqzQHK9G1G0s
         vAotWWDYjY4U6IkTxNZCX/bztPO2bACWocCoOo4VuFAoVMIt0tMAltMOUo1hiTZKPvIv
         U0bEF2Y0lQ4bcm3Z5z0JftGSLu5MrYDT6v9FlfHrgKeH6s4CX2N6ZNdAgjTyxydGS1nk
         XA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759822; x=1769364622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=ntutToss3kRtgWI01riqiHIRKbVVSjMkoh7Xqaw8ewxibLPOqzGoil8UcJZZeETdwh
         8i5QH53o3m1epdFhh9E1eQm7dbXQaM9dexxO6bm7jpyHw2kmI+c5QVm/tOYeNJTMal4R
         UcHN3i1iTaBqDG8lHH5Wk0GYj+Raa3gd4DoPvmg60an6UvTWP8jqZ7LSy8u+rOMmg43a
         VggAtu+13QN/BVSx1NwXlLpAwNJsjrY/WiABIDZBAidLhiMipFuGNUL7Qqv3GJKV69Mv
         srlUvtASdrU1V++MHmJEIPfeFJ4hg+QLnghLlecxsqUGynnml8s7FV9AWIlHqZj1DT4V
         +qHA==
X-Forwarded-Encrypted: i=1; AJvYcCVMqROErX7tdbGWu6aP64RDekda9iDmiN39c6Fkke7K/ixNWCetd1d7Nj++MkOIcSerEKekyqr+SqikJZWUj1Qf@lists.infradead.org
X-Gm-Message-State: AOJu0YxcGPvXDxBt1qe7DwCEj1CnW6BHWaL8Qode+6NZRRJeatH5lVuz
	v1HSN6/0shMG80Zju1ky8V+QU2CTs035YzY+WDM7Edxhig6Hxp/JM7raiFrPEym0eaQogHXQ/vo
	Cg34k/6Y1bvcPeigLJAdDuQey264APrRbn46s82MULdGOJG0iAaikXuWape+6GmPi7NDxnb3VOO
	6rEQ==
X-Gm-Gg: AY/fxX4jPy+833H2bkesCnj3drvNdtdFdZRtYUHu+/le1q1zVaV3UjtazAIobQDTtI4
	QsDYdckVer2n3AZMHWvxvKv0Dnkn7iDwba05mEwn+/U6vqAMBBM6rEJBM2vg2zdpDcMQjs5KmqM
	JmggYV7AEPu5wJiapr22BhZD5iCumR2WnaqrWD5maUNPcK6qv4q02QsK3CmnNuw10AiG61KbVYJ
	hC9u5+jBRLB3cVDJFuvHXYgOgRXlkEax+GZygkV51YavMocMtNFslhT3+PmBqzbh7bRZ91VGnwX
	oiJ17TEVT9HK3uoqLANfoPulZHJfgCi7QTCQgFf9YpdVqP1JGQx8MjV3gn28Hihm/+Hg5r2Hslr
	CG8eD04PXVCZ26IZ4hvbV9Njjh8LD+zls/w==
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728109685a.7.1768759822587;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728105485a.7.1768759822113;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:32 +0100
Subject: [PATCH v2 09/11] pinctrl: tegra-xusb: Simplify locking with
 guard()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-9-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FLZSR96VBkRrzhSP3/2OgTuUg9DxmOscsEadYFKjqPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH12QqDR9lyHrdfWBYKu5wDAWLJ9ZakzQ3LT
 0UuYPASn5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9QAKCRDBN2bmhouD
 12VHD/9unxdOGDL9Cvw8qMe+777M4gAqFDHe661yf+QCRAMfaXbN3WSV5wByRbqTx3YfWy21YOQ
 PmUn8RHfADZRESRLJ40apeyBHwmf+X3aiVzCvJrIhssAEg8e6K7zet9KS39Wxq+ggSw4RMklgwR
 648adqt9vMbooDA18DkIXowYvJNwPJKcEnez2js1gOhYtk9Et0iy/q7sWb1Pdi265zTYwxv9fSN
 1XA2P6oDR2vvTZGfRM3Y3qL9sYGLOq+7J9B2IhXGsT4h0bakUH/HwP+otw1LPAta+OerExiolHI
 mYexTPNF9qC1iJTWw9c0TKj9KMWD6/7qUHNH6Na0WwHWYNyqKi68kjfdg8ye2KAuFsHc4AFBrlg
 D4+GUG4Z5YjPvImtD+ZxD49iaeWlpHrIs9/oPs8qcDvb4tIp237aGABh+JBRAXZIneYCMNNZaT1
 StSPdDt7VhSHoNzlof1zSlpuaWaw1Pabz/Tr+4F1xEqFkZZFTdO26JMZcQMyZox72x7c/QHRR5A
 +YvVe+Z5+GsaGQttt1PTi5ccnDiKJoTagTW/dEGBAtL7aTvBTSan7k10tRuwFKj8ZWVzxHG4TSI
 Uw+E/NGfkjEagoYcsHuN9QA27EJwqMeW9WQTpq7JAAHx4NjypWFW+haLBXvrjgznmhZ8d0reg6W
 wSCbjewNTPr6JfA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX9LyXSpY0kPUO
 +xWSfYFPpurXj998X6Vios8Z70LAfa2tFK4y6JDPNW5YzCl8oUmmWW8IjNU2+8APX8dg7WwkdLr
 e4dyYdPaStFIWZf4tWBDREGD/xD0xsFBZa8jopMbqpY/nfId8FaWqLbXBMYGY0d02uUUXB2Z/jQ
 xXtNOvmV3JXl/wSO6c0rSRGZ3VMtgjT/+j7swwr/vs43HqIYyf6J9U9nkHwsqCMDypX2m/Ctwd8
 B4vbHLQRGqSVOaTAG3DhEotrToSZq6M0pE/PqHb3q2c1kp6AFuwTJ9B8EB9N8w0MvD7hOthMjzw
 mNTHrxYV70FnJ2nZtfdzBSupHNIuJYoFHocy6mz/msuM+RGPr0XiNYtge3dQvis9n8YllgVUrVC
 EQlaT3qRHOAj1Oshl4DWT2/xTtt1VZn1VQgxGDTZp2nLLlzmyYQW7j0ctCxSKkAT5muXTXaan8w
 zzfxNSAxqAObonwNKNQ==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d220f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aRO1tsgHJH1V1zxVpf4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: eCnRyVAa6MmipocrQDccr-MApcT7GwOB
X-Proofpoint-ORIG-GUID: eCnRyVAa6MmipocrQDccr-MApcT7GwOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101026_161141_59788CC4 
X-CRM114-Status: GOOD (  13.41  )
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

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop stale mutex_unlock (Jon)
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 34a373f7e04d..c6a51bb21215 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (padctl->enable++ > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
@@ -498,22 +498,19 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (WARN_ON(padctl->enable == 0))
-		goto out;
+		return;
 
 	if (--padctl->enable > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
@@ -530,9 +527,6 @@ static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)

-- 
2.51.0


