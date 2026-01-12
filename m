Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA7C9EC93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bo0nvDkmN3KsM8j/PrnTVe1jyTFQO6nL3NdErnbtENs=; b=tbdG/exspk9oN/hW2nlFE6mOdL
	taB7iRs1Gqxa+TxliwJrIymc+fA5X2/oBoNzgGEwLL383mbrbNQZOPM3nA6t5SXtG6FLPX6HM5jzp
	iZucou0N7EWGtwFgAipZ5qc1or78FoOd+a51+MYRinDeR0lobKd9jp2CEhglOeWfTtGRq2X5mA9/y
	tXA1iFGNUL+RV6QivzHQmIxwUZt68nvetBgAReUkYT1KeleZLl5VlaZ0vYYhfUBQCTFiYohVEum9P
	HxGv1R6zBIZTXmihTY1sUaOdHAyL8fQ5er7F+abCCyI2gUB0vdgGtaHcIx+1jo+0xJhpWIlck7Ot3
	bVffaHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjC-00000005VIu-47Jk;
	Mon, 12 Jan 2026 14:17:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIj8-00000005VH3-2BcT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:17:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so60630925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227420; x=1768832220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo0nvDkmN3KsM8j/PrnTVe1jyTFQO6nL3NdErnbtENs=;
        b=x5vXX71G0XjSSr7zBEWWKUtiEIZIpDSYcXNmJER+iLfeXflIpyES0TuN0vhSUyGEFo
         D4PgxpiOtGT7O1zw0FdcMpWtiv7dyd+cijTzUeqL60CKPYh4Yio3avBSYz/Vl7DBae9J
         Apy7PPI/YMQE7QdVkikQMOVhEOIoklb5yk5nb1IeyjLwL4I+K40Il8xVY7wks7KqDFTg
         okFwZEnf8J0jTO0Y5uDWtCPHEiHEIF+MzU2+w7VqpHLqP5eljOSJ0LY87h9e7trEYNwL
         OEIh3wshG+zWWMX8nc6rehR9V9zm7mRkXnR249UCybAjH3ATlSV6CC29zE0q5Ps50jjq
         wj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227420; x=1768832220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bo0nvDkmN3KsM8j/PrnTVe1jyTFQO6nL3NdErnbtENs=;
        b=NyIrwgeMhz7Nf4XLt5PLf+8Wa06PFu9YNkefzWU86VzfgBHYeSgrqsiV4DoIviUtJB
         hf9MJ/wyg26ZQccH/0fE0Z3izycVTiSNxGSN8kXLjeM5S+XqxaKmm45Xm8f/JynOJLtw
         1c1KYKVU9r8QvlqeAJxjH/sS5bt5XJJy0jZAdaVGJkAppVdONXKVfRrMhbEvvZIUItP7
         SbnESUxyQ2d96BLvQxYPUPL/5jOMlzWlzGF9N5DjrtcyEub65R8u/ysKK4GfqZrOPjls
         howoG+Mkfz1JcOuWvG3vshdtSPUz4V0CjK9Cv9G5LK3EZPKd9I4ihSlf0ncRFV8phhX3
         RV/g==
X-Gm-Message-State: AOJu0YyQYhzgjoIcqLVt+5I9p/WiTNnl1DgUXgxlM3vgkpYZJHRCYvjc
	2VTegBUQ1Rj+SHamaxonV/ZJCI+RmjLhELB9BZM/8Lp0Gd+T//MLEI+nZy8NktZDV9Y=
X-Gm-Gg: AY/fxX6zkDZAoPQjvjY0MEs+MwGCV073/KPY5ltDga+q0CjVX9i5fGGuU5pMZhZhgOd
	ZL7ZdvXDQKHd9brn7YL7eV6TQa1oVqHKMtaZmhvs95PgKXagH7xFk8+HZo4c0no6EF592wdTc+f
	ewB3A067imClqYDITzb21LdcZ2fkmPjk/svR1WmFr0I0B+FM46Y3Tk3HVKfQmW1PNLzENlDur+s
	CVgx3STrJl6Ydzk5gxpjAm5x+TGQBVwsAwmoU5h3S4f1NYG/f1C3QNN87I8gx4kYPyx9R7VnPsw
	4cTghpSJZHNDGxkeK6SM6U4wevTvlzj6xjQmzoNjO3BEkGLpy+ZV5wewjqXH25573NOl7aPgd5S
	043vxsaNErIiI4lEiEn02nIvNDl0bWfy8HqwFZyFo+AfZMFtZXMbnCUAjZihwaqrEOaVmrjsv7q
	a83laxTN0CpUP/Aja0LG8pa+1ojgYs0B73KhlxGvsACLvQ
X-Google-Smtp-Source: AGHT+IFzvepiXD7vAKBHM7AFBjb08xifNJGQg6KCRPXLe6wDMrhsqgCa+EwfBdw082tzp7w00nRu7A==
X-Received: by 2002:a05:600c:8b43:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-47d84b3983dmr220300675e9.30.1768227420514;
        Mon, 12 Jan 2026 06:17:00 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:16:59 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:48 +0000
Subject: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=oobBN1+auz610sw10HqvNqOak/BJA1CD/FOHBMfA6T4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJX81y3zbCKBEPGlyWFqAKsRBnSRkA5yKgTc
 WjPDffnQY2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCVwAKCRDO6LjWAjRy
 uhVjEACFFzHOLnxP3+zZgClgyLri1r5h31GFhuFx/FtRXQhHQHyXHi66yWBuQq6sUunBy44ub/N
 1rGhvNtm3B5LXaxxeJe0yiau9EItco/lUfghlmhuPXDrYbItTOdQ/RwtYRe5vWxwAcu6tKrZ7l5
 uO2FUNIDHNAB1HkLhnUtLR/PiIRwNlnmkQWmMUEQKiINZ3nhoHwCSUCczGPUd9T4dF2RrAD9biW
 GNGf54TrtlgZEcfff56ew5inuxsNspi4/rvUy8SbDU4sE/UXujW/6l7ASC9DtuCJuN9q3ikR2Uz
 OjTDAIFMdEmjCinsgpMzk9VAkV1NfuezjzgevvutMCboG1DMFSStMt0OIwAkHhYhsSlHHiIFRGG
 EuqCUYn9/ht5VkPM8ONknIPU6XsofVLrcMZJ4D0wc2KSjMT932z9lAR9gYNCGa4rACE/Nadz7fi
 /6+rMNW27KGFwEQF+RFZ2dthDNOEB8BTDS3Gc0XQbYEZhEcAEKFgDyxeTzmguQbPihMoYcmzyNZ
 FQlZxsYoJ78Q78fIqr/Lil92+RIe2EotEIA9AT4yq1fygHcGL/Wvxr3UsFQvmSc40Y3wVGl5ErQ
 5ix7ZKuoe5s2WNjatvZgYQekKZVmpRY7Z1LSHZYicxkBmWFa8FIvJVbdkmCt07kK9Ea2N1rvjv8
 0lQ7kk6wgJBwE6w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061702_579428_E2D266EB 
X-CRM114-Status: GOOD (  11.29  )
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

Fix the places that don't have correct alphanumeric ordering. This will
make reasoning about where to add future entries more straightforward.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b9c256bcccebfdef2e49 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -27,13 +27,13 @@ description: |
 properties:
   compatible:
     enum:
-      - google,gs101-cmu-top
       - google,gs101-cmu-apm
-      - google,gs101-cmu-misc
       - google,gs101-cmu-hsi0
       - google,gs101-cmu-hsi2
+      - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
+      - google,gs101-cmu-top
 
   clocks:
     minItems: 1
@@ -70,8 +70,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - google,gs101-cmu-top
               - google,gs101-cmu-apm
+              - google,gs101-cmu-top
     then:
       properties:
         clocks:

-- 
2.52.0.457.g6b5491de43-goog


