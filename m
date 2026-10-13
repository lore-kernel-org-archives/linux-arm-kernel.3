Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1FBCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB0uk4ljewcdj9xikOsJ5AGGEnsL0TpvKZ1I7QdEXRs=; b=ieO3/HrtJNlD14XW7Dsas9WvIN
	bRaxWj29K9fWkYO/yhR+unKaPFbgiY0xj05rPf7Ea6h0gYvFk3riFSS/MdeyhEs1toJci61Kyb0wQ
	9ewJGJsndAxLoIu8O8oQq9s+QHSGaEKBkXLBEEwn5OycUFNv8s9iircJ3SRgN1kVWuV9CSkY8eA+y
	WchzjQ+5+h4q3oDW9kK9T9bdTSd+QzikGHEkuAm6qk4xKVqmSzDPbOS8SLWHDfre58SpJNezLVMoX
	mYGYEU2CmH3NIWvHJNI9kQ9d5c7JP4vqOIUG1+P2/SGG2oYqkQAuaDTtSAPlywn50XOVDbDlqFp1X
	8AOJpPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZAj-0000000CTji-0QVG;
	Tue, 13 Oct 2026 09:51:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZAe-0000000CTjE-3wHm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:51:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1af482519so2493085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791885103; x=1792489903; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fB0uk4ljewcdj9xikOsJ5AGGEnsL0TpvKZ1I7QdEXRs=;
        b=nhpvjBKt+gPemrmNsPZS375b7NHNpNlTS7JGiF92wFpKVFH4d+b9lBpyklYVQ69E2g
         w1FFMhKyT78hzXWt65QTwZyeJBhoC8KITBetuEpz0JUmtVXJpgBW5xMC/L+ENPdNTJg4
         5poKwEYavJ5ldddDg77oEFFb4pzT3ep7+9xGRG+WRLy6NllQVOn1L7PFKr1DW4P94uEq
         3E8ZuboCtL77VliGcygPHjKhAN+MrHe5SItcJucmih2E9iRN13aPqmOucqOUEhr1qmuH
         3l0XUFcSg7Vk9CLJ7jhKwao0UVwCoeJHBtoBvpGbta4LdG3wSSLPepsV1Q8yp1HbUe47
         Db+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885103; x=1792489903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB0uk4ljewcdj9xikOsJ5AGGEnsL0TpvKZ1I7QdEXRs=;
        b=lDUSZOoEiz5hwmGR1zXAIbhiPOjlijz6540RW/M5TdM00JNAB01FVOU9aP8epiRens
         CQLzjVVlSeVWF6InbOeSUj8AYEz75Q0mRLBXErHwQ5WihBLTSasD+QrQRtxfbGdt/kzA
         6al3MM6y23sxTd9Nu2A6cHjv5spU0biuXTPh5YNsoXookjsUk0YBLxgo8ZFnCANt2lwN
         dXaoVB1VY+11cv2bnsKnt5P8Fgq1YN7FDEF8IMuFs7GDjQQovpDxU+at810SNZ127auZ
         3l/WxCuH1O+u6fyQn/v5kZbiPmFAiGbdLu1wRRNoqOaI2tDjkntDqs+0KmxEgjCS3Z3z
         n05g==
X-Forwarded-Encrypted: i=1; AKwUvBx39kJkP3UsRBBEacr+Jbqrb/BJ7+U6kxVi8vojN9USXz9Ao98cPVaJjwAdlux1IBYVMwQIcR/4t0qeuSoUO6+P@lists.infradead.org
X-Gm-Message-State: AFq9FYLW0dGCmTnTfZ8QHq1BMWhf5dfu3Dh6mfgIAalCcyoRIIpKlva5
	MSA3xzq6kGtHeSJtUnVJ7e86FkrIw9YaUogkiv+kbKxR+iUTZ/wcKV13eGaQ+no37t8=
X-Gm-Gg: AYBFou2Lb5oSshinOJPOzLDh+LHcCZ7UfzRSm4splhA5v1RNAeDb3Asaxb7uwzBUU5Q
	aXVWNwjskJLHyr6p0pjVinigk9+65AQWiOxwI8HD74K+MkDeJdToZ8ON/I8++KGMJ5D5gZVJvAY
	m8dDhorO26/xbKROUY6RRdmw0YfLPX3OJKAblhpZoesyetd0+q5Znq2sf8+lMzKamR9XtMubybB
	c59umDAzxTppEb1PpHiOaUwevPmzRTC/pmdg8wma44NEJzPk/6qvL4OGWWan+DpH9onWfHGo5K6
	zIG04x5FFRr6Z4c+FX2X8hdL6+WmFxlP8Hjgj9lW1NSxd6z028qfJYJmQHrMFlCCJQXzD7CD3l4
	8C4U8WypNCB1pjEPphAALkGIJFmGnN8he6AlrNzGCWvKdWwvrjzxn5kOIHQ7V/EUJUsX9n1fXWy
	e5cvzD/+48gVSlOn6J9Le/E4Qu4OHWCLACVbyFw0+YswKdzzGADG8koAHEqjdQ8tYiE1aDhMoB+
	io5lCriKv/8sITu+sFXSOmUbStiu6Q9kMkydwy66HVmAO5yA7kZNhEtpHgUqwTL8ZRIDUCHhlMM
	Vg6Zrv/G0hLEMp2MX0dSJvzq104VbhiEp9yCcEbtqJrUzB4UW+4FOmdf9Tw=
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a18e4837f2mr222616855e9.5.1791885102854;
        Tue, 13 Oct 2026 02:51:42 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18d12fe04sm217361885e9.4.2026.10.13.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:51:42 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:51:40 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: fix mqprio and cbs combination
Message-ID: <as3_LNUGanrChZ8Q@aspen.lan>
References: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025145_252652_67DD4066 
X-CRM114-Status: GOOD (  13.30  )
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

On Mon, Oct 12, 2026 at 11:14:06PM +0200, Lorenzo Bianconi wrote:
> The channel-mode mqprio offload and the CBS offload can currently not be
> enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
> mqprio offload as soon as any TX queue is configured in AVB mode, and
> tc_setup_cbs() refuses to enable CBS while the strict-priority scheduler
> is active. As a result the combination is rejected whichever order the
> two are configured in.
>
> The strict-priority scheduler selected by the channel-mode mqprio
> offload and the per-queue CBS shaper are independent MTL settings and do
> not conflict, so drop the checks and let the combination be offloaded.
> The following configuration, which was previously refused, now works:
>
>   $ tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
>         map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
>         queues 1@0 1@1 1@2 1@3 mode channel hw 1
>   $ tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
>         idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 offload 0
>   $ tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
>         idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 offload 1
>   $ tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
>         idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 offload 1
>
> Fixes: 47891d501e34 ("net: stmmac: add tc mqprio hw queue priority offload")
> Tested-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Also FWIW:
Reviewed-by: Daniel Thompson <daniel@riscstar.com>


Daniel.

