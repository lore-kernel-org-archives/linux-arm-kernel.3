Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E572DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swfAGC4QXM6SdJxBuAXYcYtJSUnfER00xbbX38/PS04=; b=Nqd4f3ba3l1VGX+gMf94bpDIYM
	JJ9A2tvlZMnzcYFBr51vBRHf+9BptVhccdLGW5kDKAlQw222iO/JBB/LP7UPKpO4lSbCjCs4tsHCm
	SXMabwt0DVDWFOIEX2aHa1BgomkfTY9i7a/kegUe7Zfohzbfe9+jns7Wl70iq6AgKZNKxU/GigowF
	29ILqqqKsu0+UNVpOv/oiAgOjWHtyE67eUOIy0kbiO77CdOWRy8p8V0OznZo2giakQV9OAAJFhfbP
	Y+6J8ZY6j6DM5gj3wS0meom3afWJXFKs01r60t9W2d8IFjN708hkqO0979m03nQ3iT9GAu8l5kOpj
	81I4Z2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdHj-00000001YZm-3gYQ;
	Thu, 15 May 2025 18:26:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdDi-00000001XFO-3ekc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:22:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so18644675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333333; x=1747938133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swfAGC4QXM6SdJxBuAXYcYtJSUnfER00xbbX38/PS04=;
        b=eZ+nMcImEszCADpveGv8cySxIaHa2Nl0wKLFIpjRY5ezEukpRmR5JLkKNRfdm9BQPT
         cv61uuV8PFmMMw8tn/DkEdXspcF8+tjr5XzahzzeZAt5I1NZ/4WpiVcsA+MrNMt/AxYu
         UOBq+aFDqfwHMwDyEwf8suvuXejQhfk/FAkFGKgIbMiwrygPKoewslgCPkq+nDML1tFy
         JIhCGpsdCFXiCKsiNbl9yXKaMe9e6jFlUxuEqFA+KS3jPE5YQEinnqbC83vdt3X/f9us
         q9SzU1mnNd6tcyXuUZ4InRdYJTTMhafEKRrXq0ZmiZygZMmbSD0rtPdd3K2SnZg0nkBt
         J9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333333; x=1747938133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swfAGC4QXM6SdJxBuAXYcYtJSUnfER00xbbX38/PS04=;
        b=f5Oi4vY1P3IYomBk2nxooHS7ITNoG5MO7X0MqRvDXyWusSkfwFFGFZJsc2CLwZBZw2
         B1GU5cfHAsTxJn7+smfMJOcauwV0eftbVE2H1dKLz5UsLDz7uSsNyVIeFm9CSndztPiA
         CtRLU36iatMaJVR57Z8z3fdNr7e4L9xfPvzdgUTIghO8p8HPT9MeqKcquUxX0cW9vlIW
         3DfweIPdZ1ZUOPugwvdWe/PDKi7UnIwtJXk1yk4petLIMuTO9OMJdl34yZXa/VlufnlV
         gtP6N5dSFB3gsTH2U41TxgeKf1tSasReWa/sJV7imGHuiGn4Ue2oyqEfj/GrsYERX1Vi
         alnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvpXOyuRxJUMMWqocValB2VinTzZH7sMGJOsIUHftv0y4ikzCTaAgCzIMianik7vaNh+PMCemA8bhiRs67Rpih@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8za0bWeNC6Hf6Hq5H2Shr+bbQ2SRaFyK3Z2okQ51+xGN4uTD3
	51PEoemdGttodHYFqC8+Hw28utfUsSQaL9Bjn034I6hlTDp9FmxwiLdH
X-Gm-Gg: ASbGncuTj+KbIXvBMf1jTfQDg9/JL/XDMhPROQgUzBx2WKc3m8F4ssMGnMUt3/zu644
	bJSwlzP3mCOtiYlx/JuCtrOVdFRayhWvtKBKhxuM77VFnT3b14i++GOs0I1m2flpeYNL3z/51+e
	LNcxAaA2qHNHr1ADZk832cCUhKRVQxPXh7xzP4FYcqu55jdjUa4yElgEgjd9jqQ6hMBX+hN5fyn
	LeCNEo5b75HaBAlcbPPcqpPRuSIXIzaG8MxfPcW6LW1Q//LVzXF/cvqcClk18UlR4/73aJhoxPA
	uTmD/DrppI3R5cVxbeSUSjYMc4wgdYhSGyyWZJrTLZlwZwTNNNOeZObvCLfnNSu5sVcskn75gIo
	orOYemaFK
X-Google-Smtp-Source: AGHT+IEo58ibA/l+aKG0G6THwqe7QoJuwHRWZ2A96BcETwONZXqlfQqLt9nEPKLoc22UgilDjkoIcA==
X-Received: by 2002:a05:600d:19:b0:442:7c40:fda4 with SMTP id 5b1f17b1804b1-442f84c209dmr43756135e9.1.1747333332872;
        Thu, 15 May 2025 11:22:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm5828155e9.0.2025.05.15.11.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Thu, 15 May 2025 19:22:06 +0100
Message-ID: <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_112214_911654_5F319F41 
X-CRM114-Status: GOOD (  12.77  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also update the bindings to require the "resets" property for RZ/V2N
by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
the "resets" property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- No changes in this version.

v2->v3:
- Added Acked-by tag from Conor.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..0983c1efec80 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -54,12 +55,11 @@ required:
 if:
   properties:
     compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-ostm
-          - renesas,r9a07g044-ostm
-          - renesas,r9a07g054-ostm
-          - renesas,r9a09g057-ostm
+      not:
+        contains:
+          enum:
+            - renesas,r7s72100-ostm
+            - renesas,r7s9210-ostm
 then:
   required:
     - resets
-- 
2.49.0


