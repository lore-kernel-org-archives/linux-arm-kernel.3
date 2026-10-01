Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F451CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=; b=sCqALr0ElePmnJ70Jy+UfSHRTj
	z6clBFAiggvHDqhlCsenrF6zIIayrePSrDiQyx4/ZhJY9KVQi9DdsgJfuX7sw8oKgf3fRqfJzMiVU
	D6HzboMcLVtNmQWlxlP935yCJQ7NJfO/zw1K12cVoDozn0pFNr4iIQjlkiSrOXHeyTxi+NEJewAcP
	ZakBS0n7WoVn6sD7GAQHwT9UOesFR3JYYDKdWOXav6DcOEkKgFqKeZMBe+TKgNnngXJ+GRMgVbGOi
	CoaI50i8JMcNlxS2siiWAZNrhCRVRYpY5eAHhJyMUyO2RCd76QzbTtruSBt7zA6pUwZMzA31/pKeU
	sUl+yGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB3p-00000007yf1-2H7c;
	Thu, 01 Oct 2026 07:18:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB3o-00000007yeM-1EJS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 07:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=; b=n/napHdY2Kbh+ro3gRHTCo9PUd
	auEZ1fALXWtlHlIFfNdyA4h/Mkjv7rluFqmZei56rmPuUcSZkwQ6xA/HJDo2FshgctNOV7hNSd2S0
	XBV+EZJPeyEgI40xIT8q9sgy4b/FFK6ltAlDnmDn7heb5dXQ9ni4188fLAp3mi69lc6yZ+GR48maC
	mQ6gS81Fuf6KJTltRIv/4iSDLC4RM0lYqUsgBxgx1wkEUw/aKApErmIhx4oEv1PXlK6ycIpvaQTWj
	CKB3NarniZS7lDm+4+C+1oiVvKBWl/Dl++QNkZGCpjixPpU8+Fzx0cGpTJpvu6LxYVdhsRxYt1yg8
	geCQyHzw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCB3k-00000004fbK-375m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:18:31 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso22294105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790839107; x=1791443907; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=;
        b=MhrWCUpsyRFGxDi+aGWOIh4YzOatZdVLpNGOJtC6fuAsZ47AlgYdiVhMp97zWFgSSv
         tMQJnqSoA2gxHds+muFXCu9ELfw+lJD+h7dWbt/Db5zAuPRCVL/woDqcaTXNaB9/FSNy
         0p0yY53SwVIPZ+DtXPNEzMf7/3pZiD9ct0FOgQ1lTIalI7RqCJiyPks27BQBO7Y49bwX
         oozIHOkISQ6OAIA6EGSmV4O4gjAxFrFDOnOVcsEzrGZM9EHYuO0UgGV7sJOKLDdMGV0L
         EXuyoKl2YiKGZVGbsfHH8otVWCIP1nx/gKCyLyC27tB9xIr48G0DMQrbvHw4CM0jIGa2
         mEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839107; x=1791443907;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=;
        b=yy8ju/bcdp7+3ink/tomsNIFwtCBJoMFvE6ei+TZTpi4fBdGCgmyBI/yDPW/jqCvzc
         HZKfMqzBafE00Q8HUWFUZo314KJaogOxRvtRuNSsPLWlg4zkZFpD8kAFTwwl6zXzFb29
         FvmvGV+ewDOkNmVUfKT1K/2+CY7R1MsB4qIo6IzTkSdX7ij5BVMnuw9BsNysDv3WLjio
         HEsMXCGgrdWDUNt9IiNI9pdfSS+UTS6wTJNVV/4qhQu4J9gzu6wTYmd0DcIjZ8xpekaI
         cayXT63MObT1LK+HgDUogwDhIngWacpOSryJ4QiEZxELgMy/+gi6z4kcEbr7bovmL5fV
         wfZA==
X-Forwarded-Encrypted: i=1; AKwUvBzvnpLsxMTkpHKnfK4l+c54Y4fC3KCHC+a7abeXv2X6tvNxTdtTJzUVDOZAaUAzEs7ip90GzyGMQjmKvSWig+bC@lists.infradead.org
X-Gm-Message-State: AFuF++laOYAJIMP84bpZ2Lt00IjBmF3Qq6QuxkMHFJFnGxP14ClcS0fH
	OfP9yKerzax0xVsJ3YH1ruUYuPMxNTCtMIZiBsv+wd49tTZVdriTdX8V
X-Gm-Gg: AYBFou3P7kgU/idLVj1iOQdQj4fkNYNYxCfFXy+o7bvE31gphuBV53wCA9jdy1Ipxrk
	cnMkML4OJ/eoVH5vvcmDrF5i/htvSdIo+/LD0srMOCN27OEtuzb5P3QX5sAJvJgkVAJH4WkVurT
	79tmz+UI6N378BtaQTlWqxu1OhCKX5HNwzWLlGcbVDRsNH5kT7tl9VQaUtY+aLUC+ixl1tz25v3
	FXNhHadV597muxXtqsJio6opOlg1t3FuLI/CW5RFpL6VBmnyaQG9nzPK8xYbNhn8Wc0UiFCvii7
	h9SGayhtHLUwERh1Yx8ZQuAJBOLf9U9g4UnM2Df2dt0/wntIImyo2inrA0d39aXmmhphOmBXguw
	Qy6RJqVb49qrEFjN07m43KpFxm0j6xTelKPQxhK2QBDIKnbSw+bG3kAoDH+4abBBxQlR70Vv0En
	cYO8LA4xxbkETYhK9OKWW5gJ8Gws3DLzsLPtMK5XHkgOQgncr29F4fDfxvh10kBaAHoz1ryOiyg
	I36pixao4FvZd2KTAzyjc0kj3UKRxJZqOvp0knA4ACRx1ezpUgoRvrOIlBQqAZU1eOIbj+zFlx1
	jy/09bLjO4ISJwVrbFa3qedfn+qHq+pkRm/F/xTk52uJOuu0Zed9q+oWB66riDHKpCqkllpKQgj
	b5DWU4blrwwVaG866MS7t+ZebCHQlJKM9iZyRXfWvNXN67zAcarbIJYjuEFxJ60Bq2OpSXHkXyR
	jxkMjv
X-Received: by 2002:a05:600c:c162:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-4a01ad907efmr63944185e9.4.1790839106608;
        Thu, 01 Oct 2026 00:18:26 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ecef86sm8562995e9.3.2026.10.01.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:18:26 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:18:27 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, "Ryan Chen" <ryan_chen@aspeedtech.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU
 AST2700
Message-ID: <20261001091827.00001410@gmail.com>
In-Reply-To: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
References: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_081829_231160_3AD789E0 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, 1 Oct 2026 11:28:43 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The ADC's reference-voltage trimming data lives in a SCU register. The
> driver has always located that SCU with a global, name-based
> device-tree search, which works as long as a platform only has a
> single node named "syscon". AST2700 splits its SCU into two
> instances, syscon0 and syscon1, that share that same node name and
> differ only by label and unit address, so the lookup always resolves
> to syscon0 even when the ADC's trimming data lives in syscon1.
> 
> This series adds an explicit "syscon" phandle property so multi-SCU
> platforms can point the ADC at the right SCU, keeps the existing
> global lookup as a fallback for single-SCU platforms and already
> deployed device trees, and wires the new property up on AST2700.
> 
> Patch summary:
> 1. dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
> 2. iio: adc: aspeed: Use syscon phandle for trimming data when available
> 3. arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
> Assisted-by: Claude:claude-sonnet-5

All Assisted-by tags in your series should be changed to "Assisted-by: LLM"

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> Billy Tsai (3):
>       dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
>       iio: adc: aspeed: Use syscon phandle for trimming data when available
>       arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml       | 28 ++++++++++++++++++++++
>  arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi     |  2 ++
>  drivers/iio/adc/aspeed_adc.c                       | 20 +++++++++++-----
>  3 files changed, 44 insertions(+), 6 deletions(-)
> ---
> base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
> change-id: 20261001-ast27xx-adc-upstream-34b3d9e8e27b
> 
> Best regards,



-- 
Kind regards,
Joshua Crofts

