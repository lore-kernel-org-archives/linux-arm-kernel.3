Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB94C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PxmmoD8ljBsL9GD+gzuD61HLwRQpZlooMbeZ6fygS8=; b=Y2RkRPrFfo0uZxZkf7MNLMX1fD
	epnxud8qUYXxH9o0H+aTHccXX5gS+eqZ9JF/qU1V59drdPBVLwwJElMQ7/qPZijIDqHVuMVcVq1iI
	jNCHrx73Nj1A2EGc4wR1p9AqET/PxluNwG7x+3GpJ0kBkxM3/uH9uWSPh/8S0dQBKgm0dUjDKH2PC
	aZ86YdPZyzwO4sJkf9AtzqiTxHwtBtxH5RpbRza3r9zXukmslcjS3Rw1T/pD/SEqt/r2uu4g/WXgq
	ft/IZQqUvbrLALA7fJFquKhUsnQms1CqRaQXEpmFClqu+B1voKtzdEgp38BlCYGo5ThQ0dwoPROaB
	vRE0TLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBuB-0000000EbCY-3z3g;
	Fri, 11 Jul 2025 11:27:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaArg-0000000ETHo-1S6s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 10:20:25 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso2090406a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752229223; x=1752834023; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4PxmmoD8ljBsL9GD+gzuD61HLwRQpZlooMbeZ6fygS8=;
        b=gC+J/LldxZdKekrT3NXLwCOQR6ZSKz4wvaKWnCLU5P/HS2mqm/QhQmiM1o14mgeYtw
         C5bVSie8KljFjGPZwSscbRhfy0gch68CiZvjIUAX06w/GuNneAWuPZjfCrygvjZ7VQOv
         AKrMqHWOBRDqPmc/U4wULDtA26+mq/fNILeV69zRJq8ChUKlXg2ygP1TN+e43IGf0HeZ
         wy4B5foQFvYR5exZOFM2QbyalL7iPJrq3bLuQzYD85Hg5f3lAEX88YbLJbTeXeCntufN
         8ubDU0uLK5KvQxTqwtfrxmE7VHcdi1lpaUgOey/mgKsnd7h4/ppXAbPoBdivRZK3oOKU
         7BzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229223; x=1752834023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PxmmoD8ljBsL9GD+gzuD61HLwRQpZlooMbeZ6fygS8=;
        b=pNjNgwu6UV5vUOzO5Ds/QULurZ67SFd0aJcQZNSrFnHwXN/SsZTeezggd4OFukBVnk
         wdPYtuWaym1jBrmcD2nQNg/ghTeRk0LS32VzNzDXJLQjoa4fNhi4oPMQqEs3Ccd2RxGB
         4suEw1arle5kSAiwdIlOWbVg7cfjvyMM2ApMfEN0kj6Aim77nEOJuzJdIam3gozEl5fg
         e20T3mG5cQn+tnNmQR3MAUvpOl1686iUkpa8I2BvO198mGtDK+iUJCjLUdY9EEGJc/PY
         wxQekERksflKOLHg42EX5i2nWzwwjj4Pk/Y0N/V+fyLv01vidp+Iu6JtPgi1FH/LjLU2
         Ay2A==
X-Forwarded-Encrypted: i=1; AJvYcCWqW232Z1FyEnrjEMr0F8qw4dO7htuAh3t6oZPhGvtC4SNP+86yiKRBikT9a78IvqGkE/ZDJFHDi7pwYdSSIVca@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9bTVhbErOGP7ix2ZWcMcMXSeBysIzk6xnznDSNNFFGGsKkF8p
	3/mlq44u/KOm9DnR/a97RQda4Kg/wMgzStGHscVdpXgzK2GK2rhDgDl+Lvkv8llUWkDo29lmwau
	xKUXdat7d4+19FiXtVeo+XQKD+P6WdPQ=
X-Gm-Gg: ASbGncu70ckuHPIZqsQLLTQ7r7PpFWk25ltBaJPz23F+Or/DhsOMGcfwRtwFHm2rji2
	3KrBsgc+CqaDWBmkAB5tMGg6FT1zGdw99/wlE7jInnWvcbMVSyZSXy6COBIWMAJA1nS5wiSOK60
	DAu3/bhK28GkJZvm9tAgTj5DDjUAyc7RiGHT3nAdG5m+CalsgpXNKrwRbh19zBaSek9pHESkiZn
	sQZ
X-Google-Smtp-Source: AGHT+IGcUF2IeFq5d6oOuNzBnemSIDWy3XN/AET4pna7uIiA0s1d9ETHya4xD6sh/N4FeyNQJ2PHRpWfbJp7eAqc7/0=
X-Received: by 2002:a17:90b:280c:b0:315:6f2b:ce5a with SMTP id
 98e67ed59e1d1-31c4f4ca9ccmr3107104a91.11.1752229223013; Fri, 11 Jul 2025
 03:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com> <aG_SosukEqUxrHvH@p14s>
In-Reply-To: <aG_SosukEqUxrHvH@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 11 Jul 2025 13:22:24 +0300
X-Gm-Features: Ac12FXz1oAWR7AzXrdUqZkykZa3V1NEpvtctgewTWRCMsKsQX5xRmXpD9W21dGo
Message-ID: <CAEnQRZB9r8-HqSJAJJc6iebZcen0CrpWL3n5YXPJOZr=-SZrqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, iuliana.prodan@nxp.com, daniel.baluta@nxp.com, 
	andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_032024_397476_78E334C6 
X-CRM114-Status: UNSURE (   8.00  )
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

> This is a much better approach.  During my last review I said that I would not
> move forward with this work until Daniel or Iuliana provide their R-B and yet,
> they have not been added to the recipient list.

Thanks Mathieu, we will have a look at this asap.

We are part of imx@lists.linux.dev so we got the mail.

