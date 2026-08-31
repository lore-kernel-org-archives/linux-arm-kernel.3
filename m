Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850D4C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=; b=2XFSnyZZGMq+trUR958nB+bFms
	VHZbWp4J0ub3U0XS5zxnhSB3uoxlQ93/4tZyU9DatIprPcFy4k0CtyBKf1Q89NHfBrM8akqsBD5fp
	Ry9HLfNSbP9xU3wTKU/HoYpzjsfnIfQQpNGxc7Aq3WCkR6R3dM61c1593c2vrVH63sHC8BSPCmLGT
	BraWA9IcIevmxHvgXaYs9orxTX8SP8CItNtRA7jraveiCoN7xAW5LchsnZ22s+40ZuKbCU461pemR
	6Yo5H03SUnq/RkQ7qodiBgyYOpR/jQwDvz4mra3SeyapUvyEm1Vop1h+MMQ4+Wr14uxdn2ht7Ni0j
	xlLYfs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ya2-000000092qe-1TXh;
	Mon, 31 Aug 2026 09:45:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yZx-000000092op-1bUt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:45:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1881244f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788169523; x=1788774323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=P1+Ajs4nYPWsFVlU3/dJILtiu8CGNhbFEYSdej3OBEOF9n3QZlttHtTfocvQHbfbva
         F6qqq43jXPDrhHayodlntaUu4LzPC0Yf11KYlbU6fwHpPwDFRb2QbP4MJazwZVQu9wmB
         r6VbL1l7MxH0MX63uTiwKE9cdQUoCzUvasaj64LLsj3nzg8nn/63NZVga03KoDPGRhBH
         i6punNxm4dMUTTqdD1r2EArDhNzSyfV/LUWaMJluKLjkE6LeblrSTIn9KM0crBnOULgg
         f6pNsD88+hAUo4oU5x3mSwgjqK9PWnzpKJZGYqdA7Jx0N0Lc8xFv+QmwXHkeeLCgRQKW
         JCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169523; x=1788774323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=ViBdzlRpfWxfrCoZgG39S55aEW5vvuZ7sQcsYYeQbDS3w5Ue0sTHP76vbpCMckVaXU
         JHMNXEY9WrZkjoVixrZ0pybJcPqFQMqsrQmVQpaEJV/PlqQO7DSsF8TxHCSz33m8xYnO
         VctKnzW1At6Cge3K/S08t34f3htT30sh+0Kz73/pgD/aXR5E6ac9YHlIBADELcEt1JF+
         b7tSrFj++MgRs+A87VNLc7fUMuOKxfWR+67lD6DmYGm/2x9mQ4ALkkrxckq/APWfX8Tk
         +s9R22rY4fpkr6qt0uf7GuOQqYN/eFB9f39H9GGOrt/mRYYEVDbqBrSdNdBrAGY2c7Hz
         8akA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1QUthw+yBtUDQlRxAnLuI1R7G1TyT6gsqimdFfLIay9dlD4lJu+cTVkj1W4i1hDeYz+8AcWqT55L8b7aJGUK/@lists.infradead.org
X-Gm-Message-State: AFuF++nS1EL9O8FtSEHVIXHW8Wp3zZJ+gq5X3PSzuJ+IQ9LVZ3sAb2A7
	AxFjbp4bvo83PUBd+JWHatB5MR4hf1Qn6K1QMGYblALiTmgQW3zl9ItDvmOnDPdRSR7yARjjv+A
	WxB26cQ0=
X-Gm-Gg: AR+sD13EsZ67A6MYw/nQ4akywd3ycjrsXBqggFbj7w5m4DQvw8dbaBjBQloZhTEWjwm
	uaUoYQJpXyyHFo1EqYuY28U4hBHb/YBvyYPwciwp24An/j74wW7eYppzpl2FW+PFlvX65E0Ka2E
	QpImztE3/W6ydxkaeIYIHKJMkPqegcF+DioSvQ5PIYBECQVY34lJiThY0wtLWOcODkiJ22/fwHF
	0x8WzP1Mlt12t/sitb2/x7knBgZnV0WjwL8gbpL8Q7X4RX0VyJkhwYqS3ZGWXsNYZdfYzgr/6Ui
	6y5rDa6qwlCFhdg3EXdZIur/qHxXuO0rd8epZI3xn5sVSaNizSKeoADm1nQqJWb8NYR4ueay00T
	Aa9O+bS6jUnXHMPSUWoZa34zwtHA+PkebaO6hgWIkqfU7cmNekWIPCw+HvORRqtQqHonjB3ipp2
	STNG0WWe3QIZbmoyFL0czGrdf5yQUB1IRX8qkhe9XpdxPx7BjmEgSgHncNPw==
X-Received: by 2002:a05:600c:1d08:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49b91c2e145mr374445115e9.1.1788169523048;
        Mon, 31 Aug 2026 02:45:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a65d:30ba:195:2a4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm12860834f8f.9.2026.08.31.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:45:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Lucas Tanure <tanure@linux.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Mon, 31 Aug 2026 11:45:15 +0200
Message-ID: <178816849353.1471657.3294500872963560105.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_024525_730394_D013D48C 
X-CRM114-Status: UNSURE (   6.66  )
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

[1/4] clk: meson: t7: keep the memory fabric clocks running
      https://github.com/BayLibre/clk-meson/commit/43e1705ecab9

Best regards,
--
Jerome

