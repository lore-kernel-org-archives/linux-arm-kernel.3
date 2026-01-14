Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55259D29FE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVbatpxpKElt1sAAsNQJxq68ajK6K9op7sSsIg3JJAA=; b=zeXC5/dYj9nRiZEEeFmQ6MX8xc
	50TKPxszv4duF4HkUbFKGvPvKYLfi3XY4kmUzU5qjegfhLxzq1Fn34jbgnkTZR0Mf2CTcpOZWAQgV
	wzRXb3TsqBE1fM2PBI0AYf4fD/Jpylaf1FJ1sFSpquxMakphlnRUIQYad9BKA1fJ2bjiPL7fJIbjg
	OOpzY2Y5AhYHhrDHPpn+lKApsXsjUb9XZvB6TeDAcSNa3R5MGBHSovl3YKqymIY/JcImj6RQN6Bbq
	BxNByUZV9eWyBneIvwVqKRZGuXbrZjJXTVj+Pm8pQatbtgTCgqmnOnMKaOSiGL/aDAHIkiIv6ktwx
	wYqzlAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyHb-00000008pKW-1Gaq;
	Wed, 14 Jan 2026 10:39:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyHZ-00000008pIr-1qnu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:39:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42fbc305914so6000221f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768387159; x=1768991959; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cVbatpxpKElt1sAAsNQJxq68ajK6K9op7sSsIg3JJAA=;
        b=UUQ4V9qAzqus0e89MfwlgS14ruq8pAvEaAQLc1n1aKzokTVN0wQj40qm+imd58hiHa
         g/yv/xIg89m8FoSawuWPftyM0d8WWg01mi7ZbQ4hyuLzbLhX1VkVUCRk2CeiHZ9m0LG1
         +dSL2slQQjONaCSzXe8M11KLyWbQRYqDd3mNe0bDowMYaoLJmfYYGdsGSOxEv6TXpucH
         PB0nJyndDE+oMlfhy0yZYAL0rQplHL+KBUOokER+HSi2kYw6sVScDGRc8btNh57RTh5n
         DyzctjOc2JPWVdZZE2v1/tmcLOi0I1xe/MomygvWWVOpIPhrjd9qPrTMdqitVBN/xrrk
         Bl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387159; x=1768991959;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVbatpxpKElt1sAAsNQJxq68ajK6K9op7sSsIg3JJAA=;
        b=j6c+3IQ/6uHUCF/jcAnFeZ0JoPjoiPALGL0Ytrdk3PjDrH1ogujQqwfyH9rWbMEFkD
         Nbw0s56GMk/W4CBCSlDAGZNCXXTDH8r3d+Cz1HrrHAuyM4J5Dj+8TV1S4nyeLLQshjuI
         m+R2qS/EJcJp15RBEODg0DImbHB/fZaqmcSxlSnPu0CvKTqXV9NIjfiqLqSmtNZCD6d5
         V3EFQ3yMsbOt3Ixm9IYwxl7Xm6YJpF52yJX72vPk4+hDuRFwIMJaJ7BL9rpzqLyq3NNA
         JRnWkIzlhZJob7Ll9pUaUUgJBOdJCvKg8VJ8ZnjJu1Cz7KgptUMVf7ACKo3C/8Pyr98L
         cXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWGM+TGAjgdn6YdXQ2bXpgPpOp5YiA1a8T8fVz4K0YkQH5ct+I7fxEEMJnzQcOx+rT68hPR8kTZdXZ4827qfhR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyld5w6N8KnArXrlcCVMgJhhsReDtlwZrnUrO+VxuR+gOpOml0x
	6Za0ikErJV8oq/fweE9lAUlQFSdUhPPrgSr2LrT4V0LIYY0J/V2Lmczd
X-Gm-Gg: AY/fxX5tcYcR5XkSSaGr9OdO9bp60tBlLt/nzEi7KGwX4ueHvu0nn2gwdQlSey4T4a+
	bQ/oNn7AgfIlP3Ng3wtqdbqPaxi923XzVz6x/ZbvF81K+Ccjep2ISzd9qKupP/Y67dCZdQpyrp2
	4I0kV96xK98tfoGyHYQWDuG3bZuGmjeCrVL1qjZBddOIqIt2vtrOO+IylxQu0s9kPidm0+9IDrh
	PXZLjAUxbirOhrqcGHQksD15pEvywklQeJ2gBEAQjjOjLdR4EkrLA2VHt8ahPp45ERphXDJ6byQ
	CNwdnmfpYxMCMGmmno8jIV0FWqORS7dcRVGeh8GeqnoSsV9J1+owOh8IylXr75YyxrKFD0C4+As
	uMkRJCi/VG+rr4SZNU6wODYPPPGAKt3RvrcTOCZ3zUxL+5P7SLx0rXMNnJLNK5J5fz3MQX850y+
	KcJnqW4j5iSLVjbCpL+CwRrx9QfYCuXM0f28M8MrVNpUbWLAkS4w==
X-Received: by 2002:a5d:5d89:0:b0:42b:4267:83e9 with SMTP id ffacd0b85a97d-4342c4f4cdemr1980366f8f.2.1768387159401;
        Wed, 14 Jan 2026 02:39:19 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df939sm49038091f8f.21.2026.01.14.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:39:18 -0800 (PST)
Message-ID: <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
X-Google-Original-Message-ID: <aWdyUuN3TnelxAh9@Ansuel-XPS.>
Date: Wed, 14 Jan 2026 11:39:14 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_023921_507510_8661759B 
X-CRM114-Status: GOOD (  36.90  )
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

On Wed, Jan 14, 2026 at 11:34:55AM +0100, Krzysztof Kozlowski wrote:
> On 14/01/2026 11:09, Christian Marangi wrote:
> > On Wed, Jan 14, 2026 at 10:26:33AM +0100, Krzysztof Kozlowski wrote:
> >> On 14/01/2026 10:01, Lorenzo Bianconi wrote:
> >>>> On Tue, Jan 13, 2026 at 09:20:27AM +0100, Lorenzo Bianconi wrote:
> >>>>> Introduce en7581-npu-7996 compatible string in order to enable MT76 NPU
> >>>>> offloading for MT7996 (Eagle) chipset since it requires different
> >>>>> binaries with respect to the ones used for MT7992 on the EN7581 SoC.
> >>>>>
> >>>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>>>> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754885c1362b9603349a6353 100644
> >>>>> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>>>> @@ -18,6 +18,7 @@ properties:
> >>>>>    compatible:
> >>>>>      enum:
> >>>>>        - airoha,en7581-npu
> >>>>> +      - airoha,en7581-npu-7996
> >>>>
> >>>> This does not warrant new compatible. There is some misunderstanding and
> >>>> previous discussion asked you to use proper compatible, not invent fake
> >>>> one for non-existing hardware.  Either you have en7996-npu or
> >>>> en7581-npu. Not some mixture.
> >>>
> >>> Hi Krzysztof,
> >>>
> >>> We need to specify which fw binaries the airoha NPU module should load
> >>> according to the MT76 WiFi chipset is running on the board (since the NPU
> >>> firmware images are not the same for all the different WiFi chipsets).
> >>> We have two possible combinations:
> >>> - EN7581 NPU + MT7996 (Eagle)
> >>> - EN7581 NPU + MT7992 (Kite)
> >>>
> >>> Please note the airoha NPU module is always the same (this is why is just
> >>> added the -7996 suffix in the compatible string). IIUC you are suggesting
> >>> to use the 'airoha,en7996-npu' compatible string, right?
> >>
> >> No. I am suggesting you need to describe here the hardware. You said
> >> this EN7581 NPU, so this is the only compatible you get, unless (which
> >> is not explained anywhere here) that's part of MT799x soc, but then you
> >> miss that compatible. Really, standard compatible rules apply - so
> >> either this is SoC element/component or dedicated chip.
> >>
> >>
> > 
> > Hi Krzysztof,
> > 
> > just noticing this conversation and I think there is some confusion
> > here.
> > 
> > The HW is the following:
> > 
> > AN/EN7581 SoC that have embedded this NPU (a network coprocessor) that
> > require a dedicated firmware blob to be loaded to work.
> > 
> > Then the SoC can have various WiFi card connected to the PCIe slot.
> > 
> > For the WiFi card MT7996 (Eagle) and the WiFi card MT7992 (Kite) the NPU
> > can also offload the WiFi traffic.
> > 
> > A dedicated firmware blob for the NPU is needed to support the specific
> > WiFi card.
> > 
> > This is why v1 proposed the implementation with the firmware-names
> > property.
> > 
> > v2 introduce the compatible but I feel that doesn't strictly describe
> > the hardware as the NPU isn't specific to the WiFi card but just the
> > firmware blob.
> > 
> > 
> > I still feel v1 with firmware-names should be the correct candidate to
> > handle this.
> 
> Yes. What you plug into PCI is not a part of this hardware, so cannot be
> part of the compatible.
> 

Thanks for the quick response. Just to make sure Lorenzo doesn't get
confused, I guess a v3 would be sending v1 again (firmware-names
implementation series) with the review tag and we should be done with
this.

> > 
> > Hope now the HW setup is more clear.
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
	Ansuel

