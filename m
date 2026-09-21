Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD7C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=; b=2iSEf1h1P7RcbgpzMjAQy8M/nU
	LdsKn0JiMJpf6suNx4BqxBQGYPOanV8IWsGa+3QM/3NvQeRFo5GXtwUlW3yQQWLWpomQ5mcY/LO6B
	5JuqdKheQunbaOKrqB2oo5XGuG+WSCja9cWhxFvGBRUldjnB+LtHZDi/Z6ZjR1Z5gt+FqAlzCouA+
	NEL1MVc7ZexrvNU8uFzs6z0wkRADpkWKufiUqmJyzEUS0ty7FLvbVCwVLlD9Ok5rylgTJEu5700wt
	dVQlLW78dMg5aCR0UI9mlrXaMkV6UHMBJSiE5UfmngDhYCLBbCtDiT21MJPwDwZWU+GrAsDq5/ksi
	AtEeoHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fbY-00000002Xki-327e;
	Mon, 21 Sep 2026 15:06:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fbQ-00000002Xhj-1mvZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:06:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGgY11696569
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 15:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=; b=KKZhVhQDb1szOFQa
	Q0LR3oKOw7/zH+3wL7uGLfo7252zbxEQhF34iXoUBY6S6Zw1ktv7arXQbOZ5S+/r
	KCgC+ZA4j5zZf5femY762M5qW6+dt9mIJYmH8DubMkvRdN6QWiRpjBxVV0tNVD8U
	v3BIaJZ5Mu7Qu3yv7fzxy3BDZIFxjycj/G7jHSIYocXLfeEstX1pCLcgpeqGUY1I
	GtZ4e7m6xKhSCi/gS9RVZZ9h7fHVg+2Wgf5T7/YmUzmvi09l7BwHVp/J6cUFozNo
	bS5RYlDZSMCzpehHFeMsaJ7Gck/OmlyWnwauET0VxmQczb5J2DyvXLPrK5Snm3k4
	PtzXdQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0119x6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 15:06:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so2692398a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003202; cv=none;
        d=google.com; s=arc-20260327;
        b=FSMhg/B6wsgZNLspzDGz3jPFN9kr+Z/x9sWar+NjccOBdvAb0XIc7Y/0bgEJltdVrc
         fRa166+36vocyDbgK8xlpvpY8seFW/R1TygNXDfERyu/FZNMWXr/6fdnvt4ttiTjhycg
         UlLK3yVM1Y2E0GuJ8JTKmDTI6pgi5Ql28K9DicXIQ+sqdWES6E+azAkA8pIOpyMDIvSN
         MPzfzcHdNUNz0Mh0WHhZe3oPW0matbLtiDOtHBjClAiDxSLxPcIbUpIimOl+5axzQhLS
         J3GaZrIYmTzalP713WKt8yUkiTuRjMUR8qicnpOumCs8DX/eiKKXIRtDG/5IcWrMpowI
         fXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=;
        fh=2jYZk5Uk74cuEwro8h8FGw1lzLS5jCdrR/1yLeh0A9Q=;
        b=sypreV7FTNAti/C4quKYYzAxegjlGjGEbyE+XJB63gyJ2i1PV1Ip99/YM+uWAZrFdQ
         5jSCF0x8roXxk2xEWqLQ0KyuSigBZXDYg5KtmZ/Mx0BdSZzwSc8YMLH4iF00/wBlerfv
         rCEYCxpY0ZblFKin9K6gvKZCJN3ovmG9zALa/V8hYifOdwy8MG4cRn/1IfW4OOoC+/rv
         BDlcYNCSLzG0OQP6SX4OiQEmFfLu+M9DTJl62zECGnlkQwj2QIfM0zMykAR4N9HBx7VW
         WKmnnSQ6Q6wPPn/2SVrh/dv8f9isuZz0R6pIUtkJ8dGAFT1oMNFhX3Shdq9RVk0+lEkq
         peVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790003202; x=1790608002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=;
        b=QplYnDWE+GJtrw0+98I0HON9ZHNSUTGYdFXLn52JwIkPTjQZCawHm2mvC7VzsYDz9b
         jpWkUcqwqW6BxKoFCkgsVJj3SEVbc1FoWZvZy2ZKHdYVrqbfxHVHaqYd73c73fddW6XV
         hQbOwPL0QLzqIJIxr6YV2unlUPEoemATCWqVoMs12SQFZ1WPZpxH8QHv6jNBxuTZULrN
         4ROHMbseCj6vyhtoRmkwQepxnQLeavxjT8xH3ZL+1yEe+TaEnK+kvk31LE0xr7Fly+5G
         tdKlbh4gCsCsgVYwanNrQ7apy5RJAqLxDHBLaQ3ByMxW/ith0lqZhlCR+TU6lOQawieT
         yooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003202; x=1790608002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=;
        b=sQGTpTTozJ6FlV4XRgJg+5FnkSVPWoKSPA7HzE8GosOUYkGC29vjjoyoO5yxk4Ma6W
         KVJckCJjos39LjaM42Mczg2YqxmKuMAvQwxhbEv2o6jkPcdPLqjMOo3R1ua1xgzFjPbD
         O8D12zYINnm1HqDPnoH9brLOFhZzQBuNyngfEQbTbgLg+k2/k1Dz8DkpAd2hdDpGuhP4
         ORoj1RFBz/2YoUSeFrTrKb7rMekZbXgOgPIWMTLb7pLbHj7JFX+irOQrWzedgS7A+NTs
         JH6JR07bqyny6Mqwfmg9J/CX23i0aU11zXxYws04tffR+IQ3SxGMB7TBcbbpqj9UaWLr
         JZOw==
X-Forwarded-Encrypted: i=1; AKwUvBwTzv5GZP6MO2V1An0q4OqaeYBlEug8tpmEZya09FRnzhsSvlYTCQCI88MaaAvgsnCBNjZp8zMk02UzE8GxPFK1@lists.infradead.org
X-Gm-Message-State: AFuF++kx0eI8qIECeN/L8WMaMRFHIDRN+FURWmkSwpReOvxRNkbnKqfX
	q+s/8uW2TsSY3n6/DlSjH4ge1Fg3A/d4gIw4lY5FfCFY+dGFnN8hrwVg12+DJF23tgeQ+hNCe7R
	pdnR3rsKgO9LX6VCMQNnmjHhAOxTVW9LeL5xIJ+xaPTgs4OxebeyK+/kSEa0eEYWYbr9S8aWHoN
	9W0zbbxEw72Yj/4MYp/tOch86GnaqYfZ3pPvEoTVZZ28H3P7zZmkcD
X-Gm-Gg: AYBFou2YSQptXKZ7Xe0HKFsznXXLht0qcY10BQhXp38gPfJSAzO0CcVuGyIR3dI1kjh
	IUUezKXjfcYxPTLZTo8Sy3FACJ5qKdua/7+E/oKupy+DQ6V3r5P5FhfacXVGWsAqJGVHGGaJLZG
	2ajHUX5MvIrF2fuVpbFeet0Jy+0BVhwxYexlD0/8hsDZJmYCMFv4RpZq/ohA==
X-Received: by 2002:a05:6a21:b89:b0:3dd:a008:dc38 with SMTP id adf61e73a8af0-3dda008e117mr10971974637.38.1790003201620;
        Mon, 21 Sep 2026 08:06:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:b89:b0:3dd:a008:dc38 with SMTP id
 adf61e73a8af0-3dda008e117mr10971909637.38.1790003201121; Mon, 21 Sep 2026
 08:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:06:29 +0200
X-Gm-Features: AcwNN1X_O2duJZUWs00J06LHNYx2Zq6xdcFB3ybS_8tk_DldgmJDaIQAUL-sBHw
Message-ID: <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary devices
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 80Xemz1EZnVZOkxhF5UyLfoN8FaeL9Dm
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab14802 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=R4g-3rje7_dzknkHWHoA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyMCBTYWx0ZWRfX6cSGDi0h76xg
 lWGHhEijWuVMxJswiKufd4yiXbDtKMuIpXe+49j4df9uiuy8c1axswzvLTcEjAaE6J+m5lh92Wb
 eXZz7qnriXlKW/JqlYK8U73fuU0ZfWWpDRCqz1JsztYRdp9XlZ9Zq9n/w8P5tjKggRrJb9pbmFu
 Ka9N8YXy408TvMx1b32NJV67zIgiqz5VlUd9sscu1xqp5dszQ486+kzQfcQ2ZP2N6HoTdfhD4hD
 C6GZS+Fuy75YuPLcXkW2mb9zat2hAhsjvTFztVrdcVynHC/AGnGreozm8eBagrBiPsNxb5NFozw
 6rYmDD1aO8eYCiAw0glJJG0ZYABBY1Z8Zy2QTF0XTp8QnDIQ2mhWT6mAqqFkUnDZOBJHhpQnmWw
 MuBCzfiQUILwtA/0WPxFX05zmsgU5qCa0nLcHZwocl6Rc0gpL+CQtTrd7giiXHt2x0i4ckkHoKr
 c9OYjkVIQGo584qXCqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyMCBTYWx0ZWRfX+wflsL9icKuv
 AuE3JhRZKdYSzcLFRZ+hriaCYXF5HSLu4ypDy7pVf5/q/fcc9VEFfbYsWj9WbfNJq3uenYnIIhS
 nJlQ+9G5lWDMBQ3QF3WngHZiRnHBeG4=
X-Proofpoint-ORIG-GUID: 80Xemz1EZnVZOkxhF5UyLfoN8FaeL9Dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_080644_595456_8E1CEC1C 
X-CRM114-Status: GOOD (  34.59  )
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

On Mon, Sep 14, 2026 at 5:00=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to multiple
> drivers attached to a single device node.
>
> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
> and registers PSCI child devices on the auxiliary bus. As the first
> user, register cpuidle-psci-domain as an auxiliary device.
>
> Update cpuidle-psci-domain to probe as an auxiliary driver and use
> the PSCI device node for power-domain traversal.
>
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c | 31 +++++++++++++++-----------
>  drivers/firmware/psci/Kconfig         | 14 ++++++++++++
>  drivers/firmware/psci/Makefile        |  1 +
>  drivers/firmware/psci/psci-devices.c  | 41 +++++++++++++++++++++++++++++=
++++++
>  6 files changed, 76 insertions(+), 13 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 207a6e2db70c..9c0334ee2ed2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21932,6 +21932,7 @@ L:      linux-arm-kernel@lists.infradead.org (mod=
erated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/arm/psci.yaml
>  F:     drivers/firmware/psci/
> +F:     drivers/firmware/psci/psci-devices.c
>  F:     include/linux/psci.h
>  F:     include/uapi/linux/psci.h
>
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index b88b01aa5829..f22e18b05053 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>         bool "PSCI CPU idle Domain"
>         depends on ARM_PSCI_CPUIDLE
>         depends on PM_GENERIC_DOMAINS_OF
> +       depends on ARM_PSCI_DEVICES
>         select DT_IDLE_GENPD
>         default y
>         help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..0ce6a83f6588 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -9,10 +9,11 @@
>
>  #define pr_fmt(fmt) "CPUidle PSCI: " fmt
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/cpu.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> -#include <linux/platform_device.h>
> +#include <linux/module.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
> @@ -122,14 +123,10 @@ static void psci_pd_remove(void)
>         }
>  }
>
> -static const struct of_device_id psci_of_match[] =3D {
> -       { .compatible =3D "arm,psci-1.0" },
> -       {}
> -};
> -
> -static int psci_cpuidle_domain_probe(struct platform_device *pdev)
> +static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
> +                                    const struct auxiliary_device_id *id=
)
>  {
> -       struct device_node *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D auxdev->dev.of_node;
>         bool use_osi =3D psci_has_osi_support();
>         int ret =3D 0, pd_count =3D 0;
>
> @@ -177,16 +174,24 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>         return ret;
>  }
>
> -static struct platform_driver psci_cpuidle_domain_driver =3D {
> -       .probe  =3D psci_cpuidle_domain_probe,
> +static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] =
=3D {
> +       { .name =3D "arm-psci.psci-cpuidle-domain" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
> +
> +static struct auxiliary_driver psci_cpuidle_domain_driver =3D {
> +       .probe =3D psci_cpuidle_domain_probe,
>         .driver =3D {
> -               .name =3D "psci-cpuidle-domain",
> -               .of_match_table =3D psci_of_match,
> +               .suppress_bind_attrs =3D true,
>         },
> +       .id_table =3D psci_cpuidle_domain_id_table,
>  };
>
>  static int __init psci_idle_init_domains(void)
>  {
> -       return platform_driver_register(&psci_cpuidle_domain_driver);
> +       return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
> +                                          THIS_MODULE,
> +                                          "psci-cpuidle-domain");
>  }
>  core_initcall(psci_idle_init_domains);
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfi=
g
> index 97944168b5e6..68e381f1a618 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -2,6 +2,20 @@
>  config ARM_PSCI_FW
>         bool
>
> +config ARM_PSCI_DEVICES
> +       bool "PSCI auxiliary device support"
> +       depends on ARM_PSCI_FW
> +       depends on OF
> +       select AUXILIARY_BUS
> +       default y
> +       help
> +         Say Y here to enable auxiliary device support for PSCI.
> +
> +         This creates auxiliary devices for PSCI functionality implement=
ed
> +         outside the core PSCI firmware driver. These devices allow PSCI
> +         child drivers to bind through the auxiliary bus while sharing t=
he
> +         PSCI firmware device as their parent.
> +
>  config ARM_PSCI_CHECKER
>         bool "ARM PSCI checker"
>         depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TES=
T
> diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makef=
ile
> index 1956b882470f..8e75a0ed6f74 100644
> --- a/drivers/firmware/psci/Makefile
> +++ b/drivers/firmware/psci/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  obj-$(CONFIG_ARM_PSCI_FW)      +=3D psci.o
> +obj-$(CONFIG_ARM_PSCI_DEVICES) +=3D psci-devices.o
>  obj-$(CONFIG_ARM_PSCI_CHECKER) +=3D psci_checker.o
> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci=
/psci-devices.c
> new file mode 100644
> index 000000000000..f1eca61e3269
> --- /dev/null
> +++ b/drivers/firmware/psci/psci-devices.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static int arm_psci_probe(struct platform_device *pdev)
> +{
> +       struct auxiliary_device *auxdev;
> +
> +       auxdev =3D __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
> +                                               "psci-cpuidle-domain", NU=
LL, 0);
> +       if (!auxdev)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id arm_psci_of_match[] =3D {
> +       { .compatible =3D "arm,psci-1.0" },
> +       { }
> +};
> +
> +static struct platform_driver arm_psci_driver =3D {
> +       .probe =3D arm_psci_probe,
> +       .driver =3D {
> +               .name =3D "arm-psci",
> +               .of_match_table =3D arm_psci_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +};
> +
> +static int __init arm_psci_init(void)
> +{
> +       return platform_driver_register(&arm_psci_driver);
> +}
> +core_initcall(arm_psci_init);

I think we should move this to arch_initcall().

To allow the platform driver to probe, the corresponding device node
in DT needs to get populated, which happens at arch_initcall_sync().

That said, to be consistent, we should move the cpuidle-psci-domain.c
from core_initcall to arch_initcall too.

>
> --
> 2.34.1
>

Kind regards
Uffe

