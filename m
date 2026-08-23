Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D27EC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 00:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnfycOpIeVLKHmflGiUF526cXqauQ3cReF2OjuRBrdk=; b=gAm7Xp+T8b5SD1yRqv51iHR0GT
	Os564YDDycNTMUUudaz7i5EjHyDb8MGkQhzqyXETUN4C9X6fbkOqPrqeGNOB9s9u/kPAlrbSWy4p4
	u8gbwRJc3VeD+dXRFWiU0SNxs3cGIalHZEEXLoUUtc9FaMA1eDvD0G0CnVVL9g6BVDgQcTXdn3TgR
	Ujap5jHcMNAfOjx+V3Rz0rZ23PD6WnO8ML8Zx/2ltI8OWFoWFDAE1aTyg2oVJTxWwqdO3hHzBwnSc
	re2DWR7dI7bBZKzhNIYkHbhrCVrqQEHWgbpPTKLIAbkn9wzy2uJLVCuC4eq1W2/Rens5FxBSydLfV
	3uy2ZeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxvzB-0000000Ev8b-3G5U;
	Sun, 23 Aug 2026 00:22:53 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxvz9-0000000Ev7s-23zK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 00:22:52 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c15d47266baso258185166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 17:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787444569; x=1788049369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnfycOpIeVLKHmflGiUF526cXqauQ3cReF2OjuRBrdk=;
        b=ktLZeiQ3R6PLIUs0QNPgLUVOcj4mbqJSGK6JPzXWzSCfg6SnV5fayypsUoGl/oGITg
         2HVHvnTHVORmAi/SzAx4wpjsog3jPHN7wsTPL/CjNZRFUAP/1TB/p+3aNV2muKdJi4R7
         t2iMU5gtDzDQ4r+7X/NyTKB99g3J+g239mDwOzW1So2h4cY6erS+FgWSz120M1Ft+FT/
         lzKnprVs88WCwyEv5opOO3eiX6BW7obnsfwfM0WiNjgVBVEwJ4DZslk6edXGlqm3Uvmr
         nKXUu+0WqsdeXlX5YFLqj4BwhvJFMtWpFwE0AfLzk7wrYzXF2PbhtMjIoRisyfWtaQAJ
         eM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787444569; x=1788049369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PnfycOpIeVLKHmflGiUF526cXqauQ3cReF2OjuRBrdk=;
        b=C2n05mDfWbuvZ3SMBBuT8r8Iqadj9B1LVY9v9TuqfhcnWfLx8V6IsTlxnxuAuZphy0
         IkMsDDmpPXejadALI6OyRAgd38x45uA8dQjZAHMDmzE5fgS4+3gZNgujfehw6kT1gVwo
         F5EuhUKcMjTmZjiLp3uhqQwq6S8ma05yxDSzl+RGYZsU+8xYd9OPsqc+JeHNGX7TWQxl
         Po8cFfP9KgNBFukzkWeZ2Lxlmy7HMCoSYXj+dA6YOiOYYtAQgU0tmMCn5P/3Bjl2TGPz
         ZFMCq7Pw3Reuf4VsCXIcPCjlPnzTd+5a2XsVQpvlQbOqlAH7LUd1nevN7rflPCjRDWAD
         /jow==
X-Forwarded-Encrypted: i=1; AHgh+Rq6c5TQNKGma64C/MwkU/etI5x3RHNSOt7wRJprZag7Ok8qOY3q8KTBFlkG1BVwf7fZshpEmN8sh7CuaVEmFnG6@lists.infradead.org
X-Gm-Message-State: AFuF++lYU1VTcbehqFgBK9MqH3BInhSelZFzLNzHAmaXWi8EnhTXh/oV
	vYr+mI187x68oGBgEyN/0s9bPP0W+MDIUrx0+qBOqPHeDmvEN04odgXLp/zzyGWeskY=
X-Gm-Gg: AR+sD11Mg6qN837CZ+mfR/tiJBvOWE8YHx2kZE8gmABgxpyLY21NWwehqr3ICoeMhVX
	J4ov1Z/1QusYPXuQClDc+WT536l39sT7W6qzCN8JARVVa0vzdivj2v6bs6uTYG99qmrEdgH35rd
	FiZMOv5UTDdFCDJcoEWa2BIH85hwKkEveiSydE9bjyIzFWSqk8ONvm0ZuwB3TAuSkVJ3+l7xJYi
	3/RIDBlgtsjiEu5F+Hf2i7bLyR+Vw3xF+cZzaZY85uvm6ORJQwDO+lWhBBAVYhsHZpOSbvMJBYR
	1qKAY11HK4LS+R1822/kR5oFhl65RGMqP2rhlCuotljpzLDVVZ6LiaIGLS3hhyBFQPwQUQxIIQZ
	JihEXHKzSJQeIfpV2Gju36P5+/eScEhUl75XUZcFYnnYzUD9N+3lc/VodXZuQAwyQLEcicgoh0W
	dE1YbdU69A95FUaDhX5ANecFeqIXRw39crTMGdxdpRL8hkIwKs9VakBdb/GxQHYXFoqijP1tz3y
	x4ZtK1Q
X-Received: by 2002:a17:906:6a27:b0:c20:2eee:97be with SMTP id a640c23a62f3a-c246a33ed69mr1775593266b.7.1787444568708;
        Sat, 22 Aug 2026 17:22:48 -0700 (PDT)
Received: from ownbook.home.lex.la ([84.17.55.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a2e42sm438394466b.59.2026.08.22.17.22.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 17:22:48 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: Re: [PATCH net 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Sun, 23 Aug 2026 03:22:46 +0300
Message-ID: <20260823002246.28455-1-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c501d5f8-015c-4ce1-87ee-c4cdaea57f7e@lunn.ch>
References: <20260822195252.2934-1-f@lex.la> <20260822195252.2934-2-f@lex.la> <c501d5f8-015c-4ce1-87ee-c4cdaea57f7e@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_172251_532616_05E7DF32 
X-CRM114-Status: UNSURE (   9.84  )
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

> This is very verbose. Is it AI generated? Please revise it and make it
> suitable for a human.

AI assisted, English is not my first language and I lean on it for
prose. The verbosity is my fault though, I reviewed and approved every
word. v2 will carry the Why only and move the mechanism notes below
the scissors.

> It is normal to assume phylink is correct. Now, if you do find it
> doing the wrong thing, we want to know so we can fix it. So if you do
> want to validate it here, make it very noisy if the validation fails.

That note was about a possible defensive check in
mt753x_phylink_mac_enable_tx_lpi(), not something this series adds. If
I ever send it, it will warn loudly.

