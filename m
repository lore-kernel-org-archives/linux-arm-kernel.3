Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FE9CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTYhGjf59FOzojkQYZl3sby+TGLlLgSbcHBtaYliquA=; b=gaOgh5Cyj8lO0WSPbTBjhQVJ4v
	VoDdLnGIwZw1qILJrJGVfS+QsD1mzuAk/DjQgM7OBYUC2wLQ4EXnBGdMZeCyoceZ3Ymn1Wzvnby4G
	9Hw7lsH9VuRcR8oZufBRrEA2OoJKh4ge1PSwdTltIrvjsIGunlZmfczZ6lFY2YySJq5cRivCwkOSz
	kD6Viqq27VPEGfHre41QrJrBoChIUPyGz9cMliZ3/FQ29AW+Ci4CAgiU9bDoswmT+rgjCYfQovI+W
	PA/KsMaQ5J9oKoOS+trQEIpz0oKXwxqqlIa+kOzC6P0x3O6dXcySarR5UHalDR3bWtLDCjmwMGGXQ
	3eDK1Pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYri-00000002Fs4-318I;
	Tue, 02 Sep 2025 21:48:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWKX-00000001YRB-44d8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 19:06:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-248df8d82e2so48112195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 12:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839969; x=1757444769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTYhGjf59FOzojkQYZl3sby+TGLlLgSbcHBtaYliquA=;
        b=kdvVb12rKaPB4iap5bL7DKCRiOVrpc2mqHvWwhWm/ImIfPEzDSgDzZfT+067fVkwhN
         aty5ba8wd8J84MkorS03VQKVYKIrW0yRSl3QnkoOEhboABse2i1dhJB9DpmmueN7t6rA
         OY94K3KCbsuxMiz6RtYnArODTI7/M339422g1/iFKa1P+3IEHpgyEqjrzrTT7ZNsjaRd
         zlRPvutxRfJbfoejL1nhFrksSE0hnLJdFgj6xkT3s99Q006FjS05M37YFx1nirFUcaMF
         Nkq0U8TWTbObpf/x1IoaIgs1Yal9bSN22ZQFX+mdiefM41/zHsh1HUrgdh3HNERDa6nW
         uCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839969; x=1757444769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTYhGjf59FOzojkQYZl3sby+TGLlLgSbcHBtaYliquA=;
        b=tpZA7doTGT4DVNmC00GahR2DKP/3EJ/C7LHw19B4gXrXEC6MM3zeHYNUWwOuqrO+3v
         BUC/KCSnLPURSJGuPkxjIF1MB9xC7P9ur6xqaupln1uAntFy1AWnXZeEnqIEnt7dTvei
         d7JYTaQ2k2P/OcpJQlPozy4w5S6OjRISoA0oHgdWikm9RvtKl7YartPBNRZGgu6o3mv4
         HdFX2rK6MUt+RPtOoXGC5gACnwxw06kLsR2T7nWF/dp/HBePVT3Xrq0noAu1Gi/AIJ4f
         xgdmjae+rZQnBJraPdlHSVvj0C7AZIi0ogYQaqbIo0Nf+Tua7lMUfe8PgxKqY05x7u3J
         RMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZr25p7BAykqsrCI2JetB1i0mu8BwdM6WPgDwDdv2w8HgOPnmb+sXlElmz8F99QITPs2tCxIZ7htg05IxgeofK@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+KyfURKBet0xxJM+PadKGQnqdlfcMEbqvuhS7Ln8xrOI0AHQ
	uYFkrbRlJrN87XummHHUe7GB68oxwHzxngiFf5+IkLVO2NTCmzGBxqlh
X-Gm-Gg: ASbGnctaLnv7ahgEe9qZny4WHVbmywS4PpW1XHsO07Q4d6Cg7zK/GCd2izjC9EGd++G
	mMYz3cYtN4gZwyvK8qPgDLXKSCY2QcAmyr+G8mPon02dpe0Z9NQaT2CRLQ0O0OLhkvoiu02q8me
	wn6sDFGpD2qlPtTlVxQ77jAiLmhTMM3NwKb240G34FGnagKg6m5nzc+YccJYzCQNofHs1KJS4W2
	ayryxWLvxRARpeBKssW4NYL5m8hYLD3aEYlGgn2pWdc1T4bV9r+E74GdlUJKO6IG86teoKn607w
	TwJ6bHlkAgoiX8pUqiYk6fUswX+oXzld0IXAPXs9G7E/u1tWCB+26WvLyMkV3TLoucZfy0FRSAh
	Z/QDq3T0+nQndsrzhlfaHdrQ+ERDRoJUmc7U=
X-Google-Smtp-Source: AGHT+IERT/MqYFotijaEkUzYQ+YLdKWS60k04RbJW7KGsK/vv7QzqmvdTA75hQHLiSjI85OXVRcszw==
X-Received: by 2002:a17:902:e751:b0:246:b467:eea9 with SMTP id d9443c01a7336-249448f7469mr161217285ad.21.1756839969172;
        Tue, 02 Sep 2025 12:06:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0a4514f8sm33408505ad.143.2025.09.02.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:06:08 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:06:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
Message-ID: <183810f3-579c-45a8-970a-51b61ddcf548@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-2-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-2-837ae94a21b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_120610_006480_61DA5AA1 
X-CRM114-Status: GOOD (  11.68  )
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

On Sat, Aug 30, 2025 at 12:18:58PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
> and s3c2410-wdt platform device name, so drop both.  This leaves the
> driver boundable only via compatibles, so drop any CONFIG_OF ifdefs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

