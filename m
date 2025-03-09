Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E3C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axZ+5e4ppBNtE/voflpOoIYftm6X1RtKy/F9SCoP6Ps=; b=SNqsa1ENCvV1a3bnIF1rpTyg0K
	OjhJOy0PQfC9mINObGgP3v+T734BNN7paiZ2LvAO3w/4ghzVYyU+VFnTzLl0iVbpOcg6qN+lit3rQ
	yG3nPa6x/z+XxcyjUU7y4Rh315Lwtq8b8R8QtJuBYYQnuLkY+hSGnKvggVq3qVT5Lu/wrOH8rz2or
	V23iLEb6/JHT0rWZEJt5qpmdhc7YECc6OtpV2beKnXwcVc2LY7u6RT3l65Pf2I4cdBTsZ93WReR1W
	6O6nBdtOQ83YSZ4Nn+IedpViVxIBuQFK5JTA04Z+OFmjUVaPqHZuB5n8vxmTWstf9qa72XWGXQflL
	QQ+urMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDrs-00000000MUj-40Wz;
	Sun, 09 Mar 2025 10:26:48 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDjc-00000000LPy-1MNM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 10:18:18 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e53c9035003so2939580276.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741515495; x=1742120295; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=axZ+5e4ppBNtE/voflpOoIYftm6X1RtKy/F9SCoP6Ps=;
        b=U/j2WCiOUxkt2RGn9a99EiebV9TepVcOnN9MwVX1GJNjkzJUhldoyIyp6MaqNy+C1M
         Dc6JLl7pS/Z6IpScM+yXKeZX35RRYElre17vuVmo+/UEMmQTKE9yXDXA7ilD8v0+64fw
         QAQiuIDcvSV3eMARH/vnogVtdFNi865UHHmYXY3SyKyySFR9zxKqDlScZI84z0MAhKMG
         rj5+qxQSD9ZnYgcMZHpF5byhCjb8G0dBJ7rOqggg2Q4vGrMeehRtVqxSxaVrWVSdJyjk
         siERxuVXTZpv1o9snFi+NM5/T47kU7ZAJWvZ8u3dLA2HJmnTVSpRBelN2Ky9UO+mMMgd
         JEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741515495; x=1742120295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axZ+5e4ppBNtE/voflpOoIYftm6X1RtKy/F9SCoP6Ps=;
        b=VWIWwOJyMjqVj5FfGUeUhNYEoJmHNs1ebTPd6kO9lJ3xhXsZokdXTUvc4Lsr8ijnQu
         IkEIhLK8rCpjDp16IgZTcmg0mfWNTYr+ge5tlqbcX569KdsZ9tccPd2MNxCUMZlblY+M
         z2QYxzNFUIAq0fanbRYxnqOhbsFNnWYqmZZhaESWzGj8SaWBl/cQu5ywmmnktho/JEdq
         /BgI3SRqwLX0skXo1fLzngm8CpVVadQyomwzqx2PqGqxMwqAyMeQSpB7j5ucWF8/K9c9
         wjKOgeK4gVOxka/J0NwZy7uqZtsTo08xaN8SMWKCp1/1WlwWwFoeE3DDnBaYeen+lsIK
         82/g==
X-Forwarded-Encrypted: i=1; AJvYcCVaasZCCUltVLyHv3ATAQP6RvNIvQDtDIw85ComQE1d3q8+gP/PXJvVyD+SSImL9Rr7cEuL+4GG3w8eOcS3trkT@lists.infradead.org
X-Gm-Message-State: AOJu0YyxTOe4NpUM8AlfgESWZcFLor7ytRbd8AjG3d30VU9XK6kaSqkU
	PZo25W1NrXx0nrE5PtQJCH//4zx/BnvFlFqJlDYQ6awfXfJI8Ajiphg8qi8HrBBxWscKVypux0I
	JFHVgz6mitUUwtbkjQssPsrzipPNNU6yuZXQXOA==
X-Gm-Gg: ASbGncuYa7/mqIsYoQejVskYUUxVu/pPT7HPz8WKjz4797zHdKg5Nuh0czL0M+SENPN
	rgIKt7NVArSGrnjVKzZ+j0pZsSlNJ3QY6ewNGM01KvbeBw3K+Hm7fI8UYbm7mXZwmSnKLpbAj4o
	RJkaoplsJxz6KkBopd/YtVAvpCCa2TemtFjulmqfB5
X-Google-Smtp-Source: AGHT+IHzYJUEBCseRpB1AtkBRhzVmaX6lTysQa7mEET1BOVVRq9VxSIkWUm8rz2mPA0ndjlMDQlVJNKo7thzq+TTMXg=
X-Received: by 2002:a05:6902:2307:b0:e5d:e04f:f2ba with SMTP id
 3f1490d57ef6-e635c1ea9e1mr11547764276.40.1741515495265; Sun, 09 Mar 2025
 03:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-12-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-12-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 12:18:04 +0200
X-Gm-Features: AQ5f1Jo4_HBXJ7xLHJUnhsvem1EBn8fTfXsqaT-YVMexvyivzGMAkeYh6r_Nz90
Message-ID: <CAA8EJppo29p+8a5VUbr6dwaE9ywgS+-VcuUH_sF+NdA0xGU1Zw@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] phy: rockchip: samsung-hdptx: Add high color
 depth management
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031816_404699_FBFFD83F 
X-CRM114-Status: UNSURE (   9.89  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Add support for 8-bit, 10-bit, 12-bit and 16-bit color depth setup.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmtiry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

