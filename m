Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FD0C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anoKW8qvKaE42kWsvt3mIJI+NxZdvkAtfEA51BXm644=; b=HO/th9pscmDyFyjDZv2NUP5Zf4
	iFojIPec1THJMOx5rnDin4egz2+XzqWaET6VgkHPb/mjyH0766rpR8xOQbaNnvnWJxQeE4UbCzGyd
	kfrFAPuqAvG05tqmIMukqwrDzlrN0sVKgvbonFXaanChC7FTh40zewdN98miEtoGyzqIiOVSvfw+p
	cfzWRwcTVPggluKWyoH8Jmw56F83bw5avdLC5aFJuos2dvvWzhx3M8Dj8AVJvEmGhIA/lszpwfvYh
	Gd+9qldF+Wr1cvoEwZ/rJTj3Z2jOBcoMEQz6MELqCa3TjNJa34IoPpAlEiD9YlnrX0m59Hbr7RAEt
	QDyB6/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpr-0000000Fugm-12E8;
	Fri, 24 Jul 2026 09:04:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpT-0000000FuHk-1SVp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f7027ca11so143608f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883866; x=1785488666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anoKW8qvKaE42kWsvt3mIJI+NxZdvkAtfEA51BXm644=;
        b=GJ7C78xWHg+62ODsJeTFhkjE0ZrF+CI+VHSA4qG2Lv3pDpT61kv1Flon26G15hB1gb
         g7nplfBnLSLLW6e3WQpZMml2F4EPSHrDMlnuohuA4Zw//pscC+HAanqz0w8N0W7WPZwU
         OJKnfN3tfiE3K34/iaPFaMNCw03B7WuIFOtwMBasVSf22Qeo1uPwCgobNimEdtgvKq4L
         yFDcCAYHMWmYX8hZ1FGoLW6EJZN2l2aktMlced0LBi7CkS/8/xnAvkOeS55HUEg+KZM4
         pHrwai7mfz+4e4Ul2UiVs9pc31RtOTTEUtVYfpDrxzSSwqF+1KDhSIls5nOE/n2k6D2G
         wLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883866; x=1785488666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anoKW8qvKaE42kWsvt3mIJI+NxZdvkAtfEA51BXm644=;
        b=AhusTArUpgLlPvpG0/fBkRTmIfh4aW10KBHTwA27nDbaQ8lYJtwQN7d/KXySKI1499
         OYNgJValCYHu8W3wuzKCkwqcluRYuxIQGWE+PyCIOpkaNfeSMlAbACrILOcaTy4m/fKO
         C58r29KT9HKN6isdF62cT+Cm+iJgK5OqtRXowLAh2gWorMouoSf8H8qxBPvcWQO/us4Z
         fh1TcVzIno6LJOYaXzPHyzLKY0DbdG/LYE/jz/dvAgRms0dChXA/si4fCBxIdAYufWKo
         B3Kt52lpTbxYM9M7gvOLFxaLLkBVv+5du9+CugEV89HS8AJjKyPU3QhKRLyLELA0H6E9
         SDEQ==
X-Gm-Message-State: AOJu0YwSlL4B+QncX30U8cYVrdJZyDG6ira3An1vKlFbuNV1oz0rLDPC
	++vLz9cyDhpKyDnYfOFGii1y9mA+y3kXBHZEad+d4pGSguLBxanwuG30KRaTtfoBLpA=
X-Gm-Gg: AR+sD12WNEJLdgGDrh/HwJbgFNtCK+/4OD67WoteefwsIhmJMftHGInzjHCmGqIKaT6
	0D6RcUmEtrOtSKVAhzaPO/jpbIp9j9ByHqOc2vsRBwixtptuIhzakXb51wacWM2N3pLPvBzfdP7
	anZNfdcAFfqokBphsGX3IGkVZFGwKq9heoyYCRSnD9nZnHk8CLA9y+ty4dZu8bE/J2KKWjAB760
	sO3wtSmrhZru/hzGcMmk9UuVYdQtX9V9S831gqUk7SuK0mTqPfJhqDNqFoeF/v0JfdjuLzJKIvF
	37qe4smX1MLTjl8HCPZLx8zcLuZBdbMl43g6Uk2tKU51d8aohGZPomhEdQZkeSxMcxDNX43Ftz0
	kVgW90NqcHdFE0VG1oYoQYKBisNbd/HvjSgAZ2qYx0ROBfxXeql8d7m01/0eybew7w5nm4B7Pex
	y3
X-Received: by 2002:a05:600c:1990:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-49573cd8927mr70665895e9.20.1784883865686;
        Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957afb4da8sm50979535e9.12.2026.07.24.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:58 +0200
Subject: [PATCH v2 7/7] clk: ti: clean-up simple provider misuse of the
 consumer API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-7-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qi2V6YqGjc3ox5XSg9D+PgsVQmlPliMSkFPKWxRHUHE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqD8X6HJICJaogPLmVW5ml1R75cJutw+gfiJ
 tB0/SaVRoeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgwAKCRDm/A8cN/La
 hZKDD/48CqDz/QRWxvqQiZfXQXrQZ+Wgc2Ef1vVKm04mZiagVtEgtLY8z82Jakzu+XTZ/upstvz
 xSnqrHDzMM2PT/UOqYhUTHR276luuahMFc+5GHs8qgLWSI4K6l1qQpFASzrkFMJ99geCBuSUUkw
 BcC1TcEoLVUZQxMiXPcKB9ZpJkpXEl6c0Iwpdblk7tIihwTXYWc4GLLUzWezJRfgtOuVwc9rVFJ
 8DomqHnipH4Gy56+1W+dWpiNzNXBjL73LXBFhsmlE8aNInLh7EjAGT9bAl8WES5M2ygH2BVuTyH
 BTfCvbPSIB+Janl3MVM/dTv6F/omRpFnOLIBrQtCTdHYGjTkRMJipWghoIvNYAY1fHORlsuyltp
 Ag04g+L7BFDYrlqh90BKDEWELW/DVl1FlzaMR6MAzFyiJ7Ubm2vaUgk4mYL+JnLMB93sH0TVJ7G
 ircePpHwwcUwnjE3cefSvi4pCtmxVrbb3cqGlmjG7fmg5Up2aRTnHHdbzXvpwYFSlYnhHNXfweJ
 0+ya2NqXjGjy8tEODN4dubBw7zAnxm0i+5ovlTpEJaiHLqYet0Inqc63sWoAstKpXL2pHo/9ZUS
 h9pjOdE/2Paxlah/zqAGJZBfh0+/EtVSCbHz/ikGAMSEEjMMkd7RbIiWpBjguLYslB7AnsJ5WiB
 BEqFaw6yMp0mO9Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020427_403498_15EDF5A9 
X-CRM114-Status: GOOD (  12.23  )
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

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/ti/clockdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
index c897ad7e681e..aedbe78bf1e4 100644
--- a/drivers/clk/ti/clockdomain.c
+++ b/drivers/clk/ti/clockdomain.c
@@ -104,7 +104,7 @@ int omap2_init_clk_clkdm(struct clk_hw *hw)
 	if (!clk->clkdm_name)
 		return 0;
 
-	clk_name = __clk_get_name(hw->clk);
+	clk_name = clk_hw_get_name(hw);
 
 	clkdm = ti_clk_ll_ops->clkdm_lookup(clk->clkdm_name);
 	if (clkdm) {

-- 
2.47.3


