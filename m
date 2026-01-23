Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27BED74ED7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T4Q453c5FamHIEguPjFSHxEM5Rnl+xXzrGuGiGD+qg=; b=pM8SQP1RmKapK7hewjNHD6U1uS
	r1eDtJGG3l7S2W1D/GS3cUSld2SljLrZv6DCilGAnnw0FfSRqoEl2K37OSG10mu+hWumgDHdTyO+a
	so3MbO20O8O+YP6ay56Omnu7Iyl9/01xc5U7IyHIhpn2OGAIAbMX3JSKTHARK8ohy+W/214tLRjyZ
	WisOZMVoMlSQMpWgpv3JTMnnw8gybPODs5DVtsjN1rM4/WXSIkP1PWc1Tx5F1IP7Qw3DrT9GocYQG
	RkIJ/ke2iFbh5LLldFcQQwVpbtybt7KwBpwSE/uoAAM0O9rIbePyZSIprOpmdSuciSZjIQOuDMv23
	lT+YGHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHOE-00000008yvw-07bW;
	Fri, 23 Jan 2026 13:39:54 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHOB-00000008yv6-2xWQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:39:52 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56373f07265so1892289e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175590; x=1769780390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T4Q453c5FamHIEguPjFSHxEM5Rnl+xXzrGuGiGD+qg=;
        b=fGCNADkDptGaTWBvM1xNK1WZFtqjoHyhTIbSnqxzou1xt1LG1+PQW16C7QAx3823H1
         WodHxb3FkkjBfXKlHpQX3c/ZEEj4BOJlXSxT6btN5vXgkdIQ9nDkkCZDNOvU2iB/dIcn
         quOGRv8ab4E5ja83m2FiKKSg8qjRSs4dQbI+v4W1WIFzLUTU7D6f95PNfZ5bfVWZrB1e
         vTz/uLtXIcptD9MFcwhMlAtESdmkH/GPEjXgDmyok6U+HU1DjdAJAyq694Pjfqg38JEB
         z3ES3M35UqcUUfHTwEuoQUqezqgnLIXlgbyfbXtYaTTuat4+U3z6x9Xr5391iba+4JdD
         PxWw==
X-Gm-Message-State: AOJu0YyRYtIPeEBzhm6aLfCDPDoYLz5wlrA6UJoO2DlXnXDtsEDc+5/6
	zVDGT9bt5P7x5AhbiZIOcOH18+2U25XIII4wveCj/g5UBzRIWk6Ao1VEGotVIzir
X-Gm-Gg: AZuq6aIl1/nhl3sozA3ZHuqqC2YhR2zluOTDCJTg09uh4KcNxw8g29R3NdseSkrSKOu
	shPopItRilk56yofcqmMt3IK2QhMWNv9Gt8e2i+welUlAsIG/qjVRzyLel7rGzKFq7DM3dwtd/b
	QYWOyG3FDpcdJ9tUA0zCeTDX6kQEsJML9xg2mKXz6rIH0/xgQp3/6c3Mt6qike1W5NeAqSmz7uH
	A0VF8gOp7i59XsAMB4NrQIpLkObmdhzRoi1Q4tC0W8ocx6DH1IMprke6nNdpbpCunmH8ReCuRhb
	syyHbsPWS2ai8BNvx2/Z3fX/If3MoucXzA/1A28KmrU8ON85Z6jJwctWoZIzXVa5uVH1jkWrLXd
	SHEAoxCwAR9HVmvbC5RM0pNOGLT4aVktU+XImRjX8HQ+OGRLhntYHbYnOxG/mPY5ritu3UQl4YK
	Vp2+XJXXw35VbLJ4HNJClipQOx/zMziKF1lRjOXV2tkbFK9UK/
X-Received: by 2002:a05:6122:250a:b0:556:9cb9:65cd with SMTP id 71dfb90a1353d-5663ea940e2mr905254e0c.6.1769175590353;
        Fri, 23 Jan 2026 05:39:50 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7f019sm472812e0c.18.2026.01.23.05.39.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:39:49 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5f52ed75c45so1752772137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:39:49 -0800 (PST)
X-Received: by 2002:a05:6102:4405:b0:5f5:41a4:f166 with SMTP id
 ada2fe7eead31-5f54b9db4d9mr883093137.9.1769175589225; Fri, 23 Jan 2026
 05:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:39:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUERxbGJN7muntQyyYZL6uy4eh5bJUmMPBmppA8y803DQ@mail.gmail.com>
X-Gm-Features: AZwV_Qj1omzI-6qmH4tEn10AVrvuRYh99XIsZ2j_jsDkAgxLig7Gm4WvDQM34Zk
Message-ID: <CAMuHMdUERxbGJN7muntQyyYZL6uy4eh5bJUmMPBmppA8y803DQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053951_751741_0F81DE97 
X-CRM114-Status: GOOD (  23.64  )
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

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on Ebisu
> board. The clock generator supplies 100 MHz differential clock for both
> PCIe slot and BT/WLAN expansion port, as well as for the USB 3.0 PHY.
>
> This configuration is valid for SW49 in OFF position, which means the
> PCIe signals are routed to the PCIe slot and U11 9FGV0841 PCIe clock
> generator output 3 supplies clock to the PCIe slot.
>
> In case the SW49 is set to ON position, which means the PCIe signals
> are routed to the EX BT/WLAN expansion port, and U11 9FGV0841 PCIe
> clock generator output 4 supplies clock to the port and &pciec0_rp
> clocks should be changed to "clocks = <&pcie_usb_clk 4>;". Once the
> BT/WLAN port is tested, this can be implemented using a DTO. Until
> then, assume SW49 is set to OFF position.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -578,12 +591,30 @@ &ohci0 {
>
>  &pcie_bus_clk {
>         clock-frequency = <100000000>;

I will drop the clock-frequency while applying, as there is no point
in changing it in a disabled node.

> +       status = "disabled";
>  };

> @@ -871,7 +902,19 @@ &usb2_phy0 {
>         status = "okay";
>  };
>
> +&usb3_phy0 {
> +       clocks = <&pcie_usb_clk 6>;
> +       status = "okay";
> +};
> +
> +&usb3s0_clk {
> +       clock-frequency = <100000000>;

Likewise.

> +       status = "disabled";
> +};
> +
>  &usb3_peri0 {
> +       phys = <&usb3_phy0>;
> +       phy-names = "usb";
>         companion = <&xhci0>;
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

