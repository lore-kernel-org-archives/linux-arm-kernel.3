Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77468CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/eQZQr/FlrHFqBmnzi43q5wN7esytT7U9mYDKA0Bws=; b=XOJC2gdZWfqkjezvcldh0wDy6/
	NmWNKTPB8nBN4/PGJsj1k3P48W1gKutDH18sdKdgRZ0YWDNEADFectRSHDCWZHLksJEV8SKNs+vV6
	tSVCv7ITGXUqM33yu3ZQcDUmbXfJLjV/TZYm5PotXqRqCx6DywMa86cAHeV5r9sXChwCluGAvyAI+
	SKNtZ0xc+fm6fvMuJFldSYLUlHsO2AeA5kD+63HK/byIti/F/bqxsZwVWLiaZ1+P9ZOlY6MGlMwWU
	kPkI+pymkkxxUgfwWcQ4HA69npBtgj16qlW7Y/rObzv4f1irqzdVDBfvA8Ms8DbDgH4q2V0qKVA1b
	DoDteLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Rv5-00000001Vqj-3zCa;
	Wed, 24 Sep 2025 16:00:39 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ruy-00000001VnH-1bfC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:00:33 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b551350adfaso5752138a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729631; x=1759334431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/eQZQr/FlrHFqBmnzi43q5wN7esytT7U9mYDKA0Bws=;
        b=BIo2HTs7TwEdzwgM3b5jPhYOYQr+lmytt9FDfJsH0OMErEGBI3hJuS3JSYTUGZr6tf
         YTetq8QC4lspy9TXRFulyrv8cR0XF8SODQWYdHV6EL0JrHynjFnu7XBOQeAc54AvVN9Z
         IcAq8gmTj+tgc8EESPeEKE34/ALoVmvkaxsqwQ7AydsE2KjETmnl8ZNwB1Rf9qpCLXEi
         i0boUBGnPKsoKC6MXJ0uLMbQVSr3/vnJx/SLWGQIuvK9TdDmTUbONvTAqwweXRyx/vCK
         ZMP1TJCVZFAU56/0IQfLwJeieIMXyuz1qLOZ03RV9zEPVlBUmSoy6OEvGUqjD9h9dxsS
         /6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729631; x=1759334431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/eQZQr/FlrHFqBmnzi43q5wN7esytT7U9mYDKA0Bws=;
        b=OwOhEH2A1MWnG+WbRss2lRfs0UAKXugpnaeMJklt31Ofd/M/wo+6KkjNyqvcvXO2gG
         q9hiLz5YTCDtdI2QpzqaPuPoOlQv8/HcvlaB+6pjo//eglRu0275VxIkVLPBbiVX4YjE
         c84UYyl4ENyIBL2yP+uvssoYQg4Bj/dB33C5uuShSxEAgLQg7bli7mCzwNlTAImCY/Qi
         G3V6qDTsdZ1088fpobAtkMVuLd23q0FVT4Hg8xcV7XY5kdREYsy6EYsdm2PoYF8exYuR
         +thB9reXG6QIUHTt4ltdIvhUdSa8h3shLnf/VxgCxAxiCHDkxVv3uD9nbD32BB8E952+
         Isew==
X-Forwarded-Encrypted: i=1; AJvYcCV+Up6676WPAFlZG2dP+ZvFqT4a9+eEI3ZQmFY6kncNi0IJGrJnXr1WrdYmeIGyK8cUPFXQQEyohoKp8Dg3xXWB@lists.infradead.org
X-Gm-Message-State: AOJu0YyTZivJto6+2vW48WWajTnQlPs9QTu9UjaNG7KXKaOXfwyFr4Hs
	l0gFGKHUZz7l9wuE+DirAREONPaZGRt6qyZTDXQ4FrHXKngKrUeTJce/+sWuPOBi
X-Gm-Gg: ASbGncusHa7uZnctrxh/Pbn/licv4PVHQisO9FZcM2//QXCQhy7jGRrQCoQd/dRm6qL
	g262kf4BEN6+FBnNEeZUWN/NznqKpi1r5lNSWixBebOYJjha2y0e1Uui1vtuGVmtc7iXy9GUykQ
	k32I9bpr2FqoPSeOwT3PnC3geSt2AOEv1fhHF6dwEb0TKTn5Dh4o7ewoCR3e2allqtNBMon/H4o
	1v198BBvW0zEvRlD6SrbK4p/CoXXpPau+FO/jwssqRbP09z/tDCRSk7Ozk5c+7jiJBSkY1A5kXS
	i3aSoFYAGDDgReTimu1dbB22MxIbBuRoCy/5XvWrwU1gP8Ze4vegE2sejRnjf8kEzkbRrT9aZUm
	4tp3I4DeeeduXDX/mfuHeny0UioNgR/m0bCU=
X-Google-Smtp-Source: AGHT+IHh6nEKuJB+/U1aI4KfR/nSkf414wZmo0pvYnpISYF821fu02/TzRKwO0iL6xcTPglHzJx6Xw==
X-Received: by 2002:a17:903:1a6f:b0:272:f9c3:31fa with SMTP id d9443c01a7336-27ed49b8e31mr2949535ad.9.1758729629711;
        Wed, 24 Sep 2025 09:00:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053201sm196264675ad.17.2025.09.24.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:00:29 -0700 (PDT)
Date: Wed, 24 Sep 2025 09:00:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: hwmon: sl28cpld: add sa67mcu
 compatible
Message-ID: <bffc6119-8623-47a7-aa47-40ffeb6ec09a@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-5-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-5-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_090032_421347_CE2B00F9 
X-CRM114-Status: GOOD (  11.50  )
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

On Fri, Sep 12, 2025 at 02:07:42PM +0200, Michael Walle wrote:
> The Kontron SMARC-sAM67 module features an on-board house keeping uC.
> It is designed to be compatible with the older sl28cpld implementation,
> but has different sensors, like voltage and temperature monitoring. Add
> a new compatible for that board.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Guenter

