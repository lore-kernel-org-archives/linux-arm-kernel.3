Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCDFC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=; b=Hxmq3XOZvgXebmtaXzVN/juX7S
	BV/b4uzxGv7n1oWUSZX0OYfBbAiV6rRV5ewTSGlPLFIlbeWkJ42mSK01zvU4Fx3k1Bk20rqUmyxir
	YwoYVqI1L/hV8hNs6jdUqW5gGbFrUHNduQIVuE3Jk4DVyTYaTmz2HeHQKsyAUWUmbzB5WBYM2gZnK
	vPI1CpNd5CXWU4bQ0EgxcLKMFY1MXcaTNZBJnGHfUL0M8rT/1CQ1S5Ch1YSrwgtTyHO+SNaR+ynIX
	DdpANg2oaPNpPABWC6/3sWLks7B0x473hkaZOuvleqs5LUSaVlf0OXJFnaw73OSWTHQe+0MpgSeO0
	57Y06HIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0qY-0000000BRRF-0jkA;
	Thu, 20 Aug 2026 11:22:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0qW-0000000BRQX-03BE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:22:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8486ac3f347so631756b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787224927; cv=none;
        d=google.com; s=arc-20260327;
        b=Hiym1fcDFOP6z+GQoLxMs9Nmr0p+iQK8pLDqCWorqf+O5aS88DOxkIXyqBXe1GFy0g
         ToxA/mN+AU8H6vA8AfNd5QForJW6R+bS2NelXw6dKX9hSd/TjHf63J6fp32RJAkY7zOX
         +LbVpjcUSwErHn9twRJXWysO/LQ4XvmnwiwS5eEB7BEETBUk9gZgKqm51HkV4jAuCKkV
         5Skku05+nbjM5JsKAz66i1G2OpA07Dig81EzPJcfvO2FyzZTX5bCVNoQJFU8NNljmRI2
         mNFdGndIYXNv6CNyFjljMABfH6DpScx1W6lUr7gEeKg5p6JzDJy+SubKF+rFE/pseD3K
         THIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        fh=oU7cFmOZ4BfI771/dKti8j4heGr6rKJs9fR+FjmItA8=;
        b=sUN5ZvLg0D/IMg1fHXfbMzGINov+C1I+kRbpDxVAsIbqb09YhN9PR4s5ATzF17yqQG
         b2wDXtmYITN7gCiupmLW0cxIhlRkvZ7+/km5fMmLxY/1x7lyIGi7kQz97dJpw9FRfizN
         QlU5JYhLM0A43PmFR+S4sqU6qh4+f6f9DZnCuZGu+g/M5cDmxFKa3RP21Ca9FgCDcCYA
         hk8RboUV9A3Ju6L5Jz+tfGccWP7hfQiYcRDOVF2eD4Wqi2OHXNnVAUzNEMOqjySIFLG+
         y4cx584/UudaItU4COtCsPKi6i06UKhkzmRpO1QvGsBdhvUsphmDwo7yIGE+dFe21NgA
         14Cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224927; x=1787829727; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        b=r4ImFo3bnR9n+Y+xV5G6OdZJ6fxYcPlLHmoiQSgax4J5GqqN9UwI/8k3864000ofRS
         PyTu0RPJdGYJNp6P15rz9Tx8wtqeenbH6YwGB/QfCjg0Qb27tWqnMzWM3xVb4U45jAjT
         kMELZRPLUQtDi5M2zSzvR6Y7KT6v532Z8f7AVnlNo5oUVamvzjh57JyEnYJ2nD7nWhUY
         R7dv4QikG8EZ/bQ8slxR5g7jPESBF157FfNu9UBGAArWsSeLRVyKKUzLi37mL6OuVQBb
         ugL7dEfdlYAIMV3d8caxJoa9mxJuGkxmTCKbPFtnhNOd3Lhi5qMvdNNtkvwuYojvptUb
         AamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224927; x=1787829727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        b=nPgMaEyUvzhuRNBpkSjhawmycT599BNyyMHu/+s40se77RUvRSuGNHUSPAFpFXamPr
         2my7SFTEGBPfSsZ9MvAcyIwbY9AEqiv5x1g1P+bRNyNWrudHFBLksA9+KYdcB+xT5XZr
         hQ8JBTg6nS1sxcjSSbK8WgKmtOmybzNf/qMgPEF2uH3qYfwL19NBH8AOja/JntNqtCmX
         Q9yScBLBBsk12g0vA6kHKNlKASW1zXsd1boPRXDJKg0ti5cq6XvZRDDvq7H+UDYKsrUU
         Nh8DnGsK85/IzAC6JYNII4b7RtgTJ1LgMX7TWYhrJGCgY8HGpa9hQLyHc1upc+Z/6zPH
         8/Xg==
X-Forwarded-Encrypted: i=1; AHgh+RqLLasg/ebV4jtjyOZ3oTMuhJsRbWA9b1EBYyljlGsNG8SiTSDbDy1Z8YkJeyY+QO5sR7bOD7fX6oWtgtK+Kh3k@lists.infradead.org
X-Gm-Message-State: AOJu0YzPd0G2kLmZv85fxqFfwEFXWKw87kq6YcZ/JTEHcsAAN37nM8WQ
	i0NBXJLUvsH+uCauwI48dTHlEPaQWTyzcgunVEjgWWuVNGhoy+0Pt+1jvxl2+K9RHRRYc4TuFI0
	B5La71aLRC6oZOQbBSYc4Ij1M57fQ9yo=
X-Gm-Gg: AR+sD115trSCwoiSU9W0N6tBu3nyMj7pswvS71yp1Ef2yhIYBLc5jQGSDvu+kY0CZ9p
	A39cvt62NcDpYzwKFwYgbKWW8COMeFf75vIkPNqf+oSM+o+NwWrrQY41YP+Pzn0XvxvtVbKRCMb
	zGLZ6zO7gXtK2mb0Qkxc555QbnnPZgOSJVXTsSu8fj6SCU1dYimLWSjptLEOm1mwiMvE5xrrE+4
	AtVd3UIDSOf6X+Yt/luXgLCZsmxHZaj6cWW+n/oN8XS4fucNe6Zhp6OH0SWp8/8GyI2hsKtOlbE
	T7zVquZal2iyrOST8Ef+SJ6nM8UY8s9Gnhx54lD3RxXVSlsqo4FoIQS5lgfV8mixmZlK2jOBykN
	+kdXI2LNa/Nn+BirQA4X4LMs2DDqGxqT6rKzcn+riCdH2x9pF4NHBa9ODwwRMHxPA5YQ=
X-Received: by 2002:a05:6a00:7603:b0:842:446a:4cb5 with SMTP id
 d2e1a72fcca58-851df6bca8fmr5910456b3a.0.1787224927100; Thu, 20 Aug 2026
 04:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101736.67632-1-phucduc.bui@gmail.com> <b85a7eff-10bc-44fa-96c7-601e80eefc3b@intel.com>
In-Reply-To: <b85a7eff-10bc-44fa-96c7-601e80eefc3b@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 18:21:55 +0700
X-Gm-Features: AcwNN1Xqmf4X13xrwyEUJ2fuZQQM6YMt4gy6bjJzPbQcjJLgXb_ufsHBtAfIWEQ
Message-ID: <CAABR9nFcw+hZhUKCMkgs+L0JHJqFSKw9OQRFUm9e3pmNqmAg0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and
 error code in enable_clock
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_042208_073009_F4A64C55 
X-CRM114-Status: GOOD (  14.84  )
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

Hi Cezary,

Thank you for your review.

>
> There is no changelog in this series so reviewers have harder job
> analyzing the v2 patches. If there is no cover-letter, you can always
> paste the update here, after '---'.
>

> In regard to the patch, the fix looks good - given the number of errors
> in the existing code with invalid return code on top, perhaps someone
> wanted the function to be permissive.
>
> Otherwise it's just bunch of untested stuff and your change should be
> tagged with: Fixes: and propagated downstream.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I=E2=80=99ll add the Fixes: tag and include a changelog
for the changes in the next revision.

Best regards,
Phuc

