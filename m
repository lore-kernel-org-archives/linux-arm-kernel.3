Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C395ACDE002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 05:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+9zdrnWdYPYO0YMlgRGb3kLO0yAknKaNgGna5hHFMo=; b=RxEO34/LYX9BXHEKLWdw3Dj9a/
	rIcUOod54SPpRc2cVDheu8+d2Fk6YGZTIkzWFKqxY4506uNa6OB5czDNEnc5Z/NlMd9dX24Vk3xc6
	srYhgZgUIz2EYj2JZdik7mW6e0lKb2cUYx+2olCzGxbRVPyVEb6juqm5NGdR10FKfU4Tv+ML+LS3e
	auydqfzJZ8a+JmxgbHlStfZdGBzbF9XxcT/uuQ72ti+kANurX1pdbs2R2TxDelCRhbTuUsao+q5SQ
	UbfkHiNqzFfLkNdcO53/DpvjvYmfocYEY28mMrOpfk4IFuekYIplqAeTyUgyODL7LNDjG/KZE4XKE
	T4KLx0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccj2-00000008fam-1CO2;
	Thu, 25 Jun 2026 05:34:08 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccj0-00000008faN-1Yw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 05:34:07 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aea33ffa0aso46904e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782365641; cv=none;
        d=google.com; s=arc-20260327;
        b=T5FNTDZb/j4+LLabysbthZki3DdTQSii1KgigYaoUNJ2KUa1CylPnqBM+G1XV3EMJd
         SO5aveHL86WDrE/tQRy0kR4dbCA/q0H/8qnAfWhjkGut+siheK0EmarPDPqjUKHCJNjw
         ZiwN4e6NU32njDBmRaQWBf2mzLEmUldQ6MiWlmAtG0oil8Xh0vti4QHVsYI4rRUq3RFr
         3V5YVrl7eg6/HbE4OIPPieMaVRd6eCW0/IkkTZ/KgU2+m5Gr9Dokk4xLHzjuN5FamtT7
         WvomUdLV5OXiKOJqaF9nJVKBRfYsWcXQBz5apOLM8IrImuwdh3SJGFVgkBtNn20CC+Cn
         YdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A+9zdrnWdYPYO0YMlgRGb3kLO0yAknKaNgGna5hHFMo=;
        fh=lvxl08rKvtA7ko0JWYQ6VW+AAKnWvvTt4cBqtU8NJxE=;
        b=Q1xTH9knd/nd/EdXTchPram1PB0kj3LmUsPC3iEdH4LkK6MWb+SemgiLOmA7g2S+nO
         +ME8AhkhKzCEnQ6iw2sAGm0lmUwnqhxre9mU8aEjesDy12LnHmQzGaSZx0fqqhKtUTJ/
         cBdzKTb+SdIc6vqwYAJMb21/OmoeDQoQb6Ote5jMN628iq3L7SszJr5sX8Qk253xxghO
         LzAY0ytT7x1vgdpgFsm099y6qdqPHb/XgUe48I4SRckMEDOr/EhGttW2RzNu4K8aaTDY
         NQQYhn4NDgz73d4XFExJ8b/DDP3lYmN0mOWZWa3w9c9YbakqGMiXrseJVS+dw5QT8CZJ
         E39w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782365641; x=1782970441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+9zdrnWdYPYO0YMlgRGb3kLO0yAknKaNgGna5hHFMo=;
        b=m2wT1QZbSV/+PoZktcwMHzZyIV3xCQZWmiqeOGNwcLYgO+FfE+z3WOO+5XiyPk4xYF
         IqdZLFZoMjjP/BFSRAqdLLbhLPz+RH0s8lvrmXUTqv1CYh2MxN6tZQnxkmDXG+Oy6Nsq
         jSns3zs32sQNuNdq12O9mYKrHnh8P6o/Qf0EhvWetfKT5ibakTKf/Xiio17YA12Ixcxx
         J19E+e1cq2JBo2Jreer3KsppCwFQMsiDRf5wipUJ50bLWUpCBf9vx6iWx2ek3UblcGOn
         DjmUq+mbXkTaq/ohQL7D6qeKRgpTgdCmMtCLxKAQmkAHpOykSzJGT0xs+0Oqi7OSeVHF
         SFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782365641; x=1782970441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A+9zdrnWdYPYO0YMlgRGb3kLO0yAknKaNgGna5hHFMo=;
        b=d06LoLh4iX0HaQxfrSlitLeblPUtiPVn5cbBBRYwi4scUWfp5z9K2+1SFEcKBzj97B
         HQXAfj7wmhKJkD03jm5To/FGM9l9n3+4eix7f9N3C7XFmrto++/mVMk8mTC814uvpczk
         jEjFjyPwMQbCGpqlz7/I1k2ahWCTyUKrhtacKQHq0haQ4/8CvEvA+i6JVAjFiKMfbcXL
         tZ/qMXE6PInla7Md7hAZJ9YxDgL0FfN5kfmsOjq4rLU31MTJgPtUMZ6Z3EdKSmr7/XRh
         jF2JIBDAIUie16GZsI5wTY0YG2XmX8dv9Z9PX6kQyRGVuUKU62AdiVEptd8/WzVaPucg
         8+kA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3oV4J5lO1ZSX1vC3QAOHzKoyqhCGsA/Rot3+282IEzaNbr4+SfOvog7+ZLzLCR8EnbVeglSGVgpQeXCeD7Oyi@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ0elpYy1ihg8GueBbxrkaU6TWj0ZL4RQo0UBuN5D5BfjUqi+u
	ii57jOqb3VfmIMW6tT7NKUWp6fNY7Kq0jP+egSTAGhG7tiOVJ8JOr4TVlvne0LmVzQXEf/2KZz3
	GLiAzR/scNlt+yjijes02qj2DqaW1Tb0=
X-Gm-Gg: AfdE7cmqADcPzuPD7+BYFlger/Q6YjXSWnuwFa/fpff3YmTz7uNFGRIQQEnxdYzBy3D
	SUA0d92BY7AVJ4Clkm8cgkk3WQbMJnIJOjaMsFcXC0VDhl4U6UY4e1PhRC9LdHr3YVqAFvE4yfv
	vGUjZtaqaCPdK8G+cFq37YWW/RXX56QrwbgSZmtdMJ9+fDCkucIxsw32PtA37JugnMvKFcsR9tb
	RA7fapnn/EQ/0DxD8LC1xoTSYvgrw456Shv+AzsezZeqEmmyV/pDrV6y10awUA+58IQlsZH/A==
X-Received: by 2002:a05:6512:2c86:b0:5ae:a348:1292 with SMTP id
 2adb3069b0e04-5aea34815d2mr45473e87.38.1782365640650; Wed, 24 Jun 2026
 22:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
In-Reply-To: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 25 Jun 2026 13:35:37 +0800
X-Gm-Features: AVVi8CcTmMqcRiP9802pZDxyIJzSjqDj0HrKRWQTIvD6r3wqR2s-_IKZO7UmEjM
Message-ID: <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_223406_448703_796BD78A 
X-CRM114-Status: GOOD (  24.09  )
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

Hi Maintainers,

Just a gentle ping on this v8 series.
All review comments from the previous versions have been addressed.
Please let me know if there is anything else needed for this to be
applied.

Thanks,
Kyle

On Mon, Jun 15, 2026 at 10:44=E2=80=AFAM Kyle Hsieh <kylehsieh1995@gmail.co=
m> wrote:
>
> Summary:
> Add linux device tree entry related to Meta(Facebook) ventura2.
> specific devices connected to BMC(AST2600) SoC.
>
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
> Changes in v8:
> - Addressed review comments from Andrew Lunn:
>   * Added a detailed comment to the Marvell 88E6393X EEPROM node to clari=
fy its hardware I2C multiplexer isolation and out-of-band firmware update m=
echanism, explaining why there is no concurrent access or multi-master scen=
ario.
> - Link to v7: https://lore.kernel.org/r/20260611-ventura2_initial_dts-v7-=
0-a61d8902bc5f@gmail.com
>
> Changes in v7:
> - Updated the commit message to include a detailed description of the Ven=
tura2 platform's purpose and its key hardware features.
> - Fix comments from Andrew Jeffery:
>   * Ensured consistent blank lines to separate child nodes from parent pr=
operties and from each other throughout the DTS.
>   * Sorted fan nodes in ascending order.
>   * Replaced '//' comments with '/* */' block comments.
> - Fix feedback from Sashiko AI:
>   * Added 'idle-state =3D <6>;' to the PCA9548 mux on i2c4.
> - Link to v6: https://lore.kernel.org/r/20260610-ventura2_initial_dts-v6-=
0-375d8e9d7ebf@gmail.com
>
> Changes in v6:
> - Addressed automated feedback from Sashiko bot:
>   * Clarified comments that io_expander0 and io_expander8 physically shar=
e the same interrupt line (Wired-OR) by hardware design.
>   * Removed leading zeros from unit addresses in DAC nodes (dac@c, dac@e,=
 dac@f).
>   * Removed unused properties from the adc@48 node.
> - Link to v5: https://lore.kernel.org/r/20260608-ventura2_initial_dts-v5-=
0-37ee5bcf58b6@gmail.com
>
> Changes in v5:
> - Addressed review comments:
>   * Added comments explaining the necessity of 'legacy_' prefixes (hardwa=
re label collision), pre-allocated I2C aliases (future expansions), and the=
 'ledd1' naming convention (schematic alignment).
>   * Removed the empty `&mdio0` node to comply with upstream networking su=
bsystem guidelines.
>   * Removed the redundant `&peci0` node.
>   * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
> - Hardware/DT alignment updates:
>   * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina23=
0, ti,ina238) to accurately reflect the current board population.
>   * Added the secondary flash node (flash@1 labeled "e810") under the &sp=
i2 bus.
> - Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-=
0-806b00ea4314@gmail.com
>
> Changes in v4:
> - Fixed capitalization: "ventura2" -> "Ventura2".
> - Reordered I2C child nodes in ascending order of unit addresses.
> - Enable PECI, LPC control, and KCS3 interfaces for host communication.
> - Configure MCTP controller on I2C4 and enable MCTP support for specific =
mux channels.
> - Add Infineon TDA38640 and TI INA230 power monitor nodes.
> - GPIO and Pinmux cleanup for PVT:
>     - Aligned gpio-line-names as requested.
>     - Remove unused or non-existent GPIO line names to align with Ventura=
2 PVT.
>     - Update specific GPIO pins to empty strings where signals were remov=
ed or consolidated.
> - Adjust SGPIOM frequency to 200kHz and update signal line names.
> - Enable UART3 and add serial2 alias.
> - Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-=
0-2dbfda6a5b47@gmail.com
>
> Changes in v3:
> - Add annotation for marvel 88e6393x
> - Modify the gpio-line-name
> - Modify the node order alphabetically
> - Modify dt-bindings document for rmc instead of bmc
> - Move the gpio-line-names to original node
> - Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-=
0-f193ba5d4073@gmail.com
>
> Changes in v2:
> - Remove unused mdio
> - Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-=
0-1f06166c78a3@gmail.com
>
> ---
> Kyle Hsieh (2):
>       dt-bindings: arm: aspeed: add Meta ventura2 board
>       ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
>
>  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
>  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
>  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2903 ++++++++++++++=
++++++
>  3 files changed, 2905 insertions(+)
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251222-ventura2_initial_dts-909b3277d665
>
> Best regards,
> --
> Kyle Hsieh <kylehsieh1995@gmail.com>
>

