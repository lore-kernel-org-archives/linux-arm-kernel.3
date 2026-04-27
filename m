Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6CBFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnFC+THpzuBRYuI1QSSHMrOlp6CZ6opXo17NR8e9HW0=; b=FcN1FtwdzUYt+ryNmjAGSjjtFB
	eI106aFcM3vqMsXU262cI5rXYW23Zo7ZyRp4eRev6wf4MbI3cCM9dnlETFj4v0FIlhya+nWJYZb0f
	dXETrnM7ypYcvWUTJIqucYGWAy98thkowdSX6ox8dN4puVg98fxFkogpFfEdNxvbnQ7I45D1fHo7n
	LUnn4P+d13xuN9FMbZ5pe/Y1YLBVDPlp4osHHiIHr/hG3qf01bpGyI1DfQcYWpRWLGl8nsr4xCq0v
	ZMTIKgvk8SSqb+eU249fxjKQqC6CTvcGa4NoAqLrlASwPL+/mRk65xjVf9mpwI0Rcu5SJgEDHJa41
	TorMCBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIze-0000000GfY6-0gtc;
	Mon, 27 Apr 2026 10:15:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzV-0000000GfUQ-0efj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:15:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9NT1762094
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NnFC+THpzuBRYuI1QSSHMrOlp6CZ6opXo17NR8e9HW0=; b=HV+CBUaaexEgtjky
	3pmkSzER0s5JSHcZeuqQrhwwwBg3gdJBu/ooQ8QFvGtsDaZOcSd3pf1BTLvntian
	nW/394YQ9/VKcUcjN27DIIJ9vHUaLih4m//YKioPNtwSSTx6Du6U2/wg3SxbVFJO
	fwBKxErySXHzbKS6dCi0wqrlJAt2GSMwidRSGIq+wYsIodKQbx/hsCSaBWTh+kp7
	qTrB7NYYniYYj3xVIvanA7/A4ee7lBrr+Ym4BcsOyklB9jnmhX3qWBsqy/uANTEt
	V9IzJRSjQylMoxRMlgpk6uc750buGps+pwyrf4sw+rx8eULoProl1KvbIz3qQ7xR
	PlBdOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9dkb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:15:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50df4c130dbso166850231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284900; x=1777889700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnFC+THpzuBRYuI1QSSHMrOlp6CZ6opXo17NR8e9HW0=;
        b=ZMSy1TIjLbHY75+2dEAAHQ8/T6Ft0Z8r2japts0Wr2r7WlErudXALu4/uE+8xNnZp1
         ag55+rSl9XGjoIlPmoWemkPUw88WKetNbnT4/dakbhubEp3X6zTS8H48tFxX7bL4IaZQ
         sJ/j/bA+MXQ/sdkvitapshE9DApmnpwSKsy7lNK2+HpWrp4jxkGG+LcvuepNggZFv64N
         LMS1Q/+4BFg/JUMXLZQoTvI4ZkGRdYo5H6VYrj8apF4ELD1Fc2I5Em9pXC0Gc0qVBHVT
         3cZKSSkPuKwgVMclLFDpGzTe7/71FV3tL/F9g7qSMPmGBZtWTZPCyqZ+RWCfo6V3GMkX
         zzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284900; x=1777889700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NnFC+THpzuBRYuI1QSSHMrOlp6CZ6opXo17NR8e9HW0=;
        b=cBVcZHpBjW5JcoNWmk8EMtbt28bduKK78s7V0cNblOn5srr2ZKEAHPgTbn6eZkaP9J
         3SIoS5dnmNgxa7Y29yRycvO2RoVFarp608w/fWRXJsfvO8WzFdcFSHjiON4n5DXRdUG5
         RkJUVSGGXIqyjiVHB5G0nSlaD1squCEvQuOa7mfAOIhN8GhtldWQnJpsiDDRStLQLo4z
         a27iUXs63xbxDhpeZ7AQcNytwZcPUKtnto3xIvzhVo7eVRfxQ72pmN2z7+vLGe9RAgcT
         N1Bj4bh1b9iKLods04uIVhqH7R33cVf/5TMl9iZPb0i4KVZwmTRf1n8CsjjITgrCm4tf
         cTtA==
X-Forwarded-Encrypted: i=1; AFNElJ9XvfNR7ki+VNhQ9ybQWgfXDRJw/aeUHF1P/t23vwNfzYG+JPR/k+5sq3TZwa+mBry2VSh6Vg87efqywFaZ/hL9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ZgMRUb9a3PpBHZMsLS1SJ5nK9vtPMtYH+28rNh6Uk47esiq0
	h9P3vfeBT6zjOVZ7wpnrZwqZDQ+RY6MPyP296mzHKAHvhEoz2jcRT/EpkVjhoECKYqBYVGBgIcG
	esYaBX0Y9IjGW3xLHCqdZD9mUUU/T2U9rp6/52/atqVhEOostMoTy2Pake4+x38/t1GBxlaAjKR
	gPrtZKDhwEAQ==
X-Gm-Gg: AeBDietN/RfyfoJskdZYzIJOMEHGYLBC6vidPE48ZPU+XcsufNzpg3AMh60CTCP0Wgn
	b/2CSPp92EX7cTSnhz9Q1ukjXi1CzZzMI6hdP0LCny+NioLg8KF2Qe4DB1WYDJIgQaT85lKeJ3c
	BnVq7uu2q8xCQoJtAFdMUtbvR8v04+4mbxf78/hnx79mLOh9yr6HsCT4KrMWl6wTsjKZPvpoE+P
	tI4cn4xOGmSdaemgBnxhJ9a37u/NRYgBAPwjbXzXK+xg4rkd1Vo8Vo+xDv9SM2I9+Mkm5v9E/EP
	c9bWuT1tK3kRl+Gm0cMM9Pi+EDrRG2PszR6pnewrprvlEjXr34M6aMQALFDK1NYyCYI0wMkTQZ4
	K6z1b/7qc8xAwfMpyh8FCDUE+lJjdwcYOc7+K3q+YdIzHFC5x2tWHQXt3efUnaw==
X-Received: by 2002:a05:622a:1189:b0:50b:3128:9916 with SMTP id d75a77b69052e-50e366622c6mr541353431cf.18.1777284899581;
        Mon, 27 Apr 2026 03:14:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50b:3128:9916 with SMTP id d75a77b69052e-50e366622c6mr541352981cf.18.1777284898987;
        Mon, 27 Apr 2026 03:14:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:35 +0200
Subject: [PATCH v2 4/4] ARM: pxa: pxa27x: attach software node to its
 target GPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-4-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QUFXBzpkBmtSJp6dEvH4Bwph1Q3gQ0ja0Z2WYmUkQsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcW0gzVXClN5VVOTRxa+RE5TCaXuqQP71OWt
 hkwwqRXAPOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83FgAKCRAFnS7L/zaE
 wzOlD/9447Zai8Bs5wxsjdHZK9N3uqso6J3LYdYllcbS6cniDTtAP0pJ19XuWv/X+WMmsuehLfd
 TpsAK0rSkUaVbxICaSPlabuq9oPrHIliU6uISSQuthbFbUlWAdKEPd7Ra7XTsqad8Ide0mNN7zt
 Tv6r/BvCEB6HJs+dCE4tCn/PyeiRrngePZb/QI57coZsQRKJmG+++jxeCw6+afi/8mHuOV7wWsP
 u3EZh8mBSpGTxVZC6Crhstn9DZ6p/IgHOQo6oVofrRuNV85cEvT/has+IdwJIZzHS6kcMdraIZZ
 kQ8tqy30oCTzcfpI0mgMTpVHKAekYEZ0N4PMqzqif8L7n//56M/oe5HyHFKR/Y1aglO0DLTv8Hp
 ZWsF52sSHqRlj8KCGF85WBrpPSPuRqtQj67KXrMdjnMAfiIASFjLuzqY8Q0a3c8Qbmeb2DcPbM0
 7D8zi//6Z3ztZ0EWM2uKLt9HO7dqUxCdivrWwLXHg2uf2U77BaoE2aw/PAa4YoRvxiZMYnHCKTN
 dwyMqUB3Dgg84hFxmvAtsXBCzKJctRyqIU9AOmYALh6Xkh25zwOvteXN5rf3Rks5FLwgtQoibMI
 yDRsIsb6UsH+ZRuWh6jmZgvay0S3VHWoQ8BgrBrHekqXBHg6W9SBSdB+RD+0dYNepaupMjB09r0
 qj6wG3ALSRM15sw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5oU99AU2p89RHPmXxtOsoy7Z_fOcfFCJ
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef3724 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CBFrsqW9wnp9SfA-JgMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfXy5gkHFzDMEv7
 IdIpkYQtjAK47YP+1VlBqQxJEun1XbCCLi8YuYxvkpAHeoO4D8NRVftaSaA/4PN/wuTs1Sr0F7r
 qxMjXiZHIEEnGvpjwABxPBI/kpk6G6BJjIej8drTfhpsrYcmoHPI2y/7LmyZlZxMRLYYFZTnmWN
 W3DPtiqF/rhx++wMOZr/GGjzjP44rbrO2am8OQSD6Bt8sV+Go2L31x42tDfs7GTb+RpI1L1/AHD
 2VkbT8RGsEie51ELIz8fw1kHwH+Pef21EpblkW7/u9PrYYop5UqnTXlHlA3VxfLulnvFiDl/FNz
 YU9a4SPuPdr01/06zIxxemxIx32+T1V1qVO0XIZ5zmQ4Qn+eGrw7Ca0Y7uBohGoDvSjbqk3EFtq
 Nsrkx/z9oWPAktrjqsU1g98A6RsiM3BQxlcM5dhe6zl/J9Iave3ZxBQOD6eCKswlkxjLrqgMjAQ
 W4KhpEOvC2HhaZZPF5A==
X-Proofpoint-ORIG-GUID: 5oU99AU2p89RHPmXxtOsoy7Z_fOcfFCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_031501_222691_CE353352 
X-CRM114-Status: GOOD (  18.08  )
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

Software node describing the GPIO controller for the pxa27x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa27x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff63619790383859ba111e3efe7619aa6cbd248e..bacfd50939fd447ffa11d398867dea7fa638988b 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -277,7 +277,6 @@ void __init pxa27x_set_i2c_power_info(struct i2c_pxa_platform_data *info)
 }
 
 static struct platform_device *devices[] __initdata = {
-	&pxa27x_device_gpio,
 	&pxa27x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -342,6 +341,10 @@ static int __init pxa27x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa27x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa27x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));

-- 
2.47.3


