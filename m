Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADECF46440
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=; b=M+Nsjwybt7NjuD5XBBI+IulyB4
	TujJx5c/N5y5JrArCmZeg9DBkz0sJ5XAcNv3PEFPs9Fzi0vQ7l44hwuKfH0U6TmmpiFBtP4q/45Mr
	feYk3A4frxJzGNRaO1e8O5Fd3L+2gAJpmwjHPWaW20INBch8ZOnmSyGgHHmhULPciXJY8FCyzHt1D
	m0jNqwSsScVPt5S7o/x5Umc2u/GXkZZji3PUtrHw1AP9ZuPGVb0MkwzqAwW/QPUynD72xkTftiUm+
	I/BjTZCwsaeSFYZ0W5SyMuOUatc63eV7R5fQeA5dCFLZnnSNkFi13ERdx/SaxpBeyH2Vq3iu0nqWt
	ACZ/Izbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WJ-00000003goK-1k9n;
	Mon, 16 Mar 2026 09:45:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WB-00000003gmB-37fb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:45:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64ahH3777631
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=; b=nlTloFLeXHhd34SU
	KHEF07Cw4bHJjx4+NADFDDQK25xjWQN8q6A5ukg+f0T7kANvhLcVjo8x0IY8ksz4
	SkCe5/ki2c+E2Svz9nLH1uJukU3ByK5hgmJ4+3Cjfre8lRw42cgKEJ7pm27DfGBX
	0ApOLWMlmtnhE7pREydl4rEgsbNN4/Ci0Y8b+gsKIfEZZvtm6LFKC7x0YhEiLVGV
	eI4P/ujAeBoKSSTDnKxG64wWj0YMtVL/AkWKCaq6TeRjYk7quZeEw4TuOTcEnqCV
	lXQO3UIAmbcnj3bs+Mk7vwfZXtdv8Cehdq6lo8o3YY3x44uyPpAWyzTAVLuWl2Hq
	H+dyZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vyxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso5046928685a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654346; x=1774259146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=HxLdYHvUf/D+tDTpddF9yFBrwdhqQA0PeUsmDYABAYZs6QN/zUChMHSC65gf+3+Fuv
         1Jo7v5yA/0erEWyiLclpoWIjKWxZ912qq977P66/p92gQ6HK/I1EoC9BXejMYFxLnADZ
         1I8op4VuZWUAO4PXnfRGk4peUo6a10GYk/rCmPOQSqza3Sfbt4OnT4La9akcSgypDd6S
         l5dv84nenxb2thsbROFpy20e36pZ8PjCp2JCB7I3ve5/GheQjN/9mb/gIXQKyo3o9Bks
         bRFMrnDkhEVslBYsMgS9HcFmR46YmnVHUkhMLQF79xdLXV7TpwpjonRyxmJ53G3A0mhw
         94Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654346; x=1774259146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=MAdh89G9ZLive8dCSzYWz8+XqajSj4kHTp9Z7IxTwmdt/djiEnKHHaiCR/1U3ZsVmB
         byno7FhrS6aWUD5AfvCH1KpVRzx+gyqPDJSCF8vqpg47u6jbY0P9LVv1SBq5aHyLwqNm
         Ot3npVAOwMMpnxNF7YxTWfVkznAF9qN0vcaoOJO4UEiTFlyxweW1WaK0ieIWw8T8Cj4s
         2R9nfIfJL426HWUnEjvgK1U/tF8EPUS2s4nvHTfka/xY5rOzKcgU6RkeuWatIEVYbR1r
         3MAE1b7hNRThAas6G4szjf6GWdBPsKuImP2vhj01/sUJIt4s3Hqb2ejB2kuXBrb2IRSd
         36Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW8tkIr1vBlcKewQUDYpfAgbi0/diWph3Vav9PBxy8SQPuVb4SOpFd8WHFtoW7O/0JUVpuYqksmecxASal0ipne@lists.infradead.org
X-Gm-Message-State: AOJu0YxuLxg8euyhp3F6l8cPywXqjnlblUoVo61+hbinNvaR71kKsIWb
	oJUi6NURhq/XwzC1nmG2JjVX3X8YUEoDKOWhoFvXOeotJPmlXfJjqnzeNi+nHa+zGAjkKHbD5zU
	E7Vxoat4Ufe3g6yHUYxa29jyr7RoYokN+45OGvnM4lG2tbUlG8umT13GJwimknhrWymMAL2XLwB
	Y3uA==
X-Gm-Gg: ATEYQzxxkVTmVg5RV2nWy2GwzkXb3z5nDu5wmfWspJ39BYesVmrqJt9n6womZ5jsvcY
	VaTLNxw2vYa6raZ+JwqKW+rcbAyt+pmicI+6IZmBAsPCjqzPbUlGjdja/XYwGOeR0MCXYuSVdg1
	A713eAh9HQVCx8PICpmlI3bW8ap47egG/0Sp3I4gTjAU6Xv9dxxp/Nu0+KSHQy0wQQW5V8in8r2
	qG+o8H/b9UK1R32IZn7Fk+0/5fafEOCFlzziOnGV0QzffxBSakj6JvQh0anLgRqb0D6aiwEJf5+
	RQwGf7jqOGWUn9UZtGafZQicIMM/UkkqGm85ifQewKM675AunQ8nLfsCLoOxqsCP4hkLLNckjkf
	5n/YD1VN2bdLCnsMAaTgMZy/ChrlTnWrYTV7OjRIhchmd6tGQkUyR
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr1592980485a.73.1773654346432;
        Mon, 16 Mar 2026 02:45:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr1592976685a.73.1773654345997;
        Mon, 16 Mar 2026 02:45:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:22 +0100
Subject: [PATCH v2 2/9] net: mdio: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-2-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E6fJnMreFnmXzFZLhGkFMX3Zsbw1YGYTLK5
 r72IbihzNiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfROgAKCRAFnS7L/zaE
 w5VREACIACWA1TEOB3OkduZYg56RL8zQ+HZ6Oo/yVmrqQYlHjx25QRiQ2HPIcJJUzD/3LSnl5Az
 +CQjrdV2dnFfgYI0cfJ9o8p9YV1RGtqJcy+s0IbM01gIsppk09IuT1rSm4lrJc8uqe0aSp9ELSy
 UfT8wzgrIYj/AVf+j+w9WzR4VyzJony2Jd/gMvYeip/ndZ5lp+rdGjJmgO9rG95qPamh/V2up8w
 bJ8ucXvQHd7SoDqn3sl5sho1+xwrxd7XSSJsyDPIBazuuIi78vX4UD9m5Wf0Zk0ITqoC0btzxT2
 JrinwUMkNL42rcMRGtcE1M7j5sCO4D32hv2dx9/g6DRstSJhfFS0YuoAp9sJ7bAbhOYsMsgH3Hb
 iGrWSGNrsX3IFn0/Gon1aIDg0FpkjL9y4BjVz0FbY5A+SGZD1o5Nc5pcklxtWN4yEsRIxXw/7V9
 Pnjy7EKuWj1l9J/DgiYUZJn62N+H3hTVPzjnIIusYb5qsmQvhdCpEd7DLr4cc+Ph3zRmmvp7G+X
 uJIC32ILWINvVfp4ak7+VmGQRAuXyk1bE7WMCmskegYt1hmq9lMb+4LMUREytKZtMBNml+sXwiz
 P6ch0yS6NHRFKsXtzo0oGoJlAIns2XabXySwSwNCx2Xv+R0/UYkJxL9bt96Z7v6wiHsI0lTtHWS
 24r/N3M/aDxX2oQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: BgRyzgjuApMRb5tnJYnvrzxX2T4gDmvL
X-Proofpoint-ORIG-GUID: BgRyzgjuApMRb5tnJYnvrzxX2T4gDmvL
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7d14b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wUbH2sL_sFSbtn_y6v8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX4S5eaFTQhiVq
 S1edfhGXpUP1jyD6QGe4lNOu1211OXg0bkNlrT+pA6OR5PHSfTRVSXjcnnnCUkzMp3rD/BKYz53
 uqiaMdDDkma7g0Nh1y6A5V5ozElm9FSrsZSSN/zyTGhTF74XKDhUGud0Soo4W4RHslGHu9wQDt/
 zOCPkmv6zps8LVrbIcNToMLoElJJjkt5ONV5cl8OtGUXBDu0CkQQtlpMc6xUxRkqKxClPn7th4I
 k90NKQtT+MKbUCdWVS7sPOR9MxAaWaMsjASiHZZazko5DrNu5sgv8QQLVNL5Nv6LmfH8vNTx0gp
 6qtHM1oJKVUB9UlT5sTgjwjIRiqSliqo+1VPftOu7zvJaXqJGLxbCMyfZulJeOyTLCYHZH9J6dV
 LMrWwWuZSIUBsrSsQbTp/MLovc5sSWmrApdRox9jJTrXey4sRXEKzviR6Xkqy5aipCMQCQWTB/R
 Kn4I2F1eXJNMJ2xHpLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_024549_259174_DA8BE893 
X-CRM114-Status: GOOD (  16.21  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/mdio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 44380378911b7d72e7289951fca90282d731913d..d7ca7fce7a3b86a435fac035534260146f114bc7 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -247,7 +247,7 @@ config MDIO_BUS_MUX_BCM_IPROC
 
 config MDIO_BUS_MUX_GPIO
 	tristate "GPIO controlled MDIO bus multiplexers"
-	depends on OF_GPIO && OF_MDIO
+	depends on OF_MDIO
 	select MDIO_BUS_MUX
 	help
 	  This module provides a driver for MDIO bus multiplexers that

-- 
2.47.3


