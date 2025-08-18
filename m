Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1E9CA0EF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35JWfyFpsZnEop8+iFDta6CZEM405LCjsnR3UpcJ/2I=; b=pD3dJWQgtcsA4dqKLlEQOleeTD
	Xn860PaDk51YFwwIFWuJF2dQ6WBdTGNO2QxdEx8Yb9nOQ94zyalhQ9rFKFow5Igcf2meufDjuyzYQ
	Y5jhXX3+AuMNhdXaZlBZsP0kZFhUqUENDG3q2fFjb5MmeYygdENXFPjNs7FZD2E40G1e5XGNwwvPz
	bjWZY5QWNkpU6CS1PNxnp3uBtCx65zt5JU1QwlqpnxCKD8k3bY2NWYrrfzYP3uFudUX73cukD+ZWD
	HdKUXJTFPpR+n0Hx4Qy9hWkaDaCUwXEqtvFuj5/BgSBd4kQgVBTlOm0Vg8XmqznO5FEPSYL2hG8Bi
	n6O42zDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7O2-00000008i9m-0z1t;
	Mon, 18 Aug 2025 21:27:26 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5hu-00000008XvC-3QYf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:39:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso1077339b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755545990; x=1756150790; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=35JWfyFpsZnEop8+iFDta6CZEM405LCjsnR3UpcJ/2I=;
        b=bXgC8tVHIOhKu36ZraIzkqkfR+wPRMzjEOjvOs6XIccEc71zFC9e1RBBSxl1atnns2
         c4kgjx75hM9FreqXIY2I94079PRfVVL85sfUTZRWsHOhUAbYXbIyTdDltlKfLAG47RIV
         qFZuZAdJSdU9XEsQwTrZrlKXXipepJ4+ALPp5mSLB/XQO5X/JOmoigOR5F3HatKOtCsi
         qms6+bnJD3xa5BG3KhlxaHIHQAFQcNkYwMczS5gDXO0H8QUZlQ/XoVm5zdnsY4ugVKZu
         pxV44uao9aeRRqU9HtAIpsLrXnWXE9aCu6aeFvT3mB+dqt0OQbTemOxqt4DzCW4HXsJE
         2Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755545990; x=1756150790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35JWfyFpsZnEop8+iFDta6CZEM405LCjsnR3UpcJ/2I=;
        b=AvG9Rbq766nuQVFa9gyoIRtfJ787khh7qvhJ84eqzR2GcX66BTp6vj8PLPlnKGiyWp
         gOROJ8Y54tU45IpAPvhLhGYo0U3OThx0iGk5vG4RDT7FTRG+isKwKM/BFawpYtxLonub
         5vtsqoKDJo7/eTnW4KhxGLfXqtJ4QrLukXtKEJxFkf/xmr2ouQIu5v1nj0vwf43uz8JY
         FvzcojYyz3PU1SXnJYgavz0iU9UPewUAPXLL6ROl3FArB4rQo3LBJoo2jk86642kUAlW
         TviLNoQ0MK9ReRe7O6vs9bXAqri8VR+/72izI97ykHeBHQFNFjMJ3NdPtu8cQHmap+B3
         j7MA==
X-Forwarded-Encrypted: i=1; AJvYcCXkyFIr3Xw5AVF21sspE9LkvsLiNCAIQ1kBxPwY7eVuY0fWXV0f67zFR6+MF0c/L4SzmfAFuVCUGQzb/Q8w1mS7@lists.infradead.org
X-Gm-Message-State: AOJu0YzVUdAwqfcGLIdiNq8rb9Qu3GUxSYCSTjaHxiYbVYF5iVqnsMBt
	IIpDpNDF4HGUo6jVWWG6R9ptzGJDdLFet3zgmLAZb3KADZIOxArbiAZD
X-Gm-Gg: ASbGnctlX7p+mGmW66sJw2cP55akb0ff/e8BnhQBJcGiMHGQvHMzhbhU8t3a3hMpe8K
	3nZDmhcZ+AU+Ws7mvAfD2aXRqYHYiMuCmQRYgrZgEJhp5g73utrqCApC7t/Q4+voAy96dbuTa9H
	eWbA5j73wAFErFzs6i5QscHKvd+k7uKZ+WtswQolsoyppWlGwWChCvv3Bof/YuFdh4PgpdbXjpc
	0sDyneXLQqQOFi2Kb+V/zQpvyhCgzOWZexgdXrzCJXiQOkKocTjl4R5h5RyBgkq2FCFbzOVpA8R
	Kl0bYbpuMgJ/8Yv4KmAuT3dyDLOy/yDi7X7QYpI1KDRGLZxV2p5B36m28JwGBVxggwJ7Tyh39Rf
	HKA1f77GG4Zlz0EolzsbDq0y/OOqAbA==
X-Google-Smtp-Source: AGHT+IGydVew6TKOYCHSMUAx1U3DIa9x4LQIW/1PWuj/aMxwX6Vwe2dlC51Swfi7YoObxa0NRbjXuA==
X-Received: by 2002:a05:6a21:6daa:b0:220:b161:431 with SMTP id adf61e73a8af0-2430a6cd5dcmr788844637.7.1755545989791;
        Mon, 18 Aug 2025 12:39:49 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f6ea2sm369307b3a.62.2025.08.18.12.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 12:39:48 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:39:43 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, u-kumar1@ti.com, 
	hnagalla@ti.com, jm@ti.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	Parth Pancholi <parth.pancholi@toradex.com>, Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Subject: Re: [PATCH 16/33] arm64: dts: ti: k3-am62p-verdin: Add missing cfg
 for TI IPC Firmware
Message-ID: <o25lp7k7igtxtyycud2oynyughysq2egn3klnvrelc4dsshye7@2h2jquxcfw3l>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-17-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814223839.3256046-17-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_123950_857993_4B69AC6F 
X-CRM114-Status: GOOD (  22.92  )
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

On Fri, Aug 15, 2025 at 04:08:22AM +0530, Beleswar Padhi wrote:
> The wkup_r5fss0_core0_memory_region is used to store the text/data
> sections of the Device Manager (DM) firmware itself and is necessary for
> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> for allocating the Virtio buffers needed for IPC with the DM core which
> could be optional. The labels were incorrectly used in the
> k3-am62p-verdin.dtsi file. Correct the firmware memory region label.
> 
> Currently, only mailbox node is enabled with FIFO assignment. However,
> there are no users of the enabled mailboxes. Add the missing carveouts
> for WKUP and MCU R5F remote processors, and enable those by associating
> to the above carveout and mailboxes. This config aligns with other AM62P
> boards and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Verdin AM62P

Thanks!

Best regards,
Hiago.

> ---
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Cc: Parth Pancholi <parth.pancholi@toradex.com>
> Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
> Requesting for a review/test.
> 
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 42 ++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 6a04b370d149..0687debf3bbb 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -162,7 +162,25 @@ secure_ddr: optee@9e800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9c900000 0x00 0x01e00000>;
>  			no-map;
> @@ -848,6 +866,28 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
>  	};
>  };
>  
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +	status = "okay";
> +};
> +
>  &main0_alert {
>  	temperature = <95000>;
>  };
> -- 
> 2.34.1
> 
> 

