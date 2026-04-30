Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD3CD13D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxYfci1kXSVxnQ7Is9It7s1mhDgddxrEV+/CL+oUtl8=; b=jd7/HX+VaUQL6tuZG2AP2/Lyd8
	f4l3eiNkiV8VKKqhXMbSVb876JuEkveLBQ5R5bpUtlLZKfxzGeEbVUBLGvNeBWV/DW3m11fS7/GfW
	dJOEh03Ak7PKxVTMtdfBn/mMdcFUzJoc4Ookokj1UifACHUYBaoh0MFe7EIiqqj+5y78hk2ZCfLLM
	Jmyp7Wz8Ofhz6yj/UTLv+TB+jRc9fdqKlzfkFsTPcvdc28RJJ2ISC18YPudtGK7kQ0IH0GsZjTiJV
	DdU+T1BjViZfcOzRO2S6bWJuuIejiurE6tEzfqZ+yumtrH40XDd7uhHsvRLYtx2ZYAm2VfIlUEXaA
	4/bwqVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILrd-00000004stT-2neE;
	Thu, 30 Apr 2026 07:31:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILrb-00000004ssV-2RZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:31:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNuMOg3636575
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxYfci1kXSVxnQ7Is9It7s1mhDgddxrEV+/CL+oUtl8=; b=biQEilkiXpipI5BJ
	3ya0Lj73D3h7iTmWUk0Isp3hmgxiMFZepJVx6k4eAkdG0EvJZNI65pJSW54F/HYH
	/VTFnigFknR/CYAR5SmpVQgdlAz1xAdBUMPkF09gVI8zBKQ4YDvVeuHhBrrsugve
	WfShuZB/V6+xQv2DKwWB0No6gYMPzVsIFOAzAKwSDUJ/7YzIQkEKoOjI3cCKjxug
	KPj+LwwqewTkebdRzoKAY9kDfxuDo0Ff0X/ulc9jyGQwaqlqMT4xPAwvPVxgNJab
	L3LNzkU+IRXOkGa9p5wRnxMUNWSVtqtt2XeziAD23AyRqWmqJtjtUvOd31J1KtKz
	RCQsyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q1cva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fba8d8c40so12557011cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534270; x=1778139070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxYfci1kXSVxnQ7Is9It7s1mhDgddxrEV+/CL+oUtl8=;
        b=Tu1oaCtN3/3Q6rdo7au4GQIqDwHauvH46nUGRdtBV7EO0CKiedVSy/wFcVt5KFvdgr
         gd7ilu4d20eHn9vMoRl82ZWjr7JVmAwJJtURQKJ27VWctb5luNzxZKlhI6sA5Ix5BMhm
         ftTQmTqsi52FEJuGz2R52Og8F4WPj3vWVBWxoPfddtOz6DEEz2eODqMtDxeG6vymIctI
         rWGF2a5AZOb/vzS6Rmm9kppH6CHimeLBdbogkZXG4m6qzTemP1Tf0IKyGzFR22G6TZZA
         hTpszF+O76M8KpQIUgPyk2+sDDwlWMG8/dTYfKpzPp24pRZpdeSvMqOAironiTVxU+UC
         ZRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534270; x=1778139070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IxYfci1kXSVxnQ7Is9It7s1mhDgddxrEV+/CL+oUtl8=;
        b=ezGioEmSe0HVaI2DOwNECgMnH2cKY60gpTCN221te5+HAulVhFLfvCnmSKZhL2Z/GM
         SZDWGWcA82PHcgNURV3TzMhphQoSWlLWKlW1J1WB9Oe0YukvUIsNOIgAX4i1yieaHpv7
         8GD2Bmppk7AMCFIzXBDPAVEDyUMOfG8q9kTJRaYKecd646PV8fJ5D8h9MRe2BXTpCYL7
         hV71sfJnwIsz2RCY/9vzqb33SB/EquSYnhjTHK3+plTUOs9Q/J9iVO3A+dsES+rzkzS3
         o89XnMFabdkLtAdL52WCVtrRJYmGZMTK+8wnW5AxVq/ywYdZ7W6Rk4jL3IlYBNBDwcSA
         5f5A==
X-Forwarded-Encrypted: i=1; AFNElJ8vW4sqBGu2Opj3j4lt/XLZPJcLl8a34PfXHvfjh4gsn4XPwaEkhhmTooDfdYbYVlZ7Zh4lVJRSsVal3tci1FFX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw921BGkgq4ND1yPzRlhKQvZqsGK4IDvaUzjfj5Dc0Kt5ik8Oif
	UQi33CAmctOiamdhZnbFsz1DEJvYiiq+uAGqCpobro7KfrZLmMWQsErdWST/MsPwmzm8Jfd/vSd
	kdBuEQncfm6d82GQWfwU14xNrlfsBi/4gMXE7hHtXcXz4pAp+yRGtF0k4dxVh2iKzJdPuNxUVlb
	TktA==
X-Gm-Gg: AeBDievoM9IPYvJH9pRkcRbmY1dV4OSDCU4pS0bVVhBBxXvaQ4fC8iWG3u21mGM+wHI
	+dnZNvTd+00+LX9ES8/a9tm6nWAOH81pO4+EUc/x1UljNdQnB3tcaJ7vXnbcMSlwh3c7xAqheLA
	mqnc8iulgt/3Ti4J3wT5PErVt4GNGrXasm05lfHDGBicgpyTR3V1cqXHeNuKRVUiWriFYIxRJ+s
	utLYEG/3VWkMkrxILS6d5orKteDP4a8Zw+QghloUMe+cUrkD3BzVdUBcNdkzfG3iP/fkEEFgvE9
	agmZ6ZktExbmj3jqIMtzUJdbPOkCnE9g68Tv6XKlIpyNoOnY8al5eTxqfPeC/khBctLl4kRONLl
	70NEC+HyNviP7egET3J2B0JUy9qC367bON9LCMvHcI3gfehj5tiKOjuTcZXha
X-Received: by 2002:ac8:5a0c:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-5102ab5ce91mr26359691cf.14.1777534270007;
        Thu, 30 Apr 2026 00:31:10 -0700 (PDT)
X-Received: by 2002:ac8:5a0c:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-5102ab5ce91mr26359251cf.14.1777534269537;
        Thu, 30 Apr 2026 00:31:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:30:55 +0200
Subject: [PATCH v7 1/3] ARM: omap1: drop unused variable from
 omap16xx_gpio_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nokia770-gpio-swnodes-v7-1-c88f74c90dd6@oss.qualcomm.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J8vOAbxHqFIcemhsO1j1p/gwR3qJw56MPg1KBgWm1Zw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wU3IFS0fzm52KuRz8vZ9jnjkYXKp8dgiD8yg
 rUMlcVe6cSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFNwAKCRAFnS7L/zaE
 w06dD/4m9RCZVbL5FfpHf3Po0kybG/VDb7u9MGxFtkNWG5xQiIBAJB475iiNgui4Ilb6ysX3CFP
 FW6iC/AOp6MDFRfcNxEJuVKNS9uSIP1gCAnuUu0mcoeBCqbUuMz1sov3zIGB0EgQhC+xhWY+fjJ
 gWi4Z5D0jLFz3f1ulw4grvWwm4B3CC71KPbOIJ/IXFP29XalvEx+qfQ2INJwSHqmPS84xohI06t
 ZpIAOFw2H8GKeqjGZrGZELUG9NT+1/VvgETJqD57N8GNxpRJi/hewRe8u3DkOmDwUgGgK+Yzr0s
 LVqmAOuo1u41/st79UCc39NAKE4Urn4kZL8DdpThFMqCfjeu0jgAVR969FDPhzpI6FDQEzJ3Pnx
 nZreA7fqnu4pXkyay3EAhuBKFotprhRuF7GcuBjBAkwO/mRV+L7fpYdT5m0bK0w+vSbiPghwm8m
 AsbM3HlqmcLqGmWmT3wHZydHz8ifgpst5nGjnaZkPNN3GCGq6f1geqkpX+ew5eg1vBCgm5Lp+Hk
 398ejYLi6hbpjAbm99qXplqW6FhlCTsHNRSVDOJM37s+VrQznEKhqHDTKNs39gpYr3bU9e6z61w
 doZpXfuEpG+mUOvKuo0Rb6/EDu5tTl8KB1qlt7PFwTWKbCOnfcULJXFOhqcL3GWVq2Ok9rQ1pn2
 6xz0VLSU1838EAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: L0I2VzR26p4jl206INSAH3AgucXgH1sZ
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f3053e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FU2xtZrg5b9VnPq6Jt8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX3V/0yXtJDtug
 CF5RH0RqTexvJAb0GTLVQsurZwa5+fMklZS7qle+5Y0+3yibz2/tPqwqUIWjrzDuc2TdPUVZWgm
 rsE31wjEk1T47YKgtTsm6e6SbW7C/4V0/N2Piljbh2WMR1EFeJWlA9R5ot8wvOxn0IZ8Ukt3MBe
 6GtED2n1g3vbliyenoVGVl4+ZsyP3l9kbK6Wx1u4KUVM9f01IKMwzRKnsCodN6FEM2tzbWGN35S
 8nduezc0QpOh6gHETT56SglRSX+yb1RfctSfMQn06dB8fdAFfeJJrsNWayUvylGrc/C/BYEabO5
 u6Tas2BauPvN2RtV6wBJWQeFe6653YaFiDHL8vVACXYxMbshoohqGbtrlL21AdZ95D0cbdWIPXP
 LsO7hqlr6SXZuf6W1gzoPjr4XiUaURiyIlr3m0r+LQgDrAyY9BDFmDtnTI0Omuw1KLWci1Zcnvb
 bdWWtKE+rrCv+tTXoGg==
X-Proofpoint-ORIG-GUID: L0I2VzR26p4jl206INSAH3AgucXgH1sZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_003111_750577_31110BEC 
X-CRM114-Status: GOOD (  16.11  )
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

The pdata variable is set but not used. Remove it.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/gpio16xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4e73f20935473602ef6cb2f4f379c..e8dbe173bd33fae72c7c884f930a530f78096839 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -212,7 +212,6 @@ static int __init omap16xx_gpio_init(void)
 	void __iomem *base;
 	struct resource *res;
 	struct platform_device *pdev;
-	struct omap_gpio_platform_data *pdata;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -226,7 +225,6 @@ static int __init omap16xx_gpio_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
 		pdev = omap16xx_gpio_dev[i];
-		pdata = pdev->dev.platform_data;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 		if (unlikely(!res)) {

-- 
2.47.3


