Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1251AC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=; b=3HOZqTIlhS53Wc71jA5eSzTSoa
	PmpRBdIzdutc/IhG1jzzt+Pmnkb6xLLQT+aM+ogOWgEzoAM2moQVMmw8PhxTiS3ved6efUeWPtLea
	MKMg95vn9Ln6eBvmm4XGsXsDZc31ExJQw3+SILpDSbiJo8wd1rv07TVINEEkmH6iZndoAbpWPaq3a
	Mt8juPAzJQmVO/X9+xNIgn2jQPiqbetRZ81K8/OQ2Bw2V9M1DM5TeWHNgdakW9yVXIKLf132MOe3d
	WOXcEAOLF8L9MiPGTpJyNTUpmeq3xJQ0gN8XebyB8BiDWpmfN16Gpd9xA8CIQni70S/lpfVGVum5f
	izckW5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwh91-00000009xYY-1lne;
	Wed, 19 Aug 2026 14:19:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwh8y-00000009xXt-34xk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:19:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so13224965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787149190; cv=none;
        d=google.com; s=arc-20260327;
        b=THXfOo8NZBxi0n5qkE/21OR9DhC7SCbQZ9mWQUHcjV4Yk8L2jNhdWNbf4C85dyO2yk
         6X7OovNKZBpmz9lMxl8h9AlrljR/d7afa3+nyTm2JX7Nn1tajaESJxLmfSY78lUEqbdy
         qlH6eUM67WHT+qf/q1Wqyz+G8yoYGgrq3/TJb32ZtqhI1RRB+B7X0q3ajp+pw58/lUEP
         UPZaNZaH4m8rsdI5SAFNrp5ig8HnfkfxAUQoml/tvijXX544/yw2Yewyf5U7PfOFyndr
         fbeMoiC5ZfY1jfbTb4bG4EltcjJI4pMhOawRKIPNLvw0I/wfj2TLuaMCBRwf53WLaM5Y
         8Uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        fh=eU00M419ACBxq9ROBszVOSA0SodJdcWBByRIXGyIBdU=;
        b=FoW3jPuddBNihI5zxL1vC6U+dc0D5zjTYskzXUVYhnzKAsIFSB76hdQZsWC3Irar2U
         xmNW1TqWk2JJzOWItz7jIPMPCOcUJvdo+BNnIC7gBEOWcvCV+Ru5Gs4bDa5MSXaeon6G
         8Pp1P/Dyp5qq5Zw7JtkDpDMWV338p0GXpfo7irrwyIkUa46Jwd93OWQVC3E1JabdQFyB
         We6nSNH9/kVx9bWbO8DD6cQj+aZyzwFTCgHR0tmV1WEKiY4K8w1wdz28b4LkztljOGX2
         VEdFacKaR3MPgdF0ZCqsKNDB2XGtfRSWffgarNiqgDe/92J2j1GvPOXUka3eoszHDFYy
         WCGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787149190; x=1787753990; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        b=FOc4wsCrGnhJElq+7rKjojaFKXTo922V8OgFXF4tOABlEPzyTkPaVig4510+6rIL0C
         Kt1vtboG/3vo1XETKdPC9hl/digkjMypBnkIiBzRmGMMsZqQokhI+ZmWrRVOt4rjvRbF
         G/t1AyQkb2z5FaCGI9gtnerv5Gs94jXEJ3rT/VyeXpMYsJGwcaJGvsrdzK0AessqNBrc
         0GuHmrQoHLuSfc4F96QggubYVi1q5jvyl9iyu0+uwHk3J6JlnYGLJybU8EJm+yPa2/Dt
         ltjsju+FvSJaC44TcbXUhacpUcwcZhEpNDFTRV+vQY7DzuFrt/GNwqWOa96NgmuIdcFL
         qeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149190; x=1787753990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeJKUhVwZjDQ5ldC5TBiCaKL9cckQ2oDXCu8SH2HVSc=;
        b=RzDF7eckVakF/ref744IxmJfMZXgoIqVUaT1TAewpFUyFVMeuf2MpK25qWEqP0v82K
         CkyyRJldwWIbQ0rl3xG+JmYE28UYLRW0hlTGwnoOH/LdRvFjgs2nuSjGwLj6PLxcR0yB
         Z1YUqUdsNgwwVPJ6D1NL+EC8t6xJR7mDiHcWFgW3BNjcwcEksg3cabj8/e/yKDGc/l5J
         9jxK+BsXaocmKZGxUqTOLGpP0c2bq06EBgMhx1rzvNB40R/1DkLsVSJxlpXNM2tmbSQK
         JpZGkG5zWOmGoiMEylfp6qdlfp2+LmZHi42qhGw3LMD/s7NXeh7h7+Ti5FJUNZav3eji
         giZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNCqdz1z5/BaXrUAJ3xKWqTr8oYQwaS7OuPXkx5bSOtErMG3T+lZJ+L3m33G/JwHorXeMPcqs7znnUGZroNOKu@lists.infradead.org
X-Gm-Message-State: AOJu0YwbXfH7Sqg4AwyZtLZbqMzvWgFXuwvEK/wN0NhoTtlvzq1IaT++
	jqVt+vHZ2Y4Zl01DpK4gTv+WxdDq08A5MQhiKblDYq4BRw+YAf2chnlEqW6FmblKVICWhqNw0se
	rjYKzhB3YdaLma4tVQHB+9XgpmSOuckN1dsadLHvYDA==
X-Gm-Gg: AR+sD11YoSq3tMc1sstO6kgdmd87YZYPScTv0uT8QSjNBNQfc/t9ekQtGnspGw7xZ7H
	Yrrp7nEjkSX6yAQU2SpPWWYDDnv0QZOf+1i74ZyYggyULCRXK/IHHn/q9tvycDbyHq2nPZYXvsJ
	24de2SN7aHC3Vf0A6pq1AgH/+tGMz+q8gUJnF/f6MGSt4lt0ojLHMMPs0d0ApXjcWglWyyUfTg0
	jBd2j6lwSYRdVEzaC5wtOKp9pE0hE218emvK4aAWqzNeiA2TsGx4DSp1vvkhN4bbbb5CBAUypHn
	lnY5EyQJp1pp6PSuFproCUq0LpbuIUu9AyW1ZHgyPH0hNQpT2JEOpfKN8fWe4Q/aMfoOEAZuBWT
	3BWqDvciyCZ42D/FYbIEuKvOUpKz29Ux0jkU=
X-Received: by 2002:a05:600c:3485:b0:499:a685:c10 with SMTP id
 5b1f17b1804b1-499aa19a3b8mr105118355e9.4.1787149189928; Wed, 19 Aug 2026
 07:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com> <178714815308.32179.15619694497271022262.b4-review@b4>
In-Reply-To: <178714815308.32179.15619694497271022262.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 19 Aug 2026 16:19:37 +0200
X-Gm-Features: AcwNN1WSp5z3ykm5DhYgUXUEaifqr2FKPqOZiTmJSVGHJcNVXhm6Z3n9CL5gr0M
Message-ID: <CAFi2wKbvOX+E=nsWuVJj=_xQZQm=vCA=qPWwzgJF2oio2ov_UQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC device driver
To: Tan Siewert <tan.siewert@9elements.com>
Cc: yh_chung@aspeedtech.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
	=?UTF-8?Q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_071952_787097_C99B57B8 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Hi Tan,

> > +ASPEED PCI BMC DEVICE DRIVER
> > +M:   Gr=C3=A9goire Layet <git@gregoirelayet.com>
> > +M:   Tan Siewert <tan.siewert@9elements.com>
> > +S:   Maintained
> > +F:   drivers/mfd/aspeed-pci-core.c
>
> I think it'd make sense to add the linux-aspeed list as `L` here.

This is already the case.
The following maintainers and lists are set for all paths containing
the word 'aspeed'.

From the MAINTAINERS file:
```
ARM/ASPEED MACHINE SUPPORT
M: Joel Stanley <joel@jms.id.au>
M: Andrew Jeffery <andrew@codeconstruct.com.au>
L: linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
L: linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
S: Supported
Q: https://patchwork.ozlabs.org/project/linux-aspeed/list/
T: git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
F: Documentation/devicetree/bindings/arm/aspeed/
F: arch/arm/boot/dts/aspeed/
F: arch/arm/mach-aspeed/
F: arch/arm64/boot/dts/aspeed/
N: aspeed
```

From the linux kernel doc [1] :
> N: Files and directories Regex patterns.

[1] https://www.kernel.org/doc/html/latest/process/maintainers.html

Regards,
Gr=C3=A9goire

