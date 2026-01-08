Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BC0D148AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z95RpMEmgNwl7YB+bCq/7uMHk15Sjdmwjz/1QwjCtwY=; b=ttSAxEoJcp6SPx2CXlJ+LUH3lS
	FILFqAjlPHNQiw/+hJb9yGazweUxOc4bfBaaO6fzu7Z7Qv6M+FbzMuNRwIFIa3LnvnXPVc1+dutTQ
	94R0Wp2N9+9ZLkThPgofE206uOyj2ubYSTo35Doex2TBKEZLi+ruv0zQCWa1qe9ULr7trzd81ozJb
	W3vUQDwoyXY2a34CdNd18n8SmYdGxMF+kbW7FprkwswgUyWisnnJvPB0zVdLyvL/vPXm22NcNIf9W
	XIpi9qkdL+2fZBPlpSxRz4qHF2hJP049DURv4IJQ8KOZZQL96p5t8Oq1cU6Kar86DbYvHm6HImm6x
	KHK776dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjvn-0000000G2Nz-0LLe;
	Thu, 08 Jan 2026 06:55:39 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjvh-0000000G2Le-1Txy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:55:37 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so3857883a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855331; x=1768460131; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z95RpMEmgNwl7YB+bCq/7uMHk15Sjdmwjz/1QwjCtwY=;
        b=IqibMo8O4avMdGPULk0jV4e3ca46v9GZnUk9kl6604c0GmOoPTuGE3DhA/7hDPmRR6
         0sFazckXabiHOvqMzgVIaya5dD34jYQw+VCxDq4mm3TjeUX3krF1JjLdMLHx/SpfK4Ku
         VLqJvaoxo4A6zHzeVWJbO71vX7WVxoobfeDKKt1iWQO/24Ag9mmtvvk5Q436s4BKS54K
         bc4oy7cpByvkzQbEqjOZpdPli6gwaesKa+PQGz+2TDxuhRNbABB9P14CDZVQ1gkGEwFc
         EiXdoAmL0t1ulRp9l9WKPzZ+FdBKr2w+S5WtSXSK3zftRD+prYiQ3jxv0fN3EMndGKdP
         sQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855331; x=1768460131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z95RpMEmgNwl7YB+bCq/7uMHk15Sjdmwjz/1QwjCtwY=;
        b=RSWQFo+A2ktj3MT1JDJOwIBkMkmoD6pYFZO1bdNBfNu38mC0FA0XrED+UqgkVkEeU8
         K3tq0D8YMnPlXfLOpO5vUZelrqqX/09CrMMtjPaRqzrcROKhQTtb6kj4ff6gzd8popq9
         DRA+mWHJVecfDZna8QyiVEA8GUNMU0QiaIvr+DIbVbbTk32HO/XyvCxZZQSGNUBivs7F
         j2q00sMooyD6c9bGGlOnDRQWLN18qXO9+tlNFP4lVcdm32slp4D7HVEaftPQ3KN4NcbB
         gHhRTFDnadBCDYh3C5bErvnNAi8Jr824TFslPXlfQB9RiwhDIAN2NtXIh9JweJ22/1lQ
         hgAA==
X-Forwarded-Encrypted: i=1; AJvYcCU6giqEQ5GnW3Wz44EE+C5BzP6mxpVOtZt3s4jdMf60o2G81yiL39mXS+SrQH1gtG1CFBwkVWQtO6LlbvCTS/it@lists.infradead.org
X-Gm-Message-State: AOJu0Yye63XwmML03mu3ftqbUGV+oXmMD5yr4sJjcbNAFLW4ACS4F662
	6UYsk7apQKv/DTuY05mxXk0UdTSqaFpp/Z5+Uq3KT61gLqYjx6e4wIjWlDcy5O8ANpvMiVsz8tg
	HL7mGRl4gptu4UnJqQkCqmbbZKAZXt90=
X-Gm-Gg: AY/fxX7qnhqKMZnPOTV1cmWmPQz+N6g1aptgRXCnLLCv0jdVr+QMbBkbw1iCd8Cizqv
	nFK96C+awTrkwBSm7h7CWy+W4ofX3IGXbIkG3xXPIXha6vSjEbq39jq4GHWIZSib1yUpu5uFfZY
	SkZAU7XEGpUEUaMNu+cud5uSEOAF8DFA+AabAwphYbc/dMdLCWreZtXQYzN/hM5o7Kt7ppqRPgA
	ABsHPYnT1HY+v8RolTQM/IsShXX3/5LoSlxAeNvcTVI5f99JIOqDYmIsHzBUgKJbdVP9Or8ciMa
	pg==
X-Google-Smtp-Source: AGHT+IG4U6kWECKctcFw6T4T3/RU4yz9c56j1F9uY6dHVa5DSvL+D+02G9vCcItZfsXHq6Ag8SriCCmYiwhyppBRQFI=
X-Received: by 2002:a05:6402:358f:b0:649:2347:e15f with SMTP id
 4fb4d7f45d1cf-65097e6e3cemr4114953a12.31.1767855331317; Wed, 07 Jan 2026
 22:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-3-linux.amoon@gmail.com>
 <aVkfNBUDUumzV0-X@venus>
In-Reply-To: <aVkfNBUDUumzV0-X@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:25:12 +0530
X-Gm-Features: AQt7F2qUzy3nVOhqisJzP2xjjJX_kUrGnrajstWtAcg0dioD3CSqLPjSWSgZj2Y
Message-ID: <CANAwSgTmAbswY6scsxj40B7Y6QbnkqWPuCqyevRjdtHNemq0aQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix
 USB host phy-supply on Rock 5b-5bp-5t SbC
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225534_535126_259E9CEE 
X-CRM114-Status: GOOD (  20.47  )
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

Hi Sebastian,

Thanks for your review comments.
On Sat, 3 Jan 2026 at 19:35, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Jan 03, 2026 at 02:01:18PM +0530, Anand Moon wrote:
> > The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
> > USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
> > regulator which ensures proper power sequencing and management for onboard
> > Double-USB-HOST.
> >
> > Update the u2phy2_host node to reference the correct phy-supply.
> >
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
>
> u2phy2_host is connected to an onboard USB hub chip, which is
> powered by &vcc5v0_sys as the comment says.
>
> You can see this on page 9 of the v1.45 ROCK 5B schematics (page
> name USB2HUB). The usb hub chip uses VCC5V0_SYS + VCC_3V3_S0 and is
> connected to USB20_HOST0_DP, USB20_HOST0_DM. The related USB
> controller for that in the upstream DT is &usb_host0_ehci, which
> in turn is using &u2phy2_host. Thus at least for the ROCK 5B the
> existing DT is correct. Properly describing the downstream port
> VBUS regulator would require something like the following series:
>
> https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/
>
Actually, the Radxa Rock 5 B doesn't have an onboard USB hub chip.

The USB_HOST_PWREN_H GPIO pin acts as the enable signal for both
5V_USB1 and 5V_USB2 regulators.

Data signals from the USB 2.0 Host 1 interface (USB20_HOST1_DM/DP)
are routed through the CON20B chip to the Type-C controller's
TYPEC1_OTG_DM/DP pins.
Additionally, the schematic indicates that the Type-C controller's
power delivery is managed
by the USB2 host (5V_USB2) rail.

From the schematic, I could see that the Type-C controller is controlled
by USB1 host (5V_USB1) and USB2 host (5V_USB2) for power delivery.

[1]  https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic.pdf
(page 27)

> Greetings,
>
> -- Sebastian
>
Thanks
-Anand

