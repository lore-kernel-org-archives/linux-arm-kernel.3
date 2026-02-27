Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C316FD530C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie2+UrGam8yuOMRgs4ibqBLJsyZZMJwKunkcFXbejKY=; b=RGDtWrU99qzsn/MO65VNdFKex6
	myEFHMKEdHiqRr36a09JCAEGBIzVYL6pAsE07eQ6yuMv04wP/2zgMWGYqEUYSSpOxc6PwR2i45DZn
	XID5PM2GvIPgtNvtnxl0C0kI2WpbkDuVLmyttcXZFVAHF4zRoR8A4hIWMUgn9hZE4kou5fNSjJrGR
	IThGnFc47wIzCM1Lv/H22xHKcJgxopprX4Ctg0oECEoPcJfUgleh6J/4ZWTB5ppG8Tj5UHz8FjXGH
	XDJy3lP+6HKYReJtZJKoA5A0FYOoXdXChOcUS45U8yt9XCb0zQWDyefLOrxRLWqG4hcySf0ZutVnz
	GV90cGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsn7-00000007wI4-04Zd;
	Fri, 27 Feb 2026 08:01:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsn4-00000007wHG-0b2y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:01:40 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82742aa5a3eso737192b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179297; x=1772784097; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie2+UrGam8yuOMRgs4ibqBLJsyZZMJwKunkcFXbejKY=;
        b=C+RMa+567s52t0BeCu0UKoGmosYAnDWOHsNcW7pYrAGr9gOL3+VbG7ziaaZL1iDSbD
         ERubvI/AwHAu7U+yE2x+k9mkPjz+vry4tw851FL/6ISW9IOP4vXr2KU/7oOHdbw/rTwS
         gPy8nK6t7YbLsd/mO9RAFl5xd2uSGWJTrbxV530KUhxB8GomSuHghYC73mS5LyVwF9fx
         wpolayMSIqYR0r+qFeDwllXpDNxBnlge1lKj6IqRHG9pn0DQut5PQpZla6eMml7Nqbq9
         jA0d2VxYi7S/4tbJr6msPDNst9iMMqh1ZZbvD2VisjhcUgBNcMfsCpFjnG6R8Db+1+v4
         glTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179297; x=1772784097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ie2+UrGam8yuOMRgs4ibqBLJsyZZMJwKunkcFXbejKY=;
        b=ZwT2fcsqtH5i0QNXDCPOm5qxXinPevgHDjJh5tOxOraJoX7013nxYhAy1AgBo4n/MW
         93Ztx8L9tVH+CVPNiciekebMvHpBOg+n2/t2wYR+cF3M+PLa+Cv0skdZhFcc0WBBlZ7l
         3i4Z6XjoLfaCfQ/sWovumLX530DxbJI4wvkl1/wj/gFVNX+rONid0fphIqXLk+eQKU06
         3mX5Quw1rNiVDuxK2BG9qgzWR2l0r1cZ5rWPBH5ECT6VSVCBUxfZvctiPZvNpsBKFQD9
         o2bZTI0tJoIkbakFX7BDtGmMbWd0H3HSVHY9KRplALrQVBV3iPRuqG9i3E/nOKpPg0FA
         vAkw==
X-Forwarded-Encrypted: i=1; AJvYcCWnykSKhVYjSCqCTP4stJiTrrOKSJgR78YpB9ZA4HY9hB1iPdTndMPUsficYuTasTa4QxVJWcUUUyva7vtWzZtE@lists.infradead.org
X-Gm-Message-State: AOJu0YxzhEaZw+3xfXQVD8ZJt76TCjkpftzCezpBf3FtbfNXOumh2CuK
	BWY48dnHpynTR9fEJdCIOtQnpWAmcvGKk9RQFH9/BCYHe/26vrjjwHHi
X-Gm-Gg: ATEYQzyo6UwC9tJtkeQqiO751LUQt+PWd1b0gCBnjtogXsIi9vAEbSgiMFIG3a9pW4q
	JpMu5/927uxRJDHGOM9ED6sv4TY46wN7rlyQjDTGBPetoR2GtbkNagSQzvIEWYxXmHnxnAouZo7
	Ac1pQZx/h/GgRX9+ppdPleWe2hEd2k/gn4zTnzCSKE7EO2JMlZJCAgzG0YidIEDWLUZfXdFWZQh
	S0otWjLfEl+UX3Tbmy/mSK8k70rkbBoNTdmpfmBbVx1c3XcGVlHQwZQJf8l1J7ymg3aJKV/LtqB
	gYgPZ+yl1kPkIYLEh2XL8WOQCodcy0dXRdEhBa4fOBX8IL1r/+dz1HqwnQHioIarQXWJLRe/75L
	knksEK7F0KQchVSFela33ETUwoly0PAI/3x9o0+UBuFnIiEKjvd/OPCeKefUY/8aDX3ZA449wLt
	bbNJPSGVLsrXicFH1PR/210Q==
X-Received: by 2002:a05:6a20:94cf:b0:393:dc6b:a10b with SMTP id adf61e73a8af0-395c3b0f6e6mr2039870637.44.1772179297185;
        Fri, 27 Feb 2026 00:01:37 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037af175sm7729375a91.13.2026.02.27.00.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:01:36 -0800 (PST)
Date: Fri, 27 Feb 2026 16:01:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, Yixun Lan <dlan@gentoo.org>, 
	Zhi Li <lizhi2@eswincomputing.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support
 for K3
Message-ID: <aaFOeQ0deTKVW0_N@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_000138_189563_DF94F6E5 
X-CRM114-Status: GOOD (  14.82  )
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

On Tue, Feb 17, 2026 at 10:00:29AM -0600, Emil Renner Berthing wrote:
> Quoting Inochi Amaoto (2026-01-30 03:27:01)
> > Add initial support for ethernet controller of the Spacemit K3 SoC.
> > This ethernet controller is almost a standard Synopsys DesignWare
> > MAC (version 5.40a). This controller require a syscon device to
> > configure some basic features, like interface type and internal delay.
> 
> Hi Inochi,
> 
> Do you have a tree that includes the dt entries?
> Otherwise how are we going to test this?
> 

Yes, I have one, but it is not opened as I was requested.
I will send the DTS patch, once the clock, gpio, and pinctrl
device is available. At least for now, I had no way to post
my DTS patch.

Regards,
Inochi

