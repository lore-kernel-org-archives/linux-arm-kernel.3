Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A56EB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=; b=nKzGZF0PrTfdWfoPiX6QF1JniP
	lAbhvpV4NEA5OULKiAK5cohUBuV/lWaRrPCVrk0MXVA2QQHqaewQqBMilRGWId///Ov6tmvx1ahAP
	7wdMvBW+lxjZEq+HW/opFVIJEv7AqP6fbEXFuoldm69gB6oS7KMBZ5d+ybtkSPa1D4FUckLmqtxMe
	DESWXxQJn902IiAIxE7hl9fFU5QqTx6Cc9eK2+xjBUTFQ0zqBMSgjF2RJzNsN0ZfUg/A4f2qfd0q5
	DOcm9FTQXFbjoFSLR5cnmia4SimFcJ0ZYnLm7C8pdNlmpZARsTQFJFYcvP8X6d1rDe3JwttZsxGWk
	G8OYbKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8E-0000000Go22-0pv1;
	Wed, 04 Mar 2026 09:03:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8B-0000000GnzO-2RHy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D6hd1203222
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=; b=CazoV7ZGoy+xYvkW
	cCJg6ClwtEdshtyKOluMNv36otWlt5w1TDCYQ+bImxm/DRWwpCmu07h+Y1mvNmO5
	+hM1wnV+qfEXZ1/g73CCmJlHqgibwXu1PmqpDsTIELhobC5+9kE23b0dgz5e+yCr
	a3iAYAZah49tETdO1Y3PEYiwldEgVdLyrE/ibxq+kMbix3Mu4I2pDDdr75h27WJ5
	p54SIGKrE+7OwsTZhT3+SBBBSdxU3nYE5q6p+ztUB+1ipIxADEG0ZKZwF/a73jRD
	bVp7G5Dc0+YxpHnqgBCeO4s9X9JuWTXzfAPJcvSzFQqIzoei2Vhum+GBwB77CHca
	f7xWeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0jrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:02:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so3722504685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614978; x=1773219778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=;
        b=AzsNxCIgXg5rllKnyOMbROpBlaF5IQFGvSDul/UTvq4v1CzDWv91BNqvLLx+YNFsEI
         wKajysLHCHFleRag9uJT7Ay4+0EYTS/tr85wAMuG0yXHHbBNK+pW2Jhcarj9SOTO0R2C
         lISFl0i2qh4Ut/mA2i4SBQelN1SAbNj+zA8ZxcfLGE2qz74DPINXKaK27S51gvD9EP89
         dWjG1cezL3eei2K3czp648bU+/2iUShHCDzU/CVBcmKesXzz9s/OYGbenR5vR/h+Wzac
         G9CvhftgYioDqCElyWhtiQpHhMovYRISowfv3/lL8GA8elfAlUUByy3JyZ79FRfTI6X8
         9yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614978; x=1773219778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=;
        b=PixEOZQLD6mHaQ7pOex4WR6yWhWoOQvtmkT9qXpe88F9Zm6USw5IvN1cnai5kpfcHW
         gO8h1yxu+0/NbBK447Xwqzu1NQtUt7+LS3aIT+G3e/iFDpf58uwM4faDDunBQdPYEmSu
         LrWAxla3oQrD69rPdq6nWwRzFEjqktlSiNpltL+Zy3SEVDEbqdChmjhcd46b2TNlzgiD
         mrq4Vgux3pW3uWHYq8yFeJZW0QGSrANSxxW9US/VhaFmwecrWQNj6KWe5P/c/eGV+L+f
         9PX3Bn7f3m6wGv26OEu8hih04fjZNLaxc8kEfSIhmaT6xfvfY/Q7LVoZJsiAhgrWD9xI
         eTFA==
X-Gm-Message-State: AOJu0YzP2DOStRL7uKhDIlbNPmGMmf3zC2t/zHYSqeB3lk9mp+ajrKo3
	rrJupXxi5jwK40RGYI+9Iaq5Evv8A8MML55XUFmsoMiLA58BBV7ikh/+NvdZ6GKDuPkWRGAdagd
	sE+6gU+yqZ4lb8VX+QoHi7P4X4bf9sli0CkdrZ+cvXBQ+IOY90CRfiDUN8CfFDHlZT0YclqKdvD
	kfgQ==
X-Gm-Gg: ATEYQzzawIThwBkFX4Z6iTpVdJSSQ6BWM9h6valfOph4Yunf7HQIZiMWsbXpiUdjWss
	be7g/y59Mni8rv8i1UhxybIcRcj/jUv3zgRbZoKhwZsyjuYREEn3+aqu01mPPFiB86AhptH5UCv
	zuvjerG6cC+/81Zveeu2BRfmuHq1m8F2Mpla0R8zPLqoxk+7HaSYqIDY/F9cHT4RfoeZtHmYba9
	mJnsZ4rFxHeXyonjS71VgXMJWKEWdy9J6ik2tAD/IsWkCQq64192tZ3ISREmcXh0z6WFFaZFKDR
	b/u0vqcFlK8vo0AXyarWdujwG8WBOdFVr1jnEX/lpPJkCohYJEfTSUubOlwR4nwNaT3hw0CjpS5
	mxq0wL+eBi4iV+bf2dOGYkSk82iB+ha5btgtZb+1g27UsVAZZ0Rsz
X-Received: by 2002:a05:620a:1916:b0:8ca:90de:43f1 with SMTP id af79cd13be357-8cd5afa5022mr134816285a.63.1772614978019;
        Wed, 04 Mar 2026 01:02:58 -0800 (PST)
X-Received: by 2002:a05:620a:1916:b0:8ca:90de:43f1 with SMTP id af79cd13be357-8cd5afa5022mr134812685a.63.1772614977445;
        Wed, 04 Mar 2026 01:02:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:23 +0100
Subject: [PATCH 02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-2-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=elGyJX6kiF5U80wwgrS1gevNlE86QtaFWMPcJZOJ110=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Ur8cTWvTe41Vx/7b1PfM0xlmUQmzL4DULT4
 JDfBXBxP0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1KwAKCRAFnS7L/zaE
 w42GEACAPu61giLCN8WXIPA8YMaONEdH0iiFGuhCO5j8uA/ORhhiYa+GLkJFndF7gMOXfafU7o4
 sirVD8YRozigYhUq7uBAdHBd7B4/UHJOoPc7fXh9Zcdvx2SBGB1fiBt4QSB3axS/EDKoemsR+UQ
 DLvKVYIrR5QDkaMp2T9jmHWOY350AaCOtp3sHiR8ke6oTE2Pph/QRt4IGpI0/9OlOC9UGymPYZZ
 V9kNxnN+fwIpnHOWzrzWWogSxgiXViZOY+jxSICkkONwpIlPDK0NYC2+O4jSSRaTm7Tv0jF62k1
 prRKMb6gBN68zMJuqEUcG03QgCBiL9kBoCwpov1N+tz7EKkW1pf7hMC8wl0UgBVQE4o9HbcxNgH
 396JJAILS2c2NHBecEEEU2Hn8f1T8BSYw9i8kSsFkxUYMI7Iak84y0653B8+sJvEJClhtjw94If
 nN7CQsXkWQmElJTx7ywvoyf2wcadUGYpRDmEVjuVyBbVncjyzmW3aufyFzI9c7MSXU/APSPVCez
 aSvQrHyatWzFekvX3TSoxwnCVj0kmaY0rprs4Uc35rBn/67tkAOSCfs++1/10zmdEAqcO5x2a0T
 IAY+hMnPhrd0yYLskrnfs1+9zhF3aFsR9q8dD9rEVUVw+i9FXKcvXpP4AD7SNLeDYqMggqvcGQk
 6RvbjgcEGizAygA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXxkMo4nwXQ8BF
 yhgIJD7IyEytwUPa+96B3RNBSwd8zHDRv8FsBFrHV62qsw/dUeUV3RMELPfKWcddM+ycUMAXSKP
 qRLyUhz8JuwWd+zIw9kSPxrgOa9ko7Ihg3OB6qUIIoaMgIie3utMVtljOq6XjxifKeroUaYPRwX
 nUSbAgiD7lE2w72jEV8JKnwNwBamS9Qn9sk1OPGeIBjbGoeT5wSDzdbPmrhArm7hhx/sTwK6q9G
 tkqlW/AZq6TdmIpgZ7+Qjd6p7mVipzEW9w+cGoSgBMq9/rgOV5fXn3SzPpF4abpkkCDaWp4jR90
 4z3lsOsIU25JyVksq+hGjVb1yM+GtZaWeSMeefS75vvuaJPgdln2coSLlZjkLYYquez2dG4ICOf
 DiLkc+pxMRjGeL8JBLfSlX87VfyU1b2L2ki0AZSD3kJJzrbsDM5M+X5fzNsueAArMQ8skA+4p2/
 UuDSO6uDatSZSbJIgxA==
X-Proofpoint-GUID: -fBgf6z1mqY5TMD95xY-m5lZu67bn_E5
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f543 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Hmb-lenyu1CM-5GwpyMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -fBgf6z1mqY5TMD95xY-m5lZu67bn_E5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010259_627172_3E32099C 
X-CRM114-Status: GOOD (  15.40  )
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

OF_GPIO is automatically enabled on all OF systems. There's no need to
select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arc/plat-axs10x/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kconfig
index b9652c69d1b90e506f82b3b8c5be373c51246671..40f2a74d404ad9759ab9d6764c2496159eea045a 100644
--- a/arch/arc/plat-axs10x/Kconfig
+++ b/arch/arc/plat-axs10x/Kconfig
@@ -7,7 +7,6 @@ menuconfig ARC_PLAT_AXS10X
 	bool "Synopsys ARC AXS10x Software Development Platforms"
 	select DW_APB_ICTL
 	select GPIO_DWAPB
-	select OF_GPIO
 	select HAVE_PCI
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB

-- 
2.47.3


