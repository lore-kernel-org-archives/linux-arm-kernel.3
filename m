Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA9BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jo2emWYPuVUdFhGH9tNfCU/2M1V1dUWXzJprgmcZuBE=; b=SnhGMM/IL8HBdovniisc+FevC2
	f3T0rCmxlU2N3dLvPN8D4eRbkUyMLD23xRVp/jcIc65nGMXe9qdwFcp6/Ne1IYNb36gKBAIZY6ZwP
	21iSmj7M/jvv67XxWu5DoJJ4rDjZdF4KU/Du7VIBpgQEdU8SzC8f9sDf1BOpBSIw7ZIABAgA963Qs
	k8h1DodUBdwHGDyndGfJ4oB25Ms0ywTCsCivfkg8LVnApH4u7lv13Tq+1E9bnIA5dGv0Fp3R4EIVo
	uya6AbNj+dNyQBFv96jr421NKTBV3yPCFUMtVBMcx4EGAO3gHLt6GlyZ6VGNsdTKpyvzbH13Thygw
	t2QsoYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNQs-0000000APYz-3U90;
	Tue, 03 Jun 2025 08:55:42 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNKr-0000000AOT2-1x6E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 08:49:30 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso3940886276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748940568; x=1749545368; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jo2emWYPuVUdFhGH9tNfCU/2M1V1dUWXzJprgmcZuBE=;
        b=MBVhrPd+/YaLOOlImLD7+fET9rTam3i7PeHyhxUwY2/lTntzAC5wZvDsTV6nEjzqsa
         F6qRloeQ4z1FJZcswEtDoxXitQ41gY6oO7CJ3paJzIvPlnoCL/DAb86cbrvf5zOY8Juy
         rHyjSiCDdmfAbdFSw6dLIkuiOR/CiXRjTzWilmCi3MzaBrHtUF3IWeCM1/im8ulyF8TX
         /EJ+hR8lZ5NZR74IVoO2CpFhKL1XgsYesl7L3xhM8c354Nby5Po7qUNVAE04cKQarsAl
         rhgCAqa8W7UzW6Q52IbR/NJIfQV8ghfRh6pw7S0lnaqrLf/iEGz4r7clHuIcf3wajJnz
         KLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940568; x=1749545368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo2emWYPuVUdFhGH9tNfCU/2M1V1dUWXzJprgmcZuBE=;
        b=NKMGA/TXGuKkVz9JmlgwCaopXjr2o9sO32ajOmS/XzXMel4zyvkLGoYfNgd5gsWmR2
         tR0p27yUNj32pVxbqBsTq68JyuT/rvnz1fJhDW6uxDSQi3M/pIVmszyGQlJ4mq4qL+qm
         K/ghzNHBk2zmRdNptVinUumtvsKVMGs7gKYr6ZLtxKZeVdYPMSqUFA9cP71pPQZ5HYHi
         wtcZwKcyxgIU2UQ+KQNxW7E3lkuGgNEsUtcVeWRqr5WXt++VhcJ9x7H1I6lVb3tFISsq
         m0+a9OsaeIdj1/whYMWVRoOVH/cPRkzfnGRmPTMSJmO9wumxFp2FVQQKh3W/+ax08X4B
         NICg==
X-Forwarded-Encrypted: i=1; AJvYcCW1PaPpEqztOcl2b1crjMoqdTZiz0jQ2nyWlipgR8imIN1SMHhKqDY9fx2qDt73i+3U+xrClGd/88xN+muMn3d5@lists.infradead.org
X-Gm-Message-State: AOJu0YxvrCiXGrxnwYq2ZanMDoatfjy/K93Y0pmXtbkAc7UNefk9jsne
	C7FFzaH5RPF9WZafxYXiDtzMfNDWWV9jMI0MdknAuyZ7HEWj5QjaNj2yMvssgqDGPVxZ2yKaUo1
	6Wm20nOaKK5goyMhkduhNzei0NdUX0zm/o+JADPb1YA==
X-Gm-Gg: ASbGncuRFtGXoIZArbzJ+A6AthxsAYVqK4S6E1uSlnOp2eX7JfIV1BvAto2bMWVTN8p
	tBitD62yaMt+iWTqFRXpiDKQS1RpQXiF+j+Oi9ehsTq4YnWAL/P0j39Fk4Ph1Yr+b93BviqHIfL
	6yZyZM/q+z5R9mtUEYNJcD39dRqhWmZDU1YhsD1ZnOcwNN
X-Google-Smtp-Source: AGHT+IF9VRq2mySV+NZMOtlPS7LHY1UWFTHf5bGIaGf3A1nwEUi9V3fmFvH4FzrgEJH86VureCFE0fEwOls4JbNcPeg=
X-Received: by 2002:a05:6902:1007:b0:e7d:c9f4:952b with SMTP id
 3f1490d57ef6-e8128d4bc50mr14186933276.16.1748940567941; Tue, 03 Jun 2025
 01:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com> <aD6ouVAXy5qcZtM/@lpieralisi>
In-Reply-To: <aD6ouVAXy5qcZtM/@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jun 2025 09:49:16 +0100
X-Gm-Features: AX0GCFu7h2yvWT4ZtvcEtnOs57BjRyvz7X83NedEDQZkf8q2f3eizhXDfws6ZwE
Message-ID: <CAFEAcA-X3bwCXYjp5JccsHyXri2VRULSWR+cjKWkNPq0iw8XGw@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_014929_505220_6AE485B0 
X-CRM114-Status: GOOD (  20.45  )
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

On Tue, 3 Jun 2025 at 08:48, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
>
> On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > The dt bindings do allow for describing Secure-world devices:
> > Documentation/devicetree/bindings/arm/secure.txt has the
> > details. We use this in QEMU so we can provide a DTB to
> > guest EL3 firmware that tells it where the hardware is
> > (and which EL3 can then pass on to an NS kernel). It would
> > be helpful for the GICv5 binding to be defined in a way that
> > we can do this for a GICv5 system too.
>
> It would be good to understand what DT {should/should not} describe and
> whether this DT usage to configure firmware is under the DT maintainers
> radar or it is an attempt at reusing it to avoid implementing a
> configuration scheme.

It is definitely on the radar, not under it -- that is the whole
reason that we went to the effort to agree and document secure.txt
in the upstream binding documentation :-)

-- PMM

