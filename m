Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2BD6ACC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=; b=LG4pK5hmPZ8oP2DZ307Ef4ODsI
	xXLrwr9VP2TZBIQ9yqXB2ZCXa315Ee+EBWgqJyHJfs3mai4dursa/zcfQM0aRfrUfAZk/PCnsofZv
	Zhqqg/ZzoTubBwKcCXQHydQdcyChGgEMMUw26XiINLXMBy+cEn6XM5g3hoidND0Kha/6L72UV9GIz
	/2d60ymNeMphUqHvul5XYmTJlaR/+FJXtZJib5qc5OkCDlcxIHmnMS8RC39xxgRQgJUwGbRZUTkmi
	Rn/Xs59FPhlOR9FUr+SNnYWi560ts/GIrWW8u5RieUiw8XZWGXzx8PfOTRbwywJXr68RvV/Vgv/u6
	R0rdOuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGD4-0000000D154-09ps;
	Wed, 27 Nov 2024 11:27:54 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG8v-0000000D0B2-0Ztm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:23:38 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e388503c0d7so5454896276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732706616; x=1733311416; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
        b=Umks06+Z1SAfRhClvHRjxsfZ5QpaOlRyhockmtvcIBgPLpeVBGctIB8vEK7DYaK0GM
         KvL6QX/tLf1S9CiL18mXw1v8HZqHxuUS+6goYph7clofMzqxi0+L1eI92L5EK54itvcs
         byMoqQnuwtfI3tqPH7Al98sFCTBtPNMFcBHz78/R8lR5qiUiXiPgMySO6GJPbKhPUAli
         vUVFrUqn7r1HLRnQ1VzTmBR/CEgB/xePjFrMjEd26n6lgPvFsACm7lGNE3HBprsGkXmc
         Yd3DCpsQZ2IDBZ80hOXtxgMKoDL5izUxzKN3L2v7kjFao6peqrPA3+0g4Hrx+entxQ+p
         tvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706616; x=1733311416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
        b=ttyhC+OtqCz4B5G/HZhPlldqGXN3+KygCiwirp0iQvomX4qWYrsLAGJAjRPvSIRHia
         HDry9/i8k3lXAUy0D5quYsLTgw66TAAf2p9DuK5DwQKgBmIRulx+Erc0Lh+bnqqPrjx0
         jHE5HYe+im4u1Rk6ZFDsK7Zr5mxoeGtMdaF8RIrdpR0DFFEsWuIGNMg96Yme/2oRFe6C
         7DiYoJThKJtLepwNuChcW1rYoXLy7z59P+9E99TcTwwAYgqGRq51p8eh7gd27UuiUolj
         nYI++11RlhM+/zP9mkuzluUaQ0IkcmKF/eAnWiRvCFHHl2fmor8BFh95Rk1Jso601XrD
         IpLA==
X-Forwarded-Encrypted: i=1; AJvYcCXqfmKVHTqd7p+UDByAz04b0pzdJam3ZBdZrQRa1saGNewd+HGUk6rziPqbwie6SARExTng/YjoarPLZqGV+pn2@lists.infradead.org
X-Gm-Message-State: AOJu0YzIwaON58DqN4elpB2OUDC30ddTvt4MLFtZ3ygLi8OJZPV7ZBz3
	T+/maPDsIMkJh5Vv63X2r7L9g+xw2z3RSU0cG0FTiFTPl7ocU4mLI46CqkXe3mT3ilpAwlqOXLB
	abgeOkCnw4d8FhJBzviFuE7fSMpw=
X-Gm-Gg: ASbGnctExgbEwxB71qaCpYeIxcXbw8O7pcyz7N6fb3am5KYQKUDwpznhbhxW8SjLLXu
	dZeX32Jc3/qMix/JApAI+Ws5wzNh+8qD1
X-Google-Smtp-Source: AGHT+IEhGTSK2YNdXdDE1bxdAMUSkkOXknhoF5JR5lXJjT5V65SSPE0rinZmMub8wlV/7v+m+94VpiBh5uSV13rfdCg=
X-Received: by 2002:a05:6902:f83:b0:e38:b87f:52a7 with SMTP id
 3f1490d57ef6-e395b8b96f1mr2630271276.14.1732706615983; Wed, 27 Nov 2024
 03:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
 <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic> <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
In-Reply-To: <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 12:23:25 +0100
Message-ID: <CAMT+MTTqNZuaeROufzA4p6VS0QUt8pJ+3rA3t7_BX1nW0ewB3A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_032337_172108_4117F199 
X-CRM114-Status: GOOD (  11.35  )
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

On Wed, 27 Nov 2024 at 11:49, Sasha Finkelstein <fnkl.kernel@gmail.com> wrote:

> > Why is this needed? I think it is not part of common touchscreen schema.
> > Drop, devices do not need labels - node name and unit address identify
> > it. If this is needed for something else, then come with generic
> > property matching all touchscreens.
>
> I want some sort of a property to contain a human readable (ish)
> name of this device.

Actually, nvm, i think i understand it now, you want the labels stored
in the driver and set based on device compatible, right?

