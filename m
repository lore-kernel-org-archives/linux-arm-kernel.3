Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A042CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUZI7/7gjTcJObK6S9x9OXvUt5/wvIr0TD3UHQ6Mplo=; b=nl2ZbMOjMd2SJJO6P/hO7BUYZy
	gUVdkgdn+bCJvHtUA/u/ObIAQ3DZH21JmWVPIqubpbuO2S0WVstUPk4AO3YgAaUjng0LwzcN/f0f2
	Kad6Wwx9h1bMrif8aL1mq+1+c8a8Sq+a5CLnsE6OeNOFH//ETdpE2aiwYWVbUoEADfLxnf9CQmXLB
	+yoyLkME4TyS3rFqOhrS/O+aYDjMBvoMOJhYuTrEsyxW7fLo5T0WIeJPeDR0j0gS/v+pMNfJgdCp7
	J41tO/2keYCiGtgY6S7hD574MUWe934xVip5VHAdR8MQPFOny7O1kqEiFY2ApcIE0+YKyxP2fm8wV
	c+veRLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7O1-00000008i9G-2Nq0;
	Mon, 18 Aug 2025 21:27:25 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5fy-00000008XZh-0XVr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:37:51 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b4717330f9eso3216204a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 12:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755545869; x=1756150669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rUZI7/7gjTcJObK6S9x9OXvUt5/wvIr0TD3UHQ6Mplo=;
        b=Ha0Fmj3Wi5Jg7O8Z4fvIsjsDX+6ySgI65gjnQEA0HsvfWKwsMjsTzMp8/ta4Yo11aH
         Uve8eE3+eEhuXfEm47JMBsyz7/hwobE6DG+CRKF3BhYuk6udCo+D37pH9siiyiHqf9Er
         LaUbPA0K559pJP03GGvtEfYlyEW6XGjKwIm+WZzidwCQEVHW7TMnjY/se7kDWf3LRQ4h
         xqivWt17ocska/W/beaXcKBWpyYI4f6VaOJZ0R4c/3tknwx2JuCBZpCujRfeQ2xQR3sg
         T0YQuWO9TTqFFADDcRsiBchQr0PmIzLqulLqaUbDVot1gf/IEnadaWMx29EZxE41t8VW
         MPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755545869; x=1756150669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUZI7/7gjTcJObK6S9x9OXvUt5/wvIr0TD3UHQ6Mplo=;
        b=wkFuneyc/uUM8aF41Z6LZSAdBt3apGsNVPfmqKe8iwUD4WKkJQf9y/nODOumpkvW3/
         0ddA/69MNYfx55/RqwJUBINaBeBkHqBDvYAFzhpzKCq5ciekOPOz3WvnhAIHTQnFBXvN
         fVdZkp8tfzZ7Dmv9G1FfpkVhdiXqJOdEStprHFgL7OfB8K8yNO0E+JaboB8Kjcp6NUH4
         +zKsJIi5ExdexZnCK+gnsOEPzpQGFwGan/XsItdDUfIEgCGFD5cZhQ2YGYPgpsl3Y+Ug
         yMwW6GxIG3rjiPGB3C/J0rewRHapjZC59oaAZCggx5eQQtuHiJYiDV5xmvZvHrbUllxp
         YFIg==
X-Forwarded-Encrypted: i=1; AJvYcCVagqTe97pfH96/PNfCu65D4tnJv+x69UfazYFt/gxItFIohLao6wgzwhASkVkH3zGgNWDCr6hTuRtZUEIr4Soe@lists.infradead.org
X-Gm-Message-State: AOJu0YzJt6ft3tPz80WeKtPWZyKLlDLAN3mEWBAXrMSLvVQjDjgXORj+
	Eet6ddPJzJUslBrm7GZE7+55mVxygzUnHNcrs7ix876R6KTAqrUP/FE1
X-Gm-Gg: ASbGncs1U3nnRZ8jI9uq4DsHGaqIlfRJYR8n34u6gapxBJ4Mi2KsQv6h9gG+/5xlW7f
	wv2k+Qt1fFDh4WCac1En6/lekcrPAIGydnvKT6T9mfNGNy4ckm/EYH8db8nmavcoHOK0rynyx8J
	gpk77IMbxo/rDrcZSPjSWG1fh0wPOPEdIdPfDqwsmJicCVr71VtIgRkUIIE4pcrbDTE+mRySI67
	TjmizpRf34kFAFhH5E4kAAPxQX2K/abdOeHQVLgnrn0swXW12dNfqbUHdEqXV+r63Ds/G8td6Vv
	EcxdUCTYIvhtfCuJT2f+5+Qi8GvnTioAqKC612mJUy9HobLUI+l+wfpsxx87dL/fTeZOrt/4muv
	d3EEFJnqaZW9CWhmhifg=
X-Google-Smtp-Source: AGHT+IFZD11SWLoIJGMw58DJpFTb40+2v+CLj8vwZcCfGd0/G/oVJ1klzm8Wz9czNbGBeMbJk9EC8Q==
X-Received: by 2002:a17:903:2381:b0:235:e1d6:4e22 with SMTP id d9443c01a7336-2446d72558dmr174030925ad.18.1755545868897;
        Mon, 18 Aug 2025 12:37:48 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d554619sm87613115ad.141.2025.08.18.12.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 12:37:48 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:37:41 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, u-kumar1@ti.com, 
	hnagalla@ti.com, jm@ti.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
Subject: Re: [PATCH 18/33] arm64: dts: ti: k3-am62-verdin: Add missing cfg
 for TI IPC Firmware
Message-ID: <qxrtnwqsc5buihngdw3n5oqzj3yrrspvlfp3yn2aat42io5k6y@g3oqljr3hbvf>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-19-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814223839.3256046-19-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_123750_185053_ABE3F959 
X-CRM114-Status: GOOD (  28.04  )
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

Hello,

On Fri, Aug 15, 2025 at 04:08:24AM +0530, Beleswar Padhi wrote:
> The wkup_r5fss0_core0_memory_region is used to store the text/data
> sections of the Device Manager (DM) firmware itself and is necessary for
> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> for allocating the Virtio buffers needed for IPC with the DM core which
> could be optional. The labels were incorrectly used in the
> k3-am62-verdin.dtsi file. Correct the firmware memory region label.
> 
> Currently, only mailbox node is enabled with FIFO assignment for a
> single M4F remote core. However, there are no users of the enabled
> mailboxes. Add the missing carveouts for WKUP R5F and MCU M4F remote
> processors, and enable those by associating to the above carveout and
> mailboxes. This config aligns with other AM62 boards and can be
> refactored out later.

Thanks for the patch. I was actually preparing to send the same changes.
This is relevant for us because previously we used a DTS overlay to add
the remoteproc functionality, but we also want this enabled in U-Boot.
By adding it to the DTB, it can later be synced with U-Boot so we can
use it there as well.

I tested it on our board, and it works fine in both the kernel and the
bootloader.

> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Verdin AM62

Best regards,
Hiago.

> ---
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
> Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> Cc: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
> Requesting for review/test of this patch
> 
>  arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 43 +++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> index 4e9a8921c95d..fba6f5c8d099 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> @@ -206,7 +206,25 @@ secure_ddr: optee@9e800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
> +		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9cb00000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9cc00000 0x00 0xe00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9da00000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9db00000 0x00 0xc00000>;
>  			no-map;
> @@ -1321,6 +1339,29 @@ mbox_m4_0: mbox-m4-0 {
>  		ti,mbox-rx = <0 0 0>;
>  		ti,mbox-tx = <1 0 0>;
>  	};
> +
> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <2 0 0>;
> +		ti,mbox-tx = <3 0 0>;
> +	};
> +};
> +
> +&mcu_m4fss {
> +	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
> +	memory-region = <&mcu_m4fss_dma_memory_region>,
> +			<&mcu_m4fss_memory_region>;
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  /* Verdin CAN_1 */
> -- 
> 2.34.1
> 
> 

