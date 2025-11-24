Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC64CFD348
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SRh80JRPdtQFZsVwmVzBJkwgQWYPU8Gma6w5B4XhKxI=; b=owgUWvsnN/2H4e2lwwvZifrZmB
	WcffSfsJahqW/gpAJ3NhLfX6tRwVXvZGJQe0sBxDkjP1C6iC6zKentVG1fszvrmYiaJxJdGRraVdR
	T0L/Hh3Ecl+PlJc0hIDe49AjbYsHOFYhud318ksLAweOhEa/q0+ghg8+gph+l3S0vAvbb08Kz0iN6
	OvxE95j/oD9U7YLfhQzX5y/jRfj3X4ZPlesHo3+IcNBp3gQYlX/xLond42EygRTw+TaZZzJ80JPdF
	LAhusOBHbFMYung3k6zTl2R7MCugAHO2aY2s5FXzz3HIGHMX4lm8Lf6CbNKYsrcVHeezqAdsuLLt+
	gTIiBJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNby5-0000000CDt2-2nzc;
	Mon, 24 Nov 2025 19:11:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNby3-0000000CDsM-2CHu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ABB24032A;
	Mon, 24 Nov 2025 19:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B88C4CEF1;
	Mon, 24 Nov 2025 19:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011478;
	bh=O3EyU3E5bo9vSzH59x8bJJr1BEBx3anTP1amwii3DyI=;
	h=From:Date:Subject:To:Cc:From;
	b=QG8mRcC579NKEbAZxe3afv0EhlOFaXQB4THuLOwr+uDjWlasFCKCWFKRoLxmEvVLu
	 oc7bqMqxhOlj4Q3GiPBIsYhnJI8XB1O5NbsjCGIQeIWMFSJx0asHIS0SDOGiEbdiJK
	 Or1vEf+RbdI6b1nMW6EOs7xVaNg2LKFksR7LUPIRT1HTD3ncTlXNRu4nz0wJT5fVN5
	 mRkzdoSwO0+eRde2lFv4VYSP9D6rbcgqcX18W2eKP1hCQPZICuA4l6Qy5ImX2bhXW+
	 L63bVsvoS9DbbuPgbAhi3mIfLQryJQNQuojFrl/zh/Wl2uaxVpKfSXEQ6Zs+JjZZ8U
	 MT6TZiKzY7fZA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 24 Nov 2025 12:11:06 -0700
Subject: [PATCH] clk: samsung: exynos-clkout: Assign .num before accessing
 .hws
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMqtJGkC/yXN0QrCMAyF4VcZuTawdo6qryJerF3UqDSSrDIZe
 3erXn5w+M8CRspkcGgWUHqxseQKt2kgXYd8IeSxGnzre+f8Fml+ZzFMj7uUCc88Y4k2ZIxS8mh
 IqqK479rgutBTCjuoqadSXf5ujqe/rcQbpenbhnX9AEXISzGIAAAA
X-Change-ID: 20251124-exynos-clkout-fix-ubsan-bounds-error-93071375ec78
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, stable@vger.kernel.org, 
 Jochen Sprickerhof <jochen@sprickerhof.de>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2434; i=nathan@kernel.org;
 h=from:subject:message-id; bh=O3EyU3E5bo9vSzH59x8bJJr1BEBx3anTP1amwii3DyI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkqay9VW7gv2v0sLjfCWjXnqNZ295dH9dZ9mhenlPQoS
 D24NZy9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExk0UuG/3m2W2MLXBl9HBy2
 t4lO3vphj5PbJJUPVlv+v+tc2yr5NYThn81vm4jAieJnbeLFI/i1Jv/yF6u/L5m3Sobv0+UrEz5
 f4gcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_111119_606386_332EDE95 
X-CRM114-Status: GOOD (  13.37  )
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

Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
__counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
about the number of elements in .hws[], so that it can warn when .hws[]
is accessed out of bounds. As noted in that change, the __counted_by
member must be initialized with the number of elements before the first
array access happens, otherwise there will be a warning from each access
prior to the initialization because the number of elements is zero. This
occurs in exynos_clkout_probe() due to .num being assigned after .hws[]
has been accessed:

  UBSAN: array-index-out-of-bounds in drivers/clk/samsung/clk-exynos-clkout.c:178:18
  index 0 is out of range for type 'clk_hw *[*]'

Move the .num initialization to before the first access of .hws[],
clearing up the warning.

Cc: stable@vger.kernel.org
Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __counted_by")
Reported-by: Jochen Sprickerhof <jochen@sprickerhof.de>
Closes: https://lore.kernel.org/aSIYDN5eyKFKoXKL@eldamar.lan/
Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5f1a4f5e2e59..5b21025338bd 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -175,6 +175,7 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 	clkout->mux.shift = EXYNOS_CLKOUT_MUX_SHIFT;
 	clkout->mux.lock = &clkout->slock;
 
+	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
 	clkout->data.hws[0] = clk_hw_register_composite(NULL, "clkout",
 				parent_names, parent_count, &clkout->mux.hw,
 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
@@ -185,7 +186,6 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 		goto err_unmap;
 	}
 
-	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
 	ret = of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get, &clkout->data);
 	if (ret)
 		goto err_clk_unreg;

---
base-commit: b6430552c8cd95e90bb842ce2f421e7a5381859f
change-id: 20251124-exynos-clkout-fix-ubsan-bounds-error-93071375ec78

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


