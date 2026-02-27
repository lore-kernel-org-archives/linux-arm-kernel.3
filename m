Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CEFFEFB70
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIpo4Qj00b6qJvtZCixbXNb6vReXLlefaIzRQdEaQEs=; b=nbe/lIU7iEXdSR8n4yBP8+Vagd
	kfHp/5xMEqSeQTmT8PDlrudzVJ2c5PyBWUjSOOBfdsDyXgbvKBfctqHw7uDIoDJEITfmxnFrCzzxW
	ZmN7kljX2eRBpiqk3419EbENjPYpe4fvjbDOJv93geMIwkOa67SnR1x9tqzarQU7K5Xw3ZzLaGstO
	RfgjNLhn3VjVxfC+0QGCYaqEzwoFmIdndlhm55s+P5K9vnLB46OrykBRfsrqHtjvUTmhGVQa/ccNa
	p7J2xTnRrwC9nCc+n9LSVFGISA9uS1gCU7S5xZVry8bWf7EVqrET+EnudepdWyLBx7ysnet/usixw
	fbLZ8Ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1bT-00000008o38-3Kju;
	Fri, 27 Feb 2026 17:26:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1bQ-00000008o1o-2u1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:26:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-437816eae24so124137f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772213171; x=1772817971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uIpo4Qj00b6qJvtZCixbXNb6vReXLlefaIzRQdEaQEs=;
        b=OMP1RDJpijou2yo9S3zIG8p1cx3Uibzk/LbN7H/VCLfx23GXcsegxqC/SEyqzQlJKZ
         TTq7WQljuKOacyrXdMgC2pBX/ZoH3HlVHn8irW1ON4HCj43Q7OmGDGo3XifPpVhILjZs
         lbeNQ9SYbMynIDG6rXgSB15vtNVz+ZIvpEmr7XRdbeA5Ll6TMktYy1RiNgDsAK7vZ2BP
         5ON7QWs0TqQiD6pN2zSVNmLWKwe02R4cqUVSZwgMSbEty1IbbmYs+3BynuG18YnAExGk
         zG61sIso5i8YV7dcni+AzlgkXklTD9vEPq/hGrcycZPE2AfCqASimlY8nKCYl+0Ar04p
         h7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213171; x=1772817971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIpo4Qj00b6qJvtZCixbXNb6vReXLlefaIzRQdEaQEs=;
        b=NsgD6cuVY1JzytvfP/4sTycJeiTdzT1Q/OUlLGQKKQ6rTEZfUCYUVkRDhMQEpEDaUC
         CJHRXGVF3uPp8n2z7XDfq4LFP+dIsJe1qUyjFRBMRnUZgNoRAFHe0hGPn5KnR+NmtmtQ
         QfCSi3DWhzoSSLGAkhvMj6n5XD/STlZWlux3L6Dun4OwNuVtXfs4ym8gK7WJZoHsiy3N
         b/T3nVBJaKTRspRBy+kQyZihYFOTJGOavW7cvEHUQ0NRFcwIXRN250DaGtgVncYnVLsB
         N0RUqgIdwteyWFcpO2t2L26EburK3qyIiGERAcHkZl8GvRyiQKK/hRFyU6mYm+Sszblq
         ZlKA==
X-Forwarded-Encrypted: i=1; AJvYcCXdN5+oH6G1VDGQ4vwHr94lNKqPyNpmBAFTJctwfqOuwx7E4McQRQ88bv4wE6oTwI60c9mkMuhrA74PKEZECBfu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9UUgpRqQkhoCHTHGeM7J9lv8dyd/8AOsC6AimbYlB0WF0+rr1
	9DppJvFntd/ZRXlIAQsAmooVeTHRXb9vDexJcd0o4oxiTrQ9JdeesmGL
X-Gm-Gg: ATEYQzwuylmz7bUgwHdZst2uqteCtiWizh4nquGpwB4hFc5+yvwyKfy7kpD/964I2wB
	YtAgHOY0KRaZ2Fvo/KgvgOLPogVVpVwbF7da3NBA7uPYLozBf0iiX9WV6B4nGTm62M2s4aF6+/O
	Mhi6Me/3ynHQ3ZJ+6VdZVXWr9FrJ0PSMkC4CCg2vRLJGZAVrFuD6qNiffg5J0TYmZOPM0ogydor
	BG7Mz47imzaGkTnXz6IxB7xN2qKh7h7IBrPUXHFIEw/IT2K4Zjz04vD+pbBMcXy+kWcy400EDQC
	K+Q8SxJD00KstuRMooxfRdXK0B9yIwl2N7LZ7rc1kZz0TlP8j5bUXNew1nkKL90clW1IvFf0m1K
	j/IVoMZGPmbR2NTLBrgd6OkXKReNPwSG38nH4M0o6xfnFZrZbYyiPCRFiG2Qm/QkmAAE3+Pzsdu
	V2rccw/f3qfproJIfIYQ==
X-Received: by 2002:a05:6000:186b:b0:439:8487:73c0 with SMTP id ffacd0b85a97d-4399de2c2eamr3410785f8f.4.1772213170472;
        Fri, 27 Feb 2026 09:26:10 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e404sm9220541f8f.8.2026.02.27.09.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:26:09 -0800 (PST)
Date: Fri, 27 Feb 2026 19:26:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Shiji Yang <yangshiji66@outlook.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: mediatek: allow building T-PHY driver for MT7621
 MIPS SoC
Message-ID: <20260227172607.e5x3izmhzwf6tfka@skbuf>
References: <OS7PR01MB136023DAF6E893E8110CEF777BC6BA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
 <3c2dcbf4-7702-42ef-9e61-5f4091e9a85e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c2dcbf4-7702-42ef-9e61-5f4091e9a85e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_092612_734724_EF0A26D0 
X-CRM114-Status: GOOD (  13.33  )
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

On Mon, Feb 23, 2026 at 02:47:09PM +0100, AngeloGioacchino Del Regno wrote:
> Il 19/02/26 13:53, Shiji Yang ha scritto:
> > MT7621 also has compatible T-PHY which attached to the XHCI interface.
> > 
> > Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> 
> MT7621 seems to be a bit special among the mips/ralink platforms, so I agree.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I wanted to see for myself, but I didn't find it.

arch/mips/boot/dts/ralink/mt7621.dtsi:

	usb: usb@1e1c0000 {
		compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
		reg = <0x1e1c0000 0x1000
		       0x1e1d0700 0x0100>;
		reg-names = "mac", "ippc";

		#address-cells = <1>;
		#size-cells = <0>;

		clocks = <&sysc MT7621_CLK_XTAL>;
		clock-names = "sys_ck";

		interrupt-parent = <&gic>;
		interrupts = <GIC_SHARED 22 IRQ_TYPE_LEVEL_HIGH>;
	};

Shiji, did you also submit a device tree patch somewhere? Not that
you're required to, for this patch to be accepted. I'm just curious.

