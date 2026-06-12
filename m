Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04B6CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=; b=Lnzd0RPCAlCKcfbYofnd891HEy
	ceLEoq9b7Moa43YeLV69UilglqEN/O4xSk294wE4BCk/0xsOj6YhE1zJO9CXLnS56ayWoC5X+ZbNQ
	urkM6JA5ykKH/s4NlkiLrNGgUOgTmBskTLW8b4H+7us1BRh7U94/UNZFaVjf+chNDsTL6sb4DERc0
	X1fqwXMkaFwUKafd7Xh97iNDj/XrxOMC8CL4dVIIVycivwmJMEMDUjWl9+WPppIChncwO3sO2JtW/
	Nwiiy279lj14+OHoGnZnUQp+PlN/ooqq34hglqi7u1+AHdGk+XnZHPHlCen0OzAfLvZ+jBotA0twM
	/EDOrk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwXz-0000000AUSf-3dOa;
	Fri, 12 Jun 2026 07:43:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwXx-0000000AUSC-2RgY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:43:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45fd464d51fso306911f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 00:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781250200; cv=none;
        d=google.com; s=arc-20240605;
        b=SQfXU4tJWMdAwVeCckGjg69uVXnnlhYsJAyP8/7iUqz02aL33mPMjOxgoGt3ZuwFJu
         k6R+dlxsJbFdjgwWZ/3YxasRldHDtmSAG/+Lh2V+LxKhHIiANHTwVUs6skEXH8eOlhre
         FIbTZ3FZGO+uGTOvVuPaXtMemsBHDRNvqgJMrdngRQcAYsbfsBQPvx6YpBmrm/21M3a1
         IQ3h/Joj5c8/ulgA7wVH8Czt6kyZeFGmaCPeRj5gMtVqvv9NxdIFoltC4bBXXDUksm1Z
         HUrkrHWczMZi4Ho41+VzugmftK7+TNNdQ802+NJbuVsY9CYsYMRXy5xRJPaMHsS3CiAs
         IA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=;
        fh=glXsVQ2CSgZcYHY/I9pyU6SJzxIcgjx7Uv5ncJtoda4=;
        b=e4OxQGfsl2566UDUXjJ5LZA3T6A7hKa+/vbhefeQRSEHNxzroVB8jTz2VyNN1kXaxd
         SXWLtCoHf8MbhABq/9PqSnUmTQdpZgMI1FlyEMCpUYO4oXetYers4pZutsxmdvIclrP2
         Hs+5rksxSxDZqRqXPsA4ePfZWOCdtWKXhnsQ33lpXS/WV5Vbtvq9BCQFyg2AGoqNxsi2
         rQeMVqHC+2JWuODI2kzqOPH4cX3/iGs0zvtimmLXu4orDQDaflVI+6o1nqt149X1qE1p
         9fGF1zyzdFAyZh3cV2zrgOlw47gAn71AjJJpztoqUMolJ2Be5lEg/RiVi4myFgazClkN
         o3Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781250200; x=1781855000; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=;
        b=J8vO/PCJ/J3TeghFc2wxU83jMAp/WuHIxubiG+WKjzjVwPK+1dVG45UskDI5vVus7X
         HC7SCu8AwXfNvZsn08qM6uKS26T5M3jGEDpCheNuHNlGzyq3+tTZpfuuIO7In40UrSz0
         71IeSWA8STEy6+SUX5GfpGYufyF/YM7E93d0n/mWjzv0IR5v+sm8S6YsnFu/b8e0xK00
         hjIr1ybFEJoSDvJBnzFfCXlZ/tdZfWOnswap9Hw4NRI2E9YDMV1eyU9q1X491bEZi/Al
         aIACqpc6kgnqekaq48XnFK9wP9xz3FuuA2g1omjrOiRPuS5euENkBZla9yZCReoM0voJ
         Dmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250200; x=1781855000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=;
        b=ghHQHKCNmBYzwsDGFxn6fbCDUvdQF7QJ7dWnekvRexniyJBxlLZuY5xMkqJYdSaKlu
         A9Mlp7l2vxaP0QhAH/GAaD9ImjxF99jUhIKoQBZTP1ISwA72s+l2k98rbqhIKEP8V6Zt
         YwV3C9dV6d38QhlTB8ZPZL5Er7KCLC+BMlZ01vqM78hsNUZiS9zjWJKAmICnugd+C0SO
         9Hs/ZgdbYqL5/TF+ubMc3rFSsVOWjOC7ecDSdQ3o6TeoxBXlmUupsLJkNuLvdL6sHosd
         qvu9+FrMqDdiLKXsWuFlYaHCloIkskggdB2u8iu2DVNN5nvscfMl09gICfxSJbqp9h9v
         46RA==
X-Forwarded-Encrypted: i=1; AFNElJ95VRaK6AKY1bAtDz4DO6rJak7wc8DlUG9oCNu6fufmqJeO2zah6kPDoSLJkAV1vpCUd96Fi1lkhCrd7sToBtg4@lists.infradead.org
X-Gm-Message-State: AOJu0YxxSkgUABZYu47Ugs6K8WS7oYdr2P/SA+H5g1sUD6hRGJ/p6LKI
	XVa8JYIqV+huyr3qOd+qPTo+LOzUuo1UTs5yTScERC4mx1H9OBFxmc0ttqAFzPzOxk1N52srMio
	CPHVfmXxX9Yow7/7DZfAO+sy7Y7ZaAJR1BQIJdY4LHidgl48pzVb6
X-Gm-Gg: Acq92OHVzKAvbBp28dSRkMGq6REtwWgQomSesVRMAc/9GTqNj5ZYLCXhzDfDGKFRqFa
	sVAaskc5oWYTmfL//RbZfm9aK4Xu9ti7OXmqcfJeP18vTMxyIR1rDnnQ0QECjs4Q1cbdN1RsvtP
	rs+aCDEfmU6Hedmo4gdIL6bcs8aeM+mOWr+CL6ZPKHpmxsCcmpPH0Xe9iKB5fbVJx9+vWR9Lvwu
	yLc4F7HNE8AHTVp44mttiQ3eoupskB/Jvk6aWkQ5JRMVqunftyifWA0xkDhrhQkxGBoUt/MIDtp
	i2eEjWsv+1wBEZqH+4fIJAagPKrRNywMYbmEEF/u9mFdKTbMdqeavHbDZ0FWXduTqQC5
X-Received: by 2002:a05:6000:290a:b0:43c:fc5c:a9fe with SMTP id
 ffacd0b85a97d-4606dba4105mr2253784f8f.20.1781250199806; Fri, 12 Jun 2026
 00:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260612072341.278591-1-gregoire.layet@9elements.com> <e865e2e71a39c86a8afb6af49d9ebcf6839a9a2a.camel@codeconstruct.com.au>
In-Reply-To: <e865e2e71a39c86a8afb6af49d9ebcf6839a9a2a.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Fri, 12 Jun 2026 09:43:08 +0200
X-Gm-Features: AVVi8Ce5W6VsTL5wvIhDV4g3cp0NVrtH0vt8cfJM9zmJ1mlbq7raAsaetjYBOEQ
Message-ID: <CAFi2wKZE_m_xeggqKa=HxwaSuC2qMYNiBz=TjPgbX7BhQPyO5A@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: g6: Add AST2600 pwm tacho controller
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_004321_629109_C51DC86F 
X-CRM114-Status: UNSURE (   6.48  )
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

Hi Andrew,

Too bad, I didn't looked at the right place.
Thank's !

