Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E8FD5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sW7m48+VKPhwN9Rm9Ugqxu1eLioZD54jqqMNJ7yTAA=; b=CMrBlEx4JhBXJqjE5JMrFkDEJ/
	Ms0+n92Aw4dlvpGH9gIy87IlUwIi9xs4nYhJ8swx6cpwuZAOEy22nzh5XDsvSVk79CPuZxiybwdhi
	q4BbkIJo0G1/510RlzR3BLb7VW7GItWEVMM2LLJRrhb1L3Piu49Wx25ynAjtU+q0G11Qtp8kekKOH
	CrZQT3GYLWFeAxdV2BR+uhMZ62V2Yti4d3DExe4wRdV0JW3FJfRg2LCwYQDI4byfhY+y+vxdG9VI9
	76Wz/euGCtOMOjPcFs3UT2O9w32oOnOE5/d2XR5ipdk++AFtM1IJw973HA9AGK1j2xasON5yxJrIC
	CxsxCbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOH1-00000004l4H-2mpI;
	Tue, 16 Dec 2025 06:11:03 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOGz-00000004l39-26Ee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:11:02 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-bfe88eeaa65so2847575a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 22:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865458; x=1766470258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/sW7m48+VKPhwN9Rm9Ugqxu1eLioZD54jqqMNJ7yTAA=;
        b=kwqmNxpdc7CHf8jY0TsbHwPk6gRV2lubj6HiRN7atYJ+61SkwilekmvE4B/RQc3PN8
         yfnv0K17re9Q/yJj+V0M6XMQjmYIgnx12IPdKxPDUiRYyEhcJgb2sCaAWDmTbv4Yhtn4
         wdnB9C29S1mcL0elgWHOWhxeOIQiJTsBPsKxVbX6YlqeLxADgXNKjMkN1k4ix2kDqq6B
         PpMdidwYspkDYvDGICh7ixrzFuuMwqf7bIeXFh9qA1sWHlNjiJ2ECt2xt+WNXa0fOtsU
         VTnlZhvy12UmMPRiN2hlztqUp9jwL5leeWpttMTnXgoHAIenaVpIOc9rGQrHh1kvvtIo
         BtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865458; x=1766470258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sW7m48+VKPhwN9Rm9Ugqxu1eLioZD54jqqMNJ7yTAA=;
        b=TdtL8RkK0RIKmLFt1fIqM52DbgRp/osF1FsGGmnPQDXlaweZwTAwG59dvWorwBXlrc
         f8Mr2zDpOUXwtPj7t2fIzQp7s745boFtFGb15QDllIN6qXg8pzJTtc7h0Js9OW8OwAJT
         dKAiDTMFZhFNf5vku6Zt6DU8wIh34bPEsP7bfux4xnJflYbJ5rlTh2d84d5Ag4rkQrlj
         iqxqsMEbkAUkjmNHOtbp+sEVu0Bwy/N39SgBhMMJxifHu/KpDfF0Fzywu1VjhU08lDLR
         BN+4KnGSVHN9cskCb44e2mrMeQkmW/WzfWFVAgDuJRmz6pJqqBElLJelLUFNK06eS8Al
         DbKw==
X-Forwarded-Encrypted: i=1; AJvYcCXFsmqSRHQrwUjhCTpNmeqKsmjdk6RKHTWveqvqEP0WGlHhA8OJKnU2hSmvrLdZm9nlHnVVmwO2UBFNDnZlcX+n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/xsew4auhuCnmIy6xdradsFLX6IfAe6+7EbY/KYQNUUlqh4bx
	MARS4xMuNtzEMwisvENNUNUeF4dsdohk7S1mBzKBcSopBhX4e1HM4VUujFLBog==
X-Gm-Gg: AY/fxX4NUbYY9Zr2uDbw7lm745dD7R9ae0FyMmcJE1pFl8JbzxnPgHO/0FywF7SLyY3
	GU+2V082SvD5E7g1Var1vsfsafDd6Dx+zAowOSPzhRj9GfhlIQGdmP1OPdFvtIf+dbken/X2I+6
	HFIJw8B3Pak4ikHTADW6kE75bZ9+SvGgfGF7e6TwegbTA1NSvLJIwUUD9zA5xVuIoBgKRitPZQN
	HonWtx8NWo/xwQXt0plwwhpraMdwUR4EbW8/msLSKJuErIEuZVy4hLSlZYzfud1xeFA+bYNfysg
	IwAtAkYqIxGmwaoF8JeZo1ZWFDPwK72/IZTVMW6ltMQC7yb8qTR0xnqoRrfojZJpiR/xqsl3Tqb
	5ntuGRjrKEigQWZ6q0wBF7yv7ZXVkjJA/3hK33Byslg46JtMlMVhoeO/ciww5H59fDdb6QGSKaT
	zhIFOReZq0XPLHrQPJly9RSJKGL6jdE8aIG04ujUf7yD4griqnH+sjmQIvBT8RUQ==
X-Google-Smtp-Source: AGHT+IGZ0mxzWOtRI3rd3KcueGeAebVyU0dbceyTolyf30W623KDAD9U5TSvvfvmt1qC+AO1AImubQ==
X-Received: by 2002:a05:701b:251b:b0:11b:9386:a381 with SMTP id a92af1059eb24-11f34c4acc2mr7533177c88.48.1765865457908;
        Mon, 15 Dec 2025 22:10:57 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30497fsm51603301c88.15.2025.12.15.22.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:10:57 -0800 (PST)
Date: Mon, 15 Dec 2025 22:10:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: stmfts - correct wording for the warning
 message
Message-ID: <n2fcsz4gl7lyniy2qxdddvrisguc4ssln4buky4g37rjnwxxo6@4lyarw5ngtqs>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_221101_590446_0954C28D 
X-CRM114-Status: GOOD (  11.28  )
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

On Mon, Dec 15, 2025 at 03:30:01PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We're trying to enable regulator, not disable it.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Suggested-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

