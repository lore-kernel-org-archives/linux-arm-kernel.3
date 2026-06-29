Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DE9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=; b=Kfj/FZ54wmUsLH9VoQUqiYI7aj
	JXa7g63NTbXM3VZ6gQIw+ZlF2i4Upmx0pm/Zo4EewG09Oq7FRhhg1bo9LFcKXZeX3KM3PIVHEHrgJ
	0lG+1J9pSmBST/J2YmZ9ZAhFH3VD8tcr0VgLODN/cohCYbcKQoDTwR+e9vh6UOOI6j1BBoqvK/jP1
	V2hsNO3gcoZL47XUzE3ixSfa01Gg+u47aL2L6cJp2MBi5oFZdxGhhGa28FMvanUTmonyqQLgTUkUW
	FISwSJCWfCYbBvxOnu9KeTrc6t3MsfbduejRx2AJDGBbsrMKiaHXB3mShUhQae2r5yV0YArf9UZP/
	XWUw2BHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9TS-0000000EMPP-0Ost;
	Mon, 29 Jun 2026 10:44:22 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9TQ-0000000EMOn-0yCG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:44:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso5913110a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729858; cv=none;
        d=google.com; s=arc-20260327;
        b=VM+d/Sf1oJ/jbX4HqPhy077/7QZWKh0AwuefZ7qKZNIKQ8gEH6Ro0C6fQqn76ZcyGL
         n78RpdbNV1Hxp91VRrbrBPid8SstOvnhKhqwL2it44tSH+VrcTuVcjC6o3yks38HIPHY
         5H7oUxHfsoCDqyg0wqOyPkYeiHC6TXKcyyytxoxTjWIDMkuCltSGniPPdkylN349fWdK
         HmAEZoQp41ridZm/t3sh3WQXygF7Cov5BfgoEDXlhp8H01BcY3wpOw1B0L/1NCs/cZGc
         ZbVpKugxOo71PiT4SCrMz2TZ+f+HwXH+qiPEk7YXb/QBiFq73jxHcmjiPm+LMAorGdyc
         sFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        fh=zKty5amD4iWCPxltv6nTFkzPpMQd5yqyfPAQn08HEoM=;
        b=Asf8jPvr1ihrxhiYzzC8qLB6iqVoXSyXH5nl1o8khY44OFVrAmt/bniguU9IlUscFs
         ngY197779XeN0WT1wNTvJrOrakyHokuwz02SkrRYL2zKe9kO9iDjAz9Mu9TUVH0zNgSS
         2TJI7OqEQ5yH+gcT1hbRzZlUhlREY+lDtKu2Rg/3Vuk8E5/uDMQPYfw261Q4ly2fL5Dc
         3WTvFjotOPYvb7cecGEhrigig+GguNpnPkAoa0YXiUd0Rxx1YoOSeqVe0fLlEaxtvuEr
         EyLK4Jji7ApZewOSO1Rstydmz48Sj99DUEjgtKvePfRvwvdrKrbnUkokxhrSydAaHPGD
         osfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729858; x=1783334658; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=mf0TMTfpQ/REF2xjI3nubs67Q4iIJLUMynh5fKDlJLYYbNhHmxTAdRJ5aVy47V3cbq
         OBmneEH5WU6VvSWKXlCGpRyubWidTCjUVDFC+tnQYmJy0dMSoM5BDxs7V3jwyBRnwO4K
         Y6v8b1Z/Nj6yX83pQxxbhvN9GnmEEyFihQqWjIoWSyMHUSYLSpFN9HErTbTk+aHp6T2Q
         ks4D237N3b17GnFRmJ73qa3uTWacfITT+qCXhmh425OuWiwzuHi9kdfPTsye8R2pLAXN
         XOwjHVJGb/vpchtkh1Wq834uYWGq7INmhBECIvHyUku2JcdldgSoJLvrfvMgOX4HTr1y
         8edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729858; x=1783334658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=Sh5hqqi4peRrhcQ78+zcEPHhmEaKK8g77wTYezxoeIT1d8xpWE0FQYzOtCDgqEiJnx
         6o7agmCFmZGVrm+wYC+seU2BP2VsxYjkXAI664mK2zGWbZi2x+jIiNbj35+dmneYpf1A
         6IXQOYj90tILKtOfrin4l1gCTIH5nCJ9R2AMu4fJt0ZqzfkK+CloSCSl/i8YUMTr7Gq1
         Qaf44B5oC8BoD34PldB8/iIfdoOa3xpiUq9T/0WQkfH6A14n8bATlZeVTojWy/2Vs29I
         TdXFxthSOr+LvSDTJs9Nuz1JCw+GAZpfvJQbuzzQCH3V6f2wmM32p5aBWUjyEhkid4et
         aKCA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2yqGo++Ej8TkyZqbn7QbtSk+YCLvzA8RzIyxE1EYrzlqlxKU/1Nv6w+wWPqqw2T3Nxw1fDDgN86BMNhZj1SaP@lists.infradead.org
X-Gm-Message-State: AOJu0YyRAZ6hMdITt6bFMaWMhHOhEO1GRpZJMqAXA2HdSFHdwldGuZLZ
	JQw5GIwgC+CkU29HCG5x9EqQBpCKFRr76GtwFfwA+NumwL9DmsIy9/0Pe/mxhSegnBJxyVp06cF
	dSkZOGYUgdSf5oBFy4MDN57Le27wVPd5Gful5i5WScg==
X-Gm-Gg: AfdE7clKoxXf8BWBPuNHx4IdzpS/EGTDa1iBl957iSYbF2XdOydSstzhYR8la3TI5IK
	YVv8Ix93WLaGcBFzriHGwQN1G0sX3+aQmP3SRn4MCij83imbB3+C4InbHAm0Wp0WbRAAjmW188M
	vKAalshSH49ErcgxHOVTg1JhxSZFScTgjI+y/juHaan34lzCI3dwup0hkciL29PI4j+yK5LO1au
	PC6bLiLHsUO9duDiHfbAgEeQIosa9SU5e3x7HSPLIz1X80Bajkdg9pxI7m6crb1vireIwaHH1k1
	hsZ0sIZOK6UWvhJmhCQ3GuHVUJEaww==
X-Received: by 2002:a05:6402:400d:b0:697:8d48:7fa7 with SMTP id
 4fb4d7f45d1cf-69810ae01c2mr5980595a12.22.1782729858308; Mon, 29 Jun 2026
 03:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:44:05 +0100
X-Gm-Features: AVVi8CdUhgADG2xSK96hAWTQ9tVWRhtK6fekJr5xsrWPfeyuxnqLTd7JZu91VDg
Message-ID: <CADrjBPrCKS-_FSFaL+124cdRioGOEvk+6HFfrJCGt7HB983rGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_034420_311794_0FFDEFE5 
X-CRM114-Status: GOOD (  17.04  )
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

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Add the missing CLK_GOUT_PERIS_TMU_SUB_PCLK gate clock for the Thermal
> Management Unit sub-block and update CLKS_NR_PERIS accordingly.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos990.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index 4385c3b76dd6..ee3566b8e57c 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -21,7 +21,7 @@
>  #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
>  #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
>  #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
> -#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
> +#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
>
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>
> @@ -2619,6 +2619,10 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
>              21, 0, 0),
> +       GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
> +            "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
> +            21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
>              "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>
> --
> 2.54.0
>

