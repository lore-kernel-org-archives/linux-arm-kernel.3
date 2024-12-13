Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E255E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0PS8MAQEZybHHbs6FZGtMT3Ml/Nc1Pc3JSPi4pTUNI=; b=Nr8974SGh1idVRRRGKDXgI9ywx
	h6XOLbk1VByGkAeJMgWRsEZXZYwTLMroJFNU2OGh+1eiqwWUBdY5QMKZsv6hdgLwP2+rxhbxg5yfk
	xYc1Zok8wtTVqMo/HbDp5xCBBqIHyA4z8x1yHqE3BsBEyBVRpX7J1iU//11LHS7R1RySk7/YtilFU
	aZtvMC3Nv03ew1hglZ0Rkfe1SPyPwmq+RzyTx8pDRqMiaZsEVBCIS0X3FbA2O6m+n6dXpYniigKFJ
	UD6CvuY1msq2zzeCV+Rb5lTD+KpmIPtpAHkbsfXCFqNP9Qt61WeTLgZ8hcIf2bjJI8lgBtVmjFb0a
	HGwsa3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3YW-00000003Vv0-0gUg;
	Fri, 13 Dec 2024 11:10:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3XR-00000003Vlg-39Sm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:08:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ECE3A42ADD;
	Fri, 13 Dec 2024 11:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CD1C4CED0;
	Fri, 13 Dec 2024 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734088132;
	bh=Q0PS8MAQEZybHHbs6FZGtMT3Ml/Nc1Pc3JSPi4pTUNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlcsphOaglpa/Gsl9aKRBly3XeRAr0If8i6t5nFnfRmgB6ceeGeNIGWtVi6G9/Frh
	 XuTUB5aSm5m+KNbzwd8wBa6Uj2Zok1IY/DflaxxbK7gWMc9YZbnDC65ZzHBMcnZQNT
	 qiat+WoiHbJiWvwxOZ2/rDl7VpSz8677MdFJWtxpR/IBNjTNIzHbJc4Og/5TdZRGm8
	 gfrWVUrp7HZMVvX9djfxSw1QuamrtXb35JV2bHlO1mr3ZbGjT+9+ezmAp/Wt7xYjOc
	 K0QoRvQL+Y9ZDrFau8tziqI8fQ3Ml6W5eaFlr5iN/mwgEhPyIBcNvk7N3uUh5yQMsF
	 UTzREiyjFn4tA==
Date: Fri, 13 Dec 2024 12:08:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net, 
	joel@jms.id.au, andrew@codeconstruct.com.au, Delphine_CC_Chiu@wiwynn.com, 
	broonie@kernel.org, peteryin.openbmc@gmail.com, noahwang.wang@outlook.com, 
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com, 
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org, peterz@infradead.org, 
	pbiel7@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
Message-ID: <au4mmpxa6tbznu3pcxeu7tri4elvcoyy7l5m5ujdpj7ah3xqrz@ule3ymdiisyj>
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-4-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212214927.3586509-4-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_030853_849911_F255E51A 
X-CRM114-Status: UNSURE (   5.48  )
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

On Thu, Dec 12, 2024 at 03:49:02PM -0600, Ninad Palsule wrote:
> Add INTEL Common Redundant Power Supply Versions crps185 bindings as
> trivial.

becuse they are trivial or you don't care? Some broader context would be
useful here.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


