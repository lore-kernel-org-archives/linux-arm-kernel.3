Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EEDC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTNpzrYwTyZX7H+h2rvNKx7E/X9ORfxmeaOuxO0zcfQ=; b=xeWV9byu3pkyVdiVGxSHdDSVV7
	zBloVRiz8xPPrHtvcX7rWxjpg4F7R7YP+w1AkyBxSiUaj8cwZip4uX8q/WLGbQVqtgv5gv9iXiVK9
	vnwecjr0t9ilWFraxnmWZ2WW4tvRPPb0HRqye5PSQDxC4uLVhPiJVKfI99Yx2UOzAYbqlQggLHHr9
	46ar17SfnTYRzuAH+I559VRj6UHE1I5dae6p5OrOCjhGls+V8fQpO8EDLd0E5dm5uj+vlRDWCGXIm
	sK2TVZriUNJSOVbsqlD3K1HBlrFNv/VUPuw0fLROs4lmLI81A3Y+jnqIahMI7+H7nlm7CQ9/+N6op
	q9BXHk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PCi-00000005krz-24Fh;
	Tue, 15 Sep 2026 09:11:52 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PCg-00000005krO-2EZL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:11:51 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so11853066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463508; x=1790068308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xTNpzrYwTyZX7H+h2rvNKx7E/X9ORfxmeaOuxO0zcfQ=;
        b=DdTFnaUZH/jX4ugHOerP7elLIvuRwN1+wySbScfknvS1U6Oz7b3LYD4GcFwL4glBK+
         /a7yP0YdTV9lFFYToCiyDXHyBne+hLTdKw+ZtmucIeq5RrngrVvV7IA6FNKFClFtdaBm
         gTj1jgiW+seND982pulcToeIGQHr3AYdxslLKHUWASCzqy2m6b0t+Dbjqr5KbkOBbXXz
         YY/ZJf2IEfBX8JT4k3UvRCxMyMT2x0Q9KKqQauJsqXJrvoIfcR/GD4XPgb4VpmstaVpp
         qBys2EFM/uxE/enDd6mUaHFLmLPuih4B4E0+iOBITO71OP9UXrzVn+kaLDbIfS5x3+sl
         7ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463508; x=1790068308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTNpzrYwTyZX7H+h2rvNKx7E/X9ORfxmeaOuxO0zcfQ=;
        b=JYqSkrOCHcqIxi3JYUoUFzJUxqsTrLAuviOjh131b+WtBJaIuvVepLQ2EWYQY5BswL
         KPZEkdLjhi9gn9GPtoJ5nuF9yT60//iPLWPerXXOnOWnC/dq/ruPBx0VoyiGdguxgFqO
         WlvOwNCmJCHMyDH3e3y8CQnCr6KCvELn/LEz5dzA9XeX6CFilgCqBvr4DprMEXDX2Z2x
         pIHBlD+3oepQXNnKtITvHWCmC/ZArs1bfzCgwl2QtKJNB41hTE80EXbQtPL6M9IglvtR
         Li1xbTNGUwi1fMuElKjdNFvWbluBk/jKt0VyKrSnl9nnpK6vGVXTRkTx9GAOQBZjhYTs
         eB6A==
X-Forwarded-Encrypted: i=1; AKwUvBwXnLuyBmXLVG1Xled8ifmpAzPUtszg2h1UPLuaNUUOn1k26I13DKz7kDvv05V9Sssv7pqg2LO4VUvRUxKJ6w1N@lists.infradead.org
X-Gm-Message-State: AFuF++lLTogTuQff4ebXTqbbKm6jGVJ35w5Ye77V1C/K2CtMGiKpAvi/
	NH4THa/iTK/KEXBy08UTe4ouzDyYoyZvU5I5UvM23tq6nhz9er35zZsO
X-Gm-Gg: AYBFou25H+LAMguOPMrN+2uZFvSpFJlDBVo+V5rX8sFFpTaiTqxoprQWIdqobE867zo
	v0eDNFsT14K6FPLeFWTBmdsc2zU2X4Q19MObw48DsiFf+2/FM2nl5FnSY1WHdr5MlsO/CoXtMmH
	Ov3XMlK68pSB3AE0FxQ64hp+SiSRJi93FdTWs9t74JisBChuuJnbN4XnRMxONWavK9hpg9WsSxU
	UOTIrbd2BUyvYXPwIEJlNcWgU+iZkJNqf191l7ah1rDsRUcpPEL3e01gl70F7AB3GMfUvMYKW41
	ZGIUHLxwBe42t1BCSyKQxHZFX3Phf5s9j/7WycN6UN9cSTtxiLBO/RqSwP6EAS3hDW9/K812qmW
	13j6KpBDFsRmWgVuV7bgVKFiWCiHB/iFCWHS5n25/DZcsK8wkER+GTAvxelMPrcwE9RQETZVNST
	LzExPwWtu4o9eAqvQC0avMJmiDvwHjFWa24TX5iEz4LGcnWKPyie/ay+KZaFL5Dw/DXC52S1GfU
	P+HhNq2SA==
X-Received: by 2002:a17:907:8995:b0:c29:53ed:f0c6 with SMTP id a640c23a62f3a-c29d779c3aamr23025166b.17.1789463507903;
        Tue, 15 Sep 2026 02:11:47 -0700 (PDT)
Received: from mobilestation ([185.195.191.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm552850266b.6.2026.09.15.02.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:11:47 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:11:43 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org, 
	joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
Message-ID: <ybotecadvx2x3ucgqjunv77fuyeaxmwl5tn77fswraztiklrdo@ajhpl4c52hcy>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
 <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_021150_585611_705A78FD 
X-CRM114-Status: GOOD (  15.00  )
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

Hi

On Tue, Sep 08, 2026 at 04:43:05PM +0000, Ovidiu Panait wrote:
> The ESVL and DOVLTC bits control S-VLAN tag processing and have
> nothing to do with the double VLAN feature, which only provides a way
> to process an additional inner VLAN tag. However, the driver code
> that handles them always refers to "double VLAN", which is unrelated
> and makes the implementation confusing. The driver does not use any
> of the inner VLAN tag features, and the networking core does not
> support offloads for the inner tag anyway.
> 
> To simplify the logic and to reduce the confusion regarding S-Tag vs
> double VLAN handling, drop the is_double logic and add a hw_svlan_en
> flag that is set when S-Tag hardware handling is enabled.

I believe I suggested to just change the "double" word to "svlan", and
not to drop the respective logic completely. The number of S-VLAN tags
added/removed must be still counted, otherwise any subsequent VLAN
S-Tag removal will disable S-VLAN processing even if there are S-Tags
left added.

-Joseph

> 


