Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1QY57v2o170i5Uh1BA42HSzcmZFQxfvkMqvmdq9s28=; b=zMfp6G3mHySvYGLqwVbDx4e4ki
	dYudYsmvM4QlPq6RgzA88uhvdl8QoEZRD4xlauX5Mz2Sm9hczVJO6mQ5OY67vryQiRjw1J5dSPBDV
	Pm7EVuU0S4aoUU/TUBOu2KfMdy0irm9Hc1HZjv+FqxVMQsSkx4f8OUiYIA1R657vLMm6B5plRzzzY
	TeTDMifL6ABduQDpLHzWnI+xu74lO3fjQj6+uhjQkOJuBcsiuP+WHmVSHUx/UDM/9MT89XL3q+wZy
	YlFV2qp+ZQnv1ook2p2U+0z4jJ0OcO6l/D2RfKcwDsR60Dko0h1eqmdBsxTKO0TdrBXP7b0AT86+I
	5gpyW56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSIH-0000000G2Fg-27QU;
	Tue, 30 Jun 2026 06:50:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSIF-0000000G2EV-0NJx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:50:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so12449105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802202; x=1783407002; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1QY57v2o170i5Uh1BA42HSzcmZFQxfvkMqvmdq9s28=;
        b=oQz/p1kvtkTPlJ370OzJiX/eH+6JBVwh+M/lp75Sw8BLJ58vpnppX86Fxjbxk9r5ON
         SlwQhASvPm6XHj61D6EjBIu+05kxcxd77J5Tazzk5wpnhJjgD0ggRixU/L2PBERkPkBn
         s+hNbHNaIbDEi18bO/80ti4U44Eug3g2nKucCp4vvZMczJiDhT6LR5sshFYsceDGwoIB
         MDd57AtYXJ8NuK5/QWxxWMK3XZGWzgAvoSjrPGVcFJcojJmXr/djOpLYvlmwl3NMyBSM
         fJlMRK/hrq+wXqbcr/kzYHf+IJ3qoLQQsJ4x8j556fauQ6niqwVwaPG5Gv51t3OK19JK
         kDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802202; x=1783407002;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1QY57v2o170i5Uh1BA42HSzcmZFQxfvkMqvmdq9s28=;
        b=bHVi5brZp22CRWTMMct32thh3HUGpa7uTSni92lPIM0HiQNz3U/1tnUj/cZ+ynXJhX
         ZiawDsAQt1eogvO1H6jdvuctRnsKC378DSztTkou0AHOAIK5/CC5H8ZK/nJVNFgvQFXJ
         jTlxmoxunGvEKAvP/VJDe0qs/a3SUwQIxhyYfs3OoN3S2t+ZkfORXGA/qay3Vw1HUT6W
         BovOHpRX3f/PEfO4O76k9Wfp35FnkGdT0aFWIXFGK5zIm6wGyFhggPyvAfDxRvyCXvDP
         A6oc7ApgcjM1oabLNW1gDFGe3rfcikSdNkJ4P6Zv+VD58bCCdfzXagfM8Dob67pDmbm0
         h6lg==
X-Forwarded-Encrypted: i=1; AHgh+RqH4tWg9zZ+1IwflQgD97a/NOXdCQ1GhHqWkihqB//MLkpp3qdnYfp7K2iUkfJQiTfcNpqgYH5Wngi6pHdk93BV@lists.infradead.org
X-Gm-Message-State: AOJu0YwtNZqtDoGqkdPWCsCBF7OYsvqG9eb3GAP4eVm0ytn7bEj9e6ci
	Z7Pf0e1wMnnUNpCeZ0x4M1WVEPEKdag5xvEOTfuNG3VnvCclnhLcw/2N
X-Gm-Gg: AfdE7cliqwOU6aTa5WguwhIwgv6MiD+QWq57E8R74MnRPY6xbE8kBZx5WpAOVaYhOaq
	mF+J/i0bXUIuo5/jc1jtWEtuZaxShdrERKOrz8CCybtaCJQtTCyvjTXiAcPq/DScGCKfAE7rL3Y
	raCQ683tYnXz585ZDc8QRz4dmO8UYUPkmMN2B3cLKCJ8k4GECvbxFQRJdvWng903PYXnzZ24weW
	Wm0LkZuHAd+GC/QRZTvalz3gfQTdCtawLSE802W3fDMZhnEYQFd3WdnFiO5vUj4d8rhyT43BA9A
	yY+zhzBZXZyTZf6GeMiaAZYpfa8L5hW/UyEpMNQp2v22bWNkkXfx0S00whlUTzFWSH9AlfEdEEe
	3OfEmGRoza42nKbgzHK3Mv0ary4BL6oUKIhVew9/ui78XhObMKJexxaDuemDyrXKw0DG1cylR6/
	nIyUicgiXbWL7AAQ==
X-Received: by 2002:a17:902:f786:b0:2ca:6a1:1fc with SMTP id d9443c01a7336-2ca2d99a4afmr18114325ad.28.1782802201660;
        Mon, 29 Jun 2026 23:50:01 -0700 (PDT)
Received: from [10.31.13.168] ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a701f9sm7373285ad.13.2026.06.29.23.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 23:50:01 -0700 (PDT)
Message-ID: <1a07fbf9-d21b-45d5-87b7-d9965e73c6a9@gmail.com>
Date: Tue, 30 Jun 2026 14:49:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: frank.li@oss.nxp.com
Cc: andi.shyti@kernel.org, biwen.li@nxp.com, carlos.song@oss.nxp.com,
 festevam@gmail.com, frank.li@nxp.com, imx@lists.linux.dev,
 kernel@pengutronix.de, liem16213@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 s.hauer@pengutronix.de, stable@vger.kernel.org, wsa@kernel.org
References: <akJ9pd8uhXA6y2s9@SMW015318>
Subject: Re: [PATCH v4 1/2] i2c: imx: Fix slave registration race and error
 handling
Content-Language: en-US
From: liem <liem16213@gmail.com>
In-Reply-To: <akJ9pd8uhXA6y2s9@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235003_136987_E9E65E60 
X-CRM114-Status: UNSURE (   6.92  )
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

Hi,Frank Li!

I apologize for this. I didn't know that different versions required 
different threads. I did use `--in-reply-to` in the patch email. Do I 
need to resubmit the patch?

Regards,
Liem



