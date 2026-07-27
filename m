Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B47C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=; b=fXlQazmN+48MFp3a4ssUhi8Ej9
	ycS6kR3I/A4+HoD+h0DbulrOuOennOTZd9UJj9kgQ6h2uiieWf6KNhQ2oIG1pV9jOwhZ0WGZnCG/0
	hFvVuNQO7DyOB3Xkm+Ai9TevdTjvLbmUUfU2PyGwIcbyJRvEqR0IsQ3wBnvneMK+RkIPdmJpMwKMO
	WiaaOD5BYlFSAOBk5tdu/AiAaFepVIgVPwXgP4qArwP5eSK8VcX6wjzwR0YfY5lb7uCg33ZCqZnLw
	CxvcQP0P/qLkUuoTE5cWoGkzl/xSwBjE303UL465MjDukCCmeqaWGLKAfagGaA1ouJypWmJv50wGt
	rekQvsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFcT-000000026Vq-2jJ8;
	Mon, 27 Jul 2026 07:19:25 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFcR-000000026Ux-1QyJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:19:24 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-92e5cb052edso174090285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 00:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785136762; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbACfLvA9buxhPQR9DQfoQzpv5wMe6yyw9iA8Hi/dyyqTqG6qkw6SONzI+Btsirq1v
         YbfxQYy6e2ewFGpFXL90Gt/0egP1m76VOLSbcokZ0WvsnA+lWXGWdkusijq6k4aXprC+
         0La/Cvtq6CMCtgBTR9g8juX1hc0me9fYWQBwsZBMRMzlBkLt6fawJC5iBeXrpAzMJ17o
         +2AOzDjIeVF4//A4DkotGsNsC/E4oPyq0cKHw1vxB5ESsIGFMmRa67vuMOPtSNy/L3nJ
         F4RARkMziSGvXN3klPzl4ZsP2bIbo+dByO3tSEKreIECRGd4AKFelzLGOnM06sCHQmcw
         ETPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=;
        fh=4kyjEIxa9t912Z3XhtCreSZWOca7h8wyMBnFAkBMths=;
        b=T6+PkmdttcJ0N/R3ZyABSj7sjShr7UkZSsGCV42SLLglcrtStbqGZk7CkGAl54zRF/
         gMbrTR0gwVcqFvBQtoD/mtl/nfLWgUfAYfLzsoDeBswgG7UCL4Xlmy1lFnbOANUwgRgy
         rGa10qOADWildoxYifY89HdTwVXnR0muDfJshk18Lyz7N3Vfv53p0YAfFSNvcFal6Pmy
         aiHbHH9fUaYnJw3M4p8bYg/55XBTJiTbFZsDvpQNkytZaqkdJNwRorWnFO2IUIXk2l3H
         Oz1A84fKqoqq/qXZmn9CK0ViAvyAVpPoyxXleWF1FSK9CSbNRrAHk8CmMRCKwnaymvMS
         MQyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785136762; x=1785741562; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=;
        b=bnebXYtJqWRhnbop2k75gS7FxEyNHkoy6yEOT770uvbpinDzeC7lZYwiaCModuZU3e
         +kMHhiW2V42pKAgLpBE5VjYebOEhbU1ItQ9L1u88MC7so+vKLNJUBo3TK44smeoF0hm2
         BoyzmUr/srOn70mv6pxP32DQOF7PH9DgTR0unBEFWDzNV9tLLOAmO4n67gqMaPl1m6D+
         qanhI4fPKz3btab0GkYsw4uSUKkFkIOP/xbuow0hKAXgNw+BbN/PxoZlqtK+vyHAJRuu
         0FO4XUKXDfvSykbLoQ419d43dIYAveL0A7pi9SbkjVn1J9zpWTHWG27evucYDmUOotW9
         n0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136762; x=1785741562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=;
        b=YJsk0Jl8Co0kZajQjkhYlEvDSoaGag87t6Y6iqu35H6mfMKP/ZdKdjTtZZ903q8pU2
         vYAMNSgnMdS6/1Yx6tE4Fnrz9nRfkPHpwxbNbXk9c+fz3di+Mm+kk9f3R9+bYx73f+zx
         t7GZGhTfevHVZ30hGWpAZbxyh4tK0TT8lRjwUQlzs912wPiAKCwvHMwPLoctZbw89pMK
         ZunxR40S9CGAoNj/enS4iqUwWjUWakQ6CjGEin9WVmL4vEGGn7KO2Y2UQ7H3ZGAC9CtO
         6zuDSejVmb9dlcrhnk0WacJBhKA2ZNa5VkhZWK8ft5u70EOlmaLlTxMzPR4+c46w/ePs
         CajA==
X-Forwarded-Encrypted: i=1; AHgh+RoqA9GnlP5bcC1DNTqzUyLkrX2YX05/nC5d/7SooXkzd4+/YnVuHtQO9mHLWUCexWZWAwJ73//KDEoWf79WnkYA@lists.infradead.org
X-Gm-Message-State: AOJu0YyOo9QBBqr4V9L0LCaxDPV6pX6+E3qNgn2aLNNX8BMocf3VaKG9
	o81TuZxzFZ+jv5dcGrtWqNFUV5sDdK+Bt9Z6mavdOE3Npj+NR+r0xG5FNWR3ezXkqTsZ8Rv/hSj
	007nXpZdLeEByWES6RySHFQAuzjikGLQ=
X-Gm-Gg: AR+sD13MH+r3tqvA04tyGjUju5UDNDnMhSQ6ANuagJ6Axv86sOBCiTkjUp+L+dNoTpv
	PlT3eV1gtt32juwD9infilwY0w4W0+kEAdVKN7VbzWFqP8UpM85fEL5/jqqBnPJ4EOvXubULYJb
	KXQZiqc/sJpV+t+UwtL7AgRWhDika07KycjSD/+sKePGIen8VRd7bvvBt4TcpM1oogNIwy5IADj
	EanqQMYcYcL2t+1/w0xLzjCWEVT0eUZf8ysReVFsM+KSLwIAaoup9ULnpCxyAFP3qDyzs7bfXgj
	IeK2Yts444XVUU15bQ==
X-Received: by 2002:a05:620a:a41c:10b0:92e:4e88:f453 with SMTP id
 af79cd13be357-932df72fa5emr557474685a.52.1785136762304; Mon, 27 Jul 2026
 00:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260727021048.3375444-1-attinagaoxu@gmail.com> <dae67c46-62b6-4233-92fc-69a09944baa5@bootlin.com>
In-Reply-To: <dae67c46-62b6-4233-92fc-69a09944baa5@bootlin.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 27 Jul 2026 11:19:09 +0400
X-Gm-Features: AUfX_mzMsY03HyPmF8nz7hhTY-FL_h-TDf2dzG1Lg1NUJL_NPUJrMPEieD7G1Rs
Message-ID: <CABjd4YwyBmTvw6cVQxLEzZEXSRb4QFEuQmrYY56WdmSfs-z8Kw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: dwmac-rk: add RK3576 GMAC 25M
 refout support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Gavin Gao <attinagaoxu@gmail.com>, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	richardcochran@gmail.com, nicolas.frattaroli@collabora.com, 
	sebastian.reichel@collabora.com, sashal@kernel.org, 
	chaoyi.chen@rock-chips.com, amadeus@jmu.edu.cn, rmk+kernel@armlinux.org.uk, 
	horms@kernel.org, alok.a.tiwari@oracle.com, david.wu@rock-chips.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_001923_391006_7BB54A70 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Maxime,

On Mon, Jul 27, 2026 at 11:11=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 7/27/26 04:10, Gavin Gao wrote:
> > Hi,
> >
> > Some Rockchip GMAC instances can provide a 25 MHz reference clock outpu=
t
> > for an external RGMII PHY. Boards already describe the MAC clock direct=
ion
> > with clock_in_out =3D "output", but the dwmac-rk driver does not curren=
tly
> > request or enable the corresponding 25 MHz reference output clock.
> >
> > On RK3576, this means the REFCLKO25M_GMACx_OUT clock may be disabled by
> > the common clock framework as unused, even though the board expects the
> > GMAC block to provide the PHY reference clock.
> >
> > This series adds an optional "clk_mac_25m_refout" clock name to the
> > Rockchip DWMAC binding, wires it up for RK3576 GMAC0/GMAC1, and enables
> > it from the dwmac-rk driver when the MAC is configured for RGMII output
> > clock mode.
> >
> > The clock remains optional, so existing device trees and SoCs are not
> > affected.
> >
> > Tested on a PicoCOM RK3576 ACP board with a Motorcomm YT8521 PHY.
> > The GMAC 25 MHz reference clock output remains active and Ethernet work=
s.
>
> I have a feeling this is using the common clock framework backwards. The
> MAC in this case is a clock provider yet it uses the consumer API.
>
> Shouldn't the MAC instead register a new clock, as a provider, for the re=
f
> out ? The PHY device would then need to get/prepare/enable that clock.

The clock name is a misnomer frankly. It's configured in the CRU and
muxed to the output pin via IO registers, so it has little to do with
the GMAC itself - rather it's SoC wide. It's already exposed by the
SoC clock drivers, so nothing to be done in drivers/net/ethernet.

Looks like Motorcomm PHY drivers don't request the clock though, thus
we're seeing a second nearly identical attempt within the same
development cycle to shoehorn clock enablement into the GMAC driver
and binding, where it doesn't belong.

Best regards,
Alexey

