Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FF8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJC4lX0tZTp50J0S7on2pHdgb/jZHm/OiyTuKIg2KPY=; b=sZUqZQuvC9wuHV4sZVLbESkJlV
	+YGX7RGOAfNMq2RQ5YbSvfZkR8dUDbCArGwYNp3akNiLxPW1s7Kd6im5KZemQd5eSG8Hy+gwF6Jyu
	cDDTegzrma+w/UWD2aYKL4ecxv0loLLfkxObQ2xXRar+QddI88DKVeWqG1M4PHbhTDVOYb42S1+Nx
	xJZR8Evq06TU5qill7uT+sdprD13H/UAQzlPl3zR85+xlVh/IYDWkrkjneTesMnoNXi8u8SAcefiL
	SmqcSuTfn1/xMdtEmVnIy4UPjzmqdGZ8T9a95aHiS/EYRoULJ+gUwtgAxZ8mZPE0+ezOCoL/NFIW5
	ocmQ4Jqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpdB-00000002jy9-1xWF;
	Thu, 09 Jul 2026 14:21:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpd8-00000002jxg-0JpV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:21:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1019428f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783606892; cv=none;
        d=google.com; s=arc-20260327;
        b=Bumdjobp4AyHbGGc0GI+FzNxDtBT+Su1iLzlSw1+zkQQb40EsevnS2FTSm1o+qvPJo
         8dxuWmXNVMVWziIPF/z2M9UHVxdnIFZdBzxJl3M+UnxwVI9JoC/NgpJfVgRF7m72lQXU
         CO6hG6WM0KU2v2bSoxJ/KH5aj8AkzvPeDL3p+UWa36O37xgoI3pSf6sHmhYdSgzDQQ/1
         yPyly2FwK6WijTJB6O6lOcO4fW/jWOzdPB8FJu5RgBU3+jHMxIzDvtKFO2nBeK0RgULc
         js/AlfzNDLRE3/K/pE/wCC5jwrfTxUvO55+UuDCg0lyTkSeD3UZvdg/VO3ZbS2eSV9kr
         t9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJC4lX0tZTp50J0S7on2pHdgb/jZHm/OiyTuKIg2KPY=;
        fh=apaq05MJXtzBhAh2zvWTTmwFx31RPl6dn/T8iJl7pv8=;
        b=VmYBsTN4hg0UldL8/hvhjlhK34Ir+uUGNLnjdMaBv6elOfjr15NW9jDezDj+BM3VNW
         AJq5DCGKvRnxc2vN5ZtN3c+tQo1gCOwwGK974BsQCqmsIlfPI9NX/q69JMFWRPzN1PEV
         shsBeo5xAx8NC/M4WVkWvn0k9eNy/shQ1ufWFNB6GK3Q4g3JnH9FLjPZmTL2ua3mAWSJ
         5qZOLt7Nc3XUke9raO+3Jz8H7TSHOl+ebKsL1I7VnnoXx7ygmT/kZ5mevvB9rx9438lp
         ZvAdacqF4vxFZLC9oLfGF05BaVA3ByjhasQzDQxNq/Lfzkg5S5naOnQJN9gMfvGNl6Oa
         Of9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783606892; x=1784211692; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJC4lX0tZTp50J0S7on2pHdgb/jZHm/OiyTuKIg2KPY=;
        b=JpSRd+5s3XUz6fZRlOEvFLICl3fdmvjB9LW0Dybrji8PeMksgdg88D8zyFGSClajAY
         9/QwY8gMJkjdHWIxb7cALcOe/S9pRNw/spsgGLMQCBm1zTw7/cuLhf9AcBXAZ6zD1hzz
         HhU/2oGjXsndRNFgFaAqgXrG+M6CHF+gywCw48o0qerJrNCoqn8Rc9lIGmqWJTXs8htN
         fxux01tTdOUjnFAZUBW2+6iGEKPIm2uUhxzy/WV6Gn6ivX89O4VWpoIBBWKrqgItQnvG
         rHXrfPzZOOT1t+N0NO0wfMBOzcN7aUX6kOA7wYjKWJPkmiZ5oLx6gSQ/GjQBinVVQkAK
         UhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606892; x=1784211692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJC4lX0tZTp50J0S7on2pHdgb/jZHm/OiyTuKIg2KPY=;
        b=Xz+/99ft5AcmN3BLU3PurH8jO9w6tt8pcZxKWg1QK6GL4h/RfqSdHfstn0AY26LDMk
         kLmsqwChN49DHC/JqrGOrsEdZeZo3ohqhF8wEtWF0dWoKZMDLBZ1g+vqpcEns7doU5EF
         G8SRXPcP61EEDxuGBlNdGuh1cH5qEvn+LymbUmgTrnaVm4vQiPTzH/v8X2Tc5Fa1KhB9
         wndPcotDiLIdG/HWIxsm7oWHg4auA7PJB/CNDbW70AhFWrdlR0OCwlY4fkcmDHvF5YM7
         rJHP3WK01M8Q4zkY0LlJjr8mlu3m4O0lXXkq3HlGo8J5M/ae1B50deHa2LhWMVBMonMu
         R+qw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5vlVuE1vA4EvDyQOJxd539Fi63aTNl34MxH3eGOPjrI17cmGS2pAQSlJqC/qebUmGgLgpU5gAqh+RQfThkwC6@lists.infradead.org
X-Gm-Message-State: AOJu0YzWXDdOWFytWWzJlGVUiRCwFfsIvFHdnn6v0acxxUVedXvZOGeB
	Gu8kA2EjSKKBoGWu4SKevDqd1E8j7MJF4SuNNVEuPq/9q9KTlODAfmTWYmXgaVRXssWgctuq7nU
	OMmhMqsKv2q+nmkLLOVOX5OBQLRLyK/VuFC5qbmFFyg==
X-Gm-Gg: AfdE7cklVkvhvffDLVrQLwCcWDnxpwn0AtwP23EDPeh795YHGslX1055/7JGSAwrpD1
	DtwsNftyTHywDCakL6luj50wxQCDP3EDOhbhmDyKonhPHWLk2pIxs3qS+cuKt61BilZjihcNLLa
	UUa6j+qxc2l3RU3kUioW0FvCLZv8t8E/wZ8EBQCYoXNsLQDQIdJDKnzEVFf8+YRnsf5dN4kAun0
	87sfOimeAk3IRbmNheCK5DfmKP5/46KOFK8G75RYQBm9/T91b8mk7N3MLhBIp3SYh+t93z8nDnt
	QX9Ph3qF/lmrOxY+DYrThUDN24HgQzm8+exI0GAxWvAS0VlxBx/kOePdwdBLTDrK/mCd
X-Received: by 2002:a05:6000:25c7:b0:477:3986:9b54 with SMTP id
 ffacd0b85a97d-47df07390e5mr7576513f8f.20.1783606891990; Thu, 09 Jul 2026
 07:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <cbe59dfba231dcd55fa86233dc076b017d67463a.1783524645.git.gregoire.layet@9elements.com>
 <20260709-convivial-classy-mouse-db0b2d@quoll>
In-Reply-To: <20260709-convivial-classy-mouse-db0b2d@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Thu, 9 Jul 2026 16:21:19 +0200
X-Gm-Features: AUfX_mxl9lcJsse3vhAYFsJh4Ndo0WrxC586WRK2sT65vAOI74m33ywGfCLJYeM
Message-ID: <CAFi2wKYXVoBRHOCgA_6F20F2Wm4Z2wVz19+XRE9dH=gP3X+i_A@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: serial: 8250: aspeed: add compatible
 string for ast2600
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_072134_510278_70F70FB7 
X-CRM114-Status: GOOD (  16.52  )
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

Hi Krzysztof,

On Thu, 9 Jul 2026 at 10:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Jul 08, 2026 at 03:35:53PM +0000, Gr=C3=A9goire Layet wrote:
> > The ast2600 was using the ast2500 vuart compatible string.
> > Make it possible to have ast2600-specific properties.
>
> Then add these properties here as well. Adding a new device is one
> commit: its compatible and its properties.

I thought it was necessary to split the two. I will squash the two
dt-bindings commits for the next revision.

> >    aspeed,sirq-polarity-sense:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      description: |
> > -      Phandle to aspeed,ast2500-scu compatible syscon alongside regist=
er
> > -      offset and bit number to identify how the SIRQ polarity should b=
e
> > -      configured. One possible data source is the LPC/eSPI mode bit. O=
nly
> > -      applicable to aspeed,ast2500-vuart.
> > +      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible s=
yscon
>
> This is a deprecated property, so it cannot apply to a new device -
> aspeed,ast2600-vuart. You cannot use deprecated code for new bindings or
> device support.

True, I'll remove it.

Regards,
Gr=C3=A9goire

