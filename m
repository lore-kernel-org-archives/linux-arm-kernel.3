Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A8C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l84K5Ujh;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nQWnKx48
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=; b=l84K5UjhBZKdbD
	1MaRrPe+FLUb6bkx97xuXidZDRljnOWiewjzjHjdIWORSTKRMuJBJTh2tjlkXcudlqb2hi21lZUs4
	SSqGLwbDoej99td3MqaZVvfZWgHwW9onIFijnCUT/BWO4NXNE+Hx6WaYp5fc+EH/itcNBzG8PNeX7
	do5ESED0vTquD0P+Rqi+ZvqVyNrjMCF0E2gj8vkq9qXu55BapwAW7ZyBL7RLLTbV6CqsDzDmWqQ3y
	ZcoAMfTEja4mV8chfR28S3i5f20vP492DFw/3I2/5q2Z1f+tAcSnHhBdRsKe3jajX6IU/AdlNFPCc
	fwuUtlMJ3pluhXQ2SPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1c1-0000000A0j2-1Poq;
	Thu, 05 Nov 2026 17:50:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1bs-0000000A0fV-2zZr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:50:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-490f38e9688so893829f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901047; x=1794505847; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
        b=nQWnKx485zJpvWxbnDcJXoziaaf0V5DQoXgjecPNfqg6odLep7m8r/fsmZVHZBUynx
         jLghzLosPyF0iOQRnSB6ELpkPTOSlXryyu6ILMuAz8BlGf3g06O60h8L6XIcg0py9sSv
         MjWYLDIx5Hlv+nDjmK9IEYVlfF8T+GHu8uhfqLjyP58Lr3o2lCuf2nWZygWdhYmHbpME
         QsxxuztkEOV/8XTvcm792DBtOjkm+dGXYO6WfPhhDzUTfQe+RoZoINyoBSq8HZktLoBb
         CgFztUCiTi0m3fqzK8KsnyisadfMUYm9C4EJkiFwC40tSqlx6uzzyN5AtC1m8b8H6V+t
         VKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901047; x=1794505847;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
        b=hN/PHixt1QGsPMO8KR5ov3gLmPxuPinStTksWRuteROcbobqjzAtgifn+yO3hgJRAC
         8AtRCMgppvNnXvULHD9VmROwC0kIuUXFvIxxUr65i+K9j4OO1uKhYCgjmq2jGaxFWPeA
         t7ja/KqG8h9s0yHURkMCJ4cn1iEYimP1SV4Nm0/u+K6cISwMQwJrty+gmKRzb8nSw++Y
         HAxLTix4ISkvl+uE0mk2gwfdyiZeAJ4HH9h208MJlKlX+/FiQHwNsvNqEcdwH42+59wO
         nWMgbtE7iivEXnMzqD/QJzTyfEpJlslcjo5CzS5ddT9R6Qj4HO0aeN3aKDpIXn1+ZJUr
         VaGA==
X-Forwarded-Encrypted: i=1; AKwUvBxcU+fJRk/4JcaZioH/B9KBBvrU/azoIRNZVO9cW5C64+H/qbiavg+HZOMdupCV1xIhM//glYDRBz16SUQpyAbe@lists.infradead.org
X-Gm-Message-State: APuU4Z8MeoiFmPanJ5TZo1yA9a4DduVW/hThGp1cPHhXqfGJ5od0awNv
	pN9V5uKaCck62IqH77gZ7f2BuIyO8h7m0dpfIgjrgvEFiWBMRDrhMGB+MyYjXEzDuXw=
X-Gm-Gg: AYBFou1S1SduniO42rHTxe7wsCG+3XqV3XGYd2PC3K+gGEsoUW+9FpQY46MJUq9kcTs
	8onzAcg0tnC9f3+/P0rbXGKFQXje8OW0Fngc4X22r9N/CN5e7RhI5AB7wyU4ibmKT/VK/v7fkwJ
	yT8JN7tI4XkWf7ExUx/d6iGzusEoodNm5A0aH/lL1DleeJq6Ozeg6d6j8HyZsU3XfleeVca25a7
	Wx+9Z5B6JjRCBQltkUi5yPLvUyIFGTVux8weQOqFEdNenJRwKXO51ep+AvnTkNz4buR3Xa58Z5h
	ucp9D8RLwDCUeBv2fHVNdF3c21WLzEQimy/EYrPjMpPuXFXvzhZhDjyJMSekuuEhpcE/cmYf5eN
	HvN5KgAX7VZifn87wZrrjVpaX47ufLBCs7WiRHNcxjo7DD9lcJrXtwl1G49QzcG8nT6QkbM3XDD
	bVdyOfVjipK1JzPt4IcdlrUL2vwuPxT/eLpQH7GzG7VJBIDpltuwvkW0suy9mmAqJtb0i/1yJus
	g4+vpUZzTC5nC1Ttm86fgjEPetkK9Kw81kII8FlU6pKEJnC5FAgCtKnGqwQ1CZdyGhpVHYhEcc0
	/1dLihCunVRMyv3mLwKPw/9LspDfMZ34FvAM5wtWEGFKsU89
X-Received: by 2002:a05:6000:2f87:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-4927835f4a0mr739128f8f.11.1793901046808;
        Thu, 05 Nov 2026 09:50:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm10843690f8f.37.2026.11.05.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104085.2573818.16461908615505096359.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hgYik+Icrd5okmeAAVTfYYP6BAFK/E7hkpa3L1tnww0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn6+tSd8/d2dfKabnr0/9+ZojuLnxzpVp+oKOPje3
 5/O/X3Czo5SFgYxLgZZMUWWGu5q8XeSWl9mTde5DTOHlQlkCAMXpwBMZPM/hv950Q9jiq+4WW0u
 twi6Je18bN4hBs7Yuf9YynYukVx3RvoyI8NyJb9zV89lp9wubMhs2XQwac7TDN05otvuafDUtZ/
 jeMsPAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_095049_821920_DD67C74F 
X-CRM114-Status: GOOD (  25.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> When a divider register reads zero, divider_recalc_rate() currently
> emits a warning (unless CLK_DIVIDER_ALLOW_ZERO is set) and returns
> the parent rate.
> 
> This behaviour assumes a zero divisor acts as a pass-through, which
> does not apply to all hardware. Some dividers, for example PLL
> pre-dividers on Amlogic SoCs, come out of reset with a zero value
> that does not produce a usable clock. Returning the parent rate
> hides this fault behind an incorrect, plausible value.
> 
> CLK_DIVIDER_ALLOW_ZERO only suppresses the warning while still
> reporting the parent rate, so it cannot represent this hardware
> behaviour.
> 
> Add CLK_DIVIDER_INVALID_ZERO for dividers where a zero divisor value
> is invalid. When this flag is set, recalc_rate() returns 0, making
> the faulty state visible to the clock framework rather than hiding it
> as a pass-through.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/clk-divider.c    | 3 +++
>  include/linux/clk-provider.h | 6 ++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index f68216c65d3d..6c1523d22477 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
>  
>  	div = _get_div(table, val, flags, width);
>  	if (!div) {
> +		if (flags & CLK_DIVIDER_INVALID_ZERO)
> +			return 0;

While I think CLK_DIVIDER_INVALID_ZERO really makes sense for a writeable divider
only, to gracefully handle a reset value at zero that we would later correct,
we should still handle all paths correctly. This include a RO divider and its
determine rate path. I'll try to send something for this soon.

> +
>  		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
>  			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
>  			clk_hw_get_name(hw));
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index dc8e161f9c2c..fe2dbbba49e3 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -744,6 +744,11 @@ struct clk_div_table {
>   *	big endian.
>   * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>   *	Formula is 2 * (value read from hardware + 1).
> + * CLK_DIVIDER_INVALID_ZERO - a zero value read from the register is not a
> + *	divide by one / bypass but an invalid setting which does not produce
> + *	a usable clock.  recalc_rate() returns 0 so that the broken state is
> + *	reported to the framework instead of the parent rate, without
> + *	triggering the CLK_DIVIDER_ALLOW_ZERO warning.


 CLK_DIVIDER_INVALID_ZERO - a zero divisor is an invalid setting with no
 	usable output. recalc_rate() returns 0 instead of the parent rate.
	Takes precedence over CLK_DIVIDER_ALLOW_ZERO.

-- 
Jerome


