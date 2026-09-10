Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D3EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=; b=hGZy1YNXEhkvJmNkW8qM/1uDnq
	Wv6ROY/OxyrEgiktDNV6o/SSXD9Q1l2wYJK22Dm/5h5a4iWtXxdAUfCI/1mt4xKCQ8GOoc0rB17Vk
	iMz+mIhUXooxloj/nhdmNIBOxjDQw8yhesCVCG6ncBjJ3nRj5ip0v6n6mCXc/L/38glsSCdO350bk
	4G8U4kVCffJD+OH/X5HJv90zxSzAY+3ee4KAMMo5qerns/6mk+BoLwe/MZkZiHZvUFB1J+2mRO2kY
	htbwNL7jjmzzeKDpSjKCQaQDi9SFlzNvFU0AtEoOt8cOW2fkkKfmMYez2r7FDOm36jN4ruQ6SjPn2
	fdObw/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vbv-0000000DJIL-1lhI;
	Thu, 10 Sep 2026 03:38:03 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vbs-0000000DJHO-1B1i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:38:01 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66fb8a78ad2so8709957d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011478; cv=none;
        d=google.com; s=arc-20260327;
        b=iRO9UYQp+//3mBowNe5bQdCUxJVsNwmK54f/RCRbRi7/D/qcUUkVExv0B3SFmrwAXl
         zZOVJwMkk39+5g+bszN9naeASt6pMvt2Mzbt2vI3E00rCI7H7kqCaPxMa157b+GrxuoU
         cPCd5En6hcBlAyF+GN/rWogrlM54AqXloA6YB/l0QrxDRtNzqvsNKl6L1qvxe3SiOe2B
         B5PbVkbiynNk+0wOU8+w+1a1DlAwDdY+CFiVPZsQqNMuCQ5uxkZR4lG3WIoRvq9NTI+b
         1RVNMtLvlrgZ4bWRqjVgFJHWIteqY+++LrJyykdHc7chwTTZH+fG0z/as/eU6721ld40
         x0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        fh=iyfnBsoDtqdVzdQYkXJwUCSvxble+CCc4z9GYFDsdzw=;
        b=BQ9zfKclzVLCR6sOhhiY8o/GFqohonsh10BtNydncwnaiZj3QNuyJslWkVQeaL6OEb
         jdUeadO0S1GGDwigtAc9V07p/CVyBC1D2yKNLZzfyJKN7TDSfc/2Fa3Wuaq85CDGrTPt
         S2o4YoR6AKY1Hwyq9uNPe5ZLTYpv1n4UaMRckIq0dAaRESSzIzvvwzUKuEMKFKsF0lW7
         wUu3jEwYUiQgxWQnn+D70WLyj175dfRYVsNU73eO6Hrr0r+lf1Sj4UDOfBWMktbjp8S0
         Z3q1tNhC1zMeP5K80IaZJ8Hzk7SjY5o/sxZnat48a5ZwWO+P/s3gU7dx/4F+icteXZai
         7sSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789011478; x=1789616278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=eC+ZgzkThB+Exaip8722RheQqzrkZHf6tRdi5CAN5wrkJrpaqMHdpGQsgSCtT791J6
         Fcts0k3Wa3JKw1rL65HYibglLQ0ILxkIJWkkocWlQIDhD7NqqMkp61OrLlfNKZsGPY+B
         wVxgc0iqBeunlv/Qxv3QWFzygdbKdKTHbpcA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011478; x=1789616278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=BRVWEqhiykFY9eNBotZOTnxpLUFUM81Iq/p6/ykBe8wZcsJAShyrQE9bDHbM5goUtR
         1Wa9VABiqI/e5WuibXgMQKEbIEncdHEno7swp4Wkz9/jLewAMGlxIhjpRQPOBFchEB+M
         YduuCQUwLnrleqAXt0GTZXVZ5yrn9j4UorJDhiDYVgnYgDxV5q6odp2EpXWBk2+5JiNY
         gGVOBv1GsnXf9+Ee29N6aTBt9I2gl1jkFl5N2zFRU+arD4LpUgAQAa9EIP2rf3X8hdcJ
         fa+f0O1f+jykoXXrJ8oZJqlE+0Mz8upamByCaM+brReAYEX4XIGADe+hjQk64jmIh5x+
         1+Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzssk/Yu8ZIq4zaSZp5lzr9gJEppO/PsALkM+DPsg19+v1CzV4jTsbFKX+pbdUT6nrLP+eqvz5U6zGFP/GtNEZM@lists.infradead.org
X-Gm-Message-State: AFuF++lTNiT7TxXjhgv3VPehBbBqUA4pPZdK3hM71Vrd39Xrv2jWzPsQ
	UDFp3f8WmQXcWDMrG2cZ2isaNYgZTEVB1GvLhKXWQWL2L2YFQ37Ybyk/o4lmH17z2oXmSbGf3JB
	hTUllNIv0C2gECHD7zINwPnWEi1p9MLw5Tth8qHyD
X-Gm-Gg: AYBFou2XsQpl/E1xFmC7b+cUhO9yvQVo/hQU+Pd3A5XpjU4BuNvLZPcs8m6uCE6sVYu
	kz40uaM2GfnxXX0dnD04uULNejmo0R/q3Kc5PaNHRtnLqq6H5UA7iSyvrEgWuPbMr/7JGIve1Zu
	zzVkbwrGuyA0Hyb9WjtkKGMy5ctXFASgFfC0L24MNcTuzEG+jFBv6iqlrtE8Xk2OQQ27BIAkz3l
	H5pvNSWwkKBV7X7P/sO+T1edayZr6Uqe9EuyYMfnJ8GbfQMrMr5hFmpFbHoiFTAeIg0rH4+70GC
	yiPfea630FcqZDUEWqUz8g1pUO01TnBQz2m9tPdMX3vBKQhtOon5u+UsmabRxD8rI3Bhk7su9CX
	EMt4koBWr
X-Received: by 2002:a53:ad06:0:b0:66f:c1bc:408a with SMTP id
 956f58d0204a3-66fc1bc4792mr7713835d50.77.1789011478612; Wed, 09 Sep 2026
 20:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260910033000.15926-1-kmehltretter@gmail.com>
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Sep 2026 11:37:47 +0800
X-Gm-Features: AcwNN1XQH0BdJFknR3BDHpgbH-5I3YT4kBpqbiKb-tpDhIaqt5ymHV136QVN-oI
Message-ID: <CAGXv+5E7AjJLxKeq3TetBJEsPyNuKjyn_bSsQccg4g2g6xR-pg@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203800_364292_5C72182F 
X-CRM114-Status: GOOD (  19.90  )
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

On Thu, Sep 10, 2026 at 11:30=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
>
> The comment for mtk_register_reset_controller_with_dev() names the
> older helper and documents np rather than dev. The new helper takes
> a struct device and obtains its device node internally.
>
> Use the actual function and parameter names and clarify that failures
> return negative error codes.
>
> Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset functi=
on with device")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/mediatek/reset.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>  };
>
>  /**
> - * mtk_register_reset_controller - Register mediatek clock reset control=
ler with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset co=
ntroller
> + * @dev: Device used to manage the reset controller resources.
>   * @desc: Constant pointer to description of clock reset.
>   *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>                                            const struct mtk_clk_rst_desc =
*desc);
>
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> --
> 2.39.5 (Apple Git-154)
>
>

