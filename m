Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAD9C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gksmbVMdlMg2K8PgWxvAtllhStxQNr+LZ8Dt0YW8uEI=; b=eRNsJyxi7gwltJXDUdmTtZIVc1
	obJOJ60h9gPdMy83KQj3ItBvgfYMrGvkIshRiB+wqN/UKom34P1m+Ond4T1XBimRdZGXDZBqzO9Xb
	Y/G1KmYYkoyjirxUAo5K/oKhHWupm8Q8RC+HRLlXXAIQpM4T453MdSq3OZMJCKtHG0wwoXr8dTw1y
	wHXnPCAZR83GH1kJKvepGDKqvIj/23xPgfOGrUYf/RYpUwI4175QclDhLJAkwg8W4meupGSazUp8S
	EncV0ujf8zjvCxGpSLF+0cBHbl0Hgheolt7nvOdaTG0B87VtOg/O4iLs/ALAL+UQj87YXValED96j
	Fc9aBotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlIg-0000000D853-3z1A;
	Wed, 04 Jun 2025 10:24:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlEc-0000000D7OY-0PGT;
	Wed, 04 Jun 2025 10:20:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a510432236so2057675f8f.0;
        Wed, 04 Jun 2025 03:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749032436; x=1749637236; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gksmbVMdlMg2K8PgWxvAtllhStxQNr+LZ8Dt0YW8uEI=;
        b=BGNc9XOY3l8EKXW+GPPMDxptEgFLziTa8qg7R4++L3WGswbZcgf8CANn4u60GKRqIf
         1LIXdl3YnmtuyI9uDX+1tUqFeOa+HGgWEJZ21MAFSxMu7ziHJvZIV/nfCA6TWcxlQJdQ
         Dsv8tcnOrIM3z2+74raCr7coTtsw8jLnWPV2pDlauXwE5Q7z/m4VwzaeezD3yvsTPTJZ
         OWhlbYywgQTU3GqzTVe7YBbZ5vg4qSy73vjNzHSfu/nqkSR67mm7VLU8z6TzeDjlhLQc
         h6jZllcBsprUDO3O3szxnocqudcZjxBy7TLUuLfpbBD1DeOcW3NI8EM4zPZSA4wEbh6j
         PzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749032436; x=1749637236;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gksmbVMdlMg2K8PgWxvAtllhStxQNr+LZ8Dt0YW8uEI=;
        b=w0NaXV7sEJ+ViRdgu/X+YXOu+pa5iY5V+mFRxHwRdoIpI1FB9YrHiRSHleggLGhh6B
         YJqF9GGiUsIyRHABgWnXUd8+xDd0pvdIyDKffyDb8jX1U+aJkES/G8/939PQ6JHRwDXH
         LR5uLXmzH1NHIUBuwotfQIgSu2dAffhM5BFUSiq5wDXNUzQrTKHgAXe4XzwSfX1h6lxU
         tSVhy1+iqG6bdRwlynwMYA37MHDu4lrj4fN6pE+bG/sK8Cd0Hv7DyxyxR1Lqykjm0Ue1
         sbb5NBpcQzkNgyT3ZFpEk7Ko0+uQAEhrRJ+P1NJSHUn6zyOPpsiIXI/l2Ovu4QB574YP
         CQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXQq4oyKJKLzLBOX86NuQQviZsGZ29rFL2am4Efw1+8mePBYl2bcrYmN476hO6fQNGoqCCBRfVXsjx6ZSE0Jyhl@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ4W2lD8yXK/HtjNdmGqgrXnskA6cmD3t1OJOH8UpS4wNuSCpW
	11WxGHtDVvWrWN+5BVB5jwrYhuF+WkQR51644ux4YuoABjXMHWIdvDoadiq8Xw==
X-Gm-Gg: ASbGncvjfABjEX3IfhgQgRojghJCnf3WbLT2LVKaTMV+h0KI9IABrrzkUAuzt51NWtd
	Elg5r4mzonqgPjSOxGc8PKS2D2kzIaKwUBP+AdTzZXRqkBA0Mhwh6UqBioltHJGQ6qBf1BjSN0Z
	QJkVstkn0DK4X1ciUnacjBhxQ03mWJUPJYn4ZT+UPr5Idc1CGhrIjTIKK+qBVgKRggYdUn5cwQ8
	xL+0C44jpfwFJqbZEIku95hu2xl4sMl1qfpGN3vp9OYbktByhcDxLO3uvlKR6ZehlK8GC2Nv0rO
	W0R69RGgiTgwgnKXKzDxb8IZwhAd2bV5jcNJnQDx9l2OAA61QBPBF+NLhuiiX8XiL8HABGu6S3T
	+
X-Google-Smtp-Source: AGHT+IF88CeFxKvQxdvXREnSkr8GHdt7EoWxmbkqn8grATbGWlFIxrHVsbxE7StTbOeQY8wMZZYAXg==
X-Received: by 2002:a05:6000:240c:b0:3a0:b1f7:c1da with SMTP id ffacd0b85a97d-3a51d967e0emr1682017f8f.46.1749032435644;
        Wed, 04 Jun 2025 03:20:35 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a03bdsm21776589f8f.91.2025.06.04.03.20.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Jun 2025 03:20:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [RFC PATCH 1/2] PCI: rockchip-host: Retry link training on
 failure without PERST#
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <aEAOiO_YIqWH9frQ@geday>
Date: Wed, 4 Jun 2025 14:20:20 +0400
Cc: linux-rockchip@lists.infradead.org,
 Hugh Cole-Baker <sigmaris@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <317943F7-8658-436D-9E3C-05CB6404F122@gmail.com>
References: <aEAOiO_YIqWH9frQ@geday>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_032038_136681_A0B4C0F9 
X-CRM114-Status: GOOD (  32.65  )
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

> On 4 Jun 2025, at 1:14=E2=80=AFpm, Geraldo Nascimento =
<geraldogabriel@gmail.com> wrote:
>=20
> Hi,
>=20
> After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
> N10 through trial-and-error debugging, I finally got positive results
> with enumeration on the PCI bus for both a Realtek 8111E NIC and a
> Samsung PM981a SSD.
>=20
> The NIC was connected to a M.2->PCIe x4 riser card and it would get
> stuck on Polling.Compliance, without breaking electrical idle on the
> Host RX side. The Samsung PM981a SSD is directly connected to M.2
> connector and that SSD is known to be quirky (OEM... no support)
> and non-functional on the RK3399 platform.
>=20
> The Samsung SSD was even worse than the NIC - it would get stuck on
> Detect.Active like a bricked card, even though it was fully functional
> via USB adapter.
>=20
> It seems both devices benefit from retrying Link Training if - big if
> here - PERST# is not toggled during retry. This patch does exactly =
that.
> I find the patch to be ugly as hell but it works - every time.
>=20
> I added Hugh Cole-Baker and Christian Hewitt to Cc: as both are
> experienced on RK3399 and hopefully at least one of them has faced
> the non-working SSD experience on RK3399 and will be able to test =
this.

I think you have me confused with another Christian (or auto-complete
scored a new victim). Sadly I have no clue about PCI and not a lot of
knowledge on RK3399 matters :)

CH.

> ---
> drivers/pci/controller/pcie-rockchip-host.c | 141 ++++++++++++--------
> 1 file changed, 87 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c =
b/drivers/pci/controller/pcie-rockchip-host.c
> index 6a46be17aa91..6a465f45a09c 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -284,6 +284,53 @@ static void rockchip_pcie_set_power_limit(struct =
rockchip_pcie *rockchip)
> rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
> }
>=20
> +static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
> +{
> + struct device *dev =3D rockchip->dev;
> + int err;
> +
> + if (!IS_ERR(rockchip->vpcie12v)) {
> + err =3D regulator_enable(rockchip->vpcie12v);
> + if (err) {
> + dev_err(dev, "fail to enable vpcie12v regulator\n");
> + goto err_out;
> + }
> + }
> +
> + if (!IS_ERR(rockchip->vpcie3v3)) {
> + err =3D regulator_enable(rockchip->vpcie3v3);
> + if (err) {
> + dev_err(dev, "fail to enable vpcie3v3 regulator\n");
> + goto err_disable_12v;
> + }
> + }
> +
> + err =3D regulator_enable(rockchip->vpcie1v8);
> + if (err) {
> + dev_err(dev, "fail to enable vpcie1v8 regulator\n");
> + goto err_disable_3v3;
> + }
> +
> + err =3D regulator_enable(rockchip->vpcie0v9);
> + if (err) {
> + dev_err(dev, "fail to enable vpcie0v9 regulator\n");
> + goto err_disable_1v8;
> + }
> +
> + return 0;
> +
> +err_disable_1v8:
> + regulator_disable(rockchip->vpcie1v8);
> +err_disable_3v3:
> + if (!IS_ERR(rockchip->vpcie3v3))
> + regulator_disable(rockchip->vpcie3v3);
> +err_disable_12v:
> + if (!IS_ERR(rockchip->vpcie12v))
> + regulator_disable(rockchip->vpcie12v);
> +err_out:
> + return err;
> +}
> +
> /**
>  * rockchip_pcie_host_init_port - Initialize hardware
>  * @rockchip: PCIe port information
> @@ -291,11 +338,14 @@ static void rockchip_pcie_set_power_limit(struct =
rockchip_pcie *rockchip)
> static int rockchip_pcie_host_init_port(struct rockchip_pcie =
*rockchip)
> {
> struct device *dev =3D rockchip->dev;
> - int err, i =3D MAX_LANE_NUM;
> + int err, i =3D MAX_LANE_NUM, is_reinit =3D 0;
> u32 status;
>=20
> - gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> + if (!is_reinit) {
> + gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> + }
>=20
> +reinit:
> err =3D rockchip_pcie_init_port(rockchip);
> if (err)
> return err;
> @@ -322,16 +372,46 @@ static int rockchip_pcie_host_init_port(struct =
rockchip_pcie *rockchip)
> rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
>    PCIE_CLIENT_CONFIG);
>=20
> - msleep(PCIE_T_PVPERL_MS);
> - gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
> -
> - msleep(PCIE_T_RRS_READY_MS);
> + if (!is_reinit) {
> + msleep(PCIE_T_PVPERL_MS);
> + gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
> + msleep(PCIE_T_RRS_READY_MS);
> + }
>=20
> /* 500ms timeout value should be enough for Gen1/2 training */
> err =3D readl_poll_timeout(rockchip->apb_base + =
PCIE_CLIENT_BASIC_STATUS1,
> status, PCIE_LINK_UP(status), 20,
> 500 * USEC_PER_MSEC);
> - if (err) {
> +
> + if (err && !is_reinit) {
> + while (i--)
> + phy_power_off(rockchip->phys[i]);
> + i =3D MAX_LANE_NUM;
> + while (i--)
> + phy_exit(rockchip->phys[i]);
> + i =3D MAX_LANE_NUM;
> + is_reinit =3D 1;
> + dev_dbg(dev, "Will reinit PCIe without toggling PERST#");
> + if (!IS_ERR(rockchip->vpcie12v))
> + regulator_disable(rockchip->vpcie12v);
> + if (!IS_ERR(rockchip->vpcie3v3))
> + regulator_disable(rockchip->vpcie3v3);
> + regulator_disable(rockchip->vpcie1v8);
> + regulator_disable(rockchip->vpcie0v9);
> + rockchip_pcie_disable_clocks(rockchip);
> + err =3D rockchip_pcie_enable_clocks(rockchip);
> + if (err)
> + return err;
> + err =3D rockchip_pcie_set_vpcie(rockchip);
> + if (err) {
> + dev_err(dev, "failed to set vpcie regulator\n");
> + rockchip_pcie_disable_clocks(rockchip);
> + return err;
> + }
> + goto reinit;
> + }
> +
> + else if (err) {
> dev_err(dev, "PCIe link training gen1 timeout!\n");
> goto err_power_off_phy;
> }
> @@ -613,53 +693,6 @@ static int rockchip_pcie_parse_host_dt(struct =
rockchip_pcie *rockchip)
> return 0;
> }
>=20
> -static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
> -{
> - struct device *dev =3D rockchip->dev;
> - int err;
> -
> - if (!IS_ERR(rockchip->vpcie12v)) {
> - err =3D regulator_enable(rockchip->vpcie12v);
> - if (err) {
> - dev_err(dev, "fail to enable vpcie12v regulator\n");
> - goto err_out;
> - }
> - }
> -
> - if (!IS_ERR(rockchip->vpcie3v3)) {
> - err =3D regulator_enable(rockchip->vpcie3v3);
> - if (err) {
> - dev_err(dev, "fail to enable vpcie3v3 regulator\n");
> - goto err_disable_12v;
> - }
> - }
> -
> - err =3D regulator_enable(rockchip->vpcie1v8);
> - if (err) {
> - dev_err(dev, "fail to enable vpcie1v8 regulator\n");
> - goto err_disable_3v3;
> - }
> -
> - err =3D regulator_enable(rockchip->vpcie0v9);
> - if (err) {
> - dev_err(dev, "fail to enable vpcie0v9 regulator\n");
> - goto err_disable_1v8;
> - }
> -
> - return 0;
> -
> -err_disable_1v8:
> - regulator_disable(rockchip->vpcie1v8);
> -err_disable_3v3:
> - if (!IS_ERR(rockchip->vpcie3v3))
> - regulator_disable(rockchip->vpcie3v3);
> -err_disable_12v:
> - if (!IS_ERR(rockchip->vpcie12v))
> - regulator_disable(rockchip->vpcie12v);
> -err_out:
> - return err;
> -}
> -
> static void rockchip_pcie_enable_interrupts(struct rockchip_pcie =
*rockchip)
> {
> rockchip_pcie_write(rockchip, (PCIE_CLIENT_INT_CLI << 16) &
> --=20
> 2.49.0
>=20


