Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B717FB44C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk1T+PSL3x0C6Ql8JXH7OAg5fX1+xkCgMMxrcd+iiNM=; b=GcPh4yT9tA3gfNn5Q6kOqmO/BL
	+9ZeE1aGTFhZOs4FohIwqF/fYVLJJdZDpgBfWuYc+3hddwkhuveU/ec6GP6J1G7uC8BD7pPSqlHqc
	AVuY9vcffhiV5cWxC6fxB3vAfylHQmmkGxcTvOqS4tZfSyt6jGzKi6QezK4v+PBdN/r8Pk7kms8o8
	HBNnGDGTnz2ayBtvXebB/2FKRhUTSoizLDZBMzRJpUFJiWCR8zFG6ZrSZwyE4fNxagfVSlTnrlUEW
	lvnK1ph3iL7PXdGRuJvrK6ThewaczidmOcWqVXnPiaY9DpfkZmZ16VDJQ6mmpUwGXks7AEz1LR9uI
	PlwBLd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAP9-0000000CjYX-2okp;
	Fri, 24 Apr 2026 06:52:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAP4-0000000CjVf-1mvn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 141FD40D95
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA721C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013562;
	bh=eYGqWREJ9t2uBPSuLp01WOMw7hclrmXIq4dVcWaYOUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ox2jYeQe204mOrVQqOkS6Gqg7JaPOs8Xz9IQCJi1rJHLglWwNspwmopIL/meVELNJ
	 G0Q48hfs2IF5w0S17Rurz5Wy6BOKxEyOuZwZAyYjrKLR+subXP79DxnbDzKWyqPanS
	 M0QFWy7TQY+7NFlzbNU0Rx4vm18H65ouMXONukKvV7/LwH6bJJitsnId1eu+EzDF5b
	 EP8imWJIB8HLSB3E4jM0FQzEK6x/57njzoPSCZUJvIh8Vmm03eTTtRlbbWbMRzxzrs
	 39srXo2nn4jubzwTlemNZY2grX56A5J/6bDwhgHleIaninVnDXagjHT76fpgVWzOIx
	 TZnyS+R+GAN6A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38df1889fb9so72409001fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:52:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ojOlbyNRdMWO47tTI2fNBd/V3rmf1qHzu+V1VBhguYig9PKftVfN44ri546OA5DU7bZqRkUN6Nm80xVqp1vyS@lists.infradead.org
X-Gm-Message-State: AOJu0YyW9Jif60AWe83K9DD/0GIA6v9FM1Gmzs6SU+psuKMgbuqzgP8n
	0IO2ziGqzmzt0jwaCk406HvX3eY44uf3MEBlOX2UUPb1LyCrDOjwtt2c0YrCMy/JCaldvVcbpt3
	Ip+5svc0Shb+RV8ISVSEpD0W7Gs7JVso=
X-Received: by 2002:a05:6512:39c7:b0:5a2:a703:969 with SMTP id
 2adb3069b0e04-5a4172f61e8mr11627099e87.40.1777013560689; Thu, 23 Apr 2026
 23:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-2-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-2-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:52:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=khLykkE=VRbA-heYnstB3-qKbVQQZuwKWwLoN8h7UDg@mail.gmail.com>
X-Gm-Features: AQROBzAVcbkI_sms908bxwemfiJGkmoXEu80hkmvEUQdT6yrUO-GqXxxnDOIaCs
Message-ID: <CAD++jL=khLykkE=VRbA-heYnstB3-qKbVQQZuwKWwLoN8h7UDg@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: defconfig: Drop unused legacy netfilter options
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_235242_484466_35CDDCFF 
X-CRM114-Status: UNSURE (   8.68  )
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

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Drop all options which are ineffective now, because they depend on
> disabled IP_NF_IPTABLES_LEGACY or IP6_NF_IPTABLES_LEGACY.  No impact on
> include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

