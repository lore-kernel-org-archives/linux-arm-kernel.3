Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC81C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDr2xKpUyoKz6duCK7Yln8g9yTIWkjHlaDKvOTnbv9c=; b=xH4LtW/LrdlEme0IhoLS/ps4aw
	uWYr+zlYCFpXvgQC+VsPc2OVs7DmEDT4BYqeJUzsiHtT1BE8OYxxZaR53IYziZjEcXG9ZE9PiNKSj
	Sr4WsdAoYs+Ig8YIW2Fr7GqYlFL6kWwZFyRszaGLAVPXhKaDvvX44ctqJQCRiQ6hpQ2YtR2AfKR+g
	L8CSH5m15h9mfsIRUNyubRQcCyNYbeG4X1Pds+zaVaMMBbbp433YI2E207dHfJqX7XFJ7pph1L3y3
	a4lHqkyuSgPpysnkFdDBJx9CMj/oWBdVHgVK41qqJFhe2mFNFCgtJZUZTCYca3E8o2E5jow+FybG0
	ARxvfYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzRo-0000000EuKW-3x14;
	Wed, 15 Jul 2026 13:14:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzRn-0000000EuKG-1CAk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03C8F42CBA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6741F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121286;
	bh=rDr2xKpUyoKz6duCK7Yln8g9yTIWkjHlaDKvOTnbv9c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=C0zQiqHVQj0CobWYz7czbLZpE+KQkLNS/JV+O9OL8AvYUMwEmDpWFuFlOHreP887l
	 MhMtxX2+wPNV/P+hH2DmV0JFmjsKYfytZyC5qjcGqNXn1i86Q+mk31xrLNKzUWJQI3
	 xQdPnLuFt0PvIrIrfh8BzP6WNTdM2nVApL3cP/eo+OnT0Ce19p9JREx7RsQRm4poYU
	 j6cXPlsjMhFQTT8oV7W6NSSW7aulug+pgyLG+GINPwU6IxK0ydQhp3DanuRHBHPHxJ
	 dCVqMX/qp6AH2Uu1y3PF/62e3DpxSbeQ6gW17N/z8f4rRqt2S9XA7nClOvFqI6Cvpd
	 BwiFVkjDewT4w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c94d4fdb9so31659481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:14:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqACiQPIEpXdTkjtBtam8bf7oy9dBxYx+VuB4vYxdRmxLQpdkyPKH02FY4RoUNzv88xMzN4m/uVwZTo3+pgDeU/@lists.infradead.org
X-Gm-Message-State: AOJu0YznSEXkg6aNj5lz6hyqbxNOdnXJg+5+FyYRncdtS3dqaiRioHJG
	t+kSEwxw/MgEmraS6UtEsSqtaHVDIkM4Xf9mEIKnNDtgEBGqW3blOByDgxSCEl5Ek7NLDt8+Ddo
	l3Gzr480sR+SCBm+aqKV3q4yDV5sPnDj5W8r17f6Ysw==
X-Received: by 2002:a2e:bc0e:0:b0:39b:1026:e0cc with SMTP id
 38308e7fff4ca-39c94c88bf2mr49157651fa.15.1784121285577; Wed, 15 Jul 2026
 06:14:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:14:42 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:14:42 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 08:14:42 -0500
X-Gmail-Original-Message-ID: <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
X-Gm-Features: AUfX_mz41Xlqsl3ycck_QpukCeA4vsvH01ocLqEI9wOAfWdaf7PIm5nU2rkpdD8
Message-ID: <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 14 Jul 2026 19:16:37 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> The PSCI "reboot-mode" node does not define a compatible because it is a
> configuration of boot-states provided by the underlying firmware. With
> the new firmware-node based cells in mfd-core, this node can now be
> exposed as a proper child cell.
>
> Add the psci-reboot-mode child cell to the psci-mfd driver with a
> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
> reboot-mode failures.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
>  drivers/power/reset/Kconfig |  2 +-
>  2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> index 7affd6bb09dd..8c6b78ac471b 100644
> --- a/drivers/mfd/psci-mfd.c
> +++ b/drivers/mfd/psci-mfd.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>
>  static const struct mfd_cell psci_cells[] = {
>  	{
> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
>  	},
>  };
>
> +static const struct mfd_cell psci_reboot_mode_cell[] = {
> +	{
> +		.name = "psci-reboot-mode",
> +		.named_fwnode = "reboot-mode",
> +	},
> +};
> +
>  static int psci_mfd_probe(struct platform_device *pdev)
>  {
> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>  				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
> +	if (ret)
> +		return ret;
> +
> +	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
> +	if (!fwnode)
> +		return 0;
> +
> +	fwnode_handle_put(fwnode);
> +
> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				   psci_reboot_mode_cell,
> +				   ARRAY_SIZE(psci_reboot_mode_cell),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);

Why do we have to look up the named node here anyway? Shouldn't MFD core handle
that already in a generic way?

Bart

