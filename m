Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C57D43349
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyCDl7ZPUt6a//yr/835EBnfK0zGbZXT8k2phIEStMM=; b=k+kZEAOGWnQhCzwtlBusO45U65
	2utgerTH0welHHkMpq4GlpZCC/QgMMMMImpfNCyZYQA/x7GsdtiK2ljXKZrHfiz1BfGKcSFY4MZy9
	j/S8GJ68XTGRM9FScXhkq/TR6lvKcxMSDUwmnn8Bs9LdeOrkWyevfA7tpbAIxhNtll0kzZxmKuFtX
	xBEfKY5T3sUT6bR9D4XI+k0AZn3ZSGXXBScFn2Qa0xddSDj9xyEb130VGVym9uR6jHDJGb5eIhyjC
	vYThw54RxQIF1GOEERBnmfyLCT9bdVA96dWG3DxM5WAyst21DiZcwxAF2P3pvjPViapGL0FRIN22N
	WGbOdV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90cZ-00000006geE-0liV;
	Thu, 07 Nov 2024 11:24:15 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90ap-00000006gMK-08f1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:22:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a628b68a7so128520566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730978545; x=1731583345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyCDl7ZPUt6a//yr/835EBnfK0zGbZXT8k2phIEStMM=;
        b=YYP0Ync+Es0jpoTCLGBZ7pvmqZEJn/XChO3udZywN/zjsM83TEanaJXwT91nc0khxR
         DLagSt9UeSFg4p5KK7O0en43I4rHAcUK6I2DnxMLHumKq5c1GmAIzmCK12D2IV39/BPM
         SEHmXwci7TBb0TzUNuVlSvKbC6o4w9GbWPMDgFlRnaFcFU8nm6WKPWNKRCo01vayr7qs
         uuEkV9R0zDz1AUpd6oRSQARIeEp86PUlQ7SY8EiVhnK+5TRWcAWtFBoEZ8hTbvXDMquw
         UGTruVkpyvIrClx0BbGixeZukf2KnL8PLMXEUcMA/K3HT/8v/yP4hwX0B18MMNWeH2O5
         u0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978545; x=1731583345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyCDl7ZPUt6a//yr/835EBnfK0zGbZXT8k2phIEStMM=;
        b=Zt059FeT1gow+CiMg2waAaJN6kannytEPAjvY6qeJ6svvH1MC4Fl2xNouJZn/OHt9i
         4mOJ0l4aXzjYYlz2+5Na4ArNBFgKlyT/sKjfMFDd9nmgmgg9hnZVBXoRHG/t1GvlEu4B
         mWeGU2IYN6XGgPJNjYUX1ZFsLYyOVEk9QAGzCRXG0kfoiic8flZWNsmkFpFVTr+Nt2Q6
         7BPiPI4h9MyHZ65scRKFIDVkMRnAElJ/r5i/KGIjQQbKFr5UIp48AZrT5qTHdsIfCTSL
         RI3fS4ExJMdYphefsEAlftrFpYSlF2vFyK+cjn1dqjISCRFjicDvznMo2FaMqWXTBwMR
         Kglw==
X-Forwarded-Encrypted: i=1; AJvYcCWHD6I2bz5dJgtRmioIX5+uf/B8sIFDjzw1bBmEL6hIqEFsharocQOKo8giCI1aEdDvqu9i5gAGnVLcpDkZ9jHg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd1Ad1dhwqAQamQJvmNxdV808vhGGnEBMxjquzSDO4oTaIc9pc
	4li46K794+AqMAa62MAF/lRKJbrEfdTwTfJgK1eHHd2o2fglaUKHjQw4pPiTEfVE5/gHYcNOkA2
	0OGaZkuAy/rLoWfbOCUqEwMxKOWo=
X-Google-Smtp-Source: AGHT+IHGsPapN8RHF9Qpx6NuCKBBsmhdkYBPLxie1jdxHa0MnvuH1vKs6Dy7tAmC0sQgjvTv9FyEtEoss4jejQxSaY8=
X-Received: by 2002:a17:906:8415:b0:a9e:c940:d154 with SMTP id
 a640c23a62f3a-a9ec940d1ebmr412325866b.17.1730978544331; Thu, 07 Nov 2024
 03:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
 <20241106-catalina-cpld-ioexp-update-v1-1-3437bcfcb608@gmail.com> <8e858e760c78ddf533e9e03c20b34fce29862c2e.camel@codeconstruct.com.au>
In-Reply-To: <8e858e760c78ddf533e9e03c20b34fce29862c2e.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 7 Nov 2024 19:22:13 +0800
Message-ID: <CAGfYmwVxwaZk-si1OkP4xeaODhAO74Hv43U=SpzOsGOBkTH8Bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: catalina: update pdb board cpld
 ioexp linename
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>, 
	Cosmo Chou <cosmo.chou@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_032227_097790_CD00A713 
X-CRM114-Status: GOOD (  15.99  )
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

On Thu, Nov 7, 2024 at 7:41=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2024-11-06 at 16:58 +0800, Potin Lai wrote:
> > Update the GPIO linename of each PDB CPLD IO expander based on latest
> > CPLD firmware.
>
> What version is the latest CPLD firmware? What was the previous version
> with the old pin assignments?

Because the hardware changes from EVT to DVT, the CPLD firmware
reallocated the IOEXP pin mapping in DVT version.
I will add more description into the commit message in the next version.

>
> I'm also interested in some discussion of the coordination between CPLD
> firmware, the devicetree and the BMC userspace configuration. This
> change feels pretty painful.

I am not from the CPLD firmware team, I only know our CPLD team was
redesigning the entire struct which causes the huge changes of IOEXP
pins.

This is probably a different topic, I am curious about is it possible
to assign the linename in userspace?
In OpenBMC, there are many services that depend on GPIO linename, it
will be more flexible if I can assign the linename before service
starts.

Thanks,
Potin

>
> Andrew

