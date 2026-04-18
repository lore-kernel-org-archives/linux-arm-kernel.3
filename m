Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46018F99C7C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:From:To:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPEjuovbiV7/b+fXiZeM8LNZerCWd7HSB3MwzPR4JEU=; b=ChToNsc8I/FNihe/2znIg0UVk7
	0BcE2E0KKxCTXXyGkmKFVwx2ZvHzH/1pW5X3vz1HWM5MeC92lGpQ0XbF+GW+SbK70y8qYirAG3l7Z
	QwMbfTFB341X8BsTEH0PWi4HqP/nkRxHd65b3XmROsIw1qQraMIlmVtc2abXBE4pa7oevwzPSQAoW
	mTsf3ci5Efd969i8iUV2/Ehy7wMZE2AU0y69hj8lojTZMJlTn6bik5uIqkIPq4umIJMCNgGWVcf9F
	4k+sy7Yzc4EhhLF4ASuPcZL240rO9asyRReXf7BiVNH+8G2uRkBsoPHSAZfDmj8Zkn/bELlFrSjMC
	VIVDt6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE3mO-00000004wBm-2rwr;
	Sat, 18 Apr 2026 11:24:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE3mN-00000004wBS-1a8Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 11:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCB8D6013A;
	Sat, 18 Apr 2026 11:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CECC2BCB4;
	Sat, 18 Apr 2026 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776511442;
	bh=eEo8recsYatthAVX8i3XpCfdJmBlTwOldwA5txXfTHA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=PRUaJJ1iM6epHYiOIjQlTfnjmSXbddoHrBtt1ltAbN8rOdRMRccEq7H6dQsuNspFe
	 dKTAU22L1zT79Ep2tGhkisCBV+bI2NhFXAvaok+Qgd8T4kgn+KhGextsxgg7WLKHKE
	 5McNFB8vAl2Br290cEOG4n1VlEll25WdcSUiT6IYDt7tZmEKjW9GWkJpUngHqpLtP/
	 kMtiA1BcYlAF5Re21Y7z6B94KtjLtN8uC0FLh0BKtqirknbUn3ueKY57qOpoiTBzQp
	 NqsvOm0jka03qFk0llNq6mfZMIFpq+oTv857iVmDNkFInzSrCstNod5Y/wde4A59Ym
	 wQXG2pr17Sb/A==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Apr 2026 13:23:56 +0200
Message-Id: <DHW8QV8K3CM1.307C6PW2BM5RN@kernel.org>
Subject: Re: [PATCH v2 2/9] driver core: Add dev_set_drv_queue_sync_state()
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-pm@vger.kernel.org>, "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Abel Vesa" <abel.vesa@oss.qualcomm.com>, "Peng
 Fan" <peng.fan@oss.nxp.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maulik Shah"
 <maulik.shah@oss.qualcomm.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 <driver-core@lists.linux.dev>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-3-ulf.hansson@linaro.org>
In-Reply-To: <20260410104058.83748-3-ulf.hansson@linaro.org>
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

On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> diff --git a/include/linux/device.h b/include/linux/device.h
> index e65d564f01cd..f812e70bdf22 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -994,6 +994,18 @@ static inline int dev_set_drv_sync_state(struct devi=
ce *dev,
>  	return 0;
>  }
> =20
> +static inline int dev_set_drv_queue_sync_state(struct device *dev,
> +					       void (*fn)(struct device *dev))

As this is a public function, please add some documentation.

> +{
> +	if (!dev || !dev->driver)
> +		return 0;
> +	if (dev->driver->queue_sync_state && dev->driver->queue_sync_state !=3D=
 fn)
> +		return -EBUSY;
> +	if (!dev->driver->queue_sync_state)
> +		dev->driver->queue_sync_state =3D fn;

I think this follows dev_set_drv_sync_state(), but I think it is worth poin=
ting
out that it is yet another blocker for moving towards
const struct device_driver.

> +	return 0;
> +}
> +
>  static inline void dev_set_removable(struct device *dev,
>  				     enum device_removable removable)
>  {
> --=20
> 2.43.0


