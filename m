Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9E8E937EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=srk5XjvBrNGkwBnpptSv/EhlZrJUSD3XjILm85b82iM=; b=vgfbcxXFhIh62N
	D5Rhw9H3n825gai/UkIBrBbYXzcMObhT3G62iVbk31esiuu/HUKyMafXW411LKZpVAowNfTunZ8eG
	SoNd+9KFatGLvYrenu7dJjKS4LvsimK7fs++B8F6de/vPww2qrQtb++zf2sEm/Ktxt1lCnnNdjaHm
	tk6vHWlyddMbLrgq1ofJR4eWQLk3oNEyR1kbgIwWHl7+jS88pmNrrCfD+4Mn/WBWyxoj7wD4l0H5P
	tAXM3XJSMpoK+o38jg+NlOeWvA/IQDgByjzpe/qg356cM8/MwMpHSfwGx2J018zgN399Td2AeMVHI
	nqcIy5HmAvJ+TSynttRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMj-0000000EWPH-0ItF;
	Sun, 12 Apr 2026 17:12:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMg-0000000EWOV-0xEG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:12:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4sLk2783584
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=srk5XjvBrNGkwBnpptSv/E
	hlZrJUSD3XjILm85b82iM=; b=ZXzz0EFsDxvudj6fHNXF1Nj4wHRMF7laUg1u8h
	ugTVZ+koU5gvz4qO7GFYBQskNO6G9AG+iGzddD4tRt7BIoO7EfcHMT8HWkT1NdWL
	2HHb2hQTAN1faySF65njLS/PNxKj6KTgeEltK3XwALflLO28XMICYAKI/vFvmEMT
	MG5UB4mFT03GfXSIdi+2+zEMVEHr5msbIpz1LnP/GKst4AF4xOUAIdJ8vG1I7t/E
	DUCX7ze7PBEH6+10Td2/bWPUjWKb7R+Vk1Lo3vgsqH+PQNt7rpaMvn7MKkQ/gnRp
	hyGE3FJY7NIDHamvFQkz3pBkIcvyEwfty0neBzQXuqL3HHjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpad8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4076dc16so70004811cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013973; x=1776618773; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srk5XjvBrNGkwBnpptSv/EhlZrJUSD3XjILm85b82iM=;
        b=Yjhzd2c7AOiRQ/uFaGKrpynVPlRvYDRAxm56+ZGMHRa+o30xxd/WAQj+Rezj+9nXSX
         P1yESpMEiU95eUk9eJsHO6gkI+15V/yoD7xnu9UO5yUR8j/QTS7TphJrYOzPA49CtgCe
         D+HuIrBeUWCPw6v8XhHuMxpfS1DfDxFeH30gHXxtObra/EHL620ehdbLnBgSHnkEB6p9
         ySJE0Db8vfWWhoO+ZNchHhno6x/oWsrqhmUXwBAyUAEpM+T+B4ITQ5HMC2vNCLXsydHA
         ZlUR/nD8h7LzPEI9ZAVONTrR1WXUa+F9x1Hh0pWUHNYlXYT+S1LLsIRy0jwVShzEwCIP
         ro3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013973; x=1776618773;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srk5XjvBrNGkwBnpptSv/EhlZrJUSD3XjILm85b82iM=;
        b=mOVU7qO68hLAQShMKdsTVvg7KBTu13lSQAM90//ZimtSp7g2QmeZXXmcaimlER22Bc
         DjKIJLH83MZcou/1M2mymCY2FUxZkdZ4zuALu7V+C3jympLgiamxRCCwxnQj5WVHAtJn
         ZjAcXUwLZ5YCnbgTQa11OSDHO459j6C75UBn78CqP9V98EJW92MMA5mJn4BrGhOqsKV5
         RlFVCMiKioXKEYMM6EejkCgt7Q0zU8YdABRHtGsW3zxK8t8pmEa5vlOejF9Z4d2PGNID
         b3Yh8Skr1uNzcfaamILfdEuNaSCFMRLYyTWjc9580l0nAuv4qtcWaybt5AZFwwZCCksc
         Bong==
X-Forwarded-Encrypted: i=1; AJvYcCVg6QLI9VlLk1XrwdIXoboLGS1mBp68aHoPTH8En5iyONP6HJaesvi8fomQLgyvr2os7YdJUZBU9rYwQh3f9Ov5@lists.infradead.org
X-Gm-Message-State: AOJu0YwgehUdsVUkapGgAQ47KK34lwak4grpfQKcb5e5A3d5s7ayWT92
	+oDQz3bbXPFSFbIgdzMFcujVH8fea4Pqiq224eIwmpsAQKVcFcZb1WDazb8tzGlB1xiDINBIp+3
	FBOPaBckhdO8GsvKvIUGW5MVw5nMpHblkel7QEtYtQPTVbAaF5KeKq3zuZkRyBPzKmH+pKduRlQ
	LVUA==
X-Gm-Gg: AeBDievAojhr2WMvRtSwxyePS+l7uDUOIA55vLXo/n8v5me6eqtkQsgo1hPmjFptskl
	XnDz/tDlztRe5nV6j3+kRxmHGoFLUVoIXYyKuQng1+4TLYNomxVf17cJcLvV59JGSSGEMB0KWqF
	lQCctEUzfwyRvTzGccGkjx6nK/6rjqFk7UVICbtCg456vWqNcsNIchCM+ZtKYJffJ2cBznQVxGq
	F9fqDFhoOZW8eApaK3pI3Nx3i1fkI+kxTQ+tbk9HZb10PSilBdZRsJbxs8oh5bRJnCb/NOjE4HB
	UoSj3jypaMMUKnIPvlPndWN91FuXnTmAh2LyHhuCTepw9oFwx3NbJDzBTj1X82ItDtOsjHVyj1S
	wUruRfp3X+dZSeoRF0iZ7SxYyFrdvdvE5YhGGS/5iaPqA
X-Received: by 2002:a05:622a:3d0:b0:509:2135:ed5e with SMTP id d75a77b69052e-50dd5cc6a8amr153946721cf.32.1776013972590;
        Sun, 12 Apr 2026 10:12:52 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:509:2135:ed5e with SMTP id d75a77b69052e-50dd5cc6a8amr153946161cf.32.1776013971995;
        Sun, 12 Apr 2026 10:12:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] ARM: configs: Cleanup redundant options
Date: Sun, 12 Apr 2026 19:12:43 +0200
Message-Id: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvS22kC/yXMQQ6DIBBA0auYWTsJEIKlV2lcCA52mhYbUGNiv
 Luoy7f4f4NMiSnDs9og0cKZx1gg6wr8u4sDIffFoIQyQkuFTmNPwY8x8IC/+TsxLg0KI61uHsF
 ZY6G0/0SB1+v7am/n2X3IT+cM9v0AkNs2lHkAAAA=
X-Change-ID: 20260412-b4-defconfig-multi-v7-0619478fb969
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V16ee0StzK1dYlzzSsdKE8XXpyn1tb/4yuxsLyqL3qA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KN3EvhTueFPbGVpG9rZ/ezAR8i/lkQZluab
 YKgHvTuKHCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjQAKCRDBN2bmhouD
 1zM4D/9S8VKwhdclDIeBx4PsqxFnep+SsM8ZzqiXkIz7KBQ3r8ZvnakUc2pab0TyJN+ENXV/5sn
 RvlG0s3foouJ7Iejfwyor4LrpvHpoBcF8I/m4lAGSBJ+wHzdMQkQyOzPd+IrEqfMuHzdS74I5ef
 aYAm9Aq8px6OM2gr3VktRTTKUWmQgPIg/iYEmOarvEwgdNcCeyA9PpcuWBKe5Q1nn8lt74uzCW3
 zCEatXAuBXDL+RjJc96zC4TqX3iyB+rfxqdoPA59zzJS455DZGf62QHQty+lqDtEwZMs4CKRxhD
 S9BQ6MW1dwXKfJN9hai/YYUGr6YJUfBYsau7ANq1JtjFlA8OJ97/H7TcB8TGiTdQnSlEiqClI7E
 TcNcE2ihTk7Ut5NHxj6w0eGvvOQgVKA7tDxgrRwVsEnPkwY26sm/9WK8XRAeDItiO9jqISd0aMm
 3yMdooyP3iOIg8rueg5yxnF6CjGqQLmdCN1yFbF6s+e+B9Rh6XFL4/GL3GC6jfyVTZjqXBEMYkd
 4O19VMa7/COXN7mv0uMlLAEczINNsPwX0yecjHw1sEzFwfpjYkTvneq5xSyTz4t4/QSRkvM/16k
 UWxRHNW7xLMNwzBy0FTxbBBX9St01+Mle7YNmeaX1TVvbb8ma13E7mvb7IkVvSLJHyLiZzG9Z04
 D73XNM7n+l4Jt6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dbd295 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BXN8pGxehkP936TjXAoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Mwf8-aoVki95LUsDkcC6jv9GP45ETNLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX7UFPt2m/NZvj
 Yv18vT9liysaJ2/JlNzHeFwJJyeh99cNyDAu9WcHKB6nwd3Q9XqzQxLpBKjsmSmfG3s2WgrefMd
 LkG9FsQRPpirbimxbFygGKt+RSKqxGQxiEet21OgXEpxqCT3/+LCi4b0yNP6E8ChbSR4JLQlrgU
 0xh5IsTJMvfyJ1agJ0tpuJk56lbEotS2R9VG1tcb9szks3OQVM6+1XO8MIim/MA+IbtdxkzyCdi
 ZRgbxfUS0g9KApHpY4w/PRRUQ5Q1suXHsNRI5TR2wWYJeHvRoespoGUmjQzmBDNvttJ/7MdzzRy
 diZFgKj23A/cUNB6JHBoR1DvL9/foxQJI/nQ0g51ky1e0O7AOow7uADOj4A3KkdZayeZwzLyvEL
 u6Ojb8vLj4wosUbNtuS6zB7nsSMckiwOX18tZ1W2QYF/hs5pOM+N3gGfB06uRESlLwi44xuzdvl
 j9zBRwRVwp9xEoBxnTg==
X-Proofpoint-GUID: Mwf8-aoVki95LUsDkcC6jv9GP45ETNLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101254_296360_7DB53E30 
X-CRM114-Status: GOOD (  10.23  )
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

No functional impact (verified autoconf.h).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      ARM: multi_v7_defconfig: Move entries to match savedefconfig
      ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
      ARM: configs: Drop redundant SND_ATMEL_SOC
      ARM: multi_v7_defconfig: Cleanup redundant options
      ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD

 arch/arm/configs/at91_dt_defconfig   |  1 -
 arch/arm/configs/hisi_defconfig      |  1 -
 arch/arm/configs/multi_v5_defconfig  |  1 -
 arch/arm/configs/multi_v7_defconfig  | 95 ++++++++++++++++--------------------
 arch/arm/configs/pxa_defconfig       |  2 -
 arch/arm/configs/sama5_defconfig     |  1 -
 arch/arm/configs/sama7_defconfig     |  1 -
 arch/arm/configs/socfpga_defconfig   |  1 -
 arch/arm/configs/spear13xx_defconfig |  1 -
 arch/arm/configs/spear3xx_defconfig  |  1 -
 arch/arm/configs/spear6xx_defconfig  |  1 -
 11 files changed, 43 insertions(+), 63 deletions(-)
---
base-commit: cc27764c3072c53e1b5df83fc2e46fe1e99b8c19
change-id: 20260412-b4-defconfig-multi-v7-0619478fb969

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


