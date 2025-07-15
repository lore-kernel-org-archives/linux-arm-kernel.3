Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FD9C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=; b=N2Eg/D7NaK0rACibccQNQwOUnV
	46I9zebGyofjL2oSCm3T6K1crjgbPUd2jhkNqhn/OAF7V5ZubxBviA7hyQc7nvyKKKtHUxuR7uTmG
	PkLS0Ddhv4C3o9QLubCB68y5d0878lrcQe/yhTA9/mUvtCCkrGJwyNhE5Nt7fUihgGJfGIFYqHWsv
	g1rHWwtEylHEuYiZwG1I/O/WewqkLwbU81shVtfxDmxI5ovEiixCPu0CziMBxdp1Rb/j/sh9vlNjh
	9lozITbcNnYlHrGM+6AADrDOKbsXClPpg/aK4MADcdlrQUMrZKy0LycERrDbYSyqkKIgpmAk39i68
	j8NF87pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ube8W-00000004ysq-49C2;
	Tue, 15 Jul 2025 11:47:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdst-00000004x0x-26S6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:31:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3084029f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752579102; x=1753183902; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=;
        b=Rsv0XhbGnV140uTOHphDYPc1WJQMmo6Ruz8cWt+nOiu6HnzrGv7R11389nTHUa/kRl
         5uu9woV/8uqZ80VDMEkcDLsFUH1BNdA6gi5DPjJjmkBBneWsNYjLGs/FKqujA2cix/6/
         jz63Bbgtery0QjMn2y6rBOsV+qnQehSBDa9ISeze8+0abPwpOzkbv/ddKURiIJM1mIpN
         VCELavDuKmS97ETP7yMhW7mVFUhx5m3SUd2pPty+pbLXZE3JErvN2EZuIdUUHlNtPTDl
         izPVNZlbH5MdOW4XSAddcyeWmtFpVWvjNN4ggYbSx9rTWbzsUQhbE5AKkaFGj9TLPkvP
         bJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752579102; x=1753183902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZsnxPQOlzjyNW6a1iVcFG50PC2MlOpTArybpzvfKj8=;
        b=FXwOtyp1t9z8MpXC3fb/GFUaYDlzpi9D55sw637upxEmVACwEyvhOhVCrp28wTW5Nq
         /m4YLgpUCVdVqA8S9oxgXQSbms7t+Hhe2lLTaM3ugMKOim5umJv9CyaUiv3xutCuvhc6
         iKZleaBQ/rmlIzCHhx+UESkf/yeSjPOboRjO267ONZUK4nPvqcjQyAmTExdGPe6uLdeO
         ljB/HD3+sCArvqRryts2aF1s1RCXRfcbgx+I+HGt635Pk4URFsrafBKlWMh1IT8kcX3L
         ZovnTW9cShiuAQzC8cd+SvgU0BRwoQTIXE9f8Z1GE09+Eb9GkMuOMOMjQfkO1/XG/DOh
         5I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZZzkix/liySdsPskIdVwmx1AtjT9w8PGN6RcwqUIVV1FmaizAyP8anGyRpS3/KH4tgCF2VvXdlKOP6GqDePn2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/QBB0HeNMbtBeJK0yphkRr2/FykL7yE8momVN37fBm60bNfjQ
	IcmT+poRyN/eki3ohwd9BgP2YTW7CkaJf+5CgZof9qok3VQ77Q0R5fQ4WZw0rSgCKwk=
X-Gm-Gg: ASbGncvrWtaDS3dn4qVd3xWfHXqO6trsIIFgcgTOFuQVB3UScH8XzvXLMNpfM7u21aQ
	jetAqdviDs6bxhoUstFpSf7VNsUoo8Hj5fikS0/aQowIARsW0tNhx02twJxggiA58W4DXzhvA+a
	sEZ+jMpq7RiRioz7hyDPTQxrjlnsImGC4BIKGPSSu8mvhC7IzbEGCcKRPEorlFdBqgzps55X3Rm
	cfrUAxvh3JTpiHgRKSkXvcbw9JsPOAZjTDnhAHVrgFqQThEZlLBh1XMOhwk68ycz5YGbFi2WBAb
	DrfVT/HU64cgNIPpjXLd7MW16A0sOFXBVtwaa30FUicy8IML6f0HLppbed4PasPQ+Cd+3x6M7bT
	W3fNmOGJznYeM5O7pHYU/A+qTThW7SvogMJEQjnVI5sqMo77bFl7rl3FwLEy3
X-Google-Smtp-Source: AGHT+IEKhxXOiGy+rRPRZDHvcFkEUJsQ0d14+0tBKDdlW4a1Tc6Bru+r7zuXvqC8THzAs7ZRIPDvKg==
X-Received: by 2002:a05:6000:1446:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5f187a4b4mr14608177f8f.7.1752579101919;
        Tue, 15 Jul 2025 04:31:41 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2025sm15173960f8f.31.2025.07.15.04.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:31:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:31:39 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	tglx@linutronix.de, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek
 MT8196 compatible
Message-ID: <aHY8Gyo5uy8P6VP1@mai.linaro.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_043143_546358_36F1498D 
X-CRM114-Status: UNSURE (   9.95  )
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

On Wed, Jun 11, 2025 at 01:07:58PM +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the MediaTek MT8196 SoC, fully compatible
> with MT6765.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied patch 1/3, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

