Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC8103A9A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 02:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMlrKIWE1KM4Yad6QSZWMlcL+MvR+08LGf01fWoQDYo=; b=a6p2+gVbDPLeKFQWGj8sBLyfTc
	f/U5dZD0wbtnukv9n4G13awe9saDuVvn3yD39yrxakqFdY43/s0vU2X3xQ+H9ZKzdMGh5eC7/Dx/M
	dBZPQtP/VT1L0PC+kwZbb3M6Tr/UAPwx+4WS42UlDXH8i5YfTZs7ikNdBHwzxdWgwzmir9cgk5mdw
	3JLWDKT0GRIUJroEgPRdL0eZasDYrnsN06BTGQ7fehVFdZSW/yDiYgDe2QDZb6stsgqcyTVbU2MgB
	lAF5Ppkx7gzdk5tQ4mplz3geM+s0lTCXM5vHd/FdRqOIliQT30SkM6I9CfB1blR6Sqzl0WfjWK5BU
	2+iKLmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EIz-00000002XzD-1bjC;
	Wed, 25 Mar 2026 02:49:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EIt-00000002Xx8-44KQ;
	Wed, 25 Mar 2026 02:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AD1D6013C;
	Wed, 25 Mar 2026 02:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB5BC2BCB5;
	Wed, 25 Mar 2026 02:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406947;
	bh=AMlrKIWE1KM4Yad6QSZWMlcL+MvR+08LGf01fWoQDYo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ght6Y8kOUfC/XhylkChbjn7EyL/6UF0fwadCVcpSo6Xcef8SICFwJAqK1saq9sW5b
	 ux6z2CK2Zf+D+p4sKBbjxw5EbTTJyzIM4bIwDM8KlPA9vm0DZvqIZW5pl1GiLlNs/I
	 gc5JPQkPBQ40hCBnszgS0CcZU6kPGgEmX3SViBFKgyLrCeSSe+ZfnNVMW+Tscj9MGu
	 T1XOr1rUWH3Tiwolds7eWcK//AB927onwFMlxI9SrvuPW4as18ihlbo3DyR+efGzT3
	 l9uEUzasvSHRXRvvCJUxoKRePILko/TU5ZsVE3oyMRw1Or2dPAQYIkGV6BkdWowB19
	 N+uUfYVLjkNdA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com> <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
Subject: Re: [PATCH v7 1/5] clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Chema Casanova <jmcasanova@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Tue, 24 Mar 2026 19:06:48 -0700
Message-ID: <177440440896.5403.6955660705156176314@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Ma=C3=ADra Canal (2026-03-12 14:34:23)
> On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power savings, the
> clock rate must be set to the minimum before disabling. This might be
> fixed in future firmware releases.
>=20
> Rather than pushing rate management to clock consumers, handle it
> directly in the clock framework's prepare/unprepare callbacks. In
> unprepare, set the rate to the minimum before disabling the clock.
> In prepare, for clocks marked with `maximize` (currently v3d),
> restore the rate to the maximum after enabling.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next

