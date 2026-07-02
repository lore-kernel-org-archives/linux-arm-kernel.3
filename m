Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDE9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=; b=wkZKQkbDSrjy93JhlrfQbQ4NCv
	ud7HD/PZ/9KdUo0wXXmSKXot+jP9SSS8qVx4sxH328XQ3zdDZuA5tzuMBnW3ybnd7voWAI+XiJZ/7
	KqZju0IQ/EpjHz1qITtPz+pJ5tCpeSvF+Et5k0ay2YgJu+PpK8J30nOyGQbnUlR3oM4jUddJJ/UN4
	LY9F2gF3CIqkaNgZYgZZygxZURW9+vajJlJXbf/F4xD+USdw1cWLCFttNwe4Nbq9JS4KNXeAZAHkX
	r5rbvG2t680OHYqQb1q5gDdaEII/W4yhRF4NR9I3ytKE+WBynOcm7TH+Xck1/DnlccpUEHBilzRjD
	EEMqUWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcU-00000004010-3lK9;
	Thu, 02 Jul 2026 09:22:06 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcS-0000000400V-1csw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:22:05 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ca1479dfe0so14600005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984123; x=1783588923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=;
        b=JooJZMx368s2/7DO6G0+4/Lm/Ne2T1DHPRbp7VadIHfhpMdWp4fBi1hJLVbwtERQt4
         G4E9vZ87MmRvquYJ0FISPuJk8bjzDkAfYAUiAXdW3Jhanv9QHvSnkTRPbbK+ZrjUoe29
         JHVDSvlG3dQnv/NYcJt2g/M9UgPmsBHhi2rgrw422tHtUJ4C54/E3tMmts+8okJKLjjZ
         S+XHpKaxtujoJoQ8GCfEclJuAyfGjHa+qnw4bc5HOWgzDJdy1YihU/sPvRqwKB81zvJz
         KFlsv0xHDRtLX92ySTigflAh0xPC0mIUvw075mm8Q6eNgmGmI7/AVRzJhZrl/tKB+Pjh
         +B/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpdg/juHgJmNo3uxwPmC36CloS5bP0kuOSeSO4Lfv5bfjUPznOshUT0vNxbCsQNBBENjz4jvZXr+4U50CukPjoj@lists.infradead.org
X-Gm-Message-State: AOJu0YwqQ6uC+d1Z1LBELNoy5i0PWGzwOeMOID5DPvrbyQ/resvPEfjS
	Ix9DWfAhQfIoyteOmKKsrzF/6tC7g6c9xxrqbR7YVn52D2JNkqy12jI29pgTLaE89/I=
X-Gm-Gg: AfdE7cn8tsl7qSBsEH+56Illjcc+lmzLNDkFPp24AFJsCK2TWZbu9b3ZbZwMNE0YKEb
	puwisQJeqC2hE1cdcCCJcKJYU2KzaJ/Bb0U+iqDV42uBwN2oFklTymxuBX8rtSq3wUwZPvfgxAv
	5xK/DMKzWjmXKgIsh/0nKPiG+/tNaGT1Ok5PN3wv/NK2AOyOXH1xkv+PNHrC3JGnxso3y5bWfV+
	UWpnJIhmtHPuYj0kDKigy8AcqMj7F+0gTo1ItuYhxgFiOKWErqw4H0nS7ey4SpUJhCSvZxKAxOX
	PP3JbVDZKmgFt8Hpkhyg3NUs16nbBtDLN6EndBBv9K1A8Xxq8SO7231snR6ccX4hjcWFGvrYJ5+
	FMSNAPoDbJFklCCftpkfESu4vd3/i/cdOA9Q9hTxlUsuMq3BpjyXEuoNCFtKzGrZkB5ouELiaGL
	qdlZD+39Y5oeN0kHm20uBk12tyR7zn3wtvboxLr3rOC/GCqf1BRV725w==
X-Received: by 2002:a17:902:cf01:b0:2c9:b96a:285b with SMTP id d9443c01a7336-2ca7e90773amr57830685ad.33.1782984123131;
        Thu, 02 Jul 2026 02:22:03 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9cd487sm10595425ad.43.2026.07.02.02.22.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:22:02 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so782327a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:22:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Jy4itcC4/dZSDLD3FP7JDMvpTwINohoRmGPj+Ll8n3pGTnsAS5Qw4UgkEWKMMe/sD6i4mnVCYRURxU8QdI4jw@lists.infradead.org
X-Received: by 2002:a05:6102:1620:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-73da7681403mr2525301137.6.1782983793184; Thu, 02 Jul 2026
 02:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Gm-Features: AVVi8Cef5-UyxrfN1fWvFDcXcIwIbwhU7f5lsircbKpxY8MZwCT2oXalNKmt_xQ
Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022204_425112_816DFF73 
X-CRM114-Status: GOOD (  30.02  )
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

Hi Bartosz,

On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> >> > driver instead of the MAC driver where it was previously. Instead of cramming
> >> > both HLOS and firmware handling into the same driver, I figured it makes more
> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
> >> > any).
> >>
> >> I think you are mixing up DT bindings and driver implementation?
> >
> > Should the bindings change if we have different driver and firmware
> > implementations? Isn't binding supposed to be agnostic of
> > implementations..?
>
> I've thought about it some more and I believe this question is philosophical in
> nature.
>
> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
> the same Lemans Ride board and it becomes one or the other. Yet they are not
> described by the same DTS and the bindings differ as well. I don't see why we
> wouldn't allow the same approach for the this PHY.
>
> We treat it as different HW variant when it's managed by firmware - just like
> we do with the rest of the SoC.

DT describes hardware, not software policy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

