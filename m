Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5501CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fASXZCo6zuX2fyCl4lSygWMZOBjiZpryb8F1RE8Zsso=; b=aC6Gh4ka7gGu/qwm6DPnJgPSN0
	BIeTCussgE0JTdQHGbkBTgHQa3LFOTcmv/E6B576KK5O29btuzAtrJyETenNOIy6RNBQUQFNKvYJf
	0ggF/CJaI0MqFPWKCtDhs2dnlezomhPwOPzckE1MP59bHVQYhB9bSPwPSS8rTsnKuo39B50yoXyUL
	lZvuULeOsSWoh9t1/YzB3DJ+UMXNeRjIJEO2rcJEF96fLSwsne2ZCWsGgfcKuNpb9RqGs60os/Hu8
	TRkUbyiV1H0jMHQGEnG7hvELLpfP0QnSsg+b32nAm9ENNTf8+F7YiYYOS4Pow1sr5/xEu97IjXyZU
	rUVmxR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtG8-0000000FZ8f-39c9;
	Mon, 17 Nov 2025 07:02:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtG6-0000000FZ7i-0rQe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:02:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aad4823079so3498072b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 23:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763362961; x=1763967761; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fASXZCo6zuX2fyCl4lSygWMZOBjiZpryb8F1RE8Zsso=;
        b=EFTk098tWFnhpRQeCfeorzWEATBcpJd+jnA3TxlIiV7rCntXLG86VrREb+g1sfpxoe
         wx8dCLm3dxbwo+xkW9zmc74D9WGWgYfkCE0QxzvbdOc+oQkIIy70WsEKdo8z9Gi8Utpb
         lMARqpwf0FYoZpsZ9V1nmKROIn12ceVrM1blFOIRpg7a/N4xzIWH9AHoCMMB1McYwwXF
         IzacFiLq3KnMHLW004RX1Yge3EbWlro2me4+FtdLDJM0oF7nZ2yJCQynw6YfPe6ClzwI
         TWStKR+ZKfiHXYv0sZ3n7ICWKoNgrqooOMpRHDZEDMfWlphBG7atSN1dTI1o1Zzf6whs
         psIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362961; x=1763967761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fASXZCo6zuX2fyCl4lSygWMZOBjiZpryb8F1RE8Zsso=;
        b=W4wS+w/MoOgTlPp3ox2ELzoTR2I1CU+QlYVfXPjB1WiPbA1ppRMFak3llKKJ4WzU8M
         4DLCYB1lCbsOepdOh3KRvtBK8lk5WsSOUxxJGD/RfrIxlWc4namkBP+0rWV/97HTjHk6
         hpTKABc1Qd4LxkIz02nszMFtFOf1kATxew4M7zoMDYHsfGLmaDjz/KT4H3EghopmOy8P
         yi/dKmX8i4RhgMWyCK4JstHbf0cqpEXl+KqksAEfuxN/x5N68UpV004QwdyIWjn1cwFx
         byCHJOtoinqCZAwgK8vKugSkhUWT4DUamwCsDS37Q92vJ0uFztrV65HOfmG/k/Fg+g/9
         Mkfw==
X-Forwarded-Encrypted: i=1; AJvYcCXb0DxODj4XwQ5SEE6DQ/16SE+d9o7YDCRPN+7vvdQT8LaIQS8tBVQB9y76L7uI9T6gE60isF7L1sIC2sSgH8Ds@lists.infradead.org
X-Gm-Message-State: AOJu0YyBgoUufH+NEwqtgbPE9QJ9/d/mJGXZHl3VS+JSnc7U323G+Pne
	srSiGLObe+c8CFhLNpecv/A7FYeB6+lJgdBfaTrxYiHbhIFjXe09NnL6
X-Gm-Gg: ASbGnctovQC5z9ULbpqQXcpGz1l39J9ZpiX+/pOdUOKHBYyF0yINnYpRABBeXPL5jlq
	0HpE2IAJYIT3CmFgfyeV56ewXdOFMeiNGx34RmqTlEzCaXzowlAHnHMsLRLF+bCe2r6PX8QWVML
	5TorlwNiLMrtnFhUDEnGrmQj4w6cdJ49fg0q0aYxvoIS9h6N1/Lr6adQyTHk2lFy8cXDY+4jgpQ
	5j1P50vvHPeHcwjX1w83m/fKXxQxaeh6PMZvVbFPXMTA16nxiBkzETH5P66heV9Iwj1PaQdg9nw
	UQ9nEqk1wogFvS9EJyfZkL87XxBpO8cb/k1usAJf1LY05uHD7sNESsUl2hnQfSAeAdeuORNVTik
	n3yv8rtifbhRxOW1G64XeSyttDyJPM3Dnfm+V18ysn9XH4ESKn8ox9cUakraNl1tgegSQ74dBjt
	q6gItYgBNC
X-Google-Smtp-Source: AGHT+IHfnm3IzWza8gHcE5HGBty9zF9EvqIvnvTqildA2ZM0zlu5AsSzDpAQGo3gcaH0YBBS76BNfQ==
X-Received: by 2002:a05:701b:2412:b0:11b:9386:825b with SMTP id a92af1059eb24-11b938684dfmr2055518c88.48.1763362960827;
        Sun, 16 Nov 2025 23:02:40 -0800 (PST)
Received: from geday ([2804:7f2:800b:a807::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm44795481c88.0.2025.11.16.23.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 23:02:40 -0800 (PST)
Date: Mon, 17 Nov 2025 04:02:28 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/3] PCI: rockchip: 5.0 GT/s speed may be dangerous
Message-ID: <aRrIhA1uv_aIneOc@geday>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <8f3cc1c1-7bf7-4610-b7ce-79ebd6f05a6e@rock-chips.com>
 <257951b7-c22e-9707-6aba-3dc5794306bb@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <257951b7-c22e-9707-6aba-3dc5794306bb@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_230242_250210_FC1F9D8B 
X-CRM114-Status: GOOD (  24.95  )
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

On Mon, Nov 17, 2025 at 04:57:11AM +0100, Dragan Simic wrote:
> Hello Shawn and Geraldo,
> 
> On Monday, November 17, 2025 04:42 CET, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> > 在 2025/11/15 星期六 17:10, Geraldo Nascimento 写道:
> > > In recent interactions with Shawn Lin from Rockchip it came to my
> > > attention there's an unknown errata regarding 5.0 GT/s operational
> > > speed of their PCIe core. According to Shawn there's grave danger
> > > even if the odds are low. To contain any damage, let's cover the
> > > remaining corner-cases where the default would lead to 5.0 GT/s
> > > operation as well as add a comment to Root Complex driver core,
> > > documenting this danger.
> > 
> > I'm not sure just adding a warn would be a good choice. Could we totally
> > force to use gen1 and add a warn if trying to use Gen2.
> 
> I think that forcing 2.5 GT/s with an appropriate warning message
> is a good idea.  That would be like some quirk that gets applied
> automatically, to prevent data corruption, while warning people
> who attempt to "overclock" the PCIe interface.

Hi Shawn and Dragan,

Alright, I'll send v2 with this suggestion in mind. So that driving the
core at 5.0 GT/s will require patching and compiling own kernel.

> 
> > Meanwhile amend the commit message to add a reference
> > of RK3399 official datesheet[1] which says PCIe on RK3399 should only
> > support 2.5GT/s?
> > 
> > [1]https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
> 

Shawn, URLs have the bad habit of changing or simply disappearing, so I
don't think it's a good idea to put URL in the commit message.

Also, the datasheet just mentions that RK3399 supports only 2.5 GT/s,
it does not mention possible damage from driving the core at 5.0 GT/s.

> Also, rewording the patch summary as follows below may be good,
> because that would provide more details:
> 
>   PCI: rockchip: Warn about Gen2 5.0 GT/s on RK3399 being unsafe
> 
> Or, if we'll go with the automatic downgrading, like this:
> 
>   PCI: rockchip: Limit RK3399 to Gen1 2.5 GT/s to prevent breakage
> 

Dragan, these are good ones, thanks. Though I think I'll omit Gen1/Gen2
wording since I know how much Bjorn dislikes those terms.

Thanks,
Geraldo Nascimento

