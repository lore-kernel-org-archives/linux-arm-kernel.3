Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D6C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkIYTQEQ27vhdTHvUzqbaw98nz3PhZSvg+ClrrD28Z4=; b=eTry/fh8jwS9ssPWOFVkEn35SE
	8Ux9qiC+AI3Ws30ugXBi6ECjpsQ7cI2N7I93LbseJz+Hz9uuUPOE/ex/kXAVt7PBJldBnV5py2jVS
	+KdhJlQMoXv7AcMKVEvOrX7GRXYgj2i/qX/mmsIISXSaQ9wLxCL90RkqskLxN2NtBReK0PuwtPOT8
	8Dja20u6hjn7AASho4tc9lNd+3iE5+tADYMEEm/VIY3vzlOdZ4Ncn9ce3fUQPlD6oEeU+3diLR+gW
	l9wBKIt/tjnxSMS4N3KvXMdxubJovg+HLfIdKapI5tDLIhJl23bIvycA+hQWwsEZ/FTgr15s3YE37
	9cEMrAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDS0-00000009xXc-3qu7;
	Tue, 21 Jul 2026 16:36:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDRz-00000009xX0-1Bz5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:36:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so5893880f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784651769; x=1785256569; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rkIYTQEQ27vhdTHvUzqbaw98nz3PhZSvg+ClrrD28Z4=;
        b=g3Q7Fcd8+omQ42Kz87o5cfPBa6t6E3px8jLHG1ceuzZZK49s9Qlg1sYGYpSVVUBula
         g+6uo3y0cAIOeHLfvXNPAsStZNuE7+9/N6uYpIUa+/wBN6uEJYTTUpqZX982S/YzWxO9
         99ZFnhitOgwOiWg3GXDU6BS5zjQBnfL8o+preNExFxw7W5CXhX7ti65iU1QRtv3nM6Hv
         FwqtBcGFRbeldfBcP+24kxEfD2NITGd24AnBFsm34ZAW6IjCKjGyq/hz7DqedFlWGrHq
         l6qx+PUTTWS5DgRDeJ9xfVNTA1LfrN0JoLhx/rZQw0qwtbR+iwxsBX4c9h/9WdUVZbs/
         Ci3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651769; x=1785256569;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkIYTQEQ27vhdTHvUzqbaw98nz3PhZSvg+ClrrD28Z4=;
        b=SUcXBS2mWo88UW2SfycSzg7zkMIO02WFRYzTV95fKTdnCWGhPHg3L4zLtPidFUcQez
         fJQ4mLYcK6Fnv5cVZUp61etNqBvDQv2HI4/FADDcYAqKezQM1jPdylHX9Y82dJ4SLBQf
         mcF1TWRpLwqyzhFsy/x3ExhmXFQI9YrgLXs135uHitNe7hCjs2D22LTUbLiPieEgiuW5
         UTAi11jQGU0wWOag7yJA9n9m7SNcAjY6W4Y6Wdph5uVDmcwD7Oosom5gpdtCkJQUAhca
         mUocNaKBbBuXk3FXaOujcJFn8jerJdehv+efq8Ir99u3BIMN+QMbNsgPLEdfzWB56CJJ
         TUbA==
X-Forwarded-Encrypted: i=1; AHgh+RpLwX0BGQK9L0XedbK4uSr1GOUGnxWIuxCvArLQ/IDDxTBQTY1RQb/HTn8fmfajATx5CEwPNuxalL3ZTur2MkVK@lists.infradead.org
X-Gm-Message-State: AOJu0YzHt1/AWNhpDgt4NcxYefAMELIZBgfKYKGpv2mG/+jQ1rv4+u9S
	dldvJ73Xu1ZYHa4cuNWlzTmn83cavb0kTVAJEssoLHOjV+I8F4Mon3nDnKQynAqrpno=
X-Gm-Gg: AR+sD13pKybi+oj+WT/n3dUr08gy5b/WZvg5fLjFBwxsVm1gbR//Ky0DUmgP56X5s6f
	aOtDOK2sLqwB9P/d4uovx/PmZ4qWToh6E7cgqroROpBGgFn4pJLCYubDPV6bVFMZA3LH2sIP14N
	sg2pv+iFC/3sqHS+qeezMBMqGNFbnCX4Y0ThW9WHwyh3/Ci/tusfnTlo4CeZX6K6LLEGRd9CfG9
	M+aElAOagVWzltSjAMDXueVIodQkixTrC3EyVLO5Fny2RfALj9pLot/bn0QMA7b7fPmRs6vCJyn
	o8FEQqimeBTs4/ufBvv+GuasUu8QkKa0yooMRdry3efX0uRW3EORlZf4aExjqkHD3exbEPdc+6v
	gqy1TVNrXih8ioQ+u7iwzIjiy0cO4bTW+Cg+mJM3XdDiOAjUL8cWPbKChyFz3WLn2p/nzJyVO61
	ma+VHcKjQo8hRSXasv4a16VM7gZIT9LgmKVPd+mTN66/IS9yjAeeMh
X-Received: by 2002:a05:6000:230c:b0:47f:5289:5606 with SMTP id ffacd0b85a97d-47f622f2a76mr24142270f8f.12.1784651769351;
        Tue, 21 Jul 2026 09:36:09 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63ed244bsm4321698f8f.20.2026.07.21.09.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:36:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit
 field width and fractional calc
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260721021356.288506-3-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-3-a0987203069@gmail.com>
Date: Tue, 21 Jul 2026 18:35:55 +0200
Message-Id: <178465175574.2337945.7396666795379567940.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=CFYgfkkDESJFwClmB0HCTSrxMkT45WT5ZMfjkAUj4Yw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqX5/2atjFY4a51+2LLPJxW2xNLMFjP8rGP8zV+
 d3aD2ZOxHqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCal+f9gAKCRArRkmdfjHU
 RQikD/9KR5YoOwkAizi/b9Mr9lsmmE+PI7aYgaW8ZGWa6f6qyz8waYEjOdwJsKQ7O+6mRWNM0mP
 K73EefIBMpLzBWH0pia2yn8Kxez8Nbhu0VOzxEjGfsWwXbp4cWYHaafMwTNFUFF144/J+wF3d9n
 vBbz+vGK8wJrw8fKq5zv9/myTALwBCIPHnHWxT6jySYywviCgh+0tl+7bh/oxR7lBxjeVrSrnLs
 1MH/N7o8X7kBXtNz0E1cu3ecmBRlS4DPL748hguEaT3nzVjoKJxGTMCm1yK9FAp5OutkOfMIoHf
 VjTw9XqZOFfoSSuxSLbgke80sZBKKZr9ezbopcICj2+igvAerBfHGK+5IEPogHO3EQ8oklRxAPh
 OMU57aoIZIeOX+bVuIkPe7QoLgBRUQNq5NBdtJj+n2lt3kwro8nAHsQrnDZbPIG0YDJWAtrSxEU
 X6P54/2i7dtLX07vd/fXHYgPz8KxxZwAVTBdKhhqN37Py4eLWVapukB2g81t7Qp+1wMCg33or9z
 Jw1sI7hGF1JoQ0/2cmUwu4lTFRS8NOqPWr5cA1HoBVTZbYVZCBb+WeIjVBqjLHztiSJPh2zvSS8
 XluW2ShErwZm/LTDfIoe/JZ5gFEy228kvVAriAaMEUU8//qqIJXSAWH3Su6/jLuCFgdYYV04ddQ
 6BXN3OjtoIIPjsw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_093611_343725_CF269831 
X-CRM114-Status: UNSURE (   8.73  )
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

On Tue, 21 Jul 2026 10:13:55 +0800, Joey Lu <a0987203069@gmail.com> wrote:
> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
> The hardware fractional field occupies bits [31:8] (24 bits), so the
> mask must be GENMASK(31, 8).
> 
> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
> mask the old divisor is wrong; replace the arithmetic with a proper
> 24-bit fixed-point rounding to 3 decimal places using the kernel's
> DIV_ROUND_CLOSEST_ULL helper:
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

