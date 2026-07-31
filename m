Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4F9C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uJ1sTQDdzGH3L1I7c5cySgVgb/wH3f6ziWC+LNjIF5Y=; b=u7nEPqg+qupm00Kb/mwALkwuUQ
	M5HVWTBdJy91H+ikvp8qJh56PmSLOv1+k3bLZyoArVqhg/6OKLezove5SRgE+GQyEEY0RCNRi6evs
	H38xWwfT9AGjx0YDM6PXwBulETpqgLCD7b/fb75eBs6575L36aNijcBuOebh+7UOedu37cSoBnwXT
	1PSEBLPO+0/2HoeElHOdZnE2OMID95PkG1Btp33KGK+cGGjUzT8cxQY8tOp5gP0leND4ZwowxApkg
	5OQO/BVmTyKqt9cY89YSpsEHEPEWLU9VxPOgO5H7TAPTqSgrTP19nGE75smUf+mz1Niku6boQRhQO
	WCmMNFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq2p-0000000D5kG-02VM;
	Fri, 31 Jul 2026 16:25:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppzb-0000000D1BW-388Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:21:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso776632f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785514910; x=1786119710; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uJ1sTQDdzGH3L1I7c5cySgVgb/wH3f6ziWC+LNjIF5Y=;
        b=aGMLPzNT/c4OxxMLgEJ9+us9aGbXW4jB/T/lg/2EO7OIQf4H27r2OlSl6STwjHqaAi
         Wn9rFZrnaCG1bUuwOD6uA6eHa7gamoTghjRIRDHbynhR+kicI8RBYkrZTpIt7wyYhVKN
         c6IZGPZwH4DQ858SWT+Hi2Hse2LXkyoX4zrl0K+fnYdlEIu2ct8ySiSXyy2059MNJ8jm
         9DOlU5mpzlMSmwK6R7m0lmL3SWajFHFw/9oqIAFnGGspeMFRa0JzoeIrVGiNwxTJ+nZ6
         uKqFXvSO7WZfvKG/dAnssfxvwKy6kG/V1kQv8RTq4BaendGbJzpO7pz/YGFYfmzzW4y1
         pkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514910; x=1786119710;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uJ1sTQDdzGH3L1I7c5cySgVgb/wH3f6ziWC+LNjIF5Y=;
        b=e55zsWZKwwDOOjQI0SRSYzaJQXs4NXc4omd1y+1j24RrCwrJYqKWYpx7HahyIiDUNg
         PBGzCL7uthrZlEedWokiRgQDsAQGJgK8395Hg8MDGzD5Sulsxe3Ne1xktebatVAMj1as
         lFFnf5psUyQzN/WVXRhV4yVFdCibPLcpcLYm+oicpFWFv2P5u/yKm+NoB27Z6SlUO0aH
         vhB89ykpV2vQRkM6OuTf3B6v2mj5j55Dy9TeILoh6OWH+/drzK3ywpizBxP6aNyjjY73
         MOWpK55EaNaL9H27MMXxTnrwXTIWJdR8TVwhOv2TLUTBkt9ied+KCrrlaXBSq5z0kigA
         krQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYRjIly6BjGo4tZxQmFpRrszEBIfoaxjRzjbKY2oOgHflW20RF2NwEFC1CLyqvvtycTIMGuDsEed+q7JJk8sTD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc5+ni65yZ6jZah+86RBr0cjZG5YI/KFesBN4+Ej0McP4u2iWn
	PEZBrk5/7YzgqVOPWLIaCmN8IgFZi/J1stLn8BK8YLtdyWdL/pcaFqdCTkQ1z1aFNMM=
X-Gm-Gg: AR+sD12eAyXZ1NPS9bwob6Pb8WCX8EkWo1B2vnknQAIHAaVLqire9n572IP6MQE/H6A
	+ivO75F3i8N+kLWOWnAFBSOPaRQI0HuFUUqqabHZCgaBsJGjvpGsGx0AsF351HbmwY2lzQ86Es7
	R9WzvA21JceGfyo/wEVCMSv1g900j+ELcsWcr+ubJuTvtVjNHFiTfFRoHRh1oPh5vERKQ6pqtiI
	aSiWbHhyZd7WUdhDVvcxwljdOZ1tGiyr3OIx9LbFcfvxOWd9xaxgF+UljChBJ+xhcThGVj+x5GY
	jdeQhe3EfTfC86nqekjJdTcCZjE9H2wv65krp7Z/PXhkHONJEsT69+DPMFPONfF12kk97aJ1H3X
	N1HT76maIp1sKhnrOazI+SXGQx8gYtNXErgILLqNs68KBtELCzqyXkU0+ZbYZpyDIrlaAEEVj6Z
	d07A0kavUb+lrt3IeSL8DW5ppeQ8h0eH1CIX9tmVbGmnXNBSbJxphgviVgYgYrCvnhLKe9
X-Received: by 2002:a05:6000:110d:b0:47f:59ef:bbb2 with SMTP id ffacd0b85a97d-47fd72b904fmr539478f8f.17.1785514909845;
        Fri, 31 Jul 2026 09:21:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd41e296csm6440334f8f.12.2026.07.31.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:21:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:21:45 +0200
Subject: [PATCH] dt-bindings: mmc: sunxi: add compatible string for
 Allwinner A733 MMC0/1/2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJjLbGoC/yXMSwrCQAwA0KuUrA3MByx6FXExjalG2umQtFUov
 bujLt/mbWCswgbnZgPlVUymXOEPDdAj5Tuj3KohuHB0bfSYhuElObNiamPEcSS0pZRJZ6ST8x1
 FH5h7qEFR7uX9yy/Xv23pnkzzd4R9/wAckiuRfgAAAA==
X-Change-ID: 20260731-allwinner-a733-mmc-support-c901bc312eef
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XxPxlj15S9GHxpbr6kayVJohduiQuJOZXJICcGUo5pk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbMuaGBEtOXw6eyEAQdb4ueNcKXVnLyzMw+3Ow
 a8chhWa/IaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzLmgAKCRDm/A8cN/La
 hR1PD/sEk5V/TmB+PixkJKTl+qwb33DuOqRp0owY1d0HZF7hDO+R6nDvpCaUe5T2Ggv5kjSICDO
 5oxaZsYafCk8FDT2kEjEMVEt8ip2q5IaCNCvU6wrOr8XntnbCJV7UAW7QDPEOxhuKET4J7lLL/k
 fdajXh53to6Jb7TnZUnws/ji73UQpptTVgcj2iowcc0/yzxYjENuvx4jh4FNKpvhjYLS+JwvL2w
 MJgvjIB3YVTHyHxFvhC+3rdf6XA47PuIuX1Njj2xn1hKoFsdRvISZedaOWqdENe2dPHcQsDw6BP
 8hJQb9pMAgorYFy53+c0SwdLz/2yS+272cUOGW4mkFY5zUfngSLFhCcA/ObOorfsTtG72l0MOi6
 Jdxe9ZOsWt77g/zNj6nNh+9L+o/Z2r6iIRv2BDJsEZe/JQkVev1vUIeoGQ7mQz1Gk1nv+Ug4vV+
 PCmxP4HikD+k3uaDOeN/tTYB5+GI7Nf4aEN5cwjt9VuXl8Q6474tnY99TqB5abiMt/zikW4vVhN
 ZT96Hz9gCkVJXSeCFxyMFimDrJb/WWhH9e5afLEsy0oPV3hRt+souELk+e/igMJfaqBNYmjgJGo
 EkeOqbsv+NOEiAHdV2BCYd/basqgQB/C27NOMLgF1N9AVz5A4EADDZdnHVBhN4vebI6e6obgoDR
 If7GJB/TYksUT/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_092151_810790_30B14AD9 
X-CRM114-Status: GOOD (  11.74  )
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

The A733 MMC0/1/2 controllers are compatible with the D1 ones.
Add an A733-specific compatible string, with the D1 as fallback.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Like the A523, the A733 3 first MMC controllers share the same IP block.
The 4th is known to be incompatible with 3 first.

Unlike the A523, the A733 4th controller is not dedicated to eMMC.
This 4th controller access the memory through a different bus. This is not
supported (or tested) yet. It will require a different compatible when the
time comes.
---
 Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9f3b1edacaa0..9e9610bb1eda 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -56,7 +56,9 @@ properties:
           - const: allwinner,sun50i-h616-mmc
           - const: allwinner,sun50i-a100-mmc
       - items:
-          - const: allwinner,sun55i-a523-mmc
+          - enum:
+              - allwinner,sun55i-a523-mmc
+              - allwinner,sun60i-a733-mmc
           - const: allwinner,sun20i-d1-mmc
 
   reg:

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-mmc-support-c901bc312eef

Best regards,
--  
Jerome


