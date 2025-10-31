Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bmXXuzjcl5tkqtpsDLI7Ks5jxtg3C/3Ehhhx1AW+OQ=; b=JppSpcAo5XL3MQ4jBh5NjRRrfK
	c27QCU5dBJIYJ0L09RcDqQ0/5Q1kKyaJXukig7Hufn3BSTMFjILV5bE+3i/wS5Qxo8ymFcoOuDk+O
	Nng16lrPCyyhomDXO/ykN6Hxqxt88LLTkOFOMO7LPYwR0xaWKTPPa4VXjGhrfZQkBqaK5UfaRuDwl
	cTwdWxtU1AwiTDatQso0vWnYp+qIBcrVepu98hHyiF3IKVg0NGkYI4yzfs/936PmkOnFt92mJP+Yn
	eIqwgkDFSHsmQ5tBAQ9/iwjF1S8k8WU/rCtsS6xmTKHH4LkJrk5jGTvyiQkgSJmIFxhUYURd++UJv
	W1JFB1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfKN-00000005IC4-1jVE;
	Fri, 31 Oct 2025 02:57:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfKM-00000005IBr-2gIX;
	Fri, 31 Oct 2025 02:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8C6D60215;
	Fri, 31 Oct 2025 02:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E85C4CEF1;
	Fri, 31 Oct 2025 02:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761879441;
	bh=KUsx73wI6sPC91XwqDu6VZod5VCxoTfFdHsrrDX5nf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukhDa1qkvjAzY+T6gBWTtd0jrGSBFVBl09O0lJYB2SHzAOkMz6sTMtOR/dj+TnIXd
	 LKZzJvbJ/0Qcoa+mSFCf6INBUkBhBfcr+xfw83aFPRW3DgpByzn8jq71LeoORgFtXF
	 rsspDY5bF10qgLba/5IRnXdYcg6qvi65+5BaZ3g49HXYWerJIuM5AFURncimGWqQgo
	 gJYMwHgKqFcjWR22DcBqvbRcLpg8c0pMZVtQKyhMzYkpO51WfoyYTYXPf/6BhtC63p
	 9a3LBIl6DJQhdIN1PTVP87RynTFfRaInze9g3nZSylz9YcqYTyNxlxhFgvhmOc//U7
	 dNf7nuRJe+ArQ==
Date: Fri, 31 Oct 2025 10:57:12 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Peter Chen <hzpeterchen@gmail.com>, Chaoyi Chen <kernel@airkyi.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
Message-ID: <20251031025712.GA1284354@nchen-desktop>
References: <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
 <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
 <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
 <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com>
 <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
 <CAL411-rFK0o_cxBO_yJFHWurGFKxZGxw6=kpqxRipMetJskTaQ@mail.gmail.com>
 <e2fcc437-0650-4fdf-bb75-3463a80299fe@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2fcc437-0650-4fdf-bb75-3463a80299fe@rock-chips.com>
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

On 25-10-30 14:50:33, Chaoyi Chen wrote:
> > Hi Chaoyi,
> > 
> > There are two questions I have still not seen the answer to:
> > - Why USB2 PHY is related to your Type-C patch?
> 
> I was just following other people's approach. Sorry, this should be removed from the dts.
> 
> 
> > - How does the USB role switch event notify the USB controller driver, eg dwc3?
> 
> Sorry, I misunderstood what you said before. There is indeed a missing usb-role-switch now. I referred to the approach in rk3588-evb1-v10.dts. Is the following way of writing correct?
> 
> &usbc_connector {
>     ports {
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         port@0 {
>             reg = <0>;
> 
>             usbc_orien_sw: endpoint {
>                 remote-endpoint = <&tcphy0_typec_orien_sw>;
>             };
>         };
> 
>         port@1 {
>             reg = <1>;
> 
>             usbc_role_sw: endpoint {
>                 remote-endpoint = <&dwc3_0_role_switch>;
>             };
>         };
> 
> 
>         port@2 {
>             reg = <2>;
> 
>             usbc_dp: endpoint {
>                 remote-endpoint = <&tcphy0_typec_dp>;
>             };
>         };
>     };
> };
> 
> &usbdrd_dwc3_0 {
>     status = "okay";
>     usb-role-switch;
> 
>     port {
>         #address-cells = <1>;
>         #size-cells = <0>;
>         dwc3_0_role_switch: endpoint@0 {
>             reg = <0>;
>             remote-endpoint = <&usbc_role_sw>;
>         };
>     };
> };
> 
> &tcphy0_usb3 {
>     orientation-switch;
> 
>     port {
>         tcphy0_typec_orien_sw: endpoint {
>             remote-endpoint = <&usbc_orien_sw>;
>         };
>     };
> };
> 
> &tcphy0_dp {
>     mode-switch;
> 
>     port {
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         tcphy0_typec_dp: endpoint@0 {
>             reg = <0>;
>             remote-endpoint = <&usbc_dp>;
>         };
>     };
> };
> 

The general hierarchy is okay, just need to fix some dts coding
style issue.

-- 

Best regards,
Peter

