Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB06CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmsULhgzdpYks2pjKVsx1r2w1Y1WKpYU4+YB5dkEfOM=; b=uyI23BM7LKtYEHqDfxlVYY8tcp
	ZuUY+06gxvVUaHwi2cGHrmmVyQUw7txnM5wgOePCJqgOFM49zpnYunec3iBodsuAdbaA4iyCesf0l
	8H/bv5avNskb8WCG5BvC3c9iRxL9kso+oBWGw7OuC/Yzq7pJcG3GpkXFGPE2E4cTRtyRuJqKqpKWY
	MIXfW9vJZsErqLVFJlThCa/flL5RFCt+FZbOrd6GqvWW2wEIircdeid1Tr1Ql2xTq7RpFcZGOboKX
	Kb41cqpjv9JpQmWycwyaCx48xQGaTo4fOr1f8ls1DG1qZ4NGw7qR+rj3LgmJoNY6CrlFpjarf8NyL
	lmZbVTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS9y-0000000BKtp-2KrR;
	Fri, 22 May 2026 15:51:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS9v-0000000BKtF-3fRj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 15:51:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso54551135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779465094; x=1780069894; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CmsULhgzdpYks2pjKVsx1r2w1Y1WKpYU4+YB5dkEfOM=;
        b=QqSrDh50GgZ38kaBArTRjFQIBwiugm/YsoJ/dBlJ0ItGFz9wfkFZzwXoor48ZDbb6e
         mrnQ5dPXR3/IyMRlkSLmy3+8v3CJ1kuBpXiNcAWjhqehsIiJ+fKUQpwvTtkGBNE37HuF
         yhmhkUs1BnnXyQsyQ6LS1+bq78/1T7qk5O6j/x6oty/6PnOQiWn3gc083Um5twKiCIWB
         lF+/vI/81tQVd40TDrZ7XoJTP1/bj9ZREaDIZLRJFRMojqQusP9588SKvR63ZGShZ3Hk
         QLGkAssBE1a7QZc8IH/ch4cD8I08qq9gLuMhUf6kQkYquBRzfqWjMhPtCfcn9pHjIVcv
         UmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465094; x=1780069894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmsULhgzdpYks2pjKVsx1r2w1Y1WKpYU4+YB5dkEfOM=;
        b=ewU01h8fVa/HpJfy3/Kow7wszI+aW2krS7oPm5hm+j8bqgJIW2XQMCFEAD/2W4DE6w
         ChlpnojzknGLXFAr08dxUoG4YvUMZVEoNmecOctG6sIOG0qrq5IVSSvoxo6suqjb2yJF
         qDWXxiiNiClEF1Gpem55i/F2Xy6WuXkHbeFi1qfb0IfoBbtw+G694H74v+WspyCHmY1M
         uF5sD5SMkxFY16b6ulzSYCfatqVoOMG7l0oELTef/VO4l3z99Ar0Ukk/oR47iLPssdtw
         Z8aqJN2zh5KKjr59ySm0Mb4Y8QnMNRVRdDeC2amfT6wfgJth5HkPUVXlCvB3Ou+lUWLj
         WwHA==
X-Forwarded-Encrypted: i=1; AFNElJ8Pf+BHt+mEUZ+BpWh7dM3izQIqbK/ldJDUnfuZkWzod+sa5byyKY6nDiQTPspyTGsRq+TMHllDHSSdWsBmJghb@lists.infradead.org
X-Gm-Message-State: AOJu0YyNE8Z62gBimyAtfygnSAVuKFw3erRKmTfclHK/93842BT0OmKx
	QCH4ef7JdU4BX4glWsv3BUWCn8qHNicWE8fB2lXLZQb7owgAkkGR4ymf
X-Gm-Gg: Acq92OGRbo973C39+9ZF+eyRgzWWPVHf4P7YhmwTDfDU84uLGOSJ/s0Xmf15t7WQWu6
	MCmzm7MSigW5I0gv8UB/080L77PLMmFIkdDBkrkEoazCOdTqXCEXBbzRyqGk4f4snxUcywD7HTW
	RpiF1Rl6uYY5W+jf5cIB5Dehoyasy87e/HmTWzTFrjBNYQOifaGW3/cRxL2om9q6vxKGZV6IJb8
	CfzwQxwE8Y1z69P7iKGrFC33GExrTa8Xa99M/vkugJYwaaQJycaMR4YDwHLFtBKQhYUccBy6yH5
	rLkL6ZqWEWN2WayWX0K44QPlA+lPjEekRU4J1Ga5nJGXs4+dL6tNs5lq+L7QNg2qu3x2R+yLtiY
	eis2AMkpWydA2pzyRgIAMUIg59Mj+ZiorSHX6EqyU7jq6PFbidqX69b1yaVsBqC/2/5cKhfqigL
	HSS4g4jORhFe6JdWFqci7OZGiMGSSP94Qg0YJwpCsufNGvq5OS
X-Received: by 2002:a05:600d:640f:10b0:490:3ff5:737f with SMTP id 5b1f17b1804b1-490426cefe0mr46813985e9.18.1779465093265;
        Fri, 22 May 2026 08:51:33 -0700 (PDT)
Received: from vitor-nb.Home (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af026esm17298825e9.30.2026.05.22.08.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:51:32 -0700 (PDT)
Message-ID: <a6d42b33eaf5dd1e0fcfb3d4854968a081a212b1.camel@gmail.com>
Subject: Re: [PATCH v2 01/11] arm64: dts: ti: k3-am62-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>,  Tero Kristo <kristo@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Fri, 22 May 2026 16:51:31 +0100
In-Reply-To: <20260522132014.226721-14-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
	 <20260522132014.226721-14-ivitro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_085135_945486_57EF2CAD 
X-CRM114-Status: GOOD (  13.76  )
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

SGksCgpPbiBGcmksIDIwMjYtMDUtMjIgYXQgMTQ6MjAgKzAxMDAsIFZpdG9yIFNvYXJlcyB3cm90
ZToKPiBGcm9tOiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJlc0B0b3JhZGV4LmNvbT4KPiAKPiBB
ZGQgYSBkZXZpY2UgdHJlZSBvdmVybGF5IGZvciB0aGUgVG9yYWRleCBEU0kgdG8gTFZEUyBBZGFw
dGVyIHdpdGggdGhlCj4gVG9yYWRleCBDYXBhY2l0aXZlIFRvdWNoIERpc3BsYXkgMTAuMSIgTFZE
Uy4gVGhlIGFkYXB0ZXIgY29ubmVjdHMgdG8gdGhlCj4gVmVyZGluIERTSV8xIGludGVyZmFjZS4g
SXQgaXMgYmFzZWQgb24gdGhlIFRleGFzIEluc3RydW1lbnRzIFNONjVEU0k4NAo+IERTSS10by1M
VkRTIGJyaWRnZSBhbmQgZHJpdmVzIGEgTG9naWNUZWNobm8gTFQxNzA0MTAtMldIQyAxMC4xIiBX
WEdBIExWRFMKPiBwYW5lbC4gVG91Y2ggaW5wdXQgaXMgcHJvdmlkZWQgYnkgYW4gQXRtZWwgTWF4
VG91Y2ggY2FwYWNpdGl2ZSB0b3VjaAo+IGNvbnRyb2xsZXIuCj4gCj4gTGluazoKPiBodHRwczov
L2RldmVsb3Blci50b3JhZGV4LmNvbS9oYXJkd2FyZS9hY2Nlc3Nvcmllcy9hZGQtb25zL2RzaS1s
dmRzLWFkYXB0ZXIKPiBMaW5rOgo+IGh0dHBzOi8vZGV2ZWxvcGVyLnRvcmFkZXguY29tL2hhcmR3
YXJlL2FjY2Vzc29yaWVzL2Rpc3BsYXlzL2NhcGFjaXRpdmUtdG91Y2gtZGlzcGxheS0xMDFpbmNo
LWx2ZHMKPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1zb25uZXQtNC42Cj4gU2lnbmVkLW9m
Zi1ieTogVml0b3IgU29hcmVzIDx2aXRvci5zb2FyZXNAdG9yYWRleC5jb20+Cj4gClsuLi5dCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvdGkvazMtYW02MjUtdmVyZGluLWRzaS10
by1sdmRzLXBhbmVsLWNhcC0KPiB0b3VjaC0xMGluY2guZHRzbyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvdGkvazMtYW02MjUtdmVyZGluLWRzaS10by1sdmRzLXBhbmVsLQo+IGNhcC10b3VjaC0xMGlu
Y2guZHRzbwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wZTg3
M2YyY2NmNjUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy90aS9r
My1hbTYyNS12ZXJkaW4tZHNpLXRvLWx2ZHMtcGFuZWwtY2FwLXRvdWNoLQo+IDEwaW5jaC5kdHNv
Cj4gClsuLi5dCj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJlZ18zdjNfbHZkc19icmlkZ2U6IHJlZ3Vs
YXRvci0zdjMtbHZkcy1icmlkZ2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
b21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsK
ClNhc2hpa28gZmxhZ2dlZCB0aGUgbWlzc2luZyAncmVndWxhdG9yLW5hbWUnIHByb3BlcnR5IGhl
cmUsIAoKPiArwqDCoMKgwqDCoMKgwqB9Owo+ICt9Owo+ICsKPiAKClsuLi5dCj4gKwo+ICvCoMKg
wqDCoMKgwqDCoHRvdWNoQDRhIHsKCmFuZCB0byB1c2UgdGhlIGdlbmVyaWMgbm9kZSBuYW1lICd0
b3VjaHNjcmVlbkA0YScgaGVyZSBpbnN0ZWFkIG9mCid0b3VjaEA0YScuCgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gImF0bWVsLG1heHRvdWNoIjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4NGE+Owo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfZHNpMV9pbnQ+LCA8JnBp
bmN0cmxfaTJzXzJfYmNsa19ncGlvPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyogVmVyZGluIEdQSU9fOV9EU0kgKFNPRElNTSAxNykgLSBUT1VDSF9JTlQjICovCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVycnVwdC1wYXJlbnQgPSA8Jm1haW5fZ3BpbzE+
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHRzID0gPDQ5IElSUV9U
WVBFX0VER0VfRkFMTElORz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFZl
cmRpbiBJMlNfMl9CQ0xLIChTT0RJTU0gNDIpIC0gVE9VQ0hfUkVTRVQjICovCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc2V0LWdwaW9zID0gPCZtYWluX2dwaW8wIDM1IEdQSU9f
QUNUSVZFX0xPVz47Cj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArfTsKCkkgd2lsbCBzZW5kIGEgdjMg
YWRkcmVzc2luZyB0aGVzZSBpc3N1ZXMgaGVyZSBhbmQgd2hlcmUgaXQgYXBwbGllcy4KClRoYW5r
cywKVml0b3IgU29hcmVzCg==


