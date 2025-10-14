Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48649CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 01:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phZtlvW8k97758VvwCeGeCQ88PxB75XoJve4vgpnWeY=; b=mgfYdZSmeJxESdj07xgm3Pf18x
	bCPMD9IAa0I6NSl4lSjayN2j1nLqd+Udrjf/XN1kr3fLwYxHULLuJDCpzjuOuAtd0iSP1b89A4AMf
	H1K/5EFIerTJb/RHTTSi+MEK1LmVdneh5+D5sl8uCtDmdTgq7vb5IHwgFxVmZMeRim0di88eyqSvA
	6qAUGjYfZKU/rZMxJYnKn+G1AjmjYoz5aQCUlTQOhN6ocQm6nvdDblXWguJBdNFmr4BE4nNyLnkYB
	ndWaWVbkCQbnfw5UWn5cAsg2J9QHtoEsVZxrUGovYucVO0ccxEhOTgTESZyRFi2FD6NSPpTzLsx85
	l+vg7Q5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8TdW-0000000EsiD-0Iix;
	Tue, 14 Oct 2025 01:15:34 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8TdT-0000000Eshf-3CeM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 01:15:32 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso4558929b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 18:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760404530; x=1761009330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phZtlvW8k97758VvwCeGeCQ88PxB75XoJve4vgpnWeY=;
        b=VBsfyUugkFYNP+a7KzxfbQlv8fQ+/1718mopFtNiNpXGVnnbikmEbbqA0fDq0qqsbs
         Uo340KH+no+SXKC+Wav+5xnYFquejBfDJnfzqk2hCDG63Xmmg8l04K1enql6kuuBvgSa
         Osjp4ddWZk0kGhSxXPnfwOqLRoDExE3BBAxQQV+5nVt1/+cw4H/wez2ASV0l+ASe5DCY
         skv16mYoRryDuWk6BJtbQHezDGSuU4LYoaJkwAGWnkPq1nmmBBoxiXBxvbsBz3TvzYV6
         FcWFLAB+qSJMLATIsQZnS3vcbndPIwbQ0Bu8vgiX8tvpOKqitE+WO2idaYLVH1fhwsAO
         Jiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760404530; x=1761009330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phZtlvW8k97758VvwCeGeCQ88PxB75XoJve4vgpnWeY=;
        b=WcAKsVjTuhviVpaiN7FZgKC7zzyx/fuglir95LNM2ui7zSAcCLmq8DGZhFSkMreiFu
         So1KBU/GTO94dBr9E3nrxRPew/MU3dp6AQygnSyYRiDmabHRQjGOUXcZNL8iQ6OI8n+l
         2lyivgqLUOXWIhsZL9dD2g7sWO22aXW/P4XBJt2PQF4V5ty03MJ6dSAxaFS+w/qE6jQ2
         m0sjkXD3CqeL7PB1RnAop4UYj4iUr16u1E9zf98t2MHTSOKYfKRVrOixkaSdm0OxHXgN
         cTIJDpBUjXtT2ape09dxbdNhCY8Blqly6qinLuMqOOKlkid0lsFuQSGh4AJsekxXYr5j
         HY3g==
X-Forwarded-Encrypted: i=1; AJvYcCVn8CgF2SJuBxLaccjtljRPdSfUZzr14WOHxEBNEmn8ZC+ukPmlKrpRLyocoCme0IMpETNw42jgAs7OCME6vaJY@lists.infradead.org
X-Gm-Message-State: AOJu0YxvJ2gMa1lajTDsGuIoswRs4hN2UfM3jIstuawczBK3k8a53EmD
	FFKiA9n6aD5hvXGnWegzscQ+CjQH5d5pZZZG2lKPiokr1JuCVcWIwp9O
X-Gm-Gg: ASbGnctO8wZgTAipFYBaUUpVaVLE71b17BrKCcE2uer9TzWPHUXkotpPIZfX6sl6KaE
	CkiVXCz3oQf7IPC1xhBqIJ8ziduT6Kh9+MABFWytq1rSh75D18doX8+t7ldSTE9kITOJnKplHCH
	BtEvALosVLrusgd8b7pLfGhh1je6zFl9xpGcsRbkQ9ohJLzG5Vuj67JRGSEjWaA3GIrcQAUVlSl
	3Xp5mOCxstPBDmDwMZSk2pcb5g4xgRYPDopryAvzrn9QfO/Grz+3EM+spxHpT+XVghEX03uPPVx
	eZIygUC3yF248kCry8hO1I8WxqjBJ/YMhNmy/RlLJvK3D8YYser30aMIKqkOHYq26b81bTiqTUc
	TkKM7lkI1ZAPRUD46WwvdGdJRanahFrKptYkdsmVaQ++TiHu2CPyOUdWsoVYSb2t+Tp/dYBadkQ
	bSvF/CV1vr
X-Google-Smtp-Source: AGHT+IGc6pF41NoPdDYQMQp8aeLQWIfke286IFthWwuWj9dAjt12ahG3XuGO1XLg+wdmBQpu8UKgqQ==
X-Received: by 2002:a05:6a20:2450:b0:2ba:103:aa3b with SMTP id adf61e73a8af0-32da84ea472mr29893401637.53.1760404530225;
        Mon, 13 Oct 2025 18:15:30 -0700 (PDT)
Received: from fedora (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e275csm13012575b3a.61.2025.10.13.18.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 18:15:29 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:15:27 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
Message-ID: <aO2kLyxGlGt12sKD@fedora>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_181531_800984_D76CE694 
X-CRM114-Status: GOOD (  21.52  )
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

Hi Guenter,

On Mon, Oct 13, 2025 at 05:20:57PM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Sun, Jul 27, 2025 at 10:56:13PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Include "facebook-fuji-data64.dts" in facebook-fuji dts to avoid
> > duplicated code.
> > 
> > Fuji-data64 and Fuji are identical except the BMC flash layout.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> With this patch in the mainline kernel, the Ethernet interface I use for
> testing does not come online when loading fuji-bmc in qemu.
> 
> Reverting this patch fixes the problem.
> 
> Looking into this patch,
> 
> > -
> > -#include <dt-bindings/leds/common.h>
> > -#include "ast2600-facebook-netbmc-common.dtsi"
> > +#include "aspeed-bmc-facebook-fuji-data64.dts"
> >  
> ...
> > -&mac3 {
> > -	status = "okay";
> > -	phy-mode = "rgmii";
> > -	phy-handle = <&ethphy3>;
> > -	pinctrl-names = "default";
> > -	pinctrl-0 = <&pinctrl_rgmii4_default>;
> > -};
> 
> I don't see this in aspeed-bmc-facebook-fuji-data64.dts, meaning that
> interface is now disabled. Adding it back in fixes the problem.
> Also, MAC3 is explicitly enabled for fuji-bmc in qemu.
> 
> Was the interface disabled on purpose ?
> 
> Thanks,
> Guenter

The mac3 interface was removed in the latest patch (v4) per Andrew Lunn's
feedback, because the rgmii setting is incorrect.

I was planning to add mac3 back as soon as rgmii support is properly
handled in aspeed mac driver, but kindly let me know if you have other
suggestions.


Thanks,

Tao

