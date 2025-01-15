Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntnUUEYRWUl/PgEoKPF65jVBJ8fvSk7zrQV2c99N08g=; b=YgbWuJAGVkdjnK33Xg6KuVaaTk
	OH6cKFUiXFHx+Ylqox5DXJ7pj0YMyvnD32zIiUk4pzZgBDySdimfZrlzLZFwQAn49fmUaNl4dWlId
	V7Wwr6CGbh6+CvL4xR/O4/skj0hZyPIYY0qoxQu0i2XF0VYlWN+TmDBQ/BWwO2VNozUrrrb8/s1jP
	n8toZFmsmjN2E96+5N6qJzQz+I/13fxq3KV3xKGlez6bQlxkcTIIT0T21GX4RtYAwWkY3Eu1m10os
	Uwp1dfnIi6qz+ot90VMT4i846nKJeUycA79LdEnYlmCqxctWzyi0avtZEDVnSDQTl+ivndf08yhwf
	goZcgxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCnN-0000000DM2l-1KUo;
	Wed, 15 Jan 2025 23:27:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCj1-0000000DLAg-3ypB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 23:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34BC5A425E8;
	Wed, 15 Jan 2025 23:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C834CC4CED1;
	Wed, 15 Jan 2025 23:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983382;
	bh=ntnUUEYRWUl/PgEoKPF65jVBJ8fvSk7zrQV2c99N08g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UMSKqnyNzlFOwc5UoulfKPqHVtNn8tslfQmIsKWtb66RLPyor/5n4vWyQTByOT7XQ
	 i1zai1MPiyStb5PwNcEwlcNMtdMF6w8CyD5o3jLoge99Ob4D+ANQUsZuQyQNJ5V+g4
	 hKX8Jy2GrJ1Ck6688jVfiFLNFObbFag9SkSs92coTc2tZVaNbRJExaPLVBWK8+iiC4
	 J4KU2ihW69+Iokn+CC4GrAlDI7YBZWaFKQSYIKXpsm2ORYVzeuHVsSF2xQEZgCB2iE
	 uITdxPoWedmFeX0XnqyUIB27nd3q6Fa6ZdMHMqljhn+yu3c0dcZXaCF4vauGtHS2+v
	 gPUx2nkKe2dnA==
Message-ID: <54dc2e52123267e1885be09fbb91d39a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:23:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_152304_046496_DF39597D 
X-CRM114-Status: UNSURE (   6.40  )
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

Quoting Dario Binacchi (2025-01-14 10:19:48)
> Use GENMASK() along with FIELD_GET() and FIELD_PREP() helpers to access
> the PLLCFGR fields instead of manually masking and shifting.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next

