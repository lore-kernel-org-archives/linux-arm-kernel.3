Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E6CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqXCaEo59uIn5ijX1yUW5xl1dOQgp5ea3+Zv51OCmTw=; b=2i2TJuswwIcX6NqfRIE5qDXXZI
	j3s2wieoEmEaXUd0y17EsOo5Y/AvhasyVaLxl6KS4zrmSqND3HjJkEsch5188ej8DRnuqzaxlqV64
	3Gu0Wjc0jO554I24yVkOgKUrRNlb1ccoQFr62kKOcn1IWbqpuKHQa1Zmr04QZjE20VRuTkG/8IwBr
	APUR29KY2iF6FkebenTnj1YQQrD8jI+FygFAjnSeEFvqVgU5/AsFxrA4UTfIqYDpQZLgMUgwWP3fF
	eGEWzwW+rbb+Vo8TF+hc4CGS1X0VIymrhnkhsPrguRLHUmFdsvs402R4JlkK8qD9eM5kzZ3O8+0bC
	wixuTJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbKt-00000003sGN-3UFO;
	Mon, 08 Jun 2026 14:52:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbKs-00000003sF6-0t9a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:52:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D09D601E1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135781F008A3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930337;
	bh=TqXCaEo59uIn5ijX1yUW5xl1dOQgp5ea3+Zv51OCmTw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=U+RfxYOrfdQ/iC1lD+u6TrXrF1KIJKVDDCgufYmSpchg/Xbm/2KI5sIgjQKtkX3/7
	 godY6g3aNzQwvEPMtLdeoGfjPyxjQV8IWHShbMfI6OlHuMf4itY7mUYvY0OMCTn8qr
	 czHSvhCh5Lv1LSZEXPTVxJncyv5GLSUx4fOA4hZWMPpkuEyYSy6/SohZ1ep26DI9EI
	 sKoVCALsseAR3URTquTyRgbOQwG1PutrLLjkkHtOuQwTY9rbzGYJRRvEvO4GU3A0Hp
	 WqEgXXBrjS+eCb3wmdWZ/lNTRKhzXqpSQajFqESdrvb4AwU7BTEtgYZSenauieOfvT
	 B9J2bIBxVzjDw==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137dd523634so6875034c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+p/7QfnY0K94ca81Gv/EUMt1l+tPnmInbl91v3jM/dzzCpzQ1iWlUDBtE0wLQN7uFvTBTWaxP9wqTPuJ7E5V1B@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxs4Fs9U5iqpK/gj1pABca9FAiAWa/bVKULp7QKZQjJU0wkqyv
	MBwLCN7Bfg3223e2khdJ+8gyjhr62rBBTMhLTk0dYYo3UhnJrEMuRpSbhJEgHHNEqYVt3wq9gFB
	GloiaS8/NcKqSpXecXSFtwoT4mZ/FyOjSiQi4j4AZaQ==
X-Received: by 2002:a05:7022:11d:b0:132:ac76:9772 with SMTP id
 a92af1059eb24-1380674e7fbmr7203025c88.34.1780930336508; Mon, 08 Jun 2026
 07:52:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:52:13 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:52:13 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-6-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-6-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:52:13 -0500
X-Gmail-Original-Message-ID: <CAMRc=MehnHnZjZiLteDxasPerTDbGcgvOgU=oSWxa8fSg94Vjg@mail.gmail.com>
X-Gm-Features: AVVi8Cd2PFRHTvwyoKh81QHB3RlN0SPjV5DzgwH177wdtNIlGj2ZE-mZGT2B4kY
Message-ID: <CAMRc=MehnHnZjZiLteDxasPerTDbGcgvOgU=oSWxa8fSg94Vjg@mail.gmail.com>
Subject: Re: [PATCH 05/18] pinctrl: airoha: an7581: fix incorrect led mapping
 in phy4_led1 pin function
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:41 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> phy4_led1 pin function maps led incorrectly. It uses the same map as
> phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).
>
> Fixes: 579839c9548c ("pinctrl: airoha: convert PHY LED GPIO to macro")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

