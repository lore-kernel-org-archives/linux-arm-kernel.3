Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3063C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=; b=3+beegLZAB1fVZY7h2uvEmkTwz
	nCC2OZWZQ9f7bUZAa5zkb6oJnqcbFErlSZrj+LQbHugOZtxNu6ZWTtGZ+PK6RcFwBiJn2bk/CFx0e
	z5uylNm9t2pUTcVV/O/ELFSZAP/PfoRzB4kxnHA97/ttU3fm1+DnU+0oWiFVa1qKD38a6aWg7OEit
	CSugT6N7pOqZ/lkZ/7LOLG9BSsTUgv6dtLprmtxk4SMCdkm4ufwodomckGnOWZoWNI3tCnCU/VeJG
	Q14rNUoqGviKA+mxJZ4DpE6r7aVdWo2VptACKTFhAr8WLX7+DqdwU+4ChiZDMJbHzjeGFutGBmxHu
	hzLyCFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUKI-00000004pdV-14lN;
	Fri, 09 May 2025 20:28:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSt9-00000004ck5-1tca
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 18:56:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso13430635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746816962; x=1747421762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
        b=HznAcXjI0faantbIi6hVOxubb7/ee+/iMHurpcne9oy/JxrbyEB7CCNr2CIBQYzJ0n
         lZGC7FkmnMBAYZ/D8U769N9PcaoBP2XAGfZQKMl9P6PTheffxo/rXKHyxBdSK2ixgcft
         X9MFi6UTVAvmFAD+6VOI/q/SywMOAR6yPI31Bgy2SwykLtjIb4OYeKrr5yOryMPfgZzG
         iubcRm8J7LJRG3zTZDM1sba8xKziBPe6mmEyccw8rmsjVT/Ov9z1aAAdIep314hJ+1AB
         OudfrducIFp+YqvOyni/S4Rkk8iayOuFsEvSs7j+ggx95+zrWE8wZYpRF7tkj/hvQj5j
         62Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816962; x=1747421762;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
        b=MRUxw+FbhzsJ2bPpNcjepufr5KIC2HLs7WbBn5Hd8pqtqECreFMBAN0BmeTVq7yfyC
         RqP5g7RmidAdTjssXmdRefumjf/xP5W+wCxj1xnKQcPYGIwli31yQ2Nqq9o4ZDJrSZM1
         mxF8MCIqyxv2CzH0l9B+VSXipL97hLq2LIgPKpJ0iBV9Ll7INYGosP2rzExhLPaB+zec
         etHlnN8LZ7IVev4oBeNwgayukShuziCR5GI/5qld6R6K4tX0CWtkpgt9DVsyVNL3CiVI
         g6Dw+U7Y3m19siAHdaqB2ou73koC/gKT2h6eg54VXv5kLh5i5HqZ2XTa9YatiwC4is4W
         r4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWVJvg3YDXa9pnLOtI46VOYollxaNwFsn5t6rR9uPD6KD+m/dOWXdqgv7Btz2rIR95jlpB4q//X1Tq2t4QhevBM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0zp7GRR5ev1dbgwKgBEIvub14eL42EkDcYOiEqZjd/2I90RFc
	3eCsVu8SChy1vZcgIM2MFxzpnAxmZkc0sEM76gU/441My9mq/u7JT/FIGlHMrR0=
X-Gm-Gg: ASbGnctjBOujeF2k3Ia7aCvNl+9/jwvp2n3YyKiEgB2YGvzSBYRghWn64TihWvSD0Hr
	Z7Bxpi46zopplAv1x+Oe4fDLoeGN4JAjnr2tmlfwIrgQLQhMRxBVIJdI5sfB3dFWpU9YgngCkRf
	S3yqCpm/0WQ3mwLjVD3EhMNbqd8bc17Q/ANtViTi6xC7+nr6yYI9Oib2vDYLAUEBAEHqyU/Leih
	JUIaRTG9i72S0SGO/h7zRZAGvC4sb2kg22aiYzaQgTmFZLqCvbApXW8n+c51D7fDmyLh3PIWJRY
	nvUdWcwHOGDAeKrp6J6nCX8rwig76Gl5DDq5AC6xR5JeqOT7n2IEKruNK+ApGqJwz+21L93Y
X-Google-Smtp-Source: AGHT+IHYQkpkKi8CkEHzddCWOZceMUv66ifC4WqdnYwF4TBNK6QI+OtfU0ViTWxy69iYNRZgfgnN0g==
X-Received: by 2002:a05:600c:1550:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-442d6d6abfdmr45281565e9.17.1746816961791;
        Fri, 09 May 2025 11:56:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm38009955e9.37.2025.05.09.11.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:56:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
References: <20250505184338.678540-1-richard120310@gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with
 mode->clock
Message-Id: <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
Date: Fri, 09 May 2025 20:56:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_115603_502064_62CAF4FA 
X-CRM114-Status: UNSURE (   6.75  )
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

Hi,

On Tue, 06 May 2025 02:43:38 +0800, I Hsin Cheng wrote:
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: Use 1000ULL when operating with mode->clock
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb0851e14432f3b87c77b704c835ac376deda03a

-- 
Neil


