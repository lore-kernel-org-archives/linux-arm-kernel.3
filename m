Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF5ECF31AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPku1+8si9WS0eEdGZPMSksg+4jhr6LCa9mOonofrEw=; b=pTIAF22uxyEE1o+9HjdTKifOXe
	KW8KBpXN6EeO9ZSpsauMDYEG4O2T0cMxNUKFyYEWbe/wOMYu7gYF2wPtLBRvkPXRYoyyCqU2+jn4Z
	WZYkgn6XVBqcS9czWcnc4S0lw80xS/lJ9ijiLL7Ajcvx2fH76WCONuhsDLIOj0aq/aaiAkiDVFQO/
	u8qXLlEmvTvdaKdGjU/61Ll9W0F6/KZf5FRhwYOK7fY4WYRn6TWbbWUeV5e744T9gHEtGwsj7x/rY
	k2G1mwGRkX64PGah7hJHrfexXgwmBJUco/ke6hegOyJD7skPsYYGGQ1+8Z3N1CP/2fLYdxEaxHbcJ
	sODlFTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYR-000000033Nk-3h7v;
	Wed, 19 Nov 2025 11:40:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYP-000000033Mv-3vEc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ADEF60126;
	Wed, 19 Nov 2025 11:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B22EC2BCC9;
	Wed, 19 Nov 2025 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552452;
	bh=Jv9OnmAWW+VdN1c8JNk07SHBgQv4frybNTEwYqw203k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FtZCa8h8heOS3iK+vQ8WTQKd8Paz7cLEwPD2pD5rgieMYjEhqLizFuLjV2tB40sji
	 PJIoOHoya2pw94aeT8JHhdzkDrbfQ6Ng5iZGnC2x5pR/Velong4SabptfmkdxGrhOO
	 TBX71nXNuDvlDFF66UcXw980jCQs/GiopPF7965vrLlhoUttFBJ+ILyL8Q+JHfH6pp
	 tUrtzrmx4KxzIgaM/4JOq9KWK5WD3qA0hIb8Lo86DGmuViYI1SPIi7zdf/+qQMvBIr
	 Kjso50IWGpWvPj1Uu2oTE9ND5mbTAxokGSPTRvbK/XR6es14nHqi0PLoKinnxz3z8q
	 8I/njoWbKyseA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-4-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130859epcas5p41a6ca2132b576687c89c6e0f07914750@epcas5p4.samsung.com>
 <20251029130731.51305-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 3/4] clk: samsung: artpec-9: Add initial
 clock support for ARTPEC-9 SoC
Message-Id: <176355244518.116968.2249686000765158535.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 29 Oct 2025 18:37:30 +0530, Ravi Patel wrote:
> Add initial clock support for Axis ARTPEC-9 SoC which is required
> for enabling basic clock management.
> 
> Add clock support for below CMU (Clock Management Unit) blocks
> in ARTPEC-9 SoC:
>  - CMU_CMU
>  - CMU_BUS
>  - CMU_CORE
>  - CMU_CPUCL
>  - CMU_FSYS0
>  - CMU_FSYS1
>  - CMU_IMEM
>  - CMU_PERI
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


