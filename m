Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178A3D29C36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=; b=Mr/xDfI0izrYLEz8JPau9JOOH3
	toKL/qbYLaBtCiK3awelqB5pcRhN/mj0OdH6UQDuRYfdR/JKMx5QPlOaT361fl/LpqgGIZWg1qAsj
	iiwogzkopBAfWAEk70eHwaQopQsdYuw1eGUijp+OEk0aO2uoowWtI3pyL4GEXqE5LggDbW8S3sw7b
	Arm0Qyri4zwKLfzj7lLPXGZ2EvEVWMoNfOuXbCfrRg1eFRiqnEvVOK+AYX26NiWjepn4z/IKCsD9B
	bGTkRrO9lLZFNsjlWccy6NGSTvWZRDtil/yNVBsrkz3R4LoeTZFNQKKDOWm7Fw/hBBelsdimiDZbk
	JCW+UpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrIr-00000002Mm4-0Ep1;
	Mon, 19 Jan 2026 15:36:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrIi-00000002MlI-118e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:36:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so24079825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836978; x=1769441778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=Js5HeCZIiq+CvYPEnhRa8JEd607kP59CLqu3aiEOReHXm8/AILmNqJXSgoddH7QDOf
         iUfBzcBaol5pS61f/I32gcuNusB8wmdPH9RY+7goD7oEuC9j6OcsHILmBtnPBspG4wtU
         fanfR1R7lG+GO2Rb+nRjGepiwlawO9D7vigwHoRzGDx5z0UaiZoW5BjhIchI/w9WaVoQ
         VBKfn2HmzUIt9KRp5wm/27RD4wxxkCpsjXYicy+aFHlJPvPVU6C3mu8sEujz6GFuHSV0
         RnFeMC+m2965UYfpTGTc+uVK3rKo5e5YYViGGUok+sUNXTMXFVOLnWFeGqjjTzJTqhvk
         eb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836978; x=1769441778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=dRY3LW8eMw8xdg2TzJ0sRNlETk5hi/LQW2PlKt34VVQNRW9YULGjyNhPK3aZAs+3ME
         R5jOeDZfy5Hqod85Kc0sfYpIAOwqhnGI7XL55cvhr+nqtyb/42JU2ODE0Zw15jx9Qf0H
         Pr0kp41tCeusyhniIoHtfRjwSz4cp/73nElcsLf0uu09gUAheFIutEaf7fcKMq5iH9ci
         Pea0Etak323+EfV/5hp1PU6IDzbIqpkf2sJEIfceun4cvIiBOECFmNT8KkAjTi/UmWMI
         fwxUfWQlAzm2quL+4Q4xi84Gr6b3fclIDXN/jQyQq1k0McHCKO3H1Fp46ZAJbGkwEXYi
         CnuA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ZxdrqXlcxhzX8L7ZuiTowOdwwKoqFRKenJfL/lWdUPMcBDSbTpprAo07fOu0J/bElvwCHCDUqryqFDOWamYh@lists.infradead.org
X-Gm-Message-State: AOJu0YzkSd/MSJnTmnG0QZ28et+k/DvYbtUHNc4GSJ6FGwg+rFCQX4iK
	fFCtFHSbUiD1q95+zEAYBX6lOQZLMjk93qfttEQKPL6Iup4t/omAe/ya
X-Gm-Gg: AY/fxX7cg5YH/YH+WU7obENMuNpJMIUy3zqkek4Jc8oQyV1i+nvFFaV6B6U7F4c/rqj
	0t3UCSfLV+UwHE/atzizPuV3I3SgRUXAqIsgaRfWgd20kdToJV50WEbx8yl7vv1EGBOQWcK9u6H
	sTuhvONrlK4KCh8izS0gyMelt6LWTPbSnSAE+pcolYTPSh0rI6NyqU/U95N/1r6znbJLeIYzeF/
	Qz9+YAQt62qhY/cQpJWboQqTR3F77WaD70Hn5AuB6e+n/PkxATBSzwWSMAPJL6ODiB8zyvuaac9
	iddkaESlnG0aZRwDhTX3tT4b2xQFEnJ0RL7caYu4SyY2HfeItuU4ozY9GfXIzOw5DmL89Tb9SSn
	pwBXV4O+YrbMioH8UHyw+cZ/hfi5oM2fYLnOowwsWUEDhaBuE+4JnI7xG5cwHIKqfQn2HW+CPaG
	URlt+ubocMygyMJsw0rTKt1ztFofqyDshgLxolmGlxXkIsuhWLuuDyR246c46bvy4J3ANY
X-Received: by 2002:a05:600c:4584:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-4801e350af0mr140088985e9.33.1768836977812;
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-4-198.dynamic.telemach.net. [213.161.4.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ff1sm23614533f8f.13.2026.01.19.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
Date: Mon, 19 Jan 2026 16:36:15 +0100
Message-ID: <5957177.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_073620_283944_3903874B 
X-CRM114-Status: UNSURE (   7.94  )
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

Dne ponedeljek, 19. januar 2026 ob 11:40:19 Srednjeevropski standardni =C4=
=8Das je Bartosz Golaszewski napisal(a):
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



