Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3CCCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SihQBaFSJZg5WqgvJRRoz+8MQZezDgv4EBMwrc0TG1A=; b=BGkomFxBhscVLajLxFafimi0I6
	CWMJW5fD40XrMNts/QjmDRadbTHaFwDOMbJl60V7BpAfQzwBJLfHJSF0LzcvlA1azweHydSP8ebSK
	IZm9koEsAlWsrpcPm/kG8/JJ66gb7xOeWHg/LclF1/DbUMZtf3obAreaDw6WJ1uI1hBswnio6PnxU
	ttQc/aF5L/Hf4ddxQHLiNccpbFZYKYz91w6qJga2/FYvzM6laImyMWMhZOXonaR5PkXWfyVtaP3jS
	RrUbjM85WZ1c76mx8rQX4NuW8X+B3jLU7pkn4YLaipZpGamnk3vqdVqYfPDVBzOHZFm0XIw8/MslE
	W8uMyB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCemS-0000000Bqmk-2oxO;
	Fri, 02 Oct 2026 15:02:36 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCemN-0000000Bqic-2H1R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:02:35 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so3033004a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 08:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790953348; cv=none;
        d=google.com; s=arc-20260327;
        b=NGE6H41DVlqaW1fh+helRMOSQxiias1Ld2ZVCla3L4saVXnFh73d/yVsI3u8QMvmAj
         sdRjqlNdWa1MNz5kDZGu0fYWf52kXg66tkkK5SihrO+1MAqk5LCHlofe7/mJ0jvOqElF
         zH+i/fM2n+Zg/QCxvwG+Dip7M/KtDBoxkMgsJa/jKuCWvPZtmbsONpMTftkNbVOxliBt
         zglAs4r/NZt+xFlFG9GvCR3ikwL+RTIuguNN6HIjMKy3B2theooDFA/oywYAF1kacGaK
         gLyLkw/vtdMqsPx/tzku8j7tjKi3dvTAguPzFffvco7qLtA5a1SxVD+2Dlou+4RJCMhq
         ruIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SihQBaFSJZg5WqgvJRRoz+8MQZezDgv4EBMwrc0TG1A=;
        fh=CEuKxlDqk1uHi/2e9FMbS+Xc4kjsI5VIMR5E5jCODwU=;
        b=lk+nhHZb+spPCQRO+a1LZxMj4CIrFeooyCi9BMz6x06Q2toGbZyO9A5iBxLOk67pW+
         7wnv1kYo1MQ22vvmwsHD2HGl+IOi6VQINiP3A0pnVrJLO4o/hlLw1lLhkEEFDCnsvVhr
         U4yLHn4ktry+tR5mmnfr9RQUKRShWP/+yX2lYW+CFxrthPr6okdKemZL35Wj2Hv8iH3D
         IDxVIND5JTeEuVpTuNYfQjrnHuMkUZfMacgIOSVoaaLWxEZkAQEg5kktq/jEOMBinb72
         yJt/3F1CVRQ91i0da36DPcP5q2+qANPaXiJUXX8YcMSQ4xiX770DxJA20SN+aZBeMDB8
         5RlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790953348; x=1791558148; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SihQBaFSJZg5WqgvJRRoz+8MQZezDgv4EBMwrc0TG1A=;
        b=IJru8iWo35voKMz33d0CY6MpsXBfXipbR8Vqqknd7lljBUHl5hIcWJJ4cc02Ih6PaG
         bRkmjQTT3b1JFQnQ3Fj6uht3h6J+SD06hYkeYztJAlOiXNB6zFoJ989HlhY2TtiST3GP
         hm+MkfYfCMymWWpFsVnG5m+Z97fCQkAhHG9n6dyD2Z2G3R8QNr4sYolZJpxdNV4k+wNp
         AShSDzxbvFIDAT/4djnYxsjMMBsJcGvqHfdBC9/TfleU2c/TCUxy2Aq0ohw50pZP2bTs
         sm5QOktZFIXJfmt21cLvYjlAfLwxSQgCYQHBUYY+/4Poz1fspaihKJiyXoFi4pjHVJCh
         f9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953348; x=1791558148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SihQBaFSJZg5WqgvJRRoz+8MQZezDgv4EBMwrc0TG1A=;
        b=vpySiEz3p2/izQs6OAZnM7Oco/0H3EApbv0QhMWC4v+xmHbhAaEQECalnh7gJmzyAi
         1fwiPHuzuO3hpHEoJv5qSVb7i2R5RhUdUhR56pwKKgLHl6CT/Psp+mEZIJ0JFsvKbb2Y
         9HOCXHHQo6ewfvPgjvdsE5ZJD/4VmgJxjwxyXNR4Ntx5Mnhddu4ftIZL5uXqi0hZtCd8
         aVvoFMwCoKZNv/L2qCTmvsmIyGCraqTfSyihKgEAmdN/tPaif6QvhKR6qRE3+AxDFX0i
         3ouCct2XNHhu6H6XrLC5XMAYBiIqTBtT5m7DDl80KM8B0fnDAj4XKKbtKz6vw2AJDfg7
         50pA==
X-Forwarded-Encrypted: i=1; AKwUvBy07cYpKLz+TuqCXQJ6vQ6ffjYfF/TQKYi8B1vi5f3YuaPoT2w3vZGNPNVF1zxW/iKjb+4fxwDzByBFydIReCNa@lists.infradead.org
X-Gm-Message-State: AFuF++lgseCqrgYxkGtdSl0XxblM9IyM0Q3rpm+44RRe14nClH1DNy2R
	1/mSgbEbb1W/02cb33v9KlYAFIxmyqx/gpgk676AfnhxSfHMzQDb/+OFw1NujQfPpY8II8Z8TL0
	Vn/tD67NzL3HAcVjr3MfHZ4ULt3E5vQ8=
X-Gm-Gg: AYBFou3IROQXOX/lNqyj5UOS1yLOGS72hm/PYoKIOkAhibfTLXnNSwUhEy/VjZHWu+l
	AcUUhhrvwJBUC82YPRefZiY1URPKXJszm+xqyHp9qcKy1m6Gg0Abq+6wPDnUMzx5DUS3hHWXc0C
	SmuFCyvjV2aLim1RT5qTdugLJzZqJjXi9C1PgZDi+TCPjG6KifudzuzLU3d8EolDOyS0jSNTx3B
	woSpeVqDKcmPofuj4jexdU6ju7ZpSnxyb9uOwrGNvbCVktaKCFZulBwsS676Ai7fD+1r3guzc4V
	TX5N1t6y9MSQFAHrr+AvQLKgLO8kFiXDSOwiDcB8g85Et6RBOY+PzDNRdy++mSjH3bw=
X-Received: by 2002:a17:907:3f1b:b0:c24:e1e9:69c with SMTP id
 a640c23a62f3a-c2e4a6bae9fmr245232966b.0.1790953348274; Fri, 02 Oct 2026
 08:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261002102419.830595-1-sander.speetjens@gmail.com>
 <20261002102419.830595-4-sander.speetjens@gmail.com> <e49fdbd1-dbe9-4c06-9797-492db689d894@gmx.net>
In-Reply-To: <e49fdbd1-dbe9-4c06-9797-492db689d894@gmx.net>
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Fri, 2 Oct 2026 17:02:16 +0200
X-Gm-Features: AclHuK_lgAI88pm0RGCZ7CEgCgYo2LUQXG34CtS9xvBXG_tenjLpNr6v_B2O4bA
Message-ID: <CAAOJLPES726fWp_6SUaE-S7wGVzG+msEL7RRL2uYbzW7OWbvcQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] rtc: Add Raspberry Pi 5 RTC driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080231_746645_468F6E2C 
X-CRM114-Status: GOOD (  52.55  )
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

Hi stefan,
I was thinking of making the raspberrypi.c firmware a speparate patch,
what would you think of this?
Because it overlays with another patch
(https://lore.kernel.org/linux-arm-kernel/20260919034840.28593-2-triet.hoang.dev@gmail.com/)

Kind regards


On Fri, 2 Oct 2026 at 15:58, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hello Sander,
>
> Am 02.10.26 um 12:24 schrieb Sander Speetjens:
> > Upstreaming the downstream Raspberry Pi 5 RTC driver.
> > This driver supports the custom DA9091,
> > which is accessed through the firmware mailbox.
> >
> > Based on code originally written by Jonathan Bell <jonathan@raspberrypi.com>
> > and Dom Cobley <popcornmix@gmail.com>
> >
> > Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> in general this patch looks good except a few nits, maybe wait for
> Alexandre's feedback.
> After fixing the nits you can add my:
>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> > V9 -> V10:
> > - Fix sign-off-by
> > - Change enum to defines
> > - Change comment in firmware
> >
> > V8 -> V9:
> > - Fix whitespace in Kconfig
> > - Move RTC regs to firmware header
> > - Add a warn when getting the min or max charging values fails
> > - Remove the unused return value of set charge voltage
> >
> > V7 -> V8:
> > - Fix whitespacing errors
> > - Use of_machine_is_compatible instead of strncmp
> >
> > V6 -> V7:
> > - Move from u32 array to struct
> > - Fix encapsulation as mentioned by sashiko-bot
> >
> > V5 -> V6:
> > - Add MODULE_ALIAS, as mentioned by sashiko-bot
> > - Encapsulate the mailbox data in le32_to_cpu or cpu_to_le32, as
> >    mentioned by sashiko-bot. For good practice
> >
> > V4 -> V5: No changes
> >
> > V3 -> V4:
> > - Fix Kconfig depends that disallows having Raspberrypi
> > firmware built as a module while the rtc driver is built in
> > - Remove sysfs
> > - Add limits from firmware properties and check in rpi_rtc_set_charge_voltage
> >
> > V2 -> V3:
> > - Move platform check to firmware and abort before registering
> > a platform device if on another platform
> > - Add a dependency on the Raspberry Pi firmware to Kconfig
> > - Check return value of devm_device_init_wakeup
> > - Fix property name
> >
> > V1 -> V2:
> > Instead of the original driver, which was directly bound to the device tree.
> > This driver is bound to the Raspberry Pi firmware device by creating
> > a child device in the firmware driver probe function.
> > The child device is then bound to this driver,
> > which uses the firmware mailbox to access the RTC.
> >
> > A couple of minor changes have been made to the driver since it was originally written, including:
> > - Checking if the model is a Raspberry Pi 5, as the RTC is only present on that model.
> > - Using the new devm_rpi_firmware_get() and devm_init_wakeup() helper to get the firmware device and avoid leaking memory.
> > - Using millivolts instead of microvolts for the trickle charge voltage, to match the RTC standard.
> > - Instead of setting the trickle charge voltage to 0 to disable trickle charging, the property is now optional. If the property is not present, trickle charging is disabled, per the RTC standard.
> > - Renaming the driver dt match compatible to "raspberrypi,firmware-rtc" to match the other firmware bindings.
> > - Renaming the driver name to "raspberrypi-rtc" to match the other firmware drivers.
> >
> >   drivers/firmware/raspberrypi.c             |  24 ++
> >   drivers/rtc/Kconfig                        |  12 +
> >   drivers/rtc/Makefile                       |   1 +
> >   drivers/rtc/rtc-raspberrypi.c              | 276 +++++++++++++++++++++
> >   include/soc/bcm2835/raspberrypi-firmware.h |   2 +
> >   5 files changed, 315 insertions(+)
> >   create mode 100644 drivers/rtc/rtc-raspberrypi.c
> >
> > diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> > index 0aa322e9a2e7..f8c83c25eccc 100644
> > --- a/drivers/firmware/raspberrypi.c
> > +++ b/drivers/firmware/raspberrypi.c
> > @@ -24,6 +24,7 @@
> >
> >   static struct platform_device *rpi_hwmon;
> >   static struct platform_device *rpi_clk;
> > +static struct platform_device *rpi_rtc;
> >
> >   struct rpi_firmware {
> >       struct mbox_client cl;
> > @@ -231,6 +232,26 @@ static void rpi_register_clk_driver(struct device *dev)
> >                                               -1, NULL, 0);
> >   }
> >
> > +static void rpi_register_rtc_driver(struct device *dev)
> > +{
> > +     struct device_node *firmware;
> > +
> > +     // Check if our model of Raspberry Pi board is from the 5th gen
> > +     // as the RTC is only present on that model.
> > +     if (!of_machine_is_compatible("brcm,bcm2712"))
> > +             return;
> > +
> > +     firmware = of_get_compatible_child(dev->of_node,
> > +                                        "raspberrypi,firmware-rtc");
> > +     if (firmware) {
> > +             of_node_put(firmware);
> > +             return;
> > +     }
> > +
> > +     rpi_rtc = platform_device_register_data(dev, "raspberrypi-rtc",
> > +                                             -1, NULL, 0);
> > +}
> > +
> >   unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
> >   {
> >       struct rpi_firmware_clk_rate_request msg =
> > @@ -305,6 +326,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
> >       rpi_firmware_print_firmware_revision(fw);
> >       rpi_register_hwmon_driver(dev, fw);
> >       rpi_register_clk_driver(dev);
> > +     rpi_register_rtc_driver(dev);
> >
> >       return 0;
> >   }
> > @@ -327,6 +349,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
> >       rpi_hwmon = NULL;
> >       platform_device_unregister(rpi_clk);
> >       rpi_clk = NULL;
> > +     platform_device_unregister(rpi_rtc);
> > +     rpi_rtc = NULL;
> >
> >       rpi_firmware_put(fw);
> >   }
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 05b9233b9418..6dae4c069be2 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -1999,6 +1999,18 @@ config RTC_DRV_R7301
> >          This driver can also be built as a module. If so, the module
> >          will be called rtc-r7301.
> >
> > +config RTC_DRV_RPI
> > +     tristate "Raspberry Pi RTC"
> > +     depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> > +     depends on ARCH_BRCMSTB || COMPILE_TEST
> > +     default ARCH_BRCMSTB
> > +     help
> > +             If you say yes here you get support for the RTC found on
> > +             Raspberry Pi devices.
> > +
> > +             This driver can also be built as a module. If so, the module
> > +             will be called rtc-raspberrypi.
> Sorry for my misleading wording. I meant in this case 1 tab and align
> the rest with spaces just like the other.
> ...
> > diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> > index 975bef529854..e13994d8281c 100644
> > --- a/include/soc/bcm2835/raspberrypi-firmware.h
> > +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> > @@ -75,6 +75,8 @@ enum rpi_firmware_property_tag {
> >       RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
> >       RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
> >       RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
> > +     RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
> > +     RPI_FIRMWARE_SET_RTC_REG =                            0x00038087,
> Please try to keep the value order. I know it's already messed up,
> Gregor Herburger send a patch which already address the existing order
> ("firmware: raspberrypi: reorder rpi_firmware_property_tag enum").
>
> Best regards
> >       RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
> >       RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
> >       RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
>

