Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0670C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=; b=poaIaNu2XN9GlE4qdFRwGCEaVK
	7fHfPn3gKl+K4IWqU45sbrv5ifyhHuJojeUp0tnHKz8/IjwmTyTY7t8+tOXSWyqPs2QMN92KW8BE2
	n2Uummr3kQ+YHYo876n5DDazP2+65r3mPCRcqkP6Ng+Td0RraWoMddA9Ld20QSaTaj5wmFnB7dEpC
	IqAt1TjMVRg51q7g3qHp9OZTnM+kV0aZrW3Fm5HpcLnRi3h44bZn/ArF3mIcUY+ISYEFB33Q1FR4W
	mPDhxiSde+/h2ovaD4FW8NkvQ7A8LDNbqlPhnGob9P/3rF8W9arC+PN+IOGpfIQdZ/AWMyIODhJ+i
	j6utrpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tpi-0000000Dn53-37JZ;
	Fri, 18 Sep 2026 08:20:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tpi-0000000Dn4g-0MuA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=; b=e/MK5YUFlMpmY32hhhObDKDB0s
	Uadz2v/SFt/7fNmO2EXl/gGLV2iq0l08qK82vGCiLpp1Ej+2qfM8Qx+MVAYN5PtWiQZxdEDKGRkxc
	wRS0y+msRiypyWNvH4GaMB1i/r5xleROdmih5akbMb06YmBprO/xlORyWudlhZ8jw9AxJwRVSnDpA
	omAKaH+T9CXny87CH0CSXelF7++a8OtmzV7qRauEw40kV3FY+QbkQHk2iZaWM8C+v2NFJ9CQFWjlZ
	iTo08NjNFX29CuoZ9eH4xNuvB/CPDumEONfF2UsblUvnvUXsIylMbG48P0znuB7+ETQld4UMPqGW5
	YpB9BBeA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Tpf-00000009mPT-1THy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:20:33 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6351832so199489f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789719629; x=1790324429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=;
        b=iUUyXUoC49vtmXlXuwmZ/iFr9JqYOTOMNyyirc0OhOiEh6EnzSXaz2ei1h/IR9jHRd
         iQtFuW5uQMM3+UTg0+Hoj4yMdrmZ6GZRom9z2anLjfjDaVtD306UE2emF2w7aKYLwIJ8
         dZZw6qioD3i3EqCByBxuO48gDus6YxG/gjO/rdj8Z8mLQtUYerD3G8dIgwdRML5I7Isd
         7vSGU1+mIiqScgy+dDl8HE9ylR/An061toMe97BZ0eYr4Gb6N8XNHk8YsMZwHa17qnaz
         9fewZ5E84Zb4Oh3PBbSCxHp5NsXFaYdLnEwje32R0APPnRdxXynxVIEf1QcBRgcaOOal
         NSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719629; x=1790324429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=;
        b=yrvjzdjuZ9wtFL3lzgEn+2vGJVQPcMMHOLVAZTczs9yYKr9QnxjiXpCLVOG3iQ3Gog
         j6qJOCttXncX8Dx+ItmfMF1EYvFRaUfZRhmQAH4guc8xSC+qSho6eWR7NcJXB6+w3GcD
         gN6dGlqoeHtZ3o3iT7z4T4eicgOxdheHlgPokZKup6OqLhp7SsnsEZaVC5oRyS68WUr3
         9Yv5uLpcYiBCu9sDK8L+v7agKIGZIE529czz+4UhZpNZAe52OLBvD6bffOi2dTtjGTdD
         xusDUtAgCF1IRcErPUnlJO1OWfcB20A9HfpgylQMtXog9eXo+mJJBZ1Z2VHc7TDMGEiR
         nlTg==
X-Forwarded-Encrypted: i=1; AKwUvBy8szXLWP88HXkujs/b2ghg0189PYJehXGavCtEhuQMhxHOyytLbyVaKthmu3wQhMPU7KIcijQMBxrMTUFKUaxX@lists.infradead.org
X-Gm-Message-State: AFuF++kMoNe9+QgmICGOle22FLkiL4jI59HUwxjDG7beiqQlN1NjVcE2
	hiq19L6b6eeocKXf2Ev+iu8NIryT9/HAkuLpUEIfiH/d1uKyPD+Gfl5IUlHgOHavAdU=
X-Gm-Gg: AYBFou1NMfxTI5PNUHMiPQwJIWxmCGf8F/OmnMvaC9qlVs3Z7ulfCQd7Ui6At64PsH/
	DE6wEMAOmqp8bU0IDtAURGp62GW/QiBIpr1DQH+JSnk5LwEqfAlr3ym6SgGCVQeyIn/TMAw+VHk
	SeBYF/sAWH8u6SHNoKeWDbywcNiRAtpU7aTAqTpmj+pr3aB7+JRAWfGwVVsmpmFYA9z4JzBpaJy
	KC8tDIVSUTAIvzURQ+azFYAPuchoQwePEwRdLkQTde5eR5ulAOcffuGcsEXElxrJPJC6Jw/zuFg
	r6e20ltub8BcYl9q+6JtCXzgH40jgJzGi8MBfei7zUXrhG38XZOYfQlDVUOLZuYBW7w1SrliT/X
	ki9YMMbJCl5azVnoCqs43We+dTXoma5+VSIw4dr5ROV+15D7ctlohXWUkG/wtCwInzfZsBxT2Z2
	vC1PZ7Rs8GP5AAnQdCKHx1fHcnnWnH2z2F5FqJ9GnTRJW3SXgvKw==
X-Received: by 2002:a05:6000:603:b0:487:41c:515b with SMTP id ffacd0b85a97d-4871e25e2a9mr2371051f8f.30.1789719629172;
        Fri, 18 Sep 2026 01:20:29 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff56905sm2152472f8f.20.2026.09.18.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:20:28 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gerg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
Date: Fri, 18 Sep 2026 11:20:23 +0300
Message-ID: <20260918082024.2697569-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <857a7395-4741-4d2c-abb0-b806e8f9bd78@lunn.ch>
References: <20260918015020.2518315-1-f@lex.la> <20260918015020.2518315-2-f@lex.la> <857a7395-4741-4d2c-abb0-b806e8f9bd78@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_092031_505559_4C869015 
X-CRM114-Status: GOOD (  13.20  )
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

> Did you consider using devm_regulator_get_enable()?

No. Looking at it now, it is the better shape, but not for this patch.

Two things stop it from being a swap. The driver sets the voltages before
it enables, 1.0 V on core and 3.3 V on io, and get_enable returns an int,
so no handle is left for regulator_set_voltage(). On the BPI-R2, which is
also the example in the binding, both supplies are MT6323 regulators with
a range, vpa 0.5 to 3.65 V and vemc3v3 3.0 to 3.3 V, so those calls are
not decoration. The other is placement: the get is in probe and the enable
is in mt7530_setup(), which DSA calls much later and which resets the chip
on the next lines, so get_enable would bring the rails up at a different
point.

It is still worth doing, for a reason this patch deliberately leaves
alone. mt7530_remove() disables the supplies before
mt7530_remove_common() calls dsa_unregister_switch(), which still writes
switch registers over MDIO, so on a board where those rails really drop
the teardown is talking to a switch that is already off. A devres disable
runs after .remove returns and would fix that too.

So I would keep this one as the NULL check with a Fixes tag, and send the
conversion to net-next, where the voltage handling and the power-up
ordering can be argued on their own.

