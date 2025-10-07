Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF84CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/TWEe/aEhKr6s5KMRouLoYYcgI2epSiBagA6I5SO6E=; b=sppOvk25Bpm9a0oP7qS5otMHfQ
	poIRnw7xAA9e7X3RAzHHAhqgcxAjr0y0TM1pfBLWH09nAy+GV48T/5TNKND4981Lio4ig+nrGAxIO
	PO06Ni6vSxufBPXdI7J0gK/i0c5OTFUtmr2KVKawCfn8TpraP06s0+Ecq2PBl5JHgF2GMQ0YEbrKW
	GAsLWwAn12pyjmKfDSJpwJkJC19YigoB7LcEQW0Uz21pSTDI9ZC0TrztxPEL1zy1aA9CxQPGgRVdg
	UYIYdRUMvIutlk58lnfql49y3IzH8EXh8WAx/T/g1A754cD+s/oEfV007Pjr/lnkGZn6w9o1B+YR5
	647mzHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EBA-00000002k7Y-3PCT;
	Tue, 07 Oct 2025 20:21:00 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EB8-00000002k6E-1zj6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 20:20:59 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-61bd4e002afso1821073eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868457; x=1760473257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/TWEe/aEhKr6s5KMRouLoYYcgI2epSiBagA6I5SO6E=;
        b=SKHh62uJLJoroyR4EoVNY4akw/9NvDZPmD7GlsBG32qioU+/j5QmixdJG37BWpaqJE
         M81f7qMvmFgtQOYQBuLUp8Fgzn1g10v34VrCZ4vsjHcdCOFp2zMdzcyFSQdd+p2wfQzM
         /6KCSIzNTcUh09mGGP5FWajnBYgDegDbpB8o4r6DY3cDJeBbXuBLiPv6Mz8BfQpdoWFO
         VvzaClhfrvXqZ0BuHJO7dIhUHAdVgaBT7KS8ORqUnGg92wWwLRqye43JTrec/lslnlYr
         bjIhBHtZR5K4lo7MdajNh17njEsVDZofKiKBJdMSlNIkoqByLq8ofrLq4XDbL7CmytnP
         5cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868457; x=1760473257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/TWEe/aEhKr6s5KMRouLoYYcgI2epSiBagA6I5SO6E=;
        b=VVW6G7Zxn3r3R86TcVRp2HaifVgVNoju1ZoRU09+WSKau0RzP/MDkuOJrLfjHgYGcS
         IQQyt9/KRs6JzoMfOeAW67YB3h3nLE2MSkIKEHfAOOuQwsTKgoYlk/GrTyArp+0/BFKy
         xGhYfIMcgoRu/vs+miihLdoST29El4W1OGY10+CJ4jbQYI+q9qmwIS2YawoF130Z4nLN
         zJDSkkHulAehISQKKq4Qmg2Z59lBHske7oWZRQgZqW/ES6yPcWpM9spahb+je5nU5ZsX
         WegLg8g9kiKarwdLhsRLpxcNTNFmyAAlVqLp67/fGaWLnQoPgh4nfA3J3x3Kv24GRc0l
         wLkA==
X-Forwarded-Encrypted: i=1; AJvYcCWuC+3GfheYr1iUgCEwe8Y9SHG+avF/PWIuW4EtTYo0ZuOmoIZs1yuzBOVbkRqIY8fXaUomAIqmSVu6hss2xZHW@lists.infradead.org
X-Gm-Message-State: AOJu0YzPVabw2TKa3KltoZvt1f1Jx6hTPE1Rkml+6FcnnUZN5OEf74gy
	bc4KLKAoWzj7ikbVPdzDJPMAwFGrgPUeX2t7I0hb4dRK+VnU/MYyq/Ji/P9BwXJ0B2wEKXYdhhl
	FP0qOUahyPZ9jvlTb/xQsI0S2NSXoVft6JPr9sh4vIQ==
X-Gm-Gg: ASbGncty4SVbLVBYd9/VQa46C+h8GNtet+Kc79tHr4dk4d0akm/hhEpC7mePkMeDuT0
	6SrcbX97NAjz4hJKYOIZdApfd6GJrWmtXKY9j4PzZdy3I5Vo2NAHs3aqegS49zLsZkJ9C1qeeuF
	K64MSP609xr/OxH+zpV6IEXTUxlA+d7jUC+rvUj1M7R2Qzt90etOZRLCmBQnBwj+k5Xl4JyUNbf
	HyTjtLl1w3HsPegzyYChLAeQDlmaBMtmrQi0A==
X-Google-Smtp-Source: AGHT+IEyLeFs/tZrPpe8u5cykgOumU9CrjJh4fjO1Ik2uE9eU8H/ZkZq/fUMlKIiW99d1ig/gW3IYGMToD+2pUB6yiA=
X-Received: by 2002:a05:6820:4a14:b0:622:1a4c:ca84 with SMTP id
 006d021491bc7-64fffe46c1amr372637eaf.3.1759868457494; Tue, 07 Oct 2025
 13:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
In-Reply-To: <20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:20:46 +0100
X-Gm-Features: AS18NWBXzhclL12SN8KyOZlv89Zez5Qwco0h5Y-fiwtfj-_OtAAbqpmFxHR3Ve4
Message-ID: <CADrjBPo5F9H3BbxBBQmwmDUFnzibnH4hNkYMPTknOn8ZHH_Mwg@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_132058_512881_A9D09B67 
X-CRM114-Status: UNSURE (   9.81  )
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

On Tue, 7 Oct 2025 at 16:56, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The UFS controller can be part of a power domain, so we need to allow
> the relevant property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

