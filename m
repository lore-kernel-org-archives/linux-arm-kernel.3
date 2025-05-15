Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BBDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=; b=EWlUpU2dqk7n2Ma4UlQ6oYexyj
	I4Iu6TnOB3i/NCKMNrvKG5knZFk4sx07UJZGP9+n488e/XSUI7vkQQK2nMmsQdFQ0r2MkIj2PPCwM
	umMzAQn6HuCHfOWFI3QLiz+q1WXMCM9CTNqYF54UBmJXLD178Rlj9640Pmcu1OPOZLgkjMXLuGOwa
	NALBCIBwRi3iE+0fLO2NeJ+1vDPz5ExTxvmkRn0rKVE8OOHKc17box1I85gS77cTN1lsoHX+IVPet
	JPeuPveymf43VfbLDmUL7suap695V/aJ6WhkWvogpaLWT8hVPEh4fm6oJA/w43JxTF+3AfZlwY+H/
	pq1d/xfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYJX-00000000g7E-0BUX;
	Thu, 15 May 2025 13:07:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYB8-00000000ejv-0Yn9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 12:59:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso9684775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313952; x=1747918752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=XrI7VCWugmmaKkcZb5CQmiaSDxDNBFBxKUJZNKZvvd5z0/S1kAh9PLkdClBfl7nnOC
         lF+2f10lsyOofFvZLGMc27UIDPUTc/RDWuuOiZpq5BxyMFW2arC7xe4FT78/5Gtdla0m
         RPpJOmypprSMC235wgcYhnMfwjPircDF7y4pTN9VZiPYLSRBvCBFidq7hIivIcEWAezF
         GA9IgCOvL38ul0Irg9+BU+GZA9BM93JRm8dZX6b7d91cYzPiXgdxwo4wxCJIDfYe+d3p
         5yME2IOqNMi57FJj4F360ChQ5Vp0u0/sTCsMAIWhrJkZY2Ez0KQy5K0GA+Tp7I9UwJX1
         cXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313952; x=1747918752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=KSNZHulIyyKJJr28yb/RgAqBuU8zAPtUh+lr1UTpNdkjFLyGTUqgzGqwJH2LqXiMOY
         Fri553rX2EdbXkfmIzcOj/Zfk8WbSNo+enfCyLHXfiO/KCAjh1lWz+AAALhQitJhc+CQ
         N0zKyL9GMOVlMy7h6Ltt9qYKkBia+Fe8hFB1JtG4S150kes3JX1mF8ZrOTBX9j/W0BA/
         KjcNmjScu10O2vVSDMiQeBf6ogxTsmx+n6fK/0vYmvr6x4uMNqB9JTVi2sQNZoEokNe2
         FCd6IFjvL6zNGKvv6cudEsJTplwBgOgTA9lXDVjcRRg+IjRgkga61HAHamuoddX1TT3u
         CGjA==
X-Forwarded-Encrypted: i=1; AJvYcCVl0OisqJIcZK5yTmiy0roeZgrzx8EeGrsTn3LdptmjzqdC2FoY9SAongj/JzFgjSBhdBLAtWDY/mcogTSfVtkb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk3pMjrBAN25NT/+k8sfOYFGdxqhDrWYjQAbAr47mkioxxReiQ
	aP7/3+TM7OHoCtI7eWsJXX7suulv/Q6oXgP7EcbZakb6rEbwn6z84HO2Ai6y/Rw=
X-Gm-Gg: ASbGncuNbyVpNJfzIJq5ZnrKEWOLTBt8AUKNXS5RiYoakWk1rJs3Sew8nJVxWiaiXaw
	kjLql27VhjzNf7XDd98YEoNWynPuWopHRJXi8FDSpTZJ4Xe1VYk6Em4wrWGaY5/rFHp41hYJiba
	JtUUgakdfBf7f+SWkapul07hyD5Dme+8ZrSwi2KMuIfGNIZyteBErXDASyqa2ZHJYXFmUzZ+JdW
	oJXVdS/RCJ5XYf1YU85+pS+ydBcF4Qkhtv0P4kAL00OhDuKKhHpKBaVGFjtuUtWrjhUmxa+igA/
	0lToj0pyJl/Ya5BX/gzyLSd7dYX1d8N8P6zgKiIi6Q1s+GA4aBdhNG6o0BfbY6OmlA==
X-Google-Smtp-Source: AGHT+IHpy1rhqw987Tuz+RK9oDjiZ/Y3wtsR+06Hh2lLmeOPW+aVkSCgkOsbFAx/A5adDBQ/I/BpHA==
X-Received: by 2002:a05:600c:6612:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442f20e1abdmr92975295e9.10.1747313952121;
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@libre.computer>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512142617.2175291-1-da@libre.computer>
References: <20250512142617.2175291-1-da@libre.computer>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Message-Id: <174731395123.3761659.11544664862448009697.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055914_434860_9FBC4648 
X-CRM114-Status: UNSURE (   5.29  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson-g12a: add missing fclk_div2 to spicc
      https://github.com/BayLibre/clk-meson/commit/daf004f87c35

Best regards,
--
Jerome


