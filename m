Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0D7CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsFqUYLoEXoD5J7mOVBIukerFwBJh/oFQEJX3GcFNXs=; b=XsCNsGp0DjV2IMwsD4iuKR1ldB
	Px/qKEviQyZpz6Q5I2Fg4UXGGcBYJPn8ROAyJ0p75tNZ6tUKB4RK/8fifnNLC9aoWr47uAGOch/mr
	rjP+B1Aw5gf3bLRiO86eDJlMb6bQ5qaMTYpFMVfCeSe5V/un8du6jf0mnZ/Wx7sSQj0Aia6PoxWbN
	ngeW5i/5xIMKAW+4YgHvitORhJDtqon0q3/KIVHA3sLeTMdgXoHXn22LV9WBt7zfZ9DBPhmseu6t+
	ZF1uSiHzCcl7ul+5Z1oHVACP25UoZk9VbWR+pHqeTH94y7eq5RZ4H5UfZflnEWdJBq2QPdjKEBrVq
	E/WIeFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pNb-0000000BgNA-3dT9;
	Mon, 22 Sep 2025 22:51:31 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pNZ-0000000BgMn-2DkY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:51:30 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b78657a35aso192021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581488; x=1759186288; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rsFqUYLoEXoD5J7mOVBIukerFwBJh/oFQEJX3GcFNXs=;
        b=gV6HTNbT1wUnTmBuGNGvSYHxoosfxMOZ6fQI0qOEO7kk96pl+lTBOD0mxGkg4YEKZa
         gs233cpzULCHdSxvEmsc47pqnTsUHDyW0cDuv8HJPsD3FCW3qNYhQq2tK62pMPOqA4Jc
         dgsTdR6KFf/MMocIxhzdmY1EGMNexgITRb2DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581488; x=1759186288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsFqUYLoEXoD5J7mOVBIukerFwBJh/oFQEJX3GcFNXs=;
        b=nVXHNctyBkug0yNWS8HRyVJ+M89Z9HFTcbMQmmBhinQ1N4uRiiRg9aUMYLivP8fQxx
         nj1msy10s0Gw7TP1yvcPQolun8XxCbq/WokyrUvUMJPCxTuHGfQwrLgbJ8smcNVuhDjV
         I0uQZA814S3O8ngJAtWl3K1RbZYEFkoC+cAs04HldRcTXsaQsEcURx9EkokBgtuY1QH3
         sNK7Y/H0CE1i/+jg7ic4FNOvi/KaBreBpmFeuNg8Gg3uqO0FWk2oPbTMpaK2javSTa2P
         zKChPDAef4APivUAKrxtl6z7PVfPEpGVFYHBF1Sr61vh7vs15rhv1np1tl/dKYG9PX2I
         47bg==
X-Forwarded-Encrypted: i=1; AJvYcCXPrNWxb86qtz0O//kxRTPIrY9cRJEojtBvkUIeipgYWSnujAP56y9g7TX0krAX3lttBqQavBrkfOZGKkFjT3Ff@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4RN9Id1o6p0RmTfud8c/xL7fwEIC4j+UviI6eXKqZacIV4wFv
	QC7b9rzR+Z/m4c8EqZpnmVlJuzDj6Uf5TJqqd9aWYUkjOAqqzcS23IyZkx0BzjqOsKzhgsoqlZ1
	FoSktDCpjO1OHIrKh90gll4uhH8GM5BDkUg8ea/1Z
X-Gm-Gg: ASbGnct+mmtGcrEdYsnSB1XkgurPilifllroD4FNgwLd4NOqOfFKYIpKz067bYjdH1G
	HJWGoQISnWXgtyNajZhAo5CRBScO/4NQvPby1CVczX1KMwmjKtDegDdyqTBGvSIMr0+1RJXMqiJ
	qhgC7pyM618XB0+wLuWPxIqHcPNR2FdDkqgvKDAReGhSaqylYevivQZBefwT4FZ/GShyVaMtD+A
	E1r
X-Google-Smtp-Source: AGHT+IG18k04i6yd+3w9+a4LF8r3bj/68nzAYS3FJRGyOwOiHFPA+oaENwNeQlDYdFKOGHnIPYNxxRKsOoNLzUX4L7k=
X-Received: by 2002:ac8:5f89:0:b0:4b7:9b06:ca9f with SMTP id
 d75a77b69052e-4d34fd300e7mr1230171cf.2.1758581487970; Mon, 22 Sep 2025
 15:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com> <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 22 Sep 2025 15:51:15 -0700
X-Gm-Features: AS18NWBZljaWhB_nmi4xcbYeOCnxdVtC_xiK4EoqJwWbbbZzXiw46pHjGIXlGuI
Message-ID: <CAODwPW9Js2AjSzQrvRFMK3xHXjbb6qV2bGEj3GhYWpDELniyCQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: memory: introduce DDR4
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_155129_580702_9F574AEE 
X-CRM114-Status: UNSURE (   8.20  )
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

> +      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,10},[0-9a-f]{2}$"

I don't really understand why there can only be up to 10 characters in
the module part number. I also don't understand why you wrote "20
bytes (10 chars)" for this in the previous patch. Are you assuming
that module part numbers are UTF16LE? According to my reading of the
spec, it sounds like they're supposed to be plain ASCII, i.e. 20 bytes
should be able to contain up to 20 chars.

