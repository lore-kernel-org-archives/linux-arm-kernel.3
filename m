Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83133C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ee2vMUDZRdjGNIbzmhry++VVeENs1uRLq+FlAoQjWA=; b=rAhCOlfBsplisX7AnCa9gzM0fB
	Z8j7ewpy7sPBTMpCkrGoTu9BdsJYzlcghbj1EUUqZrF6u0SBwOqWeIzcSFc8HwZGZxGqf15rFbb7P
	Wi/un1hf1yIv/nytndpY9yTtExUEvzZC0DH/CVQH7gFqwhWCn6YUG0iHWArMkAoGcAyrn7cXmRaJl
	ykCEAefxl1tUHC8f0I5suOJUW6aoo+7/hkRf5Tfg60VD1FqpU3nR8iP5fjP9EPiLxnqHrHZ7gS+zS
	DoLevxbPTA1ff1HJP21ypG2x0n1AgYn0JiCL7/dqJQVKqlC4U4fi58R9rxKC11w2+2S4zmXa8wX4e
	n77ue/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxcz-00000005RaL-3Fzx;
	Tue, 11 Mar 2025 11:18:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxbL-00000005RMB-1TK4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:16:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2625679f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 04:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741691804; x=1742296604; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Ee2vMUDZRdjGNIbzmhry++VVeENs1uRLq+FlAoQjWA=;
        b=kDXszZbmHFJmTHw0XYvYM5Wzpfo4Cu+QKVD/eOXFgptIAIht1bspkN5ACZYV1mtMMi
         VRtnFwYXvPiFqNq0Jr4d5+omPduqI7POAtceO0ZN4Sx+KpGWr04JDvwIXn+/9eSs/Tiy
         /rKci2MqR6kFwwA1+OsHQ2uTfBgD73nf8wH+ImIk7QOIC6lqYlvjXjIF3fpBlOuzwg03
         7Fv51UpjWzz32d0CXZE1BmN2m9XBtNFAiA1ZRrZ9BcKOBMl4HLsDuV+iZc+W9pan5n35
         vks8ATEkMl0gWbi5JvSnWRY+0mPS0GfScTCS7OoppL4zBXzlTmboCMm3SrnsOvEYgeec
         G8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691804; x=1742296604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ee2vMUDZRdjGNIbzmhry++VVeENs1uRLq+FlAoQjWA=;
        b=MoLDvzz0HN3ATyKOGO7056vSMOLURYxnj8qhQF2eC7K2RewhHjAJnC6VVjWGHsKr8M
         aDi4QC+SqYUXy4pVbKtNxegzKTAJmzgYYHBZP++d5Y0jB3+GKGtiKL8OY3YqpNg0Q2OR
         IvSMV2u2oO9psLj3png1D5UPQwY9ux5PL/KmQYYqhmwr0u39Vl2yRffBVY28C66o8iPA
         pmW1xCZmlIjjNeAfvIp6gkzIqclxAqlkdFQgcXWuw8Wbz1DoFgVB7J3/coEp/kwWF9Y+
         tlqs5dLeoHyAn5OH7Gnu5jb9bVHgsgOMmfvqr+vKdyMyrnwQrsIscflxJzjH+vb2P12Y
         u7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUZhG97fLID29n4TUuFui4qY6X8/JHCjrXymOTxuIGUvyqMhXANvhl6fO2KN1YU3mK7TiOghim2FQqyZZ+TQDWF@lists.infradead.org
X-Gm-Message-State: AOJu0YzVlOum+Iq3H+O7DtZMQrKI2xZxJkrA2MG2v0ffxWZcZ6Wu0NmT
	y/dyYMjn2k68ZkFgc3ULTSx/BRuGQOdlZqEhu+u/36O8rjcWA5xxA0/l5uhsgfQ=
X-Gm-Gg: ASbGnctffQkxgYxuBtgI4K0v4eyhrnAb8qPr/JB7YXJJY/21dF/6shKpZ6pmP7YPaGd
	n/Dx/2qi3Ul/x7mwVz37gYTVxHCANYBwHu0di2buMesw9WknHCBeupB/f2V9RbU444pZcqRq8Cb
	YZGVuVrx7H3vmdbmfO2OVNksfGO+Vw2p+sX5W5kD6Z2smlSaKGUIa0dFwtcIdEND5YVM996MJmS
	i/qMptDWTmFYuPRNz3hoYQPuXJ6H2EtLGjIZRespzBm8W+vz2iYGVfNRkxZGITR/on7bzwxf5Tq
	GFrEMRJLxsHrBCLUvvk/jxoe4EN2ctHLiTcIV57D9p99ayTwMw==
X-Google-Smtp-Source: AGHT+IH62B2vN00mbQ7cGtF3KOTyZWYGf3hAB5PaS1iAsRYUThgYmKN7VFoKRyfU1FM6J06fivQQQQ==
X-Received: by 2002:a5d:64cb:0:b0:391:3fa7:bf66 with SMTP id ffacd0b85a97d-3913fa7c415mr10740994f8f.31.1741691804523;
        Tue, 11 Mar 2025 04:16:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf0c42eb6sm87876805e9.16.2025.03.11.04.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 04:16:44 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:16:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vchiq_arm: Don't use %pK through printk
Message-ID: <01a1fcd4-b626-44a2-b850-bf0d8b9efbfa@stanley.mountain>
References: <20250311-restricted-pointers-vchiq_arm-v2-1-a14e1c0681fc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311-restricted-pointers-vchiq_arm-v2-1-a14e1c0681fc@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_041647_402505_B68E4F19 
X-CRM114-Status: GOOD (  14.31  )
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

On Tue, Mar 11, 2025 at 10:40:49AM +0100, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping looks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> There are still a few users of %pK left, but these use it through seq_file,
> for which its usage is safe.
> 
> Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Fix wrong replacement with invalid %K (Dan Carpenter)
> - Link to v1: https://lore.kernel.org/r/20250310-restricted-pointers-vchiq_arm-v1-1-dd04f208ee55@linutronix.de
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


