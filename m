Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D51C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV9e960kgtBY/glma0AHgxPEedRrwQy9UW4fIUHqhpM=; b=lu+ynTfViagVWIe+g6z9T1AULN
	RGVMdmRttQJDFxx5KR8sHwyLksKe62PGZdYPzPHXAS3TUutDvTKKBKv4in1JjOslHXy1wmSr/3ZqU
	6Fe+1pLBOK3cgO1YkCiVxcBIce0PZtAqgKKi8CKEDAFwvUcPZTBFTBh7sLSW2e8EfgNsWyeWDf4vK
	iB4vV/1rBJUX9u957dwFPG/jLXJsI7KtAL9RRfpqIWGMcJniWED7zgEypZCu/blRyUrvODLx3xYUI
	hegiZfJdYINFJNkVWugW20I2bwH6O/4nn9A+fUnsDCljac1sQfGwzEc5KiJCIAhcWYEv0MnL9E7Xr
	fXET+iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hk1-00000005RGT-3R0s;
	Sun, 06 Sep 2026 18:37:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hjo-00000005Qzg-3aCD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 18:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D57FE44810;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4385C2BCFF;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=nAvvsoDo0FnW497Le/eu1wxUngPW7Yw1+XhupbJs0xU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ng91M1NWr74/M+6TxNpdBaMm6WIRW4iPdEgAMHzkp8Vm4B6Pugj/LuI9FMeZQZOcn
	 JLyhUG56klS+puycggm74hdhwcEHe62sT6G7DIULKGrLOCY7EyCcFY8VOlo0R+ATK0
	 VUrbZeDg/tzjzWUrAUcEW8gy2YgDUApTBJLySugf44hXEHvdv7fwKGOAFBhOop9Atl
	 gtMjnpo1cGl5sEby2ctfLBtqjbs8WyeUrXkhaUP6JB70YKZuf/u8IlVZBrLvVWXohh
	 AbbGWBKFIhyh18z3bbTi93wwJlNdRZ7vHRHGHIHKsrTYrEs8S8y+GQlUv+UlZJUKqe
	 u0feJkOnt2RDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FAFC79F85;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:31 +0200
Subject: [PATCH v2 08/22] thunderbolt: Don't read the UID if we already
 know it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-8-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=nAvvsoDo0FnW497Le/eu1wxUngPW7Yw1+XhupbJs0xU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTft1bIN3s71O0l644+DSY66WJwU0J+ZPd2KNX6Jp8
 2rWPMMLHaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJbJrDyPCP8cBJFrGu0xry
 bS2MqjJ5+b1LWh7XS5bY7Ol+1/NbUIuR4cFSFi6ZL3ExVSc9XOZEKQpxTJogVW5WPvXiadWgyyp
 yPAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

On Apple Silicon the host router's UID comes from the DROM provided by
the device tree and is already known by the time tb_switch_set_uuid()
runs. Skip reading it from the config space again in that case.

For other USB4 hosts this only drops a duplicate read because
tb_drom_host_read() has already filled in the UID from ROUTER_CS_7
before tb_switch_set_uuid() runs. Device routers keep reading it
unconditionally.

Signed-off-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/thunderbolt/switch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 404c0693df50..3f54a5ae56b0 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2692,9 +2692,11 @@ static int tb_switch_set_uuid(struct tb_switch *sw)
 		return 0;
 
 	if (tb_switch_is_usb4(sw)) {
-		ret = usb4_switch_read_uid(sw, &sw->uid);
-		if (ret)
-			return ret;
+		if (tb_route(sw) || !sw->uid) {
+			ret = usb4_switch_read_uid(sw, &sw->uid);
+			if (ret)
+				return ret;
+		}
 		uid = true;
 	} else {
 		/*

-- 
2.55.0



