Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9CEE87821
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=; b=b/sO/IEZcrMfdQsU2qeoJSoSmd
	dqldoiAXzIhwXI0+/n6OhBaByVOWaJltT41Yj6KWASHqzfwX3+jWzZu9Doz1pN101NCJT777We5ae
	UaAqeH6hmjZ+UZn6pxUzg8zwUYM0ZSiDvPSGEoAzXIvG9KzVfpo1f2BWVNwu6zaiAvoLYgv6gVZxU
	o3LDto4pIsrmii9GS/PmCdqUnEnzgfXlDmf7qH4H7UX71Geze5ycdJkmbUni6GIUEybNplzhPD7hU
	1FfJEeMu8CCzND21SXBgbV3j6CtKAFleodPNhZq+1PrElXOv6fdRSw319GeVAp8jYbxYWeqIW3Mch
	+PSCUHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG1C-00000006dAN-36g6;
	Tue, 03 Feb 2026 13:00:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG1A-00000006d9z-1lYf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:00:34 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso8595637a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770123630; x=1770728430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
        b=A0ekiy6F7052ORJTDkYB/qgFthBK9g6De6E3tsXTiy+8n56ayNEbzkDqj1Zv4g4Esp
         y1ngQWbgYhXc2HPf5u3WoMcFRVVMve8mFUwtbQQSiE6LauwUu53M2AG8IVDkpjRboSrW
         d3bLg/up91tgSDxpX/L/EuhnzycdK4C9OLr8Z/97cfzI77rLTU4OL88lGht3HT/7Q1N2
         /O7FkrG6agVHiItK2TjPG+fX/PZSi9uBQxoSZXmlqbw1RuYlq9cxC8eYsU3avb7gBlqa
         nzNc2MtusjNgTPXz6w+hS6HYEkgaTV9Rd4cbWITYrrViri0EVHEiY7OokD85l6JayyPT
         YEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770123630; x=1770728430;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
        b=RW4Z6SSEE5SjfX27d6lUw64gb1/s3ztPGC5r1UQJE9TSLbFp7bfdaF+7gtwom4v5vT
         QI9pGGucXF9L2jyfSh/Nc+KIu+5tWZqJY7bculBdiUfTCKMkzbzUYZP8TxVMgnul3yE1
         9ei8OtkIh37/bXk9wcZadmGohhLy1U0Wr1jI0q0zEfWtWEc7erilB5cgqq7F7p1tNJ3L
         eZLpQmbEq5jl4koBVSCM7qsmCyu695mfG0aPs90/J35iZdzyRkMWEEb/RuaEE9GAUZGQ
         TbAcZ99GGDX6mVedKcCNs37fF6Q0X712rcDi4FGhijOg1/GCgW6F/mHwehT00uIrmQ/x
         qUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkLuTqzORoNd3YDAPuF5u2ntNRGxIZkwl7lnaZUpoEN24I6F3cL0RCykoM81AE8MaQRlMMz/EaQ8wIoVbESsoz@lists.infradead.org
X-Gm-Message-State: AOJu0YyNqUMDzk/XcG8jznjG/U4A3dPYIwHfQsBvZqHDL1EGcaS5kavn
	pkyEuSQRSzgSaji7sRdFQZw+vhXyVsG+vefWhy0CapBoje43ShAL/vZN5rZ8nXsPgy4=
X-Gm-Gg: AZuq6aJPfrdE2llYwrQwXBDzRcclvs84KdX05KSQFIAnURH4htf9opnoRDmem86AUst
	8FOMKSDiuImLA/u1A3X0BRihoA3qXdGDkZYHNweC+9FtSVn3o5EhVvkWQ9g+EMF6kzltHea2q0V
	VuTW/WDWSkYZNYAqgcVJdhYjvs7ZjrtFeQXhVCr0zQ2ZwkyoMsXeoJgyDZP7d3GhYUTvY65iSmK
	A0ratFEEED6dbini8XzDdDLzENMdBxaVUChx9hl9JyHhn4r1N6T3GE50xcNUYP3Rfxa000sfgz5
	kS8zpTNU1idb+kWDiBgCmdKyH8Lgw662COcAD3M4tjWGxta4j/+id2sQOrauJ3qZaV5KgzsMmIx
	Eaq0kFmlVf4ga5Db2+wyJfy8TLoLaKgms2G24Gua/wy7ltSlCuTAeBBL6wG3WP8T/6jrzWOl518
	SCQMtL071TmeI=
X-Received: by 2002:a17:907:1b20:b0:b86:f558:ecad with SMTP id a640c23a62f3a-b8dff5260f2mr877455366b.7.1770123628657;
        Tue, 03 Feb 2026 05:00:28 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c5b38sm1024503866b.53.2026.02.03.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:00:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1C5C05F841;
	Tue, 03 Feb 2026 13:00:27 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
In-Reply-To: <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org> (Mark
	Brown's message of "Tue, 23 Dec 2025 01:20:55 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Tue, 03 Feb 2026 13:00:27 +0000
Message-ID: <87o6m6nfro.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_050032_508717_EAAA349F 
X-CRM114-Status: UNSURE (   7.95  )
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

Mark Brown <broonie@kernel.org> writes:

> Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the
> information in DD0601 2025-06. This includes somewhat more generic ways of
> describing the sharing of SMCUs, more information on supported priorities
> and provides additional resolution for describing affinity groups.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

