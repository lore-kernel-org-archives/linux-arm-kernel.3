Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE58C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC9iYEXmlPpatd1qYNBGszNIrKERHR8YSkcQ5CjfbMM=; b=Id3SRbxowIFKHdyz3ByUPVb0mu
	wKZeb7zS0Zvoz952uMYZOMDC5muaTXgAMOpASVnG4IYSmdBX+TgZ7F63KB7z4HR/A0waW0zIoknmu
	P/GpZ6MtrhFdp46vuzCD+pmhhakWwhQSwLzAvn20Cc9oiJvMQADrnzz73poUHEFmRsV8Qc9qpHw90
	iypHxICjvBVKlUpcviSZdzl9YVT1OdjrQ0YYVygrl/VfpVIlLkCpsJgWK1EAyGuhiDHCIyVAUbfa6
	yXaNJARtFUKatUrXx5cXN3m8IFPbg1RASq22PzBS6qVD1gYOI5VyacDD3Sl434dQplY1S82COXbb1
	prAQzBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnuL-0000000DPmB-12lu;
	Wed, 04 Jun 2025 13:11:53 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnr0-0000000DPKQ-3p6F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 13:08:28 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e740a09eae0so5999689276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749042506; x=1749647306; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tC9iYEXmlPpatd1qYNBGszNIrKERHR8YSkcQ5CjfbMM=;
        b=nfQshFw0dFfnxvhEJIuheFfw/kKTo4f0kGPY5LVrLQiv5wdQD0hV/bpXLP78lvVEAg
         HroWj9scgP+3kyHi7d2hGyE3Q4dPJr1yUwgmAeJG11tBUWs93G9lFcDXBRcLWAk4R9xb
         mnNVh9Cdh8NCHrN+BL/wtMQzvTbswqSFH/lvLlkD87s0dvbVUQL/c1RHooqPw7+vXX9q
         /jwh5UxgS3hgYf3cjO1/R+cLCuZzmkzYi0perUnZS/CAj4cSUFZOVPfPQ2k9AMD9URBe
         YA1xIyIBma/9o0VetuLpaxGHqgQ3jzEckqHr1K02z0bJKhJ1wNmA2pbkxWw43Oixnuee
         VmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042506; x=1749647306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC9iYEXmlPpatd1qYNBGszNIrKERHR8YSkcQ5CjfbMM=;
        b=c/QbfRgJY6w15pXaXkNVE4/OzR2Nq3PSjNWkfMDsrZTNMSXyvz8qhH6KZupbpb1UYD
         Qhtb09p9CxEiNwvi9v+ApxDlhvVF7FwpvoWPsLiZFV+WG/MbD95TugSdS2m7opwApI5D
         Lhv0Z2i0LB+USAAxDjSGGANJz8yWJY8QsZu5t+zTcUdxO0Q6nGDU1eH6vwkoXeTdvfu8
         sOONf4LOqrpITNpJGr8AKw9yz1tKgFfqT+LyurF0MkDfEdE0sVpO9144gnyx7LcrBCpb
         L/pCyugsK4D2TaxgVAoD4wZpS1i6VlUSmYk/jVpDlxmYLYoIRvsXDlAcVIxYtF+UIG3y
         YVnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhKR8M8y5U/hGLuZPFtuKgl424UiUijw/FBr2E7RzwyHtGAdi+Jso7f8bDjki5efgX8nQw8Bau7lVaYuTWFEl5@lists.infradead.org
X-Gm-Message-State: AOJu0YwgqSrMuD60WDEnqsUXZeeEr9DB1yzw2TKAQ7ISbeKJ6zZWu0Px
	/zLuj+fv5ANu+T2+3n8CasKT+js+c1xtEKFrtA0VHXugRr33zIv4dOVM1WGc61Rs3YaoV4C/uCg
	v5A1WKAgm2DjKqKZhxUh5wUn/cn+ZSGQ=
X-Gm-Gg: ASbGncu81f3Lmq9owEElhFntdzLrSRGggzKJh6mM5p1+/XTxsFzpsK4va8t2JTCpk/X
	Nj2+9wy055wT22t93uMY7kKBwx7YrLPJUmmTQ4BaLgsUrn66WJjZx2irVrfmEOcPIie3pzmbhI3
	+Hq6yBfiqiJSP2UtdEFEECYfGmVA1TXqA=
X-Google-Smtp-Source: AGHT+IF7alnMbrbqO9NpYJkpsB5jxOjXxEiktzWLUbq/kLNxP6YnbLIfTtGPBT1xFbh0wT4mofPVUoUINuQKSsuFkGw=
X-Received: by 2002:a05:6902:10c1:b0:e81:7e16:aac1 with SMTP id
 3f1490d57ef6-e817e16e42bmr2304215276.35.1749042505640; Wed, 04 Jun 2025
 06:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch> <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
In-Reply-To: <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 15:08:09 +0200
X-Gm-Features: AX0GCFs1swEQiYv2NQSRcTQZ_03Yg7U17iAxPh_wyGwxwshbS1HFhm1xVLPn_sI
Message-ID: <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_060826_948145_0BE17212 
X-CRM114-Status: GOOD (  19.55  )
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

Hi Andrew,

To clarify more precisely: hw team told me that the required 2 ns
RGMII delays are
implemented directly in hardware inside the SOM itself, through passive delay
elements (filters) placed on the RX and TX lines. There is no reliance on PHY
strap settings or any kind of delay configuration via registers.

This means:
- The delays are fixed and cannot be changed via software.
- From the point of view of any carrier board, the interface is
already timing-compliant.

Given that, using phy-mode = "rgmii" in the DTS is intentional and
correct, since the
necessary internal delays are already guaranteed by the SOM hardware design.

Let me know if further clarification would be helpful, would it help if I add a
clarification about this in the commit message for v2?

Best regards,
Stefano

Il giorno mer 4 giu 2025 alle ore 14:01 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
>
> 61;8001;1cOn Wed, Jun 04, 2025 at 09:37:39AM +0200, Stefano Radaelli wrote:
> > Hi Andrew,
> >
> > I double-checked with our hardware team, and it turns out that all required
> > RGMII delays are already handled by the hardware on the SOM (trace
> > tuning + PHY config).
>
> What do you mean by PHY config?
>
> The four RGMII modes you can use with phy-mode are purely about the
> PCB. If you have the PHY strapped to add delays, what does not count
> for PCB, and if you are not careful, future software could reconfigure
> it.
>
>         Andrew

