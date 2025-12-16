Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5337D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91/sEp6nL7Uz62wNdS3TngXU6hAiNIHZp0YMqKGfo9A=; b=ru8JB3uz3/oN80tfqAMnOrs2TN
	bWqa+xYaGWie1CZH8QlXyVc0UjwVzVi53OVg4i7PjNF9T63PTM9TPoQgzvrhUc/ZSUxyDb/aAvQhu
	hilGpmqxmGMg//MXr+6GuQAEOpAVtcRFbZa+kuDRZ+8flIjzKd0ooPeJ3GwFvhKZAsIa+vvU9VeQW
	7YfnCFSslrFHA+F//UUlE7Ch3Qk4VM14Th3o0xgktPpepmd14fQzD1loV0R3wWtwhjJPFLySzpWIQ
	Wv5ydZ6b+XNi2g87P3IjK6X0BlS8JN7fNDyXKYho809pa1NNmf6nsOqEOWZkY6+islrEKIWMPk1kF
	z2eqIHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOHg-00000004lGE-1p41;
	Tue, 16 Dec 2025 06:11:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOHd-00000004lEu-1zjd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:11:42 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso4030444a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865500; x=1766470300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91/sEp6nL7Uz62wNdS3TngXU6hAiNIHZp0YMqKGfo9A=;
        b=DOcoV7NvHwdZh5kfXbGGsUAgK6zGCKJ0Z52IGqTYdnp8tCAGmJONPBAnszPL8XS0nK
         i4p2mQr4h2fk9vJPBNt6cimE2vEiXUiTUoDeGosFXikZ5//Pzw8QPlOffzQQlt0nX+uN
         5s5mjrdTq6G3Qgk4Bm8NXy2IJPFvWujvapHv1MPPxJJOfKa+/Ia0j8cAWj5goVvehOE8
         /wYjX6yvrxX0WwMm4JEWZxKyY9ThDzHOhxpmoxO60t1F+VEMyS8VoLEjBrtpkl9DDLML
         G/uvHLgoUpNGF5O/sLyddXBrk/4Ej/gWX/BGvuK54MGIPz7IbJ/Ad8GOGm+u6DIjEC/N
         BTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865500; x=1766470300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91/sEp6nL7Uz62wNdS3TngXU6hAiNIHZp0YMqKGfo9A=;
        b=oKHkN9t1PTreSkZ00fxYqwM9WKiUMqZ4i2GROPi8Knoq+OxUCw7xM5RJkh5WhjxguK
         tmzi6//VrLWNULwDXLCmsjjwsb1F8G2QpEqsRkUnli3BsZf3RbaxFM6xx+zWrRn9BATR
         cyysz/J99ln7VRthHJObb9OVkzpiIFmepDuexc8HYZ2fGRFj852yD4VdzhEwS8oP5/WB
         qY76gBE2ibeGGnJYVWcuwdIq6oASboZ6T/UG3Mk32qL5RawPJ+bO5wua5e3ZzGd5SQ30
         Lax178cwa22bnhqxndjrPmj0w3trDRjW7olwuuiBhon8c/o/FPL/MCmBwx+YmoGSSIoG
         jvlg==
X-Forwarded-Encrypted: i=1; AJvYcCVy0BHiBZZf3pe9YyNtForo+kfQbD+Y+Hkv3/DxUwxZUKZrfqbY5yeuzE18HckCr5PAIRcnbR58rfo5Am1Fddv9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3hfAyPN/c3QS7rNRTOXdnNvtKVU8eZV+M/+0+n9YcTrofX0Zr
	NzOsL4YKXMvcNJ/kyOoQBUKaBGxqBfVRo39sSjOd8wWLFSI8lyfEnTOo
X-Gm-Gg: AY/fxX4QH2UAmAy15xJbacPy0WLMUaAxrKJiAoH4Avi1BYoNzsS0tQeXOxEQtu9S0fi
	LZg9yNB7bZBPNqd2JUxx5o1DjYSVk6r9Y3CKR4saS2g/9ScyJVSaDGzmgst8Jp764a5u+fliAxl
	lWrogd6xsRflRgggHpG+1FdM5njBA9m9/ojC+BM5SidLl4dPjY+B8yPEFpwPng9/KuzeqfCJy7+
	li9+zvw9WnKBjlFDhUMuuOQrGCS8ZNd3P/zvBxEd8U7ur0JUK8AIufVhdMuV7UAstc9kKGZ+pcR
	lWRFkc3IrTcQGZckiagfvvnzPiHdrUGKpRzPwGeD+rhoELojHyPTOaR7igHFhLDpHaZX7N8wAyU
	7TWiHYrB8mkTsk+jcqFO9MkjyetHOQOtCCTAc1ObD0l9VOytZpJN+oV3c6fPrqwoDhg8M1r/oF7
	woKK2CL86K+3grl9bVof7ia9xDK49UzF+iTr9A9+jCeyJN/NNVf/s=
X-Google-Smtp-Source: AGHT+IGrfQdHLxRSdxWY8bxHyCEpt6bqyxrt6EqKW0CWWGAPI8Y3i9jlvILhbFtYKANvT+tUPM/qAA==
X-Received: by 2002:a05:7300:f78e:b0:2ac:1bb1:68d4 with SMTP id 5a478bee46e88-2ac2f85ee02mr8946330eec.7.1765865500306;
        Mon, 15 Dec 2025 22:11:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0546b8sm502879eec.31.2025.12.15.22.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:11:39 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: stmfts - use sysfs_emit() instead of sprintf()
Message-ID: <gjnxidvenisbv4lib4jhngybjqcux2umn2iunnaqvjct764njg@qf2k7mcvebml>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_221141_512407_779ED67C 
X-CRM114-Status: GOOD (  12.18  )
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

On Mon, Dec 15, 2025 at 03:30:03PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

