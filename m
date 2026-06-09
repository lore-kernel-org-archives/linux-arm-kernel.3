Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D303ACD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN/Jy9B/0TiaOAqcpt4MHIDHsIu8QVblj/3gdv+TtyY=; b=tFU8/zZpwTDmdERJusDdKnqXLl
	SH6svfmUzIewPo/m2lY0lum0JlLRbICE9qhuAHRjKGPbMChAQmpA0lcGqIFuEm3iWPtUsejrVyKIt
	gM4ny42p99MUrfKSSAWbu6RvzdbvXFxEgG44AyrQZ6wupKOIk0TWtgW82+o91YjD99Yol89tw8aSd
	9qlPZ4cS6FTrprkGQEGWLwWzng07FPmAzlkdqgqMqjhZ77v9xmmFlfpbYJkTPa6zNZjXcc6f1WDUX
	ysMUpzqYJ6F2WEQgzErNBMnDlKQRDWQ9Buopa2b1b8q7T4q1pZ5SKvyfvxe925asxvNcCkkGCxJ4N
	0IcO4fqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tV-00000006S1i-1FOi;
	Tue, 09 Jun 2026 22:26:01 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tS-00000006S0l-20Jk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:26:00 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c855599a77aso3018035a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043957; x=1781648757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN/Jy9B/0TiaOAqcpt4MHIDHsIu8QVblj/3gdv+TtyY=;
        b=aAF6cdcqtWNv1PRIJdoHjtx//q2Njxnc6x0B5qIR5SLLiZ4Aq0NoOCl61yG7KlPIug
         k4WVOBjIilvOXndRDL9xwc9tbH3fZD6xr8yT/gaW/Y38fIJlu07Y6ZcPF03tg6wOpOxF
         aSo3ujtBtvjzoSVbxNeca5NXm2HdXUHGTPrSyDk2xoJgrhpRPOJKqitpMMxdfVcT+AIL
         2+di8LAS5MyNrupZTauYY5m0W/BRxw+b/HQp2PX4m/X0vOdL1VtO1ITiUGsalU0GFvbB
         DM+6RfN5sGh5YH/83v3SKMGRvk+UHRPoOmgX3QHl/O0EozW+sDmJFRrSjWjyiR01L2B0
         v0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043957; x=1781648757;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nN/Jy9B/0TiaOAqcpt4MHIDHsIu8QVblj/3gdv+TtyY=;
        b=IqkmylMk/tKwHOjH2YL0abXIYE0iLWDSrXH2NhXVpX/u4Ww+fpojV5/O3fLMVWl9N7
         s5up7S+NC+E3JSrNJ39vQseYbOuUe8OysY5r+Vwf12hOhxVHkaWBuVOm5bJN0xudwreV
         hyYJfgGWIF9ICgeyKAEAbY+r3/d1CQ2b2Z8uurNNW6SkOiT5ITsYPNpHLXPVeXFAv2h3
         PWeOsYGhcBjrLvA3Ld2mzVG7kN4G1iPlWMrio8zr46BRV4kHAXTuXPs5oIyn8e2D1Ogl
         zz+C4+FM03Bv84gbtzDSI9+BeKO+YoEINZdx3N0l6UvvX9Ypwze0pT6/x8uVIj7iLz1z
         F8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9V69wWb6M9MnScv0qD5NRpYTfvCoFlf53JOq/Shj+ft+MLnIXdJ0Y1Betg17m9j3dfJ9gGWFyHAybEsikSNloc@lists.infradead.org
X-Gm-Message-State: AOJu0YxsPG/AqEOSNnQ9ukGsw4vi3TWeJAy/WHwZgOcmsbWlZegmh+Ux
	lfbonfU0Hj6J4AqpSKOXC02ZpxdSmkwGm9/Lhrpde17Uxc6S3waQOYh8784xq02YsD8=
X-Gm-Gg: Acq92OFEKVrtQWUlOqUSroEOGUuUK86Coq5AqEKRG8IRXAutf3LDQFbzMHjPGYx5zBU
	QsJKzz6WvG9evqHhrEYv9B+G/OPRjvLzS+Yf1W9V5rDLHfJWoHoHnazdvzxLNOqHe6g6KZzB1sC
	5/xDO4o2buKnPb1e6NFYOqze9k3VF+N2BcFpHIhOqonljgHREn/zY2G2Hysuuq/0cGn5tIscrEE
	XFLZ/tUI5Q76Yo9N75jAMUho8lylyXneLrl5FFrbND3j8oMOBXGc9a/dv2L83DEP3yu7llwtRXl
	rAcAFMDLiwkQBv96f33zpjUXKdk+xh71OdAj6CpY3T9oIg4lYfDLctqACngXydkcF4KHr667CDp
	JZocnpZ4mIA5hn0ffYoEwX54wL2flXUSZckCzstYiqR+jtgXWpzV9Ta/KBwY3rVVu+vigSk0dkp
	Y/hG4ahpC5yqWF5hjrjWxfgiAKazaq0PY=
X-Received: by 2002:a05:6300:8088:b0:3a0:aee6:acc1 with SMTP id adf61e73a8af0-3b5345cd84emr6242857637.33.1781043957586;
        Tue, 09 Jun 2026 15:25:57 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85df0bdbe4sm19516834a12.32.2026.06.09.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Mithil Bavishi <bavishimithil@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260604054048.18980-1-bavishimithil@gmail.com>
References: <20260604054048.18980-1-bavishimithil@gmail.com>
Subject: Re: [PATCH v3] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Message-Id: <178104395668.234140.12825758789646628656.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:25:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_152558_519456_ECBDFC88 
X-CRM114-Status: UNSURE (   8.01  )
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


On Wed, 03 Jun 2026 22:40:48 -0700, Mithil Bavishi wrote:
> With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> because omap_pm_ops.finish_suspend points directly to the assembly
> routine omap4_finish_suspend, which lacks the expected KCFI type
> metadata.
> 
> Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
> routine carries the KCFI type metadata.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
      commit: d58849ac304472fdc75f44c468743d75ca75c2ce

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


