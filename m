Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42134E77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0sLzScO5h+uaVr7gBpGbp5SkD8bkzDgpy/FMXSIL8s=; b=Ua6ZYHI8Algw76BJEqXNelY9FY
	1YHrd+lTNbufm4OddS/MjCDdSUS9+ZPiA0SMxAZJDU1n3yPUn0MF58wmy3dAnW4f3+dt3VO460ELw
	hMojYT5VoFSGgy8xitqYdBx2gkHgCu7U+O5UCktlFxBuJxj9weGsTVNNWSaTM1TKt8LdoIoojKlPk
	exTu+ImdvkK2r0puWp1jf9WkFycu+FAmcHxAFTHHmOKmGrxnpUZDe4ETViAyQUDqONtSnQXP+gAD5
	LD4Y6IhmLk4j6CKpcES6ACvyNnHAJyg/Thq4y+Mrtmhp9YCBlaf+b/Du/Ys/g9Cr4K0/+NMVt6sB2
	8lmPaEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnER-00000001FOF-1Vyb;
	Thu, 12 Dec 2024 17:44:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmzj-00000001BT6-2A63
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 17:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8567CA40C3B;
	Thu, 12 Dec 2024 17:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BEFC4CED3;
	Thu, 12 Dec 2024 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734024538;
	bh=SjAQ4AP/yA0fQt0zvQl7Z7VVnHL0A0CkMiaWTCcuSW0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tmQq4gmY/H3tupf/CEBrMfzv8oveGd32BRzD7J4VK5wYNYRhSFZNYTk9fo/QW8GVl
	 edj77EzB+YvLfBKK9cWjxbwkPneZz6eCzw4ZprPAkumT87q5KEsK4TJRRi056Kiqwe
	 tOurgc286+sQcyF3QLJ680hbjbpVHIfDtu18AjK28SJ/EIwhjX72NtxF01hEormtZ3
	 dMwcVypJHE5jFGNZCd9Oc0+l0A5cHaP8TsYYDHmF1e0jjFrIr5/iQ9C+FITcZTG2Xg
	 3wEyCfi8htNNrrJAudXpjRsg5UKr15SamgUvRQlQ190gqWfV9wGZboMjvXm9hmcmw1
	 JmQGBe+f7LPHA==
Date: Thu, 12 Dec 2024 11:28:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, 
 daniel.lezcano@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, vincent.guittot@linaro.org, 
 kernel-team@android.com, arnd@arndb.de, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, ulf.hansson@linaro.org, 
 andre.draszik@linaro.org, Jassi Brar <jassisinghbrar@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
 <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
Message-Id: <173402453635.2828943.15564980222849076434.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: add google,gs101-mbox
 bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_092859_621411_16E70026 
X-CRM114-Status: UNSURE (   9.90  )
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


On Thu, 12 Dec 2024 15:43:45 +0000, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos Mailbox Controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/mailbox/google,gs101-mbox.yaml        | 79 ++++++++++++++++++++++
>  include/dt-bindings/mailbox/google,gs101.h         | 14 ++++
>  2 files changed, 93 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mailbox/google,gs101-mbox.example.dtb: /example-0/soc/mailbox@17610000: failed to match any schema with compatible: ['google,gs101-acpm-mbox']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


