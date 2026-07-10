Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1420C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=; b=YPTbdYc6f1ULFNhueOkO4YYLWV
	EB8RigwCVvMK6Y0EZftjuYTVH7lcJk6eSBtNh9nP85aAzDnZtndIqsGlpVrJbOmhkO1uClDC6yYyg
	/kdFua9d62DR3pXLAy2jk/fkoIjgwwaeTBs/Ch0cfyZ7+yQZqUaroEr+ktVwx3qwQNXu9BWtoxj77
	Ue0y9NNqSpn5wG++4zSwLZeNFdY3tbOEfRiTux0EOLM9+vM+Jn1Qzfha+dlWdptGCScx6dU1/7qUg
	RD6TTD9nI4hv80PASlCBpaTttFFTVludSm9fee+yJw7bMkhYusHgZcRWpqTlos4n7wlLWQpxy4R7G
	4MA4Uw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiB9G-00000004zac-2gx3;
	Fri, 10 Jul 2026 13:20:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiB9E-00000004za8-0SHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 13:20:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6YDw730199
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 13:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=; b=FuN5/hxmAGVOeKhz
	TBXLUDz7Km+ZWilvTYvYtq3PFQOnOSWFHA9opAz/gllgit5tdnJLEJoQDle68SNV
	pL7XLqwHz+8JmHFQz633EBnbhjNVFtvXiT/nHHc2OaWH9eGzMf8r0XR3baY7F79U
	3c7cgG2tN54fgBFVhUMmCUf2TKm/5JzINDRGTYay3B15v1bou64+t5n1DeV6tgmO
	H47tazfJIhW0OLhyODJadCuDBCnO2NQaN5gYP8YLWR85cvFVMWa+LNh/d78N3e7U
	uAiPlZkQqYmN5LTQQpcP05te26eHk+Qz7DPUrRcN0aeTjD+h9pRBW1UlA3AOlqG/
	emJzgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24vctt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 13:20:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso199796685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 06:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783689606; cv=none;
        d=google.com; s=arc-20260327;
        b=QbLVBsGGzRfGv9E7f0nLsShVAzVxt5IpV378bMcZf5DfT1hecq5DTBidDvgPBljJU0
         skn7egavpD3vo6NrU32aGdkhYXDIGXmKSCDIOlBhALlmVDFPBRQHWEhywfHRdBbTw/N7
         eH5azrbfwVB3jeTTZB/BHKMFiwVYn7+tkoVR1lSo7xCiDns/pDR8SiFUuu2RvSao43XK
         MyI0Z194d1K3FG6wDwGPislxpjmIZaZmjBBVQMe0+V2PG3Osdft3iCg6ipWKMXwC9Vcb
         Ff40LgZ4wzuqnh7Yzyy8mvHf/PrlkG44SznhrX+5/zCDPEQNPNXcVI3n6sXEPl+DfQzr
         16rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=;
        fh=HrbVsoSgDV4by/0xC1D5YV7Bu+NQJ9QFlFBN8JcpxeI=;
        b=DcCiqvT/t/u4/ZcZ/7eGIm+VaAfIuiZjYnegCCulXiBCErIKCOb6ko/inQo6p2/93s
         G7tEOYgKphnR96D08lW+DenVbDN9zgbvuvb2eC0Ded9qMzIvWz4Kx8oUqwKa1qSVzGpE
         xVfH5aWM8LHmIKvBaIwIr0xEQLbeSf08FFWroY6SUKkkdN07HIDxj2DTzDNRylZ9Pep7
         W7ml5h2/fggI9KEMwMcBstF0csaDbXWNA3cWiVB1DEvH44tREgKeFC2cGOuz6NofrzNl
         tUTXtgPies7ff/TPahtl+f3PSE18Q5gAOFh6/lt+S3EiE8O0jDNVwbhAdA7uCkbNRRkO
         7GBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689606; x=1784294406; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=;
        b=TAucBqs2uqELPbaU/6HUCEiLeXpweFNUwqCl4VY3Fo5g1fTO2Thp6Sjic2WlHSeVEd
         jKx5Dgvmvkh1vwj0r0KFYJZ4zqo/EcU66UiYrmUzT+8AY/7MXRqiRjjCwUxw+m4izH3y
         qQdZ72/xY9wgAkgL8Y4k80yQQcwijdnl7mo+R8k6Eiq06U9U2sfjdkVEYpp2pCRgXOBK
         kOeAsPw6+p6gK4QQI1aUoLgb0ksJbgMmUPuTo8DXLabxxIOp4c4ccaTtMNiU7RdgxtFk
         B2XIoP1NSp5LP2h9PL34T+bLfXVSbnksKkv+jTWnTrEcUyWZll2jrk2h+QMyIWneBaDW
         AErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689606; x=1784294406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=;
        b=aCZdtIdsh75x639HJYxhVXTAj89qdmFjMcgFBJssetYTuE8koItpAcDFQgUxjIT2kg
         wwkYscQ76scG55BqFI+1jfgv/ISkfD9s8zGx4iePE0ldEE6DY8VDSRGenP14uzs2hM5o
         eurHfsZaKgKXiRsfUl69SYvTHuh3qtbqACmT/1ecLcCG0FSv5ipRf19RKePSJE1G8pLV
         S721x7BzabY+Qe0pLA08y7o7B3MuJpzc9ieDl0WlpVH8T358j8peml/35tLQPZzrXcKC
         mbtIWwSXMhVRXOvZOCbVp42exj13Yxn6ing1bT0xtih+GfrvPyvuvfqwzNIm7JAgKc8p
         2jzg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9pN3lUXb5JhKEM77ozHCCiGv94YRaMHrtlUBrYKRwHVZEUVkddXH80K0WV0XbW1dIqW7qXUW2ydAux6H9+lSN@lists.infradead.org
X-Gm-Message-State: AOJu0Yywi8uktaepJ+b9CtTGyEfZ9azRqzFk94FAO14UzJzcyhRVwXNU
	GdXS4GtPzZV3SnWUVKdvFtBEKHdp1A23ude1IzVRQaiXFcvVobtSm3O01aiWE5LC9s/6FCxORBZ
	hAXMoTXSjK/fp+An+nhuByE8jn5JRBnsIQntdTjydKmlUpW8Q0+D0LAQplozu3Gy9MGUk4nDT6r
	hl4HA0+6I0B6YK8jdW/bgZyIhfuTwT9+G0HT3t6PGFmb/3/wFMy225
X-Gm-Gg: AfdE7clJqiJ3lmFwRb2WNMUtp1lmTacypVUhIYkcHNO2U/FKQ8b9qexjFFpAX/yMioR
	nTJXE8fUCrlNdLS74lNFBBIwO9YOoZQs+dMnK4FwJQcyOO4DbpH/lj9dkZWkP6hxm4XATnq5bee
	YeJu6Ldw9sfekBiFMFGzpqy3tAl0t8zd72tMmoVSN+XGP0OJEUmFB0m2Pzzz7bsjBBeOlC
X-Received: by 2002:a05:620a:3703:b0:92e:5949:3567 with SMTP id af79cd13be357-92ee4b9c9c0mr378847985a.14.1783689605921;
        Fri, 10 Jul 2026 06:20:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:92e:5949:3567 with SMTP id
 af79cd13be357-92ee4b9c9c0mr378840285a.14.1783689605263; Fri, 10 Jul 2026
 06:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
In-Reply-To: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:19:51 +0200
X-Gm-Features: AUfX_myX85sm0CK23HsaVBWLtyuOsQFVaWPiXZvcMl9d2lwceyk99PJTRc2r1Fo
Message-ID: <CAPx+jO9PrycaUM2j+BS=pa994DzWqYN_yQQk7=pwkq+ik-xeFg@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] mmc: sdhci-esdhc-imx: fix SDIO suspend/resume issues
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
        Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
        s32@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: mL3nuQuoS8fw8LPsWTdAcnz9kCCn-7ms
X-Proofpoint-ORIG-GUID: mL3nuQuoS8fw8LPsWTdAcnz9kCCn-7ms
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfXxeQtPYx079be
 jxLapkV1J+u+jAdv2/4RKTdcP4ypTWPRIr2bQvhRoCqSu+nDCq28j3oJ8sZmOnLfTF2TS8lsDAc
 g8+gQ/Z522D2blnqGItj7u+OQh5jjEg=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50f186 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8 a=j4ls_bG9junj-QLuZ2QA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfXwJpdpgzouQCy
 6zk2cT0fA2YT9PFY1cDJdDaFvFC0yotiV0qUPNs638MUuxnA8mExbJThdaNu3LicgE6y9BEmJ6p
 fVx6SDh3xFBRzVuz0ZNGRetyEqGvs08BzHUzh8fqcmspttKaYv7WO9pWNIbsWxsjxHV5jxaz/So
 QbO3kX0ZssvUDqw8yaVRYqT11hwe9CLSL8RVTn/b+0vuTpqXjtPZXCe6y+CahBDHn+4mIPMc8ut
 xHwR/OUP+tTZYkThZuJSgmkeTg5vRZY7nD3YIeBYlOtHKD5MoQ4yAbT17gKB5bm1vc08pJQPYpv
 8acibGhkD8xLw7qkujBhxOghq1ITvKK4+ILJ2uAU5xwR2YkvY+Yg0Zc25lJdY4ElgAtQuL3yIpk
 3q/KR3nkmkDA+fCMm8Gyif2RdByFpa/IoqxVC4mYa35kto6vKJT2yUWToP4x1ZGEAhhxNMX4T2P
 eNqFjJky3/E8VrfHNww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_062008_263635_E1DF2014 
X-CRM114-Status: GOOD (  24.33  )
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

On Tue, Jul 7, 2026 at 1:00=E2=80=AFPM <ziniu.wang_1@oss.nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> This series fixes several suspend/resume issues in the sdhci-esdhc-imx
> driver, primarily affecting SDIO devices (e.g., WiFi).
>
> Issues fixed:
> - Tuning delay values not saved/restored for out-of-band wakeup devices
> - DLL override lost after resume for DDR modes
> - Pinctrl not restored before DDR_EN is set, causing CRC errors
> - Unhandled interrupt during resume causing "nobody cared" warning
> - Various error handling issues in suspend/resume paths
>
> Changes since v4:
> - New patch 3: Fix esdhc_change_pinstate() to move IS_ERR checks for
>   pins_100mhz/pins_200mhz into their respective switch cases, so that
>   legacy timing modes can still reach pinctrl_select_default_state().
>   This avoids log spam on resume for devices without UHS pin states (Sash=
iko)
>
> Changes since v3:
> - Patch 2: Remove unused 'boarddata' variable in esdhc_set_uhs_signaling(=
)
> - Patch 7: Expand commit message to document intentional skip of enable_i=
rq()
>   and sdhci_disable_irq_wakeups() on early return, and explain why the
>   PM runtime usage counter leak is acceptable (Sashiko)
>
> Changes since v2:
> - Patch 3: Updated commit message to explain the SoC IP integration
>   detail about internal loopback path change when switching pinctrl
>   from GPIO to USDHC function (per Bough Chen suggestion)
> - Patch 5 (v2): Split into three separate patches (5/6/7) so each
>   patch fixes one problem (per Frank Li suggestion)
>
> Changes since v1:
> - Added patch 5 to fix error handling issues identified during review
> - Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
> - Make pinctrl and cd-wake failures non-fatal (dev_warn only)
> - Use esdhc_change_pinstate() instead of pinctrl_pm_select_default_state(=
)
>   in resume to restore correct pin state based on timing mode
> - Skip pinctrl restore for wakeup devices to avoid SD bus glitch
> - Check pm_runtime_force_resume() return value in resume
>
> Luke Wang (8):
>   mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check
>     for tuning save/restore
>   mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume
>   mmc: sdhci-esdhc-imx: fix esdhc_change_pinstate() to allow default
>     state restore
>   mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on
>     resume
>   mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled
>     interrupt
>   mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
>   mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
>   mmc: sdhci-esdhc-imx: fix resume error handling
>
>  drivers/mmc/host/sdhci-esdhc-imx.c | 84 ++++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 27 deletions(-)
>
> --
> 2.34.1
>

Looks like this entire series may be material for stable kernels, but
perhaps it's easier to manage that through manual backports to do the
quite extensive changes? I can certainly tag the patches for stable,
but in that case we should have a fixes tag or specific kernel version
for all patches in the series, can you please help with that.

I am leaving a few more days for reviews before I queue this up for
next to get it tested.

Kind regards
Uffe

