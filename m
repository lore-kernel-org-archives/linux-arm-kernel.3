Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D0EF8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=; b=G8I2nRWBsGG5n9zf+rhwY0FSik
	Smql0RWr8xO9u8OxgEGOeVJuxeB1upnqzCoaXSkl5NHvaLQQlDdx8qoDMlsI/T30vg1ya846v0h2D
	GfpUT9I0J5VVIjSTHMPFUZ+u5jGAibT7pE1GebwYliOepS3iHjqBlhnzRstx7Kmtj2SvvvjUC5vEc
	GNEWoTxIBBiWr2GMm+0c+BgWgqGZSXuwt/gvL3Ejw2FOhMK131CJcHj4O9Cfp0w/UuMlnUx1nh52j
	Ehdnire2N5hQTok2at1QSPTWd1CvEuZd0+YqfPe0RcHq1QpClnMgJUjB2wKhPiW4YsYEAOmoOJWnD
	WGa9Uyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCYH-00000002JL4-455y;
	Thu, 05 Mar 2026 17:31:57 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCYE-00000002JK3-3OJP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:31:56 +0000
Received: from hillosipuli.retiisi.eu (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fRc626652zyVM;
	Thu, 05 Mar 2026 19:31:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1772731900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
	b=vNv6Wiw4Xvfi089Fq9+E6JNNhi2Y3WR1Jzfwss0xjhX/7G2yJZZYQHoZz9YgAgFIOayfET
	lNoOP5MnaphYFWQVqURtju+aF1rSq7Pr64avVr2C/id7Mw9Cf/rJCyEX/ibXggi5vRM6yq
	uZex9HmZB9dXwtCHOSDz6UpugIwZm4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1772731900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
	b=GkNFEbEgaSmMs7tpq9OaKpiNvpUEkhiAShomlplPZ9KgCQoUfqsJergpyp+3V2Rt1rIlx6
	o1BtqZHo+miimEoMzUbXqJ77um/IcWBWhXf1aef5gLySzMAG7o4ihICa+tWtwaRaN6O+DL
	D7u+6eJbesIl20NAFz/mkv4j2yBUQx4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1772731900;
	b=Qpjs3xn3xCz6V2Mh2vyntKIo+H83uUw7anamRayaNabMsetmEyZPDGwaloVk7828MPwgux
	kwsOEzJLotnKGG/L6qRItFrqBFyZwucxeQPzK+MLPEq4xE06GAq4IpE0EKQ1nYIZ7d5yfz
	R5BwA2a9kpFeYpfBUsnff7wbQ50XMGA=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60946634C50;
	Thu, 05 Mar 2026 19:31:34 +0200 (EET)
Date: Thu, 5 Mar 2026 19:31:34 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 00/12] media: stm32: dcmi: stability & performance
 enhancements
Message-ID: <aam99usPtkwo9GbJ@valkosipuli.retiisi.eu>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_093155_050286_1DE63F2E 
X-CRM114-Status: GOOD (  11.69  )
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

Hi Alain,

On Tue, Jan 06, 2026 at 12:34:28PM +0100, Alain Volmat wrote:
> This series improve stability of the capture by fixing the
> handling of the overrun which was leading to captured
> frame corruption.
> Locking within the driver is also simplified and the way
> DMA is handled is reworked allowing to avoid having a
> specific handling for the JPEG data.
> 
> Performances of capture can now be increased via the usage
> of a DMA->MDMA chaining which allows for capture of higher
> resolution / framerate.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

I've picked the 10 first patches to my tree, I presume the rest are merged
via another tree?

Please cc me on the next time. Thanks.

-- 
Kind regards,

Sakari Ailus

