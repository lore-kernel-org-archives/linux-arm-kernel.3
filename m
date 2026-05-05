Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA88CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRt9IneYAHIH0sZGh01M8ZB/vtqtUvbYE19BEN3veSA=; b=deYiK3u6hJPkJG2mXAhDiaWclL
	BSGRvE21GlzgesEZoWr5d6Fzg9cVbTTyPRy7qUbr7e/gC8zI5tK5UNvToufbOzPo2qmZvm20664zp
	fA2eqR4wodq7p10A+HyaDdcccEucQoRRUMQrNJJA+tNdcU1sj803vmhQUd9MTVDfgpNbwlRxv7Xrp
	yedn+Gt0G+pPI+uzO/rL8KZpNWf7ipuS/Etb6qbXUjmI6VHnc9UB61SsXhO8yZt4YlNJvqm09is61
	mmLMmeLEX3ANwCrkhwWi2SwTuMp5OI2LFU3+3m3oaLD+VLoznPm2AX8BCpAr3nJt5LKuFmsjFiRW/
	1ehGP+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYT-0000000FyVH-0xfb;
	Tue, 05 May 2026 11:03:09 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYQ-0000000FyTk-3mjP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:03:08 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CD69C7A012A;
	Tue,  5 May 2026 07:03:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 05 May 2026 07:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1777978983;
	 x=1778065383; bh=YRt9IneYAHIH0sZGh01M8ZB/vtqtUvbYE19BEN3veSA=; b=
	LNc8NrT9XmghYrDXkRxdcUTPmqKidcyTAJimgWf21O224qfe9Xy3GFyUzEYSZX+E
	SzjI6DeItLdffPJMcUFbna4IWYyUu+ZOfCqJNKkQDYzz+gBmyYW/Vwx2nr82dHJx
	DZ7E/s/CUEn/5qtY8d6n7+QQUyhQaynmFrWXkoYPyqhkfGbcc/uyM3Q8+nIbYio9
	rZEmAihaFAOr2qK66yiQy8fc5P+Jqro6805p6GcOqunvUd5FFhV2yd2/JGAjWW5Y
	Y9oKAzwYpr/qQHYsCusxJJ1Sg2F7BHF8fOYdy6u4/pVxQdgIYcONyY36S3dj59YL
	0uyGmzBxMQbc4Ib+zfc+IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777978983; x=
	1778065383; bh=YRt9IneYAHIH0sZGh01M8ZB/vtqtUvbYE19BEN3veSA=; b=G
	zG39iDe+K806o9MCvXSI6g0PGU2C1slgdOYVpBj/w800NswknPMzpY/I6cparCV6
	V16qVtR142BFd2zx12fRkaFAZqORhT/n/zpg80px1r5Q6m04oeEFlH+Zxewp/YJp
	8skplY8t6k4+oREriXeJjiucBRCinWHLBWleX1O6KcXieJ0wLRnUdBvBCOYxcJXS
	028Q8VFD1WjyCjqrnw/eiwqiRqBL5sqMY+db6DGI0IEkm7nUWHP1fXt4R0Vh/W94
	eFEJUZS0KvFG2AU+cXrHHCID5l5fh8fZTOPDOFXrTzXFbMzwXsY95/To+AJV1jJf
	e7th7mLem3ceRVNBd34GQ==
X-ME-Sender: <xms:Z875aTLOuaWaNJOiUUzph5d66pH593lLG9MBmR17zzYn2BYaa5nhLQ>
    <xme:Z875acCOR26eJV9wtDtVu2GNjPESTu2z9gK63qunU9of9dhP5QElAg3yhPfMSxadJ
    MPu6g8gqC8A3Ulqqf42PwcuVi6cjNoZRrrLJCzAwmhXZ1zCD35L6w>
X-ME-Received: <xmr:Z875aUSQBIvkDi8OkLb2u4qbwX1ZzADDV_mwqB3in74iEpjflAyyM0gyWaTPPSSypV70zaz16rEuiEBG4frXxQb9Db3Ya0iCzYeK9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdduheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeif
    ihhmsehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehukhhlvghinh
    gvkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhg
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhpvghishgrtghhsehusg
    hunhhtuhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepkh
    hriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Z875adrTQR35QNIWXWSmOPxZTVMjmFh5aUE48noQ53vcxOM5Rol_Ig>
    <xmx:Z875adX2aPvsDh2QhYRcdU06evNt_8f_ju16-rWre19Tm2sQ7uBdxg>
    <xmx:Z875ab9gQ-9nzz7_4AYkgeds4fI_u3r3XLC0qY6568RKXQh0c1iT4w>
    <xmx:Z875aVaEG7azyyPD_EzlOfosmGV44NmXlEWhd_MI7fGyQrh8bGnG1g>
    <xmx:Z875aSLDhj6rKVUWVaByGsnVsksq-Gji54gT3F6r6-HWikWTk_La2QJz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 07:03:02 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Tue, 05 May 2026 13:02:39 +0200
Subject: [PATCH v2 1/6] dt-bindings: arm: apple: apple,pmgr: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-apple-m3-initial-devicetrees-v2-1-b0c2f3519e0e@jannau.net>
References: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
In-Reply-To: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Kettenis <kettenis@openbsd.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=v3VFWaz90916Vt3W0q5xTV1SO3iqzrjNVjydD1K3Sd4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyf5+L1Gk1m3VNj/h10lVm9eA/HyoTU+FaDo4p1jnOez
 3x/+F1rRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgImcPMXIsH92iPnrt6b1Ic83
 i4o+7tRb4nTjyPd7jz6/feey++DZZSoM/8vYWwPaN+pU3QwtVtwWx7LrQLKTy+ZVoasXlm+2V3O
 J5AMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040306_992259_B73FC532 
X-CRM114-Status: UNSURE (   8.33  )
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

The PMGR blocks on Apple silicon M3 SoCs (t8122) are compatible with the
M1 and M2 predecessors. Add "apple,t8122-pmgr" as M3 specific
compatible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index b88f41a225a3..c67b67ba065a 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -36,7 +36,9 @@ properties:
           - const: syscon
           - const: simple-mfd
       - items:
-          - const: apple,t6020-pmgr
+          - enum:
+              - apple,t6020-pmgr
+              - apple,t8122-pmgr
           - const: apple,t8103-pmgr
           - const: syscon
           - const: simple-mfd

-- 
2.54.0


