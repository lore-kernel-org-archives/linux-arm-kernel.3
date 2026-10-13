Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9ADCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hS+qW1UQlVePGqIuKEKUuB6UIO/AI0dB5jkfcB1qbck=; b=vcGS3RkKO9WMOcQkevPj/ixzYS
	lH2R5HatTRbpVTmOaKXLG8yrDrAGeDEDIEelQWqqHQ409IeLSmmHmZaJJVj9JJwZzyHMN2eH3ulW3
	X56CeR/7CS59eWyX0gJ+c2Ml54jVgjNOwl47t2aKoNHGfUji/L1sGHOyDNacLUIN+nUNt2PyrM007
	MMVAcew/6rc2LYvFOmWIy6euv3syYj4HcMtPhoOlVW+cVrPSDcKlpelXaUbte5eLI5HvW9cyKJ/bl
	hbXOiY1ogKB5Y4o34TINZsCYBfPXQhfn54ESEfDsB5i2vo0daIMBQMpFwOQ2DtE5Kohrxa4MTHrDq
	1SyHs9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgDS-0000000Dg1C-3vTH;
	Tue, 13 Oct 2026 17:23:06 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgDP-0000000Dg0m-0y0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:23:06 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 015AE1D0010D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:23:01 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 13 Oct 2026 13:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791912177;
	 x=1791998577; bh=hS+qW1UQlVePGqIuKEKUuB6UIO/AI0dB5jkfcB1qbck=; b=
	MqU5W01CRjiCM9rI8jQDnsnpQOhXvs2twy2N77PTz7GpiFFJ1QYLw2PGcN27rDqV
	82o+dYLcrfjQc1jGo3NEbcDNL0t7MT0n9qdWKAiax/JhRs/Y/G5T+dMFNUpPDwNH
	dtGT0dgEo+ZXI5pAu32v2HD+mUeytpjDDAg/HAw3bldSw0xNBNNyV5wIG/Lyr1YD
	S/vAfH2Yru32MLW7Y14X3Vc0HTSZLUI7n01Kz0HlTNCUn/oR5gW5YA8wvwBQjRKy
	s6uNKCFWEzmn5rzCm5N2QyIjEbeGq49WOM1QHYT/eG3HSQS0PJlCQuEZCuHDfSUC
	h00pW1u9gxd5Sx6jcrE89Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791912177; x=
	1791998577; bh=hS+qW1UQlVePGqIuKEKUuB6UIO/AI0dB5jkfcB1qbck=; b=M
	XSUiBhnWHuQzwhGDm8nsaYrYVCseWnABH4XdT8pIANkyjhQfTdmrOgeEq2ol9397
	7p+96ZZfMMZCJZwz2XgCjnlVnIqcQSIDHaz7FnUd0u7Vo1a0kjQg82jv8fAArurG
	BlLaRrlYfOUkc/dkz5HUkxAVywyZD6WwkVGZ76+A508QI/O7vCctCzvIJCIDkB0T
	cTvHI5/p6OsQEdcMUItPiDiS4GZ+krFuBr5a3+q/zIok4rdDkQv+P1wclyG4a3dq
	pOzkoeU3huWZdYXTa5zefnFgTMzt7dDJ/4RG3QLdTyOU8fLrLYWfcPcg+j3gf3/L
	vGfyQN7yJA313N38MNLZQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791912177; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:W7Trkq6QL0N+m6MSmtuhoOq40AOCCT1ZMHZ+hkcpL2liN1/
	aLnc8ycKUMEZCH0iAI7Q7/Yh1k9pWQD8j5SjqlKNmMLJpCtOrm11lsRvrcjBTT3c
	Awv0ZxVi45PxoLae09sx4uq3c7DCrovIytC+JYwEByYBFLe2iQNTvRjRjlqm5GDi
	EujpHV3+20A6HYZEtxldvrL8JVHswgn8WurT7veE5WG/o4k9wul2Hf1IwKQMbxmn
	REX56LHdN5Z4ZP0+GDu/XU9TaAm5Lv0kOrBkYCCcB2j6Iw57QvbeRCGfF+k/5i59
	2JDWXNDoGaVmy0GPEb9tmEuSGwfA4TEJo0WLfgw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oZom5o/iezk5oczVBlgZAdby/ePS/EmvxfPVKjfndZU=:FPhD9ffWsuT6nz+M1b9LWG6gr1ud8CZdaBviPnSmlZ8=;
X-ME-Sender: <xms:72jOahNNMSXZR0T7sW8fbo-qtEKIM7TmUjzeTc5XxvJnPkj5vIQ-OA>
    <xme:72jOauy2T4Q4zFTAgVPRT4U_dyBbL5t90_TEfA76-wCdoGnYk8UuRtTuyl7pf4pkX
    T5ZhxW9ziFDHQpXl4Lu6Ao2CaqEVcSAqyoujFjyPYibGUKiCN2hmfdn>
X-ME-Proxy-Cause: dmFkZTER14THpZh+OBkvXnHUH8+jwzP/jo3zDW19YD/663+030AVqUF3ibyrM5gqg6OznS
    qN36Na38t0R/OlIEUa1di5k5DqlLqaEtO44cdxP3yuyOdDaSCJ++RH+Kw7XC8AGc9vG6xA
    LNjrjLuolzYXxuJUE3WNZJA9vX3leKG2KAN4SXvtlmeBcCeJd+uDdctMLXlvY5IEFUsX2y
    MMtdmyTx/gGugSyLgjiftgztjrUykNVUlm48UkS9VLlCbe7H2rQJIkBmay1swYdKKcp9mE
    HbvGDbdyXT4QJ7i5g4WPqQAhw4j/tTVDnB/h3O4Sq18tnYqG3AQ+hjgn0Wev7JvxQlu5iJ
    pxKZAUiOtKLb5d9qkyqGj2ayesf6UtmIgIjzHsUxRQrtP4k0T+VMnu5EG9eKTZjy4a8A/1
    0xydyt8TsnhAl8rQh3QmjTTtGPkoed5JUgLnCXrUp5GKjFPbIY3cgtIjVYYnKuNa4edb3A
    aoDfxMDPoO05PUDdKiKn2jZ5vxSfW2KooWIE57T8hcRX6uF4ShaB0yd+M1VTIn9AEXKISC
    Sz/XHJXI93GjqQRCsHmJKaXuL/m0hYp7IkU9e3lDNlsVgyz1qEC8m9H/cVBQ0PX0jDokyy
    2rOxBW5LMyX0Dye66ilMDQK3r5FZMDGnJ6FI2D8iwrlBS1NGV2LqCmeLOfQw
X-ME-Proxy: <xmx:8GjOapP-1Hf3BV8okHkUe5NwRlpw5nlEIv1VbVCsEHLdPIv6dwv8pQ>
    <xmx:8GjOaohduAN1nM9tuoxNBsOVdLXMOsd6PSnR2m7B_Ke_knC5VaiXMg>
    <xmx:8GjOass7jtZQ1FUz6RSW3140Jmo0VyrzLmOueOMHJa51_V8eWJS6uQ>
    <xmx:8GjOasjY4H37UaxeUMh8qy3i_zuYHmnN6jlT-AGGTrxKinaw8P8jXw>
    <xmx:8WjOakJ7TJazOR1kQ_WHgD8rqsHy77Xo9zQPz1LPKR7OgMowAU3gE_tR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 042BB32A008E; Tue, 13 Oct 2026 13:22:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ar0hN4MWufik
Date: Tue, 13 Oct 2026 19:22:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Len Brown" <lenb@kernel.org>,
 linux-acpi@vger.kernel.org
Message-Id: <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
In-Reply-To: <20261003095924.1370238-4-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_102303_663394_95420C02 
X-CRM114-Status: UNSURE (   9.22  )
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

On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> ----------------------------------------------------------------
> firmware/tegra: Changes for v7.4-rc1
>
> The bulk of this adds ACPI support to BPMP as well as a mechanism to
> throttle bandwidth for various high speed interconnects. Some smaller
> cleanup and typofixes are also included.
>
> ----------------------------------------------------------------
> Aniruddha Rao (6):
>       firmware: tegra: bpmp: Move channel initialization to helper
>       firmware: tegra: bpmp: Add ACPI support

[adding ACPI maintainers to Cc]

I'd like some clarification about the process here, as I see that the
ACPI support patch ee98ea41ee3f ("firmware: tegra: bpmp: Add ACPI support")
only has a signoff from both of you and no other review tag.

Where is the ACPI binding documentation for this driver, and who is
responsible for reviewing it?

      Arnd

