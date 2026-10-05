Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C14CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=; b=SNM1bIkGQJ97rw/oC6mXsmI9wC
	kdxH1I4StWk4u1oXMAqWCERXGDDX1AFsiSSWiO7m2FbXVCS1SqNuGVC42zwI41Fo7PbdaWgWmYlx3
	hJAheLpAVRPHFKWjuKNKnmLI3UqoLixAMAliUUkjQCmmEMPUx94zFS5a/dUKLhRRUjJ8ic6llqYil
	4P0IPfm6RhrM3kVM75gsfhptb5OFAGqCwcI98n+kDE+FXJRiL+xb5hNXiXjRFSKllMf9/L0zOxdZk
	Xc/ILbYi2DzB08YtzQ9kR6s9acQaH6qUSUz33ef8o5LFbXlUc2jV8Pj2DVWNpVuRRyCNLfNKkvaMQ
	Nv85k4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDftG-0000000GAjW-2Xi6;
	Mon, 05 Oct 2026 10:25:50 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDftE-0000000GAip-39St
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:25:50 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb766bfd3so12347751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791195947; cv=none;
        d=google.com; s=arc-20260327;
        b=k2PsUSaasOUBdVUINlFGISEKsrlPvl5aPCDAMcpUun/1K0Ybz9RmZYxZ/jfoOGuJvZ
         v4yhICBvYRnWDP24srKPumx9gWYXeqj6ue3I+XfSsrFPzQtyyFhls/7GYSOjiA6jXbLu
         KPFxtn7oHVGqPLn+oeapOmlPLZ0mvRt703lzKuxvk2kLQj5FyBfqY4H2TjsigzQb0xHm
         ltT1GLsu6zXgKtH/t/m9UfgvpwhSvu31dNv7fJ0wlnhr5c30+Y5UfP9UYZl1/n0Wp9yn
         H+7fUTkO6rDmO3Q7fdcHNHzZpZBB68Ora01fAsQmRqr4iwLa+tYFryT1wXp/99Ct5V+S
         bZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        fh=WwI5JwaUUsH3LW1lK91W84QOO8Lls9y6r3gUXH7G0q0=;
        b=eAG+taTBoYJB4KPdZEvv/ZBXSKhrWpGZRostuLJARrWEs1NDPcREPgwPQgDaMMhlJQ
         QJ+2uEEWUUpV9rf/03ImBlBCA6dwWCyqhmEhbK751JVcajJQ+HNPqT63zu7kSiWFtXfC
         juwse5POy0b13XiFEbMNwYnNpba3iUVy44dpo0rUG5mVx+gaBKCcH4kb47RZFtbq9FiO
         Sq9skRBqGcBUvc+AwknwqNKkSRHcoy+x/pSFfBz1S6ZAW2XZFMrk5PjBxrLXzktff5FV
         5hHgYdOG8shc17owTX5MRkuQDJA07sLyupCbxzlKefnBeelsTKbECUrjeUwKPnkiSGXR
         hO6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791195947; x=1791800747; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        b=j+okqObwrOwpKanLhm9je3VW5D2FdCcMhvDbCM8gA23JxwN0yHNp1qQKhOMxpAsN94
         mfHQQYuwYTm2cDLEt/DAC9j5voCaKrceQhluQA/a/Xb6rkkcYm03vXhPE2NCBZdKrK03
         movr5CK6XEcigcf4dFBPmgea4OhklFwOJsYzeK/Cv0c0eJcYkRP4L84lI3mrFh8VO5Ae
         DSvaK2tq6a5ZgBy+AGdVwz6QCUN25rBHSg7u9kGOggHhbgYqv7ZB8g32zW4fYwPWG1fh
         NpmbQf1Bzwtj3iHLWCJ1GQpvAWId4D8R800XWU2Y7CVMuZGGyVTH+I7wYDbsIDCYYmDc
         fZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195947; x=1791800747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        b=Hq9EGuyjeY8edsLHP5pPny1aTQapq7F/0mXUsPVfCrpTc9LLpWt9MLF+oGiYRSley+
         gbfEkeXeMYCB/vaf9iLVos90f7hzmXeyvRoJk3MT78P3ZEmiBp2lJHFgYUztZwgi88Ce
         AfFiNkXoCeP0qXFXK19pcwUFN48aZssUdOPCQZIp7KqJZyP6MLrVDHeFj70XEvZssXaR
         kCWVRsPWqruwcJADkQ9y3NAxCNwvNmOshcUOFdE4FMrKGGGpoB4/3yEXklhu1vgHJenr
         SFZHkFV0MwjGTwAQ+PNzAI+ZMe/hK0Ff/MXX/M7QLLHXQ2knqOwNT+nAeITBBweR7wSW
         QL+g==
X-Forwarded-Encrypted: i=1; AKwUvBze1dylWGwsQ2T3xPk+7+XNMUGutiSJaRFpFgAVOvkDm8vpe/+FT1loYHRlYS+FtyLuM4KMQn+qViejtwBcU3yx@lists.infradead.org
X-Gm-Message-State: AFuF++kCiO9buG9dYUgk6rryxOgljUNpGdfumQoUj1w0RlNLJ3JMn40U
	XEvMUy4aaq1auUmSXdTXjwz6CxoH/TSDGaiY5vCWNcELXvqpJFdkoR8fhtCn9V+aItYr5zL1y8t
	iw/Pt9DQk1TSfz/QLr1Bq0aJLgXGh+AY=
X-Gm-Gg: AYBFou3pRGBDYwgrUVWJGB74IbnOotWrsCRppgPIeyquavx3NF8KtzI/2kn748RLtYF
	lrAliWs1P55emAye5V0cvt4xK1xCgLG/IAN5rlqfGizIRZzBewrGS0Xi6AcZkr5SmU7vqLYz2qr
	yixg6uPr3viJys0CydfBljxdmqy73CWPZPvzKT3JoEBre8JPTj71IzqqS2Hc6ZCcJVbSrn2d3vx
	P6irsQfBE0z4ocOgon2+bf8ezszx1gddMdgg1JW0YkboqNROGb/UaHLtd6/V4SuoqShP5Ym8fNG
	oe9aMHvo664mKAkVV+3E05tdB5hTrS16NBcWli1BeL0Qq6sYAS6UnVhZ1phiu74CKx1Vsm98iKi
	1p50wbCGG
X-Received: by 2002:a05:622a:4d45:b0:533:972d:ff95 with SMTP id
 d75a77b69052e-533cbdb3d51mr186553931cf.34.1791195946812; Mon, 05 Oct 2026
 03:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260930071826.48811-1-ansuelsmth@gmail.com> <asN42bZlK_jwS6uH@parshuram>
In-Reply-To: <asN42bZlK_jwS6uH@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 5 Oct 2026 12:25:34 +0200
X-Gm-Features: AclHuK8w1WLWfIar1hB2u7SB0lgs-cuuBNgIsiH-Khygv0yU4CoS92D4l8-G0p8
Message-ID: <CA+_ehUw-Lx0wvN5O_9QFZb7USV8xBc=_z+7dkkB1ZW6owv3jVw@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_032548_850621_B6223A53 
X-CRM114-Status: GOOD (  19.32  )
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

Il giorno lun 5 ott 2026 alle ore 12:15 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 30-09-26, 09:18, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
> >
> > Also other unrelated patch are dropped from this series.
>
> This does not apply for me and Kconfig seems to have a trailing
> whitespace which checkpatch complains about. Can you fix these and send
>

Sure I'm doing right now!

