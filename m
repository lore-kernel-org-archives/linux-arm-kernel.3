Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFCBFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efaBPM9AaDRoGhkgDJqIbj2sPf210Dx/zthTGAV+PN8=; b=sxN9ItEeueuHJl7MGgPyrGbVaP
	b5NXoLa1Q0QVsxMh2inQ6HmDRAX1S/cGANYdfu/QNEURncp2RQCK7bI/EE4EqaJGgQECGKp5MhicI
	FsWxm6V3/SW1eCwTafVagLFTOfWeGUWBl1Caa+EeIfKOnP9HjcWNnfJhHJgIy7KRWOR7lLJDwAxrQ
	TbXycMXAFptovWGZln/Z4exTt/QY3WJWpkfDrUouOg/VEZP4oMKov/Lp+o5jmN4iK98bW39H1lpyi
	GRAoDUiWiqGF92rh6LxaiEe962EvbTihGhCtiRk7CRGfz6u4XM05EFAF680jdSPlTv4Zzi2DP/TDE
	jCWAwXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHd9e-00000000nub-40iB;
	Tue, 28 Apr 2026 07:46:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHd9d-00000000nuQ-1n9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 404FF60133
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89A1C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362407;
	bh=ADg1FaAaQD046f4ZXKUeNs9WMlXZmKjJ9FxWyVIqZMw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=bABj1bu4iiFZKPmhNpk2pE8ISPVAOwGh8x5UzolJSMzxbB4E2LFEo/z1kJl5Y5Qh4
	 ojRPqItN1phjz8csmJ//x4HQZJAmAPlOPVW2OYGJRHqhFvvayDBVpeqejO++PUA03b
	 1jQ8oRG1bCZXnzpScIG+5qconX9Inj9ElV+oJZBjti+PN25Dr/fdF7/ff005YOJJf9
	 ZCHr40iDHo1CpwbT66yLUc7+SuN8zwMhasfKdpMlPn1fT3sDRd1Ogp1fVL9i1uzu/z
	 vIvWGskR2hBGAlHRrMOvxs9ogveAN+4pcCs+CPrqebV/MvNxulSP4PTwaxffeiLI0i
	 Epy7WBgepAIfA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a402b2d102so11712704e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8B0OJwgVKfXMqgyN0UkcOTKj2MBa8qWkurtN1F0BRSA1Hi0weiGbO1bC4IlccMiLEHVAOzW8BOlL7Lq9L5//Yh@lists.infradead.org
X-Gm-Message-State: AOJu0YzhBGXtIR8w42fMCP1XoihkvRGydhMMj1aGh/uHs7Tu4G2CcQho
	KqTTzSS9Do1Nz1EqOsbOpGhwW/ADqhgcEvIcrdS6UJJIuZ3W10OeTF6j4VXeF8XHKhxdm6ExyV4
	6Vfqeqdzkls7wRw3dF8CflaJarTjslPdejoTtFcHjcg==
X-Received: by 2002:a05:6512:2381:b0:5a2:a13e:9082 with SMTP id
 2adb3069b0e04-5a74662a7a2mr863095e87.35.1777362406607; Tue, 28 Apr 2026
 00:46:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:46:45 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:46:45 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-3-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-3-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:46:45 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfyCqZHYSoUKe3=c_VO61HAxydpwyHP3Ey6u08Pzx+OgQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lw8-kSbgaAsT6iClj8v0tvKXLizHPhM-T0oDDyli5y1-FS0QYWyggqmk4
Message-ID: <CAMRc=MfyCqZHYSoUKe3=c_VO61HAxydpwyHP3Ey6u08Pzx+OgQ@mail.gmail.com>
Subject: Re: [PATCH v21 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Mon, 27 Apr 2026 19:34:43 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> reboot-mode based drivers can define a reboot-mode by adding it under
> the reboot-mode node in device tree. This limits such drivers, to define
> any predefined reboot-modes statically within the driver and creates a
> dependency on device-tree.
>
> Introduce a list for predefined modes in the reboot-mode framework and
> process the predefined reboot-modes along with the device-tree defined
> reboot-modes. Modify existing reboot-mode based drivers to initialize
> the predefined list-head as empty.
>
> This patch enables a reboot mode driver to define reboot-modes through a
> predefined static list, in addition to the device-tree based reboot-modes.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  |  1 +
>  drivers/power/reset/qcom-pon.c           |  1 +
>  drivers/power/reset/reboot-mode.c        | 66 ++++++++++++++++++++------------
>  drivers/power/reset/syscon-reboot-mode.c |  1 +
>  include/linux/reboot-mode.h              |  8 ++++
>  5 files changed, 52 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> index bd05d660490c686b43134f82f1eadd7665403d20..83a8d80fd7d1ccb1b736aee5f2d675246a63b8f8 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -53,6 +53,7 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
>
>  	nvmem_rbm->reboot.dev = &pdev->dev;
>  	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
> +	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
>
>  	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
>  	if (IS_ERR(nvmem_rbm->cell)) {
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 57b36e6186f80aff947fd7f5aae5ce280c65dc6b..9d0e3fc621a6173438c6da4cce38394199451881 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -73,6 +73,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
>  		pon->reboot_mode.dev = &pdev->dev;
>  		pon->reason_shift = reason_shift;
>  		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
> +		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);

Maybe unrelated to this series but we could use some centralized initializer
for struct reboot_mode_driver as well as rename it to struct reboot_mode_device
which it actually is.

For now:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bart

