Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFC0F557EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsGYfp7eRNGsKROuN/kDYDbT/Z1WAXabwZxt8YBitwA=; b=X4vsslqjLHKu93FoiCWNNqmg9S
	ghPwGKysVmP0XRhc/PkTUQIHlRaLEEU92f8kX5pBbDGNirHq5+w8LHY3nfsZmkLK2FkCPqR2nVWfU
	+pXjDyqynoOBTzPICZrrP5ymAyT3U9RL+lWt/WmpGpPt7BgU/1k4uruAjgqSgRkHDs/x9f+106Q+a
	oDyYaf2v873vZY3xM6gfMd8ck1Fmokx2wgowEyrulIa7GEv/z+Zf0V9tegGoWHbVIuI4Bm2OxOwwF
	Rkpe4VfApjl16Fty8rzRq6bzXYL43wfcn0B0/eZaW1NjT+2zW95Hlyc+zs148DvkWpfTC5Et7VMOr
	uSthBPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkHW-00000006cSq-1LmF;
	Mon, 20 Apr 2026 08:47:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkHT-00000006cS0-29d7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:47:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K57RW13842300
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsGYfp7eRNGsKROuN/kDYDbT/Z1WAXabwZxt8YBitwA=; b=T2x5KwLZUGMfI59w
	vwImH4L9HeUrBX90MONAzzTK7xaBo/dC9gEND02el36xuVkOPbU90kaQcEO/2ecV
	LySXX98L1/t0nnft5JvYTuFy1uv6/3USHGWuvfZUhy2EffvkIYhHBCT5yQ/W7a0o
	DZAvBGXrCeAVGK64qnePFhfwO7JmMJ5ggt+pAQidX0qwUg3jdue04CbgzDq90s5t
	s2X5DL1VEgBmvYbGq7imJ+1v6dF6SVt9AZMcWVGNmtUkhpLRLmpOrm1BWH4beE/g
	Ctm62mLnKRxp1lSsJae9bTYD5xeWIqeFOEE6A8hTMcZU8OUnGNtQaw6/crq3V2z+
	Tk85Uw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hd0tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:46:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50df4c130dbso31786761cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674817; x=1777279617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsGYfp7eRNGsKROuN/kDYDbT/Z1WAXabwZxt8YBitwA=;
        b=eqNPfsFVpULKQ3jOnWTHpIXVZ0oS89U9SnWXrrM0XTOhVVtrFY0WfSGqGSpZdTIHm2
         l8P9V63niQkVaMxrAiaABGGCkVpgMxXvUJnyLw7m4zJMe0ie3O4vu/qodookgCbMh9Hm
         GBalZ4FTxqirkDqcEPAQgignhIFfHDjovSh+yRD3ICr4Ox4F8ktqduKrVq3bqh3s+0V6
         LBf8PIFN6+pimDMG0SWF3jVW3GzmMP4oaKf6Ese5gwA9oYDrPkCabCD/FcvthO7Yv5O9
         NPXUOZxj/9jhvwc6hpzwtr9okhb67iUWmQFysZiOvo2mwb2rVPHNALhRlT2SLYKRGBWH
         OgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674817; x=1777279617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KsGYfp7eRNGsKROuN/kDYDbT/Z1WAXabwZxt8YBitwA=;
        b=fAXMpeAqYnYGk7hWorBX8I6wk11AhXPnX54TRtRPFJfawJjXceCOTfDArUPZH5wDNM
         khc+J8ByFoBCM63VKUCjXGeefgUBzy2EnPf5OxEAK2Fn+r9WXq9S/PVYLesW8yNMNlhS
         izDQgdGFBGuv+BIdSoM1FocU7Xr5TQUgHheCZkw9pQGOnj2Q3QUvcstSEaYmzeYxP1AE
         PhBrc6hKBA2vqSYMNH981u87FMBZiKQPUdZ3QqkWrER1h8eZk9kRzb65WJd+kGOMGs9A
         14w5SUkjzI2UONOcykIf9NcGL/RiKRCkKrqGpcL5BYtNFeasWL5D9svskltfaQ+PC52S
         AOzA==
X-Forwarded-Encrypted: i=1; AFNElJ/Pzzquu/r5lVBLm/JXgrI2tKYvbnW4bLSqWVGjb909FQjdEXMAKIg9ybE/Y7co7R8uFY0/05X1glM6tQSAIJI+@lists.infradead.org
X-Gm-Message-State: AOJu0YyFPYn3UjWTad3eicqXfnwDpE+wlTGo07tqFWALiLwQQtq9BSla
	E6qo/L63QvOWGtTpDxEe6accjFjDE0MjImJ3COJ28mDVGD4D4xqoZITTFWeTSTHZr3ha1lf7IvF
	/TdkCBllfCGipqGxHbsO51wF/0OGkMjCbkqVBBwZfyVONE/IsIKXk3mjNlvt04HFto2pVN1mPyU
	RDEw==
X-Gm-Gg: AeBDievE7v90lWkvo5PmK9SKEh1rbFqlp76w8/HEmd4mBxGgNOJcIM/jmIRbDmrsV6h
	TH0jH4I+UFjioJN/rM+XXkjm7KTIaXQfhuB6uSK6fDgmRjvjexr3nGR9rITCuWMj9LVXuGjJ2en
	s8jh2yuEkTA2U+YKkptupPriNaPYMmG4Q+DIaUaQkFNVHVXpxvs3fjTlG/0smXaDq5V1DV2YuzF
	bcGFLo/LktWT45Wu7Oe4lToCQlWgiptcuBjSpD10hDQJSy6olP5rzc0AsPKZHjUWErYYrNWXhUU
	ypw91UPqEQGyw67MUsaIq25Yc5NmVbgpzeZA3k0kHEKws91JqcxIUHXkfokEeIdhPyaCRtCzruX
	5+SbAvA8nf9cK5t+W2yGs89VWXw9u6lvemcYNTdA0H8dfxjusKb1niQfvrgg=
X-Received: by 2002:a05:622a:a910:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-50e3665175dmr118064641cf.16.1776674817165;
        Mon, 20 Apr 2026 01:46:57 -0700 (PDT)
X-Received: by 2002:a05:622a:a910:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-50e3665175dmr118064471cf.16.1776674816737;
        Mon, 20 Apr 2026 01:46:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:776:c20f:3f2a:49a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm36712993f8f.36.2026.04.20.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 01:46:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
        Jonas Karlman <jonas@kwiboo.se>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
Date: Mon, 20 Apr 2026 10:46:54 +0200
Message-ID: <177667481191.5684.11286552597215821404.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416154928.2103388-1-jonas@kwiboo.se>
References: <20260416154928.2103388-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5e802 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1kTrt0XSjUtm7xzPXtIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: n_7yG-bTtUqtkt_mIq00ooi-GX5z091V
X-Proofpoint-ORIG-GUID: n_7yG-bTtUqtkt_mIq00ooi-GX5z091V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4NCBTYWx0ZWRfX64oVgPoZVvqD
 BpO38z9ju1uzilrO3JKM2/HVZtM8xqX1H2uIIoKlG8iXM/bt7cbeUTNIkj6iL9aG3xaR5lHCgte
 g/ujFzwnQ7rnNL+MjCvRJd8T8FwThspN5rWhIso8MjAimlZVNZE3eu/gGoVfb2yXpvRz6uxeUAR
 6BiiyDsYfllyyQ1vzAdmcza33Jh0XY09fDDDX6/yL5mFL21pU5TMpCou3BVLOlwINtBKYap2R98
 5eFrwZ29uXIrYL7XztYhc6rhxazsa1Kl5I26JYDz/UshpQWWozebsJIj+hHxl7eTf35Cm7oUKgF
 YUuRRrCrkmM/U54DkWLDdeuu1OwiDjnx///qkNmbFzrEvuYscd6pKGa3sxJ7ExrMCnp8JbRgR2v
 fo4DrmTL8Petgv0jypGqsFwBesXIqjG4ckLPJ+RmHVv9bms9Y8oGnoPoXnQ76U5PftGKQrcXz0E
 9ak8K6keBqbgQZ7HLCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014659_623926_3CBF5897 
X-CRM114-Status: GOOD (  13.75  )
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


On Thu, 16 Apr 2026 15:49:28 +0000, Jonas Karlman wrote:
> The commit c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base
> allocation") broke GPIO on devices using device trees which don't set
> the gpio-ranges property, something only Rockchip RK35xx SoC DTs do.
> 
> On a Rockchip RK3399 device something like following is now observed:
> 
> [    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
> [    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
> [    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
> [    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
> [    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
> --
> [    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it cannot be requested
> [    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:637)
> [    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/led-0'
> [    0.212389] leds-gpio leds: probe with driver leds-gpio failed with error -22
> --
> [    0.607545] rockchip-pinctrl pinctrl: pin 519 is not registered so it cannot be requested
> [    0.608775] rockchip-pinctrl pinctrl: error -EINVAL: pin-519 (gpio0:519)
> [    0.610003] dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -22
> --
> [    0.805882] rockchip-pinctrl pinctrl: pin 547 is not registered so it cannot be requested
> [    0.806672] rockchip-pinctrl pinctrl: error -EINVAL: pin-547 (gpio1:547)
> [    0.807301] reg-fixed-voltage regulator-vbus-typec: error -EINVAL: can't get GPIO
> [    0.807307] rockchip-pinctrl pinctrl: pin 602 is not registered so it cannot be requested
> [    0.807970] reg-fixed-voltage regulator-vbus-typec: probe with driver reg-fixed-voltage failed with error -22
> [    0.808692] rockchip-pinctrl pinctrl: error -EINVAL: pin-602 (gpio2:602)
> [    0.810279] reg-fixed-voltage regulator-vcc3v3-pcie: error -EINVAL: can't get GPIO
> [    0.810284] rockchip-pinctrl pinctrl: pin 665 is not registered so it cannot be requested
> [    0.810299] rockchip-pinctrl pinctrl: error -EINVAL: pin-665 (gpio4:665)
> [    0.810960] reg-fixed-voltage regulator-vcc3v3-pcie: probe with driver reg-fixed-voltage failed with error -22
> [    0.811679] reg-fixed-voltage regulator-vcc5v0-host: error -EINVAL: can't get GPIO
> [    0.813943] reg-fixed-voltage regulator-vcc5v0-host: probe with driver reg-fixed-voltage failed with error -22
> --
> [    0.867788] rockchip-pinctrl pinctrl: pin 522 is not registered so it cannot be requested
> [    0.868537] rockchip-pinctrl pinctrl: error -EINVAL: pin-522 (gpio0:522)
> [    0.869166] pwrseq_simple sdio-pwrseq: error -EINVAL: reset GPIOs not ready
> [    0.869798] pwrseq_simple sdio-pwrseq: probe with driver pwrseq_simple failed with error -22
> --
> [    0.940365] rockchip-pinctrl pinctrl: pin 623 is not registered so it cannot be requested
> [    0.941084] rockchip-pinctrl pinctrl: error -EINVAL: pin-623 (gpio3:623)
> [    0.941823] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: Cannot register the MDIO bus
> [    0.942542] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: MDIO bus (id: 0) registration failed
> [    0.943772] rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -22
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
      https://git.kernel.org/brgl/c/5cd9c6d332f46d1de8b68117fe2a3f1b08ee80ff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

