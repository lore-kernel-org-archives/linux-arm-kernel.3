Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B4CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBoEyETmzb2pJlpxlvi4ncneIXhLBRL6QQqybLVV9FE=; b=yX84wfF7MJILi88OZ+pshYQhF9
	kQmuWxJY11EcwKvsWsM4hmctoR74PJbePOVRZKh5fyUQ4flZtdbummi1TfXsfgL32er+FCg9jAT4T
	FD2ls+kG7P66264KJKXQrFghbqfY14SGPV/zSgjQvN48Yz1UFJu07X3FxFD2mg7znL/nFt+4Dtq5q
	1v+atfa+6SQygoVvS+aMqXs1qEALqVRBSzFgZsCzIg6VMuubROgOemFeShVo8HJxaLwCsXAFHfT7G
	v9+V4quZKeF2xdhdum1FtTTH2udgEqIUYXHC5wbfEWb1KTHSl7X6W2a6D2/Swv9A6hXuNNZLi0Dlh
	zJMQfqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREgX-0000000FWAQ-3bGk;
	Sun, 24 May 2026 19:40:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREgV-0000000FW9w-1cV9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 19:40:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97C3843874;
	Sun, 24 May 2026 19:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240FA1F000E9;
	Sun, 24 May 2026 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779651626;
	bh=zBoEyETmzb2pJlpxlvi4ncneIXhLBRL6QQqybLVV9FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MFGzQLmpiaeKnuF+BM8KzwbenS20tYHbSkw9xPD5TPep2Z52ZXIAiiTGOIFoZUaKY
	 2lqwKU+6CuTMJOT2WSJrsMSVBDNLBgi8itVkoaKVTZU3Knl2g+tpnSSVSXCtybX8Y8
	 2yubHksc0qDF22CiyV7AMjpBGWMH53ovGgUkUCi4LHLZDhuZYo3aEub0ziAh16RxjB
	 gDY63PCt6vbFeJW9ka1ZoI6MJCTABHb03My+oFUI9qIuG3QkPUkOBDpFkL4NYZuNjS
	 mgeVM3Om4MdM/d6JUjcgHg4i7A7CzKRAhPsk0VssE4AvxrQmYEhXD0cIPmsQthzBqU
	 kpYMQuvafXklQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	peter.griffin@linaro.org,
	jyescas@google.com,
	kernel-team@android.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
Date: Sun, 24 May 2026 21:40:10 +0200
Message-ID: <177965159562.32222.17454581524471571236.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595; i=krzk@kernel.org; h=from:subject:message-id; bh=EMNz44iBB8o+uKlLf5742Rp89BhbFRUqwRB/9Ltg7nE=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqE1QaXz5H4urOzMhB25S55CD9H55mMZKGNh5/A 6Pysa50nMyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahNUGgAKCRDBN2bmhouD 132zD/sHKWyAZBE34mXd5FejTh7Fp9zwjblu8FUeHimyj2wPWqEWm2ZivqZFjMyn7aA5uymbheH KS06Gcbkkqi1a9chSXmVVQ6MyUU3v5R1Sd6OrYPZlg6WyKzAMfcYB5eC/WF3nnHsVEDlO4Y3A+o qRYUMWnr2tIGbMihwIf3t3duzY8ZC9uAH/hsdA+Nid4qgsBiVqf9q3D8lTWxyZesYn4VEGOZHEX OPpKHKUM0W7QFbLIH9YKjUFMAnSugU+CG9miEVJ9G57vJiGI2adzMRvOya6txYbg7nOxgvZxTuA Ovogrp8uSpDpK0orOoiCoQg0YQVk1dFpLjky1DGMlsGXtqVoV3AYT56O35tDdAh7jZeJwCFfymz fvSwOUhtDd5urBSLed1KXW/BGitK2RclcGIWzOKnZjEeiyvYK1sgh6w/l0EJEH03DOgmRMEp99Y Jx73K+7Duc63/iRPAjAkv+td67OrUOgQJxSUmG5bp0HDj5dDbNjO3g8vm4rfHahNdm+c6g2xSto b7sC7N4Sk5+XfGvhcE0EDMqmqeec/pXsLYyna8M9XLpXiu0U3h2X01sOHC6lHFVqJ/NgElO5sv8 Iuu1woUxKNOojkzuItonSAoHuzZFMwXNWpHznWexhfLT9aVeVjoon/v8Ap7HkHq5wgLgFmT8VMJ oqfWZgPJIkBRi
 2A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_124027_485407_A1D8317F 
X-CRM114-Status: GOOD (  10.48  )
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


On Fri, 15 May 2026 09:32:24 +0000, Tudor Ambarus wrote:
> This series introduces protocol support for the Exynos
> Thermal Management Unit (TMU) to the ACPM driver, alongside several
> cleanups.
> 
> Dependencies
> ============
> Krzysztof, these patches together with the acpm fixes from your `fixes`
> branch will be needed by the thermal maintainers. I'm going to send the
> ACPM TMU (thermal) driver for review. In case they'll take it for the
> next release, we'll need an immutable tag with the acpm fixes, cleanup
> and thermal helpers. Thanks!
> 
> [...]

Applied, thanks!

[1/6] firmware: samsung: acpm: Consolidate transfer initialization helper
      https://git.kernel.org/krzk/linux/c/43d3733b7ffd82b2bfeda69befa2a179335dfe6c
[2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      https://git.kernel.org/krzk/linux/c/7b20fd06f783c1e901d34305c68df16212cdf669
[3/6] firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      https://git.kernel.org/krzk/linux/c/ef1109e4b6120a52be1ea66d486d6744d0c5ac47
[4/6] firmware: samsung: acpm: Make acpm_ops const and access via pointer
      https://git.kernel.org/krzk/linux/c/e694e19bf7db26ee324ff6bb450cc523592f5bee
[5/6] firmware: samsung: acpm: Add TMU protocol support
      https://git.kernel.org/krzk/linux/c/f6af402de525d0848fc4a50f25ff01f56fc68d98
[6/6] firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
      https://git.kernel.org/krzk/linux/c/8ad2c29d53e69df5cc1c1d00513c6a0f96d2d452

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

