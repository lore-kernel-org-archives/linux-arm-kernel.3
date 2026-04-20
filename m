Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595CFEA71B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=; b=tEU4PW0p0XEgmUs40dy7kbeIAm
	Xvs5mxS1Ez0LPMHdiVPKg954uIvYp90rZ6fxc5m4kIfjYdOKbTUEPPvMRbP5TZmZNDhe1AX3ITqHh
	sH2lldWXIsIHr/dqBup9GwqoWXuaRwUl0D+Rk1MPrQ5tEImWFqeu79FX+sGow+2MnEGrofpaN+szB
	5emUFAqNBfFrM/Yn6QYZ+fAP/2HTzdiIzP5TbghJfoNaMAwC4jGe1PwSl6FyVqxS/Dqn9UiyUHwvX
	HtQtEBy8RBGIvEkv0uOUGxG4fmJcC6RwnMT+iMNBeQoV7bZuI9qwv7zrtJk3jDlgcbPOHnNlbfJtQ
	QYiI4fYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeEp-00000006JhR-1a6o;
	Mon, 20 Apr 2026 02:19:51 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeEm-00000006Jh1-18vP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 02:19:49 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-64eaf8aa893so1892370d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 19:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776651587; cv=none;
        d=google.com; s=arc-20240605;
        b=FpMwrnDZA0C23G0GVe0zZBewAN1tPd/+p4BIO7osnkR9tdIANiy5AwEJUHirh6s+ur
         M6cXJQNmrMLWfMMfQSPwlnBsZQKBQlg1o3MNkqa40VG88TOP17ex5TWzrWNX590k5jXQ
         rrnL7zXeoErgKAhBVYHNjtFta4PP3sri25EiUbLuqIUUYlVTBg1qqetYns/YSX74nTLw
         xFBXR7gyRS1+hH/72zv54INjBybei3vMbbsQV7YP0IMVGrvabnqWbDD8QCVoVI/8RotP
         Tez9pIL2x9foh3nHDxSR1xSCdg7soPJyGPNaLuek2/EQSNPBwUUv++UMjiP4myITBdt1
         A0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=;
        fh=Dp3226146d8GD5uQpaUoGasa+0ZUUsSh99/REDNY5oE=;
        b=LxE+9H0ZoVmpVCqsiQYub/IGiuz+cRbzharBqfbTZidd18aFzbMX/KK0OYkWrRDpkD
         kIFztXmQmFG9XXZru4Ulk2WZkY8KmkQ9xiGkcXs69Q5XdudXXscw5sOB12/2PM7930E2
         dZqtXS609eu1k9fDzhbBRFSdUbOEQGAw4MTnfkwbX6pXjV125uazSahIJcj09Hnd7IOu
         dpOss84m9GBJ2PDhYtlfPCWGdd8y360U57s38R/wLc//IGG9ZuJpUSa6GTDyndH2H1G1
         OE+mxnge1fji7+WDwW89TGFGkOltkufH7CjqxKOeDFhWvUK9aRK0xkQmCEp7R+G8BXHQ
         /ZJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776651587; x=1777256387; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=;
        b=sE3+2NhmsnlGdKbj4j9xEGTWV2Tu2WsoWfZdErrxaOsRtQQu5l+9O8BFQOcwPAa34g
         4f1VBuck4L5EfXW74V/lGPaemGQqPrAFoeyfOSYhzYySe6qqLXgpPUrs8kBkOMTAlEND
         TiQwuRX72Dzx13iO1GEPlhSR+f7m2y4wEZKJKRh3ZtrlA1RHhQl7Uu9ufFP4R5oMCoTJ
         zky5dikYyu5zUfQRbdt7hRzm6u0boxlVMdZwotiGtScSmdmvbZPZZi44RYRCeFqyil6+
         6cy1EM2GhEc0vQ7KlPPH9n2QtzxhINuXwBWlE5wjnHeyonWeZZEh7+IXb5L9Aby2cU5A
         PxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651587; x=1777256387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn2XEI38VK14s4TDNjxRsEErkOLyfZwZt+XdGzTxUC8=;
        b=OSQ5RMp0oBN1SRH/aTMShbZ+kCN8Mnwaoo3nm5vb+TmTOTE5SNIg4FUYr7nEyLNtgv
         nt6gCKQDOE7VNkQoF7cm26+QQBC3euZiBDOs3xOGwX7Lbw3j9ylKctqLtw6y3oGuKiMa
         IdsO2I2K3W0Ae0oZNGjuhqedXgtS3Jp8Kk4tJRlfrDYAxgEoq0wEAncEss1UQ9c007yb
         UnawT99cce8vHXuBeCFeVWFcSOfBxceGbJgeijmRxMqxwLtR+DexNjLV2pdwdv9CXZbL
         fNsUwp0NqJ6GYrmxv+gwBi9yWkhT9Qie7w+R8be7xgKCcf7T+WIKLSS0re29orVSaAkY
         8FNA==
X-Forwarded-Encrypted: i=1; AFNElJ9ALbmhSvvUuLCYqnSSySeXb+VNVEdxWj3KKDZP0cyuaNQpTccsINDi9s2l2hXD0v3XkxXp1cbndfidQ8rOiwLi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6uBXNnn/S+1GzF8hDom0zR0m+pjvbj5rkgL19RioC2SZUXSdM
	fGGmr/UgWH8AjMWSuibfsT2IEXaCmqW9kjp+2rPzPOtjl4+1MmKTemQu61KMwdyl/eDr3Bj747D
	Hf8XTnAHEw5fbwlbyNE21hhWivn8b4ws=
X-Gm-Gg: AeBDiet3dd0ajRbJHtSzIlHlS+leRd3lg+FRtTV/Pa19IFAZAa/9NQ4tYdD8iWisQrS
	lKOtNd5rl0b+dlUYFUO/pwJGbKJCmHOz0zksmJFHiRzvkSSfvH6KZNuMWoveeU1DiwRKQ3nHXpA
	fw8dc4vZrqvMbMHCDm1ptq3+B46y1kFIHF9qFsrj8bcUloerLJiVbw5pujdvqgVO0nqROga2p+Z
	2I73DgUipdPiyvRSdkKeDWl8CAPQpuljq4X1rhwrMCqIqmFadnOWBIKjfQ/zuuEsHGJCILY9/K6
	L3b0RcB1E9FNOtXD77Zy
X-Received: by 2002:a05:690e:484d:b0:649:ef06:161d with SMTP id
 956f58d0204a3-653107f8e3bmr7151345d50.12.1776651586801; Sun, 19 Apr 2026
 19:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260419122134.97529-1-lgs201920130244@gmail.com> <aeWHyhp43ZbgXwFe@lizhi-Precision-Tower-5810>
In-Reply-To: <aeWHyhp43ZbgXwFe@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 20 Apr 2026 10:19:35 +0800
X-Gm-Features: AQROBzCNElVyi3SqTu0MlhOiyhEx1DKejewgDVxgHgM7RX0rIbL7rJ3aJmlWlyE
Message-ID: <CANUHTR8FaXLX+Nbeb7+sWRF9jQ5SoBgWc2y_LVD38KE7TqsxeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx8qxp-pxl2dpi: avoid of_node_put() on ERR_PTR()
To: Frank Li <Frank.li@nxp.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_191948_558945_99C76FC5 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Frank,

Thanks for the review.

On Mon, 20 Apr 2026 at 09:56, Frank Li <Frank.li@nxp.com> wrote:
>
>
> Please fix
> DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
>
> If (!IS_ERR(_T))
>

You're right, fixing DEFINE_FREE(device_node, ...) is the proper way
to handle this:
if (_T && !IS_ERR(_T)) of_node_put(_T)

This is a better fix than handling it only in this driver.

I'll rework the patch based on your suggestion and send v2 later.

Thanks,
Guangshuo

