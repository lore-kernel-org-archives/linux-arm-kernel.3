Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725B7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fK0dDolL+Nqw/IbXpMjV80nR5kRn15xWt8Y45u+zCaY=; b=jM9/D9btG/S9VHriJ58nGtF2Tn
	OGMQp6DsnBtGSkU2G0wctOC+h/3VuFTFl2kN6KI/1RyYeZ5OU9yecP006Xpj3E+w9LUbgoO4K1Mer
	P4yQfmuskdGwbLefTqhcVFPTO2EOT+M8XilJiZelQskEhg2ysG6k9eV6NmY32S4H1vnwIE51P2uE9
	CruTiIeVWJSKMYhf+Z4a+tL+PJ2HaxYaKNLOiFzVil4oBlxngdnLPVcgcwMXa94wsyxMrhB11LZAR
	7m4QAFFFUBNuboAyM57T/B2mCr3aD9bQMCHRPriMiTzG7WfC9oQWf7yscXw4F8olYaTnAJiAa0u9v
	080rJH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFG0-00000005SO8-0JcV;
	Fri, 10 Jul 2026 17:43:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFFw-00000005SMY-3kyC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:43:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47df6a5202bso735819f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705399; x=1784310199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK0dDolL+Nqw/IbXpMjV80nR5kRn15xWt8Y45u+zCaY=;
        b=NRoMaq9oGdq775kzswGz2ZkV4oPdLffA4ZgeRxE53Vvs1+BRj+ESGwogr9D+t5iVqJ
         UKuzMp2YOhT5i37nlThlnVqxigozEEuyL06+MHSALL+jz6reGXq/U5lV25OUoFbpJUOg
         b0+kztDZwa3+3gKToNzT3Al0LOoBBDy1bOc+YNjRiyrvguXRuEG03EBGh6TF2BKIxIK5
         U1F6Iq7xvaCPkeqLfhgGw20WzQsMswitwPJdT/X9cJIm57lhFIRIHNkc+6i5N26aQo8t
         hhGq9NJB5ilE4OLsr1whnZG1xSDKTWneUNd71EJ0LXfZFwIXJBENLWEZWsN6r/qNTW/d
         eO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705399; x=1784310199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fK0dDolL+Nqw/IbXpMjV80nR5kRn15xWt8Y45u+zCaY=;
        b=Jp0vb04G+Ktci1luMyQ+RSoh61h9guP06xxas1AHxUL4mvTJISDw33jImJeT/aUB2W
         b+FSHHTEL13kqWzt0O4rFUrPc07Qy0qz/nxapsWYVCN5z1Q5VAU0jHBKUX0nxHmVJBNM
         h2VKTu1pscGPml2kbvyhO25ulJZ5iamuF4HrAbOdePKFpkzToF1JoLhBdQGOrHJZqnlu
         dRhB6rzSY7qQ6vxjW0qaiw70qoX+VZOI7OYFOh+C2tr465rp/S12ZI+0+pCRz9MennsD
         7XOYETw3g6VdgTaQIQVb7lLKqr/YbPH3vrsZo0BQG4uDKj0r4bRlbPonYvRRPmiwtBun
         zZMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC+CXmEIyvX/J4ie0oC0tjvl8kjU9dy3sd7RhWDT5WySdP0MpS1J2uOyNmGRlJhIjkZNmCKUg7Zjb61WZu62M2@lists.infradead.org
X-Gm-Message-State: AOJu0YyENE+jjklgzdLm3sjs0BOpXUO12HtYncrEyNhscu7Vd++zMHlx
	rUvIYUaqje/Gkc1b8aB2ERdoS21fsuQrIZEQ6xXRvYfhlQRzfWjEOT8T
X-Gm-Gg: AfdE7cmIaNrMiUCyZsylg2gPUUV06KqzAzl3uLScnchnauK75XW/ftoJ6nJne4EMgQl
	EPDSZTTA8Lqhp5/5diV4loFDsinEeW4aUsmtb4Ud3lpHxVSy4udqCumTF3JvYnB+2i3raeHS/JD
	DH7kj1qm3X0Rh+2Wn9MEwnGDNQbbppQeHmNTuILg3e3Ks5hHLVLY0Z/FLVaK0qRcy0s40ols0cy
	H7UcVRBnYXIx96d5kDPZGR3sGtP354esFaT+q8mFwymSrUFV16biGhfyH6KvxgNpHFFiiLWOP2y
	408zR5tNl/XDxEgGM8vydSQHrzqtMJtfEL8YBlNMtM0JeSGZxqh1+BfSz+SRVEb6tb9mde1XyHq
	lV6lSKPvOuA+1yHacTla02YzVZ27NrYaeFUDtW6oJvoKQytUWcHdfKhhck2L8JU6V9BXkQLqrnN
	BQpHrDQPYUGwchdyuCYTqkAqUtRGZr0sto9olzX0CiY25Ytn/Xd1K7
X-Received: by 2002:adf:f008:0:b0:47e:f4c:508e with SMTP id ffacd0b85a97d-47e0f4c5128mr5690984f8f.46.1783705398845;
        Fri, 10 Jul 2026 10:43:18 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm67170201f8f.4.2026.07.10.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:43:18 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
Date: Fri, 10 Jul 2026 19:43:07 +0200
Message-ID: <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783689915.git.stefano.r@variscite.com>
References: <cover.1783689915.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_104320_947709_4AC52987 
X-CRM114-Status: UNSURE (   9.27  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
From: Stefano Radaelli <stefano.r@variscite.com>

Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b9da6e62ab79 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -104,6 +104,12 @@ properties:
           - const: tq,am625-tqma6254
           - const: ti,am625
 
+      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62-symphony
+          - const: variscite,var-som-am62
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
2.47.3


