Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B087109E556
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=; b=bY3H5EhMFP6L9iHxsoq7klC9Ga
	55ztW7VFIDZz3Y/xbn3CvCNDId359LiqtLeXC2eiK7BjWJkAojOqxTKYgTvBOGtf/6qZGQUv2N6EL
	VDq+8Adgii8lt0QZ/030WFt1upXDHXH2uOu3kArzSJ00i9gHHCtDMMjkOS0e7riqAnFSW2divNptW
	SgzTxrIMu8yl076iUa4Adkz5pADTk36n2yL6dwEr1M1/4cnAcT37lj+mqOM/K0mq1JD6D8+0cofjd
	Bw+q5z5r5JOrw3dY0Su8HZqpkXDHi4itz/0Oj01dXF/gFVYCv3jmTSk3TJK0HawRk3AqKcRgTDykY
	jAGKW54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eM1-00000004rEA-3qMc;
	Thu, 26 Mar 2026 06:38:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eLx-00000004rCP-0LBn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:38:04 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so705625e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 23:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507079; cv=none;
        d=google.com; s=arc-20240605;
        b=eLilF2sjKxTXmn7iwKLiCkKb7H/g4VdLpmcoiowqiwwbB1JAbzqM+Xwh43qVu04cPJ
         R8VztTqr4C8UEUjj/NierFv10z3I7YZUFvxzaIXGH1+Xu+cW678+tJgDRZ2B3LKgWO4V
         IKvn8FUPgBHlwXmGAAndQYtRfQhTnCcnaFxcsGNbJh5mXKkvWDiV76zR/TD+E9o3ODkn
         csZ93W3VDkneuTHuGzEZ25cIwHwywGWoJK10M4DDO7/ye7P49DPtNmBeo8J0Ozkgu5hJ
         v9D2jKx9ZTsQX3kBxM/zhfBvkkcDxHL5sg3WdPgm+WRacnv78/pwRz8BmHfi2QK8nI4M
         U87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        fh=ympxvP/x6XnNtQxs36k8eC2Z3PvtgSevF1XoZl9SSto=;
        b=avhK0HGkoPteIPth9VFnBnWuuKcIeeEVTkgCVhDos0y5rNfxo9lS7Af5W1uXJguJot
         y6AgKfhi5nv0WcWXD5FNUbbyiPeSxcMfdZcHDMttmowdGEKJp6HbA3yUmajawN1DDQJh
         0v6NmYES0yNVmIO+pbw+8Pl2u1wV6rePJBZv83EEn9owDKmohWysu/0UZWtPDqchqARy
         N1MDs+I1hCn7x7xw6/jLPE1OFuWmo/DBNMoKOktnanZKxIneCafUxvLQya/ZnTPoa0ac
         nmedzPIbRYDLEWueS7MAKXVeH0NA9+k6s5PIXGDh8s1lAszAL9G6acVjoUMeCUSkPLUu
         tjzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507079; x=1775111879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        b=cKzhhynNRLI7s2CcJnqUzZsBTsuDdaxo6IssoisgW7iDU+o+8YLjdGpE3TOvbPbRr9
         ZU2hf2z8nrFlQDvhbHiHLc7nAyBq/5Bcfil6ytNTNKfVNg8r2+ikocu0bnaKyx32Cx9H
         12rBcBVOD8sDCjGX4klh5UN9NTeDmfHYSKz9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507079; x=1775111879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        b=glDtGg/2m+leBf9/p51pjDn1ZtLrfI9Jnj/1s1eK6NdcVj+v45H7E4aWBC0RwtEcn4
         usHrGqvmYH3yzwzGIRqELW3s/C7TbKHVTnwuZYpAhT11lFAjUxH6gdbNgn49f4FvSAPa
         mkSNktpyRIz5uoUopDPDOLytys9AzRVFTkfsVhnxHMMrtBQMbZV0bygfuKAuss0ck3cz
         6Hm6a/dLJ+nFE8qGBBdbCnmDZcf9BQQ7KM1n3XQBaNSBbd18NSK/C6+mXtUbVDSbBGHy
         cyaDZMu/eKFerowYzhTiOvPXG4i+hHsnIVJsmu2kIecMMOyyxtgrj1mlejN7WyFJwm1+
         DgVw==
X-Forwarded-Encrypted: i=1; AJvYcCWSOrIdK+zwkrBvaunv1zK5MnwQqLqmUwMaMWFGdlF6C5MnlRVbifaqeB05B0yOkSndSVdYPhSCEDxSCmgHcb1l@lists.infradead.org
X-Gm-Message-State: AOJu0YyEWKMYOLjTBPzxDO4jV2JVt2QhoHowoYEFSUmYjPuyvn4IfPkL
	Fo7/DMKgG/ScCbUM/wTCCFLWSIneoNmtfv2BO63a5DHW/9sfDeGnSZnQU53xjZSIDrqAIlXjRxz
	D7l0pb+Il4cUUb6UbWSx+gZczCt8cgeCGQRw9iSiG
X-Gm-Gg: ATEYQzxiv7kWFf1ogCjrcdNcVMUzH2LudNFkxiFvk/kQKePKydCcnmVXXGeHG15oLDP
	MIk/0vb2DGlTKp19aeSR2BFGH2U4dQeVgKknuLgVsrPu2Gb8d1zQRwIVsraTQlOepJnR42Hga9E
	unRefNk67e6Cl+Dk4e1u/QF14j3HZmie9cefYuKuBlpvTNEShXKrE3z1E4gCssFotawRDJWeM4G
	gFJ7hAsuHDT3IiRa01IMJ39s6XXv3JahAP21c9yuTLdxiHZu7U9ccnXo6O7Kqcw30IZMe6gBVyh
	+NthUOGWUy9FF8DpATrXxZ7CBj2sfAuKPdHiFA==
X-Received: by 2002:a05:6512:61c3:10b0:5a2:9bd9:3e4e with SMTP id
 2adb3069b0e04-5a29bd93eb4mr1620218e87.6.1774507078882; Wed, 25 Mar 2026
 23:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:37:47 +0800
X-Gm-Features: AQROBzCzCBfG5zo_X8L9j-toqTRqPRgfo1sPkCT0CAUHICe3uzlCQupUiDPCQQE
Message-ID: <CAGXv+5ERgruwWEU9mxThGNaRy9i=T-_Miumh6m9uFRtZPk8uJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: mediatek: mt8192: use MUX_CLR_SET
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_233801_139115_AF911E38 
X-CRM114-Status: GOOD (  12.45  )
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

On Thu, Mar 26, 2026 at 1:10=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> The mfg_pll_sel mux has neither a clock gate nor an update register,
> and upd_ofs is stored as u32, so the -1 truncates to 0xFFFFFFFF.
>
> While upd_shift being -1 (as s8) prevents the update path from
> executing at runtime, the bogus upd_ofs value is still stored in the
> struct.
>
> Use MUX_CLR_SET to avoid passing sentinel values to wrongly-typed
> fields.
>
> Fixes: 710573dee31b4 ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

