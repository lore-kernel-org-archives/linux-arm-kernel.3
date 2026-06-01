Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853EECD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glLTXShkm5YP1+5MR78Yj0KypTdD3fdo1XmOBdHITCM=; b=vsAHyoJMr9PGg72jUm3S2POKKr
	tOn61i3jWQdmuwNtyLJKP/QFDwkerSIyTHQuM4pln12emUI7PGnsAxhV5mLqR/FF+dCn6Cq51uO7N
	ncoczzCcWp80gDM/F75MXGandyclbM6fSIe3e1C6B3YUka0eWUku0rqQuJEUCWyPiDvVhdeNszlLV
	o4PV9ORGLoOQ/f6UwdadTjnvPRVfJE8X9PzLxxdPM/FGtpT6ULQu7+lWLPjoch0ZODWK9SgQRa0AI
	dkVskr3dyjuOmab4PkT84MSMVkr2daJULgBEMQjPeSoappCUI14/w5cGsUGlKVjpGdBvqjJDPI4uq
	HhHSIJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvmF-0000000ABFX-3oty;
	Mon, 01 Jun 2026 06:05:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvmB-0000000ABFC-3KVr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:05:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so2198218a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 23:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780293927; cv=none;
        d=google.com; s=arc-20240605;
        b=Rme6eFSbE5DFcemH6Tojy2DA5b6HcK5Pjj0eWfeL9CLyPqtEWpsmrDCCu0KfAoCvcS
         wZ277yfjDaYEAglIOksbA9831KTKAj00huo+ZVAG1FsI25Xp/qfWPqYHZCYo25L+QINH
         ttm4qo3Vh0xetIoQ4r7DlV+NbjOacARB2iz0tnitDQemxFqDfYjAb/Qmm8i+n0fGdXQg
         aTxE5tgZ9A9hq0AiAIXnlcq+sP+doGwwkY5DcRBcoV8utvAjWEYKJqTSAuB1RrXV8+/W
         B8X5tfeNL5xM2tbe4hTcO0R2l9MfA/aBb6XXuzQXRC9pl+c1ss9mwLAv+XFNXU3zuIJt
         zynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glLTXShkm5YP1+5MR78Yj0KypTdD3fdo1XmOBdHITCM=;
        fh=1L6L5ZlysIsnmEbD95TH1/5G9rU0w/ZeRlu2cLic7+8=;
        b=LcHwNkANULE5nKyvnmR78MYRpxpr09J2XWuEYiiSo5OdJD6kjabDyjXvCiWSK31pFF
         Hf0dTcqLpyCjJrR9xs2oEv0RtbZt3rjU30+rnHgnlyhKHfq0L8w6wERk3HiAW69cbVKh
         2DwqAgS/8SgkMMlLU1czTxUtsF5RhhNKho+P0e4F1AdJKQ3XL5pKzdPmXngMRcZbA45z
         sP8CpEwRp6rZc2ATadab0HvbtLPF5s1KVuaH2ASejABDo2jUlOZlgklP1A0s93FSA7gD
         2u3khBo4iBZU3fl5CRUNDNVbG7Ss80BTtvBKOzjEjIR3YAJnq3TH46z39DpSk6WiKXp3
         g2iA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780293927; x=1780898727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glLTXShkm5YP1+5MR78Yj0KypTdD3fdo1XmOBdHITCM=;
        b=B4rvrMqiCC0/ZWMEulZOuSBa0RPyEMpf15aMfu0+YfnRu+VFzZnUE3sfepqGL//itW
         vJKAM7jmD1j8hPUho/bnhgczxpE/yLqyoOh/+oicg1vvx9UDfDabb02HZIVWUoZ+RxZG
         01PBwZ1G9ItRZkMWla/j2Pw/ypsZxv3WvcbIBtX4D31G6bW+6Y/4VzR9s4vuf7O6Cpqt
         9rZf+J1/SidQOfAoE1vYqQz5neG4YgF8qOzvk8mc9gn4dMDZ5oUipQHrvp9m8PcwA34F
         /iqnqXCKFm4n9jLkw4a+3+sEwGxKQPtx2EmNOFSV8JdlH3rWO/nnFbCCleKb652+O6b3
         uMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780293927; x=1780898727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glLTXShkm5YP1+5MR78Yj0KypTdD3fdo1XmOBdHITCM=;
        b=HC/aeP8u01l1+iT9W5Mk0pE+EKdoSd8yhuVPbtBiSKryuGk8x+Xgm/41xYKgDE3rP7
         /R2h+8kjyHLHXF111bI+N+Xd+NwfDkFdrOBOjC8Kb26It91tg0WxBDSYKKiIFRdRf1ac
         1ZNWhCm1wmLbvw5rS7speCB4V0DGCLPKlXHDLHFE7DNR9Tpc16HewROtFarzaO2zfwJ1
         6L0vDNE4C95PkTbxa48G/xCKtwV2fH6Z7H+YXblIKglQ1iNJRwZF0gSAHJwlQo3Z28RU
         GTEbQ55IDZsYqYxLufN53ZhySMTCszn+L+GOk8424dpuWCR+w7w3WO8y5k9aD/PAvKI8
         Ke1A==
X-Forwarded-Encrypted: i=1; AFNElJ96suXomGBuKlV8kJmv4isp7YCiGbgHD7mVtJF60u2omr9XV/T86WONDc9ptHYBMSyEsns4ExTn8t8NukbxFMBp@lists.infradead.org
X-Gm-Message-State: AOJu0YxBX6d/5BeBNFp4Y7ersLIpn39A7qHYRrReOW45rUOdyjLR5QwT
	DQktNJ3X7mrg+/qP/BySAPkQr9LRwnO/XzOCiSdeg7+A1INWxnTGdTrZbi9l9g4loyuCNA2UFov
	XlReVRuHKXwtD3HSYLIQPrQ0ORI567R4=
X-Gm-Gg: Acq92OHy1e7VpRriLGi0i4pRCjcI6fW9QRRx+j8MCObAo2uY2b/egrcgBaCC39rGF3c
	zEtWu0XvJCeO4/3NuDZHUhJs8L3ukWYWHu6bMl0iSCCEwa6lg1oRWoDZZ8FE8+rmLF/YE9hm+4K
	XPFqPLIkWOs9Qq7hajZpXC3fJshIXijStaWT0AoU35pmTJ24TpY1T3EBJskvibozCoXoOQZXu0S
	zuWU9InShKMyNXWgrSTXHICQHMMzVLBb+c5U3LS2WYUfVybR5i8OHxMAmXCfOgCWdvgoCqioShG
	FkXnaIko6xwP5cq81tc=
X-Received: by 2002:a17:90b:5704:b0:368:b01c:85a0 with SMTP id
 98e67ed59e1d1-36c501db7b8mr9360839a91.14.1780293926650; Sun, 31 May 2026
 23:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
In-Reply-To: <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 11:35:14 +0530
X-Gm-Features: AVHnY4LKTOZKUlPxUKSEpglGPR9NoZNvIqTRTd9Vh-G5jAMDbvZ2ZfNVIZn_hGU
Message-ID: <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Andrew Lunn <andrew@lunn.ch>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, jacobsfeder@gmail.com, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_230527_889363_E212675A 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, Jun 1, 2026 at 1:22=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
>
> In addition to what GregKH said, look at the vendor information:
>
> https://docs.amd.com/r/en-US/pg080-axi-fifo-mm-s/Core-Overview
>
>   The AXI4-Stream FIFO core was designed to provide memory-mapped
>   access to an AXI4-Stream interface connected to other IP (such as
>   the AXI Ethernet core). Systems must be built through the AMD
>   Vivado=E2=84=A2 Design Suite to attach the AXI4-Stream FIFO core, AXI
>   Ethernet core ...
>
> when used for Ethernet, a uAPI is not needed. The FIFO driver would
> just expose an kernel internal API the Ethernet driver would use. Are
> there any Ethernet devices using it? Is there a driver for the AXI
> Ethernet core?

As I said to Greg K-H, it's 'chameleon' hardware because we don't know
what it'll be used for. It could be SDR or Ethernet or whatever it is
programmed for. The main thing is that it is a streaming interface.
But we cannot assume the use case.

> Does drivers/net/ethernet/xilinx/* duplicate the same
> code? xilinx_axienet_main.c says:
>
>  * TODO:
>  *  - Add Axi Fifo support.
>
> which could be this.
>
> As GregKH said, find some hardware using these IP cores, or synthesise
> your own, and then work on the driver.
>
>         Andrew

Yes, the Axinet driver's TODO suggests adding AXI FIFO support.
Currently, it routes
packets through the AXI DMA engine, but the TODO mentions:

 * TODO:
 *  - Add Axi Fifo support.
 * - Factor out Axi DMA code into a separate driver.

This suggests that the AXI FIFO is merely a different configuration of
the axinet
driver, allowing a Xilinx AXI FIFO device to be used for ethernet.

It does not, however, establish how the AXI Stream FIFO IP is intended to b=
e
used outside of the Ethernet context. Since the AXI Stream FIFO is a
general-purpose IP block used in a variety of FPGA designs, it is not yet
clear whether the Ethernet use case fully defines its role in the kernel, o=
r
whether it should be treated as a more general streaming component with
multiple potential consumers.

Thanks,
Arihan Bhor

