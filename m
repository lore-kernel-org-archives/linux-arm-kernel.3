Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B118C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=; b=f4rMIFP7lwzBWX+WyzMQNpdpwb
	lcw2utXVDbJbP1ZJx1pEvp7DXbja+hV/vcAdLslyNcrFwkP980ULGwshRJDO29Pmc3mEYK9ytWYW5
	/6opJAsLhxOf1fWLqD1VvqBCEqnV6o+W7s3vXfhwB4boobzv0Qz2lrTfLrGhTl3shw3PnRKSIiEE6
	dKphxEJXvgbegFQflzzUMbRzGO8MKKhX0OuHeDrVfsKFI8bqTAJgvHgeP4L67cqhB4ukXow6nDRHd
	m7iR7fvaavwHo178M+L9CMlR76ln3tcyVJFAXScgf+Nu1rKd7by7L7PcOFL2oQ8pMzrtYSH4TqEaF
	cGsQz+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P8H-0000000CpPx-0NYh;
	Wed, 09 Sep 2026 20:43:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P8F-0000000CpP4-0Tsx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 20:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=; b=NQrs5PNu08DEsvqA8QAeMljemv
	d2upHmfFxfIyVBGgRtcNjG0ilCfG9Ul4mZUlztoQ9tD2JScbXRN5JpIDbNXOflrsfh4UPZlAqxrdv
	S/R1pGWXXePOfcBEXzU44NgNdnuJqRkmmQMr0u+tv9qFoyEe1JvuWxs3CaMDiljw+PG1dhlQRrNgd
	Sl4xvvWCE5Gt9t74OwJQM/M3/oqOYWDZsOsMetXgiAIXsd7k16ufn8mLzuLl7qHQ8cauwHpsqIoxM
	yR/53+LhBZ+lAqXP3j0vsP78T6gCQuFF7ZHSvzLj+e3hKGJ2Ow9//xa/2n8ejyCvCyVV7Mt1zzRX7
	GhkzX7HQ==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4P88-00000001ep5-0dXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:42:57 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cbee846deecso203137a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986569; x=1789591369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=G/IxzWEYE27ZGM4GLQX+JaZ9y6v6wRtw9stSOOG6i321uK2ddZkSBzySf6Y/U/CNMW
         Ou0jL9legyL922GenJ9A6/LziJQ3zQIA2sFsSE5e7WdtIncDzGxZ0/xpP0aEStVnt8MR
         n9vyYeToZ3gVjn3m0o/AUkQ6HGf2iXjQ8UixNV5RhJgfZ88rgf46cPIuSJy3WVtQo8rQ
         E+akID7QrtwUta8yVQRggpKu6Qam5vZTzFF9w4FhBIPYRVsyhBv7TKWfVxhLqyNGr21C
         9DjEIe5rvMV/oHmzu4EEL6+/OBv46oRH9AdYA6nBVqbtG8FTxIeeIhIx6wOVVi7PHY/a
         W2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986569; x=1789591369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=iRhqzwj4OIXHd/rRJ7agjZlwQv+m7fmOxVU0Os7H9nijysCPo6c49ovyE5vOD2M+3A
         rSprqnSnMuOvfpDgztWZ8yZr3NIolRJWoKCKENGRBIp3XZVaSQTCHSEdiBFNILpdVgiv
         r1O7X06GMyGyc2MpnlFTJpVYDOtQgcORVNIDebJ1lJfydxwr2a475xWhpv475KUR/B1z
         teuEbQREW7ODgZxIVok6WaeUBxfE76+FuSvukSB41SoUeo+x1R16LSjAgEmGCS4s59Oc
         gtGPVTf1lTp9Kt6PTzkDoHCmD85x3LwO5ybHyb8l9Hdl2+NP8Id76FXlxjfzsIJrCKHT
         trAA==
X-Forwarded-Encrypted: i=1; AKwUvBzEDtoZO7Oy/wqFCig5i+osRxfpXxqoVxxeuZ7Q4osphpnfYLl8f4YV7V6r568Y+OC7+9CEiH8cuuwjE/uuDOdo@lists.infradead.org
X-Gm-Message-State: AFuF++k1q1YXDBlSBq4VB6LpJg4S9+fPOsEAJnEemtgW1wR69pigKijO
	lECMlCoGV9i84VuGpzXQuWYm7h+RjkwrExJcdn94dsvvOfgeT184XMlj
X-Gm-Gg: AYBFou28kjCwkgZ+YEbj3WXOsBP0JwFhhWo2QaAodkEYgrdsSYwdZy+P/81TR2FPTqF
	f7NbWE0E6iTspTT1/YLIXkqJGlWYaUD8y3UFb4Yh1H97mtq8ANpKQMbgv23iuS4sF6/hKqba1/y
	9woHPDsFsZBjVa2yn5eixtGFtuNezcjgPH275sj1W5MMBDXMMhA8UN6AA+7v7GRnbWukKhkYCC1
	nEKyQkRHAoeHx2QsfbPbfOb+lKifNaQP6cbNY7D+Yn11vT8NBVS6JgbsmMI6Ea0+kZnBLBTCQ8y
	Fahxa6Il7FqIK1UR1v5rLTj+M4wXAiqTYv75DJgh8qvgd2Tl8aNA/UD8rXHtXqIMgEZ9eybkVsT
	8GG5SqpXSf1oLQqey1FHxIh2NZijjRbpUIt2oo8GBIGYA0LgZGs+2YwZNaif3lyxviYKDXFu3xw
	A1/EGX4YOwxmtr5WmqwYuKysUFr0LUO6aa8RCe1DHEX9fqn46BrU3xTss1BjvoDgy0MNNVN8062
	+jnO8D2AzeA
X-Received: by 2002:a17:90b:2f46:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39b260de5c6mr59642710a91.2.1788986569020;
        Wed, 09 Sep 2026 13:42:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d774197c4sm1220340a91.8.2026.09.09.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:42:48 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:42:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <6a212071-3b1a-4dcd-8d9c-8df6352813b9@roeck-us.net>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_214254_928327_807E5F1D 
X-CRM114-Status: GOOD (  10.51  )
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

On Wed, Sep 09, 2026 at 09:38:00PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter

