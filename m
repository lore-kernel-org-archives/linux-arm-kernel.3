Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC859C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=; b=cLEKMR+qwYl/JxGB521iigS9z7
	/OFEvAukbzoFADEMZ2ebmzCnYBaQWcHU+mU7z3agMGiiIaMgGFHXwQu8PAWTDpGBceDA8XFiPh1NP
	aR0+vVYoG0lgQgDEpD/iEeKTGrXslT3Z4WvdggSxxfqKB1WqVJa8iQaeSsJ0osQa5BBl79SnYMsx2
	ZlK8lSc3rALE93BR/a4YVVdOOP/vByh7bkU0uMbwr7gW8mBlkZZKGgRU29wU+xgAGyEo6EAANWIvH
	fw+9oJCXofgV9cA84PAJ5HSxI+tkLU6+9lOl23B4ig7iET/2rXFqufBwA14Mx8js4fZCOyygKuVHJ
	jStfzzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIQb-0000000GmhZ-2wUW;
	Fri, 24 Jul 2026 16:07:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIQY-0000000Gmge-2x7U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:07:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso3980475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784909228; x=1785514028; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=aRhD3dU0WiZDqaR84pHhsHW4y7TmbD2dilCDdQd+6nPbC883SwqwHS5Yxvfog2Txbo
         x/LSS/HmeWi9a88IK5foEX581MmYRcVH9/8x6dPG80SKEzDcvQAzESXvPREQ9/vvsKy0
         1inMWvDRG7hghpy9p0tW1Y3lUidMwJVLFEXu7OQ8h0HrnmRO7i1xyol+bY0J35iaDk/s
         cmf25riI9vep8wLrVRPW/6v4iQfzh4075Lbct+FIl0dgLKliEPTVfmfN1D6u/xlqsjX2
         4TcuLFIz/1S5isz/lbhFiGx3j4SQ60xQb6a3rNfFaNi/GeGsFSEn/5IONFjngOZltdB3
         wj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909228; x=1785514028;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=VJsLTymj/zFV5AiBrWnbEvYPgT19j0hJWSFzecWIyhIFmNOC1RI3ZMKaiS6xWGy8R2
         mCAoI53p+Atnm1Sn903cXGzuuwbNxk15nMoHW11ViLpO4MiuoUDDQnAlAHCM9497E0bW
         ZwdzwcYKfm9DFbAXACGfxpSya/2UB1m0DHimxLV0BunSylVY8fDTZtH8MisKl7ABTCQM
         yE+/GQ3lrFXO6Q8YWIowmhszOgDq87aBAaUpc/29RO2OEA7iU4/UJxYH7pvAwHn4ZNBb
         XBcbt2aVmOONXmOoqoSxozOl5nGVEOa71tulpsYooFqUcuSZnqFIer7q9mK/m/YaAKuz
         Xtyg==
X-Forwarded-Encrypted: i=1; AHgh+RoXHOejsao/NVcHr0SrAN1l4q+oMgB4xSqXEJbsICxHwlXo0sPIjAb9uIIHzgOPp42kj6ilxCjmFBy++RW1O3Cs@lists.infradead.org
X-Gm-Message-State: AOJu0YwNQ8VzPWJhlcEPhA7FpzzSeTTQZBdWiPkcUk7/RsExcdAgxrzm
	l2chcD7vNh7StcL7eJTL+30RZl97t0OoOP5dzEApRnqhCu9pLzwbsIAXr/JUkPe2BmI=
X-Gm-Gg: AR+sD10DRP9LjZ7ehUGzQ0IMmyeCI799PpC3F7QAk/yirVyyWGgvAnx5lRaKWTAHb07
	U4O6j53b8pdyQywSYSj1d5pkIbKGnkASvYZukgjFK2MgK8nIgkx3JuXx9z+yHJz8a0YbFg6Ael4
	itSJ24hE9gVQTBHesaGzSQqVFc/B54QDXUxxWtTooeFkFm9UXjx+rpHZdbardzqAmFkCU7pPehS
	zTQMpfMGluPZX4RfyCauGxB8mWwAQ9p23tH9snF3vcOtLQ5JrJOQbc33iz6bVmn0wuXdgPSk2zW
	3gVkG5h4+LR+PXwTr1mymaao2gc9Wzj6dc6RC2ZI6LZjojmsPoGBebjU2DHUYNNtyXZWmUZFibT
	WOK+FuKaMq+MWPS9nUcYcLWAS0y7rDiiztON9PR+iFEACoFiMf6HzToZNG6JL/0uqOcTGt/CJ++
	1H
X-Received: by 2002:a05:600c:47c4:b0:493:e983:806e with SMTP id 5b1f17b1804b1-49573cb963dmr58020255e9.3.1784909228253;
        Fri, 24 Jul 2026 09:07:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cd72:3055:a9af:4365])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-496b487a3e5sm734285e9.14.2026.07.24.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:07:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Brian Masney <bmasney@redhat.com>, Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
References: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
Subject: Re: [PATCH v6 0/2] clk: amlogic: Add A9 peripherals clock
 controller
Message-Id: <178490922597.2801722.3885834711328764674.b4-ty@b4>
Date: Fri, 24 Jul 2026 18:07:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_090710_750646_04B42D49 
X-CRM114-Status: UNSURE (   5.14  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/2] dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/33972977d632
[2/2] clk: amlogic: Add A9 peripherals clock controller driver
      https://github.com/BayLibre/clk-meson/commit/f905fc7b7a81

Best regards,
--
Jerome


