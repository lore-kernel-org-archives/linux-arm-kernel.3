Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=; b=exkjDwA3823kbGuo1qZk9RiaI5
	1DupOA3E6L8eeJfYlfKItXwYcRlz5tT0D1JwsGOv50pmwimQPeo0+NnNwt2ubfVIHJzEgI8d3l9bp
	Emrpn5S95Atq+W1CV0S/9/N0HMxZgWBKY2w+juj7ZdRXh1iYY13MsF7mbPzSquelepq+R43+Xs4Op
	lpIZbVyh9BP1VUbkb0IoRCt5FHoapFObqRIU2i1q0FiuQIsJKldR0UoqKSZ7rudKev5xFpmC6DKP5
	8CVGN/bMDQRhSm15lhHROBQiO/Eyv5Vc1pfwpfcj9GdyaSbdUPI/cMccl8YxhOnwp7/KnWqKpHADo
	coWK4dGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Mv-0000000ELm6-3dL3;
	Mon, 29 Jun 2026 10:37:37 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Mt-0000000ELlZ-0j2m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:37:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-69863ecfa9dso1497654a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729453; cv=none;
        d=google.com; s=arc-20260327;
        b=WZUG1BjsnUwXzsdt6lnRj4SWO65gGz62+Nm0EAhmtiF09GxRdKk004vHikzI0T0XVQ
         /GWKDDpjR2m7GFXg76REjh8SLODvHzYkCOVuW0t+ZZzG+IRGS01mMvjp8PrhCTeaisFs
         odx7roAhEg6eepfVgyexiAZMD5/xw8XwAnvyq+e50w1EFFjUFWn6qfEDMcHqOay0Iz5k
         UOYD+mjdB4lzIFI235xS1ey7Mc3028Qp2sWsT9gbn81iuTKWWZBSS+EHZrE1PbinlDjk
         OalkfjUH9qhnimO5iEOBiaSzjafo83EruupOj972wxnSwLIJBosOvnBQO3G9TGnVaAM3
         ogQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        fh=AxPcRQxr/YxninQNK1AY3igDgAY6+Pbc/SryF1GHN70=;
        b=m8KqnK1dAasQ7/G/0MgCcLhiArFWrWWXZY1ABYcUoee8PUpKZLlfFkf94XWiE8a/49
         VVF3kALuO6UH8Q8oZ8IRTFkoaCcERwTSK/qDbShYsegC+qKzXaQADzLl91Kx3xqfALy/
         yJ+lWI2iVQ4Jmp0q3ibSV6lG2gcOwFJwF7+3NNiA1ZOcuy8yzgyN0g0eRzfbuVe4FvEM
         NNFwyAqPaEFBODT2ajW/a2X/f/FqakfoffMKmlhJWFVRPoJ94o/YeZvqRrLiCteZZdX3
         nqFN+dF6C4Mxk0BmIjUz9iBHc9RT1/Kz3Lsk3YEcWhGS02mdGTkRkSS8YCbr0/3qh4WN
         Os2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729453; x=1783334253; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=Ff9yMgZ5VVwFgSf81y84BX7dfPH0OzODeMlCJlCpM2BN88oPusy2EUAj2NrrJlUXw/
         t5S9V19zZr881+I/4YTmnMReMR4BnCMltfjGYcniEgWTMpZnKHjN/Xcus52xwDt7OuaN
         Hr1MexEUQ+H7rJDI94oqvtV7t0Me03wBg9x/YsdeFsBROk7REEDg9iag+wTV3iHfmjjA
         4objLY5mrbWf9nd8SMiz9nbnQ9diU3wuEFSK8dQzXkJeO7rzWEe5fXo0If/C3VlL9wtq
         u50ArgICvqoR3D/LRMDNBv/X3HC7JvBXStv9B1nFJeZd+RM8lzUfIp4XyOZGyzd2OZih
         BCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729453; x=1783334253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=p2+S/aP/Y0d2oO30ZDi0J9Be+bdTsCQO4hMcbOsa9+AVbzoVwn3U0dxwa2Xkv90RfC
         SEjFSOvyW9VIC4/oi/4Wr0G27RZjelEWKeO/P28erYrP16aK3tzzfKib156dtTFf1ADg
         Tbmb3/YbafceYZDGpY6LDJM3Klv7DGE1AQ+2NBAVUhkTX6OK8xmLWQiQpOO/S/QBGRlL
         YGvF4EmiyaSsA0umhPq8CgEdp5Pr8zY9iatVOKBw2xFSEr672UxVs/GEPn0QAZLurAQ6
         ktGhBE+xGfwMc+gC1DFHa+SgtHPVkVvp/dNuThtffHB5hV1sH9F7tPyJuU90vpdjE0cJ
         nbHw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1mJXpBIezsCUlC7LJ1I3LiB52y1zBrGa469diVspIzLVOoNnj5HdkMlwAIbD94Ev3nhMw9C53gqylA96yAZ5a@lists.infradead.org
X-Gm-Message-State: AOJu0YxvI+yD626MLLRjgZDKrEwDFNLPJutUQS4iqPJm6URQlzeYpfYy
	TygU+MARtTp+q+L9mQO50U2MptsGpNwC1NirpjPYPEQZk5+f6LW+SPkARqpHWCM23D/FkDcKfpb
	mFggj4vZcvZ/OFETPFKZCctgxOd9OYB9j5LJ+yMDHQw==
X-Gm-Gg: AfdE7clJj0w4KgqzHq/CzA0fTdyOmkBwMvc99AlRNYBunHzly9GCn2/YRoAyrFmFeoc
	9SlvMsjamXIMUzhnA8RZcMKDwjmFATuegx/7JVwXdEAFQ3r0QKsH2NzTPTtu2/qR+vmiv2hDqAY
	I65BQcjk4sax7pOwQs7oODYPC1X5nHEdR4mgwIcg4ihiVuyrF2AXOao4d98Ss/UXtMSBewUqX9M
	0Q/Knd7xe0tFfmuKYU9Jk/9CarlvhHkYqNiqnwjQHcTncD985M/QFRMU4I/bSdjR8rNmgM/6fiX
	z91417pKRAEK7tS43kLE6MzEU0Rvmw==
X-Received: by 2002:a05:6402:430f:b0:698:3f58:9290 with SMTP id
 4fb4d7f45d1cf-6983f5898b7mr3425467a12.20.1782729452868; Mon, 29 Jun 2026
 03:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:37:21 +0100
X-Gm-Features: AVVi8Cd_KzL4j8x2t75zH4aE58eWi5dZrC_hXca-XTNOV6txB2qHwNYu_bbkjxY
Message-ID: <CADrjBPoa7pTyfANuWznzeoLm7oWdWGcJbGxW4hmuSWo-R30SJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
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
X-CRM114-CacheID: sfid-20260629_033735_241722_9A2A0965 
X-CRM114-Status: GOOD (  13.99  )
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
> Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  include/dt-bindings/clock/samsung,exynos990.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
> index 47540307cb52..c06f591d9d90 100644
> --- a/include/dt-bindings/clock/samsung,exynos990.h
> +++ b/include/dt-bindings/clock/samsung,exynos990.h
> @@ -434,5 +434,6 @@
>  #define CLK_GOUT_PERIS_TMU_TOP_PCLK            17
>  #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK     18
>  #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK      19
> +#define CLK_GOUT_PERIS_TMU_SUB_PCLK            20
>
>  #endif
>
> --
> 2.54.0
>

