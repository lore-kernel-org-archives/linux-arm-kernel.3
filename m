Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCEBCA6CBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0IYKPvLat3QfnpDZR/OU3ZqUxwUEKvk7ycHfQxUWZc=; b=Quf/c/9fT0+othBXBEvzNhaYic
	gQySZjp98VSOGF/EcysO405BkA6Qvy76mvbapFfOss01prnjG/+lyJCOJh6Dvj36kOwFrd9COL1OI
	T+tJ084+V64K+zH7sS7Xyyft9aSdvjqjyGfzcaFrzjF/hyDXIltXRU4lhw/Pbe+ITPCo1yuwUKYs9
	E1lLuTtVlPydMIJmuq71ACIE7ZKvMeJy7PeSES2i2Cv/N2xZ7mdyyqbLCqHlFMQgSHWGGzeadqT99
	Xwwml+O8tG+0XqMK6j9eYhJRVnxqhTTtKq63sKZMtEv7ZE7/O/1FCwzyITLjtBdcjfMah4NoUzlQm
	J5r0JpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfFW-0000000DvJo-24m9;
	Tue, 27 Jan 2026 09:20:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfFU-0000000DvJF-3ZTH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EED74601D0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0104C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505635;
	bh=p0IYKPvLat3QfnpDZR/OU3ZqUxwUEKvk7ycHfQxUWZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vbv6PsAcMvUdBF01LOt0+TN5btOmRSbzCatgsMvnx4lfsrDRysDt16czedra04lJH
	 pDKAJ5n3pDEMgnCRArvyJCKrQ4jDXf5Rr3gqSKtbT3fmD+lHRtV2wj2X91POQj4Kb2
	 PSaKME6xYEp7yahOmFSxcwd5RfmHoR2PP9yjAzRrJ9I7A7AJHPrMqrJ+q4BDp1tjNt
	 kcwvt7SSEQo9t5zVKTmvvKArxUTvH4rOt+P/0iuGK6ao3+QWWeuI0TpgqyL0x/bwJu
	 6rhdMtxd/qrxtgv9AiHYW3hH+u25GNWozBWvp/sZ77G543QL1MAzMnSWZ3bbowoKVI
	 pTq55Djhp2y6A==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6495d592c10so4323956d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrC9MyuGc7eptYmGOt8yFLazTbZtWMI9S+OUanHRigRCbTPM5TcCQTaxPT4m2oSUrIZpP9jSVagRvlBDQQmtmu@lists.infradead.org
X-Gm-Message-State: AOJu0YwxWPhhl0E0aahhKcKcvR6djmqT7aSLeC1dsmbfbpFaLpFddUT4
	hKeL+wxcKZvXaw/6xUDhL4b/y4DEWaKT9HCK8qvDvUF2XeMkoxn5NZyf8FZhG1A6crkvFa0voRJ
	LKntJcsz4i2IRIotjZFi6cOygLDwGd1s=
X-Received: by 2002:a05:690e:408c:b0:649:58f1:6cdc with SMTP id
 956f58d0204a3-6498fc54ed4mr526512d50.66.1769505634986; Tue, 27 Jan 2026
 01:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com> <20260121-debug_bus-v3-2-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-2-4d32451180d0@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:20:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=kUV4ApYB4xYRKK_qH4Z-i2PUuis+1pd+w+nbtWC-FvQ@mail.gmail.com>
X-Gm-Features: AZwV_QiHuD4uxcaT0lvjfGOgtaMK3IHUr5k1uRq3DPN_dABfrTBvSM80ZXPyZJI
Message-ID: <CAD++jL=kUV4ApYB4xYRKK_qH4Z-i2PUuis+1pd+w+nbtWC-FvQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jan 21, 2026 at 1:35=E2=80=AFPM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> HDP being functional depends on the debug configuration on the platform
> that can be checked using the access-controllers property, document it.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

