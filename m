Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43140C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOObWxm0mCeJEpZwglb2CEVZr9rm6jEf/VR9UY9bUP8=; b=M1XQWlvKpLgTpcd3FbjegzhCWB
	mme5OjFBH2XANY73oVvXtnM4n2FOTjKw4L2TwUXSyHSa0DE0fpkpAaavtC/hnIO6kDQ4ZziBGDtv9
	S803bdVrQ9t5P43hTtEpFhbxQobSSbR94lfjKGiwYJL3ncC7jN3i62TbCA6MO11eAJmuPNcqKE9IS
	q9676DqCwKDWCIy3mD3UO8Lrloa+KP2A0Q6furcqZRLnqkVstGvR76zdgoSMhkZI8GynLf4sRdGFw
	Bq27ytYngyAb5VeAWgqawomzwo6fWVCs+rfyNdXFHy3pJyYUi9ncCYmJHb6rH/CLK+K1OY9DRrJun
	9v0wOTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMs1I-0000000DxBa-1AOS;
	Wed, 04 Jun 2025 17:35:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrxK-0000000DwpC-16VJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:31:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-235ea292956so1094705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749058273; x=1749663073; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xOObWxm0mCeJEpZwglb2CEVZr9rm6jEf/VR9UY9bUP8=;
        b=nTpjHwPr8hOkLf5Jq2PDjWvn4K11JEv/SroeLjt/A29KjCHWyT0iwFR6BsdIFBggo8
         swsPxVDBVmCtHsCKw4jFrYAu8ELPxV2u6KrKAeCoQPdKWKjQjMKNjWPkPeL7GE4DgLph
         D8H1CT9LN/jNxBNvqJMw+VEzgyGBPVb98Yid4syc88Sno8d4iNlIeSeNSeTGTwEBgE6t
         z0RdqNFI12WLOK9Vk0nmR/yhqI3VZm12vETYhe+G14/BUUoCM9HZijWYVn9dbQuSf8mj
         jvI3UwGjZxBzo7NKSq6L8m1nQzxS+3mJFaUYp92nCNkQBmj3YOGUKGkq+2HD3gqGb9zW
         zVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058273; x=1749663073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOObWxm0mCeJEpZwglb2CEVZr9rm6jEf/VR9UY9bUP8=;
        b=BT+uqlTTlRzgla3wk87ScJqzJUmVdVyWx22G+Uw7yZash9nvrVJkRs9WAwj3nawAXJ
         i2YSJ+lTm08tFYevE+vizjJaQANwsptSVaJ02jGR0D4pA8AdCmsbvjqwRgyohZ6iK8L0
         0nlhld46sTf6pT6NtuLCW3tBHwFQQV/qKo0HEzfLs6JWwqVtVKC1aC+Cnpz6Np7YyWCY
         acCbGXUKhSQ1Lwg3r1jKvgnnBAL7bAAVTGvJmDYTCoTlwbsas5F0CEJjs9MjI4z5yFRb
         9P605HJekKxry12MwohNuPoCzjNi5V8AND9flfWztOSpi/XdJ7WwfGJB7k5OyapVNwsn
         3SXw==
X-Forwarded-Encrypted: i=1; AJvYcCWNtwZqYbQ3LXFQKh/IQUQnpyVBM8NMnqbN9QU0sG5WKNYfWbZ85Cf1zJxwjwfXkSTmjnStuphH+tfKut+OPs9j@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmq8KI2cRrTXegD4U9ZoKG4fWscnPwfO2MhHMiCBssEO52DtEa
	mP9Q9VFVFg3yjATIPDpnVdsmEeCzwknl3EhXFgdd3fwqbywH3XIa3ZlPg5msPakNTg==
X-Gm-Gg: ASbGncu04dQwugqzS21YKcTv66/5BB1AtHEGlvhirk6B329ypJI+Tdzt+d25QueBVqa
	Z+2Vg69YCkHhceEV3yc3Ed9K/FKF5WERsybWTqbg3oRKQw843eaCo3lQqRJSI1/9yfvNrJ9xCBp
	b+1DC6KpYu8kD2975ZqPZf31rjgUBBH3n18SoAJIl7uuBfajP5LJabKCevTw5qu7gDLfFXIdb6K
	Bne0elQb597STdtyy8c5z7dUR+Y2y0UQS5ssLMrrcnx91dymy/FgW8c5JwKHZ1mjCpfz0oYavqR
	OJE3Sj8YiluNHQcKaB/5bLf2OXeEWfpcZYnFPjyFJlvphULyrmC+9bMJ2BBwsA==
X-Google-Smtp-Source: AGHT+IGIJbSx2qDc2q2Gt3qbCZCgqmWW4FPwxtFTdbgDTBwo3IdO7XqHuYRl/uF5BzOmzUrf40UoSQ==
X-Received: by 2002:a17:903:1c9:b0:235:6e7:8df2 with SMTP id d9443c01a7336-235e11fcb67mr57141715ad.41.1749058273586;
        Wed, 04 Jun 2025 10:31:13 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf50c9sm106668185ad.162.2025.06.04.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:31:13 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:01:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a779g3: Describe split
 PCIe clock on V4H Sparrow Hawk
Message-ID: <egtsvxsfc5c2s4hrwucsqk3s5dv7xsi6ghrnf6jd3mvf3zvskb@z7hvehbd33t5>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_103114_307539_51A8B646 
X-CRM114-Status: GOOD (  20.51  )
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

On Wed, Jun 04, 2025 at 11:24:17AM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, 31 May 2025 at 00:55, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> > bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> > Describe this split bus configuration in the board DT. The topology looks
> > as follows:
> >
> >  ____________                    _____________
> > | R-Car PCIe |                  | PCIe device |
> > |            |                  |             |
> > |    PCIe RX<|==================|>PCIe TX     |
> > |    PCIe TX<|==================|>PCIe RX     |
> > |            |                  |             |
> > |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> > '------------'      ||  ||      '-------------'
> >                     ||  ||
> >  ____________       ||  ||
> > |  9FGV0441  |      ||  ||
> > |            |      ||  ||
> > |   CLK DIF0<|======''  ||
> > |   CLK DIF1<|==========''
> > |   CLK DIF2<|
> > |   CLK DIF3<|
> > '------------'
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
> > V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I understand this has a hard dependency on [PATCH v2 1/3] (and on
> enabling CONFIG_PCI_PWRCTRL_SLOT), so I cannot apply this before that
> patch is upstream?
> 

TBH, this patch is describing the binding properly. So even though the driver
change is necessary to make the device functional, I don't see it as a hard
dependency. But since people care about functionality, if both driver and DTS
changes go into the same release, it should be fine IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

