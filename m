Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeD0ycGia2aeOxgxjZnlT8Vbvac6TmHq5j7KmcNWbBg=; b=BchncHVxv45IdTEOf5GDgj2cFi
	DN+rb/QcFwFhT/ZNaK+L7IhxhNK0cLRxiYP5GkljgRuH5XIV1w6V2xn+dV02O1J10dVdWJS6ku6v8
	qQUI21U2ppc79cB+aL4QhBG1gt+NDja3V0c+/J+9jeKbhoVLXlfU/wHeOrUBA8wQSAeU0Sv4TQFgw
	V3MSrIEumXijtYBgJsEcPVGKZSgFk53gNK4F8TKj0xR7zRHkNBEdk6u+ZvjVerImpbh+In8XlW4sq
	o1mlFuBbGGKpjO5/MDxy2qwdJPfautNeSBnXLvGqWat/aC3+U5BGJG/TNwD2u3IAPPL/YptmE8S5S
	IR9zNFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wR-0000000C0cr-2zlY;
	Mon, 13 Oct 2025 01:01:35 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wO-0000000C0ac-3lBT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:01:34 +0000
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b62e55af64aso136807a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317292; x=1760922092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeD0ycGia2aeOxgxjZnlT8Vbvac6TmHq5j7KmcNWbBg=;
        b=NThbvT5WWkWi6PXNklH/nMNA25uVoDpNCJT9h3L+KR1PVlDzRJBniFwf68P69OwZuv
         kTgglfvY0kDMEY5rcGEfHYuVXG+8b31d4gIABV07AhZ0WYX+PRkKZXL8akNYZewf0J2O
         vdhv75R1rtFH498Bvdu2LnvQT9wp8dJbLjDLNUxeCzjff4hjL/xqYBkkOepKzSt4MDdv
         5QtxBggvhDw2prm160UGb/oKNNbw7kydR/ZmslqZDSwK/YXTucOQ0zILgjgOjD6d/Cce
         uV2nC2Y8auvJM73B6iqv9DHjT9QvyxXCrcGKUO7UGvy9eLc+P+UswrVodamktW+C17X3
         4lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317292; x=1760922092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeD0ycGia2aeOxgxjZnlT8Vbvac6TmHq5j7KmcNWbBg=;
        b=em9OHlw3V6ck8U5vcL6pobFIZwsO2jUm4UmYt2MDr8UUo4Fo4I2OH7Zj+nbyNtf7HJ
         nkVU7z3y3syuNKiAvD8K29sRIw4LC5vXmpzXCU4VC7ISfm4iAdFj4HdoejaOg1+pN7FQ
         3bhgfE05WSeSyql3FkQdX6TaQqeEKVlFwAzAIqfGIzwr/NU4Y+UXOsnP/hg03tWTt6/C
         L2wB7IFvBup+pQEBrvtMDBx7x3CzMCVV7TwTAmQjiI7ahO/k6nIqxNavIxv4BNlWIt1P
         Q/UsrbCzQSQajsh6huxcI/oA1C1q5AwiA4mmYROg4+Dv7mJzFoqoPujnbsBMjN6Lz61q
         7r9w==
X-Forwarded-Encrypted: i=1; AJvYcCWBU9LL2x5+MdlX65tH58EJb8ZR5aoE79PMLRFkOwtOJ9AZVKsh2X+O//vWa35BYpHwO6GBvb73TUw3/zH4ymaI@lists.infradead.org
X-Gm-Message-State: AOJu0YyFcRNd1blqxYw1e1JaRva3nJyBYxUK1QH/44ziVfnTtQ+g+Es6
	g2m7dsg5icsM1KLiMixVUZ3uWgRxBsuuwmPPH1Z7HogYB9MwPyERV21h28emS/mG6ks=
X-Gm-Gg: ASbGnct8s3zF4nvFfSb2HA3YFLw33ZWYyWr9dog3M1zqmS9v/28G6A+GrThelvDBvRR
	6wWaCqdk12WrXDBzY0U9s7nHtTcXCJfIHkbq5OQGz+usgxT8wwOfUiRsID1sSeEUtLt1zFcI9SQ
	MoMIF67082p2S7kdxC1sxYm5595HgDW85DTjgAWzmpkTPXIUtKaAPP1tdpAwsLOb0FcIRgADjCj
	57awlv0Nyal5dgzAbuKfOTIGcBeLxnLRwBTnFyztKWZy2AQTQqiIa0LrxHDR7i+AhTvvRYGcVoF
	oC8BN9/ZuAAmaHaR95Dclyju7nB1baaXaLP3/Rheij00cFUh50evRW+0HA9mTiFo6UT/ZBQ0OCC
	PjZmDshJlYYR2so/JJK0k+kM8ElJf6clE8iRw1bHtBCtTVH9q1GrvE6wx49lGBfkVaMOPDmAGHN
	Zhp5zURg==
X-Google-Smtp-Source: AGHT+IHOaxNaAYL/G3bBHEMSSdgsFReOlc8/uFblf96ArsJ9WQV3cPQ/wzrsOXueFnV0tG611gnucQ==
X-Received: by 2002:a05:6a20:9383:b0:2df:b68d:f7e with SMTP id adf61e73a8af0-32da8461710mr14755652637.5.1760317291935;
        Sun, 12 Oct 2025 18:01:31 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-2-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094512epcas5p223e2eb264967508527f478eb2200be83@epcas5p2.samsung.com>
 <20250915095401.3699849-2-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: clock: exynosautov920:
 add m2m clock definitions
Message-Id: <176031728689.32330.1215080941311408154.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180132_967169_7BD0700D 
X-CRM114-Status: UNSURE (   5.72  )
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


On Mon, 15 Sep 2025 15:23:59 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_M2M
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add m2m clock definitions
      https://git.kernel.org/krzk/linux/c/4914c17a76047ccbde24397cf9d406558183d756

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


