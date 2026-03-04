Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA0AEB7EB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=hddNXGFh5YSFG5vvBEXm8gpQmb
	7OZyUQJDs3BY7X8F79a3aRD27TU/an16cXuLyy4krqO2CjwxxI0YEj91RIEDDnRBX59x6x+LSfkuf
	JUNoEHyhMrLPOXQrtA+lUqQX9gCl78LyqG14ng3aTu1nQS18mmtH9vA/DsQ8Qd9/F4mhm+9Sttkkb
	6+vvkUMHyof7/YzbeqevnPrN0NYzPenFxgP6dZwoWUs4qDRskPad+sYT48vVdNIq/DNEHAmlKtHpe
	71X36h3TVnmtg24UtNcjUID3KXo/yrQ/sI9DRKCa1Wvi4YWDTnWJOrqzzQd2X/tfMI8LvRAHa3OSP
	F/u9hpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi96-0000000GpDj-030K;
	Wed, 04 Mar 2026 09:03:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi93-0000000Gp8J-0EC9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=PSU0r2v7rR6BsOAUDVXitc8NIl
	W85j9rJVGWU1tgdiEhomjJkecDAfXwieH09FovSnayD/OXse+Knz+K12bsRyBCxRCqZtbW1SEZlV9
	uatewEF/BR5MOnqLb5JggBvbJAFI+35Yk3v8v1ilb80GL9erXNBNq6Mwe3wsDeVGQMuRPVtFdFGy+
	ABC8JJcPo4zmYrD+mQ0SupUVchxr30k1Izi7d3kd1pebjczyoVSFDzFJ60epkl8x29JBkeMNFqZjf
	dQZ3Lpnp6FthjXPeIKJFbrVapVDu1Xp0hrM8VJOvOd2ntxeG29H8taabNiIKTqMsw4n7FhTwyT5KH
	H3ant3Ug==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8z-0000000D1Ar-37JM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQNS945105
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=LZ5ZeC1kqTnN1jFh
	vCca7TV1UKLuarWNNA4j74IoHQZeS4rJ8wyjWtEjFDwOeF5LL3i4PnB/RtNWZk9c
	WyhH4S9YFRvmPpc5DDWtNq0Lq7gVxrQuyl7jXzEbNBoJOvYqY4FEi2nhcWKRIYhc
	Zn0ZezifGODDAv6RguH2+n4lz6j6XJtVzi8WCuvy6g0/Rm2g1Za1QiGg18MnZsQt
	LxXLnZIpg4RalfuDBpF/CIraKi91ur9+sQIPVX3xDa9cuFhzDc9DYM+q8+wJzJlF
	TMjqx7cw9Gq5Cw3kk2q8+PQ+IyRTcHcTOFocmDDfXcv5qgLhgSrVLF0TRjDNjCBg
	YOz7wQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfcd1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:03:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so4094916785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615027; x=1773219827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=czylflvMYKIzL+VpdhdjFjZYZ8FZzHCCiXAzn1A3UI82zzzuR05vGMEC/pRxIxFmTL
         8N7FCFouVmaPc3pwe7h5m6SXwKc5NJ+SjgVf1vuPWYxcz3zuLmRVD0RaI363cC4VBSd9
         lvkCY+T5vpueVJZFljNcInh90yoyqGhFIwyELGBD2XIamr5efBpLevNQVAqvZ4pCA+e9
         hGgNlEF4hOG/AOP2QzHbyeY15gvK7zHmNa24xGz3B+PD6fjTJ4QGrY1LzNumKb76i1Zr
         yOXuV0sDhLFil3dy8ncrinnpfBj1qDxHq6ocpmkzjqygiZRXphspz7uo8J/mLeUiceL6
         idzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615027; x=1773219827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=UmMiygHH/yQHBhGg0toKEZ5rL6ozGAFDjIxqZ8zLdMgG6+gxVkJeFk3s2/phEkk6da
         ZvArhAJXlycYTD1GMRQbNHYGkyHzniqPJDxahSMss6/PLfvZQWKwqp3aAWpry7wndKJY
         8Xddxi9Djrwv1lODj6PpHwRFDdISm6NBGkDVc/FlBSXQ2soB5Udn7Qy66MS2XBDkWZls
         3Zes2FCzDLHcERK8ZjyKrxueObeLhVtJWejt4ZRg+b0MpPSEerTZamPV9izWm/F9WKKT
         M68dQqaio1wqRWSClTf89HxA7BlncUwzP3gih4BXckZ7LQqvFkUNt1ir8VNMPC5TnZhM
         H1sQ==
X-Gm-Message-State: AOJu0YxUTExyWzsHy33F1OBsWoqfs71F45R9gWbZRKSAp/bYVFEeyTEi
	neOWPawJYDI6ZnU9Y/VaMykhci6kifA6js8H37K6xYCZ6rgoOqmoqlAMMkEvwamKD9dKmi19hEd
	SLZeNiPtT9M8gTCJ/ij3V+rQq6EuD1jzompk8ASL1zfF/EmHAGY0Bhjhhzbjt6Xmpi4VYF/XLMg
	T/Qw==
X-Gm-Gg: ATEYQzyDPeOJzBV2cUSlNnY0ui1LD24+PtaAdB+GGtynVJI1/16Ht0bndMNhXui4d8X
	E8gwADY3F+rP0+gczVvHCK/RrkdZvJLj/TAFkqofgaGhjR+0AV+6k4buFNkAIeUmk+knZ8mQGVC
	EtwlWWr4SCGoCpY1NPzhBeSWin9VrXv2mEsZaPqxQalCExogILoHPrlobRaknxYrcowsIwVx/qd
	EjEuJeGq3AJjHsXDpFu8t7NQ4pf1qtcQ71bfF7oc4cv9kiWXRYiwlKkPdZPJ34AztTiYhp6qrDm
	Bl9Xytu71mUAh/7U/Y27/qo5JqqvL1fuvqiWo7Rp4UzdqN15yhdqYl3BRM9a2u+vnopREPOYtER
	UNldrCprvg3DX4kfCOhM9Tkv1y4T00PPkxpdopX7fw3r+x0YI9GGX
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152245185a.41.1772615027094;
        Wed, 04 Mar 2026 01:03:47 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152238485a.41.1772615026584;
        Wed, 04 Mar 2026 01:03:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:35 +0100
Subject: [PATCH 14/14] media: i2c: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-14-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MCUltpFZ7WmEs+Zx30xfCDFOTCP7ddjGHJyyrYpihXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U2S+uVTRDUZjbW42G7Pde+e98yExCfHmKSl
 HuuGodjDTOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NgAKCRAFnS7L/zaE
 w04sD/4l9ifYSWVyk+wcaQpjTACkURD2eCeWi7XG5/uxKcFxPRjOjYbnVCNmKnRiNYQHTnOdZAD
 RHEPNL9Tmn5V/K3zGBvodWKK7DoWQJZcGQLrC8VNmiFODSfkjheHHtNx6K9SzWyk4fsz/3U9/Do
 uRHRJZ7f7yJAP3QJaZ9QxWkzuAC8If42NLay9hfVcfo+kS0TOu1NNRM+6gXMA5Y/pP4FlXYs8DC
 IsZC4Qjx9Hx0bhbmMqrIpAUFk9OaN3t+oV92DLq/zFIvuNHMy0/L8N/wiyzmLbnZcfTpsf6+Qgp
 4P2FgxgqxO9yyi+cm3IA9XfiOCzuJOPteySq4NcdBekIwuXhYMeYRNqInw0HjhWFwbiAeFthwO3
 DOQAqM86R5V0bfFnCvwu7MoqjY1SjVWit3ZOt/iTOhJSvBydJJ8pgS8/ULEYw/m0sZuvYNvGOV6
 lYD11td3ysN/HbFMLVs6zX9Rr75VDl7CdXbXSc4aQbBdsN1WHf0tu+5dKq1slodk3V/ZxT2jL86
 Ns5Z37xaPgZ8pZRZw86cfDDtlRD4+3qaW4Zkd8uc9TQlPBg2iVpIMvoZdChHXBocSpd4F921tHV
 NqGZ8FhAn8Awi3Dn3ouTs3qouRo73WZp98ukYqMVfXEjl4gbfeCP/mjH85au2MmJuJ/7PUDuHTk
 DzYrk83TwNVNPsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXwfe2IHvL/z6e
 18twLBYjEy0yYuCvqb7lVaohOHvSBGCidQTLjBi1Y+X2h1+iVLBiyOpVsq0+vLytDZbng6v3Nr5
 Ga4nztLn88sF46EWm4H9OrnOrgtX/psQapOylle8cmPrilLI4VAk0RRjrNnM3QgTgFIT3C/f+hD
 5AWrruj0p8LRW8x4Dzluy3dzsuEVhxfNiXogs5Id0F6pkrdjjtg00Q4nMVjE7LYH89zF3k/9c4d
 W/st7pfDrpj9S2hC6yJLq9kBtATKMd5gYT/1SWdfNM1hNFHf+cmgw1Q4nugvukSW5D5LJwmJShX
 gb0eVnjVgcjbV89FvUneuKofjny2WHwT2O2YnKYLY0lPpKynfYrDFxovigmWj5Li4ms8lGt+EnV
 z+uuU1OlGXYZNu/MOHwIPVQ50X7QnGlJSwrq7DnC2FMfpATmVfV2YX7Nn8OoeqIiBBOX3rQPHvT
 uVBgu/2mgCUyWvlY19A==
X-Proofpoint-ORIG-GUID: WtmdDg22gfGCSjDkSO6RJg_kP26_RCHt
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f573 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WtmdDg22gfGCSjDkSO6RJg_kP26_RCHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090350_012372_C40FBB4A 
X-CRM114-Status: GOOD (  17.04  )
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
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/media/i2c/Kconfig | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87ab350060567f578960c0e98940d6d..40b6fa3fe38b8d64d029d385f1acd1de4480aa69 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -237,7 +237,7 @@ config VIDEO_IMX319
 
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -248,7 +248,7 @@ config VIDEO_IMX334
 
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -268,7 +268,7 @@ config VIDEO_IMX355
 
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -278,7 +278,7 @@ config VIDEO_IMX412
 
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -689,7 +689,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
@@ -1244,7 +1244,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1282,7 +1281,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER

-- 
2.47.3


