Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F460E674A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 06:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZdoVD6gxkhJhhcniYhybCqTDMbRV2ppXXejXW3ALv8=; b=ihA56RIeR5V5d5P3411Q/cmO9D
	TX8K12YbYrwz0rmM/cNYWuWShMqm1Ca9WnJ1fu3dixcZ7/5+ouMWBsLxrG5olbW7VqkZq+Zm7irF5
	dD9M1jP5ZUAK9pET+JP4gFXEl3EVZ6p2kAOS0Xkbt556bKqbd39nNBvDtXmdIVomRxr9HJgI0KM1f
	nv6+6mabUHporH989Z/GEvZqxKmuMGKSzsCyy0IuPcR3i6ZG62c1dewz4UaDM3We0Hx03NVVQyaM9
	adIwUAqo1nP2Xl17PpcA0gmWLYXXa+wlt854JcntkCb5SQYyXKm4pweMx4hoZXBTSswiIL5ajIvaS
	ACsEwB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kij-00000005tKj-444u;
	Fri, 01 Nov 2024 06:01:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kh5-00000005t89-1Xti
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 05:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BC6B5CB5D4;
	Fri,  1 Nov 2024 05:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FBCC4CECD;
	Fri,  1 Nov 2024 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730440764;
	bh=bsORacs+XRwGPNAegb+drBs5u+8UfBOTbC/pTO7y+6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVh7VB2enHZJz2ft2TzPQ6heULNsJCk/uXeTpmnaSnRpCSLN3C+NK1iX/bEEpFt6h
	 2W87GxwcpSE6QV0JhzJLL4ZPyLIxWmPUk7IrZ91GhE+SvdErRpmR/bKPeYJBzVWBSF
	 5nmnuQ13mIjRxAt+KZj4/QkjkcQmspvZyLu7/XXJPbnJHrzicUmDx00kFnWxVUVJj4
	 LSTrz3fUPlaveJozHNHqe0b/UlpNOBQKepLyfu944Z3dH6lAnjZYmBry1ulIq0rRON
	 sLVHcMBAgmPa9jd5wnj5e9StQtSQNO+qIdFGgclPRPr1SvHWBeC6itjriO85bJDkOQ
	 tbuAf+2fGkghw==
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	William Breathitt Gray <william.gray@linaro.org>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] counter: stm32-timer-cnt: fix device_node handling in probe_encoder()
Date: Fri,  1 Nov 2024 14:59:18 +0900
Message-ID: <173044055547.648361.10787383264184720457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027-stm32-timer-cnt-of_node_put-v1-1-ebd903cdf7ac@gmail.com>
References: <20241027-stm32-timer-cnt-of_node_put-v1-1-ebd903cdf7ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=663; i=wbg@kernel.org; h=from:subject:message-id; bh=MbN8O+C+5FEujeJNUwaWgYqQSEexIAnJ9ZIqUSvRh8g=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDOkquc+e8rirfDxrXaT1uHa6lYSF0KIjb/autf6fMKMth bvYJflDRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRdxMYGTamMhRzCfX8PB7v sq/R65r1lmq3+ZazZ4n3fSt9cnDGV1tGhpurmXXXnq+9fmCXyx7J5mUT/63wM+6aqJei7HLGaEV JIAsA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_225935_470424_FCCD6D0F 
X-CRM114-Status: UNSURE (   9.67  )
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


On Sun, 27 Oct 2024 13:26:49 +0100, Javier Carrasco wrote:
> Device nodes accessed via of_get_compatible_child() require
> of_node_put() to be called when the node is no longer required to avoid
> leaving a reference to the node behind, leaking the resource.
> 
> In this case, the usage of 'tnode' is straightforward and there are no
> error paths, allowing for a single of_node_put() when 'tnode' is no
> longer required.
> 
> [...]

Applied, thanks!

[1/1] counter: stm32-timer-cnt: fix device_node handling in probe_encoder()
      commit: 147359e23e5c9652ff8c5a98a51a7323bd51c94a

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

