Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F9EC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1hejKLDvUrNRMC63yVoF7zEQMOaGnYjgs2MYcPbuL0=; b=oTnyPSm9veLTVKPGgKqdfw/KZh
	GLB2aqmGWRM6OIUOgqzCsrXi5ICkCRYv/UVnHCd4yLD70vgeM5qIUAEkwubdPR/6ngACPJ5OaUXO2
	Frzx7WEYyhp+ysyq5nJnGNADhdC2ogZOEjMPfyrF113tt9+0wV0hWKZIGfba8Si9vTYwaPK1YthZT
	NU3Rgy0ZgE2eJprPfak+tWgPkDDEx3ST2Z992jHdfy6O4o57TfCKEeVO6opvvdBkyh4C8AumaTdMo
	OfbjgBMt/9WIZmFMLy8yMJk/NdYCNluk91nvThkwVt6UuHjo+Q7xTcFFkIHWfsrwpvHC4iNabhcPj
	WKTuXK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trH7x-00000000dXf-0oib;
	Sun, 09 Mar 2025 13:55:37 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trH2h-00000000cu6-2dUh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 13:50:13 +0000
DKIM-Signature: a=rsa-sha256; b=Ld+OGBToQ2Rskc3LCPaPVwRkUXTyBr9Uz4nnibZ4BnlSmhq/anii+/L95KlURW6omngaBCiKqkYhFnfUHEUVxqRf4192eWtKDpPyP+nZwHkTK1hP7wTQRC9JLRKUUkxb3rgog/axrEZf5slc2+Es3gu12GJ0OxRlUvpej8fHLvcpQJxnNq5BQvDoAijrI8HglJCzoD074JllalXKnrGXVUI2sJ0BKGO5fZWoS80ILvd+W0veXq5G6D2zxmE4ksiOKRYVsCSaVfPFgyElOT4L1QWE2ha12s7zk64W3MpWkujBLNDEaOnJW0k97dqsed59U5ottVBtjWK47uhcdvY2fw==; s=purelymail3; d=purelymail.com; v=1; bh=G1hejKLDvUrNRMC63yVoF7zEQMOaGnYjgs2MYcPbuL0=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2065352892;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 09 Mar 2025 13:49:35 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Mar 2025 14:49:32 +0100
Message-Id: <D8BS7PJ6LNYY.28AK1FF2MR85S@mentallysanemainliners.org>
Subject: Re: [PATCH RFC/RFT 08/12] clk: samsung: exynos990: Use
 platform_driver_probe() to avoid __refdata
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org> <20250305-clk-samsung-ref-init-data-v1-8-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-8-a4e03a019306@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_065011_764785_FD309175 
X-CRM114-Status: UNSURE (   8.77  )
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

On Wed Mar 5, 2025 at 10:43 PM CET, Krzysztof Kozlowski wrote:
> Switch registering platform driver to platform_driver_probe(), so the
> 'struct platform_driver' can be properly discarded after init and there
> won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.
>
> The change requires using subsys_initcall instead of core_initcall,
> because no device drivers would bound in the latter, as required by
> platform_driver_probe().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi Krzysztof and apologies for the delay in testing.

On my Exynos990 platforms this patch causes similar oopses to those
sent by Andr=C3=A9 (different places each boot). I am unable to get the log=
s from
UART right now though (refactoring my testing setup). Apologies.

So this bug seems to be platformwide :(

Best regards,
Igor

