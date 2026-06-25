Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885A4CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=; b=RgKVO45E9Cj2/PUM+iLwQgnX9a
	QdZWNSFUOP0Q6qz15mDEp7aPP4iKyrOQzU5pgiLtO3Qe1oPMoJV4gWxhEQrjKnHyzflgC2LVFJjm7
	b0DtCFxzGgc6mTNhfTgovfNJqlsbRgBsGWeJl2gWSFJvvEB7rXCZpYGjof/e1NE6L3J83UhFw9FyU
	kBtqVTPkpMCr7Vcg6oaEGwMG3fufuP5nr03F6PMLSuZ+DW4+15Lqdy1AqfR7PbSczuiE60fdvVOt+
	yHK8USzevYko3tMJkmyfm1HqFybqCP5S8ITqO/8ImBdU6PGXFNnSIBvIBNrXIH22tVcBtS/jxNeBn
	aQqsj+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnEz-00000009VFx-1z87;
	Thu, 25 Jun 2026 16:47:49 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnEw-00000009VEs-2722
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:47:48 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so2685196a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 09:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782406064; cv=none;
        d=google.com; s=arc-20260327;
        b=Fza2OW7KGij7xUVPRaWkfQTUhnZgMCmv8sOUzkMqC7hLndpes3M3B0dUZWJ2uj7dIr
         /IICBxUpsd21V2ZQpVmmXuISnlfQOvP1Ce7ilwexwEyrNfFagdm9Cd1shyE0ue0VDisb
         IqwoC5uEiRE2jcR/ko+fRhiQecFVJpQCFuM3atqZ1zejIIx7lwZnMbde27w6FP7lFPdb
         0uG7nLdAAr4NFMM2JGL8QGA3gL2nsWsRZpwpZzIDg7Fx1LB3CO53bZ1qLn2pI8HaCiiO
         4G/lWliJWqpytPgv1A9UQPG9ukaWFusomWR63x1Ng+4muGZ33dnvnIwrRuA5fwaPb8Fa
         6N4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        fh=lHuIzwVpc0DjmL1gRW/V+IgohOX61QxsLtoWwH18n7s=;
        b=qaa1+YAKgSwctkn//ao8KDbKx50OU+pu+8HUFL0Z0Xcz3QVkj8WFGdNrIB/JnUcjMz
         JMz25yXyIj8bj1jsuwOV7xMS61z7wDsskFKuDHc/tGSFEbkk/5+kVS24suTS5RwVMFAn
         DZ2gpOfM10pAMkXwF55PUASSyD9/HVXuhQEUsCXJrtyfJWTlc9ZetZHRZYPlTXNctLuK
         x6Q/HbJtxSL2EI/ZfBFvGe5gfZnF8K0P/KOWQN+y+dI0RwnunSg+wqihM/dyFj0Bd+dS
         Jg8oW8DqsHV7to8XofAikmzv3dedpBn9YhFefi6FLpsZilNnFk4/BAVmFdsEziSmSTnl
         jTuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782406064; x=1783010864; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=J+vT7gTLO1Z8y0wZODRykutxtX3mpOaCaByjhN5311b+p9zQIJTNVGcM6/DqsG8DRv
         6OAa9iCFQDGHT9uCeqzd0O5VYT4UVHszkSdZbgTYElOSzX2J6fuzkXEp9NWXCbQNCRxq
         5FQBE+wXq5YXJuGe3taeTUIImWWGEf1SesF5YE+pX3PCTiEugV9ebciNGNqs67JZcgyM
         6lByBEUioN988YHDxJWgfKHJHoRaDD0zzhv3si1gsVDi+X83QLf7yakUAk/rlLY4dA0r
         /s9M+lsb4T7sOJvy4tXuPJ40mL7XoLFwQjCPnSiQwGXrATd88TGEygd1OeCclSHgrlFp
         3usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782406064; x=1783010864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=rPVlVULn9anaVarj/jaoZvyMjTAh/C4HykUCUJu/QiLXpYmthPp3WS5hdP/iAtmS6t
         ELnyK6YvQU6vS4Aq3cAKQzS/I8/4CimuoDMS5nblArhjWC7zWqr2AAJfBom8y/75Ky/V
         qFs3AX/56CjMfF3iJMihaRR3cG7F8XPzxdyocpnLISsBw6jQ7eYC/OkHsFaAljmpTvcM
         m9nQWASarCu0mRqRUQ+how1GSlOvfoD7vEWSATLpFyKazoyOLkGGffo09SrGqoOCuT0+
         jWe7v7F7Mj5eei8ruvCj7bihS23iXw6bBYDF26hgq/xymbrXVyNPP9/1Ph0bHkx6FlON
         whcA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1PHEUGBZGXcWE8OrJr6wdbeAQDaCjA7QxgKH6i9vCYEa26ginEo+5l21WDnbPPKQohpfucd3lahur+hDTvV4r@lists.infradead.org
X-Gm-Message-State: AOJu0YxNL+JhU/XkIth6qCNUbD6GXD/yttNw4abG0Bs+UtfrlHOdmIiQ
	jGY30p3+7XWAzReinfgqoM17AokhRcMhEwc5oEMkwWwZ/y30dPr8OhzODQVyqp3lQt+ryqtxx7K
	74/iqnxUeQ6ms0Dfqr+YjcOdHJ1uT2Y0=
X-Gm-Gg: AfdE7clyLlgmqjFiB3l6Y5sq2YIdW810CZ/tET9QzuNVwjfL6TNtn0ZwoZPNr9MV0l5
	pQFFkch3kCyBvBAevKPNLLaIKXveeM07J70jFP2eeVZhulgLk48VGhzA95gxI/XipdLoagBA584
	K+EfmMLhWeMkhm/RsQqG+fNlHotDkJzT0eLVtp7h+tX1wPulf4EahiOWMvwqhERZmjQP+VRJDL/
	anVcOmm9t1W8z8HXIzaImitxXPk//j13QTeNs8uU13cwLQHZFr+5Aa3f7zfN2OPXdvRoBVs3UpV
	dZQqjBwHYZVgzftBbj/JF7fTSLaN
X-Received: by 2002:a05:6402:42c2:b0:697:b72e:b909 with SMTP id
 4fb4d7f45d1cf-69810af080fmr119797a12.28.1782406064192; Thu, 25 Jun 2026
 09:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
In-Reply-To: <20260625-cameo-siamese-cd78c349519c@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 25 Jun 2026 18:47:32 +0200
X-Gm-Features: AVVi8CdQlZ_mmiW-bTGe4tmL6GeOR-G22Cpv-MM6leLml97_0sYg9x0t3Mjq9gg
Message-ID: <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_094746_582264_A6CB9C4A 
X-CRM114-Status: GOOD (  18.46  )
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

Hi,

> I've not done a very through analysis, but this seems like a massive ABI
> break.
> The change you're trying to make here will mean that new kernels will
> not work with older devicetrees AFAICT.

Correct, that's the reason I sent it as an RFC (I mentioned this in
the cover letter). I am new to kernel work and I'm not sure how to
deal with this change. On one hand I am almost certain now that the
upstream driver has never been used in actual devices, since the older
code was only partially merged and also, as Sashiko correctly pointed
out in [1], it had serious errors when matched against the data sheet:

Sashiko:
> Does this configuration cause a regression in pin multiplexing across the SoC?
> The legacy driver used a 4-bit shift per pin to pack 5 pins per 32-bit
> register. By passing 3 as the width here, the framework calculates mode
> offsets using 3 bits per pin. This causes pinmux writes to align with
> the wrong bits and can overwrite the configurations of adjacent pins.

Data sheet here clearly shows 3 bits per pin are used to choose the
pin function.

On the other hand I know that breaking the ABI is a big no. But what
would be an appropriate solution? Maybe duplicating the driver with a
different name, something like mediatek,mt8167-pinctrl-v2? Is there
another driver I could have a look at to learn how to approach this
problem?
Sashiko also pointed out some other minor issues with the register
maps I already fixed locally after confirming with the data sheet, but
did not provide clues about how to solve the ABI breakage.

[1] https://sashiko.dev/#/message/20260625111629.6CD701F000E9%40smtp.kernel.org

Thank you for your time!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

