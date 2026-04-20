Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3650F99C76
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 05:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CN0rXWBmzkEFgIqLEHhOXPBNQ+jcsnyYPEtLHAwW1Bs=; b=zHDnUVGjPCFACn/IVfSP0hHsgp
	6lpUTKL35WEMNX+ipfBtBpiqyhbhYdU0yt4qXaTUKCOHcs+6tCth+ewPC7VUixPDlnyI1+Rn6Oz+5
	PlYXwZrKcChaJEp/w1z4OdcgfhPmS/4fWy9fL85yYPnXHkJwO6siHxuVzq3SSJL0S+WYqDYt5/adg
	zfqYpX0V2osjcH1kzeqnJjYuSwkbrnAr60HaGDQzXd1/dtASKtS3UnB05GmACRRagbr6F8b6e3jvP
	zdWe3HEJsUtoS7TVm+ZrWJOuJ66jQvN/b939EvWH2r/W5jzVMlGrKhsCcHMxbEluAuIwvh/TQIvqD
	DfxQHtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhOG-00000006SAz-1FMl;
	Mon, 20 Apr 2026 05:41:48 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhOC-00000006SAa-42vx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 05:41:46 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5673804da95so808472e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 22:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776663702; cv=none;
        d=google.com; s=arc-20240605;
        b=jBIqjfo9tM4S953KbGa1PILXF4wAoKOI7QfhC2BC8weiJ2IH1m4laMWXSFe5Sgm0ST
         AtEwoW3hLSFE7vyeWzINdbOcfERZeQ2F7CBAZr/9lpgoGFQwfAZx574iZ/SBZPeJaSbJ
         OFIfzUOp3DFaDGyLEWqphvkXyHdinA7ct4NIc5G2tZS1ACHlHv22JnyZaDrXqLHijwhP
         GIphi0l7m4cZ/H+N9F5v2fePcP4LQw6Uolj3xvvT5rXndN5T2L29+YoVP9Yo057qk/NF
         J6wkcO0mGpO7aYsoxsuIneSaaVkTnWmiZ1xOcKCatwDyFB/gQ4ebyh927luNijWrigyP
         oLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CN0rXWBmzkEFgIqLEHhOXPBNQ+jcsnyYPEtLHAwW1Bs=;
        fh=8obPqxKDuEPDJU6MnUy9DlO1VzZUznND3Syg/A1lbKg=;
        b=cXWDFKJfsR4gXaKljt8mAeZbkn3Mz+KKNxqmdWLk0QYupHuevmF4bdChsvpKWfH3LL
         9WI6JaEPhcwI4rplm6nUO/aTqXlxZD6DLT8S5oWhp8nQU+GFtYaYzIwhGQLEJ1xDkAUA
         /uJ4h1HSvSOXNImtncQinsxERYAVnLX4No9l6p/Q2NPfFJ6jKeWip+T4+3MD5f+Aa7li
         bx3BE37n6Wzz6udE1ffP9cq9rguTY8UqHNgGh8gdOlomTZ64OcrlD0ONPspbEnaG/fj2
         suI33S32j1kkP7UEsj/eXl7+PD+QDOclO9oqTxDCaTua4Hiyt3QWTGP37uHwldUAReDD
         OpWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776663702; x=1777268502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN0rXWBmzkEFgIqLEHhOXPBNQ+jcsnyYPEtLHAwW1Bs=;
        b=A2nDIUA4Zy0OjCYDanBKeocKYgwC+R1I4r2xm6OimeEJort4n+NJZG82oadqr0EE+K
         H3SEtvjRCysNg0cHb/wkCoYwZGYjCvB2Y++BItQryREIBQS17oK/MfYRw7lfFnlEr1gm
         U1NgJLmpIse4mU7ldwURD513ij092AxXDC7EjByNKRTY0c7jbYCllUSSkXjf9ny5bP4A
         ivfKSDTBT8xlQlff1kJH2S0kIa9KQWNLjaKOhLqof0DtUNKSuSZ/NwQP1swz4HUNJwWx
         PVQwBPdN1OUkrXwYYzKsw0gmfXSwQCVCiO129R9GpB5pcYBXg1khjK/Y2ERvk2djmoME
         ThsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776663702; x=1777268502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CN0rXWBmzkEFgIqLEHhOXPBNQ+jcsnyYPEtLHAwW1Bs=;
        b=onA0QhBuxlzuN4VMPlK/DpYg3HhNXMfnrWrt6fnBBJp/nQBvJcRB9ZdO8fXaJKK1Bx
         fzYalgFluTALcjqIdnbfjZvVgBgWa4xZYaxfrA/SFT0RrtPjzr4y8yYUOKIzDmLs0dGY
         MlC9vpAlUjmjQ/jeQKjl4Sq6bkB6Y0lUHlLMB2saKtJWOykTaqPwvO/8Dd87NJX2llwR
         MOcaG5G9skTCCEY3UHm2Csh1ZYbZ2/+LWZV+qfmk8XTjvj4ReC9qk6ET2agwaH/CRYEa
         /o90ITCuQPmddV+Qop4mkeJc+eoRV3gYoeDgDXILyunXRGHldQFOX2UpxBeHl4oqQpqP
         N2Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+lcQxwLu4TPpWXW+MUaBDzjdZkJpL04VyEp+dqQ2o+4CELCsPnP6ArSBKpluCh8GXl3VBfAf7BknfEYotOKDue@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/AP0a423/OXxPB0WIczxRh2AHENaNGUAU6WoxEeDo2qqSeD6f
	JS83HiUBeBUFV/uxO2Tt5xvkg7n9XiAVevdO5hehZ/IVbaL4euTOM2rdK7pVUNWj1hvSe8tCuRR
	7WEVZ+he9YBIFb/X4ujWzYtQcR1ACflI=
X-Gm-Gg: AeBDiet1m72/9Vi6ZAMq2Z37mA+vp0JVTt4PZXAU8EAON4arfO6F9LJTGzD6mXr8ESg
	kAeDjvbfWPU6wXumIIYbJInzTHO9IP51ZY1X61CGSBLQzuXdQTYH0p1XPKh4JmSYmE8eXJ0Z6KK
	G10094Q7WW9yrmTILFbQwDW1CMWCWa8WNXoYE2DkKpQispKQxkB2wkQ0qr+H24illuF6O9mZoMl
	QfZvwj1q3qaayV0bNu/D6bJ1VwMoP2svOKrU56UMsZbJCSI6AYmkMyY2ZWA862IbssIf2AF1EXR
	N7M/3ujrxoYJK+IdGR2ZlVZ8HX0=
X-Received: by 2002:a05:6102:1591:b0:607:9443:b2ee with SMTP id
 ada2fe7eead31-616f73ff3e9mr4135707137.15.1776663702601; Sun, 19 Apr 2026
 22:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com> <20260409-foster-stability-f77b38c6f7a0@spud>
In-Reply-To: <20260409-foster-stability-f77b38c6f7a0@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 20 Apr 2026 13:41:30 +0800
X-Gm-Features: AQROBzCiKd51EWmBsMq2VuVFATQ6pDOW-cn9wWzru-4S9PgURyPGAf8ahBr1njk
Message-ID: <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_224145_029780_2F177996 
X-CRM114-Status: UNSURE (   8.01  )
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

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=889=E6=97=A5=
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> > Document Anacapa BMC EVT1 and EVT2 compatibles.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Hi
  Could anyone let me know, what is my next step which I need to do?
  I can't find the changed in for-next branch of
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git .
  Thanks.

Regard,
Colin Huang

