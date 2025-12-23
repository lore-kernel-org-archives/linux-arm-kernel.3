Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36484E74900
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 23:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1EjGYP2UGBwtZ05v+i9zGbhr9QL9BrOQBe7XkYsNk8=; b=uOv4EPTaG56XTw9L0stTv4ged1
	uI35G2C7YcD4pkAWN9B7Fh3FeZf//omfk2MH+7N0lRuY6IRLYJqoqqxtft+Wv/ZlUcuWD6rOidsLM
	zX0kdRzpvxS1h5G90gk+1P4e/yoSnIDyoJk+Thr9oZxstvUWaPQuSvAtGTVHy5TgdKpBHKb5bAOqA
	3iq1pE1DMylJkc+D1t/FZ0mmR6y0UEo86oDLRvx0hf8PXB3S+jUaH30O6jXfuBZEHNMa+xCo2fFAB
	qf4zI0Gw+mKIweeKZy2iCoxcPuO1l+4XLwWXsY3QYTR/aeU/yTNqbKOBpEZe2dTcYf79Y7P4kVqwi
	9XcQL6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBVd-0000000GAfL-2h42;
	Tue, 23 Dec 2025 23:09:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBVa-0000000GAe8-3yLJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 23:09:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0a33d0585so51325535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766531378; x=1767136178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1EjGYP2UGBwtZ05v+i9zGbhr9QL9BrOQBe7XkYsNk8=;
        b=Z8PkvsA1YDf8nJSD921lLbTtXOFS7CnfAMgFWty6vspT5QEzusMxr01u7LTwlQlrrm
         13z+q/AsdhKKjurQc66DTW3ODepSmoUkpPJAI7Grmx9cfJ0f4L4ReZHXn6ybsnrvaBwz
         wJvVEZSCIh54Ltfh8bZrxWdhXscTdiaCjuinV98nBD3QpSnXclRy85HREcA21Dv8qDvP
         sCCqHOcR1IXJw/5klqCxE94s0813y9/zRiVSXCHafPrZfLFrfTQzD4XZp2jZ8JaFqqMw
         l0jG+h3+vVOzUo09gf8qjem2J0YKHosR/oSVd1cYtzAQs+40Lgso48raUWjyhF14uhLp
         UsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766531378; x=1767136178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1EjGYP2UGBwtZ05v+i9zGbhr9QL9BrOQBe7XkYsNk8=;
        b=pnOwKAiR9m+mlkEmwa69mYzoTubvRLtqzya8tBz13sMVyTeObP1xaaQckEy81Cumtk
         KRKnYgIoe9IrhcKPTIhlq66NFbQyzOLrkXZxHn16BPSY7sVTcLQWgSdHao5U0zoneL/z
         Kpa1TpRmFYwiIEgSEgC5Wk2O70cwdtpDtUfn7LmmdQ380GhdnibZ5bG6WVocvTuwin0f
         9gNVIOSbPPGtYzBjm1EYpAJfxvZIDdk71EhkvWn5zZSi7Odx8Mgxpl8uRSy//WNcLHCk
         9i9iiEn6ON+Qg7WVGjkAkXs/8bWdBVRJBiS6sc4wv9R6rjaRJoxm3bYsKAJk3CFVzqsO
         6bQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV025BffwnvZWpC2Joex1pcgAyABHGVgtp22LjyUI2lVuVkqCqs3N7+8wGwSaGbUIZSaOouZlk2E8XJBMtJotgl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0vukDNE8yMnOUBqOJILqhpmhfZVfyGEPD8C41A+fwyUzq3pD/
	5/4g3LEFnMtqis3NeNp5txt6CS3d0RnTSICzPyZ9w3HX4n3ndKjpJpM/m5E9MGY6mWPVby1iOQB
	jFG2FXmB6SgdgTnotFAZFJBPiBTVNGXQ=
X-Gm-Gg: AY/fxX5y6/X1vhl3e0tVb9ouM7YXwQ9txUAn3wbztER95d8eKnBbfVrNhV33AJZ4IwU
	aa/NFHVkqF4UfcF67Z+jWwO3qpMhrVEz7IBnCBJihPIfqZ9JywSFsS5hoBlq+h3OaoyQzlo0gGp
	FqsFMRHNGKP3aBuxTGcwszjRNRguHXnU1yiwiNprqKbD4YOqlRelRm+gs/J7ItO9TSwWUTNmIfZ
	CiOFXax8sBAy5gg4kz2jw3X7hNYWBCVcqXroHTftsyF+oCNF5NVBMjWuCYIJYY7L/AsSjct4opY
	1td6GpIpuVNNi3Rrb6+BtByfKLmf
X-Google-Smtp-Source: AGHT+IFUSCkAfRP0I6/HxdHEcLNE7m8wfG7D21SpknHBGNN89HP7uArZIqvkPs7+jmNig3meugYVG6juaO/qZ6BfIYE=
X-Received: by 2002:a17:903:3508:b0:299:fc47:d7e3 with SMTP id
 d9443c01a7336-2a2f27350f8mr156126155ad.31.1766531377964; Tue, 23 Dec 2025
 15:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com> <20251223152510.155463-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152510.155463-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 24 Dec 2025 00:09:26 +0100
X-Gm-Features: AQt7F2ryDIpXSRh1nF6x1WRfdFopeDKxRaQNT7WxGxtmZzK7QOKWjATFSuNf3mk
Message-ID: <CAFBinCDRUEKeE1ufjiqX=jr3nrJX6crg-rBVU5DW66WkFA5NAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: Use lowercase hex
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_150938_983942_08F83A47 
X-CRM114-Status: UNSURE (   7.60  )
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

On Tue, Dec 23, 2025 at 4:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> The DTS code coding style expects lowercase hex for values and unit
> addresses.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

