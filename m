Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC58DF4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9m6IagqbiMUTJX23Qe4eCI6DILlg9PmVieqm1cjUqY=; b=PSi1WPhNk69d4yPXcZfzw/rDpX
	qYW5qmHK3tO6QufDGR9KvddUWnXzxNjPufcnJN69YnxcaVkEPwrs4lSveWvid9ZBuuQ5CX3AG8TNc
	xRfxxj0cRZxVoDgcGXf9OYngxs44MGOXvwuxD3GSWU7OXinHjDXHxmNBflehbp6KKSWP8COxYAnti
	ESViwbEooz9rGyZrOom17ChruRfSCvn8CvQQFM54vbDlnxqwrCs47RIQwAkEbhr7kFu+8kH55cosi
	951G79o2WhJEZPREELggNor9JkRoEi0Vo0bStUePOzdDfQSqTNVVl3z0TGO9XWwHnQED+3Su56ajM
	4JNa8saQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h4S-0000000H1HV-0F1Z;
	Mon, 23 Mar 2026 15:20:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h4P-0000000H1GP-1JQI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:19:58 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-38bd15d82bdso21276731fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279195; cv=none;
        d=google.com; s=arc-20240605;
        b=D3OkqB90O4iDsno3jWTHklinRlu7UpknaXgYyft3D7EsDnMjVtPVHxLog6nycar/tI
         i6G4XVl2SNTLWyCX8BcujVrIZkvy2maDNdcDoT9iBXrvgoxubTediuUXvrQAxErPiOZ+
         46bEvqiAwa0da/4V4uwdtVOG/QNJLQcHWkt8XktIrq2+S9rdGaC3v9yQga/Gn8c34k4k
         l7STs+/lI7uItmfPLvDguGroyBTYaYeZiQWNNyiLbh6IPP5hm/eyIJsz2tMuB9iwAWWQ
         DB5Bl3ZZ2T6fniH/mDkwOT2zA+dtD6mIw2nJLBOVgr9ZkEYWAZk0xp2ob7hOESsVWhun
         aQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e9m6IagqbiMUTJX23Qe4eCI6DILlg9PmVieqm1cjUqY=;
        fh=crqM8FkxFLLia4zppx8pvxmHwEoKNbIYgVBrgI0zEOU=;
        b=b7mj3MX3v3oG9ZZJ5LsmbJdE4YnPjhbVhlUZsRuY8HeT0Nt9RMukqUV2CRhTR3AMmF
         gsATO5ez72g8p1rf6lmfWESDNXq8zGek62nlVnLSL3zEbsi4Srni8hC6VO2Cp0qrXmfL
         iz4gBmUJ7Ftg6T0dSXR90QOx7i7M4etCQskh1S4O7lXU8opr15q4LIqCq3qzJ/NAFuGh
         k2cHEBUELZbBpQI0+Cy+IegSMjCeE+HibjwEaFA1I19kqKqWFPIXeOV3C5CK2tX2fzCG
         scwoceSEiRrW89qGWQqPLcq94SHXYC+jPfGecodiexKEffBd+pVRGjNbYOurloX+xwlQ
         7+lw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774279195; x=1774883995; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9m6IagqbiMUTJX23Qe4eCI6DILlg9PmVieqm1cjUqY=;
        b=sLOQjafbqWZH7WpLJqJDHyibjMYZkWRzVYY40vDz7KRBx33LDRg50DEevW2TLWnW+v
         pxxOt7yzzOq2d6SKw5oBZmoknttLnaoAI9th1CAFZqOuRIIDl/JpS4YoMQcnOR8A0E1l
         s185oFEfvjI6rmss34A5JVXHOhH/LTT/Y9D89hWPb4nzqgHAQbuYLwc/j7+jpyo4AH3a
         mcOyb3hSbr8S8AMDcceAs4yzNB/U9Qd75cvi4M5aRu5SbdVmav6i52eOsf5Iv7FjjWfT
         ooyw0VsqDEqDZdN++d1YzlWxJztwv0Q/o0Menf1NIbgO3xzcry8FynFdRND6tkcDZF9Q
         wi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279195; x=1774883995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9m6IagqbiMUTJX23Qe4eCI6DILlg9PmVieqm1cjUqY=;
        b=TON92BgnZ1glDdZ8B4tj4Dl7Tovux/gQJp9Ja3xgn2aOUdO8Ge2jWPt0s5fwuv829F
         ntCGTzC6I94EOMSG2WlAs9lqjSm8UUKBPsuRXBhbCzMntK3BerPMWbQ/l/cgow5OYdxx
         aX9W0qsoAIXiNhMz01l92HSoFJ4M1OYHlj2bEJUOvTa3XWZaW250EtIdjzYRU/BxPqCV
         W8lex2BkdPrQsLRIc03TyLoQA4CoUUKyLyKRBixuhXdPWorg4ikApeJzzAA6z8+fviD2
         HiH+v3RFYRCmCP3xoQkNB5QfEtyBxyAOoy5zcIVSdo6ODxsyMAwi7aF7IVw8OMEiI1yB
         ZIaA==
X-Forwarded-Encrypted: i=1; AJvYcCVnGSdcvHcgOImU+R3i6ReNL52itkcLST4Shp0DTGO7sQZKYfxEy9QB1YXaR16urVAQEPJt8hQ9N91/iBakxi8w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5OKsM/En1Ex0eGjOvdnV7+JfRYxwJAjWU/QhDueVN2+al1tGD
	3PBw+SYRcLfWrUmghULKfSDEONXSjK+2j9oHu58/ScLuTwvAydY8FjeWGigs1O6D/bI40Q0Rbin
	Bd1PLhPKuddg7TBuR0VWKYM42dzWVOMhkhEfhf7QEUQ==
X-Gm-Gg: ATEYQzylwL30CnHm4++iO9Wale5LUK0Nqbfx/vXTSCzEdqmbdL98h2ygmEkCNfxH2AZ
	GFnrhr7Lpe+AGeuF7rdw4qnYc8GmZqPRGNSbnnI+qHv2r93MfvvXa0gy0LhWP5WYCdRuq3dEAle
	Zs7mkfePL47s5+rutwH0laXUCFeKIJghspqvnkqsQfBqpUdIqV46uXhYTJry1AMaXTrSID8JXXP
	oqMiLSYJfUE3l1WhJZTsFE8dDKK3EKt5u7U3VSA9cvvwy7FqB2d5aIXy3KokmRBi4YGoRddW4iG
	c2+L7pS1
X-Received: by 2002:a05:6512:1288:b0:5a1:4017:18d1 with SMTP id
 2adb3069b0e04-5a285b54ea6mr4675867e87.37.1774279195001; Mon, 23 Mar 2026
 08:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260313130835.708066-1-festevam@gmail.com>
In-Reply-To: <20260313130835.708066-1-festevam@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 16:19:18 +0100
X-Gm-Features: AQROBzCNP8s-Y9NKf75E5i7SXfCEWFK3Iny8BNioMSMMiWmWo13eeXGEDAPT9OU
Message-ID: <CAPDyKFpGo6aHh3qjT-cTT3SbLF8F1Y6voKEmj3aT-KqK3yHYQA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: rockchip-dw-mshc: Fix the RV1103B compatible
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081957_376173_59F089AC 
X-CRM114-Status: GOOD (  17.36  )
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

On Fri, 13 Mar 2026 at 14:08, Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> RV1103B uses the same DesignWare MSHC controller IP version as RK3576.
>
> They have no "ciu-drive" nor "ciu-sample" clocks and use the phase
> tuning inside the controller.
>
> Fix it accordingly.
>
> Fixes: 517b1e3c9455 ("dt-bindings: mmc: rockchip-dw-mshc: Add RV1103B compatible")
> Suggested-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>

Applied for next, thanks!

Kind regards
Uffe



> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index a75209bd2710..4965bb518c54 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -43,11 +43,14 @@ properties:
>                - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
> -              - rockchip,rv1103b-dw-mshc
>                - rockchip,rv1108-dw-mshc
>                - rockchip,rv1126-dw-mshc
>            - const: rockchip,rk3288-dw-mshc
>        # for Rockchip RK3576 with phase tuning inside the controller
> +      - items:
> +          - enum:
> +              - rockchip,rv1103b-dw-mshc
> +          - const: rockchip,rk3576-dw-mshc
>        - const: rockchip,rk3576-dw-mshc
>
>    reg:
> --
> 2.43.0
>

