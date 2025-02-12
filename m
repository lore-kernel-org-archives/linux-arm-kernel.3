Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5FFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=; b=0VnXgMJHKODpvrWKSvbZyiTCvY
	PvidRLKurMP5pZwYu0pVLc5zl8ngqg731CJYYLIjCofJP6kHhK9mRDTa6+kDNAQyR/CwrEZFiL4Hv
	+j3NzoXdbAdd3sfpYwGjqfg4ueZqrSfCEanzosnYrLo1wamSs0MSPQqZgoBTkyGWwY5XkYVw8fwZf
	a4fK4drakJ61jzjzdB/Gf2S4J4/+4yBRR2+uARrTVZL+5tSOZBAHyYLg8i+RA/zyWivOdbY0kHzVP
	Lms+ORA5FT8iIgDNHdPKVgQg9n42UNcFbVk8XhIN2+91SAHYilVCIyFE43UUMT6OT/bztw4wxe9pB
	7q4bfJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGoo-00000008NEa-3bWK;
	Wed, 12 Feb 2025 17:46:38 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGZo-00000008KV2-2dIb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:31:09 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5fcafa42a87so21450eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381467; x=1739986267; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
        b=kcd4SnotFF3LNRzyJf06GHzcXPDRdn7X73u+EYxOQ2mp3TE3W2UAJNFHv2iWwQy/Km
         MbkcyZm6UBP9go6+HNLwcruYHZT7Ea3ZBKPUZRHh3QFBQBo75cs+e6YjpN1v3ZSk6z6L
         BgJpRvDUZIC6yXcs5fvrwldRgXADfux1+E4jBl3tqeEWutDdC2l7IRSddn2KXdd7+lds
         5Z2by77AmnuoCU8oFS4FKDExIMDMg4JDYHZfi8xzP9Jc4zmBA63V1O3vPEHYHCpEP0Fi
         8i4Y0h3MPU7Ns8CnT4gLCUG64LH2pttK0PW7m7AvJHhKHrCYtQHrjVnzq/ONdvzCifVR
         iNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381467; x=1739986267;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
        b=o0w3UgojHLYs2oesyAx3rGDE/EKodv1aqiQi2DPb1LITlgbtwQ1mAcuUFMn63tT+FS
         oUKOkOsRs/pEwHM+oNMH0XLI0ohqfFeQ333dMk1wq6jf2wrXnTfq7YNH/8eZsKxZiJ1u
         UdnGblxSA0Avl3yrdtAKM56HdHO7NXKzysQWRlYTvh2n4JzYfV198MGwKg3ueSsVx2Hh
         Qxe/kk0A0VH0FUPbbXgZESptl0P7NDHKlgK6+J+EAtg1N965zx1yPFRidL9hBMpyiGBg
         FVGs5tLuE7yE2t/CwGCzMQkGOjLFQpNV0maecVDpPbtWAihNJYkkAXlGJugYCj8IDcDk
         t+qA==
X-Forwarded-Encrypted: i=1; AJvYcCW7748KvEqvpCjBadda4pPOyj7MyyVXGJEeDwCKTGyZqYLcCmr08m1L7M/3C7VLh6B32LwgZ1tR5L7HEAnNln73@lists.infradead.org
X-Gm-Message-State: AOJu0YwlzAqfV8FXYUzi52WCXcGz6ERuxOvm39cKhAHk+5XQ8pQszxVS
	DkIBQW7xkk7trPdYsk0hoB07rIfBxKDNxFfidplIpphemh3vXq1J
X-Gm-Gg: ASbGncuox6oXkaY+MlWo9jEc6P1aUZQBcz/LGEhBCZIGHnIcspOUjxl3+VbubmVbR+p
	fy9da8iX+irPFRODqf+iL4ysnFGWp5iQRJ3bhHOkSBmwyE6O79aYD03tiSATv2itn6QXJWP6FQ/
	QtNJkk3mNEOW9e+L9pZD6zuNnJIAUwuGOYotlvHHjPBco25tu6IGyFzT+YQTseWF7tnkUpRfu9k
	8QaXSNzH6nQhKYzKtURtVOgP0TnN+gf1hUtfR76+HJanQvZqOEHpGf5uiYOnuMggUR+QYpCRoIx
	uQwiuFDczDdRGhxxupLbBQ==
X-Google-Smtp-Source: AGHT+IEfXVxl7VC/O2TXG5AUw40jRF/jqb2tNJhJqtHmv0DAX3h4yayluWuzrQzPBPHKrw7ZeZKhgw==
X-Received: by 2002:a05:6820:54b:b0:5fa:61b9:3e7e with SMTP id 006d021491bc7-5fca183ea60mr2464323eaf.3.1739381467421;
        Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc8fdcbc21sm2233640eaf.37.2025.02.12.09.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Message-ID: <67acdadb.050a0220.28f58d.f522@mx.google.com>
X-Google-Original-Message-ID: <Z6za2bhKAmHvUMFR@neuromancer.>
Date: Wed, 12 Feb 2025 11:31:05 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-22-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-22-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_093108_670966_F8E93DEA 
X-CRM114-Status: GOOD (  19.56  )
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

On Sun, Sep 29, 2024 at 10:04:53PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..c37eb8ae1b8ee 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,6 +24,7 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
>      maxItems: 1

-    maxItems: 1
+    minItems: 1
+    maxItems: 3

> -- 
> 2.46.1
> 

Also need to add constraints to set maxItems to 3 only for the h616-de33

+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+

Thank you,
Chris

