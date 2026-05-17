Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F81CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 00:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=; b=DM8UBoDJCXaVIAYXVmnJzLXZuY
	cntBtaFZvFEqi0vVsAu+QNiSWK3WsvftrmMkAKkSOGURwC4e5kQEAVArs/TH84krXgt9V8nia5WEu
	WU6I4TLrjfVDW6D5UUNDZnI+BHFYeSzJrh1FKNiJwv20pU7Olmsv/cctDnXo9qVcUZC3NGg+i7QbR
	DO0R6DTDSZNcdMn+aTN0mzu3vnNgSI7UbQG/VJlc4WKotNJA0PKICXd6tXsRq5ZDZM6rUahXwE1Fi
	W4wak3KY+BWuLD9woDMolOt6XbtruV8kESlkLioK4VdiVkbpyJHVXJV3ZBqLmN4JfAnGmrPSZCUqZ
	Vyqcq1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPDL-0000000BleA-32xI;
	Sun, 17 May 2026 00:18:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPDI-0000000Blde-2FJi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 00:18:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b45cb89f7eso6762895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 17:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778977116; cv=none;
        d=google.com; s=arc-20240605;
        b=j4w2ReIzynbV2Kumz05jbtPF7FmQdRu96RdttjpaoBlnVT6LlfkT53Digd35q1XAed
         Nyxi6EgVgOWyWPMblZrvybmiVjcgpoEvE6xauCRjyfqHfm9bFhGURIUPUNBKYX6Sf/Sb
         hk/Ng0WqxiP/0kG8aQlN0c1KaXhXH66zNJqQiew16ZXeFPTaqRDgeIVEDYStDJzkKu1c
         2F1ro2AuknQ9XX+JkEkMBsaF/oYvxC1XJ8cCTdbi0Y6bW4uKiLoUMQtjP1a1aEmgv/RW
         xgi4vQftgkgbqt+Wh4tvxjuBGgx2glyEVhnXA9DNVI4XCBARjyze+eF/0BXQbuphuVtv
         Ub4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
        fh=jMq7Hc8SwYwKP+6I8wK4XL2zpjEbP9h5L+CUCkn5cjY=;
        b=PehrrFb0Uh+nkKUwlldHjaZpDHqg6jQNfEF5C+eGO7s1E+GZiVBifrap+DbqqIqaR1
         9PT5GcG/Ajrw1pLtLipg5FnZ8zhqE5JiXkDZKDj98/lDP5esYy5PEstA4Mt0yMhwSG+f
         8Miv2dthU2NmVnuTd2ZU/cxcf56ri8ORlQ4fqBOE9HI0LHjcG89RhUyG++YbFdR83WQQ
         FrbT0Kmuc7EznNlzEmw1vRJGX26L8QqFa/bLld0/Qe5CBvr/+VFIoyo37FekX1KsZotu
         3GLsz8uaA+qdvu2KxjAryNv+8crbgn/HbRD8Rf/RLJkyOlnwO7lhC4ai1tX/e6B6KH8N
         joeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778977116; x=1779581916; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
        b=nWxr1SyMy96QvEpuXv/5vT31kGqqBr7YcY7anPtyi/8J5t2oDKbutNkyDuTZ9lfO9Z
         bwNI1uAuKJBbziARuZir4ln0Utkug8WqO91vqi735X3XXAnf7N7pGX+rQq493DFZmoSQ
         3uJOHFgYR3cg797QL2UXIhVjiZnckYj21UNQvB6MtFVzQ+XsHz1HxbL8BRGe7GSndT7B
         qPeaUTbljGS6zZQs89MXCtn9XVDYGbk+8PrnSbX8PZMgumxgtm/lCwao6PNszbGQDRhk
         X3ZUk3dFf4I416I2yplSoxqlvVNkAKXuuhpHDxsbmrofo4c7DAfuzh3u9GJCAcdtN8ow
         m7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778977116; x=1779581916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
        b=LMhOd9cb3qPQdVInuEMOd8tL8LyWxTpr0z741P8IMTiScE5it4iM7T0H00lrbmMZP9
         HSKNipPCfvOm6h65CCa1il5RYqBwGOLx9yGrzfzvihja9LPq6b5dvqzICYpVH5E5Iegx
         qKfjJoeHhrTZMPeepjuUZE/fpq2yzh57PO5pEedccO6RMwXjCXUJ4cPx3SiM8NpnY1Cc
         h0b4sqRGjnSHVgCbABHXvAwyl9P8OiB3fDN7HuagiFfmc1gqH4ga2qnb/8mgEx9Brhd/
         AihVIepZyqKz/m5FpU+wZd78bR7tqRbGFlwWbyVtfCIMkD7om0XLxYLy0iQvhMBD0WwB
         L91g==
X-Forwarded-Encrypted: i=1; AFNElJ8POF7ec32qWLfOIsvwgI0Da6LE2vmNQTdDh3JOVlE/uz2ejdg0/aKsQ26dq4yRPglcqPL3Nwy8tyRkyLz1RCUu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxli+6vmNNtHJQ/SXO3XdDcJ23gOYPDXxeX9uMKXgB7cSt8opQ7
	0k35q7VvP13/tueJmbOjpuVIvbjEVEQPedIm7bcQot75KZTmfyV81r84cGxIPobedivm9sgypCT
	BDx0tlkDs2W227sftTMrcqFkL7k+wDac=
X-Gm-Gg: Acq92OG7oxlKj/9xnanwyx0nTndqMJyPjyYgwb/pTu4lnXmR8IP7spnTXXrdCpmsv2O
	j2wQkyhvV3oX9Ik0oHlCOxmQBUq4gggI5gtVWQ0qTGreVisL3NOQ+1trg+ZHM/IkJxr5ITUa1Mp
	LnpQju0n3FS1+NTvYR7QJa5NTf9xKylhPW6oq0S43fQ8n3k4KRr6u+VCO7Fk/6zR9GF+9Ndo0Cs
	dhmim+8xxTL8+IAAcC6bOHSR3d+YyJi+jwwwkZOsIdocSGldsPjWZj/++x3ZUeYA1ZcjdfwWslY
	nIm3RpzBLhD8r4hdXfBiqSr16JJyc7UmPNf8jF3w85OKlgnGEdo=
X-Received: by 2002:a17:903:3c30:b0:2bd:7ff4:ab0b with SMTP id
 d9443c01a7336-2bd7ff4b216mr106672755ad.39.1778977115676; Sat, 16 May 2026
 17:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com> <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk> <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk> <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
 <agfd4gvQ_m3Zt8GP@sirena.co.uk>
In-Reply-To: <agfd4gvQ_m3Zt8GP@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 17 May 2026 07:18:24 +0700
X-Gm-Features: AVHnY4JFQ_P1OHVLxDYOkHcfJiy2AJrIGhHUyvcIGLB3nM-OzzVXfHcxNMGpPaI
Message-ID: <CAABR9nF2GePScGzjbPs3Fzj_qiiWcP0D0+SciyPw1J9kTR4GUw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
To: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_171836_581937_BD23FCE2 
X-CRM114-Status: GOOD (  12.41  )
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

Hi Mark,


> There are likely to be different considerations for different drivers,
> on some systems the power savings from managing the clocks may not be
> meaingful or we may need the clocks for register access.  In general
> it's nicer to actively manage the clocks but it's not super urgent to do
> so from a framework point of view, it's more a how much work the people
> working on the individual drivers want to do and if there's a use case
> for specific hardware.

Understood, and thank you for the clarification.
That gives me a better understanding of the considerations around PM/clock
handling in these drivers.

Best Regard,
Phuc

