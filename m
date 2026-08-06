Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86278C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 22:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7N4xLlBIWxo81ItawG5CepKXwZzHPZ98raJQApwEes=; b=CFmWaGqrx/mJPIXMcyAy/53Vmt
	bC4zrGWMLSf1B7ixNrh4km0C6kkJWMQdzthfUcyLTB1iCqdxvM3f7hZD2xHs4/q/o4VJLka4k2Spu
	MXMob6p7JV+u9Fv/OeQqgGNKqqSQj/X0WgcLkxX2EBGVFHhjyfnGvM4Ts/nzYjmprOOGHrTQ8p+a+
	bdz/8N4R5n4KZS76Ak/7USdPldUNbVEpD1yQfmcAfKIP9YTdQqqkUyeDoLNPhFF8O+1MgEcmQkhR+
	WOpTR3yXrgC4zM54UvvxUGZVOUG6GWNYtN2a2IvSwp9i8cSejESQ9+E06J5JMUVlMSRhQixC0NjFq
	qV5V5hOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6G2-00000006md1-2bXz;
	Thu, 06 Aug 2026 22:08:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6G1-00000006mcv-0oyc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 22:08:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F64743803
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 22:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843081F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054088;
	bh=Q7N4xLlBIWxo81ItawG5CepKXwZzHPZ98raJQApwEes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KcKv+8odgHShJ6+IAS80kIFlyDUrtN9j0njxElbmeCbO9xzZ6eaElKjXhoMz/fu9p
	 pF1eHN4DVmoTeJ+ypwjPIrQqJvrPWvcKTz9E3tyZINV6GqNslh0DhqEPKdXsHDHYgR
	 uPrWi845D2nnNFIyfy1LLVXOJb24HMRNEvI1Qt9oxugEF62wz6kQBRECcTJ9+Nd+gu
	 RucfsEV+usXt/FPndR6yHDheq0/G4l8HSY7rGYnl+WNp4LekBncPVsI/9e4d9EgOnd
	 UtNibRIPgm/wwoF5n9Pwu8MImaVLBMHztrFAZF8PfDLEwkTkmW0p7t1gTzHtjn5i5D
	 tkKuMuTjyPhUA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2a8e4c77eso2656614e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 15:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoSbCBO2v7TFrbUc8CP3wjqaA8q8yCuXov8N08EDFRf8qBh5ofFLWCkhq9BRIedh9OgFpB4FWZrXptCy4PridX0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6LvRZQ7SPQHtuZ+9h9PLgNpwdT5cVvHz8uVNFsrdJOzQsPiSD
	YkWGkJyjU85tk0j8B4TazkB8Xq+MdQs2+JQkvbUeepHwH9xfReBMmGma531jxbcWK5YunSq+pJG
	xuw90RhNu9AGNfncI/z786RVE4xvrNTc=
X-Received: by 2002:a05:6512:3e1f:b0:5ae:c5f0:ef1a with SMTP id
 2adb3069b0e04-5b2f4cdc18dmr2664985e87.50.1786054087347; Thu, 06 Aug 2026
 15:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 00:07:55 +0200
X-Gmail-Original-Message-ID: <CAD++jL=i5LW-EcbWYqAN65KEKZQsCi6NgcKwiLGm04trfXL9zw@mail.gmail.com>
X-Gm-Features: AUfX_mw8VVtdH_lZi-qOKtX4NutJWCkxj4cbQuE8TCFpBmYysjfroCHFXaMc5U4
Message-ID: <CAD++jL=i5LW-EcbWYqAN65KEKZQsCi6NgcKwiLGm04trfXL9zw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process: maintainer-soc: Mention
 expectation about dt-check-style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Mon, Aug 3, 2026 at 11:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Any new DTS code should pass dt-check-style 'relaxed' mode without
> warnings and should have addressed most of applicable 'strict' mode
> ones.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Makes sense!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

