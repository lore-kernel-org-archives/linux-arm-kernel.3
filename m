Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=; b=RZjx+syKZp0PO15tGLWEqnqO6a
	tfmQi0JUaWdr3x/3esxwL8Z6qcGRASXuEmjfPRzhxZ4vEb+9gamOXsC1yq+hupCP8yhmr9/fwwMG6
	lnRTF8bMQeR5oszbYolUW+zg/0pez8w9J6mfSkcsRMWbz72GllFqTppF/d2HF1n2m136GexBMJeH3
	Z3f2oxY8jlX1wNxOlNL/uN8+Y5MIV6tfNBxxZ5t7DIUvgU5yJiHQ5x5Y/u9HMOdFyYVeQqXaQs08x
	wXfaLTzd4tRsaAhDvRiDBlQno0MnlkV6D/XqH+zz+d1X9VywIQLVoNbM71vWPYXZHL+a7ewjekslo
	1cUxTgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpug-0000000DYOG-2cmC;
	Mon, 06 Jul 2026 20:27:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpud-0000000DYNK-0iMt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 20:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783369649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=;
	b=WYgPzt86eBmXeUdXEPZxKU4fOQ4xxq6NI+OjoK3c0gEmRC8FMyXtU8EWJWNNF9Qf/kXB6J
	d04D26I6Rt9PigsLZLcXo5sWVI2qLN/h4YZ0SxnDsPAzlSJVfO7+kpkxWDGNL6xLqxUepF
	O1zCXHwaViCv1fBWTmrkpXf2FtbJoL4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-pH0dSylSMsmWNfQ_AtWUfA-1; Mon, 06 Jul 2026 16:27:27 -0400
X-MC-Unique: pH0dSylSMsmWNfQ_AtWUfA-1
X-Mimecast-MFC-AGG-ID: pH0dSylSMsmWNfQ_AtWUfA_1783369647
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso34964981cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 13:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369647; x=1783974447;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=;
        b=MlhUatRxkW2mWRjVFxlkp1CJv0yYz81AEL2EIoPvXBNZaCij4HU3egTYFQrfvFt9Zi
         aHL0zwxGoaiAQDZcKpoFejX/kmRXjWqNNURlT/AeI5Qtn5dy2CV4Oj/rkq3ndhJuo5kc
         hxMUzD3UQn0rsaG2uc18C3MgF1Oy+mpzKLnkRNdPOGyn9qLgWB2JZwFT1E6SOy6EvEJ0
         apqWbz6/w3DUPckBwrRxoH0xIKBv6gmNc21oABBabHgS1ZrLEWSevsuaqtyCehWhQ3Ji
         veUMryatqKM5QNBihHTzn1n8/KDl347VNYEkVdekFO5JjSlVULuXUp3yP3E3pddf4InO
         Rgaw==
X-Forwarded-Encrypted: i=1; AHgh+RoKXBa7CD2+s56FQ35/r3JYGhd7MUpef7ctjhy1DFEUj6cyma/IBHfsrg5SAGUgii66tybLe3YukxcYPX4V5s/3@lists.infradead.org
X-Gm-Message-State: AOJu0YxT1vW+ih4ePtlxTyGDRwUc+Z1J93qOyDLy9p7tMMWlCWPvPAsD
	T4kVbL+Wzg568+B9RCrU9GH+YYNQQDmTD9IBisdHSF7i6+ObMfnqQkA2jAYd8uxpfKROKME7vmn
	uLZSPoIDrvwdO7XZe7SIxIexZE8g+vZ/VfsXORLsDaZCbqx67vKF0N6bv5s/xn5ijxj3ciFL3lq
	pE
X-Gm-Gg: AfdE7clFe2uVYDmtZlYJdu9lQ9wTXTN8z40ueCBog4S0rUJrBzYmq57tlC3/yXaBs6z
	mawhKeEFev/VunYwG3gLWzVgTY12jUyR6qq4pvyUZz+9/53Yxr3BowToyjmqa/fSnOKiYjiaeOj
	1P7yl529nZ9Y7cyeoxUdZrnZSedqjEawliMLBJuidVxG3wySP7Un7GqziIcXvYJcXO/lR92ULwH
	W3mp89yw9wXDuepgAlZNIResGiYEj6Hu5fHrmHqbc88q4XwGVgcr1LV1wXKU0eNCgEWJLAvOC0u
	1fXI+CVhEkUejxT3TX603ryvgI6xtpBlgVAfNB54+VVIPRJ+TYL33guu4cJsgg1wXlQG59VM0Xp
	O62sZatKd6oHfDDo2AKOpecPGEKAEbcgQsrBamXuRftWRaQ==
X-Received: by 2002:ac8:7c4f:0:b0:519:51b1:e764 with SMTP id d75a77b69052e-51c7485370amr25568711cf.47.1783369646961;
        Mon, 06 Jul 2026 13:27:26 -0700 (PDT)
X-Received: by 2002:ac8:7c4f:0:b0:519:51b1:e764 with SMTP id d75a77b69052e-51c7485370amr25568441cf.47.1783369646512;
        Mon, 06 Jul 2026 13:27:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e371f44sm152788386d6.2.2026.07.06.13.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:27:25 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:27:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: mt6735: Unregister PLLs on probe
 failure
Message-ID: <akwPq7TlOnu2ExKk@redhat.com>
References: <20260624062409.45678-1-mhun512@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260624062409.45678-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u4LpaWKGsCoEkNxc_zOtSNGIJf77dghHRStUCZRQrW4_1783369647
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_132731_413559_F502D79E 
X-CRM114-Status: GOOD (  12.32  )
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

On Wed, Jun 24, 2026 at 03:23:55PM +0900, Myeonghun Pak wrote:
> mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
> clk_mt6735_apmixed_remove() unregisters them on driver removal.
> 
> If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
> probe returns the error directly and the remove callback is not run. This
> leaves the registered PLL clocks behind on the probe failure path.
> 
> Unregister the PLLs in that failure branch before returning the error.
> 
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


