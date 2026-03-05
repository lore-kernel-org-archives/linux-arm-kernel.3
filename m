Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C31EEF32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocIav81eGlA8J7gguvP8abYVPg8GbAkn/vs4f2boCyo=; b=jGQ/IQcaJGZI+mJ9P+PquIAS+3
	yrpw4PmVwB08x7XYLiagRuJggKiXYpae3RD4ceGNZQRwZgslZOJJOUTa8F/qVm9u9BRPQ4kGeS0Cv
	+9vahoD4v+0IURqyTNcGK7TmcvnB5JAn4Rts1dC/71d0tahS1acodzUB/szf9rOn+YJyp1FDQZi6C
	1xozFXqcwHRv39fU+zqCEt8WJM7uTdqPaiXiTcz/UaLNOSINcHleHVQ3LmQuVmmR5gpOJTc7418er
	b9g/DiI6XjxjlJerYN6vQ643eIEQCQzl66u2JDG496edM/9WGkONxvLt/xldPCSEwqg7fNwMqv5sF
	yi0zoBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4WA-00000001GKB-2p9T;
	Thu, 05 Mar 2026 08:57:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4W6-00000001GJE-2Y1h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:57:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439c4bde55cso1397196f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701028; x=1773305828; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocIav81eGlA8J7gguvP8abYVPg8GbAkn/vs4f2boCyo=;
        b=UF7A+dJiafEd3sgzFJis3PYV/d9Hnn5RiJqB9KRchz3nXWV5yCEOoVJC0DyDUAbzda
         wgEHZeEBmbananLd0u0egpJZGflOutjuMin2vNKe3hQFCsmiyFQmAwM/U7EVUWA6PZct
         4sdO3IfMexP4LpsEb4O6F79wFPdz2HZVuHPLXYqyWwJRO0x7x4967zHU0Bk0uMphW+5N
         +u0znUuoBg1S1UTmGpKK+hJuzsdUvl6E1xu7qwP3yylttMVCP0ie6RuGUezoK0Z1ikEu
         crYDxGXx5tkAsjQzGuOZkaTovYbtnmt1Mk8YpMrc5jHeFvOiJfe+whwqCybsut9/iG3l
         hk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701028; x=1773305828;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ocIav81eGlA8J7gguvP8abYVPg8GbAkn/vs4f2boCyo=;
        b=WgKDs+IX9r+GluJb6aqZTUM34Sczye8hSElkXsSNNIW1REeeEJEU9GJJLmC2UzZ0a8
         Mu9xXiQzvwy6GHSrgzkZfNt99VNJsdze9rxzpzxgd++iwHqlESiIGIiJ9/6Mo3c08qbo
         IBaoqU7CtdnrCsPhhbhqz9U6U2YBoinNNjV9eb8UTgLmNvAao5tSFDiwWZ7vSZmGzkwv
         jqkK0gud2Wn7Z5O9T1WB0Dey4tuy3Ob3v24BIVnMk81RIITq7SFPq1VfULKzlBIQUXUr
         XPeSv7Lk7e9tIUGnD17APmf7czda4NEeFvBoT6Bdo8lm2i7r8l3ERYEFPBhdk3Ho5DiG
         3H8w==
X-Forwarded-Encrypted: i=1; AJvYcCU0puJ1gD6HGUPeOyOaQv7qbXGSjTkSUyikGkkqtF58kxtjVcvp7EK0DQunEr6JHIDdF47yrhqWrYJ52DpBJZf8@lists.infradead.org
X-Gm-Message-State: AOJu0YypyPyaj+naCi+EgGSOqHC9kD35/RbS/cr8RtpeUKCJXcb5DlIX
	Z5HJLN4wGhUVooZzGFhshEGnVEvg9E1iAPK3mb0M0R1NjhYJfy1ARSJx/OkJEds6gvE=
X-Gm-Gg: ATEYQzyrlzI4Do8CegE6piJlZ3MQ5pkH7Bg+3zIkYFWAmw71++pEtUn+aMwZ+ZAogMx
	dK6rT2zH16N5veI+FpDL7qj+1/Ghj9kk6bQxEZMsyKsbhbTYw1Q9XWSmvHtw3qbPyUBkmXjaDDw
	s56xHR4XvTczvi81Y7mrumQTPGfI+h3b+N421xZW1dZSbHYuly/kh/kxHc6bMUWU5lIOLexsv5R
	OgNovTL/02eg2WByWKaPwkeKQDCZpX8U0YRPqEyiXtho1bVSHSBTSLuaNGxWdHokmpF6G149drT
	pXfVahS5KhkF1BAo5Nqx4qFw8i2uYjh8TIS1KkweH0RBe1febLxLcjQRqn3igGIwNdJvyYSXML9
	YgrCKNnsKWQ9neAxFyCFfgZcuPYrj/Oi12LKzYy9NbwaFrPmHfoSBEPcrI6JOHtWohsZXp7N7mc
	EGpVRB88HI9PP40o7L8diT
X-Received: by 2002:a05:600c:1d0c:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-48519874e2amr76440305e9.20.1772701028139;
        Thu, 05 Mar 2026 00:57:08 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439b485a0b6sm32442608f8f.39.2026.03.05.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:57:07 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  robh+dt
 <robh+dt@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  devicetree
 <devicetree@vger.kernel.org>,  linux-clk <linux-clk@vger.kernel.org>,
  linux-amlogic <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  Ronald Claveau
 <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/3] dt-bindings: clock: amlogic: Fix a typo
In-Reply-To: <20260305074328.639993-2-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:25 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-2-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 09:57:06 +0100
Message-ID: <1ja4wmbqn1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005710_662812_0BCCC42E 
X-CRM114-Status: GOOD (  15.27  )
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

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> Fix a typo for T7 gp1 pll.

Patch title is too vague

Credit is due to Ronald for finding and reporting the issue initially.
This can be viewed as a clean of his original patch so the change should
have his Signed-off-by IMO.

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> index 49c61f65deff..b488d92b7984 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -72,7 +72,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,t7-gp0-pll
> -              - amlogic,t7-gp1--pll
> +              - amlogic,t7-gp1-pll
>                - amlogic,t7-hifi-pll
>                - amlogic,t7-pcie-pll
>                - amlogic,t7-mpll

-- 
Jerome

