Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A644CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 04:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lhqdHFl2ZhhtJnT3ol6MdSdmks7nVBWA/+nofahUCU=; b=o7LRZL8RGaEhmQdIjgmcvEpJCq
	eWmUFMCcfsGAtS4mwvpQ8YF3KkbYl8nylfF21JqP6w35XjRF2lROGEUSW5qB2xoMeFwFmlcCdT6Pf
	3iF7KQsBWLbKb+m9wlOqq32jiimifNGpMPdHg6zPSNPRYyCafTdDmX1slSHmCL0HC6/S4Y1T/IrBH
	LlKlDJpMSHnIIxczr/AMWntT+qIbM5DP1iK9/NkYZDMuRl2U6Pzb4fiqTxbfTqChUlHp40wNQcIKb
	UPmuFdS2RMcDne2leKr864E9MnQ886q2VcVCkiIHF+FFv4FLNxscEYOOSB+ESQWb2jIuCJerjRhBg
	h4jf57eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTR-0000000E929-3Hkb;
	Mon, 18 May 2026 04:21:01 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTP-0000000E91c-1ZRk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 04:21:00 +0000
Received: by mail-qt1-x844.google.com with SMTP id d75a77b69052e-50d7c12e48eso21472741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 21:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779078058; cv=none;
        d=google.com; s=arc-20240605;
        b=XNtBg8SR92cepOv1r0x++Wxk3gFkcX61WK3UtA9ttNIAsOw5wf+5uywFA5UbaM55lw
         BkBjV11pDYBEIg4g5MsaqOTR5tUhRunGyVmjtZxpxfH5+q++BnDalUTb81LL7Y7lbkAM
         4sC4y6XFJWri5TcXi/7ZMpC+MjH2kaQtn3fsIwuexCr/pIQq4wcntn2KRWUgKzn+79bP
         UXu3rLgUkXu9XBV32Qx2eCbUKP19DBagogY/r+gICCM/gN8unSFZhf357XaOk2DFvxyN
         FJhpakAgiVpUFSt/IU3QzgDA1yFywvzLsZwFAtAGlm6l7ry4U5ZmrkoXbykYAQgam8JI
         QUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lhqdHFl2ZhhtJnT3ol6MdSdmks7nVBWA/+nofahUCU=;
        fh=D6JwzB+FqOd3aGr/8/rkpyCy12IqKFsA0vi/txmGVrY=;
        b=gAG17Z7Nqkr23tRv5vrDrT8EoxTzopRi+PSPsbRsguC2V6bAVFb7qXKduMHcDNOl3+
         oyIdCc33IMwM5P5difHIllSkAg2LbXTrqJuVfpOXyUpTSOl2yvz/xE63wdcKqNStEGgY
         AINFDtG9pJXdolpBoVHk1jKDAKr11CbaQNFcqfsseNeyglXpUy5Vyo2IihywEcWWrSgo
         OKoPNwmpB7tES14FPLr3nRul4VOl3UBl6eVzQPl8gYSQluAfTUpbqURyZVeb8i8bYaWs
         D9oNOsXKt/qDNQjBJGU94ngFuw+Y8o3gpZbIF2Xcx+1/oRmnkKXbm11ycDYvOJ8isCGS
         Ko1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779078058; x=1779682858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lhqdHFl2ZhhtJnT3ol6MdSdmks7nVBWA/+nofahUCU=;
        b=WiIIXTAQUb4YoAi/uC0OwQQ7QRGNPz7tm1qJa/j0bVVn3nrw1RjIs10bEXKGXc3YPq
         6m0BwKK9ng34Px7md9h+wzusr6F6QNgdoqhWvZb/jNtj36Zo9AvM5KVFpvbcSpU3WnOC
         kxHs6m7swgIljyOMHjte2sc0keJUBY0lga1CD+MHNSjci+a/MoyxORs26JFkHLLigEhr
         2YbPA/dmpKcaR1tBsn0yUW05r844/H3S+zALuhEQfIPHvOfYak6/pOH6m0xlv1arvhxd
         svclIctBqaRpJ5Dxat/2rXaUENybtQofxqg/9Ve/W2ow/CL1ONBDuOjtLgrnryWipPNE
         ifEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779078058; x=1779682858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lhqdHFl2ZhhtJnT3ol6MdSdmks7nVBWA/+nofahUCU=;
        b=iyjfcG2WISbAHVOhc4VQtzgBcSIQ5Es4XrWSIv2LI4SXXshX6tt4cvBF2nvs66BHVo
         HPyqyFFWVSLbf9tzUHmgufcPPDc9qJQWjyWak7cLiknzcn97bZIcCP3RszLfBTklMG/X
         LGh8xXU04Wyo7iJ9r1mM8NjNAOs5L7KQc3iUiuSQzuKnQvYRdsTpC4lMWDBpgvqB3QdD
         9T6LT9hpjVjnadhVomLkwq/fwY8rSBD6s/+2XTCNtc7XizVNjNuPsbH843yqY8N9tKVA
         IBK+rR75kNZaDJlCOSIIgheUDZAgI7+vyW4WM2ejT7PSsy/aBH0CfdiHyyQEFpr2ebEq
         tufw==
X-Gm-Message-State: AOJu0YymqnsnJy8cTX6h03Gxc1idE1X7y1FEkpCGL+iZQZiprCS54Bvw
	pTmfs7ZvcfjMn3XFoih7DUzTHhM8Qh3Vr5qfEfaDTPR4lSVbddszmciFyjIh/NyIey9ICIrEsCk
	hobAicmFU5xmF3vIE4ZgmlTMbvZBpuDY=
X-Gm-Gg: Acq92OGuJ+zR+J1+/4QaUXxGCoVT24MAn9bRHUJi7ODF5LCF70Vp61S/ZolhuqBLGMc
	hN+dUZtaM4wonm2oAOozQGbicZMlsM5v/DT6ynXMH8y1skQTt8EVPU+UBVhMUckKDRShzAn77kQ
	w3Ez5fgnKBEwSKJBoRq+h/zM5JTjRSsnRajfz905JGkwGHoXeRbJxhjOX3JI71CA9R+gU5KbBlq
	oPSDEc1OmALbJJvNCZl7q83vodMBKnM8RFMelUJh+mZpQOnv1EdT9Sldr227McqZY1Ztagieo3H
	gNL5PhuhdHqFDQGzF9CshVJ6evjk1GmTWZvO7SEBMrfD0Aia3Q5MACAPIiS7LYOmCxe4NblrtKz
	3Oi8=
X-Received: by 2002:a05:622a:15d4:b0:50f:f030:920d with SMTP id
 d75a77b69052e-516418bb45cmr220027341cf.30.1779078058069; Sun, 17 May 2026
 21:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260517235916.57178-1-enelsonmoore@gmail.com> <b3c8c216-d8e3-4ee9-b4bc-1080f73592dc@lunn.ch>
In-Reply-To: <b3c8c216-d8e3-4ee9-b4bc-1080f73592dc@lunn.ch>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 17 May 2026 21:20:46 -0700
X-Gm-Features: AVHnY4Ky58bu8cVlGTUoOuhfVEXK6a6rZMau0zDx7saz5tCVvuIMO6Sq9q3n168
Message-ID: <CADkSEUiSrvP78rNZYQ=j7hQbgMedLzpqM_KgKD-nCLEXbi68AQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: PCI: expand single-line pci_common_init() wrapper function
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_212059_421226_E8DBCC21 
X-CRM114-Status: GOOD (  10.07  )
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

Hi, Andrew,

On Sun, May 17, 2026 at 8:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> Nobody seems to call pci_common_init_dev() without passing NULL. So i
> think it makes more sense to rename pci_common_init_dev() to
> pci_common_init() and drop struct device *parent parameter. You then
> only need to change pci.h and bios32.c.

I considered that, but decided against it because it would prevent the
code from easily being updated to pass a parent parameter in the
future. However, given the age of the affected platforms, that is
unlikely to happen, so your approach might make more sense. What do
you think?

Ethan

