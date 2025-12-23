Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3EFE6FE51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 23:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5HLf0q/HBK2oOHSdb4C+e4jou+vH5BBgCwzF7L7zWA=; b=YHhctjbnqUuvBiAlE1RgDDMFUP
	xp0aD7y0Q+vrXwhrgRHRqd6aGOqACP6dzjzzgVq3+el4tM3urn7MgoJJUxDDMv3aYTh/PsKNBskbb
	F/zbZbwKQS+gG0vfDTTs0Rk+j6vfm5ycOIhwFb+6GNOfjq09PP0AOPY++hOmta6YjvdHXPo6RwvDn
	NUfvrHpOwYGefPZxGIAJ6xT+RCJ8k91cul0aTH/pwYMGia5F7gpvV71dzy6we6TCR4IvQa+HUj775
	0xe10BdYIZ5kneIibexic4039FD15rak43FfLfR0erlkUy4BYYWX5vKSqMmgO+bnCZzjIDHNZ//Zg
	i49rDKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBV7-0000000GAYR-0KzI;
	Tue, 23 Dec 2025 23:09:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBV4-0000000GAXg-3v9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 23:09:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0fe77d141so58435585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766531346; x=1767136146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5HLf0q/HBK2oOHSdb4C+e4jou+vH5BBgCwzF7L7zWA=;
        b=kXHiZoDrJfQ47oVnFVohl4oJwiF9/3YyR/QI6+Kb94E97Ek/HnteoiqqCRENdjq3zT
         NZ0Qe8f2aw9Riu/U5bNqG5+C/aV5Q0hKbutN4PpJ2Yx0dQOxnS/wsD2k3kWgXBtx3SGk
         rD2Dx5d7OvjNy83ZXmZdZQPF/N8Fdxf/4ASvcCNor8OjT2lvQpa+PJow6MDsylVEM/Dz
         QKi5agIyOTOn7cZMXsa27/da8Zd/SuKJu6fWY2EJqqkmXhpV5NK4fL+EEu9JmMlmEh2D
         gK84KxV9nFB8PFmRIZw+quv38N95tkGR12ehG10e7ydjowSeiNpXIHBbZWg03V9DH/sa
         4Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766531346; x=1767136146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5HLf0q/HBK2oOHSdb4C+e4jou+vH5BBgCwzF7L7zWA=;
        b=p3WeKQ58HnAWcbIZ5180Okx4062MxO8T3irBET4IgeZ6mkOYki48HIDgaL8IA5bms/
         AVz3eX5ghG5FrTVxVs2cI3brgMp5O56CFyhW62U2IwCikyJ4DLlgar8P0HFFUC1zF7pX
         YCB3/te6jl6grOnlrB4fpjz/cO/0MBdUKhmj1m/CApIlWgY5BfgKeVU6vw+N+i9iRJPq
         XjFcYzGrnqQMJsfAFM7nGTWIOeYi+jMbqE5cCoyaOIyquVi5gxgWpCCwEYqr41FsBX8S
         PkifugLlqdSDaeKW+SraBW8yAKHVyl8G7qCdE3tvxfFJuJxNt3bvuFbQVCFKKdlNkPrA
         NjtA==
X-Forwarded-Encrypted: i=1; AJvYcCVdXSTcvK+j1GN9GNUuDVGXjj7kXMm+tsjweVVRXf/2TQgDX3/XsPEoWAwdWNi+ox8wtH6e15I8sAJoTInUwydN@lists.infradead.org
X-Gm-Message-State: AOJu0YwI1U2SPX/muDFm+Qf8YaiHrLdVvI92zpT3brp0vvyxIyx8UeLp
	ElKeozlt5wmqMWyn7/U94ZkNR6snaYj9V76FtssmMJ2nOoAPQeUdPKIxmWCD8Xp1pifGzwoawYt
	eas3w2SH1H4llrDSN4lP749IIszNGt3FkVpMY
X-Gm-Gg: AY/fxX435HP5tJFhav40yPoqJV64nsL6+lAtKso0GbDyVCLL8iPCsZKJ9WWen6QV0g3
	XbWQ2tEoAtZ8tqPchgQyX/SYMKHPJtzeKm2/q+GYlEvwgb6GNKkF3fuGhxkTQshb1mlarOTsoaR
	LS4syuFoqWAuFLMBy9ds+1ZAySzvprSO6pK/3YCxo+2sZSyPdZsiQ6cUdGVqXbKwnXURbfo6I30
	aEMjFclt1sBWYP7busCc5npaklLTib8HETqQkrQbx4wiqWAiu68I7iOqJXRVXG9RPCUr0c9mqqw
	Rcx3rMcQMKpBgYjxfer+hgXJuw8W
X-Google-Smtp-Source: AGHT+IGBrwwKbPhbobxkI6bshU6oq1etWG3LvLOZghvlBp/QMqJduCm7VfQs3SMLxHPscaSzyW9EW2Lww4cnklC427s=
X-Received: by 2002:a17:903:40cb:b0:2a0:f0e5:3f5c with SMTP id
 d9443c01a7336-2a2f283109dmr150600085ad.34.1766531345642; Tue, 23 Dec 2025
 15:09:05 -0800 (PST)
MIME-Version: 1.0
References: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 24 Dec 2025 00:08:54 +0100
X-Gm-Features: AQt7F2ohr65ds1Igq3hU6u6MsL2NTAZeKeUfhxNv0PkSbOldUx4jDRZ3zotUZaM
Message-ID: <CAFBinCBt-Ra__iNTPP2wqbo00VThDQrs-sUWvBR_FisgNwc2kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: Use hyphen in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_150906_977766_5BD117F3 
X-CRM114-Status: UNSURE (   8.15  )
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

On Tue, Dec 23, 2025 at 4:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

