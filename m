Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA57CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=; b=V/6G/jgJ82m4p5LmJ3W1TQrntI
	kawm66Va7X3ypTs6uf4d1uvvkK36Y+7qEszL4XjmPW3b65wVp/mnBulG4CgWLoVyyKSPKSQq1l1KN
	BMriIY4Efn4DNuKxoBHeuehH0x0sRrE7ToGcZOo479NjwzwP9HjctGur4oBE3n4L9UvTKy1WDXTpW
	0G2T2YSbD8UKcQUpafQaAtLoc3sfltlS7crVzMbcowcF1SWUuASJatrWzqvOj/fSuiSxvX3tnvFsD
	eBMeXv1aC/BQi8IKR5wp/zMy5bTJFZVXYjmqVfDSX5+hbdViASmCLc2RDLjhgSHjkoUR8RhMWWrkB
	gIXrlyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIimS-00000006sQQ-2v70;
	Mon, 19 Oct 2026 08:31:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIimP-00000006sP1-1aFm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:31:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12106795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792398695; x=1793003495; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=;
        b=hkM+WOKDTCdgf+HAeuTHlRkpu+UxaNWdAyBRp+IgL+GB7ol3vISyydM2G/3lbtjW+a
         zIQyg2+6T9lvTZnJCY8h0m4157uejwt0pb9YAO6qnbW7W0AJggyUjmqf+mr5Y367sprz
         GSrdB6CvZmV2rYE+tYXF+Xj6nY8YBj8doxcIqXZSwC1YPrK9PijfZ6E71WSYjnet4tak
         MzXIGM3IsqrXc1zRmVj/6wfkATrqdBgwcF/7dk3ms+9vMpYiPnfrMORAvWEGPX71ZI0O
         MoNeGSVpX9SiDuyBEXW0/GyQSISNlnxNT2OACaXX9qzZAkZ8kauu9nEgFvJHgJwmAO4a
         dBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398695; x=1793003495;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=;
        b=v2pV5mVT7EH9W9KX6pJALLnsYRt2c1X4oBCk5scDfEQUmA9k57qObFaAIKggQiQrsi
         gAhyhsrjedT61OW+NWXDH4yNUySunUDb8PVequnWk6JIlVOpKHFNPZHp+8JKhz7jP7ua
         0X0FzBGlSq4m+ZjnlfH84uapQPcsF5zPkEK9qkWhrSqpyktSW7jboIJED5CQ2R8CrJ7P
         BxE3SQYi+JWLXlAjmKAkgeSMFtDRZBsogEQZaV2YTkccczlt4FMctTAr9Vts4iU6wb2Z
         dCDx7vEuTsE+0a2c2HB6OQUNZCDPdD42ds+YhlVZZXwM4xgmGXJL8qGb+vsFwH6abkMF
         u/KA==
X-Forwarded-Encrypted: i=1; AKwUvBy7Q5eSNaT1CB4Sv95hR1WQxjjeEvJZBDAtEtHSd68as8y6I8MTsI2eW3R58BgNPlJvqGfR+xQVA13ZgyMNKIP4@lists.infradead.org
X-Gm-Message-State: AFq9FYLGY0KLlI1BShhKweaHETD/soucidZNMqj2q6VAZ/ucfJ6qGYjc
	yDLnEaEF3FvbKGEseStPTzTinvNryCI5X1Mj2wlzKWnAPQkjNRyLjlpKpiSo6VVgvIQ=
X-Gm-Gg: AYBFou0egoWO+CNap8sMg6QAxYzfmONi6Az21uTMW8hsuZZkyITzjnkNqWKQ3kAZ07T
	Auccx1VSe1U//POq+NV2jc30eBv/8T7s4Ab7lv4kSiwhyaGs81ybEJHFXvdWnnLeIDPQE0LFUxa
	mp6WQpU+bE1px0JUM2E6sm36tiSIXgiH0WuIj4qjmV5gA4RoQntkiy5vjfze2GZs89hM8zPg+oV
	vfG0RoI03xcoSaAoZSSPO+KPAkSkSDRImcVCgB+9jOQFG8qRpNy5L7412cP4pYm0S26FbSm4Gm3
	4RfxlkdWxjaWnyHd1XJE5v9RktpYVHh0N3czhcBLpYRjbSjgAIoW4uqiPrHuJRo8m9HPqit2Pgs
	e9RCt6p4/EXMh7sXZSSdu/fkaH35ZwIhrhlwC4bGcA7ivlzR4wr1y/OzEXSihKJgO6uZnlInr4J
	oNfCt+8D0CdnWfjeIAC3LVqiTstLduL67nK9wQTyFL/cAGKLPKcAmQzH0ZoBLWRnOGtNLDg2ZeM
	Qx6wZHu+7W3kFYUn/p5XJd8EnGSvBwp
X-Received: by 2002:a05:600c:37cf:b0:4a1:df14:ad07 with SMTP id 5b1f17b1804b1-4a1df14b4d3mr115190655e9.18.1792398694579;
        Mon, 19 Oct 2026 01:31:34 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c10fe9d3sm316410855e9.13.2026.10.19.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:31:34 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
From: Alexandre Mergnat <amergnat@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, wenst@chromium.org
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
Date: Mon, 19 Oct 2026 10:31:10 +0200
Message-Id: <179239867012.642420.15110854236483587234.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=409; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=PBtDG7IaGArA5oidyV57104ug2/3g9vZYpC1ajDvsoU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBq1dVWFu5n7LST9XjNvuRmDW3m8PImRaa/WwJvF
 aGMwo1WH0WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCatXVVgAKCRArRkmdfjHU
 RYoYD/9v5gmSdVR1pNcJamGYwCTaV5rT+OL0L7Hy0d0zenqBBKLBoB5ULjy1XzRycl4z3uzaIyh
 HQUxpufXinchYoRParULVTDzEU4bDge3j+RivbJcNFkvXnPCQgkpifnmkNcDXTB9oUboxK1rI7r
 +tAfXnNtM2XECrhINjZemeKSzTK4o8hFFQJpNqZ4vaEGd+p+yQ4OydfroxrsQ4ussOJJPt11pGq
 XYPpjNtd0I0txUKPm4uxzqeKXpecqVNan77gYpf2Zy4bqjyPIJ4J8QL6kPbR5WqdRvNYsOHGDqJ
 dl7xZBqbcEbBuPZcPfrVa/SSbEyzcEhseR1YtAQVTAC6839HIwcR1jpJFaDI9G9Ir3/FpYJQLmE
 aeNNSiYLiXr7xplXwVUPfNl1T2lJVnqdJG3AIkiGgPrgG/ejs1a4kvLbqWOHQj/tmmEwDk4AIfb
 xtYYBpnPtu5B8G7FThL3jY6+qKUYBxCqmMmqQlOJspghF2IILNdA+7mnxsIhLRfzU2Rl6nFTl8z
 Geg76d4ZObp7A2TIzxpiApY+ZYVr1BBhu+N8aEMC2oJlVTeBUzWsCz0zgnTHPk8MSX7lzXsUqAV
 Us+8pkPLCQTVvlh75nO0i+L8I/yvjmltf99bYdYnK2F2Zi6T6c96vwUg8+NuXxvyDa5WIYTa2nc
 0xA7MHt6FvBAylQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_013137_418949_DC7256F3 
X-CRM114-Status: UNSURE (   9.50  )
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

Hi Angelo,

I'm working on mainline support for the MT6363 MFD PMIC.

Are you planning to send a new revision addressing the review feedback
on v12? If you don't have time to pick it up again, I'd be happy to
help address the remaining comments and prepare a new revision,
if that works for you.

Thanks for your work on this!

Cheers,
Alexandre

-- 
Alexandre Mergnat <amergnat@baylibre.com>

