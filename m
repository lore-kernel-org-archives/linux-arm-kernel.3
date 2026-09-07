Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2F0C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=; b=TC7cL4pX8S+RnMdoYMflC8SvXK
	HR7qo6xA+rVZJMhoycyMAYNFFqyyBtk7RLzU0SceU4qI0/121IEFcADsC0IG1q8HvyVrgWZuj8x5B
	WWe+9gqU7yyH9FDMOD4q3VZ2sWjP14z+Gxmbxz3Gq4spW9sYK9CNStlvSPCs7sb1/pM7cN1g5xuoc
	/MOgJrKgfGoWcrAt6fISnpCzdzheYrTx7cERq6ZDIMg8o/4Sfk4SWa5Jy0YJ8in9gyM7bHhT08i7t
	EzUfcsNqe6Q91HEPxLesGS+/cEeiSHR+zdTF+WYaYRfhL64gs7KpIJsUZ87KBugu0IPpNpnnYMayo
	uxMNJuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bFN-000000079PP-0SGN;
	Mon, 07 Sep 2026 15:27:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bFJ-000000079OW-41PG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:26:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso46586405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794816; x=1789399616; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=IH9NiTuCbCDq6cgo8eDEHxkJRdd1qdO+E3vDIw7nW9MpRlXOnZpln6a1k7D+H9OEZ/
         BhkT9mLB6ME+6WAz6daJ+pGhKvo6ByLf+5Fbxhx+lAmJf5lfpu7ujNZBBAve7feEuybF
         T6nl9PVQgFlhxzET9CuJ+D1Sf7S+v9lZESDGOS2lH0ik9V8jaR4qtDnER95JkYaftKBd
         FdCRiXXgyW9f8AI6Ymi8IDkLumCvw0TMgNDSfj41fTgci18YF7nLtwXkKUlQ7rHxAQyj
         nZ5wYWrS4prRZsHXE8pvnna+YH/i+reC44wGkq9Oq+7hDYWvDvCyQ6IYkiRjlxhkfTt0
         a0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794816; x=1789399616;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=lkf5KxCsTC1eC5lrWViHbhV0MmPhpCOvK5x8Fm+t0yi5Wn955o6usOatXTUAQQhuew
         acvf8wzjuKzagKBwdEzyYoQU6yRS9BmNAz7XjmoX7Tr/cW0f00J4GCN6gPrWremP8ct+
         yQeMWaZghjleetQ7ZxY6PNyfHs3Li4OIdJ6nsj6myedTSuQTlqrAyY5ijdM4g2kp2rwM
         i+vItX8XcAjdeh1/eUYnzxAQ3u0WCGx531bFMdOP6Koyqfhqjw8yTbzjrHfL1S678Iq7
         JQudlxvt7GYTorHLJ2wmGJ8cS2O9rm228bCsj8PBpCJW9fVuBXtLZFqah8q/YO9n5YZx
         XiqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoA0mLfC7HrmSA5MRqloUnLjrbo3ngV1+XR/veh5qU5dO6cvqgz5i4LQqvn/e7pGyjaHyfrafRv4utcQDAWLhY@lists.infradead.org
X-Gm-Message-State: AFuF++lHkrf655MOKTUn0KY3PcRpcObAwKf528ZcqBDD6ugt3ueDqtaE
	VVz7lShK+EAvmtkX4zF/pKtJvvsNB+mCApAzWI5IT7fkWjkwZaV9URKMQkROxJGHAXs=
X-Gm-Gg: AYBFou0TW+XTJDt4Uj+tJmqUGPp7auvz1jNjgyqfm2AidCS1PBntPQOiwjE2r3Tj0Z6
	cHjbRq2ck0GzPnhrAZOoMls4dvA0WCSwLL0zoRvF1HQcm+E/C+L4laGpmicHyu+eV8n6fonAaFH
	7TSph6d5c+hkb0wnqQoAOz9TB/47jtYK3DGF1Xz0Sv5mUSih/NM6DzuVj99TCzTXvpbgRvoMz9N
	rFGlUeGLgFhKSSkPC3Brnz0Hd6/SRQFC4c/ZZpJr5ye4gnrLCvfuOL4wskwxEBK/IVn3CyA/duB
	ZiMWJX89Gllhu0Z2BPu531Wk98DVoubCpwWDTCOvNUaglLNTp9fouFwiuvwjnwZsFPIrlf4b0Zd
	whAvcaZLmGnwq9Tcvw9I/gzm0igPm5qSGjlibJqOOSQnEfsnYrkQguJ9g4/PDoKvVjCNMHSRqQg
	K/d+lkU7P/ANIxJAja1nwrIt3ui9RwYk7JWZn3rFQW6jqsRlcpAmPQw2pbdsSTPLTkrvmJlAd8Q
	d3w3gbSi2AaEeZY5wZcAek=
X-Received: by 2002:a05:600c:35c3:b0:49c:fc6c:be10 with SMTP id 5b1f17b1804b1-49cfc6cc055mr202666425e9.22.1788794815803;
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm418419925e9.6.2026.09.07.08.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 4/4] pwm: meson: Add support for Amlogic S7
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:26:52 +0200
Message-Id: <178879481206.2256446.5480566312277687897.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sfJG45jw5W76tQOcRH7iTvkAsGP4FG7d8I2A4Io0f90=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntfBlpqBiszNMgSn7O9l3ii5fmAZzp08XPZnG
 +I6/0zcor+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7XwQAKCRArRkmdfjHU
 RSSGEACrwfFz6yD1l3vhy6F9taMF3kWSM1xVK9C38V8OvRfuo795o5cb/IMYwvp0C6+MKwhPvG1
 EcrITVzONq66Ie2ZqiLhCqu5O9TrtHq7ajhU1sXK2ScEoT9XTURLcMi3qNi7TYKZvpUI68W8gsT
 bDkbraol8AGgOaCX//qsj8b+KdhbkQJnw0xyAsDPFhL0WaJXcaecJQRd4qwAFgqHdZQFf8tP4a3
 3NirS/fUbuxQizhb7mvswX2eL7jAWNzgh0MHiZoMjuF6pEKmV/DxhkKnAIQn76bZnLDd8s8pSzL
 pCJYhXO8AV97EG1G5oPvR2Bbi0fotGzWRNbEKBoBwxh/zLDVERZ/IkVCBklhGKKMod/CWtXjcDK
 9aOLNbSCrFlYbwY4uMNUddBNkAXoxb7po4O+ObGXszxbKC9ELtigt/7m52hJmqt94O6w/l48DFz
 s6OEU/1rKjzR16dL4S75Bj8QScxgAZizzNsIfihQG+P6q/CTr0THQ+oR9ZOyc7CthJO6wJUDaf6
 I6SeJkINTRwYCA9uUXoRrzRva08+URnqMttKryLsiQAxehiCYuuJNPUfWdQvP9q4KWVb/lAuITZ
 zvENNu+aiL96ohbGYXbzmMeRWnwvrjI8VWtte+G7a1qKOfvdcRIwk9JWlPvf7nepYQLdmpIKmE+
 XP9d4aPYx4YCpNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_082658_018662_F25A7F65 
X-CRM114-Status: UNSURE (   9.04  )
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

> Add support for Amlogic S7 PWM. Amlogic S7 different from the previous
> SoCs, a controller includes one pwm, at the same time,the controller has
> only one input clock source.
> 
> Also use the kernel coding style for the empty of_device_id terminator.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

