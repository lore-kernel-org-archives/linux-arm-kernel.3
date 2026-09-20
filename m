Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBBCC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehp9Aplx73w0kxknx9H3QmiLQowjGYfxL4eGXjvfQCY=; b=yTsbPDOGuCkdGd1GKLPmBAWARu
	GER4BYM+UfYgio2BfCEmLBAr+CYnz8pHbCA7bZxmahSIg0ei8sy+s7qi8h9sr6aQhaAEu7aVL3q30
	pWgxecmAtNQYvWmkQAsZuZbfTECbibp5YjUmb9reP8hIAU3CFZb5XgVzpvO3MQrPuphqEqfINpbbr
	9UnLI8h8OosT1om+PbHBHjbfX8ir6q7AbN9lVE4yoOz98XNp5dvqGSDk0tGQMirKfTk3Bts6OqOVY
	9pobgHzJ7Ia1GjxKllmlDO/2JrBXb66Li7jhLPoeYgDsn5fK0Qt6LM8196VDIOo5nIMgu1UJC0WEu
	eEt2BrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DFp-0000000H85J-3GKh;
	Sun, 20 Sep 2026 08:50:33 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DFm-0000000H846-0dMp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 08:50:32 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e620fa473so11727605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789894227; x=1790499027; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehp9Aplx73w0kxknx9H3QmiLQowjGYfxL4eGXjvfQCY=;
        b=H1FBiuTcT1E4HXWgrY6yUjAZCidvYHuwvQ7E8Qha/nMVcILWAVtus2Sc++EAXVXpRk
         FaUvQhFpT764w7BuZEu+vqDF4FSoWhKETVvfxT/NkZwkcy43rEwlTYIY3Tffyow5n0wr
         xVmH84EMFqzaCr5asejakPfZgyed1xeaCcRU8XLp+3ZSlB7PQqn0exsHinH1nOj2aOi5
         8f6p8qQfT6CRbyBKj0LSAgF/l6yDUx71beQ0h33yNwfSsPJotj0yyOVmamsLeBGnsTDq
         vxcOcME2kSofLnb+1eWf9TnEQLP18ratsNWCF7m2vlxT2Tdw42nFM5ZdrKAXxOM7KKsx
         U7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894227; x=1790499027;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehp9Aplx73w0kxknx9H3QmiLQowjGYfxL4eGXjvfQCY=;
        b=yKir6Zw7/0hAeD30b36S5DiDjytKi4ni1TWrnPoijB4GOg2i9gdoriyVBr1NKw0zqn
         Jw84P4dWZS7780Gk2WeiXlRpMMUQT/8LWfAeyVWyXL9XRUFZDYZ+i7k99iyCDUKJ5uU5
         6EuT/VU4d5Kk+6jDaIVNyvNJWJz0hcpikfcgIocnoLyS3oCSynEQXDHfZC4l09hSiuEc
         L68+LFweg6lOFXrtMweONHB6aipCrOnk3GSf8Ld3ZXkOxlu4+On1UYfH5upiMSvGvgrG
         00tyCRxZhexGhUekWETamOBxgSw0IiWDHg3TrfHNwDLKheURs/WeL9OgDkjrZrtTh5Ac
         cE+g==
X-Forwarded-Encrypted: i=1; AKwUvBx/5j9HcETvxYQ5bjsNv9Zm8hinG4hfSTmAZxu3vvfi+eVDkE3u40Mn776fq1/YiqDQn0ei4p27h2uE/gzZT97X@lists.infradead.org
X-Gm-Message-State: AFuF++mJPH29YGp34QMCGyaVcQlbE78PmI3byjRAbcDNZA0TCS+CXstF
	dtaYpmo0gowtC7cot1OLaIg6dFsNrXoq2EmlqOUfh16Z1HcmBZdsU4v23Q9jsoaB7qI=
X-Gm-Gg: AYBFou2B52afCDj+/kL4Ddhc1XDvVHWh4P7Ka18gz7//SYQj9NHuafirHdHA/OrwQyy
	8ISl0Vegkcc0BdR0yOnppOTnpJcostkBrdTSE/xHWpL7fDmTV8QfFqOXvXI1II+i+WIDlYJiSkz
	xGLBOY/QRiD5aWNUw+PTKYWolrwA1sBNTZOjnQHC7926pzJvdOnOju7Wp5Nunha3f7XZ3z1TjNC
	EFCZkSPBnKV7zgb8F6NYGZGG8xQqFcv4YkpfjTY2SM1dC9qWb6z4rxb8d75YB+fF3YqQCSoU8EB
	z1XpHFm0YE92FfR3Bu9QmHLjB26YGqe3RtZJZYKHg4jhc/3OsxJ3znPaBfXJKtcn5VpzpSuNUXW
	6wm2ELXZ+3YzJ9REWlmJ6D8RzOJ6iDjp5uZsgFZQk6I6Sv3xO5PiW3lVKVdQyRdu7lKJUuM6hVI
	MEMTsI4obuCoW+dBOANm07aPc65AhMF/xULAYTmHdJluO4cYul+C2c0kwGDKIx6D5DDV+7gR+Kk
	vL6sFT7wvN1Ty8xcA==
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr130966755e9.13.1789894227775;
        Sun, 20 Sep 2026 01:50:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm67312145e9.2.2026.09.20.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:50:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
 <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
 <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
 <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
 <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
Date: Sun, 20 Sep 2026 10:50:12 +0200
Message-ID: <1jo6dscnnf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_015030_583042_5FDE30A0 
X-CRM114-Status: UNSURE (   9.46  )
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

On dim. 20 sept. 2026 at 16:22, Jian Hu <jian.hu@amlogic.com> wrote:
>
> Regarding the suggestion to remove N from the DCO and make it a separate 
> prescaler,
>
> I have a local draft for this change. Would you like me to send it as a 
> follow-up patch,

an RFC would be great, yes

>
> or are you planning to address it?
>

-- 
Jerome

