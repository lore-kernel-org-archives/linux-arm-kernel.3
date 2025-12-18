Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF715D711C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ytefce9GoabytodYzfx2Y2KHZCazU28BdXPoQRkGF0Y=; b=urh73mlgI6WeB6yWJw3S4P8e3y
	TVrYrvG2rJPCEi03qgLWYPVggm2zBrFQ1fyJW05Xa25Tfy9pEYCXSP4LvN9cHv1k+fN2H6dBYDOwI
	0Ya7uVfFgrpFBmBqQ6ZLofi+1fXs9L6sqprCNo0PRZ5aINcTlWh/7dleh2M5EPnQ88jEeEyV+3JXU
	ORLMvF0MLEbosY8ZSI8kyuTSiYlo4szMtAkhxzj2dPyPub1s/TyIBWHcOrzlxc0UIFeJb5UK14Kem
	ZVjBzOZqq30YPHOqBg2LckN1ozk39l2vk/F4pu4bN2m+v/lgvlvXy75MiZRWxeYmYOAgRdhJN1LNV
	xJFGbNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMuz-00000009IIo-0QOL;
	Thu, 18 Dec 2025 22:56:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMuw-00000009IIL-12LQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 22:56:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so565172f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 14:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766098575; x=1766703375; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ytefce9GoabytodYzfx2Y2KHZCazU28BdXPoQRkGF0Y=;
        b=ZVB2cHi8R+EawaPcyo4yXHzC4a1fTZXW7TJygYY57PQ0cyQXnM69RC1tmEVbD2SqB2
         pfkMHHpdR6E8Gpt7e3kQ0x4R0jhDrdNXBlg08DMcZmk1Z21zismwwcqRTztvsup7OPFS
         9pJFsa+If6wncVoJRJug6KLLzsNU0Xm2SJ2BiMwd0kYzGxkqCXm+TaJhJDAduNBKqVdE
         4jVD5SD9/MlZia/eykuzhV7jiLjJBGizPGnxlXnjKED5A3ttrpbbAysMsnogWCpqg9DB
         E6WVw9N3uH6A3Ma/x4vNk8SOAEOudtVEzqCi10FM+UeoZaHIGrtpSQzgUCS6ZG4iMdPZ
         ukvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766098575; x=1766703375;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytefce9GoabytodYzfx2Y2KHZCazU28BdXPoQRkGF0Y=;
        b=Bh9L75CM6pLkfuaeOozCi9qmn8CTSP6jYHWmMl9gn7XDmgdbov6NPq4HIsJrp/osHR
         7REJuBxzFBgRoFlr6t3JKRJ+Ostgt4MkZ1JtqVfLcIIkdxqt8DZFXLnFq6uPKHdJ8YAb
         RvfwKUHShZwM0Fq9JuEpnWpszk7Nrp88PsXMvu4Q+KtnQx9IS4ucF9NzoTqYEbGyqFGd
         4jWu7P9UfpFUS0ICeH8RUWqZhpua7EDtO8rhx9oJc5iRQfFWKty+GoTte0Hm7jLQQ9dp
         G9uYybBtE+GjKmIJZKnhSpxUzrdrGE3tn9CSqUqMKI3EE0i8CFk9e/RSf38p7i8uW50I
         JO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/txbFre91Z+rzKkiZ9Dcs6ia4lt3ygEWnVfjw/GUFcuTRg/INEJxfCSpT3mS8JfwkRh4coINhIotBb/B5+Ipx@lists.infradead.org
X-Gm-Message-State: AOJu0YwsBIbICTvklGxtbq5EFSOKcMlh2wWtlgWJ7eeS8FN180lEsf+B
	xO2LYermHcd1k7pyYL9t4D7zrodPBq/s0XD+YOVOOfKHy2rQnjEPBvvgkcRulMjUm/g4CkdNgM/
	6q3xA0erGIvLkPEe6r1tsWnRkzLon2HpbEKK51Zev
X-Gm-Gg: AY/fxX6A8pvtcxHanJG60q9ldX/oHw5af/qgvmdAPXFUYMdhfZo6e35snMuahHFPIA0
	AWCfVo8GSVbUbE5FBMhVV0QLUcj31JueMWf7EK3oQ3BnPDHHYdJlcBcRfvnQLuYGTGquTIU7xPD
	28kMe//JF2obwhZtKshMszQFiuIl0O/ufwLvbt8urmAvU6E0R23/OT9OoJ/ggPlJhb8PGdj6FdE
	Zk15eEc96xWPQyKn5HHM9f8JdbT5woPM9HtW8bSxOd3010KubO0M/mc3mO4qhny044rABZVy2oD
	Kjdt8QfCnaK0tLA0epWPXlh5aQ==
X-Google-Smtp-Source: AGHT+IHyAglAUV7SanEVQr9reVdR9Xpy0j/wGwvdQqLYH7/hlHdm3sZfq7rYW7MYuyFNmavyzcXiN9znw1kvfWJlf7I=
X-Received: by 2002:a5d:5f87:0:b0:431:35a:4a97 with SMTP id
 ffacd0b85a97d-4324e70b294mr862685f8f.59.1766098575073; Thu, 18 Dec 2025
 14:56:15 -0800 (PST)
MIME-Version: 1.0
From: Doug Anderson <dianders@google.com>
Date: Thu, 18 Dec 2025 14:56:03 -0800
X-Gm-Features: AQt7F2qybuXbfLLar7UKfoOwfXGPNdCNJ6JMqPj6-D2vmiGqYTNo3Bkg9Tksous
Message-ID: <CAD=FV=W+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63XuKrKjfyfeQ@mail.gmail.com>
Subject: Proposal: document where SoC info belongs
To: devicetree-spec@vger.kernel.org
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Bjorn Andersson <andersson@kernel.org>, 
	Simon Glass <sjg@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_145618_324191_C7785DD5 
X-CRM114-Status: GOOD (  19.52  )
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

Hi,

To try to move things along, I'm picking a small piece out of my
previous discussion [1] to see if we can make some progress.

Right now, the top-level "compatible" string in a dts file usually
contains one or more strings to represent the SoC. Examples chosen
semi-randomly:

exynos5250-snow.dts:
- compatible: "google,snow-rev4", "google,snow", "samsung,exynos5250",
"samsung,exynos5"
- SoC: "samsung,exynos5250", "samsung,exynos5"

sun20i-d1-clockworkpi-v3.14.dts:
- compatible: "clockwork,r-01-clockworkpi-v3.14", "allwinner,sun20i-d1"
- SoC: "allwinner,sun20i-d1"

sdm845-db845c.dts:
- compatible: "thundercomm,db845c", "qcom,sdm845"
- SoC: "qcom,sdm845"

I propose that we DEPRECATE including SoC information in the top-level
compatible string and move it elsewhere. I propose these top-level
properties that should be used instead:

soc-family-compatible = "vendor,family";
soc-product-id = <0x1234>;
soc-product-variant = <0x1234>;
soc-product-description = "Something";
soc-major-rev = <0x1234>;
soc-minor-rev = <0x1234>;
soc-sub-rev = <0x1234>;

The family-compatible would be VERY high-level and is not intended to
be a marketing name. It would be something like "samsung,exynos",
"nvidia,tegra" or "google,google-silicon". The ONLY goal for this
string is that within a family, the other properties uniquely identify
a given SoC. This is a SINGLE string, NOT a list of strings. There is
no concept of being part of multiple families.

All the other numbers are hopefully self-explanatory. These values
could be absent (assumed 0) if they don't make sense for a given SoC.

The soc-product-description is designed to be some nice name that
represents the family, product-id, and product-variant but _not_ the
rev (since that's easy for anyone who cares to represent it as "rev
X.Y.Z")


The goals here are:
* Stop trying to jam so much into the top-level "compatible".
* Make it one step easier for bootloaders (or code packaging device
trees for bootloaders) to differentiate device trees / overlays. This
isn't _enough_ since this proposal doesn't include board info, but
it's a place to start.
* Make it easier to deal with "socketed" boards where the SoC can be replaced.

NOTE: if a set of devicetrees is provided to a bootloader, it could
not just look at these properties to help it pick a devicetree but it
could also change the properties to be more detailed (it could fill in
some of the minor/sub-revs, for instance).


I think this is a positive change for everyone and a cleaner way to
represent things even if you aren't dealing with the above problems.

What I'm looking for from people is some responses. Folks could choose:

A) Yes, this is great. We already have something like this and we'd
switch to your properties if it became a standard.

B) I like the idea, but I need an extra property to represent my SoC
and then I'd use it.

C) I like the idea and I'd use it, but with some changes.

D) We don't have anything like this today, but it sounds useful.

E) Why are you wasting my time? This isn't a useful problem. The SoC
belongs in the top-level compatible string, period.

F) Other (please specify)


FWIW, from chatting with Rob Herring offline, my understanding is:
* He doesn't think that using the "soc@0" is the right place for these
properties.
* He didn't seem enthusiastic about adding a new node and was more
amenable to adding properties, which is why I added a pile of
top-level properties.


[1] https://lore.kernel.org/r/CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com

